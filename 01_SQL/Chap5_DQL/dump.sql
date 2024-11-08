
CREATE DATABASE IF NOT EXISTS `db_aviation_2`
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE db_aviation_2 ;

CREATE TABLE pilots (
  certificate varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  num_flying decimal(7,1) DEFAULT NULL,
  company char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  name varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  last_name varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  plane enum('A380','A320','A340') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  created datetime DEFAULT CURRENT_TIMESTAMP,
  birth_date date DEFAULT NULL,
  next_flight datetime DEFAULT NULL,
  num_jobs int DEFAULT NULL,
  bonus smallint DEFAULT NULL,
  PRIMARY KEY (certificate)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE companies (
  comp char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  street varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  city varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  name varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  num_street int DEFAULT NULL,
  status enum('published','unpublished','draft') COLLATE utf8mb4_unicode_ci DEFAULT 'draft',
  PRIMARY KEY (`comp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;

 CREATE TABLE `sales` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` date DEFAULT '1980-01-01',
  `company` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profit` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- clés étrangères
ALTER TABLE pilots
ADD CONSTRAINT fk_pilots_companies FOREIGN KEY (`company`)
REFERENCES companies (`comp`);

ALTER TABLE sales
ADD CONSTRAINT fk_sales_company FOREIGN KEY (`company`)
REFERENCES companies (`comp`);


INSERT INTO `companies` (`comp`, `street`, `city`, `name`, `num_street`, `status`) VALUES
('ABCD', 'Main Street', 'New York', 'Alpha Corp', 123, 'published'),
('WXYZ', 'Second Ave', 'Los Angeles', 'Beta Ltd', 456, 'unpublished'),
('EFGH', 'Park Blvd', 'Chicago', 'Gamma Inc', 789, 'draft'),
('IJKL', 'Market St', 'San Francisco', 'Delta LLC', 101, 'published'),
('MNOP', 'Sunset Blvd', 'Miami', 'Epsilon Co', 202, 'draft'),
('QRST', 'Broadway', 'New York', 'Zeta Industries', 303, 'published'),
('UVWX', 'Hollywood Ave', 'Los Angeles', 'Eta Enterprises', 404, 'unpublished'),
('YZAB', 'Elm Street', 'Chicago', 'Theta Ltd', 505, 'draft'),
('CDEF', 'Ocean Dr', 'Miami', 'Iota Corp', 606, 'published'),
('GHIK', 'Lake Shore Dr', 'Chicago', 'Kappa LLC', 707, 'unpublished'),
('LMNO', '5th Ave', 'New York', 'Lambda Inc', 808, 'draft'),
('PQRS', 'Wilshire Blvd', 'Los Angeles', 'Mu Corp', 909, 'published'),
('TUVW', 'Main St', 'San Francisco', 'Nu Ltd', 101, 'unpublished'),
('XYZA', 'Sunset Ave', 'Miami', 'Xi Co', 202, 'published'),
('BCDE', 'Market Ave', 'Chicago', 'Omicron Inc', 303, 'draft'),
('FGHI', 'Central St', 'New York', 'Pi Corp', 404, 'published'),
('JKLM', '6th Ave', 'Los Angeles', 'Rho Ltd', 505, 'unpublished'),
('NOPQ', 'Ocean Blvd', 'Miami', 'Sigma LLC', 606, 'draft'),
('RSTU', 'Bayshore Dr', 'San Francisco', 'Tau Industries', 707, 'published'),
('UVXY', 'Oak St', 'Chicago', 'Upsilon Enterprises', 808, 'draft'),
('ABEF', 'First St', 'New York', 'Phi Co', 909, 'published'),
('BCFG', 'Maple Ave', 'Miami', 'Chi Corp', 101, 'unpublished'),
('CDHI', 'Pine St', 'Los Angeles', 'Psi Ltd', 202, 'draft'),
('DEJK', 'Cedar Blvd', 'San Francisco', 'Omega Corp', 303, 'published'),
('EFKL', 'Willow St', 'Chicago', 'Alpha Beta', 404, 'draft'),
('FGMN', 'Birch Ave', 'New York', 'Gamma Delta', 505, 'published'),
('GHOP', 'Spruce St', 'Miami', 'Epsilon Zeta', 606, 'unpublished'),
('HIQR', 'Magnolia Blvd', 'Los Angeles', 'Eta Theta', 707, 'draft'),
('IJST', 'Palm Dr', 'San Francisco', 'Iota Kappa', 808, 'published'),
('JKUV', 'Ash St', 'Chicago', 'Lambda Mu', 909, 'unpublished'),
('KLWX', 'Cherry Ave', 'New York', 'Nu Xi', 101, 'draft');

INSERT INTO `pilots` (`certificate`, `num_flying`, `company`, `name`, `created`, `birth_date`, `next_flight`, `num_jobs`) VALUES
('A00001', 1200.5, 'ABCD', 'Alice Brown', NOW(), '1980-05-12', '2024-12-15 10:00:00', 15),
('A00002', 875.3, 'WXYZ', 'Bob Smith', NOW(), '1978-09-23', '2024-11-20 14:30:00', 10),
('A00003', 1345.2, 'EFGH', 'Charlie Johnson', NOW(), '1985-11-05', '2024-12-05 08:45:00', 20),
('A00004', 430.6, 'IJKL', 'Diana Ross', NOW(), '1990-03-16', '2024-11-18 06:30:00', 8),
('A00005', 765.0, 'MNOP', 'Evan Lee', NOW(), '1983-07-22', '2024-12-01 11:15:00', 12),
('A00006', 950.1, 'QRST', 'Fiona Green', NOW(), '1981-02-28', '2024-11-25 09:00:00', 16),
('A00007', 1455.4, 'UVWX', 'George Hall', NOW(), '1987-08-11', '2024-12-10 13:00:00', 19),
('A00008', 210.9, 'YZAB', 'Helen Clark', NOW(), '1992-04-10', '2024-11-17 07:20:00', 5),
('A00009', 1285.6, 'CDEF', 'Ian Scott', NOW(), '1979-12-30', '2024-11-22 12:00:00', 13),
('A00010', 540.8, 'GHIK', 'Jane White', NOW(), '1984-06-19', '2024-12-07 15:45:00', 11),
('A00011', 650.2, 'LMNO', 'Kyle Young', NOW(), '1986-10-01', '2024-11-28 08:15:00', 14),
('A00012', 990.0, 'PQRS', 'Laura King', NOW(), '1991-01-24', '2024-12-12 17:30:00', 10),
('A00013', 1205.7, 'TUVW', 'Mike Brown', NOW(), '1977-11-13', '2024-12-03 06:00:00', 18),
('A00014', 305.5, 'XYZA', 'Nina Adams', NOW(), '1989-05-17', '2024-11-26 08:50:00', 7),
('A00015', 845.1, 'BCDE', 'Oscar Phillips', NOW(), '1982-03-05', '2024-12-08 10:25:00', 13),
('A00016', 1120.3, 'FGHI', 'Patricia Wilson', NOW(), '1988-07-09', '2024-12-14 16:45:00', 16),
('A00017', 415.7, 'JKLM', 'Quentin Reed', NOW(), '1980-10-22', '2024-11-29 07:30:00', 9),
('A00018', 990.9, 'NOPQ', 'Rachel Foster', NOW(), '1985-09-14', '2024-11-24 14:50:00', 12),
('A00019', 1100.4, 'RSTU', 'Samuel Turner', NOW(), '1979-01-17', '2024-12-09 09:40:00', 17),
('A00020', 745.3, 'UVWX', 'Tina Carter', NOW(), '1993-12-29', '2024-12-06 08:00:00', 11),
('A00021', 250.6, 'YZAB', 'Ulysses Martin', NOW(), '1987-04-27', '2024-11-30 18:00:00', 6),
('A00022', 1325.2, 'CDEF', 'Victoria Edwards', NOW(), '1981-08-13', '2024-12-13 07:10:00', 14),
('A00023', 610.5, 'GHIK', 'Walter Morris', NOW(), '1984-11-30', '2024-12-02 10:35:00', 10),
('A00024', 885.8, 'LMNO', 'Xander Hughes', NOW(), '1980-06-21', '2024-12-11 13:50:00', 15),
('A00025', 420.1, 'PQRS', 'Yasmin Bell', NOW(), '1990-09-02', '2024-12-04 16:00:00', 7),
('A00026', 1060.7, 'TUVW', 'Zachary Perry', NOW(), '1988-02-18', '2024-11-19 11:25:00', 18),
('A00027', 535.9, 'XYZA', 'Amy Howard', NOW(), '1992-03-14', '2024-11-21 09:45:00', 9),
('A00028', 1275.4, 'BCDE', 'Brian Fox', NOW(), '1983-07-27', '2024-12-15 14:10:00', 12),
('A00029', 355.8, 'FGHI', 'Chloe Long', NOW(), '1978-10-20', '2024-11-23 15:35:00', 8),
('A00030', 920.6, 'JKLM', 'Daniel Stewart', NOW(), '1985-01-29', '2024-12-10 07:55:00', 10);


INSERT INTO `sales` (`created_at`, `company`, `profit`) VALUES
('2024-01-15', 'ABCD', 15000.50),
('2024-02-20', 'WXYZ', 21000.75),
('2024-03-10', 'EFGH', 18000.25),
('2024-04-05', 'IJKL', 25000.00),
('2024-05-22', 'MNOP', 13000.00),
('2024-06-30', 'QRST', 17000.50),
('2024-07-10', 'UVWX', 22000.90),
('2024-08-15', 'YZAB', 14000.40),
('2024-09-25', 'CDEF', 16000.00),
('2024-10-05', 'GHIK', 19000.60),
('2024-11-18', 'LMNO', 20000.75),
('2024-12-03', 'PQRS', 23000.80),
('2024-12-20', 'TUVW', 15000.30),
('2024-11-29', 'XYZA', 26000.45),
('2024-10-12', 'BCDE', 17500.85),
('2024-09-08', 'FGHI', 14500.95),
('2024-08-25', 'JKLM', 12000.65),
('2024-07-17', 'NOPQ', 16500.70),
('2024-06-06', 'RSTU', 15500.10),
('2024-05-13', 'UVXY', 13500.20);


--bonus
UPDATE `pilots`
SET `bonus` = FLOOR(RAND() * 101); 


