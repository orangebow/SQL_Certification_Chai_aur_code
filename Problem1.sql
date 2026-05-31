--Problem Statement: Find the student(s) who scored more than the class average score.
--solution:
--1. This is just a simple query to find out the average of the class.
SELECT AVG(score) as class_average FROM exam_scores;

--2. Preparing the table that will show students who have score greater than or equal to average scores.

SELECT 
s.name as student_name,
s.branch as student_branch,
e.score
FROM exam_scores as e
INNER JOIN students as s on s.student_id = e.student_id -- this is table we prepared on which nested queried will be performed

WHERE e.score > ( -- nested queries : these are calculated on the go that is they are dynamic. NOTE: Values from step one cannot be hardcoded as e.score>75 
                  --because whenever a new insert operation will be performed this data may change
   SELECT AVG(score) as class_average FROM exam_scores
);


--To find the student who have scored less than below average.

SELECT 
s.name as student_name,
s.branch as student_branch,
e.score
FROM exam_scores as e
INNER JOIN students as s on s.student_id = e.student_id -- this is table we prepared on which nested queried will be performed

WHERE e.score < ( -- nested queries : these are calculated on the go that is they are dynamic. NOTE: Values from step one cannot be hardcoded as e.score>75 
                  --because whenever a new insert operation will be performed this data may change
   SELECT AVG(score) as class_average FROM exam_scores
);