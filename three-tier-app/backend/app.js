const express = require('express');
const mysql = require('mysql2/promise');

const {
  DB_HOST, DB_USER, DB_PASS, DB_NAME, DB_PORT = 3306
} = process.env;

if (!DB_HOST || !DB_USER || !DB_PASS || !DB_NAME) {
  console.error('DB env vars missing');
}

const pool = mysql.createPool({
  host: DB_HOST, user: DB_USER, password: DB_PASS, database: DB_NAME, port: DB_PORT,
  waitForConnections: true, connectionLimit: 10
});

const app = express();
app.get('/', (req, res) => res.send('Hello from backend'));
app.get('/healthz', (req, res) => res.send('ok'));

app.get('/api/users', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT id, name, email, created_at FROM users ORDER BY id DESC');
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'DB error' });
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, ()=>console.log(`Backend listening on ${PORT}`));
