
-- create students table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);
-- Create scores table
CREATE TABLE scores (
    student_id INT,
    subject VARCHAR(50),
    score INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- Insert data into students table
INSERT INTO students (student_id, name) VALUES
(1, 'Akshaya'),
(2, 'Balu'),
(3, 'Chaitra'),
(4, 'Dhana'),
(5, 'Eshwari');

-- Insert data into scores table
INSERT INTO scores (student_id, subject, score) VALUES
(1, 'Math', 85),
(1, 'Science', 78),
(1, 'English', 90),
(2, 'Math', 35),
(2, 'Science', 42),
(2, 'English', 38),
(3, 'Math', 65),
(3, 'Science', 55),
(3, 'English', 70),
(4, 'Math', 45),
(4, 'Science', 50),
(4, 'English', 60),
(5, 'Math', 39),
(5, 'Science', 41),
(5, 'English', 30);

-- fetch students table
select *from students;

-- fetch scores table
select *from scores;

-- task2: Create a View for Student Scores
CREATE VIEW student_scores AS  
SELECT s.student_id, s.name, sc.subject, sc.score  
FROM students s  
JOIN scores sc ON s.student_id = sc.student_id;

SELECT * FROM student_scores;

-- Create a View for Students Who Passed All Subjects
CREATE VIEW passed_students AS  
SELECT student_id, name  
FROM students  
WHERE student_id NOT IN ( 
    SELECT student_id FROM scores WHERE score < 40 
);

SELECT * FROM passed_students;

