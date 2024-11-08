# JSON 

Le champ JSON en MySQL permet de stocker des données au format JSON, c'est-à-dire en JavaScript Object Notation. Ce type de champ est très utile pour stocker des structures de données complexes comme des objets ou des tableaux directement dans une colonne de table, ce qui offre une flexibilité intéressante pour les applications nécessitant des données non structurées ou des informations supplémentaires qui varient d’un enregistrement à l’autre.

### Création d'un champ JSON

Pour créer une colonne de type JSON dans une table, on utilise le type `JSON` lors de la définition de la table. Par exemple :

```sql
CREATE TABLE books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    author VARCHAR(255),
    publish_year DATe,
    details JSON
);
```

```sql
INSERT INTO 
books (title, author, publish_year, details) 
VALUES ('The Great Adventure', 'John Doe', '2020-01-01', '{"genre": "Adventure", "language": "English", "pages": 350, "publisher": "Adventure Press", "characters": [{"name": "Alice", "role": "Protagonist", "age": 30}, {"name": "Bob", "role": "Antagonist", "age": 40}], "ratings": {"average": 4.5, "count": 1000}}'), ('Deep Sea Mysteries', 'Jane Smith', '2018-11-01', '{"genre": "Mystery", "language": "English", "pages": 300, "publisher": "Mystery World", "characters":
[{"name": "Eve", "role": "Detective", "age": 35}, {"name": "Frank", "role": "Victim", "age": 25}], "ratings": {"average": 4.2, "count": 800}}');
```

Dans cet exemple, la colonne `details` peut contenir des données au format JSON, comme des informations sur le nombre de pages, l'éditeur, ou les critiques.

### Avantages du champ JSON

- **Stockage flexible** : permet de stocker des structures de données imbriquées (objets et tableaux).
- **Consultation directe** : MySQL offre des fonctions pour interroger et manipuler les données JSON sans besoin de les extraire intégralement.
- **Optimisation** : MySQL indexe automatiquement les valeurs JSON, ce qui rend les recherches plus rapides.

### Fonctions JSON en MySQL

MySQL fournit plusieurs fonctions pour manipuler les données JSON. Voici quelques-unes des principales :

#### 1. `JSON_EXTRACT` : Extraire des données

Permet d'extraire des données spécifiques à partir d'un champ JSON en utilisant des chemins JSON.

```sql
SELECT JSON_EXTRACT(details, '$.genre') AS publisher
FROM books;

SELECT JSON_EXTRACT(details, '$.characters.') AS publisher
FROM books;
```

Dans cet exemple, `$.publisher` spécifie le chemin pour accéder à la clé `publisher` dans le champ `details`.

#### 2. `->` et `->>` : Opérateurs de raccourci pour l’extraction

- `->` : Retourne la valeur JSON native.
- `->>` : Retourne la valeur en tant que chaîne de caractères.

**Exemple** :

```sql
SELECT details->'$.publisher' AS publisher_json,
       details->>'$.publisher' AS publisher_text
FROM books;
```

Ici, `->` retourne la valeur JSON, tandis que `->>` retourne la valeur en tant que texte.

#### 3. `JSON_SET` : Modifier un champ JSON

Permet de modifier une clé ou d’ajouter une nouvelle clé dans un champ JSON.

```sql
UPDATE books
SET details = JSON_SET(details, '$.rating', 4.5)
WHERE id = 1;
```

Dans cet exemple, la clé `rating` est ajoutée ou mise à jour dans `details` pour le livre avec l'`id` égal à 1.

#### 4. `JSON_INSERT` et `JSON_REPLACE` : Insertion et remplacement

- `JSON_INSERT` : Ajoute une nouvelle clé sans écraser celles qui existent déjà.
- `JSON_REPLACE` : Remplace uniquement les clés qui existent déjà.

**Exemple** :

```sql
-- Insère une nouvelle clé uniquement si elle n'existe pas
UPDATE books
SET details = JSON_INSERT(details, '$.price', 19.99)
WHERE id = 1;

-- Remplace la valeur d'une clé existante
UPDATE books
SET details = JSON_REPLACE(details, '$.price', 15.99)
WHERE id = 1;
```

#### 5. `JSON_ARRAY` et `JSON_OBJECT` : Création de données JSON

- `JSON_ARRAY` : Crée un tableau JSON.
- `JSON_OBJECT` : Crée un objet JSON.

**Exemple** :

```sql
SELECT JSON_ARRAY('Fiction', 'Adventure', 'History') AS genres,
       JSON_OBJECT('publisher', 'Penguin', 'year', 2021) AS book_details;
```

#### 6. `JSON_CONTAINS` : Rechercher une valeur dans un champ JSON

Permet de vérifier si une valeur existe dans une structure JSON.

```sql
SELECT * FROM books
WHERE JSON_CONTAINS(details, '"Penguin"', '$.publisher');
```

Cet exemple vérifie si `details` contient un éditeur nommé "Penguin".

#### 7. `JSON_REMOVE` : Supprimer une clé

Supprime une clé spécifique dans un champ JSON.

```sql
UPDATE books
SET details = JSON_REMOVE(details, '$.rating')
WHERE id = 1;
```

Ce code supprime la clé `rating` dans la colonne `details` pour le livre avec l'`id` égal à 1.
