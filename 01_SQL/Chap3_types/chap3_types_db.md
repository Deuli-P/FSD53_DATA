# Les Types de Données dans MySQL

MySQL est un système de gestion de bases de données relationnelles typé, ce qui signifie qu'il est nécessaire de définir un type pour chaque colonne des tables. Voici les principaux types de données que vous pouvez utiliser :

## Types Numériques

- **INT** (4 octets)  
  Plage : -2 147 483 648 à 2 147 483 647.  
  **Remarque :** Si la valeur insérée dépasse cette plage, MySQL enregistrera le maximum ou le minimum selon le cas.

- **BIGINT** (8 octets)  
  Plage : -9 223 372 036 854 775 808 à 9 223 372 036 854 775 807.

- **TINYINT** (1 octet)  
  Plage : -128 à 127.

- **TINYINT UNSIGNED** (1 octet)  
  Plage : 0 à 255.  
  *L'option UNSIGNED peut être utilisée avec d'autres types numériques pour interdire les valeurs négatives.*

- **DECIMAL(n, v)**  
  Permet de stocker des nombres avec une précision fixe. `n` représente le nombre total de chiffres, et `v` indique le nombre de chiffres après la virgule.

## Types de Chaînes

- **CHAR(x)**  
  Stocke un nombre fixe de caractères (x). Indépendamment de la valeur, MySQL réserve x octets.

- **VARCHAR(x)**  
  Stocke jusqu'à x caractères. Contrairement à CHAR, cette option utilise dynamiquement le nombre d'octets nécessaires, variant de 0 à x.

- **TEXT**  
  Pour stocker des chaînes de caractères de plus de 255 caractères, jusqu'à 65 535 caractères (2^16 octets).

- **BLOB**  
 **EN GENERALE ON EVITE CE TYPE QUI PREND DE LA PLACE MEMOIRE EN MYSQL OU SQL. ON NE L'UTILISERA PAS POUR GERER DES IMAGES**
  Type binaire conçu pour stocker des objets binaires de grande taille. Les chaînes de caractères sont sensibles à la casse.

- **ENUM**  
  Définit un ensemble de valeurs autorisées (chaînes de caractères). Exemple :
  ```sql
  title ENUM('foo', 'bar', 'baz')
  ```

## Types de Date et Heure

- **DATE**  
  Format : `AAAA-MM-JJ` (ex : 2024-11-04).  
  Il peut également être représenté sous d'autres formes, telles que `AAMMJJ`, `AAAA/MM/JJ`, ou `AAAA%MM%JJ`.

- **DATETIME**  
  Utilisé pour stocker les dates et heures. Format : `AAAA-MM-JJ HH:MM:SS`.  
  C'est le type le plus courant pour enregistrer des dates dans vos tables.

> **Note :** Le type **TIMESTAMP** est mentionné pour sa définition technique (représentant le nombre de secondes écoulées depuis le 1er janvier 1970 à 00:00:00 UTC), mais il ne sera pas abordé en profondeur dans ce cours en raison de ses limitations.

Voici les exemples MySQL mis à jour pour inclure une clé primaire (PK) dans chaque table, respectant ainsi les bonnes pratiques de conception de bases de données :

---

# Exemples MySQL des Types de Données

## Types Numériques

### 1. **INT**
```sql
CREATE TABLE pilots (
    pilot_id INT PRIMARY KEY,  -- Clé primaire
    experience_years INT
);

INSERT INTO pilots (pilot_id, experience_years) VALUES (1, 10);
```

### 2. **BIGINT**
```sql
CREATE TABLE flights (
    flight_id BIGINT PRIMARY KEY,  -- Clé primaire
    distance BIGINT  -- Distance in kilometers
);

INSERT INTO flights (flight_id, distance) VALUES (1, 150000);
```

### 3. **TINYINT**
```sql
CREATE TABLE flight_status (
    flight_id TINYINT PRIMARY KEY,  -- Clé primaire
    status TINYINT  -- 0: Cancelled, 1: On Time
);

INSERT INTO flight_status (flight_id, status) VALUES (1, 1);  -- Flight is on time
```

### 4. **TINYINT UNSIGNED**
```sql
CREATE TABLE cockpit (
    seat_number TINYINT UNSIGNED PRIMARY KEY,  -- Clé primaire
    occupancy TINYINT UNSIGNED  -- Number of occupants
);

INSERT INTO cockpit (seat_number, occupancy) VALUES (1, 2);  -- Two pilots in the cockpit
```

### 5. **DECIMAL(n, v)**
```sql
CREATE TABLE aircraft (
    aircraft_id INT PRIMARY KEY,  -- Clé primaire
    fuel_capacity DECIMAL(10, 2)  -- Capacity in liters
);

INSERT INTO aircraft (aircraft_id, fuel_capacity) VALUES (1, 35000.50);
```

## Types de Chaînes

### 6. **CHAR(x)**
```sql
CREATE TABLE airlines (
    airline_id INT PRIMARY KEY,  -- Clé primaire
    code CHAR(3)  -- 3-letter airline code
);

INSERT INTO airlines (airline_id, code) VALUES (1, 'AAE');  -- Airline code for 'AeroAvia'
```

### 7. **VARCHAR(x)**
```sql
CREATE TABLE pilots (
    pilot_id INT PRIMARY KEY,  -- Clé primaire
    name VARCHAR(50)  -- Up to 50 characters for the pilot's name
);

INSERT INTO pilots (pilot_id, name) VALUES (1, 'Alice Johnson');
```

### 8. **TEXT**
```sql
CREATE TABLE flight_logs (
    log_id INT PRIMARY KEY,  -- Clé primaire
    details TEXT  -- Detailed log of the flight
);

INSERT INTO flight_logs (log_id, details) VALUES (1, 'Flight was smooth with minor turbulence.');
```

### 9. **BLOB**
 **EN GENERALE ON EVITE CE TYPE QUI PREND DE LA PLACE MEMOIRE EN MYSQL OU SQL. ON NE L'UTILISERA PAS POUR GERER DES IMAGES**
```sql
CREATE TABLE aircraft_documents (
    document_id INT PRIMARY KEY,  -- Clé primaire
    manual BLOB  -- Binary data for aircraft manuals
);

INSERT INTO aircraft_documents (document_id, manual) VALUES (1, LOAD_FILE('/path/to/manual.pdf'));
```

### 10. **ENUM**
```sql
CREATE TABLE flight_reservations (
    reservation_id INT PRIMARY KEY,  -- Clé primaire
    status ENUM('confirmed', 'pending', 'canceled')  -- Status of the reservation
);

INSERT INTO flight_reservations (reservation_id, status) VALUES (1, 'confirmed');
```

## Types de Date et Heure

### 11. **DATE**
```sql
CREATE TABLE pilots (
    pilot_id INT PRIMARY KEY,  -- Clé primaire
    license_expiry DATE
);

INSERT INTO pilots (pilot_id, license_expiry) VALUES (1, '2025-12-31');
```

### 12. **DATETIME**
```sql
CREATE TABLE flights (
    flight_id INT PRIMARY KEY,  -- Clé primaire
    departure_time DATETIME
);

INSERT INTO flights (flight_id, departure_time) VALUES (1, '2024-11-04 14:30:00');
```
