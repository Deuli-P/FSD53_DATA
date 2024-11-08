const express = require('express');
const mysql = require('mysql');

const app = express();
const port = 3000;

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'root',
  database: 'db_photographe',
  port : 8889
});

connection.connect((err) => {
  if (err) {
    console.error('Erreur de connexion à MySQL :', err);
    return;
  }
  console.log('Connecté à MySQL');
  connection.query(
    "SELECT * FROM user AS u JOIN photo AS p ON p.user_id = u.id",
    function (err, result) {
        if (err) throw err;       
        console.log(result);     
    }); 
});

