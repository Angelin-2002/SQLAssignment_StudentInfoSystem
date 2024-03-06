
--Task 1. Database Design:
--1. Create the database named "SISDB"
create database SISDB

--use ssid
use SISDB

/*2. Define the schema for the Students, Courses, Enrollments, Teacher, and Payments tables based
on the provided schema. Write SQL scripts to create the mentioned tables with appropriate data
types, constraints, and relationships.
a. Students
b. Courses
c. Enrollments
d. Teacher
e. Payments*/

--create a table students
create table Students(
student_id int identity(1,1) primary key Not NULL,
first_name varchar(20),
last_name varchar(20),
date_of_birth date,
email varchar(50),
phone_number varchar(50))

--create a table teacher 
create table Teacher(
teacher_id int identity(1,1) primary key Not NULL,
first_name varchar(20),
last_name varchar(20),
email varchar(50))

--create a table courses
create table Courses(
course_id int Not NULL primary key,
course_name varchar(25),
credits int,
teacher_id int,
foreign key(teacher_id) references Teacher(teacher_id))

--create a table enrollments
create table Enrollments(
enrollment_id int Not NULL primary key,
student_id int,
foreign key(student_id) references Students(student_id),
course_id int,
foreign key(course_id) references Courses(course_id),
enrollment_date date)

--create a table payments
create table Payments(
payment_id int identity(1,1) primary key Not NULL,
student_id int,
foreign key(student_id) references Students(student_id),
amount decimal,
payment_date date)

--3. Create an ERD (Entity Relationship Diagram) for the database.

--4. Create appropriate Primary Key and Foreign Key constraints for referential integrity.

/*5. Insert at least 10 sample records into each of the following tables.
i. Students
ii. Courses
iii. Enrollments
iv. Teacher
v. Payments*/

insert into Students values
('Angelin','Simon','2005-05-05','20euec013@skcet.ac.in','9874563210'),
('Lorena','Morgan','2006-02-16','lorenamorg@gmail.com',	'8745963210'),
('Crystal','James','2004-04-04','crystaljames@gamil.com','7698428610'),
('Ann','Wise','2009-03-27','annwise@gmail.com','6541230789'),
('Sherri','Mcclure','2001-02-10','sherrimcclure@gmail.com','5241378906'),
('Tabitha','Bernard','2007-07-15','tabithabern@gmail.com','4125639870'),
('Amy','Collier','2002-08-24','amycollier@gmail.com','3214569870'),
('Etta','Moses','2000-07-11','ettamos@gmail.com','2014569873'),
('Shauna','Schmitt','2007-07-08','shaunaschimtt@gmail.com','1024578963'),
('Helen','Koch','2003-10-25','helenkoch@gmail.com','9014785236')

--adding check constraint to date of birth
alter table Students
add constraint CHK_DateOfBirth
check (year(Date_of_birth) > 1990);

--check for the check constraint
insert into Students values
('Jwel','Anna','1985-05-05','jwelanna@gmail.com','9874563210')

insert into Teacher values
('Edward','Parks','edwardperk@gmail.com'),
('Ramiro','Medina','ramiromedi@gmail.com'),
('Pablo','Franklin','pablofrank@gmail.com'),
('Leroy','Perez','leroyperez@gmail.com'),
('Lorene','Bryan','lorenebryan@gmail.com'),
('Shein','Christensen','sheinchris@gmail.com'),
('Oliver','Fisher','oliverfisher@gmail.com'),
('Marcella','Mann','marcellamann@gmail.com'),
('Traci','Shaw','tracishaw@gmail.com'),
('Mae','Fernandez','maefern@gmail.com')

insert into Courses values
(2401,'Maths',4,1),
(2402,'Science',4,2),
(2403,'Social',4,3),
(2404,'English',3,4),
(2405,'Tamil',3,5),
(2406,'French',2,6),
(2407,'German',2,7),
(2408,'General Knowledge',2,8),
(2409,'Art and Crafts',1,9),
(2410,'Physical Education',1,10)

insert into Enrollments values
(1001,1,2409,'2023-06-01'),
(1002,2,2402,'2023-06-01'),
(1003,3,2407,'2023-06-01'),
(1004,4,2405,'2023-06-01'),
(1005,5,2406,'2023-06-01'),
(1006,6,2404,'2023-06-01'),
(1007,7,2408,'2023-06-01'),
(1008,8,2403,'2023-06-01'),
(1009,9,2401,'2023-06-01'),
(1010,10,2410,'2023-06-01')

insert into Payments values
(1,1,25000,'2024-02-20'),
(2,2,25000,'2024-02-21'),
(3,3,25000,'2024-02-23'),
(4,4,25000,'2024-02-22'),
(5,5,18000,'2024-02-21'),
(6,8,28000,'2024-02-23'),
(7,6,30000,'2024-02-20'),
(8,8,30000,'2024-02-21'),
(9,9,25000,'2024-02-22'),
(10,4,18000,'2024-02-22')


--Tasks 2: Select, Where, Between, AND, LIKE:

/*1. Write an SQL query to insert a new student into the "Students" table with the following details:
a. First Name: John
b. Last Name: Doe
c. Date of Birth: 1995-08-15
d. Email: john.doe@example.com
e. Phone Number: 1234567890*/
insert into Students(first_name,last_name,date_of_birth,email,phone_number) values ('John','Doe','1995-08-15','john.doe@example.com','1234567890')


/*2. Write an SQL query to enroll a student in a course. Choose an existing student and course and insert a record into the "Enrollments" table with the enrollment date*/

Update Enrollments 
set student_id=2,
 course_id=2402,
 enrollment_date='2023-06-02'
where enrollment_id=1002


/*3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and modify their email address*/

declare @mail varchar(25), @tid int
set @mail = 'ramiromed@gmail.com'
set @tid = 2
update Teacher
set email=@mail
where teacher_id=@tid


/*4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select an enrollment record based on the student and course*/
delete from Enrollments
where student_id=9 and course_id=2401


/*5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables*/
update Courses
set teacher_id=5
where course_id=2404


/*6. Delete a specific student from the "Students" table and remove all their enrollment records from the "Enrollments" table. Be sure to maintain referential integrity*/
declare @sid int
set @sid=14
delete from Students 
where student_id=@sid


/*7. Update the payment amount for a specific payment record in the "Payments" table. Choose any payment record and modify the payment amount*/
declare @id int,@amt decimal
set @id=6
set @amt=28000
update Payments
set amount=@amt
where payment_id=@id


--Task 3. Aggregate functions, Having, Order By, GroupBy and Joins:

/*1. Write an SQL query to calculate the total payments made by a specific student. You will need to join the "Payments" table with the "Students" table based on the student's ID*/ 

select s.student_id,s.first_name,s.last_name,
sum(p.amount) as [Total Payment]
from Students s
join 
Payments p 
on s.student_id=p.student_id
where s.student_id=4
group by s.student_id,s.first_name,s.last_name


/*2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each course. Use a JOIN operation between the "Courses" table and the "Enrollments" table*/

select c.course_id, c.course_name,
count(e.student_id) as [Student Count]
from Courses c
join 
Enrollments e
on c.course_id=e.course_id
group by c.course_id,c.course_name


/*3. Write an SQL query to find the names of students who have not enrolled in any course. Use a LEFT JOIN between the "Students" table and the "Enrollments" table to identify students without enrollments*/

select s.student_id,s.first_name,s.last_name
from Students s
left join 
Enrollments e
on s.student_id= e.student_id
where e.student_id is NULL


/*4. Write an SQL query to retrieve the first name, last name of students, and the names of the courses they are enrolled in. Use JOIN operations between the "Students" table and the "Enrollments" and "Courses" tables*/

select s.first_name,s.last_name,c.course_name
from Students s
join Enrollments e
on s.student_id=e.student_id
join Courses c
on e.course_id=c.course_id


/*5. Create a query to list the names of teachers and the courses they are assigned to. Join the "Teacher" table with the "Courses" table.*/

select t.first_name,t.last_name,c.course_name
from Teacher t
join Courses c
on t.teacher_id=c.teacher_id


/*6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the "Students" table with the "Enrollments" and "Courses" tables.*/

select s.first_name,s.last_name,e.enrollment_date
from Students s
join Enrollments e
on s.student_id=e.student_id
join Courses c
on e.course_id=c.course_id
where c.course_id=2405


/*7. Find the names of students who have not made any payments. Use a LEFT JOIN between the "Students" table and the "Payments" table and filter for students with NULL payment records.*/

select s.student_id,s.first_name,s.last_name
from Students s
left join Payments p
on s.student_id=p.student_id
where p.student_id is Null


/*8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN between the "Courses" table and the "Enrollments" table and filter for courses with NULL enrollment records.*/

select c.course_name,c.course_id
from Courses c
left join Enrollments e
on c.course_id=e.course_id
where e.course_id is Null


/*9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" table to find students with multiple enrollment records.*/

Select DISTINCT e1.student_id, s.first_name, s.last_name
from Enrollments e1
join Enrollments e2 
on e1.student_id = e2.student_id and e1.enrollment_id != e2.enrollment_id
join  Students s on e1.student_id = s.student_id


/*10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" table and the "Courses" table and filter for teachers with NULL course assignments.*/

select t.teacher_id,t.first_name,t.last_name
from Teacher t
left join Courses c
on t.teacher_id=c.teacher_id
where c.teacher_id is Null


--Task 4. Subquery and its type:
/*1. Write an SQL query to calculate the average number of students enrolled in each course. Use aggregate functions and subqueries to achieve this.*/

select avg(Students_Enrolled) as [Avg Students Enrolled]
from  (select course_id, count(student_id) as Students_Enrolled
from Enrollments 
Group by course_id ) 
as Counts


/*2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum payment amount and then retrieve the student(s) associated with that amount.*/

select student_id, 
sum(amount) as TotalPayment 
from Payments 
group by student_id 
having sum(amount)=(select max(payment.Total_amount) as Max_amount from
(select sum(amount) as [Total_amount] 
from Payments 
group by student_id) payment)


/*3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the course(s) with the maximum enrollment count.*/

select course_id,course_name,enrollment_count from(
select c.course_id, c.course_name,(
select COUNT(*)
from Enrollments e
where e.course_id = c.course_id) as enrollment_count
from Courses c) as courses_enrollments
where enrollment_count = (select MAX(enrollment_count)
from(select course_id,
COUNT(*) as enrollment_count
from Enrollments
group by course_id
) as course_enrollments)


/*4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum payments for each teacher's courses.*/

select t.teacher_id,t.first_name,t.last_name, 
sum(p.amount) as [Total Payments]
from Teacher t
join courses c 
on t.teacher_id = c.teacher_id
join enrollments e 
on c.course_id = e.course_id
join payments p 
on e.student_id = p.student_id
group by t.teacher_id, t.first_name,t.last_name


/*5. Identify students who are enrolled in all available courses. Use subqueries to compare a student's enrollments with the total number of courses*/

select student_id, first_name, last_name
from students
where (select count(distinct course_id) from courses) = 
(select count(distinct course_id)
from enrollments
where enrollments.student_id = students.student_id)


/*6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to find teachers with no course assignments. */

select first_name, last_name
from Teacher
where teacher_id not in (select distinct teacher_id from courses)


/*7. Calculate the average age of all students. Use subqueries to calculate the age of each student based on their date of birth.*/

select Avg(age) as [Average age] from(
select datediff(YEAR, date_of_birth, getdate()) as age
from Students) as student_age


/*8. Identify courses with no enrollments. Use subqueries to find courses without enrollment records. */

select course_id , course_name
from Courses 
where course_id not in(
select distinct course_id from enrollments)


/*9. Calculate the total payments made by each student for each course they are enrolled in. Use subqueries and aggregate functions to sum payments.*/

select s.student_id,s.first_name,s.last_name,e.course_id,c.course_name,(
select ISNULL(sum(amount), 0)
from Payments p
where p.student_id = s.student_id) AS total_payments
from Students s, Enrollments e, Courses c
where e.student_id = s.student_id AND e.course_id = c.course_id


/*10. Identify students who have made more than one payment. Use subqueries and aggregate functions to count payments per student and filter for those with counts greater than one. */

select student_id,first_name,last_name
from Students s
where(
        select count(*) from Payments p
        where p.student_id = s.student_id) > 1


/*11. Write an SQL query to calculate the total payments made by each student. Join the "Students" table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student. */

select s.student_id,s.first_name, s.last_name,SUM(p.amount) as [Total Payments]
from Students s
left join Payments p 
on s.student_id = p.student_id
Group by s.student_id, s.first_name,s.last_name


/*12. Retrieve a list of course names along with the count of students enrolled in each course. Use JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments.*/ 

select c.course_name, count(e.student_id) as [Students Enrolled]
from Courses c
left join Enrollments e 
on c.course_id = e.course_id
group by course_name


/*13. Calculate the average payment amount made by students. Use JOIN operations between the "Students" table and the "Payments" table and GROUP BY to calculate the average. */

select  s.student_id, s.first_name , s.last_name ,Avg(p.amount) as [Average amount] 
from Students s 
left join Payments p 
on s.student_id = p.student_id
group by s.student_id, s.first_name,s.last_name
