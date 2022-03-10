
	#---LOGIN FRAME---#
DELIMITER $
DROP PROCEDURE IF EXISTS login_credentials$
CREATE PROCEDURE login_credentials(IN user_name VARCHAR(12), IN user_password VARCHAR(10), OUT _role enum('Employee', 'Evaluator', 'Manager', 'Admin')) 		
BEGIN 
	SELECT role into _role 
    FROM user WHERE username =user_name AND password = user_password;
END$
delimiter ;




	#---ADMIN MENU FRAME---#    
DELIMITER $
DROP PROCEDURE IF EXISTS manager_insert$
CREATE PROCEDURE manager_insert(IN _name varchar(12), IN sname varchar(35), IN user_name VARCHAR(12), IN _email varchar(30), IN pass VARCHAR(10),
							    IN exp tinyint, IN _firm char(9))			
BEGIN 
	INSERT into user (name, surname, username, email, password, role) values (_name, sname, user_name, _email, pass, 'Manager');
    INSERT into manager (managerUsername, exp_years, firm) values (user_name, exp, _firm);
END$
delimiter ;


DELIMITER $
DROP PROCEDURE IF EXISTS empl_insert$
CREATE PROCEDURE empl_insert(IN _name varchar(12), IN sname varchar(35), IN user_name VARCHAR(12), IN _email varchar(30), IN pass VARCHAR(10),
							    IN sistat varchar(35), IN certif varchar(35), IN _awards varchar(35), IN exp tinyint, IN _bio text, IN _firm char(9))			
BEGIN 
	INSERT into user (name, surname, username, email, password, role) values (_name, sname, user_name, _email, pass, 'Employee');
    INSERT into employee (username, firm, exp_years, bio, sistatikes, certificates, awards) values (user_name, _firm, exp, _bio, sistat, certif, _awards);
END$
delimiter ;


DELIMITER $
DROP PROCEDURE IF EXISTS eval_insert$
CREATE PROCEDURE eval_insert(IN _name varchar(12), IN sname varchar(35), IN user_name VARCHAR(12), IN _email varchar(30), IN pass VARCHAR(10),
							    IN exp tinyint, IN _firm char(9))			
BEGIN 
	INSERT into user (name, surname, username, email, password, role) values (_name, sname, user_name, _email, pass, 'Evaluator');
    INSERT into evaluator (username, exp_years, firm) values (user_name, exp, _firm);
END$
delimiter ;


DELIMITER $
DROP PROCEDURE IF EXISTS company_insert$
CREATE PROCEDURE company_insert(IN afm char(9), IN doy varchar(15), IN _name VARCHAR(35), IN _phone bigint, IN _street VARCHAR(15),
							    IN _num tinyint, IN _city varchar(15), IN country varchar(15))			
BEGIN 
	INSERT into company (AFM, DOY, name, phone, street, num, city, country) values (afm, doy, _name, _phone, _street, _num, _city, country);
END$
delimiter ;


DELIMITER $
DROP PROCEDURE IF EXISTS view_logfileUser$
CREATE PROCEDURE view_logfileUser(IN user_name VARCHAR(12))			
BEGIN 
	select * from log where username = user_name;
END$
delimiter ;

DELIMITER $
DROP PROCEDURE IF EXISTS view_logfileTable$
CREATE PROCEDURE view_logfileTable(IN _table VARCHAR(20))			
BEGIN 
	select * from log where actiontable = _table;	
END$
delimiter ;



	#---MANAGER MENU FRAME---#
DELIMITER $
DROP PROCEDURE IF EXISTS manager_upd$
CREATE PROCEDURE manager_upd(IN user_name VARCHAR(12), IN _email varchar(30), IN pass VARCHAR(10))							    		
BEGIN 
	UPDATE user
    SET email = _email, password = pass
    WHERE username = user_name;
END$
delimiter ;


DELIMITER $
DROP PROCEDURE IF EXISTS get_ManAfm$
CREATE PROCEDURE get_ManAfm(IN user_name VARCHAR(12), OUT afm char(9))							    		
BEGIN 
	
    select firm into afm 
    from manager where managerUsername = user_name;
    
END$
delimiter ;


DELIMITER $
DROP PROCEDURE IF EXISTS company_upd$
CREATE PROCEDURE company_upd(IN user_name VARCHAR(12), IN _phone bigint, IN _street varchar(15), IN _num tinyint, IN _city varchar(15), IN _country varchar(15) )							    		
BEGIN 
    
	call get_ManAfm(user_name, @afm);
    
    UPDATE company
    SET phone = _phone, street = _street, num = _num, city = _city, country = _country
    WHERE AFM = @afm;
    
END$
delimiter ;



DELIMITER $
DROP PROCEDURE IF EXISTS show_job$
CREATE PROCEDURE show_job(IN user_name VARCHAR(12))							    		
BEGIN 
	call get_ManAfm(user_name, @afm);
    
    select * from job where company_afm = @afm;
    
    
END$
delimiter ;


DELIMITER $
DROP PROCEDURE IF EXISTS show_emplInManagComp$
CREATE PROCEDURE show_emplInManagComp(IN user_name VARCHAR(12))							    		
BEGIN 
	call get_ManAfm(user_name, @afm);
    
    select employee.username, user.name, user.surname
    from user
    join employee on employee.username = user.username
    where employee.firm = @afm;
    
END$
delimiter ;

call show_emplInManagComp('asimon');


DELIMITER $
DROP PROCEDURE IF EXISTS salary_upd$
CREATE PROCEDURE salary_upd(IN _id VARCHAR(12), IN new_salary float(6,1))							    		
BEGIN 
	UPDATE job
    SET salary = new_salary
    WHERE id = _id;
    
END$
delimiter ;


DELIMITER $
DROP PROCEDURE IF EXISTS show_empl$
CREATE PROCEDURE show_empl(IN user_name VARCHAR(12))							    		
BEGIN 
	call get_ManAfm(user_name, @afm);
    
    select * from employee where firm = @afm;
    
END$
delimiter ;

call show_empl('asimon');


DELIMITER $
DROP PROCEDURE IF EXISTS empl_upd$
CREATE PROCEDURE empl_upd(IN am INT, IN new_sistatikes varchar(35), IN new_certificates varchar(35), IN new_awards varchar(50))							    		
BEGIN 
	UPDATE employee
    SET sistatikes = new_sistatikes, certificates = new_certificates, awards = new_awards
    WHERE employee.AM = am;
    
END$
delimiter ;


DELIMITER $
DROP PROCEDURE IF EXISTS get_evalRes$
CREATE PROCEDURE get_evalRes(IN _id INT)							    		
BEGIN 
	  select empl_username, job_id, grade
	  from evaluationresult where job_id = _id;
END$
delimiter ;

#call get_evalRes(2);



DELIMITER $
DROP PROCEDURE IF EXISTS show_evaluator$
CREATE PROCEDURE show_evaluator(IN user_name VARCHAR(12))							    		
BEGIN 
	call get_ManAfm(user_name, @afm);
    
    select username, exp_years
    from evaluator
    where firm = @afm;
    
END$
delimiter ;

#call show_evaluator('asimon');



DELIMITER $
DROP PROCEDURE IF EXISTS get_evalGradeAvg$
CREATE PROCEDURE get_evalGradeAvg(IN _evaluator varchar(12))							    		
BEGIN 
	  
      select evaluation.eval_username AS 'Evaluator',avg(evaluationresult.grade)  AS 'Average Evaluation Grade'
	  from evaluation
      join evaluationresult ON evaluationresult.EVid = evaluation.id
      where evaluation.eval_username = _evaluator
      group by evaluation.eval_username;
END$
delimiter ;

#call get_evalGradeAvg('papad');
#call get_evalGradeAvg('msmith');


	#---EMPLOYEE MENU FRAME---#

DELIMITER $
DROP PROCEDURE IF EXISTS show_emplFolder$
CREATE PROCEDURE show_emplFolder(IN user_name VARCHAR(12))							    		
BEGIN 
    select * from employee where username = user_name;    
END$
delimiter ;


DELIMITER $
DROP PROCEDURE IF EXISTS empl_folderUpd$
CREATE PROCEDURE empl_folderUpd(IN user_name VARCHAR(12), IN pass varchar(15), IN _bio TEXT)							    		
BEGIN 

	UPDATE user
    SET password = pass
    WHERE user.username = user_name;

	UPDATE employee
    SET bio = _bio
    WHERE employee.username = user_name;
    
END$
delimiter ;


DELIMITER $
DROP PROCEDURE IF EXISTS show_jobApplic$  # Ολες οι αιτησεις του empl στην εταιρεια
CREATE PROCEDURE show_jobApplic(IN user_name VARCHAR(12))							    		
BEGIN 
    select job.* 
    from job,requestevaluation
    where requestevaluation.empl_username = user_name AND requestevaluation.job_id = job.id;
    
END$
delimiter ;

#call show_jobApplic('jefben');
#call show_jobApplic('cleogeo');
#call show_jobApplic('zazahir23');


DELIMITER $
DROP PROCEDURE IF EXISTS show_openJob$ 	# Ανοιχτες θεσεις στην εταιρεια του employee 
CREATE PROCEDURE show_openJob(IN user_name VARCHAR(12))							    		
BEGIN 
	DECLARE afm char(9);
   
    SET afm = (select firm from employee where username = user_name);
   
    select * from job 
    where company_afm = afm AND submission_date > current_date();
    
END$
delimiter ;

#call show_openJob('cleogeo');
#call show_openJob('jefben');
#call show_openJob('zazahir23');


DELIMITER $
DROP PROCEDURE IF EXISTS apply_toJob$
CREATE PROCEDURE apply_toJob(IN user_name VARCHAR(12), IN _id INT)							    		
BEGIN 
    insert into requestevaluation(empl_username, job_id) values(user_name, _id);
END$
delimiter ;

#call apply_toJob('cleogeo', 2);



DELIMITER $
DROP PROCEDURE IF EXISTS show_openJobApplic$  # Ανοιχτες αιτησεις του empl στην εταιρεια
CREATE PROCEDURE show_openJobApplic(IN user_name VARCHAR(12))							    		
BEGIN 
	select job.* 
    from job,requestevaluation
    where requestevaluation.empl_username = user_name AND requestevaluation.job_id = job.id AND job.submission_date > current_date();
END$
delimiter ;

#call show_openJobApplic('zazahir23');
#call show_openJobApplic('cleogeo');
#call show_openJobApplic('jefben');


DELIMITER $
DROP PROCEDURE IF EXISTS delete_openJobApplic$  
CREATE PROCEDURE delete_openJobApplic(IN user_name VARCHAR(12), IN _id INT)							    		
BEGIN 
	DELETE from requestevaluation where empl_username = user_name AND job_id = _id;
END$
delimiter ;

#call delete_openJobApplic('zazahir23', 7);



	#---EVALUATOR MENU FRAME---#

DELIMITER $
DROP PROCEDURE IF EXISTS show_evalFolder$
CREATE PROCEDURE show_evalFolder(IN user_name VARCHAR(12))							    		
BEGIN 
    select * from user where username = user_name;    
END$
delimiter ;
    
#call show_evalFolder('msmith');    


DELIMITER $
DROP PROCEDURE IF EXISTS eval_folderUpd$
CREATE PROCEDURE eval_folderUpd(IN user_name VARCHAR(12), IN pass varchar(15), IN _name varchar(12), IN _surname varchar(35), IN _email varchar(30))							    		
BEGIN 
	UPDATE user
    SET password = pass, name = _name, surname = _surname, email = _email
    WHERE user.username = user_name;
    
END$
delimiter ;


DELIMITER $
DROP PROCEDURE IF EXISTS view_compJobs$ 	# Jobs στην εταιρεια του evaluator
CREATE PROCEDURE view_compJobs(IN user_name VARCHAR(12))							    		
BEGIN 
	DECLARE afm char(9);
   
    SET afm = (select firm from evaluator where username = user_name);
   
    select * from job 
    where company_afm = afm;
    
END$
delimiter ;
    
call view_compJobs('bettyg');       

DELIMITER $
DROP PROCEDURE IF EXISTS edit_evalJobs$ 	# Edit τα Jobs που ανακοινωσε ο evaluator
CREATE PROCEDURE edit_evalJobs(IN user_name VARCHAR(12), IN _id INT, IN startDate date,IN _salary FLOAT, IN pos varchar(40), IN _edra varchar(45), IN submDate date)							    		
BEGIN 
	UPDATE job
    set start_date = startDate, salary = _salary, position = pos, edra = _edra, submission_date = submDate
    where id = _id AND evaluator = user_name;
    
END$
delimiter ;


DELIMITER $
DROP PROCEDURE IF EXISTS add_job_needs$ 	 # Insert ενα νεο Job 
CREATE PROCEDURE add_job_needs(IN startDate date,IN _salary FLOAT, IN pos varchar(40), IN _edra varchar(45),IN user_name varchar(12), IN submDate date, IN antikeim varchar(36))							    		
BEGIN 
	select firm into @afm from evaluator where user_name = username;
    
    insert into job (start_date, salary, position, edra, evaluator, company_afm, submission_date) values 
					(startDate, _salary, pos, _edra, user_name, @afm, submDate);
    
    select max(id) into @jobid from job;
    insert into needs (job_id, antikeim_title) values (@jobid, antikeim); 
    
END$
delimiter ;

call add_job_needs('2022-03-06', 1540, 'graphics expert', 'Larisa, Greece','varcon82', '2021-12-05', '3D');


DELIMITER $
DROP PROCEDURE IF EXISTS add_antikeim$ 	 # Insert τα σχετικά με το job αντικείμενα αν δεν υπάρχουν στον πίνακα antikeim
CREATE PROCEDURE add_antikeim(IN antikeim varchar(36), IN _descr tinytext, IN belongs varchar(36))							    		
BEGIN 
	insert into antikeim (title, descr, belongs_to) values (antikeim , _descr, belongs);
END$
delimiter ;

call add_antikeim('', '', 'Computer Science');


DELIMITER $
DROP PROCEDURE IF EXISTS evaluator_jobs$ 	# Jobs του evaluator
CREATE PROCEDURE evaluator_jobs(IN user_name VARCHAR(12))							    		
BEGIN
    select * from job 
    where evaluator = user_name;
    
END$
delimiter ;

call evaluator_jobs('n_tri');
call evaluator_jobs('varcon82');
call evaluator_jobs('Giankost');


DELIMITER $
DROP PROCEDURE IF EXISTS finalResults3_3$ 	
CREATE PROCEDURE finalResults3_3(IN _id INT)							    		
BEGIN
    select interview, report, extras from evaluation WHERE job_id = _id;
END$
delimiter ;

call finalResults3_3('1');
call finalResults3_3('2');


DELIMITER $
DROP PROCEDURE IF EXISTS view_evalsApplics$ 	
CREATE PROCEDURE view_evalsApplics(IN user_name VARCHAR(12))							    		
BEGIN
	select evaluation.*, job.submission_date
    from evaluation
    join job ON job.id = evaluation.job_id
	where evaluation.eval_username = user_name;
	
END$
delimiter ;

call view_evalsApplics('Giankost');


DELIMITER $
DROP PROCEDURE IF EXISTS setInterview_grade$ 	
CREATE PROCEDURE setInterview_grade(IN ev_id VARCHAR(12), IN interview_grade text)							    		
BEGIN
	UPDATE evaluation
    set interview = interview_grade
    where id = ev_id;
END$
delimiter ;


DELIMITER $
DROP PROCEDURE IF EXISTS setReport_grade$ 	
CREATE PROCEDURE setReport_grade(IN ev_id VARCHAR(12), IN report_grade text)							    		
BEGIN
	UPDATE evaluation
    set report = report_grade
    where id = ev_id;
END$
delimiter ;


DELIMITER $
DROP PROCEDURE IF EXISTS setExtras_grade$ 	
CREATE PROCEDURE setExtras_grade(IN ev_id VARCHAR(12), IN extras_grade text)							    		
BEGIN
	UPDATE evaluation
    set extras = extras_grade
    where id = ev_id;
END$
delimiter ;


DELIMITER $
DROP PROCEDURE IF EXISTS finalizeEval_3_2$ 	
CREATE PROCEDURE finalizeEval_3_2(IN user_name VARCHAR(12), IN jobID INT, IN _interview text,IN _report text, IN _extras text)							    		
BEGIN

	IF (_interview is not null AND _report is not null AND _extras is not null) then
		call evaluatorEval(jobID, user_name);	
    else SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT = 'Every part of the evaluation must have a grade';
    
    END IF;
END$
delimiter ;


