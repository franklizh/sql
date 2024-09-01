use student2
go 
if exists(select name from sysobjects
where name='proc_student1'and type='p')
	drop procedure proc_student1
go
create procedure pro_student1
as
declare cur_student1 cursor
	for select dormno,tele from dbo.dorm
open cur_student1
declare @dormnum varchar(5),@telephone varchar(10)
fetch next from cur_student1 into
	@dormnum,@telephone
	while @@fetch_status=0
begin 
select'Àﬁ…·√˚'=@dormnum,'µÁª∞'=@telephone
fetch next from cur_student1 into
	@dormnum,@telephone
end
close cur_student1
deallocate cur_student1
go
exec pro_student1