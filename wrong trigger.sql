SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER trigger3
after update ON dept 
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
Enable
BEGIN
 update dept set no_of_student=90 where dept_id=:o.dept_id;
END;
/