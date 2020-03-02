var mysql = require('mysql');

var conexion = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'asteroide',
  database: 'web_buddy',
  port: 3306
});

conexion.connect(function (error) {
  if (error) {
    console.log(error);
    console.log('connection failed');
  }
  else {
    console.log('successful connection');
  }
});

module.exports = conexion;