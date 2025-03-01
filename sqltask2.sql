-- create a Students table
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Gender VARCHAR(1) CHECK (Gender IN ('M', 'F')),
    Age INT,
    Grade VARCHAR(10),
    MathScore INT,
    ScienceScore INT,
    EnglishScore INT
);

-- insert data
INSERT INTO Students (Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore) VALUES
('Shinchan', 'M', 20, 'A', 90, 85, 88),
('Sophia', 'F', 21, 'B', 78, 92, 80),
('Pikachu', 'M', 22, 'A', 95, 89, 91),
('Eliana', 'F', 22, 'C', 65, 72, 68),
('Doraemon', 'M', 20, 'B', 80, 83, 85),
('Arabella', 'F', 21, 'A', 88, 90, 92),
('Mickey', 'M', 22, 'B', 76, 81, 78),
('Isabella', 'F', 21, 'C', 60, 55, 70),
('Tom', 'M', 20, 'A', 85, 87, 90),
('Charlotte Miller', 'F', 20, 'B', 82, 88, 79);

-- Display all students
SELECT * FROM Students;

-- Create Courses Table
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    course_description TEXT
);
-- insert data
INSERT INTO Courses (course_name, course_description) VALUES
('Database Management', 'Learn about relational databases and SQL.'),
('Web Development', 'Introduction to HTML, CSS, JavaScript, and frameworks.'),
('Machine Learning', 'Understanding ML algorithms and their applications.'),
('Cybersecurity', 'Explore security measures and ethical hacking.');
-- display Courses data
SELECT * FROM Courses;

-- Create Enrolments Table
CREATE TABLE Enrolments (
    enrolment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrolment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(StudentID),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
-- insert data
INSERT INTO Enrolments (student_id, course_id, enrolment_date) VALUES
(1, 1, '2024-02-01'),
(1, 2, '2024-02-05'),
(2, 1, '2024-02-10'),
(3, 3, '2024-02-15'),
(4, 2, '2024-02-20'),
(5, 1, '2024-02-25'),
(6, 2, '2024-02-28'),
(6, 3, '2024-03-01');
-- display Enrolments data
SELECT * FROM Enrolments;

-- Task 1: List all students and the courses they are enrolled in
SELECT s.Name AS StudentName, c.course_name AS CourseName
FROM Students s
INNER JOIN Enrolments e ON s.StudentID = e.student_id
INNER JOIN Courses c ON e.course_id = c.course_id;

-- Task 2: Find the number of students enrolled in each course
SELECT c.course_name, COUNT(e.student_id) AS TotalStudents
FROM Courses c
LEFT JOIN Enrolments e ON c.course_id = e.course_id
GROUP BY c.course_name;

-- Task 3: List students who have enrolled in more than one course
SELECT s.Name, COUNT(e.course_id) AS CoursesEnrolled
FROM Students s
INNER JOIN Enrolments e ON s.StudentID = e.student_id
GROUP BY s.StudentID, s.Name
HAVING COUNT(e.course_id) > 1;

-- Task 4: Find courses with no enrolled students
SELECT c.course_name
FROM Courses c
LEFT JOIN Enrolments e ON c.course_id = e.course_id
WHERE e.enrolment_id IS NULL;



