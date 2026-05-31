--? Requirement:
-- ! we need to have total scores student has earned 
-- ! and number of exams student has attempted.

-- we also need to have student's name and branch in the result

--Solution:
--Making a Temporary table that can be used in another query.
SELECT
student_id,
SUM(score) as total_score,
Count(*) as number_of_attempts
FROM exam_scores
GROUP BY student_id;

--Final QuerY:
SELECT 
s.name,
s.branch,
total_stats.total_score,
total_stats.number_of_attempts
FROM (
SELECT
student_id,
SUM(score) as total_score,
Count(*) as number_of_attempts
FROM exam_scores
GROUP BY student_id
) as total_stats
INNER JOIN students as s ON s.student_id = total_stats.student_id
-- formatting purpose not the part of the logic
ORDER BY total_stats.total_score DESC;