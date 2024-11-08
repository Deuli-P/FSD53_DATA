## Exercices SQL insertion

## 01 Exercice : Ajouter une colonne `created`

Ajoutez la colonne `created` dans la table `pilotes`. Ajoutez l'option suivante à cette colonne :


Puis insérez les pilotes suivants avec l'horodatage actuel pour la colonne `created` :

```sql
INSERT INTO pilotes (certificate, num_flying, company, name, created)
VALUES
    ('ct-1', 90, 'AUS', 'Alan', CURRENT_TIMESTAMP),
    ('ct-10', 90, 'FRE1', 'Tom', CURRENT_TIMESTAMP),
    ('ct-100', 200, 'SIN', 'Yi', CURRENT_TIMESTAMP),
    ('ct-11', 200, 'AUS', 'Sophie', CURRENT_TIMESTAMP),
    ('ct-12', 190, 'AUS', 'Albert', CURRENT_TIMESTAMP),
    ('ct-16', 190, 'SIN', 'Yan', CURRENT_TIMESTAMP),
    ('ct-56', 300, 'AUS', 'Benoit', CURRENT_TIMESTAMP),
    ('ct-6', 20, 'FRE1', 'John', CURRENT_TIMESTAMP),
    ('ct-7', 80, 'CHI', 'Pierre', CURRENT_TIMESTAMP);
```

## 02 Exercice : Ajout d'une colonne et mise à jour

Ajoutez les colonnes `birth_date`, `next_flight`, `num_jobs` dans la table `pilotes`. Trouvez les meilleurs types pour définir ces colonnes.

### Exercise 3: Inserting Multiple Users

**Objective:** insertion multiples.

**Instructions:**

1. Création de `users` 
   ```sql
   CREATE TABLE users (
       id INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(100) NOT NULL,
       email VARCHAR(100) NOT NULL UNIQUE,
       registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
   );
   ```

2.Insérez les données suivantes:

   | name     | email               |
   |----------|---------------------|
   | Alice    | alice@example.com    |
   | Bob      | bob@example.com      |
   | Charlie  | charlie@example.com  |
   | David    | david@example.com    |
   | Eva      | eva@example.com      |

3. Write an SQL query to insert all users in a single command using multiple insert syntax.


### Exercise 4: Conditional Insertion with Verification

**Objective:** Practice insertion with checks and conditional commands.

**Instructions:**

1. Create a `products` table with the following structure:
   ```sql
   CREATE TABLE products (
       id INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(100) NOT NULL UNIQUE,
       price DECIMAL(10, 2) NOT NULL,
       stock INT DEFAULT 0
   );
   ```

2. Write an SQL query to insert the product "Water Bottle" with a price of 5.99 and stock of 100, **only if** the product does not already exist in the table.

3. Insert the following data with similar checks:
   - Name: "Coffee", Price: 2.50, Stock: 50
   - Name: "Tea", Price: 2.00, Stock: 30

