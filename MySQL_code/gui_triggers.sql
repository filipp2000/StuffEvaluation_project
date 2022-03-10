DELIMITER $
DROP trigger IF EXISTS user_reg_date$
CREATE TRIGGER user_reg_date
BEFORE INSERT ON user
FOR EACH ROW
BEGIN
	SET new.reg_date = current_timestamp();
END$    
DELIMITER ;


DELIMITER $
DROP trigger IF EXISTS check_email$
CREATE TRIGGER check_email
BEFORE UPDATE ON user
FOR EACH ROW
BEGIN
	IF NEW.email NOT LIKE '%@%.%' THEN 
		SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT = 'Please enter a valid email address';
    END IF;
END$
DELIMITER ;


DELIMITER $
DROP trigger IF EXISTS check_user$
CREATE TRIGGER check_user
BEFORE INSERT ON user
FOR EACH ROW
BEGIN
	IF (EXISTS(SELECT 1 FROM user WHERE username = NEW.username)) THEN
		SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT = 'Username already exists!';
    END IF;
END$
DELIMITER ;


DELIMITER $
DROP trigger IF EXISTS udt_user$
CREATE TRIGGER udt_user
BEFORE UPDATE ON user
FOR EACH ROW
BEGIN
		IF new.name = '' then set new.name = old.name; END IF;
		IF new.surname = '' then set new.surname = old.surname; END IF;
        IF (NEW.password IS NULL OR NEW.password = '') THEN 
		SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT = 'Type a password'; END IF;
		
END$
DELIMITER ;



DELIMITER $
DROP trigger IF EXISTS check_requestevaluation$
CREATE TRIGGER check_requestevaluation
BEFORE INSERT ON requestevaluation
FOR EACH ROW
BEGIN
	IF (EXISTS(SELECT 1 FROM requestevaluation WHERE empl_username = NEW.empl_username AND job_id = NEW.job_id)) THEN
		SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT = 'You have already applied for this job!';
    END IF;
END$
DELIMITER ;


DELIMITER $
DROP trigger IF EXISTS job_announDate$  # Προσθήκη του announce_date αυτόματα
CREATE TRIGGER job_announDate
BEFORE INSERT ON job
FOR EACH ROW
BEGIN
	SET new.announce_date = current_timestamp();
END$    
DELIMITER ;


DELIMITER $
DROP trigger IF EXISTS check_antikeim$  # Ελεγχος για αν ο title ειναι κενος
CREATE TRIGGER check_antikeim
BEFORE INSERT ON antikeim
FOR EACH ROW
BEGIN
	IF (NEW.title = '' ) THEN 
		SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT = 'Enter a title!'; END IF;
END$    
DELIMITER ;


DELIMITER $
DROP trigger IF EXISTS check_job$  # Ελεγχος για αν το start_date, submission_date ειναι κενα
CREATE TRIGGER check_job
BEFORE INSERT ON job
FOR EACH ROW
BEGIN
	IF (NEW.start_date IS NULL) THEN 
		SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT = 'Enter a starting date for the job!'; END IF;
        
	IF (NEW.submission_date IS NULL) THEN 
		SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT = 'Enter a submission date for the job!'; END IF;
END$    
DELIMITER ;


DELIMITER $
DROP trigger IF EXISTS empl_user_delete$
CREATE TRIGGER empl_user_delete
AFTER DELETE ON employee
FOR EACH ROW
BEGIN
	Delete from user where username = old.username;
END$
DELIMITER ;


DELIMITER $
DROP trigger IF EXISTS eval_user_delete$
CREATE TRIGGER eval_user_delete
AFTER DELETE ON evaluator
FOR EACH ROW
BEGIN
	Delete from user where username = old.username;
END$
DELIMITER ;


DELIMITER $
DROP trigger IF EXISTS manag_user_delete$
CREATE TRIGGER manag_user_delete
AFTER DELETE ON manager
FOR EACH ROW
BEGIN
	Delete from user where username = old.username;
END$
DELIMITER ;

