SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER trigger2
after update ON course 
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
Enable
BEGIN
update book set book_name=:n.course_name where book_no in (select book_no from relation where course_no=:o.course_no);
 
END;
/