Task2 
1) --Database Setup

CREATE DATABASE student_database;

-- create table
CREATE TABLE student_table (
    Student_id INTEGER PRIMARY KEY,
    Stu_name TEXT,
    Department TEXT,
    email_id TEXT,
    Phone_no NUMERIC,
    Address TEXT,
    Date_of_birth DATE,
    Gender TEXT,
    Major TEXT,
    GPA NUMERIC,
    Grade TEXT
);

 

2)-- Data Entry


INSERT INTO student_table (Student_id, Stu_name, Department, email_id, Phone_no, Address, Date_of_birth, Gender, Major, GPA, Grade) VALUES
(1, 'Rahul Sharma', 'Computer Science', 'rahul.sharma@example.com', 1234567890, '123 Main St', '2000-01-01', 'Male', 'CS', 3.8, 'B'),
(2, 'Anjali Mehta', 'Mathematics', 'anjali.mehta@example.com', 2345678901, '456 Maple Ave', '1999-05-12', 'Female', 'Math', 4.2, 'A'),
(3, 'Vikram Singh', 'Physics', 'vikram.singh@example.com', 3456789012, '789 Elm St', '2001-08-23', 'Male', 'Physics', 3.5, 'C'),
(4, 'Priya Patel', 'Biology', 'priya.patel@example.com', 4567890123, '321 Pine St', '2000-03-15', 'Female', 'Bio', 4.0, 'A'),
(5, 'Amit Verma', 'Chemistry', 'amit.verma@example.com', 5678901234, '654 Oak Ave', '1998-12-30', 'Male', 'Chem', 2.8, 'D'),
(6, 'Sneha Roy', 'History', 'sneha.roy@example.com', 6789012345, '987 Cedar Rd', '2002-07-21', 'Female', 'Hist', 3.2, 'B'),
(7, 'Rohan Kapoor', 'Literature', 'rohan.kapoor@example.com', 7890123456, '159 Birch Ln', '2001-11-11', 'Male', 'Lit', 4.5, 'A'),
(8, 'Neha Iyer', 'Art', 'neha.iyer@example.com', 8901234567, '753 Spruce Dr', '1999-09-09', 'Female', 'Art', 2.9, 'C'),
(9, 'Arjun Das', 'Engineering', 'arjun.das@example.com', 9012345678, '852 Walnut St', '2000-02-20', 'Male', 'Eng', 3.7, 'B'),
(10, 'Sanya Gupta', 'Business', 'sanya.gupta@example.com', 1230984567, '456 Cypress St', '1998-10-10', 'Female', 'Bus', 4.8, 'A');

 

3) -- Student Information Retrieval

SELECT * FROM student_table
ORDER BY Grade DESC;

 

4)-- Query for Male Students
SELECT * FROM student_table
WHERE Gender = 'Male';

 
5) -- Query for students with GPA less than 5.0
SELECT * FROM student_table
WHERE GPA < 5.0;
 


6) -- Update Student Email and Grade

UPDATE student_table
SET email_id = 'new.email@example.com', Grade = 'A'
WHERE Student_id = 1;


select * from student_table
WHERE Student_id = 1;
 

7) -- Query for Students with Grade B

SELECT Stu_name, DATE_PART('year', AGE(Date_of_birth)) AS Age
FROM student_table
WHERE Grade = 'B';
 
8)-- Grouping and Calculation 

SELECT Department, Gender, AVG(GPA) AS Average_GPA
FROM student_table
GROUP BY Department, Gender;

 

9) -- Table Renaming
alter table Student_table 
	RENAME TO student_info

 



10) -- Retreive  Student with Highest GPA 

SELECT Stu_name
FROM student_info
ORDER BY GPA DESC
LIMIT 1;




