const mysql = require('mysql2');

const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',      // XAMPP default user
  password: '',      // XAMPP default: üres
  database: 'carazongarage',  // <-- a TE adatbázisod neve
  connectionLimit: 10
});

module.exports = pool.promise();
