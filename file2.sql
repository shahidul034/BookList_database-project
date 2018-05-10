select regexp_substr('kuet,khulna','[^u]+',1,2) from dual;
select * from person;
drop table person;
update dept set  faculty='CE' where dept_id=7;