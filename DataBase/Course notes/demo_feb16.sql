-- On caluse circumvents the problem from the USING clause
SELECT  course_section.c_sec_id, f_first, f_last
FROM  faculty JOIN course_section ON course_section.f_id = faculty.f_id
              JOIN term ON course_section.term_id = term.term_id
WHERE  term_desc = "Summer 2007";

-- Retrieve the students last name along with thier advisors last and frist name.
SELECT s_last, f_last as ADV_LAST, f_first as ADV_FIRST
FROM faculty JOIN student USING (f_id);

--Retrieve the  course  id and the course name of every course with its prerequisite
-- self join (uses table aliases)
SELECT  c.course_id   AS "ID"
       ,c.course_name AS "Name"
       ,p.course_id   AS "Prereq ID"
       ,p.course_name AS "Prereq"
FROM course c, course p
WHERE c.preq = p.course_id;


