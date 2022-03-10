insert into company (AFM, DOY, name, phone, street, num, city, country) values
('023453344', 'C Patras', 'EXPENDITURE Ltd', 2610256321, 'Maizonos', 123, 'Patra', 'Greece'), 
('023451232', 'A Patras', 'Typology Ltd', 2610231452, 'Korinthou', 56, 'Patra', 'Greece'),
('123432211', 'A Geraka', 'SoftSol A.E.', 2103452133, 'Ahepa', 44, 'Athina', 'Greece'), 
('18765549', 'C Peiraia', 'Unigram', 2103452672, 'Karaiskaki', 10, 'Peiraias', 'Greece'),
('561234561', 'GS 35321 L', 'InCodeWeTrust', 1242345612, 'Oxford', 12, 'London', 'United Kingdom'), 
('23122345', 'SF 1234 BG', 'SocialSc', 3200123451, 'General Sklevi', 35, 'Sofia', 'Bulgaria');

/*
papad, pdfr45t 123432211
zazahir23
antmorin
*/

/* add EMPLOYEES */
insert into user (username, password, name, surname, reg_date, email, role) values 
('cleogeo', 'upL34r', 'Cleomenis', 'Georgiadis', '2018-02-13 12:23:34', 'cleom17@gmail.com', 'Employee'),
('sanrober', 'emptybrick10', 'Sanaya', 'Roberson', '2017-03-13 11:20:33', 'san@yahoo.gr', 'Employee'),
('zazahir23', 'zoolhger', 'Ahmet', 'Mobasher-Hirs', '2017-05-11 14:08:23', 'ahmetTech@yahoo.gr', 'Employee'),
('jefben', 'tallstart13', 'Jeffrey ', 'Benitez', '2018-09-11 12:02:11', 'jef@yahoo.gr', 'Employee'),
('lionarF', 'erg2378', 'Freddy', 'Lionar', '2018-10-07 20:09:10', 'Lionarfre@ezra.co.uk', 'Employee'),
('antmorin', 'blue3', 'Antoni ', 'Morin', '2018-11-03 16:11:09', 'Lionarfre@ezra.co.uk', 'Employee'),
('liagourma', 'sionpass', 'Maria', 'Liagkoumi', '2018-05-22 17:03:01', 'mliagkr@gmail.com', 'Employee'),
('bailind', 'freehome57', 'Lindsay', 'Bailey', '2017-06-12 18:00:45', 'lid@gmail.com', 'Employee'),
('mnikol', 'm@n0lis', 'Manolis', 'Nikopoloulos', '2017-11-08 21:07:12', 'nikolp@gmail.com', 'Employee'),
('chrisben', 'bigflame95', 'Christos', 'Bennett', '2018-10-18 22:03:16', 'chris@gmail.com', 'Employee'),
('abrown', 'w1lcoxon', 'Andrew', 'McBrown', '2017-02-24 16:02:56', 'andrewbr@yahoo.gr', 'Employee'),
('caliga', 'richring51', 'Iga', 'Caldwell', '2018-01-27 15:01:03', 'iga@yahoo.gr', 'Employee');


/* add EVALUATORS */
insert into user (username, password, name, surname, reg_date, email, role) values 
('msmith', 'we3wd', 'Mike', 'Smith', '2017-06-23 13:12:34', 'smithm@unigram.com', 'Evaluator'),
('varcon82', 'gotop@s$', 'Nick', 'Varcon', '2018-12-03 18:12:39', 'varcni@incode.com', 'Evaluator'),
('bettyg', 'jUn38@', 'Betty', 'Georgiou', '2017-04-12 12:23:10', 'georb@softsol.gr', 'Evaluator'),
('papad', 'pdfr45t', 'Kostas', 'Papadatos', '2018-11-17 23:10:08', 'georb@softsol.gr', 'Evaluator'),
('n_tri', 'grt12wX', 'Nikol', 'Triantou', '2018-03-08 20:10:20', 'triantou@typology.gr', 'Evaluator'),
('Giankost', 'jUn38@', 'Giannis', 'Kostoglou', '2018-02-23 11:08:15', 'kostog@typology.gr', 'Evaluator'),
('pavkie', 'julie79', 'Pavel', 'Skiev', '2017-03-25 11:23:45', 'pskiev@social-sc.bg', 'Evaluator');

/* add MANAGERS */
insert into user (username, password, name, surname, reg_date, email, role) values 
('asimon','nSamg', 'Arnas', 'Simon', '2017-06-23 13:12:34', 'asimon@unigram.com', 'Manager'),
('escoell','eJMif', 'Elliot', 'Escobar', '2017-06-23 13:12:34', 'escoell@incode.com', 'Manager'),
('sloanteg','IcQan', 'Tegan', 'Sloan', '2017-06-23 13:12:34', 'sloanteg@unigram.com', 'Manager'),
('jennifre','0%Yfw', 'Jennifer' ,'Reynolds', '2017-06-23 13:12:34', 'jennifre@unigram.com', 'Manager'),
('compsdar12','j&Dni', 'Dario', 'Combs', '2017-06-23 13:12:34', 'compsdar12@incode.com', 'Manager'),
('renzomc', 'pC$rE', 'Renzo', 'Mckenna', '2017-06-23 13:12:34', 'renzomc@unigram.com', 'Manager');

/* add ADMINISTRATORS */
insert into user (username, password, name, surname, reg_date, email, role) values 
('brettan','Bx5ka', 'Brett', 'Antoniou', '2016-02-16 13:42:38', 'brettan@incode.com', 'Admin');


insert into manager (ManagerUsername, exp_years, firm) values 
('asimon', 8, '18765549'),
('escoell', 9 , '561234561'),
('sloanteg', 11, '123432211'),
('jennifre', 7, '023453344'),
('compsdar12', 13, '023451232'),
('renzomc', 8, '23122345');


insert into evaluator (username, exp_years, firm) values 
('msmith', 7, '18765549'),
('varcon82', 6, '561234561'),
('bettyg', 10, '123432211'),
('papad', 8, '123432211'),
('n_tri', 9, '023451232'),
('Giankost', 6, '023453344'),
('pavkie', 12, '23122345');


insert into employee(username, firm, exp_years, bio, sistatikes, certificates, awards) values
('cleogeo', '023451232', 26, 'Cleomenis is a secodary education graduate who has long work experience in web programming technologies (has worked for than 25 years in the field). He has been also certified as a CISCO security expert (CCIE Security) and an IT project manager (PMI Project Management Professional and Project Management Professional).', 'RecLetters.pdf', 'certifALL.pdf', 'IEEE Internet Award'),
('zazahir23', '123432211', 8, 'Mr Mobasher is a highly skilled web programmer who also has experience in 2d and 3d graphics generation as well as animation rendering. Moreover he has long experience with design, development and administration of large scale DBs, mostly relational.', 'Mobasher_rec.pdf', 'Mobasher-certif.pdf', 'Dhaka Site'),
('lionarF', '023453344', 9, 'Freddy is an experienced web programmer but has also worked on mobile apps development the last 5 years. He is a freelancer and can work from a distance. He can also manage 2d graphics and has long experience with DB scripting (My SQL, MariaDB, MS SQL Server and Oracle.', 'LionFr_letters.pdf', 'LionFR_cert.pdf', 'Stevens Award'),
('liagourma', '561234561', 13, 'Mrs Liagkoumi has a long experience in NLP and more specifically Information Retrieval and has also long research background on both areas. In addition she has worked on large coprus datasets and data visualization algorithms.', 'lettersLiagk.pdf', 'trainingLiagk.pdf', 'None'),
('mnikol', '18765549', 10, 'Mr Nikolopoulos holds a Computer Science diploma and an MSc and has long work experience in AI applications as well as Robotics. He has also managed large R&D projects in these domains and has teaching and research experience as well. Please refer to his referral letters for more details.','referralLetNikol.pdf','degreesAndCertNikol.pdf', 'None'),
('abrown', '23122345', 14, 'Andrew has a strong theoretical background in Algorithms and Data Stuctures and has worked for more than a decade in a software house that specializes in high performance data management. He is well skilled in high complexity schemes and heavy load memory management.', 'sis.pdf', 'certif.pdf', 'None'),
('sanrober', '23122345', 6, 'sanBio.pdf', 'sistat.pdf', 'certif.pdf', 'None'),
('jefben', '023451232', 7, 'jefBio.pdf', 'sis.pdf', 'certif.pdf', 'None'),
('antmorin', '123432211', 11, 'antBio.pdf', 'sist.pdf', 'certif.pdf', 'None'),
('bailind', '023453344', 20, 'lindBio.pdf', 'sistat.pdf', 'certif.pdf', 'None'),
('chrisben', '561234561', 17, 'chrisBio.pdf', 'sist.pdf', 'certif.pdf', 'None'),
('caliga', '18765549', 4, 'igaBio.pdf', 'sist.pdf', 'certif.pdf', 'None');


insert into antikeim (title, descr, belongs_to) values
('Computer Science', 'Root element', NULL),
('Databases', 'Level one element, child of Computer Science', 'Computer Science'),
('AI', 'Level one element, child of Computer Science', 'Computer Science'),
('Algorithms', 'Level one element, child of Computer Science', 'Computer Science'),
('Networking', 'Level one element, child of Computer Science', 'Computer Science'),
('Graphics', 'Level one element, child of Computer Science', 'Computer Science'),
('2D', 'Level two element, child of Graphics', 'Graphics'),
('3D', 'Level two element, child of Graphics', 'Graphics'),
('Animation', 'Level two element, child of Graphics', 'Graphics'),
('Programming', 'Level one element, child of Computer Science', 'Computer Science'),
('Web Programming', 'Level two element, child of Programming', 'Programming'),
('Mobile Apps', 'Level two element, child of Programming', 'Programming'),
('Relational DBs', 'Level two element, child of Databases', 'Databases'),
('Object-Oriented DBs', 'Level two element, child of Databases', 'Databases'),
('NoSQL DBs', 'Level two element, child of Databases', 'Databases'),
('Robotics', 'Level two element, child of AI', 'AI'),
('NLP', 'Level two element, child of AI', 'AI'),
('Information Retieval', 'Level three element, child of NLP', 'NLP'),
('Language analysis', ' Level three element, child of NLP', 'NLP'),
('Data structures', 'Level two element, child of Algorithms', 'Algorithms'),
('Complexity and Efficiency', 'Level two element, child of Algorithms', 'Algorithms'),
('Network setup and maintainance', 'Level two element, child of Networking', 'Networking'),
('Device connectivity', 'Level two element, child of Networking', 'Networking');



insert into job (start_date, salary, position, edra, evaluator, company_afm, announce_date, submission_date) values 
('2022-01-01', 1800, 'data analyst', 'Patra, Greece', 'n_tri', '023451232', '2021-02-06', '2021-08-02'),
('2021-10-09', 1450, 'web programmer', 'Patra, Greece', 'n_tri', '023451232', '2021-07-09', '2021-10-09'),
('2022-02-01', 2100, 'mobile app developer', 'Patra, Greece', 'Giankost', '023453344', '2021-01-11', '2021-05-01'),
('2021-12-25', 2700, 'NLP expert', 'Peiraias, Greece', 'msmith', '18765549', '2021-09-25', '2021-11-25'),
('2021-03-01', 2100, 'Graphics designer', 'Peiraias, Greece', 'msmith', '18765549', '2021-12-01', '2021-02-01'),
('2021-11-21', 2300, 'Visualization expert', 'Peiraias, Greece','Giankost', '023453344', '2021-07-21', '2021-11-21'),
('2022-05-01', 1850, 'web and mobile app programmer', 'Athina, Greece','papad', '123432211', '2021-02-09', '2021-10-02'),
('2022-01-06', 1600, 'graphics expert', 'Athina, Greece','bettyg', '123432211', '2021-05-06', '2021-08-19'),
('2021-05-01', 1850, 'DB expert', 'Athina, Greece','papad', '123432211', '2021-05-11', '2022-02-01'),
('2021-11-18', 2100, 'AI expert', 'Sofia, Bulgaria', 'pavkie', '23122345', '2021-06-18', '2021-12-07'),
('2021-08-27', 2600, 'Algorithmic efficiency expert', 'Sofia, Bulgaria', 'pavkie', '23122345', '2021-03-27', '2021-07-27'),
('2021-12-08', 2800, 'web and media programmer', 'Oxford, London', 'varcon82', '561234561', '2021-09-01', '2022-02-17');


insert into job (start_date, salary, position, edra, evaluator, company_afm, announce_date, submission_date) values 
('2023-01-01', 1540, 'data analyst', 'Patra, Greece', 'n_tri', '023451232', '2021-02-06', '2021-08-02');


insert into needs (job_id, antikeim_title) values 
(1, 'Databases'),
(1,'Algorithms'),
(2,'Programming'),
(2,'Web Programming'),
(3, 'Mobile Apps'),
(3, 'Animation'),
(4, 'AI'),
(4, 'NLP'),
(5, 'Graphics'),
(6, 'Graphics'),
(6, 'Algorithms'),
(6, 'Programming'),
(7, 'Web Programming'),
(7, 'Mobile Apps'),
(8, '2D'),
(8, '3D'),
(9, 'Databases'),
(9, 'NoSQL DBs'),
(10, 'AI'),
(11, 'Complexity and Efficiency'),
(11, 'Algorithms'),
(12, 'Web Programming'),
(12, 'Mobile Apps'),
(12, 'Animation');


insert into project(empl, num, descr, url) values
('abrown', 1, 'Minimal examples of data structures and algorithms in Python', 'https://github.com/a_brown/algorithms'),
('abrown', 2, 'Interactive Online Platform that Visualizes Algorithms from Code', 'https://github.com/a_brown/algorithm-visualizer'),
('abrown', 3, 'Repository which contains links and resources on different topics of Computer Science', 'https://github.com/a_brown/AlgoWiki'),
('mnikol', 1, 'Essential Cheat Sheets for deep learning and machine learning researchers', 'https://github.com/nikolo0p/cheatsheets-ai'),
('mnikol', 2, 'Python sample codes for robotics algorithms.', 'https://github.com/nikolo0p/PythonRobotics'),
('zazahir23',1,'Go Graphics - 2D rendering in Go with a simple API.','https://github.com/mob@s/gg'),
('zazahir23',2,'Draco is a library for compressing and decompressing 3D geometric meshes and point clouds. It is intended to improve the storage and transmission of 3D graphics.','https://github.com/mob@s/draco'),
('zazahir23',3,'Data Discovery and Lineage for Big Data Ecosystem.','https://github.com/linkedin/WhereHows'),
('lionarF', 1, 'HTML5 Mobile App UI templates created using Intel App Framework.', 'https://github.com/lionarGF/appframework-templates'),
('lionarF', 2, 'Mobile Version of Travel sample App using Couchbase Lite 2.0.', 'https://github.com/lionarFG/mobile-travel-sample'),
('lionarF', 3, 'Appium Demo App with clearly defined Page Object Pattern for React Native Mobile App. Test Language - Javascript.','https://github.com/lionarFG/Appium-Page-Object-Model-Demo'),
('liagourma', 1, 'WebGL2 powered geospatial visualization layers. offers an extensive catalog of pre-packaged visualization "layers", including ScatterplotLayer, ArcLayer, TextLayer, GeoJsonLayer, etc. The input to a layer is usually an array of JSON objects. Each layer offers highly-flexible API to customize how the data should be rendered.', 'https://github.com/liagk0R/deck.gl'),
('liagourma', 2, 'Messy datasets? Missing values? missingno provides a small toolset of flexible and easy-to-use missing data visualizations and utilities that allows a quick visual summary of the completeness (or lack thereof) of the dataset.','https://github.com/liagk0R/missingno'),
('liagourma', 3,'Repository to track the progress in Natural Language Processing (NLP), including the datasets and the current state-of-the-art for the most common NLP tasks','https://github.com/liagk0R/NLP-progress'),
('liagourma', 4,'Supporting Rapid Prototyping with a Toolkit (incl. Datasets and Neural Network Layers)', 'https://github.com/liagk0R/PyTorch-NLP'),
('sanrober', 1, 'Information Systems in a Future of Decreased and Redistributed Global Growth', 'https://github.com/san_rober/Inf_Systems'),
('sanrober', 2, 'Interdependence as a frame for assistive technology research and design', 'https://github.com/san_rober/Interdependence_frame'),
('jefben', 1, 'Code search with social and technical context', 'https://github.com/jef.ben/Codesearch'),
('jefben', 2, 'Energy-Aware mutation testing framework', 'https://github.com/jef.ben/energy-mutation'),
('antmorin', 1, 'Understanding the barriers to using personal health data in research', 'https://github.com/ant_morin/health-data'),
('antmorin', 2, 'An architectural style for secure, decentralized, and adaptive systems', 'https://github.com/ant_morin/architct-style'),
('antmorin', 3, 'Large Scale Mutation Analysis', 'https://github.com/ant_morin/large-scale-mutation'),
('bailind', 1, 'Weather Forecasting Using Data Mining', 'https://github.com/bailind/weather-forecasting'),
('bailind', 2, 'Movie Success Prediction Using Data Mining', 'https://github.com/bailind/movie-success'),
('chrisben', 1, 'Security Issue of Cloud-Based Storage', 'https://github.com/chris.ben/security-issues'),
('chrisben', 2, 'Web-Based Online Library System', 'https://github.com/chris.ben/library'),
('chrisben', 3, 'Energy & Power Efficient, Real-Time System Scheduling', 'https://github.com/chris.ben/energy-power-efficiency'),
('caliga', 1, 'Gaussian Processes for Bayesian State Estimation', 'https://github.com/caliga/gaussian-processes'),
('caliga', 2, 'Authentication and Adaptive Security for DNS System', 'https://github.com/caliga/dns-system');


insert into languages (employee, lang) values 
('cleogeo', 'EN,SP,GR'),
('zazahir23', 'GR,EN'),
('lionarF', 'EN,FR'),
('liagourma', 'GR,EN'),
('mnikol', 'GR,FR'),
('abrown', 'EN,FR,SP'),
('sanrober', 'EN,SP'),
('jefben', 'GR,EN,FR'),
('antmorin', 'EN,FR,SP'),
('bailind', 'EN,FR'),
('chrisben', 'EN,FR,SP'),
('caliga', 'GR,SP');


insert into degree (titlos, idryma, bathmida) values 
('Lysium certificate', '2nd Lysium of Aigaleo', 'LYKEIO'),
('Computer and Infromatics Eng.', ' Patras University', 'UNIV'),
('Electrical and Computer Eng.', 'Metsovio Polytexneio', 'UNIV'),
('Computer Science Dipl.', 'Lancster University', 'UNIV'),
('Computer Vision and Modelling', 'Princeton University', 'MASTER'),
('Artificial Intelligence', ' Cambrigde University', 'MASTER'),
('Big Data and Analytics', ' Imperial College London', 'MASTER'),
('Advanced Rendering Techniques', 'Delft University of Technology', 'MASTER'),
('Computer Science and Engineering', 'Delft University of Technology', 'UNIV'),
('Data Science Bachelor','Eindhoven University of Technology', 'UNIV'),
('PDEng Data Science', 'Eindhoven University of Technology', 'PHD'),
('NLP related high efficiency algorithms', 'Patras University', 'PHD'),
('Big Data Structures and Algorithms', 'Technical University of Denmark', 'MASTER');
												
															
insert into has_degree (empl_username, degr_title, degr_idryma, etos, grade) values 
('cleogeo','Lysium certificate', '2nd Lysium of Aigaleo', 1999, 9.2),
('zazahir23', 'Computer Science and Engineering', 'Delft University of Technology',2000, 8.2),
('zazahir23', 'PDEng Data Science', 'Eindhoven University of Technology',2006, 9),
('lionarF', 'Electrical and Computer Eng.', 'Metsovio Polytexneio', 1998, 7.6),
('lionarF', 'Computer Vision and Modelling', 'Princeton University', 2001, 8.5),
('liagourma', 'Computer and Infromatics Eng.', ' Patras University', 2003, 8.6),
('liagourma', 'Artificial Intelligence', ' Cambrigde University', 2008, 8),
('liagourma', 'NLP related high efficiency algorithms', 'Patras University', 2013, 9),
('mnikol', 'Computer Science Dipl.', 'Lancster University', 2001, 8.4),
('mnikol', 'Computer Vision and Modelling', 'Princeton University', 2006, 7.4),
('abrown','Data Science Bachelor','Eindhoven University of Technology',2004, 9.2),
('abrown','Big Data and Analytics', ' Imperial College London', 2006, 8),
('abrown','Big Data Structures and Algorithms', 'Technical University of Denmark', 2008, 8.2),
('sanrober','Computer Vision and Modelling', 'Princeton University', 2002, 8.1),
('jefben', 'Computer Vision and Modelling', 'Princeton University', 2003, 8.3),
('antmorin', 'Computer Science and Engineering', 'Delft University of Technology',2003, 8.4),
('antmorin', 'Artificial Intelligence', ' Cambrigde University',2008, 8.6),
('bailind', 'Artificial Intelligence', ' Cambrigde University', 2005, 7.9),
('bailind', 'Advanced Rendering Techniques', 'Delft University of Technology', 2007, 8.2),
('chrisben', 'Computer Vision and Modelling', 'Princeton University', 2003, 7.6),
('caliga', 'NLP related high efficiency algorithms', 'Patras University', 2010, 9.2),
('caliga', 'Computer Vision and Modelling', 'Princeton University', 2002, 8.7);


insert into evaluation(id, eval_username, empl_username, job_id, eval_comments, interview, report, extras, completed) values
(1, 'n_tri', 'cleogeo', 1, 'Not enough', 1, 0, 1, 0),
(2, 'n_tri', 'cleogeo',2, 'Good enough', 3, 2, 1, 0),
(3, 'papad', 'zazahir23', 7, 'Good', 2, 2, 1, 0),
(4, 'bettyg', 'zazahir23',8, 'Medium. Could improve.', 2, 2, null, 0),
(5, 'papad', 'zazahir23',9, 'Not bad, not good', 2, 3, 1, 0),
(6, 'Giankost', 'lionarF', 3, 'Great', 4, 3, 2, 0),
(7, 'Giankost', 'lionarF', 6, 'Great', 4, 3, 2, 0),
(8, 'varcon82', 'liagourma', 12, 'Great', 4, 4, 2, 0),
(9, 'msmith', 'mnikol', 4, 'Not for this job', 1, 2, 1, 0), 
(10, 'msmith', 'mnikol',5, 'Coud be better', 2, 2, 1, 0),
(11, 'pavkie', 'abrown', 10, null, null, null, null, 0),
(12, 'pavkie', 'abrown', 11, 'Very good, has potential', 3, 4, 2, 0),
(13, 'n_tri', 'jefben', 2, 'Good', 2, 3, null, 0),
(14, 'n_tri', 'jefben', 1, 'Very good, has potential', 3, 4, 2, 0),
(15, 'Giankost', 'bailind', 3, 'Coud be better', 3, null, null, 0),
(16, 'pavkie', 'sanrober', 11, 'Not good', 2, null, 2, 1);
/*
(15, 'pavkie', 'sanrober', 10, 'Very good, has potential', 3, 4, 2, 1),

(17, 'bettyg', 'antmorin', 7, 'Very good, has potential', 3, 4, 2, 1),
(18, 'papad', 'antmorin', 8, 'Very good, has potential', 3, 4, 2, 1),
(19, 'bettyg', 'antmorin', 9, 'Very good, has potential', 3, 4, 2, 1),
(20, 'Giankost', 'bailind', 3, 'Very good, has potential', 3, 4, 2, 1),
(21, 'Giankost', 'bailind', 6, 'Very good, has potential', 3, 4, 2, 1),
(22, 'msmith', 'caliga', 4, 'Very good, has potential', 3, 4, 2, 1),
(23, 'msmith', 'caliga', 5, 'Very good, has potential', 3, 4, 2, 1);   */


insert into evaluationresult(EVid, empl_username, job_id, grade, comments) values
(1,	'cleogeo',	1,	2, 'Not enough'),
(2,	'cleogeo',	2,	6, 'Good enough'),
(3,	'zazahir23', 7,	5, 'Good'),
(4,	'zazahir23', 9,	6, 'Not bad'),
(5,	'lionarF', 3, 9, 'Great'),
(6,	'lionarF',	6, 9, 'Great'),
(7,	'liagourma', 12, 10, 'Great'),
(8,	'mnikol', 4, 4,	'Not for this job'),
(9, 'mnikol', 5, 5, 'Coud be better'),
(10, 'abrown', 11, 9, 'Very good, has potential');
/*
(13, 'jefben', 2, 9, 'Very good, has potential'),
(14, 'jefben', 1, 9, 'Very good, has potential');
*/

insert into requestevaluation(empl_username, job_id) values
('cleogeo', 1),
('cleogeo',2),
('zazahir23', 7),
('zazahir23',8),
('zazahir23',9),
('lionarF', 3),
('lionarF', 6),
('liagourma',12),
('mnikol', 4), 
('mnikol',5),
('abrown', 10),
('abrown', 11),
('jefben', 2),
('jefben', 1),
('bailind', 3),
('sanrober', 10);
/*

('sanrober', 11),
('jefben', 1),
('jefben', 2),
('antmorin', 7),
('antmorin', 8),
('antmorin', 9),

('bailind', 6),
('caliga', 4),
('caliga', 5);
*/
