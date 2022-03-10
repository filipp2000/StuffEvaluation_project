CREATE DATABASE staff_evaluation_db;
USE staff_evaluation_db;
DROP database staff_evaluation_db;



CREATE TABLE IF NOT EXISTS company (
    AFM CHAR(9) NOT NULL,
    DOY VARCHAR(15),
    name VARCHAR(35) NOT NULL DEFAULT 'Unknown',
    phone BIGINT(16) DEFAULT null,
    street VARCHAR(15) DEFAULT 'Unknown',
    num TINYINT(4) DEFAULT null,
    city VARCHAR(15) DEFAULT 'Unknown',
    country VARCHAR(15) DEFAULT 'Unknown',
    PRIMARY KEY (AFM)
);


CREATE TABLE IF NOT EXISTS user (
	username VARCHAR(12) NOT NULL,
    password VARCHAR(15) NOT NULL,
    name VARCHAR(12) NOT NULL DEFAULT 'Unknown',
    surname VARCHAR(35) NOT NULL DEFAULT 'Unknown',
    reg_date DATETIME NOT NULL,
    email VARCHAR(30) NOT NULL,
    role enum('Employee', 'Evaluator', 'Manager', 'Admin'),
    PRIMARY KEY (username)
);


CREATE TABLE IF NOT EXISTS manager (
    managerUsername VARCHAR(12) NOT NULL,
    exp_years TINYINT(4),
    firm CHAR(9) NOT NULL,
    PRIMARY KEY (managerUsername),
    CONSTRAINT Firm_Manager FOREIGN KEY (firm)
        REFERENCES company (AFM)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT MAN_USERNAME FOREIGN KEY (managerUsername)
        REFERENCES user (username)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS evaluator (
    username VARCHAR(12) NOT NULL,
    exp_years TINYINT(4),
    firm CHAR(9) NOT NULL,
    PRIMARY KEY (username),
    CONSTRAINT EVAL_USERNAME FOREIGN KEY (username)
        REFERENCES user (username)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT EVAL_FIRM FOREIGN KEY (firm)
        REFERENCES company (AFM)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS antikeim (
    title VARCHAR(36) NOT NULL,
    descr TINYTEXT,
    belongs_to VARCHAR(36),
    PRIMARY KEY (title),
    CONSTRAINT ANTIKEIMENO FOREIGN KEY (belongs_to)
        REFERENCES antikeim (title)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS job (
    id INT(4) NOT NULL AUTO_INCREMENT,
    start_date DATE NOT NULL,
    salary FLOAT(6, 1),
    position VARCHAR(40),
    edra VARCHAR(45),
    evaluator VARCHAR(12) NOT NULL,
    company_afm CHAR(9) NOT NULL,
    announce_date DATETIME,
    submission_date DATE NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT EVALUATOR FOREIGN KEY (evaluator)
        REFERENCES evaluator (username)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT COMP_AFM FOREIGN KEY (company_afm)
        REFERENCES company (AFM)
        ON DELETE CASCADE ON UPDATE CASCADE 
);


CREATE TABLE IF NOT EXISTS needs (
    job_id INT(4) NOT NULL,
    antikeim_title VARCHAR(36) NOT NULL,
    PRIMARY KEY (job_id , antikeim_title),
    CONSTRAINT NEED_JOB FOREIGN KEY (job_id)		
        REFERENCES job (id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT NEED_ANTIKEIM FOREIGN KEY (antikeim_title)
        REFERENCES antikeim (title)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS employee (
    AM INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(12) NOT NULL,
    firm CHAR(9) NOT NULL,
    exp_years TINYINT(4),
    bio TEXT NOT NULL,
    sistatikes VARCHAR(35) DEFAULT 'None',
    certificates VARCHAR(35) DEFAULT 'None',
    awards VARCHAR(35) DEFAULT 'None',
    PRIMARY KEY (AM, username),
    CONSTRAINT EMPL_USERNAME FOREIGN KEY (username)
        REFERENCES user (username)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT EMPL_FIRM FOREIGN KEY (firm)
        REFERENCES company (AFM)
        ON DELETE CASCADE ON UPDATE CASCADE      
);



CREATE TABLE IF NOT EXISTS project (
    empl VARCHAR(12) NOT NULL,
    num TINYINT(4),
    descr TEXT,
    url VARCHAR(60) NOT NULL,
    PRIMARY KEY (empl , num),
    CONSTRAINT EMPL_PROJECT FOREIGN KEY (empl)
        REFERENCES employee (username)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS languages (
    employee VARCHAR(12) NOT NULL,
    lang SET('EN', 'FR', 'SP', 'GR'),
    PRIMARY KEY (employee , lang),
    CONSTRAINT EMPL_LANG FOREIGN KEY (employee)
        REFERENCES employee (username)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS requestevaluation (
    empl_username VARCHAR(12) NOT NULL,
    job_id INT(4) NOT NULL,
    PRIMARY KEY (empl_username , job_id),
    CONSTRAINT EVAL_EMPL FOREIGN KEY (empl_username)
        REFERENCES employee (username)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT EVAL_JOB FOREIGN KEY (job_id)				
        REFERENCES job (id)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS degree (
    titlos VARCHAR(50) NOT NULL,
    idryma VARCHAR(40) NOT NULL,
    bathmida ENUM('LYKEIO', 'UNIV', 'MASTER', 'PHD'),
    PRIMARY KEY (titlos , idryma)
);


CREATE TABLE IF NOT EXISTS has_degree (
    degr_title VARCHAR(50) NOT NULL,
    degr_idryma VARCHAR(40) NOT NULL,
	empl_username VARCHAR(12) NOT NULL,
    etos YEAR(4),
    grade FLOAT(3 , 1),
    PRIMARY KEY (degr_title , degr_idryma , empl_username),
    CONSTRAINT HAS_DEGR FOREIGN KEY (degr_title , degr_idryma)
        REFERENCES degree (titlos , idryma)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT HAS_EMPL FOREIGN KEY (empl_username)
        REFERENCES employee (username)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS evaluation (
	id INT(4) NOT NULL,
    eval_username VARCHAR(12) NOT NULL,
    empl_username VARCHAR(12) NOT NULL,
    job_id INT(4) NOT NULL,
    eval_comments VARCHAR(255),
    interview TEXT DEFAULT NULL,
    report TEXT DEFAULT NULL,
    extras TEXT DEFAULT NULL,
    completed BOOLEAN,
    PRIMARY KEY(id),
    CONSTRAINT EVAL_USN FOREIGN KEY (eval_username)
        REFERENCES evaluator (username)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT EMPL_USN FOREIGN KEY (empl_username)
        REFERENCES employee (username)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT JOB_EVAL FOREIGN KEY (job_id)				
        REFERENCES job (id)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS evaluationresult (
    EVid INT(4),
    empl_username VARCHAR(12) NOT NULL,
    job_id INT(4) NOT NULL,
    grade INT(4),
    comments VARCHAR(255),
    PRIMARY KEY (EVid, empl_username),
    CONSTRAINT EMPL_EVALRES FOREIGN KEY (empl_username)
        REFERENCES employee (username)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT JOB_EVALRES FOREIGN KEY (job_id)  		
        REFERENCES job (id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT EV_ID FOREIGN KEY (EVid)
        REFERENCES evaluation (id)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS administrator(
    admin_username VARCHAR(12) NOT NULL,
    firm CHAR(9) NOT NULL,
    PRIMARY KEY (admin_username),
    CONSTRAINT Firm_Administrator FOREIGN KEY (firm)
        REFERENCES company (AFM)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT ADMIN_USERNAME FOREIGN KEY (admin_username)
        REFERENCES user (username)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS log (
    username VARCHAR(12) NOT NULL,
    date_time DATETIME,
    action VARCHAR(10),
    actiontype ENUM('insert', 'update', 'delete'),
    actiontable VARCHAR(20),
    PRIMARY KEY (date_time),
    CONSTRAINT LOG_USERNAME FOREIGN KEY (username)
        REFERENCES user (username)
        ON DELETE CASCADE ON UPDATE CASCADE
);


select * from log;
select * from job;
select * from antikeim;
select * from employee;
select * from evaluator;
select * from user; 
select * from manager;
select * from company;
select * from evaluationresult;
select * from evaluation;
select * from needs;
select * from requestevaluation;
select * from project;
select * from has_degree;



delete from log;
delete from manager;
delete from user where username = '';
delete from company where AFM = 111;
delete from evaluation;
delete from evaluationresult;
delete from requestevaluation;
delete from employee;
delete from evaluator;

delete from antikeim where title = 'VLSI';
delete from job;
delete from job where salary = '1540';
ALTER TABLE job AUTO_INCREMENT = 12;

alter table employee modify sistatikes varchar(35) default 'None';

ALTER TABLE evaluationresult DROP PRIMARY KEY;
ALTER TABLE evaluationresult ADD PRIMARY KEY (EVid, empl_username);
    
ALTER TABLE evaluationresult DROP FOREIGN KEY EV_ID ; 
ALTER TABLE evaluationresult ADD CONSTRAINT EMPL_EVALRES FOREIGN KEY (empl_username)
        REFERENCES employee (username)
        ON DELETE CASCADE ON UPDATE CASCADE;
    

select afm from company;