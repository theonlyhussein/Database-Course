-- multiple subquery ..


-- List the course sections,day and location of the course "Database Management"
-- during the OPEN terms. Write this using a sub query.

-- JOIN way 
SELECT c_sec_id, c_sec_day, loc_id 
FROM course_section, course, term 
WHERE course_section.course_id = course.course_id
AND course_section.term_id = term.term_id
AND course_name LIKE "Database Management"
AND status LIKE "OPEN"
ORDER BY c_sec_id;

-- subquery way! 
-- find the PATH 
-- multiple sub query

SELECT c_sec_id, c_sec_day, loc_id 
FROM course_section
WHERE course_id IN (SELECT course_id
                    FROM course
                    WHERE course_name LIKE "Database Management")
AND term_id IN (SELECT term_id
                FROM term 
                WHERE status LIKE "OPEN");

-- Display the grade AND section ID values 
-- for the student Sarah Miller's System Analysis course. 
-- Write this using a sub-query! 

SELECT grade, c_sec_id
FROM enrollment
WHERE s_id IN (SELECT s_id
                FROM student
                WHERE s_first = 'Sarah'
                AND s_last = 'Miller')
AND c_sec_id IN (SELECT c_sec_id 
                FROM course_section
                WHERE course_id IN (SELECT course_id
                                    FROM course
                                    WHERE course_name = 'Systems Analysis'));

--Display those faculty IDs who have a similar name (first, last) as a another faculty member.

SELECT f_id
FROM faculty
WHERE f_last IN (SELECT f_last
              FROM faculty)
AND f_first IN (SELECT f_first
              FROM faculty)
AND f_id NOT IN (SELECT f_id
                 FROM faculty);


SELECT f_id
FROM faculty
WHERE (f_last, f_first) IN (SELECT f_last, f_first
              FROM faculty)
AND f_id NOT IN (SELECT f_id
                 FROM faculty);

--Display those faculty IDs who have a similar name (first, last) as a student.
-- is always is compared in ORDER and in TYPE
SELECT f_id
FROM faculty
WHERE (f_last, f_first) IN (SELECT s_first, s_last
                            FROM student);



-- combining subquery with a JOIN 
SELECT f_last, max_enrl
FROM faculty, course_section
WHERE course_section.f_id = faculty.f_id
AND course_section.term_id IN (SELECT term_id
                               FROM term);

