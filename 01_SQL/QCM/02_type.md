# QCM : Les Types de Données dans MySQL

**1. Quel type de données MySQL permet de stocker des nombres avec une précision fixe (nombre total de chiffres et chiffres après la virgule) ?**  
(Choisissez une ou plusieurs réponses)  
- [ ] INT  
- [ ] BIGINT  
- [ ] SMALLINT(n, v)  
- [x] DECIMAL(n, v)

---

**2. Quel type de données MySQL est le mieux adapté pour stocker de grandes distances (en kilomètres) ?**  
(Choisissez une ou plusieurs réponses)  
- [x] BIGINT  
- [ ] INT  
- [ ] TINYINT  
- [ ] DECIMAL(n, v)  

---

**3. Quel type de données MySQL est utilisé pour stocker des chaînes de caractères avec une longueur fixe ?**  
(Choisissez une ou plusieurs réponses)  
- [x] CHAR(x)  
- [ ] VARCHAR(x)  
- [ ] TEXT  
- [ ] ENUM  

---

**4. Quelle est la différence principale entre les types `CHAR(x)` et `VARCHAR(x)` dans MySQL ?**  
(Choisissez une ou plusieurs réponses)  
- [x] `CHAR(x)` réserve un nombre fixe d'octets, alors que `VARCHAR(x)` réserve dynamiquement la quantité nécessaire  
- [ ] `CHAR(x)` permet de stocker des chaînes plus longues que `VARCHAR(x)`  
- [ ] `VARCHAR(x)` est toujours plus rapide que `CHAR(x)` pour les petites chaînes  
- [ ] `VARCHAR(x)` utilise plus de mémoire que `CHAR(x)`  

---

**5. Quel type de données MySQL serait le mieux adapté pour stocker des informations de statut comme 'confirmed', 'pending', 'canceled' ?**  
(Choisissez une ou plusieurs réponses)  
- [x] ENUM  
- [ ] TEXT  
- [ ] VARCHAR(x)  
- [ ] INT  

---

**6. Si vous souhaitez stocker une date sans l'heure dans MySQL, quel type de données devriez-vous utiliser ?**  
(Choisissez une ou plusieurs réponses)  
- [x] DATE  
- [ ] DATETIME  
- [ ] TIMESTAMP  
- [ ] TEXT  

---

**7. Quelle est la plage de valeurs pour un type `TINYINT UNSIGNED` dans MySQL ?**  
(Choisissez une ou plusieurs réponses)  
- [ ] -128 à 127  
- [x] 0 à 255  
- [ ] -32768 à 32767  
- [ ] 0 à 255 pour un type `TINYINT` signé  

---

**8. Quel type de données MySQL est recommandé pour une valeur de `fuel_capacity` qui doit stocker un nombre de litres avec des décimales (par exemple, 35000.50 litres) ?**  
(Choisissez une ou plusieurs réponses)  
- [ ] INT  
- [x] DECIMAL(10, 2)  
- [ ] BIGINT  
- [x] DECIMAL(10, 2)  

---

**9. Quel type de données est idéal pour stocker une chaîne de caractères longue (plus de 255 caractères) dans MySQL ?**  
(Choisissez une ou plusieurs réponses)  
- [ ] CHAR(x)  
- [ ] VARCHAR(x)  
- [x] TEXT  
- [ ] BLOB  
