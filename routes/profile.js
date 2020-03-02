const express = require('express');
const router = express.Router();
const db = require("../config/mysql/connect");
const vToken = require("../validations/vToken");
const { message, errorMessage } = require("../functions/messages");


router.get('/', async function (req, res, next) {
  try {
    var rToken = await vToken(req.query.token);
    if (rToken.status === 'ok' && rToken.id_user) {

      const qryCus = `SELECT cus.id_customer, cus.company_name
                            FROM web_buddy.customers as cus    
                            INNER JOIN web_buddy.customerUsers as us ON cus.id_customer = us.id_customer   
                            WHERE us.id_user = ?`;

      db.query(qryCus, rToken.id_user,
        async function (error, rows, fields) {
          if (error) {
            res.send(errorMessage(800, error.sqlMessage));
          } else {
            if (rows.length) {
              const id_customer = rows[0].id_customer;
              const company_name = rows[0].company_name;

              const qryPtal = `SELECT 
                                ptal.id_portal, 
                                portal_name, 
                                portal_folder_name,
                                script_name,
                                general_styles,
                                regex
                              FROM web_buddy.portals as ptal    
                              INNER JOIN web_buddy.customerPortals as cuspor ON ptal.id_portal = cuspor.id_portal
                              WHERE cuspor.id_customer = 24;`;

              db.query(qryPtal, id_customer,
                function (error, rows, fields) {
                  if (error) {
                    res.send(errorMessage(800, error.sqlMessage));
                  } else {
                    if (rows.length) {
                      
                      var sites = rows.map(r => {

                        // const qryRx = `SELECT 
                        //                 category, 
                        //                 folder_name, 
                        //                 script_name, 
                        //                 regex,
                        //                 category_styles,
                        //                 styles_name
                        //               FROM web_buddy.regexDomains    
                        //               WHERE id_portal = ?`;

                        // db.query(qryRx, r.id_portal,
                        //   function (error, rows, fields) {
                        //     if (error) {
                        //       res.send(errorMessage(800, error.sqlMessage));
                        //     } else {

                        //       if (rows.length) {  

                        //         r.availibleActions = rows.reduce((p,c)=>{
                        //                 let existe = false;

                        //                 p.forEach((e,i)=>{
                        //                     if(e.category === c.category){
                        //                         existe = true;
                                                
                        //                       // p[i].availableFolders = p[i].availableFolders.concat(c.availableFolders);
                        //                       p.concat ({                                                
                        //                         category:c.category, 
                        //                         availableFolders: [{                                                 
                        //                           folder_name: c.portal_folder_name,
                        //                           category_styles: c.script_name,
                        //                           availableScripts:[{

                        //                           }]
                        //                         }]
                        //                       });
                        //                     }
                        //                 });
                        //                 if(!existe){
                        //                     p.push({
                        //                       category:c.category, 
                        //                       availableFolders: [{                                                 
                        //                         folder_name: c.portal_folder_name,
                        //                         category_styles: c.script_name,
                        //                         availableScripts:[{
                                                    
                        //                         }]
                        //                       }]
                        //                     });
                        //                 }   
                                        
                        //             return p;    
                        //         }
                        //         ,[]);
                        //         return r

                        //       } else {
                        //         res.send(message(301));
                        //       }
                        //     }

                        //         // console.log(r)
                        //     // return r.availibleActions
                        //   });
                          resultados = {
                            id_portal: r.id_portal,
                            portal_name: r.portal_name,
                            category: "PORTAL",
                            portal_folder_name: r.portal_folder_name,
                            script_name: r.script_name,
                            general_styles: r.general_styles,
                            regex: r.regex,
                            availibleActions: r.availibleActions
                          };
                          return resultados
                        });


                        res.send({
                          result: {
                            customer: company_name,
                            username: rToken.username,
                            group: null,
                            sites: sites
                          },
                          code: '',
                          message: '',
                          status: 'ok'
                        });

                    } else {
                      res.send(message(301));
                    }
                  }
                });
            } else {
              res.send(message(301));
            }
          }
        });

    } else {
      res.send(rToken);
    }
  } catch (error) {
    res.status(500).json({ error: error.toString() });
  }
});


module.exports = router;