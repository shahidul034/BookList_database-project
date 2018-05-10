set serveroutput on
declare 
f utl_file.file_type;
line varchar(1000);
id person.ID%type;
name  person.name%type;
salary  person.salary%type;
begin
  f:=utl_file.fopen('MYDIRECTORY','p_data.CSV','R');
  if utl_file.is_open(f) then
  utl_file.get_line(f,line,1000);
  loop begin
  utl_file.get_line(f,line,1000);
  if line is null then exit;
  end if;
  id:=regexp_substr(line,'[^,]+',1,1);
  name:=regexp_substr(line,'[^,]+',1,2);
  salary:=regexp_substr(line,'[^,]+',1,3);
  insert into person values(id,name,salary);
  commit;
  exception
  when no_data_found then exit;
  end;
  end loop;
  end if;
  utl_file.fclose(f); 
  end;
  / 