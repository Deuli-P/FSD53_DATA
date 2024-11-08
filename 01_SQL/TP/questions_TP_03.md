
1. **Sélectionner tous les utilisateurs**  

   ```sql
   SELECT * from user;
   ```

   RESULTAT : 
   ```
   +----+-----------------------+------------------+----------------------+--------+---------------------+---------------------+
   | id | username              | email            | password             | status | created_at          | update_at           |
   +----+-----------------------+------------------+----------------------+--------+---------------------+---------------------+
   |  1 | john_doe_photographer | john@example.com | secure_password_hash | active | 2024-11-08 10:59:37 | 2024-11-08 10:59:37 |
   +----+-----------------------+------------------+----------------------+--------+---------------------+---------------------+
   ```

2. **Sélectionner les photos par utilisateur**  

   ```sql
   SELECT 
      * , 
      user_id as Proprietaire 
   FROM photo
   GROUP BY id;
   ```

   RESULTAT : 
   ```
   +----+---------+-----------------------+-----------------------------------------------------------------+-----------------------------------------------+--------+---------------------+---------------------+--------------+
   | id | user_id | title                 | description                                                     | url                                           | status | created_at          | update_at           | Proprietaire |
   +----+---------+-----------------------+-----------------------------------------------------------------+-----------------------------------------------+--------+---------------------+---------------------+--------------+
   |  1 |       1 | Sunset Over Mountains | A beautiful sunset over the mountains.                          | https://example.com/photos/sunset.jpg         | active | 2024-11-08 11:02:16 | 2024-11-08 11:02:16 |            1 |
   |  2 |       1 | City Night Lights     | A vibrant city at night with stunning lights.                   | https://example.com/photos/city_lights.jpg    | active | 2024-11-08 11:02:16 | 2024-11-08 11:02:16 |            1 |
   |  3 |       1 | Lone Wolf             | A lone wolf standing in a snowy forest.                         | https://example.com/photos/lone_wolf.jpg      | active | 2024-11-08 11:02:16 | 2024-11-08 11:02:16 |            1 |
   |  4 |       1 | Portrait of an Elder  | A close-up portrait of an elderly man with expressive features. | https://example.com/photos/elder_portrait.jpg | active | 2024-11-08 11:02:16 | 2024-11-08 11:02:16 |            1 |
   +----+---------+-----------------------+-----------------------------------------------------------------+-----------------------------------------------+--------+---------------------+---------------------+--------------+ 
   ```

3. **Lister les catégories disponibles**  

   ```sql
   SELECT * 
   FROM category 
   WHERE status ='active';
   ```

   RESULTAT : 
   ``` 
   +----+-----------+------------------------------------------------+--------+---------------------+---------------------+
   | id | name      | description                                    | status | created_at          | update_at           |
   +----+-----------+------------------------------------------------+--------+---------------------+---------------------+
   |  1 | Landscape | Photos of natural landscapes and scenery       | active | 2024-11-08 10:59:46 | 2024-11-08 10:59:46 |
   |  2 | Portrait  | Portrait photography of individuals and groups | active | 2024-11-08 10:59:46 | 2024-11-08 10:59:46 |
   |  3 | Wildlife  | Captures of animals in their natural habitats  | active | 2024-11-08 10:59:46 | 2024-11-08 10:59:46 |
   |  4 | Urban     | Photos of cityscapes and urban scenes          | active | 2024-11-08 10:59:46 | 2024-11-08 10:59:46 |
   +----+-----------+------------------------------------------------+--------+---------------------+---------------------+
   ```

4. **Sélectionner les photos avec un statut actif**  

   ```sql
   SELECT * 
   FROM photo 
   WHERE status ='active';
   ```

   RESULTAT : 
   ```
   +----+---------+-----------------------+-----------------------------------------------------------------+-----------------------------------------------+--------+---------------------+---------------------+
   | id | user_id | title                 | description                                                     | url                                           | status | created_at          | update_at           |
   +----+---------+-----------------------+-----------------------------------------------------------------+-----------------------------------------------+--------+---------------------+---------------------+
   |  1 |       1 | Sunset Over Mountains | A beautiful sunset over the mountains.                          | https://example.com/photos/sunset.jpg         | active | 2024-11-08 11:02:16 | 2024-11-08 11:02:16 |
   |  2 |       1 | City Night Lights     | A vibrant city at night with stunning lights.                   | https://example.com/photos/city_lights.jpg    | active | 2024-11-08 11:02:16 | 2024-11-08 11:02:16 |
   |  3 |       1 | Lone Wolf             | A lone wolf standing in a snowy forest.                         | https://example.com/photos/lone_wolf.jpg      | active | 2024-11-08 11:02:16 | 2024-11-08 11:02:16 |
   |  4 |       1 | Portrait of an Elder  | A close-up portrait of an elderly man with expressive features. | https://example.com/photos/elder_portrait.jpg | active | 2024-11-08 11:02:16 | 2024-11-08 11:02:16 |
   +----+---------+-----------------------+-----------------------------------------------------------------+-----------------------------------------------+--------+---------------------+---------------------+
   ```

5. **Compter le nombre de photos par utilisateur**  

   ```sql
  SELECT 
   user_id ,
   count(*) as 'nbr_photo'
  FROM photo
  GROUP BY user_id
  ;
   ```

   RESULTAT : 
   ```

   ```

6. **Sélectionner les commentaires pour une photo spécifique**  

   ```sql
   SELECT *
   FROM comment
   WHERE photo_id = 3;
   ```

   RESULTAT : 
   ```
   +----+----------+---------+-------------------------------+--------+---------------------+---------------------+
   | id | photo_id | user_id | content                       | status | created_at          | update_at           |
   +----+----------+---------+-------------------------------+--------+---------------------+---------------------+
   |  3 |        3 |       1 | Love the details on the wolf! | active | 2024-11-08 11:04:05 | 2024-11-08 11:04:05 |
   +----+----------+---------+-------------------------------+--------+---------------------+---------------------+
   ```

7. **Trouver les photos qui ont des commentaires**  

   ```sql
   SELECT *
   FROM photo
   WHERE id IN (
      SELECT photo_id
      FROM comment 
      WHERE photo_id = id
   );
   ```

   RESULTAT : 
   ```
   +----+---------+-----------------------+-----------------------------------------------------------------+-----------------------------------------------+--------+---------------------+---------------------+
   | id | user_id | title                 | description                                                     | url                                           | status | created_at          | update_at           |
   +----+---------+-----------------------+-----------------------------------------------------------------+-----------------------------------------------+--------+---------------------+---------------------+
   |  1 |       1 | Sunset Over Mountains | A beautiful sunset over the mountains.                          | https://example.com/photos/sunset.jpg         | active | 2024-11-08 11:02:16 | 2024-11-08 11:02:16 |
   |  2 |       1 | City Night Lights     | A vibrant city at night with stunning lights.                   | https://example.com/photos/city_lights.jpg    | active | 2024-11-08 11:02:16 | 2024-11-08 11:02:16 |
   |  3 |       1 | Lone Wolf             | A lone wolf standing in a snowy forest.                         | https://example.com/photos/lone_wolf.jpg      | active | 2024-11-08 11:02:16 | 2024-11-08 11:02:16 |
   |  4 |       1 | Portrait of an Elder  | A close-up portrait of an elderly man with expressive features. | https://example.com/photos/elder_portrait.jpg | active | 2024-11-08 11:02:16 | 2024-11-08 11:02:16 |
   +----+---------+-----------------------+-----------------------------------------------------------------+-----------------------------------------------+--------+---------------------+---------------------+
   ```

8.  **Sélectionner les catégories sans photos associées**  

    ```sql
    SELECT `name`
    FROM category
    WHERE id NOT IN (
      SELECT category_id
      FROM photo_category
      WHERE id = category_id
    );
    ```

   RESULTAT : 
   ```
   Empty set
   ```

1. **Trouver le nombre supérieur à 0 de commentaire(s) pour chaque photo, ordez le résultat par ordre croissant**  

   ```sql
   SELECT 
      photo_id,
      count(*) as `nbrComments`
   FROM comment
   GROUP BY photo_id
   HAVING photo_id
   ORDER BY count(*) ASC;
   ```

   RESULTAT : 
   ```
   +----------+-------------+
   | photo_id | nbrComments |
   +----------+-------------+
   |        1 |           1 |
   |        2 |           1 |
   |        3 |           1 |
   |        4 |           1 |
   +----------+-------------+
   ```


2. **Sélectionner les utilisateurs et leurs photos actives**  

   ```sql
   SELECT
      u.username as 'name',
      p.id as 'photo_id',
      p.title as 'title_photo'
   FROM user AS u
   JOIN photo as p
   ON p.user_id = u.id; 
   ```

   RESULTAT : 
   ```
   +-----------------------+----------+-----------------------+
   | name                  | photo_id | title_photo           |
   +-----------------------+----------+-----------------------+
   | john_doe_photographer |        1 | Sunset Over Mountains |
   | john_doe_photographer |        2 | City Night Lights     |
   | john_doe_photographer |        3 | Lone Wolf             |
   | john_doe_photographer |        4 | Portrait of an Elder  |
   +-----------------------+----------+-----------------------+
   ```

3. **Trouver les catégories les plus populaires**  

   ```sql
   SELECT 
         c.name,
         COUNT(cp.category_id) AS nb_category
   FROM photo_category AS cp
   JOIN category AS c
   ON c.id = cp.category_id
   GROUP BY c.name
   ORDER BY nb_category DESC;
   ```

   RESULTAT : 
   ```
   +-----------+-------------+
   | name      | nb_category |
   +-----------+-------------+
   | Landscape |           1 |
   | Portrait  |           1 |
   | Wildlife  |           1 |
   | Urban     |           1 |
   +-----------+-------------+
   ```

4. **Sélectionner les photos sans commentaires**  

   ```sql
   SELECT *
   FROM photo
   WHERE id NOT IN (
      SELECT photo_id
      FROM comment 
      WHERE photo_id = id
   );
   ```
   RESULTAT :
   ```
   Empty set
   ```

5. **Sélectionner le nombre de photos par utilisateur - vous n'avez qu'un seul utilisateur pour l'instant - et catégorie**  

   ```sql
   SELECT 
      p.user_id,
      u.username,
      pc.category_id,
      COUNT(*) as nb_photos
   FROM user as u
   JOIN photo as p
   ON p.user_id = u.id
   JOIN photo_category as pc 
   on p.id = pc.photo_id
   GROUP BY p.user_id, pc.category_id;
   ```

   RESULTAT : 
   ```
   +---------+-----------------------+-------------+-----------+
   | user_id | username              | category_id | nb_photos |
   +---------+-----------------------+-------------+-----------+
   |       1 | john_doe_photographer |           1 |         1 |
   |       1 | john_doe_photographer |           4 |         1 |
   |       1 | john_doe_photographer |           3 |         1 |
   |       1 | john_doe_photographer |           2 |         1 |
   +---------+-----------------------+-------------+-----------+
   ```