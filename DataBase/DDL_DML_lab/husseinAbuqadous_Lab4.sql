CREATE TABLE consultant ( 
c_id INT PRIMARY KEY AUTO_INCREMENT,
c_last VARCHAR(20),
c_first VARCHAR(20),
c_dob date,
c_email VARCHAR(30) UNIQUE
) ENGINE = InnoDB;

CREATE TABLE project (
p_id INT PRIMARY KEY AUTO_INCREMENT,
p_desc VARCHAR(30) UNIQUE,
parent_p_id INT,
mgr_id INT ,
FOREIGN KEY (mgr_id) REFERENCES consultant(c_id)

) ENGINE = InnoDB;

ALTER TABLE project(
FOREIGN KEY (parent_p_id) REFERENCES project(p_id)
)ENGINE = InnoDB;;

CREATE TABLE project_consultant (
p_id INT,
c_id INT,
roll_on_date DATE,
roll_off_date DATE,
PRIMARY KEY (p_id,c_id),
FOREIGN KEY (p_id) REFERENCES project(p_id),
FOREIGN KEY (c_id) REFERENCES consultant(c_id)
) ENGINE = InnoDB;

CREATE TABLE work_on (
    p_id INT,
    c_id INT,
    PRIMARY KEY (p_id,c_id),
    FOREIGN KEY (p_id) REFERENCES project(p_id),
    FOREIGN KEY (c_id) REFERENCES consultant(c_id)
)ENGINE = InnoDB;

INSERT INTO consultant ( c_last, c_first, c_dob, c_email)
VALUES ('Myers', 'Mark', '1968/5/5', 'email mmyers@swexpert.com'),
('Zhang', 'Brian', '1968/8/8', 'email zhang@swexpert.com' ),
('Carlson', 'Sarah', '1981/12/14',' email carlsons@swexpert.com'),
('Park', 'Janet', '1986/3/23', ' email jpark@swexpert.com');

INSERT INTO project (p_desc, parent_p_id, mgr_id )
VALUES ('Hardware Support Intranet ', null, 1 ),
('Hardware Support Interface', 1, 1 ),
('Hardware Support Database', 2,1 ),
('Teller Support System', null, 4),
('Interent Advertising', 1,1),
('Network Desgin', 1,1),
('Exploration Database', null, null);

INSERT INTO project (p_desc, parent_p_id, mgr_id )
VALUES ('System Admin', 1, null),
('Database Sync ',3,4),
('Machine Learning',null,2);

UPDATE consultant 
SET email ='scarlson@gmail.com'
WHERE c_first = 'Sarah';

UPDATE project
SET mgr_id = 2
WHERE p_id = 7;

DELETE FROM project 
WHERE p_desc= 'Hardware Support Interface';

DELETE FROM project
WHERE p_desc = 'Network Design';

DELETE FROM 
SET parent_p_id = null 
WHERE p_desc = 'Teller Support System';

CREATE VIEW [consultant_project_data] AS 
SELECT c_last, p_desc 
FROM project LEFT OUTER JOIN consultant
WHERE project.mgr_id = consultant.c_id










