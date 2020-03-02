const express = require('express');
const router = express.Router();
const vToken = require("../validations/vToken");
const db = require("../config/mysql/connect");
const { message, errorMessage } = require("../functions/messages");


router.get('/', async function(req, res, next) {  
    try {
        var rToken = await vToken(req.query.token);  
        if(rToken.status === 'ok' && rToken.id_user){  
            
            const qryCustomers = "SELECT * FROM web_buddy.customers";
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
    
            const qryCustomers = "SELECT company_name, country FROM web_buddy.customers WHERE company_name=? AND country=? AND active=?";
            db.query(qryCustomers, [req.body.company_name,req.body.country, 1], function(error, rows, fields){
                if (error){
                    res.send(errorMessage(800, error.sqlMessage));
                }else{
                    if (rows.length) {            
                        if(rows[0].company_name === req.body.company_name && rows[0].country === req.body.country){
                            res.send(errorMessage(221));            
                        }
                    }else{                        
                        const customer = {
                            company_name: req.body.company_name,
                            Legal_contact_name: req.body.Legal_contact_name,
                            country: req.body.country,
                            email: req.body.email,
                            start_date: new Date()
                        };
                                    
                        db.query('INSERT INTO web_buddy.customers SET ?', customer, function (error,resultado){
                            if (error){
                                res.send(errorMessage(800, error.sqlMessage));
                            }else{
                                const qryUserSignUp = "SELECT id_customer FROM web_buddy.customers WHERE company_name=?";
                                db.query(qryUserSignUp, req.body.company_name, function(error, rows, fields){
                                    if (error){
                                        res.send(errorMessage(800, error.sqlMessage));
                                    }else{                    
                                        if (rows.length) {                                            
                                             res.send(message(202));  //"Se registro el cliente.", 
                                        } else {
                                            res.send(errorMessage(220)); //"se produjo un error al registrar al cliente.",
                                        } 
                                    }
                                });  
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


router.post('/portals', async function(req, res, next) {  
  
    try {
        var rToken = await vToken(req.body.token);  
        if(rToken.status === 'ok' && rToken.id_user){   
    
            const qryCustomers = "SELECT * FROM web_buddy.customers WHERE id_customer=?";
            db.query(qryCustomers, [req.body.id_customer], function(error, rows, fields){
                if (error){
                    res.send(errorMessage(800, error.sqlMessage));
                }else{
                    if (rows.length) {  
                        req.body.portals.forEach(p => {
                            const qryPortals = "SELECT * FROM web_buddy.portals WHERE name=? AND country=?";
                            db.query(qryPortals, [p.name, p.country], async function(error, rows, fields){
                                if (error){
                                    res.send(errorMessage(800, error.sqlMessage));
                                }else{
                                    if (rows.length) { 
                                        const customerPortal = {
                                            id_portal: p.id_portal,
                                            id_customer: id_customer,
                                        };
                                        db.query('INSERT INTO web_buddy.customerPortals SET ?', customerPortal, function (error,resultado){
                                            if (error){
                                                res.send(errorMessage(800, error.sqlMessage));
                                            }
                                            //207 Los portales han sido asociados a la cuenta del cliente.
                                        }); 
                                    }else{ 
                                        res.send(errorMessage(223));
                                    } 
                                }
                            }); 
                        });
                    }else{ 
                        res.send(errorMessage(222)); //El cliente no está habilitado o no fue dado de alta.
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