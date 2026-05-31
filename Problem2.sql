--Problem : There is going to happen a placement drive and college need to select student fullfiling following criteria.
-- ! Criteria for the placement:
-- ? 1. At least one exam attempt have score greater than or equal to 90
-- * AND
-- ? 2. Any of their projects should have marks greater than or equal to 85 

--Solution:

--Query for condition 1,
SELECT * FROM exam_scores WHERE score >= 90;

--Query for condition 2,
SELECT * FROM projects WHERE marks >= 85;

--Final query:
SELECT s.student_id, s.name, s.branch FROM students as s
WHERE student_id IN (
    SELECT s.student_id FROM exam_scores WHERE score >=90
) AND
s.student_id IN (
    SELECT student_id FROM projects WHERE marks >=85
);