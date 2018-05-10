set serveroutput on
declare 
f utl_file.file_type;
cursor c is select * from DEPT;
begin
f:=utl_file.fopen('MY','NEW_DEPT.csv','W');
utl_file.put(f,'dept_id' ||','||'dept_name' ||','||'faculty'||','||'no_of_student');
utl_file.new_line(f);
    for c_record in c
    loop
    utl_file.put(f,c_record.dept_id ||','||c_record.dept_name ||','||c_record.faculty||','||c_record.no_of_student);
    utl_file.new_line(f);
    end loop;
 utl_file.fclose(f);
 end;
 /