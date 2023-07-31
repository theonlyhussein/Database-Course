SELECT *           -- wild card *
FROM faculty;

SELECT f_last, f_first
FROM faculty;   

SELECT f_last, f_first       -- projection / columns
FROM faculty
WHERE f_rank = "FULL";       -- WHERE clause - selection/rows

SELECT DISTINCT bldg_code
FROM location;    

SELECT DISTINCT bldg_code, capacity
FROM location;

/* multi line comment
 **********/

 -- single line comment
 -- group functions

SELECT COUNT(*)
FROM enrollment;

SELECT COUNT(s_id)
FROM enrollment;

SELECT COUNT(grade)
FROM enrollment;

-- NULL versus NOT NULL

-- NULL is a value! that holds NO value

SELECT *
FROM enrollment
WHERE grade IS NULL;

SELECT *
FROM enrollment
WHERE grade IS NOT NULL;

-- Retrieve all enrollments that have a grade. 
SELECT *
FROM enrollment
WHERE grade IS NOT NULL;

-- SUM, MAX, MIN, AVG (other group functions)

SELECT SUM(max_enrl)
FROM course_section;

SELECT COUNT(max_enrl)
FROM course_section;


SELECT MAX(max_enrl), MIN(max_enrl), AVG(max_enrl)
FROM course_section;

-- BETWEEN operator - for values within a certain range

-- Retrieve all students that are born in 1986.

SELECT * 
FROM student
WHERE s_dob >= '1986-01-01' AND 
s_dob <= '1986-12-31';

SELECT * 
FROM student
WHERE s_dob BETWEEN '1986-01-01' AND '1986-12-31';

-- Retrieve the students who are NOT born in 1986.
SELECT * 
FROM student
WHERE s_dob NOT BETWEEN '1986-01-01' AND '1986-12-31';


-- LIKE operator - mainly used for strings patterns
-- wild cards % _ 
-- % 0 or many characters are substitued 
-- _ one and only character is substituted
-- NOT LIKE

SELECT s_last
FROM student
WHERE s_last = 'Connoly' OR s_last = 'Mobley';

SELECT s_last
FROM student
WHERE s_last LIKE '%y';


SELECT s_last
FROM student
WHERE s_last LIKE 'M%';

SELECT s_last
FROM student
WHERE s_last LIKE 'M%y';

SELECT s_last
FROM student
WHERE s_last LIKE '%o%';

SELECT s_last
FROM student
WHERE s_last NOT LIKE '%o%';

SELECT s_last
FROM student
WHERE s_last LIKE 'Mille_';

-- IN operator -- deals with sets 

-- Retrieve all student enrollments that recieved an 'A' grade or a 'C' grade.

SELECT *
FROM enrollment
WHERE grade = 'A' OR 
grade = 'C';

SELECT *
FROM enrollment
WHERE grade IN ('A','C');

SELECT *
FROM enrollment
WHERE grade NOT IN ('A','C');

-- WHERE clause complex condtional operators 
-- arithmetic operators  + / * - 
-- comparision = != <> >= <= > < 
-- logical AND OR NOT

-- example for forcasting using an arithmetic operator - here + adding
select max_enrl+10  from course_section;