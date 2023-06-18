USE test;

-- Create a table to keep many to many relationships between student and feature.
-- Student_features having columns as feature_id and student_id.
-- Multiple students can have multiple features and more than one feature can be opted
-- by one student,
-- Example Aman wants to opt for cricket and swimming.
-- Hand yoga has been taken by Aman, Vishal, and Sanyam.

CREATE TABLE features (
feature_id INT PRIMARY KEY AUTO_INCREMENT,
feature_name VARCHAR(255) NOT NULL
);

CREATE TABLE student_features (
  student_id INT,
  feature_id INT,
  FOREIGN KEY (student_id) REFERENCES student(stdid),
  FOREIGN KEY (feature_id) REFERENCES features(feature_id),
  PRIMARY KEY (student_id, feature_id)
);

INSERT INTO activity_students (student_name)
VALUES ('RIYA'),
('ISHITA'),
('CHETNA'),
('AYUSH');

INSERT INTO features (feature_name)
VALUES ('Swimming'),
('Yoga'),
('Cricket'),
('Football'),
('Atheletics');

INSERT INTO student_features (student_id,feature_id)
VALUES (110321,1),
(110321,2),
(110322,1),
(110323,3),
(110323,4),
(110323,2),
(110324,4),
(110324,5);

-- SELECT s.stdname,f.feature_name
-- FROM student s
-- join student_features af
-- on s.stdid = af.student_id
-- join features f
-- on af.feature_id=f.feature_id;

-- Fetch all the students having swimming as a choice.
SELECT s.stdname
FROM student s
join student_features af
on s.stdid = af.student_id
join features f
on af.feature_id=f.feature_id
where f.feature_name = 'Swimming';

-- SELECT t.name,s.stdname,f.feature_name
-- from teacher t
-- join student s
-- on s.teacher_id=t.TeacherID
-- join student_features sf
-- on s.stdid=sf.student_id
-- join features f
-- on f.feature_id=sf.feature_id;

-- Find teachers whose students are into cricket.
SELECT t.name
from teacher t
join student s
on s.teacher_id=t.TeacherID
join student_features sf
on s.stdid=sf.student_id
join features f
on f.feature_id=sf.feature_id
where feature_name='cricket';




