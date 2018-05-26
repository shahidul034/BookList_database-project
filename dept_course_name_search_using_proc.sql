/*<TOAD_FILE_CHUNK>*/
set serveroutput on
create or replace procedure proc3(vari In varchar) AS
course_num course.course_name%type;
dpt_name dept.dept_name%type;
cursor ct is select course_name from course where dept_id=vari;
begin
select dept_name into dpt_name from dept where dept_id=vari;
DBMS_OUTPUT.PUT_LINE(dpt_name||': ');
open ct;
loop
fetch ct into course_num;
exit when ct%notfound;
DBMS_OUTPUT.PUT_LINE('Course Name ' || ct%rowcount||': '||course_num);
end loop;
close ct;
end;
/

