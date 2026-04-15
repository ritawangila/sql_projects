create schema nairobi_academy;

set search_path =nairobi_academy;

create table students(
student_id INT primary key,
first_name VARCHAR(50) not null,
last_name VARCHAR(50) not null,
gender VARCHAR(1)not null,
date_of_birth DATE ,
class VARCHAR(10),
city VARCHAR(50) );

select *from students;


create table subjects(
student_id INT primary key,
subject_name VARCHAR(100) not null unique,
department VARCHAR (50) ,
teacher_name VARCHAR (100),
credits INT);

select *from subjects;


create table exam_results(
result_id INT primary key,
student_id INT not null,
subject_id INT not null,
marks INT not null,
exam_date DATE,
grade VARCHAR(2) 
);


---q5 ALTER students table add phone_number column VARCHAR (20)

select *from students;

alter table students 
add column phone_number VARCHAR(20);

select *from students;

---Q6. Rename credits column in the subjects table to credit_hours.

select * from subjects;

alter table subjects 
rename credits to credit_hours;

---Q7. Remove the column phone_number from students table

alter table students
drop column phone_number;

select * from students;

---Q8. Insert all 10 students into the students table

insert into students (student_id,first_name,last_name, gender,date_of_birth,class,city)
values 
(1, 'Amina', 'Wanjiku','F','2008-03-12','Form 3','Nairobi'),
(2, 'Brian', 'Ochieng','M','2007-07-25', 'Form 4', 'Mombasa'),
(3, 'Cynthia', 'Mutua', 'F', '2008-11-05', 'Form 3', 'Kisumu'),
(4, 'David', 'Kamau', 'M', '2007-02-18', 'Form 4', 'Nairobi'),
(5, 'Esther', 'Akinyi', 'F', '2009-06-30', 'Form 2', 'Nakuru'),
(6, 'Felix', 'Otieno', 'M', '2009-09-14', 'Form 2', 'Eldoret'),
(7, 'Grace', 'Mwangi', 'F', '2008-01-22', 'Form 3', 'Nairobi'),
(8, 'Hassan', 'Abdi', 'M', '2007-04-09', 'Form 4', 'Mombasa'),
(9, 'Ivy', 'Chebet', 'F', '2009-12-01', 'Form 2', 'Nakuru'),
(10, 'James', 'Kariuki', 'M', '2008-08-17', 'Form 3', 'Nairobi');

select * from students;

---Q9. Insert all 10 subjects into the subjects table.
select * from subjects;

insert into subjects(student_id,subject_name,department,teacher_name,credit_hours)
values 
(1, 'Mathematics','Sciences','Mr.Njoroge',4),
(2, 'English', 'Languages', 'Ms. Adhiambo', 3),
(3, 'Biology', 'Sciences', 'Ms. Otieno', 4),
(4, 'History', 'Humanities', 'Mr. Waweru', 3),
(5, 'Kiswahili', 'Languages', 'Ms. Nduta', 3),
(6, 'Physics', 'Sciences', 'Mr. Kamande', 4),
(7, 'Geography', 'Humanities', 'Ms. Chebet', 3),
(8, 'Chemistry', 'Sciences', 'Ms. Muthoni', 4),
(9, 'Computer Studies', 'Sciences', 'Mr. Oduya', 3),
(10, 'Business Studies', 'Humanities', 'Ms. Wangari', 3);

---Q10. Insert all 10 exam results into the exam_results table
select* from exam_results;

insert into exam_results (result_id,student_id,subject_id,marks,exam_date,grade)
values
(1, 1, 1, 78,'2024-03-15','B'),
(2, 1, 2, 85, '2024-03-16', 'A'),
(3, 2, 1, 92, '2024-03-15', 'A'),
(4, 2, 3, 55, '2024-03-17', 'C'),
(5, 3, 2, 49, '2024-03-16', 'D'),
(6, 3, 4, 71, '2024-03-18', 'B'),
(7, 4, 1, 88, '2024-03-15', 'A'),
(8, 4, 6, 63, '2024-03-19', 'C'),
(9, 5, 5, 39, '2024-03-20', 'F'),
(10, 6, 9, 95, '2024-03-21', 'A');


select * from exam_results;

---Q11. run a SELECT query to confirm all 10 rows exist in each of the three tables.
---Done after each table


---Q12. UPDATE Esther Akinyi's city from Nakuru to Nairobi . (Her student_id is 5)

update students 
set city= 'Nairobi'
where student_id=5;

select *from students;

---Q13. Change result_id 5 marks from 49 to 59

update exam_results
set marks= 59,
Grade= 'C'
where result_id=5;

---Q14. Delete exam results for result_id 9 from the exam_results table

delete from exam_results
where result_id= 9;


		---SECTION C  Querying the Data (Filtering with WHERE)
----Q15. Write a query to find all students who are in Form 4.
select * from students;

select * from students
where class ='Form 4';

---Q16. Write a query to find all subjects in the Sciences department.

select *from subjects; 

select *from subjects 
where department='Sciences';

---Q17. Write a query to find all exam results where the marks are greater than or equal to 70.
select * from exam_results;

select * from exam_results
where marks >=70;

---Q18. Write a query to find all female students only. (Hint: gender = 'F')
select * from students;

select * from students 
where gender= 'F';

---Q19. Write a query to find all students who are in Form 3 AND from Nairobi.

select *from students 
where (class='Form 3' and City = 'Nairobi');


---Q20. Write a query to find all students who are in Form 2 OR Form 4.

select *from students 
where class='Form 2' or class= 'Form 4';

			---	PART 2
---Q1. Write a query to find all exam results where marks are between 50 and 80 (inclusive).
select * from exam_results;


select result_id,marks
from exam_results
where marks between 50 and 80;

---Q2. Write a query to find all exams that took place between 15th March 2024 and 18th March 2024.

select subject_id,exam_date
from exam_results
where exam_date between '2024-03-15' and '2024-03-18';

---Q3. Write a query to find all students who live in Nairobi, Mombasa, or Kisumu - use IN.
select *from students;

select student_id, first_name,city
from students
where city in ('Nairobi','Mombasa','Kisumu');

---Q4. Write a query to find all students who are NOT in Form 2 or Form 3 - use NOT IN.

select student_id,first_name,class
from students
where class not in ('Form 2','Form 3');

---Q5. Write a query to find all students whose first name starts with the letter 'A' or 'E' - use LIKE.

select *from students
where first_name like 'A%' or first_name like 'E%';


---Q6. Write a query to find all subjects whose subject name contains the word 'Studies'.

select *from subjects
where subject_name like '%Studies%';

			--------COUNT
---Q7. How many students are currently in Form 3? 
select *from students;

select count (*) as form3_students
from students
where class='Form 3';

----Q8. How many exam results have a mark of 70 or above?
select * from exam_results;

select count(*) as scoreabove_70
from exam_results
where marks >=70;
			
			-----SECTION C - CASE WHEN
---Q9. grade description:'Distinction' if marks >= 80,'Merit' if marks >= 60, 'Pass' if marks >= 40,'Fail' if marks below 40
select *from exam_results;

select 
result_id,
student_id
marks,
case 
	when marks >=80 then 'Distinction'
		when marks >=60 then 'Merit'
			when marks >=40 then 'Pass'
else 'Fail'
end as perfomance
from exam_results;

---Q10. Write a query using CASE WHEN to label each student as:
---'Senior' if they are in Form 3 or Form 4
---'Junior' if they are in Form 2 or Form 1

select * from exam_results;

select 
first_name,
last_name,
class,
case
	when class IN ('Form 3', 'Form 4') then 'Senior'
       else 'Junior'  
    end as student_level
from students;















