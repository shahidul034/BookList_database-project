set serveroutput on
create or replace function fun(var1 in varchar) return varchar AS
value dept.dept_name%type;
begin
  select dept_name into value from dept where dept_id=var1; 
   return value;
end;
/
show error function fun;

