USE test;
-- Write a view having columns as students, sex, percentage, class, section, teach,
-- activity, stream.
CREATE VIEW student_info AS
SELECT
  s.stdname AS students,
  s.sex,
  s.percentage,
  s.sclass,
  s.sec,
  t.name AS teacher,
  f.feature_name AS activity,
  s.stream
FROM
  student s
JOIN teacher t
	ON s.teacher_id = t.teacherid
JOIN student_features sf
	On s.stdid = sf.student_id
JOIN features f
	On f.feature_id = sf.feature_id;

-- Write a trigger on the student table which will run on delete of a row. The row being
-- deleted must be inserting the deleting row into a new table as backup.

CREATE TABLE backup_student (
StdID INT PRIMARY KEY,
StdName VARCHAR(30) NOT NULL,
Sex VARCHAR(6) CHECK (Sex = 'Female' || Sex = 'Male'), 
Percentage INT,
SClass INT,
Sec VARCHAR(255),
Stream Varchar(10) CHECK (Stream = 'Science' || Stream = 'Commerce'),
DOB DATE,
teacher_id INT,
FOREIGN KEY (teacher_id) REFERENCES teacher (teacherid)
);

CREATE TRIGGER backup_std
AFTER DELETE ON student
FOR EACH ROW
INSERT INTO backup_student (StdID, StdName, Sex, Percentage, SClass, Sec, Stream, DOB, teacher_id)
VALUES (OLD.StdID, OLD.StdName, OLD.Sex, OLD.Percentage, OLD.SClass, OLD.Sec, OLD.Stream, OLD.DOB, OLD.teacher_id);

DELETE FROM student
WHERE StdID = 110326;

-- Find a student having 3rd height percentage.
SELECT StdID, StdName, Percentage
FROM student
ORDER BY Percentage DESC
LIMIT 3;

-- Give me and example of Union query in this used case
SELECT * FROM student
UNION
SELECT * FROM backup_student;
    

