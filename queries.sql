-- Database Setup
CREATE DATABASE StudentManagement;
USE StudentManagement;

-- create a table
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

-- 1. Display all students and their details to get an overview of the data.
SELECT * FROM Students;

-- 2. Calculate the average scores for each subject to understand subject-wise performance.
SELECT 
    AVG(MathScore) AS AvgMathScore, 
    AVG(ScienceScore) AS AvgScienceScore, 
    AVG(EnglishScore) AS AvgEnglishScore 
FROM Students;

-- 3. Find the student(s) with the highest total score
SELECT Name, (MathScore + ScienceScore + EnglishScore) AS TotalScore
FROM Students
ORDER BY TotalScore DESC
LIMIT 1;

-- 4. Count the number of students in each grade to observe grade distributions.
SELECT Grade, COUNT(*) AS StudentCount 
FROM Students 
GROUP BY Grade;

-- 5. Find the average score for male and female students
SELECT Gender, 
       AVG(MathScore) AS AvgMath, 
       AVG(ScienceScore) AS AvgScience, 
       AVG(EnglishScore) AS AvgEnglish 
FROM Students 
GROUP BY Gender;

-- 6. Identify students whose Math score is above 80 to highlight high achievers in Math.
SELECT Name, MathScore 
FROM Students 
WHERE MathScore > 80;

-- 7. Update the grade of a student with a specific Student ID
UPDATE Students 
SET Grade = 'A' 
WHERE StudentID = 3;  
SELECT Grade from Students WHERE StudentID = 3;





