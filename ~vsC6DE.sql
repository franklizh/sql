exec sp_addlogin 'main','666','student2'
exec sp_helplogins
grant all privileges
on dbo.student
to main
with grant option

revoke update(sname)
on dbo.student
from main CASCADE
 
 grant  select
on student2.dbo.grade
to main
with grant option

grant all privileges
on student2.dbo.grade
to main
with grant option

revoke all privileges
on student2.dbo.grade
from main CASCADE

exec sp_addlogin 'wang','666','student2'
go
exec sp_grantdbaccess 'wang','USERi'

create role USTU;
grant select
on dbo.student
to USTU ;
grant select,delete
on dbo.student
to USTU ;
grant insert
on dbo.course
to USTU ;
grant update(score)
on dbo.grade
to USTU ;


alter role USTU
add member USERi
