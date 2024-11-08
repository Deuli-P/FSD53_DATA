
-- CREATE DATABASE -- 

CREATE DATABASE db_photographe ;

-- Utiliser DATABASE db_photographe --

USE db_photographe;

-- CREATE TABLE USER ;

CREATE TABLE `user` (
`id` INT NOT NULL AUTO_INCREMENT,
`username` VARCHAR(50),
`email` VARCHAR(250) NOT NULL UNIQUE,
`password` VARCHAR(32),
`status` ENUM('active','inactive', 'deleted') DEFAULT 'active',
`created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
`update_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
CONSTRAINT pk_user PRIMARY KEY (`id`)
);

-- CREATE TABLE CATEGORY ;

CREATE TABLE `category` (
`id` INT NOT NULL AUTO_INCREMENT,
`name` VARCHAR(20) UNIQUE,
`description` VARCHAR(255),
`status` ENUM('active','inactive', 'deleted') DEFAULT 'active',
`created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
`update_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
CONSTRAINT pk_category PRIMARY KEY (`id`)
);

-- CREATE TABLE PHOTO ;

CREATE TABLE `photo` (
`id` INT NOT NULL AUTO_INCREMENT,
`user_id` INT,
`title` VARCHAR(32),
`description` VARCHAR(255),
`url` VARCHAR(250),
`status` ENUM('active','inactive', 'deleted') DEFAULT 'active',
`created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
`update_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
CONSTRAINT pk_photo PRIMARY KEY (`id`),
CONSTRAINT fk_photo_user FOREIGN KEY (`user_id`) REFERENCES `user`(`id`)
);


-- CREATE TABLE COMMENTS ;

CREATE TABLE `comment` (
`id` INT NOT NULL AUTO_INCREMENT,
`photo_id` INT,
`user_id` INT,
`content` VARCHAR(255),
`status` ENUM('active','inactive', 'deleted') DEFAULT 'active',
`created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
`update_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
CONSTRAINT pk_photo PRIMARY KEY (`id`),
CONSTRAINT fk_comments_photo FOREIGN KEY (`photo_id`) REFERENCES `photo`(`id`),
CONSTRAINT fk_comments_user FOREIGN KEY (`user_id`) REFERENCES `user`(`id`)
);


-- CREATE TABLE PHOTO-CATEGORY ;

CREATE TABLE `photo_category` (
`photo_id` INT,
`category_id` INT,
`status` ENUM('active','inactive', 'deleted') DEFAULT 'active',
`created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
`update_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
CONSTRAINT fk_photoCategory_photo FOREIGN KEY (`photo_id`) REFERENCES `photo`(`id`),
CONSTRAINT fk_photoCategory_category FOREIGN KEY (`category_id`) REFERENCES `category`(`id`)
);


-- CHANGER VARCHAR username DANS USER --

ALTER TABLE `user`
CHANGE COLUMN username username VARCHAR(50);
