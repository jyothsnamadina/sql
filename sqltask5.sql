
-- create
CREATE TABLE StudentScores ( 
    StudentID INT PRIMARY KEY, 
    TotalScore INT, 
    MathScore INT, 
    ScienceScore INT
);

-- insert
INSERT INTO StudentScores (StudentID, TotalScore, MathScore, ScienceScore) 
VALUES 
    (5, 90, 50, 40),  
    (6, 80, 40, 40),   
    (7, 70, 39, 41),   
    (8, 40, 20, 20),   
    (9, 100, 50, 50),  
    (10, 55, 45, 10), 
    (11, 85, 39, 50),  
    (14, 89, 44, 45);  

-- fetch 
SELECT * FROM StudentScores;

-- 1. Assign Grades Based on Total Scores
SELECT StudentID, TotalScore,
    CASE 
        WHEN TotalScore >= 90 THEN 'A'
        WHEN TotalScore >= 80 THEN 'B'
        WHEN TotalScore >= 70 THEN 'C'
        ELSE 'D (Fail)'
    END AS Grade
FROM StudentScores;

-- 2. Identify Pass/Fail Status in Specific Subjects
SELECT StudentID, MathScore, ScienceScore,
    CASE 
        WHEN MathScore >= 40 THEN 'Pass' 
        ELSE 'Fail' 
    END AS MathStatus,
    CASE 
        WHEN ScienceScore >= 40 THEN 'Pass' 
        ELSE 'Fail' 
    END AS ScienceStatus
FROM StudentScores;

