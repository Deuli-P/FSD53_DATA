# JOINTURE

### 1. Quelle(s) assertion(s) concernant la **clef primaire** est/sont correcte(s) ?
- [ ] Une clef primaire peut être définie comme un **INDEX UNIQUE** et **NOT NULL**.
- [ ] Une clef primaire peut être composée de plusieurs colonnes.
- [ ] Une clef primaire est optionnelle dans une table.
- [ ] Une clef primaire peut contenir des valeurs `NULL`.

---

### 2. Quelle(s) condition(s) sont nécessaires pour utiliser une **clef étrangère** dans MySQL ?
- [ ] Le moteur **InnoDB** est nécessaire.
- [ ] La clef étrangère fait référence à une clef primaire dans une autre table.
- [ ] Le moteur **MyISAM** peut être utilisé avec des clefs étrangères.
- [ ] La table contenant la clef étrangère doit avoir un **INDEX UNIQUE**.


---

### 3. Que se passe-t-il si une compagnie dans la table `companies` est référencée par des lignes dans la table `pilots` et que cette compagnie est supprimée avec l'option **ON DELETE CASCADE** ?
- [ ] La compagnie sera supprimée, et tous les pilotes référencés dans `pilots` seront également supprimés.
- [ ] Les pilotes resteront dans la table `pilots` sans référence à la compagnie supprimée.
- [ ] Les pilotes auront leur colonne `company` mise à `NULL`.
- [ ] La suppression de la compagnie échouera si des pilotes sont référencés.

---

### 4. Que se passe-t-il si une ligne est supprimée de la table `authors` dans l'exemple où la clef étrangère est définie avec `ON DELETE SET NULL` dans la table `books` ?
- [ ] Les livres liés à cet auteur seront supprimés.
- [ ] L'`author_id` des livres liés à cet auteur sera mis à `NULL`.
- [ ] Les livres resteront intacts, mais le champ `author_id` sera effacé.
- [ ] Les livres ne seront pas affectés et l'auteur restera référencé avec `NULL`.
