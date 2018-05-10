set serveroutput on
declare 
f utl_file.file_type;
cursor c is select * from person;
begin
f:=utl_file.fopen('MYDIRECTORY','write.csv','W');
utl_file.put(f,'ID_person' ||','||'Name' ||','||'salary');
utl_file.new_line(f);
    for c_record in c
    loop
    utl_file.put(f,c_record.id ||','||c_record.Name ||','||c_record.salary);
    utl_file.new_line(f);
    end loop;
 utl_file.fclose(f);
 end;
 /