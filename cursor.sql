set serveroutput on
declare
d_name dept.dept_name%Type;
cursor cur_dept is
select dept_name into d_name from dept where no_of_student=120;
begin
DBMS_OUTPUT.PUT_LINE('dept Name where no of student 120: '); 
if not cur_dept%isopen
then
open cur_dept;
end if;
loop
fetch cur_dept into d_name;
exit when cur_dept%notfound;
DBMS_OUTPUT.PUT_LINE('dept Name=' || cur_dept%rowcount||':'||d_name);
end loop;
close cur_dept;
end;
/
