
-- create
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    math_score INT,
    science_score INT,
    english_score INT
);

-- insert
INSERT INTO Students (student_id, name, math_score, science_score, english_score) VALUES
(1, 'Ali', 85, 90, 80),
(2, 'Bob', 78, 85, 88),
(3, 'Charlie', 95, 92, 94),
(4, 'David', 60, 75, 70),
(5, 'Emma', 89, 88, 84),
(6, 'Frank', 76, 80, 79),
(7, 'Grace', 91, 95, 97),
(8, 'Harry', 84, 78, 81);

-- display
SELECT* FROM Students;

-- Task 1: Identify Top Students by Total Scores
SELECT name, 
       (math_score + science_score + english_score) AS total_score
FROM Students
ORDER BY total_score DESC
LIMIT 5;

-- Task 2: Calculate Averages Based on Specific Conditions
-- (a) Average Score of Students Who Scored Above 70 in Math
SELECT AVG(math_score) AS average_math_score
FROM Students
WHERE math_score > 70;

-- (b) Average Total Score of Students Grouped by Score Range (200-250)
SELECT AVG(total_score) AS average_total_score
FROM (
    SELECT student_id, (math_score + science_score + english_score) AS total_score
    FROM Students
) AS subquery
WHERE total_score BETWEEN 200 AND 250;

-- Task 3: Find the Second-Highest Math Score
SELECT MAX(math_score) AS second_highest_math_score
FROM Students
WHERE math_score < (SELECT MAX(math_score) FROM Students);

