create database student_system ; 
use student_system ; 

create table student (
id int primary key auto_increment , 
name varchar(30) , 
class  varchar(30) 
) ; 
INSERT INTO student (name, class)
VALUES 
("Pawan", "BCA-1"),
("Shiv", "BCA-1"),
("Rohit", "BCA-2"),
("Aman", "BCA-2");

select * from student ;


create table marks(
id int primary key auto_increment , 
student_id int  ,
subject varchar(30) , 
marks int ,
 FOREIGN KEY (student_id) REFERENCES student(id)
) ; 

INSERT INTO marks (student_id, subject, marks)
VALUES
(1, "Maths", 80),
(1, "English", 70),
(2, "Maths", 60),
(2, "English", 65),
(3, "Maths", 90),
(3, "English", 85),
(4, "Maths", 50),
(4, "English", 55);
select*from marks ; 

select s.name , s.class, m.subject , m.marks
from student s 
join marks m on s.id = m.student_id ; 


select s.name , sum(m.marks) as total_marks 
from student s 
join marks m on s.id = m.student_id 
group by s.id 
order by total_marks desc ;

select s.name , 
    avg(m.marks) as avg_marks ,
    case 
       when avg(m.marks)>=75 then 'A'
       when avg(m.marks)>=60 then 'B'
        when avg(m.marks)>40 then 'C'
       else 'fail' 
       end as grade 
   from student s 
   JOIN marks m ON s.id = m.student_id
GROUP BY s.id;
       
       