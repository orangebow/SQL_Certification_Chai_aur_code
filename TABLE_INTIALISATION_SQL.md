CREATE TABLE students (
student_id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL,
branch VARCHAR(30) NOT NULL
);

CREATE TABLE exam_scores (
score_id   SERIAL PRIMARY KEY,
student_id INT NOT NULL REFERENCES students (student_id),
subject VARCHAR(30) NOT NULL,
score   INT NOT NULL CHECK (score BETWEEN 0 AND 100),
exam_month VARCHAR(7) NOT NULL
);

CREATE TABLE projects (
project_id INT NOT NULL REFERENCES students (student_id),
student_id VARCHAR(80) NOT NULL,
title INT NOT NULL CHECK (marks BETWEEN 0 AND 100)
marks SERIAL PRIMARY KEY
);




Sample data:
 INSERT INTO students (name, branch) VALUES
-- ('Rahul', 'CS'),
-- ('Sneha', 'CS'),
-- ('Amit', 'IT'),
-- ('Priya', 'IT'),
-- ('Rohan', 'CS'),
-- ('Kavya', 'IT'),
-- ('Arjun', 'CS'),
-- ('Divya', 'IT');



-- INSERT INTO exam_scores (student_id, subject, score, exam_month) VALUES
-- (1, 'Math', 62, '2024-07'),
-- (1, 'SQL', 70, '2024-08'),
-- (1, 'Math', 72, '2024-09'),
-- (1, 'SQL', 88, '2024-09'),
-- (1, 'English', 65, '2024-10'),
-- (2, 'Math', 88, '2024-07'),
-- (2, 'SQL', 92, '2024-08'),
-- (2, 'Math', 91, '2024-09'),
-- (2, 'SQL', 95, '2024-09'),
-- (2, 'English', 78, '2024-10'),
-- (3, 'Math', 48, '2024-07'),
-- (3, 'SQL', 55, '2024-08'),
-- (3, 'Math', 55, '2024-09'),
-- (3, 'SQL', 60, '2024-09'),
-- (3, 'English', 70, '2024-10'),
-- (4, 'Math', 75, '2024-08'),
-- (4, 'SQL', 80, '2024-09'),
-- (4, 'SQL', 85, '2024-10'),
-- (4, 'English', 90, '2024-10'),
-- (6, 'Math', 70, '2024-09'),
-- (6, 'SQL', 78, '2024-10'),
-- (7, 'Math', 82, '2024-09'),
-- (7, 'SQL', 86, '2024-10'),
-- (8, 'Math', 68, '2024-09'),
-- (8, 'English', 72, '2024-10');

INSERT INTO projects (student_id, title, marks) VALUES
(1, 'Todo App in React', 78),
(2, 'E-commerce API', 96),
(3, 'Attendance Tracker', 72),
(4, 'Portfolio Website', 88),
(6, 'Blog CMS', 81),
(7, 'Chat App with WebSockets', 90);



