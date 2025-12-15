const express = require("express");
const cors = require("cors");
const db = require("./db");

const app = express();
app.use(cors());
app.use(express.json());



// api részek lekérés, get
app.get("/api/cars", async (req, res) => {
  try {
    const [rows] = await db.query("SELECT * FROM user");
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Database error" });
  }
});
// egy autó lekérése id alapján
app.get("/api/car/:id", async (req, res) => {
  req.params.id
})

"GET /api/car/20"

// vehicle lista
app.get("/api/vehicle", async (req, res) => {
  try {
    const [rows] = await db.query("SELECT * FROM vehicle");
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Database error" });
  }
});

// login api
app.post("/api/login", async (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({ message: "Hiányzó adatok" });
  }

  try {
    const [rows] = await db.query(
      "SELECT id, email, name FROM user WHERE email = ? AND password = ?",
      [email, password]
    );

    if (rows.length === 0) {
      return res.status(401).json({ message: "Hibás email vagy jelszó" });
    }

    res.json({
      success: true,
      user: rows[0]
    });

  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Szerver hiba" });
  }
});

// ide jön majd a build- kiszolgálás

const PORT = 3000;
app.listen(PORT, () => console.log("A backend a következő linken elérhető: localhost:" + PORT));
