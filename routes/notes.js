const express = require('express');
const router = express.Router();
const vToken = require("../validations/vToken");
const db = require("../config/mysql/connect");
const { message, errorMessage } = require("../functions/messages");


router.get('/', async function(req, res, next) {  
    try {
        var rToken = await vToken(req.query.token);  
        if(rToken.status === 'ok' && rToken.id_user){  
            
            const qryCustomers = "SELECT * FROM web_buddy.notes";
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
    var validaToken = await vToken(req.query.token);  
    if(validaToken.result.data === 'ok' ){     
           
        var registro={
            title: req.body.title, 
            description: req.body.script_name, 
            note_date: new Date(),
            id_auditor: req.body.id_auditor
        };

        db.query('insert into web_buddy.notes set ?',
            registro, 
            function (error,resultado){
                if (error){
                res.send(errorMessage(800, error.sqlMessage));
                }else{
                    res.send(message(302));
                }
        });
      
    }else{
      res.send(validaToken);
    }
  });


module.exports = router;