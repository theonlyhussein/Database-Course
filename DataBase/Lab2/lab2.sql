
-- Request 1: 
SELECT f_first, f_last
FROM faculty
WHERE f_rank="FULL";

--Another Way
SELECT  f_first, f_last
FROM faculty
WHERE f_rank LIKE '%U%';

--Request 3:
SELECT  DISTINCT s_class
FROM student;

--Request 4:
SELECT * 
FROM student
WHERE s_dob >= '1985-01-01' AND 
s_dob <= '1985-12-31';

--Another Way:
SELECT * 
FROM student
WHERE s_dob BETWEEN '1985-01-01' AND '1985-12-31';

--Request 6:
SELECT *
FROM student
WHERE s_mi IS NOT NULL;

--Request 7:
SELECT s_id, grade
FROM enrollment
WHERE grade is NULL;

--Request 8:
SELECT DISTINCT f_ID
FROM student;

--Another way:
SELECT  DISTINCT f_ID
FROM student;

--Request 10:
SELECT DISTINCT loc_id
FROM faculty;

--Request 11:
SELECT DISTINCT loc_id
FROM course_section;

--Request 12:
SELECT *
FROM course_section
WHERE  c_sec_day NOT LIKE ('%W%');

--Request 13:
SELECT *
FROM course_section
WHERE  c_sec_day NOT LIKE '%W%' OR'%F%' ;

--Request 14:
SELECT MAX(max_enrl)
FROM course_section
WHERE term_id = 6;

--Request 15:
SELECT c_sec_id, grade
FROM enrollment
WHERE grade = 'B' AND c_sec_id = 6 ;

--Request 16:
SELECT f_id , COUNT(f_id) AS NUMBER_OF_STUDENTS
FROM student
GROUP BY f_id;

--Request 17:
SELECT *
FROM enrollment
WHERE grade IS  NULL OR grade = 'C';

--Request 18:
SELECT loc_id , COUNT(loc_id) AS NUMBER_OF_SECTIONS
FROM course_section
GROUP BY loc_id DESC;

--Another Way:
SELECT loc_id , COUNT(loc_id) AS NUMBER_OF_SECTIONS
FROM course_section
GROUP BY loc_id DESC
HAVING  COUNT(loc_id)>3;










