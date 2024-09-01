select sno,sname,dormno from dbo.student where dno=1 order by dormno
select * from dbo.student where dno=1 order by sex asc , sage desc
select sname,concat(2003-sage,SUBSTRING(sno,2,4))as birthday from dbo.student where dno=2
select g.cno 课程号 from dbo.student s,dbo.grade g where s.sno=g.sno and s.dno in(2,3,4)
select sname,dormno from dbo.student where sage between 21 and 23
select sname from dbo.student where dno in(2,3,4)
select * from dbo.student where sname like '张%'
select * from dbo.student where sname like '%明%'
select cno,teacher from dbo.course where cpno is null
select* from dbo.student where sex='男'and dno=1
select count(*) from dbo.student where dno=1
select max(g.score),min(g.score),AVG(g.score) from dbo.student s ,dbo.grade g  where s.sno=g.sno and s.dno=1 and g.cno='01'
select  g.cno,count(*) from dbo.grade g where g.sno in (select distinct sno from dbo.student where dno in (2,3,4) ) group by g.cno having count(*)>4
select distinct s.dormno ,d.head from dbo.student s,dbo.department d where s.dormno is not null
select sname ,dormno from dbo.student 
select cpno from dbo.course where
select cpno from dbo.course 
//间接查询
select x.cno,y.cpno
from dbo.course as x,course as y
where x.cpno=y.cpno;
select s.sname,g.cno,g.score from dbo.student s,dbo.grade g where s.sno=g.sno  
 select s.sno,s.sname,g.cno,c.teacher from dbo.grade g,dbo.student s,dbo.course c where s.sno=g.sno  and g.cno=c.cno
 select s.sname,m.tele from dbo.student s,dbo.department d,dbo.dorm m where s.dno=d.dno and d.head='秦峰'and m.dormno=s.dormno
 select * from dbo.grade where score<60
 select * from dbo.student where dno =1 and sage not in(select sage from dbo.student where sage>20) 
 select sno, AVG(score) from dbo.grade group by sno
 create table G_AVG( sno char(6),
 savg int)
 insert into G_AVG (sno,savg) values( select sno, AVG(score) from dbo.grade group by sno)



