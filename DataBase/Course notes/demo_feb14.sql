--Retrieve the f_id of those faculty who are advisors
SELECT DIStINCT f_id
FROM student;

SELECT f_id
FROM student
GROUP by f_id;

--Retrieve the faculty last name and frist name of those faculty who are advisors
-- JOIN tables!

SELECT f_id ,f_last , f_first
FROM faculty;

--traditional JOIN ","
--cartisian product results!
-- qualifer "."
-- you need a WHERE clause to aviod the carteisan product
SELECT faculty.f_id as FAC_FID , student.f_id as STU_FID, f_first, f_last
FROM faculty, student
WHERE faculty.f_id = student.f_id; 

--solution 1
SELECT DISTINCT faculty.f_id , f_first, f_last
FROM faculty, student
WHERE faculty.f_id = student.f_id; 

--solution 2
SELECT  faculty.f_id , f_first, f_last
FROM faculty, student
WHERE faculty.f_id = student.f_id
GROUP BY student.f_id; 

-- you can use additional conditions along with the cartisian product avoidance 
SELECT  faculty.f_id , f_first, f_last
FROM faculty, student
WHERE faculty.f_id = student.f_id
AND f_last = "Cox";

SELECT  faculty.f_id , f_first, f_last
FROM faculty, student
WHERE faculty.f_id = student.f_id
AND f_last = "Cox";


-- you have access to data from both tables in the FROM clause
SELECT  faculty.f_id , f_first, f_last
FROM faculty, student
WHERE faculty.f_id = student.f_id
AND f_last = "Cox"
AND student.s_class = 'SR';

--Retrieve all course sections that are scheduled in "Summer 2007" term. Also, display 
--the faculty last and frist name of the person  who is teaching it.

-- Option 1 
SELECT  course_section.c_sec_id, f_first, f_last
FROM term, course_section, faculty
WHERE course_section.f_id = faculty.f_id
AND course_section.term_id = term.term_id
AND term.term_desc = "Summer 2007";


-- JOIN operator (instead of the "," operator)
-- option 2 ** column names HAVE TO BE the same in both tables 
SELECT  course_section.c_sec_id, f_first, f_last
FROM  faculty JOIN course_section USING(f_id)
              JOIN term USING (term_id)
WHERE  term_desc = "Summer 2007";




