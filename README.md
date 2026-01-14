**Carazon Garage – Vizsgaremek Dokumentáció**

# Carazon_Garage

**Dani Benedek** és **Miklós Martin** vizsgaremeke.

# Linkek :

- *figma* : https://www.figma.com/files/team/1295105816093599322/recents-and-sharing?fuid=1295105811775755405

- *github* : https://github.com/DaniBenedek/Carazon_Garage

- *trello* : https://trello.com/b/GBRdKbUQ/carazongarage

# Projekt célja:

Felhasználó barát, időt álló web applikáció ahol az autószervízünkhöz,
A **Carazon_Garage** -hoz lehet Időpontot foglalni

# Felhasznált technológiák:

* **Frontent** : Angular 20.3.10

* **Backend** : Express JS

* **Stílus** : Tailwind css

* **Adatbázis** : MySQL

# Indítás **első** alkalommal

### 1. projekt leszedése

* Nyissuk meg a "**visual studio code**" nevű app -ot

* kattinstunk bal oldalt a "**Source control**" icon-ra

* kattintsunk a "**git clone**" gomb-ra majd illesszük be az alábbi linket
> https://github.com/DaniBenedek/Carazon_Garage.git

* ezek után válasszuk az **"open**" lehetőséget amikor az app azt kérdezi:
> Would you like to open this project?
**Open!!**

### 2. Adatbázis felrakása

* a windows -on belül indítsuk el a "**xampp**" alkalmazást
	* ezen az alkalmazáson belül kattintsunk a "**Mysql**" és az "**Apache**" utáni **"START**" gombra
	* Ezek után kattintsunk a "**Mysql**" utáni "**Admin**" gombra

* A mysql adatbázist látjuk ahová a következő lépéssekkel tesszük fel az adatbázist:

1. bal felül kattintsunk a "**new**" gombra

2. A(z) "**Database name**" -hez adjuk meg a következőt : "**carazongarage**"

3. a mellette lévő kódolási mezőt állítsuk be a következőre: "**utf8mb4_general_ci**" annak érdekében hogy minden ékezetes / speciális karakter jól jelenjen meg!

4. Kattintsunk a "**Create**" gombra.

* Ez után megfog jelenni bal oldalt egy "**carazongarage**" -nevű tábla kattintsunk rá:

* **Középen felül** látunk egy **"import**" nevű gombot kattinsunk rá.
	* kattintsunk a "**Choose File**" -ra

* A következő lépésben az "1.lépés" fejezetű már korábban lehúzott mappaszerkezetben keressük meg a "**db**" mappát.
	* válasszuk ki a "**carazongarage.sql**" fájlt majd töltsük fel.
	* feltötés után fontos hogy kattinsunk rá az "**import**" gombra.

### Ezzel az adatbázisunk készen áll a használatra már csak a **backend** kell!

## 3. Projekt betöltése

* Lépjünk vissza a korábban megnyitott "**Visual Studio Code**" appba.

* Az app bal felső részében válasszuk a "**Terminal**" Opciót

* Ez egy powershell-t fog nekünk megnyitni amire a programunk optimalizálva van.

* írjuk be a következőt:

*  ``cd .\Carazon_Angular\ ``

* majd a következőt:

*  ``npm install``

* Ezzel feltelepítettük a web applikáció elemeit.

## 4. App indítása:

* Az előző terminálba írjuk be a következőt:

*  ``node .\server\server.js``

* Ezzel elindítottuk a backend-et.

* Következőnek indítsuk el a frontend-et

* ehhez kattintsunk a "**terminal**" -unk jobb felső sarkában lévő

* "**+**" jelre ami mellett az szerepel hogy "**node - Carazon_Angular**"

* Majd válasszuk a(z) "**New Terminal**" opciót

* írjuk be:

*  `` cd .\Carazon_Angular\``

* utána pedig:

*  ``npx ng serve``

# Az appunk sikeresen fut a : [localhost:4200](http://localhost:4200/) porton

## További indítások esetén:

* Indítsuk el a "**xampp**" alkalmazást:

* Kattintsunk a "``Mysql``" melletti "``Start``" gombra

* Szintén két terminál fog kelleni

1. terminál:

*  `` cd .\Carazon_Angular\``

* utána:

*  ``node .\server\server.js``

2. terminál:

*  `` cd .\Carazon_Angular\``

* utána:

*  ``npx ng serve``

## 5. Az app teszt fázisban van ezért a Bejelentkezéshez a következő fiók használandó:

**email**  : ``admin@admin.com``

**jelszo** : ``admin``