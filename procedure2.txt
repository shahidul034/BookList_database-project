set serveroutput on
create or replace procedure proc2(var1 In number,var2 out varchar) AS
t_show char(30);
begin
t_show:='From procedure: ';
select  course_name into var2 from course where course_no in(select course_no from relation  where book_no=var1);  
dbms_output.put_line(t_show || var2 ||' library code is '|| var1);
end;
/
show error procedure proc2;

