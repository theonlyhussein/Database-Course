-- AS is for column alias
SELECT max_enrl+10 AS estimate
FROM course_section
WHERE estimate > 100;

SELECT f_last AS LAST_NAME
FROM faculty
WHERE f_last LIKE 'Cox';

--sorting is done using the ORDER BY clause
SELECT f_last AS LAST_NAME
FROM faculty
ORDER BY f_last;

SELECT f_last AS LAST_NAME
FROM faculty
ORDER BY f_first;

SELECT f_last AS LAST_NAME
FROM faculty
ORDER BY  LAST_NAME;

SELECT f_last AS LAST_NAME
FROM faculty
ORDER BY  LAST_NAME DESC;

SELECT f_last AS LAST_NAME, f_first
FROM faculty
ORDER BY  LAST_NAME DESC, f_first; -- DESC (descending order)

SELECT f_last AS LAST_NAME, f_first
FROM faculty
ORDER BY 1;

SELECT f_last AS LAST_NAME, f_first
FROM faculty
ORDER BY 2;

------------------------------------------------------

--GROUPing queries 

-- COUNT, SUM, MAX, MIN, AVG (other group functions)
-- Retrive all differrent course_id that are scheduled in the crouse section table.
SELECT course_id
FROM course_section
GROUP BY course_id;

SELECT course_id, COUNT(*)
FROM course_section
GROUP BY course_id;

--ERROR - this is the wrong aggreation display
-- it may not make sense , but it still shows you a result
SELECT  term_id, COUNT(*)
FROM course_section
GROUP BY course_id;

-- Having well not work without GROUP BY
-- Having clause elimates groups!
SELECT  course_id, COUNT(*)
FROM course_section
GROUP BY course_id
HAVING course_id < 3;

-- faster !!!!!!!!!!!!!! query optimizer
SELECT  course_id, COUNT(*)
FROM course_section
WHERE course_id <3
GROUP BY course_id;

SELECT  course_id, COUNT(*)
FROM course_section
GROUP BY course_id
HAVING COUNT(*) <= 3;

-- WHERE and HAVING 
-- WHERE elimnanates raw data from the table; while HAVING elimanates groups.
-- WHERE can exucute independantly , while HAVING executes with a GROUP BY clause
-- WHERE Cannot use group functions , but HAVING can use group functions (COUNT , MIN, MAX, AVG, SUM)
-- Can not use HAVING clause with a WHERE clause





