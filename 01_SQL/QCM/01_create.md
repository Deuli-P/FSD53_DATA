**QCM : Création d'une Base de Données**

**1. Quel moteur de stockage MySQL est principalement utilisé pour la gestion des données lorsqu'on de la sécurité sur l'intégrité des données ?**  
(Choisissez une ou plusieurs réponses)  
- [ ] MyISAM  
- [x] InnoDB  
- [ ] Memory  
- [ ] NDB  

---

**2. Quel est l'objectif principal d'une clé primaire dans une table ?**  
(Choisissez une ou plusieurs réponses)  
- [x] Identifier de façon unique chaque enregistrement  
- [x] Référencer une clé primaire dans une autre table  
- [ ] Elle doit être de type `INT` nécessairement 
- [ ] Permettre des recherches rapides uniquement  

---

**3. Dans le modèle de données relationnel, qu'est-ce qu'une clé étrangère ?**  
(Choisissez une ou plusieurs réponses)  
- [ ] Une clé utilisée pour identifier un enregistrement de manière unique  
- [x] Une clé qui référence une clé primaire d'une autre table  
- [x] Elle établit une relation entre deux tables  
- [ ] Elle est nécessaire pour effectuer des jointures uniquement  

---

**4. Quelle commande SQL permet de créer une base de données avec un encodage spécifique ?**  
(Choisissez une ou plusieurs réponses)  
- [x] `CREATE DATABASE IF NOT EXISTS db_aviation CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;`  
- [ ] `CREATE DATABASE db_aviation;`  
- [ ] `CREATE TABLE db_aviation;`  
- [ ] `USE db_aviation;`  

---

**5. Quelle commande SQL permet d’ajouter une colonne à une table existante ?**  
(Choisissez une ou plusieurs réponses)  
- [x] `ALTER TABLE companies ADD COLUMN status ENUM('published', 'unpublished', 'draft') DEFAULT 'draft';`  
- [ ] `CREATE COLUMN status ENUM('published', 'unpublished', 'draft') DEFAULT 'draft';`  
- [ ] `ADD COLUMN status ENUM('published', 'unpublished', 'draft') DEFAULT 'draft' TO companies;`  
- [ ] `INSERT TABLE companies ADD COLUMN num_street VARCHAR(10) AFTER name;`  

---

**6. Quelle est la bonne syntaxe pour lier une colonne `company` dans la table `pilots` à la clé primaire `comp` de la table `companies` ?**  
(Choisissez une ou plusieurs réponses)  
- [ ] `ALTER TABLE pilots ADD CONSTRAINT fk_pilots_company FOREIGN KEY (company) REFERENCES pilots(comp);`  
- [x] `ALTER TABLE pilots ADD CONSTRAINT fk_pilots_company FOREIGN KEY (company) REFERENCES companies(comp);`  
- [ ] `ALTER TABLE pilots ADD CONSTRAINT fk_pilots_company FOREIGN KEY (company) REFERENCES companies(name);`  
- [ ] `ALTER TABLE pilots ADD CONSTRAINT fk_pilots_company FOREIGN KEY (company) REFERENCES pilots(name);`

---

**7. Que permet de faire la commande `DESCRIBE` dans MySQL ?**  
(Choisissez une ou plusieurs réponses)  
- [x] Afficher la structure d'une table  
- [ ] Ajouter une colonne dans une table  
- [ ] Supprimer une base de données  
- [ ] Créer une nouvelle table  

---

**8. Quel moteur de stockage MySQL est adapté aux systèmes de cache temporaires en raison de son stockage en mémoire ?**  
(Choisissez une ou plusieurs réponses)  
- [ ] MyISAM  
- [ ] InnoDB  
- [x] Memory  
- [ ] NDB  
