-- Query 1
SELECT DISTINCT student.f_id , f_first, f_last
FROM  student , faculty
WHERE student.f_id = faculty.f_id;

-- Query 2
SELECT f_first, f_last, COUNT(*) AS "Number of students being advised"
FROM student , faculty
WHERE student.f_id = faculty.f_id
GROUP BY student.f_id; 

-- Query 3
SELECT f_last, max_enrl
FROM faculty, course_section
WHERE course_section.f_id = faculty.f_id;

-- Query 4 
-- a)
SELECT course_section.course_id , course_name ,c_sec_id ,max_enrl
FROM  course_section JOIN course  ON course_section.course_id = course.course_id;
-- b)
SELECT course_section.course_id , course_name ,c_sec_id ,max_enrl
FROM  course_section JOIN course  USING (course_id);

-- Query 5
SELECT course_section.course_id , course_name  ,SUM(max_enrl) 
FROM  course_section JOIN course  USING (course_id)
GROUP BY course_name;

-- Query 6
SELECT course_section.course_id , course_name  ,SUM(max_enrl)
FROM  course_section JOIN course  USING (course_id)
GROUP BY course_name
HAVING SUM(max_enrl) > 200;

-- Query 7
SELECT  course_section.loc_id , bldg_code , room 
FROM course_section , location
WHERE course_section.loc_id = location.loc_id
ORDER BY course_section.loc_id ;

-- Query 8
SELECT  course_section.c_sec_id,  f_last , term_desc, room 
FROM  faculty JOIN course_section ON course_section.f_id = faculty.f_id
              JOIN term ON course_section.term_id = term.term_id
              JOIN location ON course_section.loc_id = location.loc_id;

-- Query 9
-- I  have no idea this question is asking i looked at the former data base and 
-- it had 13 sections same thing with new data base with the preq

-- Query 10 
SELECT c.course_name AS "Course Name", p.course_name AS "Prereq"
FROM course c, course p
WHERE c.preq = p.course_id;

-- Query 11
SELECT f_first , f_last
FROM faculty
WHERE f_rank = "ASSO"
AND  f_id != 1;

-- Query 12
SELECT s_last
FROM student , faculty
WHERE faculty.f_id = student.f_id
AND student.f_id = 1 
AND s_id != 1;