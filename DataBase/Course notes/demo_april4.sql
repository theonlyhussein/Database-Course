--Views
-- a view is a stored query !!!
-- a view is a virtual table !!!
-- a view affects the data dictionary !!! therefore , it is part of DDL
-- a view does not store the data - it only stored the query and excutes the query to produce the data when run
CREATE OR REPLACE  VIEW sample AS 
SELECT f_last 
FROM faculty
WHERE f_id IN (SELECT f_id
               FROM course_section
               WHERE term_id IN (SELECT term_id
                                 FROM term 
                                 WHERE term_desc = 'Summer 2007' ));

SELECT *
FROM sample ;

-- Union
SELECT f_last 
FROM faculty
UNION 
SELECT s_last 
FROM student;