set serveroutput on
create or replace procedure proc1(vari In varchar) AS
book_num book.book_name%type;
t_show char(30);
begin
t_show:='from procedure: ';
select book_name into book_num from book where book_no in(select book_no from relation where course_no=vari);  
dbms_output.put_line(t_show || book_num||' is needed for '|| vari);
end;
/

show error procedure proc1;

