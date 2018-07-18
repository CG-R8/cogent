SQL Assignment

Create tables are as follows:
student (sid, sname, sex, age, year, gpa) 
dept (dname, numphds) 
prof (pname, dname) 
course (dname, cno, cname) 
major (dname, sid) 
section (dname, cno, sectno, pname) 
enroll (sid, dname, cno, sectno, grade)

Left 4 5 6 11 12
Fix  8 9


insert some records to all the tables pertaining to the following and write the queries.

1. Print the names of professors who work in departments that have fewer than 50 PhD students. 

2. Print the names of the students with the lowest GPA. 

3. For each Computer Sciences class, print the class number, section number, and the average gpa of the students enrolled in the class. 
SELECT  enroll.dname, enroll.cno, enroll.sectno, student.AVG(gpa)
FROM enroll  JOIN 'student' on 
WHERE dname = 'Computer Science'

4. Print the names and section numbers of all classes with more than six students enrolled in them. 

5. Print the name(s) and sid(s) of the student(s) enrolled in the most classes. 

	enroll (sid, dname, cno, sectno, grade)
	student (sid, sname, sex, age, year, gpa) 

6. Print the names of departments that have one or more majors who are under 18 years old. 

	student (sid, sname, sex, age, year, gpa) 
	major (dname, sid) 

7. Print the names and majors of students who are taking one of the College Geometry courses. 
	
8. For those departments that have no major taking a College Geometry course print the department name and the number of PhD students in the department. 

	course (dname, cno, cname) 
	dept (dname, numphds) 

9. Print the names of students who are taking both a Computer Sciences course and a Mathematics course. 

	student (sid, sname, sex, age, year, gpa) 
	major (dname, sid) 

10. Print the age difference between the oldest and the youngest Computer sciences major. 

	student (sid, sname, sex, age, year, gpa) 
	major (dname, sid) 

11. For each department that has one or more majors with a GPA under 1.0, print the name of the department and the average GPA of its majors. 

12. Print the ids, names and GPAs of the students who are currently taking all the Civil Engineering courses.