/*1. Database Setup*/
create table  student_table
(Student_id integer primary key,
Stu_name text,
Department text,
email_id  text,
Phone_no numeric,
Address text,
Date_of_birth date,
Gender text,
Major text,
GPA numeric,
Grade text
)

/*2. Data Entry
Insert 10 sample records into the "student_table" using INSERT command*/

insert into student_table(Student_id,Stu_name,Department ,email_id ,Phone_no,Address,Date_of_birth,Gender,Major,GPA,Grade) values
(1,'Akeel','Science','abc@gmail.com','5552222','abc.123','2000-09-01','Male','Biology','9.5','A'),
(2,'Arshiya','Commerce','efg@gmail.com','5554822','efg.234 ','2000-09-02','Female','Accounts','9.0','A'),
(3,'Amar','Science','hij@gmail.com','5555735','hij.567','2000-09-03','Male','Physics','9.3','A'),
(4,'Soumya','Commerce','klm@gmail.com','35555011','klm.890','2000-06-02','Female','CS','9.2','A'),
(5,'Sharuk','electronics','nop@gmail.com','5987654','nop.012','2000-10-12','Male','Electrical','8.9','B'),
(6,'Chithra','CS','qrs@gmail.com','4317877 ','qrs.345','2000-10-13','Female','CS','8.8','B'),
(7,'Minnu','Aeronautical','tuv@gmail.com','4442343','tuv.678','2000-08-18','Female','Aero','9.6','A'),
(8,'Gautam','Science','wxy@gmail.com','5554448','wxy.911','2000-10-02','Male','Chemisty','8.5','B'),
(9,'Suraj','Science','zab@gmail.com','5554640','zab.201','2000-10-03','Male','Maths','8.0','C'),
(10,'Sindhu','Commerce','cde@gmail.com','9984510','cde.202','2000-10-04','Female','Home_science','4.2','D');



/*3. Student Information Retrieval
Develop a query to retrieve all students' information from the "student_table" and sort them in
descending order by their grade*/

select* 
from student_table 
order by grade DESC;


/*4. Query for Male Students:
.Implement a query to retrieve information about all male students from the "student_table."*/

select *
from student_table
where Gender = 'Male';

/*5. Query for Students with GPA less than 5.0
Create a query to fetch the details of students who have a GPA less than 5.0 from the
"student_table."*/

Select *
from student_table
where GPA <5.0;

/*6. Update Student Email and Grade
Write an update statement to modify the email and grade of a student with a specific ID in the
"student_table."*/

Update student_table
set Grade = 'B', email_id = 'lmo@gmail.com'
where Student_id ='9'; 

select *
from student_table

/*7. Query for Students with Grade "B"
Develop a query to retrieve the names and ages of all students who have a grade of "B" from
the "student_table."*/

SELECT
    Stu_name,DATE_PART('year', AGE(CURRENT_DATE, Date_of_birth)) AS age
FROM student_table
where Grade ='B' ;

/*8. Grouping and Calculation
Create a query to group the "student_table" by the "Department" and "Gender" columns and
calculate the average GPA for each combination.*/
select Department,Gender,trunc(avg(GPA),2) as AVG_GPA
from student_table
group by Department,Gender;

/*9. Table Renaming
Rename the "student_table" to "student_info" using the appropriate SQL statement.*/

ALTER TABLE student_table RENAME TO student_info;


/*10. Retrieve Student with Highest GPA
Write a query to retrieve the name of the student with the highest GPA from the
"student_info" table.*/


SELECT Stu_name, GPA
FROM student_info
ORDER BY GPA DESC
LIMIT 1;
