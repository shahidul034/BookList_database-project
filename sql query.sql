------DDL-------
--drop table amni;
alter table dept add location char(20);
alter table dept modify location varchar(23);
alter table dept rename column location to location2;
select * from dept; 
select* from tab;
------DML--------
insert into dept(dept_id,dept_name,faculty,no_of_student,location2)values(12,'URP','CE',60,'khulna');
update dept set location2='ctg' where dept_id=12;
delete from  dept where dept_id=12;-- delete the row
alter table dept drop column location2; --DDL--
select * from dept where dept_name like '%E%';
select * from dept order by dept_name;
---aggregate function---
select count(*) from dept; 
select count(dept_name) as number_of_dept from dept;
select count(distinct dept_name) as number_of_dept from dept;
select dept_name,avg(no_of_student) from dept group by dept_name;
select dept_name,avg(no_of_student) from dept group by dept_name having avg(no_of_student)>100;
select sum(no_of_student) from dept;
            ---- JOIN------
select * from dept where dept_name in(select dept_name from dept where dept_id=7);
select dept_name,course_name from dept natural join course where dept_id=7;
select dept_name,course_name from dept join course using(dept_id);
select dept_name,course_name from dept left outer join course using(dept_id);
select dept_name,course_name from dept right outer join course using(dept_id);
select dept_name,course_name from dept full outer join course using(dept_id);



