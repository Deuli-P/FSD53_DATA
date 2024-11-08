### Étape 1 : Création des tables

Les tables seront auto-incrémentées pour les PK

1. **Table `students` :**
   Créez une table `students` pour stocker les informations des étudiants.

- first_name
- last_name
- birth_date
- email

1. **Table `courses` :**
   Créez une table `courses` pour enregistrer les informations des cours.

- name
- code

1. **Table `enrollments` :**
   Créez une table `enrollments` pour stocker les inscriptions des étudiants aux cours. Cette table contiendra des clés étrangères pour lier les étudiants aux cours.

- student_id
-  course_id
-  enrollment_date

### Étape 2 : Modification des tables avec `ALTER TABLE`

1. **Ajoutez une colonne `email`** dans la table `students` pour enregistrer l'email des étudiants.

2. **Ajoutez une contrainte UNIQUE** à la colonne `email` pour garantir que chaque email est unique.

### Données à insérer dans les tables

```sql

INSERT INTO students (first_name, last_name, birth_date, email) VALUES
('Alice', 'Smith', '2000-05-14', 'alice.smith@example.com'),
('Bob', 'Johnson', '1999-03-22', 'bob.johnson@example.com'),
('Charlie', 'Brown', '2001-08-09', 'charlie.brown@example.com'),
('David', 'Wilson', '2002-01-16', 'david.wilson@example.com'),
('Eve', 'Davis', '2000-11-30', 'eve.davis@example.com');

INSERT INTO courses (name, code) VALUES
('Computer Science 101', 'CS101'),
('Mathematics 101', 'MATH101'),
('History of Art', 'ART101'),
('Physics 101', 'PHYS101'),
('Biology 101', 'BIO101');

INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2024-01-10'),
(1, 2, '2024-01-15'),
(2, 1, '2024-01-12'),
(2, 3, '2024-01-18'),
(3, 4, '2024-01-20'),
(3, 2, '2024-01-25'),
(4, 5, '2024-01-30'),
(5, 1, '2024-02-02');

```

### Exercices

#### Exercices de Sélection de Données

1. **Sélectionner tous les étudiants**
   - Affichez tous les détails de chaque étudiant dans la table `students`.

2. **Lister les cours**
   - Récupérez toutes les informations sur les cours dans la table `courses`.

3. **Afficher les inscriptions récentes**
   - Sélectionnez les enregistrements d’inscription dans la table `enrollments`, mais uniquement pour les inscriptions effectuées après le 1er janvier 2023.

---

#### Exercices de Filtrage avec `WHERE`

4. **Étudiants nés avant l'an 2000**
   - Affichez les prénoms et noms des étudiants nés avant le 1er janvier 2000.


5. **Trouver un cours spécifique par code**
   - Affichez les informations du cours dont le code est 'ENG202'.

---

#### Exercices de Comptage avec `COUNT` et `GROUP BY`

6. **Nombre total d’étudiants**
   - Comptez le nombre total d’étudiants dans la table `students`.

7. **Nombre d’inscriptions par date**
   - Comptez combien d’inscriptions ont été effectuées à chaque date dans la table `enrollments`.

---

#### Exercices de Calcul avec des Fonctions Agrégées

8. **Trouver l’étudiant le plus âgé**
   - Trouvez la date de naissance la plus ancienne dans la table `students`.

9. **Date la plus récente d’inscription**
   - Affichez la date d’inscription la plus récente dans la table `enrollments`.

---

#### Exercices de Filtrage avec `HAVING`

10. **Cours avec au moins 2 inscriptions**
    - Affichez l’identifiant des cours qui ont au moins deux étudiants inscrits.

