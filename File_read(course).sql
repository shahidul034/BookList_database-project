set serveroutput on
declare 
f utl_file.file_type;
line varchar(1000);
course_no course.course_no%type;
course_name  course.course_name%type;
year_semister  course.year_semister%type;
credit  course.credit%type;
dept_id  course.dept_id%type;
begin
  f:=utl_file.fopen('MY','COURSE.CSV','R');                                                                                                                                                                                                                                                                                                     
  if utl_file.is_open(f) then
  utl_file.get_line(f,line,1000);
  loop begin
  utl_file.get_line(f,line,1000);
  if line is null then exit;
  end if;
  course_no:=regexp_substr(line,'[^,]+',1,1);
  course_name:=regexp_substr(line,'[^,]+',1,2);
  year_semister:=regexp_substr(line,'[^,]+',1,3);
  credit:=regexp_substr(line,'[^,]+',1,4);
  dept_id:=regexp_substr(line,'[^,]+',1,5);
  insert into course values(course_no,course_name,year_semister,credit,dept_id);
  commit;
  exception
  when no_data_found then exit;
  end;
  end loop;
  end if;
  utl_file.fclose(f); 
  end;
  / 