--Description: This will help us to understand use of queries inside the inner join

--Requirements:
-- * For each project get student'name , branch, project marks,
-- * and their average exam score on the same row

--Temporary table:
SELECT 
    student_id,
    AVG(score) as avg_score
FROM exam_scores
GROUP BY student_id;

--InnerJoinQuery:
SELECT
    s.name,
    s.branch,
    p.title,
    p.marks
FROM projects AS p
INNER JOIN  students as s ON s.student_id = p.student_id

--Using our temporary table with INNER JOIN.
SELECT
    s.name,
    s.branch,
    p.title,
    p.marks,
    exam_avg.avg_score
FROM projects AS p
INNER JOIN  students as s ON s.student_id = p.student_id
INNER JOIN ( -- dynamic requirement necessiates the use of temporary table
SELECT 
    student_id,
    AVG(score) as avg_score
FROM exam_scores
GROUP BY student_id
) as exam_avg ON exam_avg.student_id = p.student_id;




