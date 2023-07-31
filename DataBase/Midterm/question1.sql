--query 1
SELECT c_frist , c_last, COUNT(skill_id)
FROM consultant, consultant_skill
WHERE consultant.c_id = consultant_skill.c_id
GROUP BY consultant_skill.c_id
HAVING COUNT(skill_id)>3;

--query 2
SELECT skill_description
FROM project , skill, project_skill
WHERE project.p_id = project_skill.p_id
AND skill.skill_id = project_skill.skill_id
AND skill_description LIKE = "%Support%"
ORDER BY skill_description DESC;

--query 3
SELECT p_id, project_name
FROM project
WHERE parent_p_id IS NULL;

--query 4
SELECT c_last ,evaluator_id, c_last,  evaluatee_id ,score
FROM consultant, evaluation
WHERE consultant.c_id =  evaluation.evaluatee_id 
AND consultant.c_id = evaluation.evaluator_id;
