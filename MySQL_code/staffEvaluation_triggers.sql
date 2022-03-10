DELIMITER $
DROP trigger IF EXISTS upd_completed$
CREATE TRIGGER upd_completed
AFTER INSERT ON evaluationresult
FOR EACH ROW
BEGIN	    
    UPDATE evaluation
    set completed = true 
    where job_id = new.job_id AND empl_username = new.empl_username;
END $
DELIMITER ;


# 4.2 #
DELIMITER $
DROP trigger IF EXISTS company_upd$
CREATE TRIGGER company_upd
BEFORE UPDATE ON company
FOR EACH ROW
BEGIN
	IF (old.AFM != new.AFM) THEN SET NEW.AFM = OLD.AFM;  END IF;
	IF (old.DOY != new.DOY) THEN SET NEW.DOY = OLD.DOY;  END IF;
	IF (old.name != new.name) THEN SET NEW.name = OLD.name;  END IF;
		 
END$
DELIMITER ;


# 4.3 #
DELIMITER $
DROP trigger IF EXISTS admin_check$
CREATE TRIGGER admin_check
BEFORE UPDATE ON user
FOR EACH ROW
BEGIN
	
		 
END$
DELIMITER ;


# 4.1 #

DELIMITER $
DROP trigger IF EXISTS job_insert$
CREATE TRIGGER job_insert
AFTER INSERT ON job
FOR EACH ROW
BEGIN
	insert into log (username, date_time, action, actiontype, actiontable) values (new.evaluator, current_timestamp(), 'Success', 'insert', 'job');
END$
DELIMITER ;


DELIMITER $
DROP trigger IF EXISTS job_update$
CREATE TRIGGER job_update
AFTER UPDATE ON job
FOR EACH ROW
BEGIN
	insert into log (username, date_time, action, actiontype, actiontable) values (new.evaluator, current_timestamp(), 'Success', 'update', 'job');	
END$
DELIMITER ;


DELIMITER $
DROP trigger IF EXISTS job_delete$
CREATE TRIGGER job_delete
AFTER DELETE ON job
FOR EACH ROW
BEGIN
	insert into log (username, date_time, action, actiontype, actiontable) values (old.evaluator, current_timestamp(), 'Success', 'delete', 'job');
END$
DELIMITER ;


DELIMITER $
DROP trigger IF EXISTS empl_insert$
CREATE TRIGGER empl_insert
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
	insert into log (username, date_time, action, actiontype, actiontable) values (new.username, current_timestamp(), 'Success', 'insert', 'employee');
END$
DELIMITER ;



DELIMITER $
DROP trigger IF EXISTS empl_update$
CREATE TRIGGER empl_update
AFTER UPDATE ON employee
FOR EACH ROW
BEGIN
	insert into log (username, date_time, action, actiontype, actiontable) values (new.username, current_timestamp(), 'Success', 'update', 'employee');	
END$
DELIMITER ;



DELIMITER $
DROP trigger IF EXISTS empl_delete$
CREATE TRIGGER empl_delete
AFTER DELETE ON employee
FOR EACH ROW
BEGIN
	insert into log (username, date_time, action, actiontype, actiontable) values (old.username, current_timestamp(), 'Success', 'delete', 'employee');
END$
DELIMITER ;


DELIMITER $
DROP trigger IF EXISTS reqEval_insert$
CREATE TRIGGER reqEval_insert
AFTER INSERT ON requestevaluation
FOR EACH ROW
BEGIN
	insert into log (username, date_time, action, actiontype, actiontable) values (new.empl_username, current_timestamp(), 'Success', 'insert', 'requestevaluation');
END$
DELIMITER ;



DELIMITER $
DROP trigger IF EXISTS reqEval_update$
CREATE TRIGGER reqEval_update
AFTER UPDATE ON requestevaluation
FOR EACH ROW
BEGIN
	insert into log (username, date_time, action, actiontype, actiontable) values (new.empl_username, current_timestamp(), 'Success', 'update', 'requestevaluation');	
END$
DELIMITER ;



DELIMITER $
DROP trigger IF EXISTS reqEval_delete$
CREATE TRIGGER reqEval_delete
AFTER DELETE ON requestevaluation
FOR EACH ROW
BEGIN
	insert into log (username, date_time, action, actiontype, actiontable) values (old.empl_username, current_timestamp(), 'Success', 'delete', 'requestevaluation');
END$
DELIMITER ;
