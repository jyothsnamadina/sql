
-- create
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    MathScore INT,
    TotalScore INT
);

-- insert
INSERT INTO Students (StudentID, Name, MathScore, TotalScore)
VALUES 
(1, 'Mickey Mouse', 80, 240),
(2, 'SpongeBob', 90, 270),
(3, 'Bugs Bunny', 85, 255),
(4, 'Tom Cat', 90, 270),
(5, 'Jerry Mouse', 75, 225);

-- fetch 
SELECT * FROM Students;

-- Rank Students Based on Total Scores:
SELECT StudentID,Name,TotalScore,
RANK() OVER (ORDER BY TotalScore DESC) AS StudentRank
FROM Students;
    
-- Calculate Running Totals for Math Scores:
SELECT StudentID,Name,MathScore,
SUM(MathScore) OVER (ORDER BY StudentID) AS RunningTotal
FROM Students;



