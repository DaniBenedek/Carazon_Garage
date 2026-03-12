//  backend express szerver importalas
let express = require("express");
// a cors- al kotom ossze a backend es a frontend-et
let cors = require("cors");
// Az adatbazis kapcsolat masik fajlbol
let db = require("./db");

//express peldany, cors engedelyezes minden kereshez, json body-k automatikus feldolgozasa
let app = express();
app.use(cors());
app.use(express.json());


// api részek lekérés, get
app.get("/api/cars", async (req, res) => {
  try {
    //sql lekerdezes futtatasa
    let [rows] = await db.query(`SELECT
                                        id,
                                        name,
                                        password,
                                        email,
                                        phone_number,
                                        role,
                                        img,
                                        membership_id
                                    FROM
                                        user`);
    // Lekért adatok visszaadása json-ban
    res.json(rows);
    
  } catch (err) {
    //hiba kiírása konzolra
    console.error(err);
    // 500-as http hibával visszatér
    res.status(500).json({ error: "Adatbázis Hiba" });
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
    let [rows] = await db.query(`SELECT id,
                                          vehicle_make,
                                          vehicle_model,
                                          user_id,
                                          license_plate,
                                          country_id,
                                          color,
                                          traffic_permit_date,
                                          technical_exam_date
                                      FROM 
                                          vehicle`);
    res.json(rows); 
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Adatbázis Hiba!" });
  }
});

// projects lista
app.get("/api/projects", async (req, res) => {
  try {
    let [rows] = await db.query(`SELECT id,
                                          title,
                                          category,
                                          year,
                                          img,
                                          description,
                                          materials,
                                          dimensions
                                      FROM
                                          projects`);
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Adatbázis Hiba" });
  }
});

// Munkák lekérése 
app.get("/api/jobs", async (req, res) => {
  try {
    let [rows] = await db.query("SELECT * FROM jobs ORDER BY id DESC");
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: "Hiba a munkák lekérésekor" });
  }
});

// Szerviz szolgáltatások lekérése
app.get("/api/services", async (req, res) => {
  try {
    let [rows] = await db.query(`
      SELECT id, name, time
      FROM service
      ORDER BY id ASC
    `);

    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Hiba a szolgáltatások lekérésekor" });
  }
});

// Új munka feltöltése (HR oldalról)
app.post("/api/jobs", async (req, res) => {
  let { title, description, salary, location } = req.body;
  try {
    await db.query(
      "INSERT INTO jobs (title, description, salary, location) VALUES (?, ?, ?, ?)",
      [title, description, salary, location]
    );
    res.json({ success: true, message: "Munka hozzáadva!" });
  } catch (err) {
    res.status(500).json({ error: "Hiba a mentés során" });
  }
});


// Jelentkezők lekérése
app.get("/api/applicants/:jobId", async (req, res) => {
  try {
    let [rows] = await db.query(
      "SELECT * FROM applicants WHERE job_id = ? ORDER BY id DESC",   
      [req.params.jobId]
    );
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: "Hiba a jelentkezők lekérésekor" });
  }
});

app.post('/api/apply', (req, res) => {
  let { job_id, name, email, message } = req.body;
  
  let sql = "INSERT INTO applicants (job_id, name, email, message) VALUES (?, ?, ?, ?)";
  
  db.query(sql, [job_id, name, email, message], (err, result) => {
    if (err) return res.status(500).send(err);
    res.status(200).send({ message: "Sikeres jelentkezés!" });
  });
});

// login api
app.post("/api/login", async (req, res) => {
   // Email és jelszó kiolvasása a request body-ból
  let { email, password } = req.body;

  // Ha nincs email vagy jelszó → hibás kérés
  if (!email || !password) {
    return res.status(400).json({ message: "Hiányzó adatok" });
  }

  try {
    // Felhasználó keresése az adatbázisban
    let [rows] = await db.query(
      "SELECT id, email, name FROM user WHERE email = ? AND password = ?",
      [email, password]
    );

     // Ha nincs találat → hibás bejelentkezés
    if (rows.length === 0) {
      return res.status(401).json({ message: "Hibás email vagy jelszó" });
    }

    // Sikeres login válasz
    res.json({
      success: true,
      user: rows[0]
    });

    // Szerver oldali hiba
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Szerver hiba" });
  }
});

// Register - Extrás validációs verzió
app.post("/api/register", async (req, res) => {
  try {
    const { name, password, email, phone_number } = req.body;

    // Ellenőrizzük, hogy minden adat megjött-e
    if (!name || !password || !email) {
      return res.status(400).json({ message: "Hiányzó adatok! A név, email és jelszó megadása kötelező." });
    }

    // Email formátum ellenőrzése
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      return res.status(400).json({ message: "Érvénytelen email formátum!" });
    }

    // Jelszó hossz ellenőrzése
    const passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
    if (!passwordRegex.test(password)) {
      return res.status(400).json({ message: "A jelszónak legalább 6 karakter hosszúnak kell lennie!" });
    }

    // Telefonszám formátum ellenőrzése (opcionális)
    const phoneRegex = /^(\+?[0-9\s\-]{7,15})$/;
    if (!phoneRegex.test(phone_number)) {
      return res.status(400).json({ message: "A telefonszám túl hosszú!" });
    }

    const sql = `INSERT INTO user (name, password, email, phone_number) VALUES (?, ?, ?, ?)`;
    
    const [result] = await db.query(sql, [name, password, email, phone_number || null]);
    
    res.status(201).json({ 
      success: true,
      message: "Sikeres regisztráció!",
      userId: result.insertId 
    });

  } catch (error) {
    console.error("Adatbázis hiba:", error);
    
    // MySQL duplicate entry hiba (email már létezik)
    if (error.code === 'ER_DUP_ENTRY') {
      return res.status(400).json({ 
        success: false,
        message: "Ez az email cím már regisztrálva van!" 
      });
    }
    
    res.status(500).json({ 
      success: false,
      message: "Hiba történt a regisztráció során. Kérlek próbáld később!" 
    });
  }
});


let PORT = 3000;
app.listen(PORT, () => console.log("A backend a következő linken elérhető: localhost:" + PORT));
