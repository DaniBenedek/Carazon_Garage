const express = require("express");
const cors = require("cors");
const db = require("./db");

const app = express();
app.use(cors());
app.use(express.json());



// api részek lekérés, post
app.get("/api/cars", async (req, res) => {
  try {
    const [rows] = await db.query("SELECT * FROM user");
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Database error" });
  }
});

app.get("/api/car/:id", async (req, res) => {
  req.params.id
})

"GET /api/car/20"

// ide jön majd a build- kiszolgálás

const PORT = 3000;
app.listen(PORT, () => console.log("Express API running on port " + PORT));
