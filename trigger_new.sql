SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER trigger_new
before insert ON relation 
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
Enable
BEGIN
update book set course_offering=course_offering+1 where book_no in (select book_no from relation where course_no=:n.course_no and book_no=:n.book_no);
 
END;
/
show errors;