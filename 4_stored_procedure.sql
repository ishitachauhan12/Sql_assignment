-- Write a stored procedure inserting into a temp table for the student having birth year
-- as 2000, their teacher having a name starting with S.

DELIMITER //
CREATE PROCEDURE InsertStudentsWithTeacherStartingWithS()
BEGIN
  CREATE TEMPORARY TABLE temp_students (
    student_id INT,
    student_name VARCHAR(255),
    birth_date DATE,
    teacher_id INT,
    teacher_name VARCHAR(255)
  ); 

INSERT INTO temp_students (student_id, student_name, birth_date, teacher_id,teacher_name)
  SELECT s.stdid, s.stdname, s.dob, t.teacherid, t.name
  FROM student s
  JOIN teacher t
	on s.teacher_id=teacherid
  WHERE YEAR(s.dob) = 2000 AND t.name LIKE 's%';

        
SELECT *
   FROM temp_students;

  DROP TABLE IF EXISTS temp_students;
  END //

DELIMITER ;

CALL InsertStudentsWithTeacherStartingWithS();

 
