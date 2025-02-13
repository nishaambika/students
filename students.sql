create database Students;
use StudentS;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT CHECK (Age >= 5),
    Gender VARCHAR(10),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15) UNIQUE
);
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) ,
    CourseFee DECIMAL(10,2)
);
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 
);
CREATE TABLE Fees (
    FeeID INT PRIMARY KEY,
    StudentID INT,
    AmountPaid DECIMAL(10,2) CHECK (AmountPaid >= 0),
    PaymentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    StudentID INT,
    AttendanceDate DATE,
    Status VARCHAR(10) CHECK (Status IN ('Present', 'Absent')),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

CREATE TABLE Exams (
    ExamID INT PRIMARY KEY,
    CourseID INT,
    ExamDate DATE NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE
);

CREATE TABLE Results (
    ResultID INT PRIMARY KEY,
    StudentID INT,
    ExamID INT,
    MarksObtained INT CHECK (MarksObtained BETWEEN 0 AND 100),
    Grade CHAR(1),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (ExamID) REFERENCES Exams(ExamID)
    );
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Subject VARCHAR(50),
    Phone VARCHAR(15) UNIQUE
);


INSERT INTO Students (StudentID, Name, Age, Gender, Email, Phone) VALUES
(1, 'Arun Kumar', 20, 'Male', 'arun@example.com', '9876543210'),
(2, 'Divya Ramesh', 22, 'Female', 'divya@example.com', '9988776655'),
(3, 'Rahul Sharma', 21, 'Male', 'rahul@example.com', '9966332211'),
(4, 'Sneha Patel', 23, 'Female', 'sneha@example.com', '9955221100'),
(5, 'Vikram Singh', 19, 'Male', 'vikram@example.com', '9944112233'),
(6, 'Anjali Mehta', 20, 'Female', 'anjali@example.com', '9933224455'),
(7, 'Rohan Das', 22, 'Male', 'rohan@example.com', '9922335566'),
(8, 'Priya Nair', 21, 'Female', 'priya@example.com', '9911446677'),
(9, 'Amit Joshi', 23, 'Male', 'amit@example.com', '9900557788'),
(10, 'Kavya Iyer', 20, 'Female', 'kavya@example.com', '9899668899'),
(11, 'Siddharth Rao', 21, 'Male', 'siddharth@example.com', '9888779900'),
(12, 'Neha Gupta', 22, 'Female', 'neha@example.com', '9877880011'),
(13, 'Manish Kumar', 23, 'Male', 'manish@example.com', '9866991122'),
(14, 'Pooja Verma', 19, 'Female', 'pooja@example.com', '9855112233'),
(15, 'Karan Malhotra', 20, 'Male', 'karan@example.com', '9844223344'),
(16, 'Sonal Jain', 21, 'Female', 'sonal@example.com', '9833334455'),
(17, 'Abhishek Singh', 22, 'Male', 'abhishek@example.com', '9822445566'),
(18, 'Ritu Sharma', 23, 'Female', 'ritu@example.com', '9811556677'),
(19, 'Nikhil Agarwal', 19, 'Male', 'nikhil@example.com', '9800667788'),
(20, 'Megha Chawla', 20, 'Female', 'megha@example.com', '9799778899');


INSERT INTO Courses (CourseID, CourseName, CourseFee) VALUES
(101, 'Python Programming', 5000),
(102, 'Database Management', 4000),
(103, 'Web Development', 6000),
(104, 'Data Structures', 4500),
(105, 'Algorithms', 4700),
(106, 'Operating Systems', 5200),
(107, 'Computer Networks', 4800),
(108, 'Software Engineering', 5500),
(109, 'Machine Learning', 7000),
(110, 'Artificial Intelligence', 7500),
(111, 'Cyber Security', 6000),
(112, 'Cloud Computing', 6500),
(113, 'Big Data Analytics', 7200),
(114, 'Data Visualization', 5500),
(115, 'Embedded Systems', 5800),
(116, 'Internet of Things', 6900),
(117, 'Blockchain Technology', 8000),
(118, 'Digital Marketing', 5000),
(119, 'Mobile App Development', 5700),
(120, 'Ethical Hacking', 6200);


INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES
(1, 1, 101, '2024-01-10'),
(2, 2, 102, '2024-01-15'),
(3, 3, 103, '2024-01-20'),
(4, 4, 104, '2024-01-25'),
(5, 5, 105, '2024-01-30'),
(6, 6, 106, '2024-02-04'),
(7, 7, 107, '2024-02-09'),
(8, 8, 108, '2024-02-14'),
(9, 9, 109, '2024-02-19'),
(10, 10, 110, '2024-02-24'),
(11, 11, 101, '2024-03-01'),
(12, 12, 102, '2024-03-06'),
(13, 13, 103, '2024-03-11'),
(14, 14, 114, '2024-03-16'),
(15, 15, 115, '2024-03-21'),
(16, 16, 116, '2024-03-26'),
(17, 17, 117, '2024-04-01'),
(18, 18, 118, '2024-04-06'),
(19, 19, 119, '2024-04-11'),
(20, 20, 120, '2024-04-16');

INSERT INTO Fees (FeeID, StudentID, AmountPaid, PaymentDate) VALUES
(1, 1, 5000, '2024-01-12'),
(2, 2, 4000, '2024-01-17'),
(3, 3, 6000, '2024-01-22'),
(4, 4, 4500, '2024-01-27'),
(5, 5, 4700, '2024-02-01'),
(6, 6, 5200, '2024-02-06'),
(7, 7, 4800, '2024-02-11'),
(8, 8, 5500, '2024-02-16'),
(9, 9, 7000, '2024-02-21'),
(10, 10, 7500, '2024-02-26'),
(11, 11, 6000, '2024-03-03'),
(12, 12, 6500, '2024-03-08'),
(13, 13, 7200, '2024-03-13'),
(14, 14, 5500, '2024-03-18'),
(15, 15, 5800, '2024-03-23'),
(16, 16, 6900, '2024-03-28'),
(17, 17, 8000, '2024-04-02'),
(18, 18, 5000, '2024-04-07'),
(19, 19, 5700, '2024-04-12'),
(20, 20, 6200, '2024-04-17');

INSERT INTO Attendance (AttendanceID, StudentID, AttendanceDate, Status) VALUES
(1, 1, '2024-01-10', 'Present'),
(2, 2, '2024-01-15', 'Absent'),
(3, 3, '2024-01-20', 'Present'),
(4, 4, '2024-01-25', 'Present'),
(5, 5, '2024-01-30', 'Absent'),
(6, 6, '2024-02-04', 'Present'),
(7, 7, '2024-02-09', 'Present'),
(8, 8, '2024-02-14', 'Absent'),
(9, 9, '2024-02-19', 'Present'),
(10, 10, '2024-02-24', 'Present'),
(11, 11, '2024-03-01', 'Absent'),
(12, 12, '2024-03-06', 'Present'),
(13, 13, '2024-03-11', 'Present'),
(14, 14, '2024-03-16', 'Absent'),
(15, 15, '2024-03-21', 'Present'),
(16, 16, '2024-03-26', 'Present'),
(17, 17, '2024-04-01', 'Absent'),
(18, 18, '2024-04-06', 'Present'),
(19, 19, '2024-04-11', 'Present'),
(20, 20, '2024-04-16', 'Absent');

INSERT INTO Exams (ExamID, CourseID, ExamDate) VALUES
(1, 101, '2024-03-10'),
(2, 102, '2024-03-15'),
(3, 103, '2024-03-20'),
(4, 104, '2024-03-25'),
(5, 105, '2024-03-30'),
(6, 106, '2024-04-04'),
(7, 107, '2024-04-09'),
(8, 108, '2024-04-14'),
(9, 109, '2024-04-19'),
(10, 110, '2024-04-24'),
(11, 111, '2024-05-01'),
(12, 112, '2024-05-06'),
(13, 113, '2024-05-11'),
(14, 114, '2024-05-16'),
(15, 115, '2024-05-21'),
(16, 116, '2024-05-26'),
(17, 117, '2024-06-01'),
(18, 118, '2024-06-06'),
(19, 119, '2024-06-11'),
(20, 120, '2024-06-16');

INSERT INTO Results (ResultID, StudentID, ExamID, MarksObtained, Grade) VALUES
(1, 1, 1, 85, 'A'),
(2, 2, 2, 75, 'B'),
(3, 3, 3, 90, 'A'),
(4, 4, 4, 80, 'B'),
(5, 5, 5, 60, 'C'),
(6, 6, 6, 95, 'A'),
(7, 7, 7, 70, 'B'),
(8, 8, 8, 85, 'A'),
(9, 9, 9, 88, 'A'),
(10, 10, 10, 92, 'A'),
(11, 11, 11, 65, 'C'),
(12, 12, 12, 78, 'B'),
(13, 13, 13, 82, 'B'),
(14, 14, 14, 59, 'C'),
(15, 15, 15, 89, 'A'),
(16, 16, 16, 74, 'B'),
(17, 17, 17, 68, 'C'),
(18, 18, 18, 91, 'A'),
(19, 19, 19, 87, 'A'),
(20, 20, 20, 77, 'B');

iNSERT INTO Teachers (TeacherID, Name, Subject, Phone) VALUES
(1, 'Ramesh Iyer', 'Python Programming', '9876112233'),
(2, 'Sanjay Kapoor', 'Database Management', '9866223344'),
(3, 'Meera Desai', 'Web Development', '9856334455'),
(4, 'Arjun Khanna', 'Data Structures', '9846445566'),
(5, 'Swati Sharma', 'Algorithms', '9836556677'),
(6, 'Vikas Verma', 'Operating Systems', '9826667788'),
(7, 'Poonam Joshi', 'Computer Networks', '9816778899'),
(8, 'Rajesh Patel', 'Software Engineering', '9806889900'),
(9, 'Divya Menon', 'Machine Learning', '9796990011'),
(10, 'Neeraj Bansal', 'Artificial Intelligence', '9787001122'),
(11, 'Preeti Nair', 'Cyber Security', '9777112233'),
(12, 'Amit Ghosh', 'Cloud Computing', '9767223344'),
(13, 'Harish Mehta', 'Big Data Analytics', '9757334455'),
(14, 'Sonia Rao', 'Data Visualization', '9747445566'),
(15, 'Anil Kumar', 'Embedded Systems', '9737556677'),
(16, 'Smita Malhotra', 'Internet of Things', '9727667788'),
(17, 'Suresh Chawla', 'Blockchain Technology', '9717778899'),
(18, 'Kiran Gupta', 'Digital Marketing', '9707889900'),
(19, 'Manoj Nambiar', 'Mobile App Development', '9697990011'),
(20, 'Lavanya Pillai', 'Ethical Hacking', '9688001122');


select *from students;
select *from courses;
select *from enrollments;
select*from fees;
select * from attendance;
select *from exams;
select *from results;
select *from teachers;

UPDATE Students SET Phone = '9998887770' WHERE StudentID = 5;

SELECT S.Name, C.CourseName 
FROM Students s
JOIN Enrollments E ON S.StudentID = E.StudentID
JOIN Courses C ON E.CourseID = C.CourseID
WHERE C.CourseName = 'Python Programming';

SELECT * FROM Students WHERE Name LIKE 'A%';

SELECT C.CourseName, COUNT(E.StudentID) AS TotalStudents
FROM Courses C
LEFT JOIN Enrollments E ON C.CourseID = E.CourseID
GROUP BY C.CourseName;

SELECT StudentID, SUM(AmountPaid) AS TotalFees
FROM Fees
GROUP BY StudentID
HAVING SUM(AmountPaid) > 5000;

SELECT S.Name, R.MarksObtained
FROM Students S
JOIN Results R ON S.StudentID = R.StudentID
ORDER BY R.MarksObtained DESC
LIMIT 5;


SELECT S.Name, C.CourseName, E.EnrollmentDate 
FROM Students S
JOIN Enrollments E ON S.StudentID = E.StudentID
JOIN Courses C ON E.CourseID = C.CourseID;

SELECT S.Name, F.AmountPaid
FROM Students S
LEFT JOIN Fees F ON S.StudentID = F.StudentID;

sELECT Name, 'Student' AS Role FROM Students
UNION
SELECT Name, 'Teacher' AS Role FROM Teachers;

CREATE VIEW HighScorers AS
SELECT S.Name, R.MarksObtained
FROM Students S
JOIN Results R ON S.StudentID = R.StudentID
WHERE R.MarksObtained > 85;

SELECT * FROM HighScorers;

DELIMITER //
CREATE PROCEDURE GetStudentDetails(IN studID INT)
BEGIN
    SELECT * FROM Students WHERE StudentID = studID;
END //
DELIMITER ;
CALL GetStudentDetails(3);

DELIMITER //
CREATE TRIGGER PreventNegativeFee BEFORE INSERT ON Fees
FOR EACH ROW
BEGIN
    IF NEW.AmountPaid < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Amount cannot be negative';
    END IF;
END //
DELIMITER ;

