const express = require('express');
const mysql = require('mysql2');
const app = express();
const port = 3000;

const db = mysql.createConnection({
  host: 'mysql',
  user: 'appuser',
  password: 'appuserpass',
  database: 'appdb'
});

app.get('/', (req, res) => {
  db.query('SELECT NOW() as time', (err, results) => {
    if (err) {
      res.status(500).send('DB error: ' + err);
    } else {
      res.send(`Hello from Backend! DB time: ${results[0].time}`);
    }
  });
});

app.listen(port, () => {
  console.log(`Backend running on port ${port}`);
});
