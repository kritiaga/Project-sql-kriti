Task 1
1) Database Creation

a)-- create StudentInfo TABLE

CREATE TABLE StudentInfo (
    STU_ID INT PRIMARY KEY,
    STU_NAME VARCHAR(100) NOT NULL,
    DOB DATE NOT NULL,
    PHONE_NO VARCHAR(15),
    EMAIL_ID VARCHAR(100),
    ADDRESS VARCHAR(255)
);


b)--create CoursesInfo TABLE

CREATE TABLE CoursesInfo (
    COURSE_ID INT PRIMARY KEY,
    COURSE_NAME VARCHAR(100) NOT NULL,
    COURSE_INSTRUCTOR_NAME VARCHAR(100) NOT NULL
);

c)-- create EnrollmentInfo TABLE

CREATE TABLE EnrollmentInfo (
    ENROLLMENT_ID INT PRIMARY KEY,
    STU_ID INT,
    COURSE_ID INT,
    ENROLL_STATUS VARCHAR(15) CHECK (ENROLL_STATUS IN ('Enrolled', 'Not Enrolled')),
    FOREIGN KEY (STU_ID) REFERENCES StudentInfo(STU_ID),
    FOREIGN KEY (COURSE_ID) REFERENCES CoursesInfo(COURSE_ID)
);





2) Data Creation
a) --studentinfo table data input 

INSERT INTO StudentInfo (STU_ID, STU_NAME, DOB, PHONE_NO, EMAIL_ID, ADDRESS) VALUES
(1, 'John Cena', '2005-01-21', '1234564890', 'john@example.com', '123 ank Street'),
(2, 'Ankita Gupta', '2001-05-25', '0985554321', 'anky@example.com', '42 32nd Avenue'),
(3, 'Ekta Gupta', '2004-04-14', '0985554300', 'ekta@example.com', '977 32nd park'),
(4, 'Miit Sodhi', '1998-06-21', '0985556677', 'miit@example.com', '92 Oak Avenue'),
(5, 'Pratham Goyal', '2006-01-27', '0985779321', 'pratham@example.com', '112 Cat Street');


b) --CoursesInfo table data input 

INSERT INTO CoursesInfo (COURSE_ID, COURSE_NAME, COURSE_INSTRUCTOR_NAME) VALUES
(101, 'Mathematics', 'Dr. Ekta'),
(102, 'Physics', 'Dr. Milan'),
(103, 'Biology', 'Dr. Aparna');



c) -- EnrollmentInfo table data input

INSERT INTO EnrollmentInfo (ENROLLMENT_ID, STU_ID, COURSE_ID, ENROLL_STATUS) VALUES
(1, 1, 101, 'Enrolled'),
(2, 1, 102, 'Enrolled'),
(3, 3, 102, 'Not Enrolled'),
(4, 2, 103, 'Enrolled'),
(5, 2, 101, 'Not Enrolled'),
(6, 3, 103, 'Enrolled'),
(7, 3, 101, 'Not Enrolled'),
(8, 4, 103, 'Enrolled'),
(9, 4, 101, 'Not Enrolled'),
(10, 5, 103, 'Enrolled'),
(11, 5, 101, 'Not Enrolled'),
(12, 5, 102, 'Enrolled');



3) Retrieve the Student Information


a) --Write a query to retrieve student details, such as student name, contact informations, and Enrollment status

SELECT STU_NAME, PHONE_NO, EMAIL_ID, ENROLL_STATUS
FROM StudentInfo S
JOIN EnrollmentInfo E ON S.STU_ID = E.STU_ID;

b) --Write a query to retrieve a list of courses in which a specific student is enrolled.

SELECT E.stu_id, S.stu_name,C.course_name
FROM StudentInfo S
JOIN EnrollmentInfo E
ON S.STU_ID = E.STU_ID
JOIN CoursesInfo C
ON C.COURSE_ID = E.COURSE_ID
WHERE ENROLL_STATUS = 'Enrolled'
AND E.STU_ID = 5; 


c) --Write a query to retrieve course information, including course name, instructor information.

SELECT COURSE_NAME, COURSE_INSTRUCTOR_NAME
FROM CoursesInfo;


d) --Write a query to retrieve course information for a specific course .


SELECT * 
FROM CoursesInfo
WHERE COURSE_ID = 102; 



e) -- Write a query to retrieve course information for multiple courses. Test the queries to ensure accurate retrieval of student information.( execute the queries and verify the results against the expected output  
SELECT * 
FROM CoursesInfo
WHERE COURSE_ID IN (101, 102);


4) Reporting and Analytics (Using joining queries)

a) --Write a query to retrieve the number of students enrolled in each course

 SELECT COURSE_NAME, COUNT(stu_id) AS Enrolled_Students
FROM CoursesInfo C
JOIN EnrollmentInfo E ON C.COURSE_ID = E.COURSE_ID
WHERE ENROLL_STATUS = 'Enrolled'
GROUP BY 1;



b) --Write a query to retrieve the list of students enrolled in a specific course

 SELECT STU_NAME
FROM StudentInfo
JOIN EnrollmentInfo ON StudentInfo.STU_ID = EnrollmentInfo.STU_ID
WHERE COURSE_ID = 103 AND ENROLL_STATUS = 'Enrolled'; 


c) --Write a query to retrieve the count of enrolled students for each instructor.

SELECT COURSE_INSTRUCTOR_NAME, COUNT(stu_id) AS Enrolled_Students
FROM CoursesInfo
JOIN EnrollmentInfo
ON CoursesInfo.COURSE_ID = EnrollmentInfo.COURSE_ID
WHERE ENROLL_STATUS = 'Enrolled'
GROUP BY COURSE_INSTRUCTOR_NAME;


d)-- Write a query to retrieve the list of students who are enrolled in multiple courses

SELECT STU_NAME
FROM StudentInfo
JOIN EnrollmentInfo ON StudentInfo.STU_ID = EnrollmentInfo.STU_ID
WHERE ENROLL_STATUS = 'Enrolled'
GROUP BY STU_NAME
HAVING COUNT(DISTINCT COURSE_ID) > 1;


e) --Write a query to retrieve the courses that have the highest number of enrolled students(arranging from highest to lowest))

SELECT COURSE_NAME,COUNT(STU_ID) AS COUNT_STUDENTS

FROM CoursesInfo C
JOIN EnrollmentInfo E
ON C.COURSE_ID = E.COURSE_ID
WHERE enroll_status = 'Enrolled'
group by 1
order by COUNT_STUDENTS DESC;
