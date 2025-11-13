# Carazon_Garage
Miklós Martin és Dani Benedek vizsgaremeke.

# útmutató az indításhoz: 
- html : a carazon-garage/readme.md
- c# wpf : carazonGarage/readme.md

# cél :
- Modern szervíz létrehozása 
# ADATBÁZIS TÁBLÁK:
 appointments(id,user_id,vehicle_id,service_id,date,note,created_at,price)
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
- figma : https://www.figma.com/files/team/1295105816093599322/recents-and-sharing?fuid=1295105811775755405

# Kedd 11.11 Határidővel a következők kellenek:

- Projekt név - Carazon_Garage✅
- Projekt Leírás ✅
- Képernyőtervek ✅
- Adatbázis 2 táblát létrehozni✅
- Github létrehozása és Tanár meghívása(Ezt a suliba) ✅

# Javítani

- Autók külön táblába majd azok autónkénk lesz külön vezetve hogy mire van szüksége az autónak
- állandó szervíz tábla hogy könyen lehessen lekérni
- CRM diagramm database rajz/ábrát csináljunk
