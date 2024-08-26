--a)Create the StudentInfo table with columns STU_ ID, STU_NAME, DOB, PHONE_NO,EMAIL_ID,ADDRESS.
create table StudentInfo
(STU_ID INT primary key,
STU_NAME varchar (100),
DOB date,
PHONE_NO int,
EMAIL_ID varchar(100),
ADDRESS_ Varchar(100));

--b) Create the CoursesInfo table with columns COURSE_ID,COURSE_NAME,COURSE_INSTRUCTOR NAME.
create table CoursesInfo 
(COURSE_ID int primary key,
COURSE_NAME Varchar(100),
COURSE_INSTRUCTOR_NAME Varchar(100));



/*c) Create the EnrollmentInfo with columns ENROLLMENT_ID, STU_ ID, COURSE_ID,
ENROLL_STATUS(Enrolled/Not Enrolled). The FOREIGN KEY constraint in the EnrollmentInfo
table references the STU_ID column in the StudentInfo table and the COURSE_ID column in the
CoursesInfo table.*/

create table EnrollmentInfo
(ENROLLMENT_ID int primary key,
COURSE_ID int,
STU_ID int,
ENROLL_STATUS varchar(100),
FOREIGN KEY (STU_ID) REFERENCES StudentInfo(STU_ID),
FOREIGN KEY (COURSE_ID) REFERENCES CoursesInfo(COURSE_ID));

/*2. Data Creation:
Insert some sample data for StudentInfo table , CoursesInfo table, EnrollmentInfo with
respective fields.*/

insert into StudentInfo values 
('1','Akeel','2000-09-01','5552222','abc@gmail.com','Obere Str. 57'),
('2','Sharuk','2000-10-01','5554822','def@gmail.com','Avda. de la Constitución 2222'),
('3','Gautam','2000-11-01','5555735','ghi@gmail.com','Mataderos 2312'),
('4','Suraj','2000-12-01','35555011','jkl@gmail.com','120 Hanover Sq.');

insert into CoursesInfo values
('101','English','John'),
('102','Science','Alan'),
('103','Maths','Maria'),
('104','Hindi','Irin');

insert into EnrollmentInfo values
('123','101','1','Enrolled'),
('124','102','2','Not_Enrolled'),
('125','103','3','Enrolled'),
('126','101','3','Not_Enrolled'),
('127','102','1','Enrolled'),
('128','103','2','Enrolled');

/*3) Retrieve the Student Information
a) Write a query to retrieve student details, such as student name, contact informations, and
Enrollment status.*/

select s.STU_NAME AS student_name,s.PHONE_NO AS contact_informations,e.ENROLL_STATUS as Enrollment_status
from StudentInfo s
inner join EnrollmentInfo e
on s.STU_ID = e.STU_ID;

/*b) Write a query to retrieve a list of courses in which a specific student is enrolled.*/
select COURSE_ID,ENROLL_STATUS
from EnrollmentInfo 
where ENROLL_STATUS = 'Enrolled';

/*c) Write a query to retrieve course information, including course name, instructor information*/

select *
from CoursesInfo;

/*d) Write a query to retrieve course information for a specific course.*/
select*
from CoursesInfo
where COURSE_NAME = 'Maths';

/*e) Write a query to retrieve course information for multiple courses.*/
select*
from CoursesInfo
where COURSE_NAME IN ('Maths','English');

/*4. Reporting and Analytics (Using joining queries)
a) Write a query to retrieve the number of students enrolled in each course*/
select count(e.STU_ID) as count_of_students,c.COURSE_NAME
from EnrollmentInfo e
inner join CoursesInfo c
on c.COURSE_ID = e.COURSE_ID
where ENROLL_STATUS = 'Enrolled'
group by e.ENROLL_STATUS,c.COURSE_NAME; 

/*b) Write a query to retrieve the list of students enrolled in a specific course*/

select s.STU_NAME,c.COURSE_NAME
from CoursesInfo c
inner join EnrollmentInfo e
on c.COURSE_ID = e.COURSE_ID
join StudentInfo s
on e.STU_ID = s.STU_ID
where e.ENROLL_STATUS = 'Enrolled';

/*c)Write a query to retrieve the count of enrolled students for each instructor.*/
select count(e.STU_ID) as Count_of_students,c.COURSE_INSTRUCTOR_NAME
from EnrollmentInfo e
inner join CoursesInfo c
on e.COURSE_ID = c.COURSE_ID
where e.ENROLL_STATUS = 'Enrolled'
group by c.COURSE_INSTRUCTOR_NAME;

/*d) Write a query to retrieve the list of students who are enrolled in multiple courses*/
select s.STU_NAME,count(c.COURSE_ID) as no_of_courses
from StudentInfo s
inner join EnrollmentInfo e
on s.STU_ID= e.STU_ID
join CoursesInfo c
on e.COURSE_ID = c.COURSE_ID
where e.ENROLL_STATUS = 'enrolled'
group by s.STU_NAME
having count(c.COURSE_ID)>1;

/*e) Write a query to retrieve the courses that have the highest number of enrolled
students(arranging from highest to lowest)*/

select c.COURSE_NAME,count (s.STU_ID) as No_of_students
from StudentInfo s
inner join EnrollmentInfo e
on s.STU_ID= e.STU_ID
join CoursesInfo c
on e.COURSE_ID = c.COURSE_ID
where e.ENROLL_STATUS = 'enrolled'
group by c.COURSE_NAME
order by count (s.STU_ID) DESC;



