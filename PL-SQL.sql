set serveroutput on
declare
new_course_name course.course_name%type;
DEPT_name dept.DEPT_NAME%type;
book_num book.book_name%type;
value dept.dept_name%type;
counter2 number;
TYPE NAMEARRAY IS VARRAY(5) OF course.course_name%type;  --array declare
A_NAME NAMEARRAY:=NAMEARRAY();
counter number;
begin
dbms_output.put_line('DEPT_name: ');
select dept_name into DEPT_name from dept where dept_name='CSE';
dbms_output.put_line(DEPT_name);
counter:=12;
counter2:=1;
dbms_output.put_line('book_name: ');
for counter in 12..16  --- for loop
loop
select book_name into book_num from book where book_no=counter;
A_NAME.EXTEND();
A_NAME(counter2):=book_num;
counter2:=counter2+1;
if book_num='discreate math'  ---if condition
then
dbms_output.put_line(book_num||' is a '||'CSE course');
elsif book_num='electrical engineering'  --else if condition
then
dbms_output.put_line(book_num||' is a '||'EEE course');
else 
dbms_output.put_line(book_num||' is a '||'other dept course');
end if;
dbms_output.put_line(book_num);
end loop;
counter2:=1;
dbms_output.put_line('loop: ');
 WHILE counter2<=A_NAME.COUNT  --while loop
LOOP 
DBMS_OUTPUT.PUT_LINE(A_NAME(counter2)); -- array print
 counter2:=counter2+1;
   END LOOP;
proc1('CSE1101');   
proc2(15,new_course_name); 
proc3(7);
value:=fun(7);
DBMS_OUTPUT.PUT_LINE('function value: ' || value);

 
end;
/





