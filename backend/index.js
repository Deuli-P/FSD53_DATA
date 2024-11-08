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

app.get('/user',(req,res)=> {
    try{
        connection.query(
            'SELECT u.username AS "photographe", p.title AS "photo" FROM user AS u JOIN photo AS p ON p.user_id = u.id; ',
            function (err,result){
                if(err) throw err;
                console.log(result);
                res.send(result)
            }
        )
    }
    catch(err){
        console.log('Probleme endpoint photos',err);
    }
})


app.get('/photos',(req,res)=>{
    try{
        const limit = parseInt(req.query.limit) || 2;
        const offset = parseInt(req.query.offset)|| 0;
        connection.query(
            'SELECT * FROM photo LIMIT ? OFFSET ? ;',
            [limit , offset],
            function (err,result){
                if(err) throw err;
                console.log(result);
                res.send(result)
            }
        )
    }

    catch(err){
        console.log('Probleme endpoint photos',err);
    }
})

app.listen(port, ()=>{
    console.log('test');
});

