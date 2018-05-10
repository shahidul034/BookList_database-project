SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER try
BEFORE delete ON relation 
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
BEGIN
delete from book where book_no=:o.book_no;
delete from course where course_no=:o.course_no;
END;
/