--Description: Use of subqueries to insert data into another table.

-- ! Requirements:
-- * There is a need of a report where we have list of exam attempts
-- * which are above average (score > average class score)
-- * Also include name of the student in the report


--Table in which data needs to be inserted.
CREATE TABLE high_scorers_report (
    id SERIAL PRIMARY KEY,
    student_id INT NOT NULL,
    student_name VARCHAR(50) NOT NULL,
    subject VARCHAR(30) NOT NULL,
    score INT NOT NULL,
    archived_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--Query to insert data into newly formed report. Note: values are not still assigned.
INSERT INTO high_scorers_report(
    student_id,
    student_name,
    subject, 
    score
);

-- Query to find relevant data that would be feed into the high_scores_report.
SELECT 
    s.student_id,
    s.name,
    e.subject,
    e.score
FROM exam_scores as e
INNER JOIN students as s on s.student_id = e.student_id
WHERE e.score>(
    SELECT AVG(score) from exam_scores
);

--FinalQuery: combine above insert and select queries :
INSERT INTO high_scorers_report(
    student_id,
    student_name,
    subject, 
    score
)
SELECT   -- Rule : what order is followed in the insert query i.e(student_id, student_name, subject, score) should be followed in 
         -- select query in order to properly insert the data into the newly created high_score_exam table.
    s.student_id,
    s.name,
    e.subject,
    e.score
FROM exam_scores as e
INNER JOIN students as s on s.student_id = e.student_id
WHERE e.score>(
    SELECT AVG(score) from exam_scores
);

--check the newly created table:
select * from high_scorers_report;