CREATE DATABASE School
GO

USE School
GO

CREATE TABLE Students
(
	Id INT PRIMARY KEY IDENTITY,
	StudentName VARCHAR (50),
	StudentGender VARCHAR (50),
	StudentAge INT
)
GO

INSERT INTO Students VALUES ('Sally', 'Female', 14 )
INSERT INTO Students VALUES ('Edward', 'Male', 12 )
INSERT INTO Students VALUES ('Jon', 'Male', 13 )
INSERT INTO Students VALUES ('Liana', 'Female', 10 )
INSERT INTO Students VALUES ('Ben', 'Male', 11 )
INSERT INTO Students VALUES ('Elice', 'Female', 12 )
INSERT INTO Students VALUES ('Nick', 'Male', 9 )
INSERT INTO Students VALUES ('Josh', 'Male', 12 )
INSERT INTO Students VALUES ('Liza', 'Female', 10 )
INSERT INTO Students VALUES ('Wick', 'Male', 15 )

--Running Average and Sum
USE School
SELECT Id, StudentName, StudentGender, StudentAge,
SUM (StudentAge) OVER (ORDER BY Id) AS RunningAgeTotal,
AVG (StudentAge) OVER (ORDER BY Id) AS RunningAgeAverage
FROM Students

--Running Sum with Partition 
USE School
SELECT Id, StudentName, StudentGender, StudentAge,
SUM (StudentAge) OVER (PARTITION BY StudentGender ORDER BY Id) AS RunningAgeTotal
FROM Students
