-- Retrieve the faculty id, and show the number of students they are advising.

SELECT faculty.f_id, COUNT(student.f_id)
FROM faculty JOIN student USING (f_id)
GROUP BY faculty.f_id;

-- OUTER JOIN 
-- Retrieve the faculty id, and show the number of students they are advising.
-- Include also those faculty IDs who are NOT advisors in the result.


SELECT faculty.f_id, COUNT(student.f_id)
FROM faculty LEFT OUTER JOIN student USING (f_id)
GROUP BY faculty.f_id;

SELECT faculty.f_id, COUNT(student.f_id)
FROM student RIGHT OUTER JOIN faculty USING (f_id)
GROUP BY faculty.f_id;


SELECT faculty.f_id, COUNT(student.f_id)
FROM faculty RIGHT OUTER JOIN student USING (f_id)
GROUP BY faculty.f_id;


-- Retrieve all room numbers and the building code of all course sections and show the faculty last name 
-- of those faculty that are scheduled to teach that section. 
--Include also those course sections that have NOT been scheduled in a location yet. 

SELECT room, bldg_code, f_last, c_sec_id
FROM course_section INNER JOIN faculty USING(f_id)
                    LEFT OUTER JOIN location ON course_section.loc_id = location.loc_id
ORDER BY c_sec_id;

INSERT INTO course_section VALUES
	(14, 1, 4, 1, 3, 'MWF', '0000-00-00', '1800', NULL, 200);


-- Retrieve all room numbers and the building code of all course sections
--and show the faculty last name of those faculty that are scheduled to teach that section. 
--Include also those course sections that have NOT been scheduled in a location yet.
-- Include also those course sections that do NOT have a faculty scheduled to teach yet.  


SELECT room, bldg_code, f_last, c_sec_id
FROM course_section LEFT OUTER JOIN faculty USING(f_id)
                    LEFT OUTER JOIN location ON course_section.loc_id = location.loc_id
ORDER BY c_sec_id;


-- subqueries 
-- outer query and inner query 

-- queries can be written as a subquery instead of a join 

-- Retrieve all faculty IDs that are advisors. 

-- 1 *************
SELECT f_id 
FROM student;

--2 
SELECT f_id 
FROM faculty;

-- Retrieve all faculty IDs and their first and last names of those faculty that are advisors. 

SELECT f_last, f_first, student.f_id
FROM faculty JOIN student USING(f_id)
GROUP BY faculty.f_id;

-- sets do not have duplicates!!!!
SELECT f_last, f_first, f_id
FROM faculty 
WHERE f_id IN (SELECT f_id 
                FROM student);


--- TWO different ways!!!

SELECT faculty.f_id, COUNT(student.f_id)
FROM faculty LEFT OUTER JOIN student USING (f_id)
GROUP BY faculty.f_id;

SELECT f_last, f_first, student.f_id, COUNT(*)
FROM faculty JOIN student USING(f_id)
GROUP BY faculty.f_id
UNION
SELECT f_last, f_first, f_id, 0
FROM faculty 
WHERE f_id NOT IN (SELECT f_id 
                FROM student);

-- the select columns are not from the outer FROM table. 

SELECT f_last, f_first, f_id
FROM faculty 
WHERE f_id IN (SELECT f_id 
                FROM student);

-- Retrieve the last name of all faculty who teach during the Summer 2007 term. 
-- write using subquery 

-- nested sub-query 
SELECT f_last 
FROM faculty
WHERE f_id IN (SELECT f_id
               FROM course_section
               WHERE term_id IN (SELECT term_id
                                 FROM term 
                                 WHERE term_desc = 'Summer 2007' ));

-- multiple subquery 
