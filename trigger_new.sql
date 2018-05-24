/*<TOAD_FILE_CHUNK>*/
SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER trigger_new
after insert ON relation 
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
Declare
bok integer;
BEGIN
update book set course_offering=course_offering+1 where book_no=:n.book_no;
END;
/

/*<TOAD_FILE_CHUNK>*/
show errors;
select * from user_triggers;
drop trigger TRIGGER_NEW;

