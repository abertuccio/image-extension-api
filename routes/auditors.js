const express = require('express');
const router = express.Router();
const db = require("../config/mysql/connect");
const vToken = require("../validations/vToken");
const { message, errorMessage } = require("../functions/messages");


router.get('/', async function(req, res, next) {  
  var validaToken = await vToken(req.query.token);  
  if(validaToken.result.data === 'ok' ){     
   



  }else{
    res.send(validaToken);
  }
});



router.post('/createXXXXXXX', async function(req, res, next) {  
  var validaToken = await vToken(req.query.token);  
  if(validaToken.result.data === 'ok' ){     
   
    script_name, id_portal, regex, country, language, folder_name

    
  }else{
    res.send(validaToken);
  }
});


module.exports = router;