# 1.查询同时存在1课程和2课程的情况
select * from student_course where courseId in (1,2);
# 2.查询同时存在1课程和2课程的情况
select * from student_course where courseId in (1,2);
# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
select s.Id,s.name,avg(sc.score) as avg from student s,student_course sc where s.id = sc.studentId group by s.id,s.name having avg > 60;
# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
select * from student where id not in (select s.id from student s,student_course sc where s.id = sc.studentId group by s.id);
# 5.查询所有有成绩的SQL
select s.id from student s,student_course sc where s.id = sc.studentId group by s.id, s.name;
# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
select * from student 
where id in (
	select sc.studentId from student_course sc 
	where sc.studentId in (
		select sc.studentId from student_course sc 
		where sc.courseId = '1') 
	and sc.courseId = '2');
# 7.检索1课程分数小于60，按分数降序排列的学生信息
select * from student_course sc join student s on sc.score < 60 and sc.courseId = '1'  and sc.studentId = s.id order by score desc;
# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
select sc.courseId as id,avg(sc.score) as avg from student_course sc where 1=1 group by sc.courseId order by avg,id;
# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
select s.name, t1.score from student s 
join (
	select sc.studentId,sc.score from course c 
	join student_course sc 
	on c.name = '数学' and c.id = sc.courseId and sc.score < 60) 
as t1 
on s.id = t1.studentId;