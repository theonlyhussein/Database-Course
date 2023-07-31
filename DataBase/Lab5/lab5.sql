-- Query 1
SELECT room, COUNT(course_section.loc_id)
FROM course_section RIGHT OUTER JOIN location USING (loc_id)
GROUP BY room;

--Query 2
INSERT INTO course_section 
VALUES (16, 3, 6, 1, 2, 'MTWRF', '0000-00-00','0 00:01:30.00', NULL, 35);

DELETE from course_section
where c_sec_id =16;

SELECT f_last, bldg_code, room , c_sec_id
FROM faculty  JOIN course_section USING (f_id)
              RIGHT  OUTER JOIN location ON location.loc_id = course_section.loc_id;

--Query 3
INSERT INTO course_section 
VALUES (17, 3, 6, 1, null, 'MTWRF', '0000-00-00','0 00:01:30.00', NULL, 35);

SELECT f_last, bldg_code, room , c_sec_id
FROM faculty RIGHT OUTER  JOIN course_section USING (f_id)
             RIGHT  OUTER JOIN location ON location.loc_id = course_section.loc_id;

--Query 4
SELECT c_sec_id, COUNT(s_id)
FROM  student LEFT OUTER JOIN enrollment USING (s_id) 
              RIGHT OUTER JOIN course_section USING (c_sec_id)
GROUP BY c_sec_id;

--Query 5
SELECT term_desc,  COUNT(c_sec_id)
FROM term LEFT OUTER JOIN course_section USING (term_id)
GROUP BY term_desc;

--Query 6
SELECT term_desc,  COUNT(c_sec_id)
FROM course_section RIGHT OUTER JOIN term USING (term_id)
GROUP BY term_desc;

--Query 7
SELECT term_id , term_desc, max_enrl
FROM term JOIN course_section USING (term_id);

--Query 8
SELECT term_id , term_desc, max_enrl
FROM term LEFT OUTER JOIN course_section USING (term_id);

--Query 9
SELECT term_id , term_desc, SUM(max_enrl)
FROM term LEFT OUTER JOIN course_section USING (term_id)
GROUP BY term_desc
HAVING SUM(max_enrl)<200 
OR SUM(max_enrl) IS NULL;

--Query 10
SELECT f_last
from faculty
WHERE f_id IN (SELECT f_id
              FROM course_section
              WHERE term_id IN (SELECT term_id
                               FROM term
                               WHERE term_desc="Summer 2007"));

--Query 11
SELECT c_sec_day, loc_id
FROM course_section
WHERE course_id IN (SELECT course_id
                    FROM course
                    WHERE course_name = 'Database Management')
AND term_id IN (SELECT term_id
                FROM term
                WHERE status = "OPEN");

--Query 12
SELECT f_id
FROM faculty
WHERE f_id IN (SELECT f_id
              FROM student
              WHERE  f_first = s_first
              AND f_last = s_last);

--Query 13
SELECT c_sec_id, max_enrl
FROM course_section
WHERE max_enrl IN (SELECT max_enrl
                   FROM course_section
                   HAVING MAX(max_enrl) = max_enrl);

--Query 14
SELECT c_sec_id, max_enrl
FROM course_section
WHERE max_enrl NOT IN  (SELECT max_enrl
                   FROM course_section
                   HAVING MAX(max_enrl) = max_enrl);

--Query 15
SELECT c_sec_id
FROM course_section
WHERE max_enrl IN (SELECT max_enrl
                   FROM course_section
                   HAVING max_enrl < AVG(max_enrl));

--Query 16
SELECT grade -- I dont how to retrieve term id with out using JION
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

--Query 17
SELECT course_name, course_id
FROM course
WHERE course_id IN (SELECT preq
                     FROM course);

--Query 18
SELECT term_desc
FROM term 
WHERE term_id NOT IN (SELECT term_id
                     FROM course_section);

--Query 19
SELECT term_desc
FROM term  LEFT OUTER  JOIN  course_section USING (term_id)
WHERE  course_section.term_id IS NULL;

--Query 20
-- I  do not know who to do this 