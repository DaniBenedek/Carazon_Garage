# Carazon_Garage
Miklós Martin és Dani Benedek vizsgaremeke.

# Linkek : 
- figma : https://www.figma.com/files/team/1295105816093599322/recents-and-sharing?fuid=1295105811775755405
- github : https://github.com/DaniBenedek/Carazon_Garage
- trello : https://trello.com/b/GBRdKbUQ/carazongarage

# Indítás:

A weblap elindításához a következő lépéseket kell elvégezni:
## Legelőször is indítsák el a xammp-ot és azon belül az apache szervert valamint a mysql-t
## utána a db könyvtárból tegyék fel az adatbázist a következő lépésekkel:
* 1. Xammpon belül kattintsunk a my sql melletti admin gombra
* 2. lépés adatbázis létrehozása 'carazongarage' - néven utf8mb4_general_ci kódolással
* 3. lépés a db-könyvtárból importálják az adatbázist
* 4. lépés weboldal indításának lépései: 



## 1
```bash
cd Carazon_Angular/
```
## 2
```bash
# Csak első indításnál lesz szükséges
npm install
```
## 3
<!-- Ezzel indítható iskolai környezetben -->
```bash
npx ng serve
node server/server.js
```

* 5. adatbázis beimportálása:

- indítsd el a Xammp kontroll panelt
- nyisd meg a localhost/phpmyadmin felületet
- hozz létre egy "carazongarage" nevezetű adabázist utf8mb4_general_ci-ben
- importáld be db könytárban lévő adabázist


# Cél :
- Modern szervíz létrehozása 



# ADATBÁZIS TÁBLÁK:
 appointments(id,user_id,vehicle_id,service_id,date,note,created_at,price,tables)
 cart(id,user_id,date)
 cart_items(id,cart_id,product_id,quantity)
 country(id,name)
 products(id,name,price,storage_quantity,type)
 service(id,name,time)
 user(id,name,password,email,phone_number,role)
 vehicle(id,vehicle_make,vehicle_model,user_id,license_plate,coutry_id,color,traffic_permit_date,technical_exam_date)

# Összetevők
- Keretrendszer Angular 20.3.10
- stílus : tailwindcss
- backedn : php
- adatbázis : Mysql

# Kedd 11.11 Határidővel a következők kellenek:
- Projekt név - Carazon_Garage✅
- Projekt Leírás ✅
- Képernyőtervek ✅
- Adatbázis 2 táblát létrehozni✅
- Github létrehozása és Tanár meghívása(Ezt a suliba) ✅

# Dec 19.-re kész kell lennie

- Wpf Telepítővel eggyüt és látványterven módosítani
- Navbar-on belül a dropdown menü kijavítása(hamburger)
- A carrier,history,home,projects,register,service oldal megdizájnolása és megcsinálása
- Javascript használása