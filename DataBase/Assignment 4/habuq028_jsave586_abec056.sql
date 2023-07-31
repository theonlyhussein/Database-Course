-- ====================================================================
-- Authors:        <Justin Savenko, Hussein Abuqadous, Austin Bec>
-- Create date:   <April 8, 2022 >
-- Description:   <Assignment 4>
-- ====================================================================
 
--Query 1
SELECT COUNT(student_id)
FROM enrollment
WHERE student_id IN (SELECT student_id
                     FROM student)
AND enroll_date >= '1999-02-21';
 
-- Query 2a
SELECT first_name, last_name
FROM student
WHERE student_id IN (SELECT student_id
                    FROM enrollment
                    WHERE enroll_date >= '1999-02-21');
 
-- Query 2b
SELECT DISTINCT first_name, last_name
FROM student JOIN enrollment USING (student_id)
WHERE enroll_date >= '1999-02-21';
 
--Query 3
SELECT section.section_id, capacity
FROM section JOIN  enrollment USING(section_id)
GROUP BY section.section_id
HAVING count(student_id) = capacity;
 
--Query 4
SELECT  (SELECT  COUNT(student_id)
        FROM student) - (SELECT  COUNT(distinct student_id)
                        FROM enrollment) AS number_unregisted_student;
 
--Supporting Queries for 4
SELECT  (SELECT  COUNT(student_id)
        FROM enrollment) - (SELECT  COUNT(distinct student_id)
                            FROM enrollment) AS duplicate_StudentID_Enrollment_table;
 
SELECT COUNT(distinct student_id)
FROM enrollment;
 
SELECT  (SELECT  COUNT(distinct student_id)
        FROM enrollment) + (SELECT  COUNT(student_id)
                            FROM enrollment) - (SELECT  COUNT(distinct student_id)
                                                FROM enrollment) AS total_enrollment_rows;
 
--Query 5a
SELECT DISTINCT student_id
FROM student
WHERE student_id NOT IN (SELECT s.student_id FROM student s INNER JOIN enrollment e ON s.student_id = e.student_id)
                        ORDER BY student_id;
 
--Query 5b
SELECT s.student_id
FROM student s LEFT JOIN enrollment e ON s.student_id = e.student_id
WHERE e.student_id IS NULL
ORDER BY s.student_id;
 
 
--Query 6a
SELECT c.course_no , c.description, p.course_no AS "prerequisite", p.description AS "prerequisite description"
FROM course c LEFT OUTER JOIN course p ON c.prerequisite = p.course_no
ORDER BY course_no;
 
--Query 6b
SELECT c.course_no , c.description, p.course_no AS "prerequisite", p.description AS "prerequisite description"
FROM course c , course p
WHERE c.prerequisite = p.course_no
UNION
SELECT c.course_no , c.description, p.course_no AS "prerequisite", p.description AS "prerequisite description"
FROM course c LEFT OUTER JOIN course p ON c.prerequisite = p.course_no
WHERE p.course_no IS NULL
ORDER BY course_no;
 
-- Query 7
SELECT "-" AS Operation, description, (cost * 0.85) AS projected_price FROM course 
WHERE cost > 1500
UNION
SELECT "+" AS Operation, description, (cost * 1.05) AS projected_price FROM course 
WHERE cost < 1500
ORDER BY projected_price desc;
