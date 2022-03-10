# 3.1 #
DELIMITER $
DROP PROCEDURE IF EXISTS employee_eval$
CREATE PROCEDURE employee_eval(IN empl_name VARCHAR(25), IN empl_surname VARCHAR(35))
BEGIN 
	DECLARE user_name VARCHAR(12);
	DECLARE ev_username VARCHAR(12);
	DECLARE eval_name VARCHAR(12);
	DECLARE eval_surname VARCHAR(35);
	DECLARE aitiseis INT;
    DECLARE interview_ev TEXT;
    DECLARE report_ev TEXT;
    DECLARE extras_ev TEXT;
    DECLARE completed_ev BOOLEAN;
    
    DECLARE switchvar INT;
    
    DECLARE finishedFlag INT;
    DECLARE evalCursor CURSOR FOR
		select eval_username, interview, report, extras, completed
        from evaluation where empl_username = user_name;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedFlag=1;        
    
    create temporary table temp
    select user_name, aitiseis, eval_name, eval_surname, interview_ev, report_ev, extras_ev, completed_ev LIMIT 0;
    
    SELECT username INTO user_name
	FROM user WHERE name = empl_name AND surname = empl_surname;
    if user_name is not null then
		SET aitiseis = 0;
		select count(user_name) into aitiseis
		from requestevaluation where empl_username = user_name;
		
        OPEN evalCursor;
		SET finishedFlag=0;
	
        fetch evalCursor into ev_username, interview_ev, report_ev, extras_ev, completed_ev;
		while(finishedFlag=0) DO
			
            select name, surname into eval_name, eval_surname
			from user where username = ev_username;
	
            set switchvar = 0;
			if (interview_ev is null)  then set switchvar = switchvar + 1;   end if;
			if (report_ev is null) then set switchvar = switchvar + 10;      end if;
			if (extras_ev is null) then set switchvar = switchvar + 100;     end if;
            
			case (switchvar)
				when 0 THEN set switchvar = 0;
				    #select user_name, aitiseis, eval_name, eval_surname, interview_ev, report_ev, extras_ev, completed_ev;
					
				when 1 then set interview_ev = 'Pending';  #only interview_ev = null
					
				when 10 then set report_ev = 'Pending';  #only report_ev = null
					
				when 100 then set extras_ev = 'Pending';  #only extras_ev = null
					
				when 11 then set interview_ev = 'Pending', report_ev = 'Pending';  # interview_ev, report_ev null
					
				when 101 then set interview_ev = 'Pending', extras_ev = 'Pending';  # interview_ev, extras_ev null
					
				when 110 then set report_ev = 'Pending', extras_ev = 'Pending';  # report_ev, extras_ev null
					
				when 111 then set interview_ev = 'Pending', report_ev = 'Pending', extras_ev = 'Pending';  # all variables null
					
			end case;
            INSERT into temp values (user_name, aitiseis, eval_name, eval_surname, interview_ev, report_ev, extras_ev, completed_ev);
            fetch evalCursor into ev_username, interview_ev, report_ev, extras_ev, completed_ev;
			
            
        end while;
        close evalCursor;
        
		select * from temp;
		DROP TEMPORARY TABLE temp;
    
	else
		select 'Employee not found.', empl_name, empl_surname;
                
	END IF;
END$
delimiter ;

call employee_eval('Cleomenis', 'Georgiadis');
call employee_eval('Manolis', 'Nikopoloulos');
call employee_eval('aaaa', 'bbbb');


# 3.2 #
DELIMITER $
DROP PROCEDURE IF EXISTS evaluatorEval$
CREATE PROCEDURE evaluatorEval(IN jobid INT, IN usrname VARCHAR(12))
BEGIN

	DECLARE _id INT;
	DECLARE empl varchar(12);
	DECLARE evalComments varchar(255);

	DECLARE interv TEXT;
	DECLARE rep TEXT;
	DECLARE extra TEXT;
	DECLARE completed_ev BOOLEAN;

	DECLARE final_result INT;

	DECLARE finishedFlag INT;
	DECLARE evalCursor CURSOR FOR
		SELECT id, empl_username, eval_comments, interview, report, extras, completed 
		FROM evaluation WHERE eval_username = usrname AND job_id = jobid;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedFlag=1;     
	   
    create temporary table temp 
    (Status VARCHAR(40), Employee varchar(12),EvID INT, Grade INT, Interview text, Report text, Extras text);
    
	OPEN evalCursor;
	SET finishedFlag=0;
		
	FETCH evalCursor INTO _id, empl, evalComments, interv, rep, extra, completed_ev;
	WHILE(finishedFlag=0) DO

		IF completed_ev = 0	THEN
			IF interv AND rep and extra IS NOT NULL	THEN
				SET final_result = (interv + rep + extra);				
				INSERT INTO evaluationresult (EVid, empl_username, job_id, grade, comments)  value (_id, empl, jobid, final_result, evalComments);
			ELSE
				SET final_result=0;
				INSERT into temp values ('Evaluation in progress', empl, _id, final_result, interv, rep, extra);
                
				
			END IF;
		ELSE
			select grade into final_result from evaluationresult where EVid = _id;
			INSERT into temp values ('Evaluation completed', empl, _id, final_result, interv, rep, extra);
		END IF;
				
		FETCH evalCursor into _id, empl, evalComments, interv, rep, extra, completed_ev;
	END WHILE;
	CLOSE evalCursor;
    
    select * from temp;
	DROP TEMPORARY TABLE temp;
    
    
END$

DELIMITER ;

call evaluatorEval('1', 'n_tri');
call evaluatorEval('2', 'n_tri');
call evaluatorEval('3', 'Giankost');


# 3.3 #
DELIMITER $
DROP PROCEDURE IF EXISTS finalised_jobs$
CREATE PROCEDURE finalised_jobs(IN jobid INT)
BEGIN 

	DECLARE empl varchar(12);
	DECLARE grade_result INT;
	DECLARE diff INT;
	DECLARE _completed BOOLEAN;
	
	

	DECLARE compl_aitiseis INT;
	DECLARE candidates INT;

	DECLARE finishedFlag INT;

	DECLARE jobsCursor CURSOR FOR
		SELECT empl_username, grade
		FROM evaluationresult WHERE job_id = jobid
		ORDER BY grade desc;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedFlag=1;

	create temporary table temp 
    (Employee varchar(12), Grade INT, Status VARCHAR(40), Pending INT);
	
	
    SET compl_aitiseis = 0;
	select count(completed) into compl_aitiseis
	from evaluation where job_id = jobid AND completed = true;
			
	SET candidates = 0;
	select count(empl_username) into candidates
	from evaluation where job_id = jobid;

	IF (candidates = 0) then SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT = 'There are no candidates for this job!';	END IF;

	OPEN jobsCursor;
	SET finishedFlag=0;
		
	FETCH jobsCursor INTO empl, grade_result;
	IF (empl is NULL) then   # if no employee completed the evaluation
		INSERT into temp values (empl, grade_result, 'Evaluation in progress', diff); END IF; 
		
	WHILE(finishedFlag=0) DO
		 
		IF(candidates = compl_aitiseis)	THEN
			SET diff = candidates - compl_aitiseis; 
			INSERT into temp values (empl, grade_result, 'Finalized tables', diff);
            
		else
			SET diff = candidates - compl_aitiseis;       
			INSERT into temp values (empl, grade_result, 'Evaluation in progress', diff);
			
		END IF;
		FETCH jobsCursor INTO empl, grade_result;
	END WHILE;
	CLOSE jobsCursor;
	
	select * from temp;
	DROP TEMPORARY TABLE temp;
    
END $
DELIMITER ;

                          
call finalised_jobs('17');                                                                                                                        
call finalised_jobs('2');																											
call finalised_jobs('1');                                                                                                                        

