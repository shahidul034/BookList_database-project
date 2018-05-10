set serveroutput on
declare 
f utl_file.file_type;
line varchar(1000);
dept_id dept.dept_id%type;
dept_name  dept.dept_name%type;
faculty  dept.faculty%type;
no_of_student  dept.no_of_student%type;
begin
  f:=utl_file.fopen('MY','DEPT.CSV','R');                                                                                                                                                                                                                                                                                                     
  if utl_file.is_open(f) then
  utl_file.get_line(f,line,1000);
  loop begin
  utl_file.get_line(f,line,1000);
  if line is null then exit;
  end if;
  dept_id:=regexp_substr(line,'[^,]+',1,1);
  dept_name:=regexp_substr(line,'[^,]+',1,2);
  faculty:=regexp_substr(line,'[^,]+',1,3);
  no_of_student:=regexp_substr(line,'[^,]+',1,4);
  insert into dept values(dept_id,dept_name,faculty,no_of_student);
  commit;
  exception
  when no_data_found then exit;
  end;
  end loop;
  end if;
  utl_file.fclose(f); 
  end;
  / 