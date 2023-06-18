CREATE DATABASE test;

USE test;

CREATE TABLE student (
StdID INT PRIMARY KEY,
StdName VARCHAR(30) NOT NULL,
Sex VARCHAR(6) CHECK (Sex='Female' || Sex='Male'),
Percentage INT,
SClass INT,
Sec CHAR,
Stream Varchar(10),
DOB DATE,
CONSTRAINT CHK_Stream CHECK (Stream='Science' || Stream='Commerce')
);


INSERT INTO student (StdID, StdName, Sex, Percentage, SClass, Sec, Stream, DOB)
VALUES (110321,'RIYA','Female','83',11,'A','Science','2001-12-1'),
(110322,'ISHITA','Female','10',11,'B','Science','2001-03-29'),
(110323,'CHETNA','Female','89',11,'A','Commerce','1997-07-26'),
(110324,'AYUSH','Male','92',11,'B','Commerce','2000-08-15');
INSERT INTO student
VALUES (110326,'RAYA','Female',89,12,'A','Science','2020-10-1',default);
INSERT INTO student
VALUES (110327,'RAM','male',83,12,'A','Science','2001-10-1',default);
INSERT INTO student
VALUES (110325,'RIYA','Female',83,12,'A','Science','2001-10-1',default);

-- Alter table with new field as teacher_id
ALTER TABLE student
Add teacher_id INT DEFAULT 1;

-- Create a table with the teacher's details. It should include columns as Name, email,
-- subject, Class.
CREATE TABLE teacher(
TeacherID INT PRIMARY KEY,
Name VARCHAR(30),
Email VARCHAR(30),
Subject VARCHAR(20),
Class INT
);

-- Insert into teachers table and apply insert into student table with teacher’s Id as
-- foreign key.
INSERT INTO teacher (TeacherID, Name, Email, Subject, Class)
VALUES (1,'NAMAN','naman@iiitu.ac.in','Maths',11),
(2,'ANKUR','ankur@iiitu.ac.in','BIOLOGY',11),
(3,'VIKRAM','vikram@iiitu.ac.in','HINDI',11);

UPDATE student set teacher_id=2 where StdName='Chetna';
UPDATE student set teacher_id=3 where StdName='Ishita';

ALTER TABLE student
ADD FOREIGN KEY (teacher_id) REFERENCES teacher(TeacherId);

-- Read from the tables and get all the data from both tables after applying the inner
-- join.
SELECT *
FROM student s 
JOIN teacher t
ON s.teacher_id=t.TeacherId;

-- Find distinct names from the table.
SELECT distinct stdname
from student;


-- Find the number of students that are male: output columns sex, count(*). Hint group
-- by.
SELECT sex,count(*)
from student
where sex='male'
group by sex;

-- Find the number of students having sex as male and stream as science using group
-- by.
SELECT sex, stream, COUNT(*) AS count
FROM student
WHERE sex = 'male' AND stream = 'science'
GROUP BY sex, stream;

-- Read students having their birth year as 2020.
select * 
from student 
where YEAR(dob)=2020;



