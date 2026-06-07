SELECT 
e.subject,
SUM(e.score) AS subject_total
from exam_scores as e
GROUP BY e.subject;

---! Window function:
SELECT 
*,
SUM(e.score) OVER(PARTITION BY e.subject) AS Subject_total --"OVER" is a window function htat creates a window over "subject" in this case.
From exam_scores as e;
