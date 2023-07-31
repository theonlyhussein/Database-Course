DROP TABLE castaway_hut;
DROP TABLE hut;
DROP TABLE castaway;

CREATE TABLE castaway (
id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50),
gender CHAR(1),
email VARCHAR(30) UNIQUE DEFAULT 'thecast@gilligans.island',
stranded_date DATE,
courses INT DEFAULT 0,
tuition DECIMAL(6,2)
) ENGINE = InnoDB;

CREATE TABLE hut (
   hut_number INT PRIMARY KEY AUTO_INCREMENT,
   location VARCHAR(500),
   floor_space DECIMAL(6,2),
   bunks INT DEFAULT 0
) ENGINE = InnoDB;

CREATE TABLE castaway_hut (
castaway_id INT,
hut_number INT,
date_first_occupied DATE,
PRIMARY KEY (castaway_id, hut_number),
FOREIGN KEY (castaway_id) REFERENCES castaway(id),
FOREIGN KEY (hut_number) REFERENCES hut(hut_number)
) ENGINE = InnoDB;


SELECT COLUMN_NAME, TABLE_NAME, CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'castaway_hut'
AND CONSTRAINT_SCHEMA = 'shoba';

-- ALTER TABLE hut --------------- look at mysql documentation for now


INSERT INTO castaway (first_name, last_name, gender, email)
VALUES ('Gilligan', NULL, 'M', 'buddy@theisland.tv');


INSERT INTO castaway (first_name, last_name, gender, email)
VALUES ('Mary Ann', 'Summers', 'F', 'kansasgurlz@theisland.tv');


INSERT INTO castaway (first_name, last_name, gender, email)
VALUES ('Ginger', 'Grant', 'F', 'ginger@theisland.tv'), 
   ('Jonas', 'Grumby', 'M', 'skipper@theisland.tv');


SELECT * 
FROM castaway 
WHERE id >= 3;

DELETE FROM castaway
WHERE id >= 3;

-- catastrohpic statement 
DELETE FROM castaway;

UPDATE castaway
SET courses = 10
WHERE id = 6;