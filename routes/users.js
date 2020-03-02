const express = require('express');
const router = express.Router();
const vToken = require("../validations/vToken");
const db = require("../config/mysql/connect");
const Crypto = require('crypto-js')
const { message, errorMessage } = require("../functions/messages");


router.get('/', async function(req, res, next) {  
    try {
        var rToken = await vToken(req.query.token);  
        if(rToken.status === 'ok' && rToken.id_user){  
            
            const qryCustomers = "SELECT id_user, username, first_name, last_name, email, last_login FROM web_buddy.users";
            db.query(qryCustomers, [], function(error, rows, fields){
            
                if (error){
                    res.send(errorMessage(800, error.sqlMessage));
                }else{
                    if (rows.length) {  
                        res.send({
                            result: {
                              data: rows,
                              code: '',
                              message: '', 
                              status: 'ok'}
                          });
                    }else{
                        res.send(errorMessage(301));  
                    }    
                }
            });      
            
        }else{
            res.send(rToken);
        }
    } catch (error) {
        res.status(500).json({ error: error.toString() });
    } 
});


router.post('/', async function(req, res, next) { 
  
  try {
    var rToken = await vToken(req.body.token);  
    if(rToken.status === 'ok' && rToken.id_user){  
    
      const qryUser = "SELECT username, email FROM web_buddy.users WHERE username=? OR email=? AND active=?";
      db.query(qryUser, [req.body.username, req.body.email, 1],function(error, rows, fields){
        if (error){
          resolve(errorMessage(800, error.sqlMessage));
        }else{
          if (rows.length) {
            if(rows[0].username === req.body.username){
              res.send(errorMessage(211));
            }else if(rows[0].email === req.body.email){
              res.send(errorMessage(212));
            }

          }else{
            const random = Math.random().toString(7).substr(8);
            const passHash = Crypto.SHA256(random+req.body.password).toString();
            const user={
              username: req.body.username,
              password: passHash,
              random: random,
              first_name: req.body.first_name,
              last_name: req.body.last_name,
              email: req.body.email,
              start_date: new Date()
            };

            db.query('INSERT INTO web_buddy.users SET ?', user, function (error,resultado){
              if (error){
                res.send(errorMessage(800, error.sqlMessage));
              }else{                
                //Funcion envia correo para activar la cuenta
                res.send(message(201));                                
              }  
            });
          }
        } 
      });
    }else{
      res.send(rToken);
    } 
  } catch (error) {
    res.status(500).json({ error: error.toString() });
  } 
});


router.post('/customer', async function(req, res, next) {   
  try {
    var rToken = await vToken(req.body.token);  
    if(rToken.status === 'ok' && rToken.id_user){  

        const qryUserSignUp = "SELECT * FROM web_buddy.customers as cust,  web_buddy.users as us WHERE id_customer = ? and id_user = ?";
        db.query(qryUserSignUp, [req.body.customer.id_customer,req.body.user.id_user],function(error, rows, fields){
          if (error){
            res.send(errorMessage(800, error.sqlMessage));
          }else{      
            if (rows.length) {
                const customerUser={
                  id_customer: req.body.customer.id_customer,
                  id_user: req.body.user.id_user
                };
                db.query('INSERT INTO web_buddy.customerUsers SET ?', customerUser, function (error,resultado){
                  if (error){
                    res.send(errorMessage(800, error.sqlMessage));
                  }else{                  
                    res.send(message(206));
                  }
                });
            }else{
              res.send(errorMessage(224));
            }  
          }
        });
                  
    }else{
      res.send(rToken);
    } 
  } catch (error) {
    res.status(500).json({ error: error.toString() });
  } 
});

module.exports = router;