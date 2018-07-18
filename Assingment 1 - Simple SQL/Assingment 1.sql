/*
Create tables are as follows:
student (sid, sname, sex, age, year, gpa) 
dept (dname, numphds) 
prof (pname, dname) 
course (dname, cno, cname) 
major (dname, sid) 
section (dname, cno, sectno, pname) 
enroll (sid, dname, cno, sectno, grade)
*/

select * from user_tables;
CREATE TABLE student (
    sid int,
    sname varchar(255),
    sex varchar(255),
    age varchar(255),
    year int,
    gpa int
);

insert into student values ('1','ABC','M','10','2001',1);

select * from student;
select * from prof;
select * from dept;

select * from course;
--dept (dname, numphds) 
Create table dept (
dname varchar(255),
numphds int
);

--prof (pname, dname) 
Create table prof (
pname varchar(255),
dname varchar(255)
);



student (sid, sname, sex, age, year, gpa) 
insert into student valeus ('1','ABC','M','10','2001',1);


insert into student
values ('0001','Alan Smith','M','21','2015','3.8');

insert into student
values ('0002','Bob Jindall','M','24','2016','3.9');

insert into student
values ('0003','Claire Turnwood','F','25','2017','3.5');

insert into student
values ('0004','Diana Turner','F','20','2018','3.7');

insert into student
values ('0005','Jenna Mathews','F','23','2016','4.0');

insert into student
values ('0006','Suzie Paige','F','21','2018','4.0');
--

insert into student
values ('0007','Tom Hudgens','M','25','2018','3.8');

insert into student
values ('0008','Mathew Bates','M','21','2017','3.1');

insert into student
values ('0009','Sam Hogan','M','19','2017','3.2');

insert into student
values ('1231','Gordon Frimsey','M','20','2018','3.1');

insert into student
values ('1232','Faith Bian','M','20','2018','3.9');

insert into dept
values ('Computer Science','20');

insert into dept
values ('Projective Geometry','10');

insert into dept
values ('Affine Geometry','25');

insert into dept
values ('Civil Engineering','30');

insert into dept
values ('Mathematics','35');

insert into prof
values ('John Wick','Mathematics');

insert into prof
values ('Sun Hang','Computer Science');

insert into prof
values ('Somnus Erlang','Mathematics');

insert into prof
values ('Hal Forsen','Affine Geometry');

insert into prof
values ('Jessica Roberts','Projective Geometry');

insert into prof
values ('Selena Tropez','Projective Geometry');

insert into prof
values ('Greg Hal','Affine Geometry');

insert into prof
values ('Derek King','Mathematics');

insert into prof
values ('Hamsa Mohan','Computer Science');




--course (dname, cno, cname) 
Create table course (
dname varchar(255),
cno int,
cname varchar(255)
);
select * from course;
insert into course values ('Projective Geometry','1','PG1');
insert into course values ('Projective Geometry','2','PG2');
insert into course values ('Affine Geometry','1','AG1');
insert into course values ('Affine Geometry','2','AG2');
insert into course values ('Civil Engineering','1','CE1');
insert into course values ('Mathematics','1','MM1');
insert into course values ('Mathematics','2','MM2');


--major (dname, sid) 
Create table major (
dname varchar(255),
sid int
);
insert into major values ('Computer Science','1');
insert into major values ('Projective Geometry','2');
insert into major values ('Affine Geometry','3');
insert into major values ('Affine Geometry','4');
insert into major values ('Civil Engineering','5');
insert into major values ('Mathematics','5');
select * from major;

--section (dname, cno, sectno, pname) 
Create table section (
dname varchar(255),
cno int,
sectno int,
pname varchar(255)
);
insert into section values ('Computer Science','1','100','Sun Hang');
insert into section values ('Projective Geometry','1','200','Jessica Roberts');
insert into section values ('Projective Geometry','2','300','Jessica Roberts');
insert into section values ('Affine Geometry','1','400','Greg Hal');
insert into section values ('Affine Geometry','2','500','Hal Forsen');
insert into section values ('Mathematics','1','700','Somnus Erlang');
insert into section values ('Mathematics','2','800','John Wick');

select * from section;
--enroll (sid, dname, cno, sectno, grade)
Create table enroll (
sid int,
dname varchar(255),
cno int,
sectno int,
grade varchar(255)
);


insert into enroll values ('1','Computer Science','1','100','A');
insert into enroll values ('2','Projective Geometry','1','200','B');
insert into enroll values ('3','Projective Geometry','2','300','C');
insert into enroll values ('4','Affine Geometry','1','400','D');
insert into enroll values ('5','Affine Geometry','2','500','A');
insert into enroll values ('6','Mathematics','1','700','A');
insert into enroll values ('7','Mathematics','2','800','B');
select * from enroll;

--1. Print the names of professors who work in departments that have fewer than 50 PhD students. 
select pname from dept inner join prof on dept.dname = prof.dname where dept.numphds > 50;
--2. Print the names of the students with the lowest GPA. 
select sname from student where gpa = (select MIN(gpa) from student);
--3. For each Computer Sciences class, print the class number, section number, and the average gpa of the students enrolled in the class. 
SELECT  enroll.dname, enroll.cno, enroll.sectno, AVG(student.gpa)
FROM enroll  JOIN student ON enroll.sid = student.sid 
WHERE dname = 'Computer Science'
group by enroll.dname, enroll.cno, enroll.sectno;

--4. Print the names and section numbers of all classes with more than six students enrolled in them. 
select course.cname,enroll.sectno from enroll inner join course on (enroll.cno = course.cno and enroll.dname = course.dname)
group by enroll.cno,enroll.dname,course.cname,enroll.sectno  having count(*)>6;
/*
5. Print the name(s) and sid(s) of the student(s) enrolled in the most classes. 
	enroll (sid, dname, cno, sectno, grade)
	student (sid, sname, sex, age, year, gpa) 
*/
select student.sname,student.sid from student inner join enroll on student.sid = student.sid 
where stundet.sid IN 


/*6. Print the names of departments that have one or more majors who are under 18 years old. 
	student (sid, sname, sex, age, year, gpa) 
	major (dname, sid) 
*/
;
select major.dname from major inner join student ON student.sid = major.sid 
where
student.age >18;


--7. Print the names and majors of students who are taking one of the College Geometry courses. 
select student.sname, major.dname from student inner join major on student.sid = major.sid 
where
major.dname like '%Geometry%';
/*
8. For those departments that have no major taking a College Geometry course print the department name and the 
number of PhD students in the department. 
	course (dname, cno, cname) 
	dept (dname, numphds) 
*/

select dept.numphds, dept.dname from dept inner join course on dept.dname = course.dname 
where
dept.dname not like '%Geometry%';
/*
9. Print the names of students who are taking both a Computer Sciences course and a Mathematics course. 
	student (sid, sname, sex, age, year, gpa) 
	major (dname, sid) 
*/
select student.sname from major inner join student ON student.sid = major.sid 
where
major.dname NOT in ('Mathematics' , 'Computer Science');


/*
10. Print the age difference between the oldest and the youngest Computer sciences major. 
	student (sid, sname, sex, age, year, gpa) 
	major (dname, sid) 
*/

select MAX(student.age)-MIN(student.age) from major inner join student ON student.sid = major.sid 
where
major.dname = 'Computer Science';

/*
--11. For each department that has one or more majors with a GPA under 1.0, 
--print the name of the department and the average GPA of its majors. 
*/
select major.dname,AVG(student.gpa) from major inner join student ON student.sid = major.sid 
where
student.gpa < 5 group by major.dname ;

--12. Print the ids, names and GPAs of the students who are currently taking all the Civil Engineering courses.
select student.sid,student.sname,student.gpa from major inner join student ON student.sid = major.sid 
where
major.dname = 'Civil Engineering';
