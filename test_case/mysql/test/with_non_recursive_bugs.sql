CREATE OR REPLACE VIEW view_c AS SELECT * FROM c;
DROP VIEW view_c;
DROP TABLE bb,cc,c;
CREATE TABLE d (
  col_int int(11) DEFAULT NULL,
  col_time_key time DEFAULT NULL,
  pk int(11) NOT NULL AUTO_INCREMENT,
  col_datetime_key datetime DEFAULT NULL,
  col_int_key int(11) DEFAULT NULL,
  col_blob_key blob,
  col_varchar_key varchar(1) DEFAULT NULL,
  col_varchar varchar(1) DEFAULT NULL,
  col_time time DEFAULT NULL,
  col_blob blob,
  col_date date DEFAULT NULL,
  col_datetime datetime DEFAULT NULL,
  col_date_key date DEFAULT NULL,
  PRIMARY KEY (pk),
  KEY col_time_key (col_time_key),
  KEY col_datetime_key (col_datetime_key),
  KEY col_int_key (col_int_key),
  KEY col_blob_key (col_blob_key(255)),
  KEY col_varchar_key (col_varchar_key),
  KEY col_date_key (col_date_key)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
CREATE TABLE dd (
  col_datetime datetime DEFAULT NULL,
  col_varchar varchar(1) DEFAULT NULL,
  col_blob_key blob,
  col_date date DEFAULT NULL,
  col_datetime_key datetime DEFAULT NULL,
  col_blob blob,
  col_varchar_key varchar(1) DEFAULT NULL,
  col_int int(11) DEFAULT NULL,
  col_date_key date DEFAULT NULL,
  col_time time DEFAULT NULL,
  pk int(11) NOT NULL AUTO_INCREMENT,
  col_time_key time DEFAULT NULL,
  col_int_key int(11) DEFAULT NULL,
  PRIMARY KEY (pk),
  KEY col_blob_key (col_blob_key(255)),
  KEY col_datetime_key (col_datetime_key),
  KEY col_varchar_key (col_varchar_key),
  KEY col_date_key (col_date_key),
  KEY col_time_key (col_time_key),
  KEY col_int_key (col_int_key)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
DROP TABLE d,dd;
CREATE TABLE d (
  col_int int(11) DEFAULT NULL,
  col_time_key time DEFAULT NULL,
  pk int(11) NOT NULL AUTO_INCREMENT,
  col_datetime_key datetime DEFAULT NULL,
  col_int_key int(11) DEFAULT NULL,
  col_blob_key blob,
  col_varchar_key varchar(1) DEFAULT NULL,
  col_varchar varchar(1) DEFAULT NULL,
  col_time time DEFAULT NULL,
  col_blob blob,
  col_date date DEFAULT NULL,
  col_datetime datetime DEFAULT NULL,
  col_date_key date DEFAULT NULL,
  PRIMARY KEY (pk),
  KEY col_time_key (col_time_key),
  KEY col_datetime_key (col_datetime_key),
  KEY col_int_key (col_int_key),
  KEY col_blob_key (col_blob_key(255)),
  KEY col_varchar_key (col_varchar_key),
  KEY col_date_key (col_date_key)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
CREATE OR REPLACE VIEW view_d AS SELECT * FROM d;
CREATE TABLE dd (
  col_datetime datetime DEFAULT NULL,
  col_varchar varchar(1) DEFAULT NULL,
  col_blob_key blob,
  col_date date DEFAULT NULL,
  col_datetime_key datetime DEFAULT NULL,
  col_blob blob,
  col_varchar_key varchar(1) DEFAULT NULL,
  col_int int(11) DEFAULT NULL,
  col_date_key date DEFAULT NULL,
  col_time time DEFAULT NULL,
  pk int(11) NOT NULL AUTO_INCREMENT,
  col_time_key time DEFAULT NULL,
  col_int_key int(11) DEFAULT NULL,
  PRIMARY KEY (pk),
  KEY col_blob_key (col_blob_key(255)),
  KEY col_datetime_key (col_datetime_key),
  KEY col_varchar_key (col_varchar_key),
  KEY col_date_key (col_date_key),
  KEY col_time_key (col_time_key),
  KEY col_int_key (col_int_key)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
CREATE OR REPLACE VIEW view_dd AS SELECT * FROM dd;
DROP TABLE d,dd;
DROP VIEW view_d,view_dd;
create table t1 (i int);
drop table t1;
CREATE TABLE b (
col_time_key time,
col_int_key int,
col_varchar_key varchar (1),
col_date date,
col_blob blob,
col_datetime_key datetime,
col_date_key date,
col_time time,
col_varchar varchar (1),
col_blob_key blob,
col_datetime datetime,
pk integer auto_increment,
col_int int,
/*Indices*/
key (col_time_key ),
key (col_int_key ),
key (col_varchar_key ),
key (col_datetime_key ),
key (col_date_key ),
key (col_blob_key  (255)),
primary key (pk)) ENGINE=innodb;
CREATE VIEW view_b AS SELECT * FROM b;
INSERT /*! IGNORE */ INTO b VALUES  ('2005-05-12 20:15:58.052785', 6, 'h',
'20071120175445.006011', 'fvqjpbenl', '2008-08-28', '2003-08-01', '2009-01-10 04:04:37.053602', 's', 'vqjpbenltgiontlibvmp', '2004-02-19 08:13:58.032936',
NULL, 4) ,  ('20071118112941.009031', 9, 'e', '20080508112705.046045',
'qjpbenltg', '20000122221334.050982', '20020316014521.034828',
'20070409063441.029820', NULL, NULL, '2002-06-23 04:05:27.001486', NULL, 8) ,
 ('20010404150354.016080', NULL, 'm', '2004-05-14 17:28:27.039217', 'jpbenl',
'2004-09-09', '20010228000657.035507', '20030819070327.048648', 'm',
'pbenltgi', '20060303182928.062974', NULL, 6) ,  ('2008-09-24
08:53:22.016827', 5, 'h', '2003-09-01', 'benltgiontlibvm', '2008-02-14 12:17:09.031635', '20030521151251.025342', '2004-04-09 16:10:11.026258', 'f',
'enltgiontlibvmpqr', '2000-11-14 15:22:28.018134', NULL, 8) ,
('20060315071422.004876', 7, 'a', '20020528041154.021479', 'nlt',
'2001-12-10', '2000-08-14', '2009-07-08 20:24:29.025421', 'p', 'ltg',
'2002-12-18 10:27:50.063087', NULL, 7) ,  ('2002-05-27 01:01:59.035319', 7,
'o', '20020415090450.013271', 'tgiontlibv', '2007-05-10 13:54:51.019132',
'2007-02-26', '2003-11-22', 'u', 'g', '2009-06-07', NULL, 0) ,
('20061121170837.015534', 7, 'o', '2009-05-22 06:11:40.033655', 'iontlibvm',
'20010810174929.035591', '2007-06-20', '2009-05-06', 'e', 'ont',
'2008-03-03', NULL, 3) ,  ('2004-07-14 04:47:47.049162', 0, 'f', '2003-11-22 07:50:00.056590', 'ntlibvmp', '2001-02-27', '20080624151301.040796',
'20021208065236.045936', 'i', 'tli', '20030828030915.046482', NULL, 0) ,
('2003-11-27', 5, 'k', '20070502031945.009253', 'libvmp',
'20090519072058.040435', '2006-01-15', '2006-09-02', 't', 'ibvmpqr',
'2002-09-26 20:33:21.025782', NULL, NULL) ,  ('20020801190408.035296', 3,
'd', '2008-03-10', 'bvmpqrj', '20000404232830.043738',
'20080104131505.048837', '2008-03-21 14:47:29.005926', 'e', 'vmpqrjqqtervh',
'20070213100707.011219', NULL, NULL);
CREATE TABLE d (
col_blob blob,
col_date_key date,
col_varchar_key varchar (1),
col_int int,
pk integer auto_increment,
col_int_key int,
col_time time,
col_varchar varchar (1),
col_date date,
col_datetime datetime,
col_blob_key blob,
col_datetime_key datetime,
col_time_key time,
/*Indices*/
key (col_date_key ),
key (col_varchar_key ),
primary key (pk),
key (col_int_key ),
key (col_blob_key  (255)),
key (col_datetime_key ),
key (col_time_key )) ENGINE=innodb;
CREATE VIEW view_d AS SELECT * FROM d;
INSERT /*! IGNORE */ INTO d VALUES  ('vjhnsz', '2009-01-07 14:35:19.020132',
'l', 3, NULL, 3, '20000326113108.015501', 'r', '20010401050329.035127',
'20011113143139.064960', 'jhnszaxsayy', '20070118125355.047410',
'20090428164254.028210') ,  ('hnszaxs', '2008-08-27 11:54:15.047662', 'j', 4,
NULL, 0, '20010202135929.024155', 'v', '2007-08-16', '2005-04-09',
'nszaxsayy', '20080516080723.016240', '2007-01-17') ,  (NULL, '2003-09-24 00:21:21.031671', 'b', 9, NULL, 1, '20031103023944.058953', 'j',
'2003-03-13', '20060501024312.007597', 'szaxsayyl', '20081027124453.006858',
'2002-08-06') ,  ('zaxsayylmwcxvckkurpm', '20031022235229.001956', 'n', 5,
NULL, 1, '2004-07-27 08:04:56.058948', 't', '20050807070334.035272',
'2007-06-11', NULL, '20060923090920.011086', '20030612224409.056295') ,
('axsayy', '2004-01-19', 'n', 9, NULL, 9, '2006-05-14 05:40:33.042253', 'o',
'20041215133725.018148', '2007-04-24 00:00:38.063289', 'xsayylm',
'20010204112339.062692', '2002-02-02 09:29:07.046062') ,
('sayylmwcxvckkurpmkgo', '2006-06-10 22:00:28.042795', 'f', 0, NULL, NULL,
'2005-01-07 15:59:14.020326', 'l', '2001-04-04 04:45:32.007662', '2002-07-05 12:32:06.063122', 'ayylmwcxvckkurpm', '2004-12-05', '20030805231032.036854')
,  ('yylmwcxvckk', '2003-12-08', 'o', NULL, NULL, NULL, '2002-10-10', 'z',
'20060120195105.061469', '2007-12-08 15:45:05.033799', NULL,
'20030127203404.043978', '2006-06-23') ,  ('ylmwcxvckkurpmkg',
'20041116013050.054722', 'e', 9, NULL, 9, '20010118181543.064149', 'a',
'20080922201409.032468', '2001-03-22 08:12:26.049150',
'lmwcxvckkurpmkgousyu', '2009-02-13', '20000224232013.001267') ,  (NULL,
'2009-03-07 11:05:18.000692', 'f', 4, NULL, 2, '2002-09-12 12:18:58.006036',
'v', '2002-06-07 02:13:31.045026', '2008-07-09 07:24:51.028063',
'mwcxvckkurpmkgou', '20021224090830.002338', '2006-04-18 07:30:48.043718') ,
('wcxvckkur', '2004-01-17', 'y', 0, NULL, 1, '2000-05-12 01:48:35.064791',
'x', '20070410164713.053236', '2003-05-23', 'cx', '20010122125247.033418',
'2002-07-21');
CREATE TABLE cc (
col_date date,
col_int_key int,
col_date_key date,
col_blob blob,
col_varchar_key varchar (1),
col_blob_key blob,
col_datetime_key datetime,
pk integer auto_increment,
col_datetime datetime,
col_varchar varchar (1),
col_int int,
col_time time,
col_time_key time,
/*Indices*/
key (col_int_key ),
key (col_date_key ),
key (col_varchar_key ),
key (col_blob_key  (255)),
key (col_datetime_key ),
primary key (pk),
key (col_time_key )) ENGINE=innodb;
INSERT /*! IGNORE */ INTO cc VALUES  ('2005-06-10 07:33:22.052469', 8,
'20060110031422.021867', 'dwnqdsnrgazuybhjdahq', 'r', 'wnqdsnrgazuybhjda',
'20050603013634.045108', NULL, '2004-02-11', 'f', 3, '20000705085324.025237',
'2003-04-15 00:38:25.053635') ,  ('2000-10-26 05:14:38.024766', 7,
'20000612214032.039531', 'nqdsnrg', 'c', 'qdsnrgazuy', '2007-05-09', NULL,
'2000-12-15 11:35:37.016508', 'e', 8, '2009-05-06 05:01:24.056192',
'2003-01-23 23:58:06.029416') ,  ('20050504023258.045971', 7, '2008-01-15 02:21:38.039039', 'dsnrgazuybhjda', 'i', 'snrga', '2002-12-13
00:31:57.060608', NULL, '2008-07-24 11:47:14.001612', 'm', 0, '2005-03-05',
'2008-06-19 10:48:38.019334') ,  ('2000-04-15', 3, '20081004053314.044710',
'nrgazuybh', 'f', 'rgazuybhj', '20080306031449.018675', NULL, '2006-10-19',
'k', 7, '20050721191228.013016', '20020624120807.061954') ,  ('2000-12-15 17:47:06.016372', 6, '2006-05-02', 'gazuybhjdahqd', 'p',
'azuybhjdahqdxtgmcoi', '2009-12-20', NULL, '20080527214707.035996', 'b', 9,
'20081205171614.002123', '2005-02-22 01:45:02.001096') ,  ('2006-02-01 17:54:51.014899', 9, '20020314004355.038751', 'zuybhjd', 'x', 'uybhj',
'2004-08-26', NULL, '2000-01-11', 'z', 0, '2002-06-18 04:58:56.042381',
'2009-05-22 14:06:31.037897') ,  ('2008-07-13 11:52:57.026926', 7,
'20020209152856.020954', 'ybhjdahqd', 'v', 'bhjdahqdxtgmcoipfty', '2003-02-04 12:57:47.049387', NULL, '20091024085101.040905', 'a', 6,
'20020728235938.013783', '2000-03-19') ,  ('20090324051451.058328', 5,
'20010823083110.056903', 'hjdahqdxtgmcoip', 'n', 'jdahqdxtgmcoipf',
'20020724124943.026135', NULL, '2000-12-20 05:29:33.011954', 'a', 3,
'2006-09-26', '2005-08-06 23:37:38.032353') ,  ('2006-06-20 18:09:36.056461',
NULL, '20060712223533.053408', 'dahqdxtgmcoipft', 'p', 'ahqdxtgmcoipftyraxg',
'20030312223653.030796', NULL, '20060508204857.062148', 'p', NULL,
'20000425075615.007223', '2000-05-26 17:03:40.000684') ,
('20081110073618.016133', 3, '2000-07-24 16:13:45.058915', 'hqdxtgmc', 's',
NULL, '20001101104313.012643', NULL, '2005-07-09', 'o', 2,
'20040927102407.022307', '20091206042605.020200');
DROP TABLE b,cc,d;
DROP VIEW view_d,view_b;
CREATE TABLE a (
col_int int,
col_date date,
col_time time,
col_time_key time,
col_date_key date,
col_blob blob,
col_varchar varchar (1),
col_datetime datetime,
col_int_key int,
pk integer auto_increment,
col_blob_key blob,
col_datetime_key datetime,
col_varchar_key varchar (1),
key (col_time_key ),
key (col_date_key ),
key (col_int_key ),
primary key (pk),
key (col_blob_key  (255)),
key (col_datetime_key ),
key (col_varchar_key )) ENGINE=innodb;
CREATE TABLE c (
col_int_key int,
col_datetime datetime,
col_time_key time,
pk integer auto_increment,
col_varchar_key varchar (1),
col_date_key date,
col_blob_key blob,
col_int int,
col_varchar varchar (1),
col_time time,
col_datetime_key datetime,
col_date date,
col_blob blob,
key (col_int_key ),
key (col_time_key ),
primary key (pk),
key (col_varchar_key ),
key (col_date_key ),
key (col_blob_key  (255)),
key (col_datetime_key )) ENGINE=innodb;
CREATE TABLE d (
col_time_key time,
col_time time,
col_blob blob,
col_datetime_key datetime,
col_varchar varchar (1),
col_int_key int,
col_int int,
col_date_key date,
col_date date,
col_blob_key blob,
col_datetime datetime,
pk integer auto_increment,
col_varchar_key varchar (1),
key (col_time_key ),
key (col_datetime_key ),
key (col_int_key ),
key (col_date_key ),
key (col_blob_key  (255)),
primary key (pk),
key (col_varchar_key )) ENGINE=innodb;
DROP TABLE c,d,a;
CREATE TABLE a (
  col_int int(11) DEFAULT NULL,
  col_time_key time DEFAULT NULL,
  col_datetime datetime DEFAULT NULL,
  col_blob_key blob,
  col_varchar_key varchar(1) DEFAULT NULL,
  col_date date DEFAULT NULL,
  col_blob blob,
  col_varchar varchar(1) DEFAULT NULL,
  col_int_key int(11) DEFAULT NULL,
  pk int(11) NOT NULL AUTO_INCREMENT,
  col_time time DEFAULT NULL,
  col_date_key date DEFAULT NULL,
  col_datetime_key datetime DEFAULT NULL,
  PRIMARY KEY (pk),
  KEY col_time_key (col_time_key),
  KEY col_blob_key (col_blob_key(255)),
  KEY col_varchar_key (col_varchar_key),
  KEY col_int_key (col_int_key),
  KEY col_date_key (col_date_key),
  KEY col_datetime_key (col_datetime_key)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
CREATE TABLE d (
  col_date date DEFAULT NULL,
  col_date_key date DEFAULT NULL,
  col_int int(11) DEFAULT NULL,
  col_varchar varchar(1) DEFAULT NULL,
  col_varchar_key varchar(1) DEFAULT NULL,
  col_datetime datetime DEFAULT NULL,
  col_datetime_key datetime DEFAULT NULL,
  col_blob_key blob,
  pk int(11) NOT NULL AUTO_INCREMENT,
  col_time time DEFAULT NULL,
  col_time_key time DEFAULT NULL,
  col_int_key int(11) DEFAULT NULL,
  col_blob blob,
  PRIMARY KEY (pk),
  KEY col_date_key (col_date_key),
  KEY col_varchar_key (col_varchar_key),
  KEY col_datetime_key (col_datetime_key),
  KEY col_blob_key (col_blob_key(255)),
  KEY col_time_key (col_time_key),
  KEY col_int_key (col_int_key)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
CREATE TABLE bb (
  col_datetime datetime DEFAULT NULL,
  col_time time DEFAULT NULL,
  col_int int(11) DEFAULT NULL,
  col_varchar_key varchar(1) DEFAULT NULL,
  pk int(11) NOT NULL AUTO_INCREMENT,
  col_time_key time DEFAULT NULL,
  col_blob blob,
  col_date date DEFAULT NULL,
  col_datetime_key datetime DEFAULT NULL,
  col_date_key date DEFAULT NULL,
  col_blob_key blob,
  col_int_key int(11) DEFAULT NULL,
  col_varchar varchar(1) DEFAULT NULL,
  PRIMARY KEY (pk),
  KEY col_varchar_key (col_varchar_key),
  KEY col_time_key (col_time_key),
  KEY col_datetime_key (col_datetime_key),
  KEY col_date_key (col_date_key),
  KEY col_blob_key (col_blob_key(255)),
  KEY col_int_key (col_int_key)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
CREATE TABLE cc (
  col_varchar_key varchar(1) DEFAULT NULL,
  col_date_key date DEFAULT NULL,
  col_int_key int(11) DEFAULT NULL,
  col_time time DEFAULT NULL,
  col_blob blob,
  col_datetime datetime DEFAULT NULL,
  col_time_key time DEFAULT NULL,
  col_varchar varchar(1) DEFAULT NULL,
  pk int(11) NOT NULL AUTO_INCREMENT,
  col_date date DEFAULT NULL,
  col_blob_key blob,
  col_datetime_key datetime DEFAULT NULL,
  col_int int(11) DEFAULT NULL,
  PRIMARY KEY (pk),
  KEY col_varchar_key (col_varchar_key),
  KEY col_date_key (col_date_key),
  KEY col_int_key (col_int_key),
  KEY col_time_key (col_time_key),
  KEY col_blob_key (col_blob_key(255)),
  KEY col_datetime_key (col_datetime_key)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
INSERT INTO cc VALUES ('r','2009-06-19',9,'00:20:01','uzymmwnorr','2000-07-03
03:10:16','17:17:32','f',1,'2007-06-20','zym','2001-10-19
13:28:47',2),('d','2000-12-27',7,'22:21:37','ymmwn','2000-09-05
06:27:09','15:26:21','a',2,'2003-08-19','mmwnorrskzxfni','2002-06-08
06:10:17',5),('e','2009-03-11',4,'08:30:12','mwnorrskzx','2002-05-21
12:10:52','22:59:24','m',3,'2008-12-04','wnorrskzxfn','2009-11-21
10:47:03',4),('b','2003-08-25',1,'22:05:05','norrskzxfniuzodhtf','2006-03-04
02:36:50','21:40:31','k',4,'2000-03-13','orrskzx','2006-12-15
19:28:52',2),('u','2004-01-15',4,'00:20:02','rrskzxfniuzod','2004-04-23
09:09:44','00:49:02','u',5,'2009-12-13','rskzxfniuzodhtfjsf','2007-09-03
17:43:18',1),('v','2003-08-24',2,'02:46:50','skzxfni','2006-11-15
05:02:03','16:16:11','c',6,'2009-12-09','kzxfniuzodhtfj','2004-01-19
00:00:00',4),('j','2000-05-25',1,'00:20:09','zxfniuzodhtfjsfc','2004-07-18
00:00:00','06:15:00','z',7,'2001-11-03','xfniuzodhtfjs','2003-07-22
04:34:51',6),('h','2001-05-12',5,'00:20:05','fniuzodhtfjsfcyq','2008-07-11
19:49:03','21:51:53','w',8,'2008-10-18','ni','2003-02-21
00:00:00',2),('f','2005-09-24',7,'00:20:09','iuzodhtfjsfcyqrkxk','2006-09-27
00:00:00','10:33:36','f',9,'2008-02-19','uzodhtfjsfcyq','2009-10-17
08:43:06',3),('j','2000-05-07',9,'07:16:29','zodhtfjs','2009-09-07
00:00:00','00:20:05','b',10,'2005-11-10','odhtfjs','2009-04-26 00:00:00',0);
CREATE TABLE dd (
  col_int_key int(11) DEFAULT NULL,
  col_int int(11) DEFAULT NULL,
  col_varchar_key varchar(1) DEFAULT NULL,
  col_date date DEFAULT NULL,
  col_date_key date DEFAULT NULL,
  col_blob blob,
  col_varchar varchar(1) DEFAULT NULL,
  col_blob_key blob,
  col_datetime datetime DEFAULT NULL,
  col_time_key time DEFAULT NULL,
  pk int(11) NOT NULL AUTO_INCREMENT,
  col_datetime_key datetime DEFAULT NULL,
  col_time time DEFAULT NULL,
  PRIMARY KEY (pk),
  KEY col_int_key (col_int_key),
  KEY col_varchar_key (col_varchar_key),
  KEY col_date_key (col_date_key),
  KEY col_blob_key (col_blob_key(255)),
  KEY col_time_key (col_time_key),
  KEY col_datetime_key (col_datetime_key)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
DROP TABLE a,d,bb,cc,dd;
CREATE TABLE aa (
  col_time_key time DEFAULT NULL,
  col_int_key int(11) DEFAULT NULL,
  col_int int(11) DEFAULT NULL,
  col_date date DEFAULT NULL,
  col_date_key date DEFAULT NULL,
  col_varchar varchar(30) DEFAULT NULL,
  pk int(11) NOT NULL AUTO_INCREMENT,
  col_blob_key blob,
  col_datetime_key datetime DEFAULT NULL,
  col_datetime datetime DEFAULT NULL,
  col_varchar_key varchar(30) DEFAULT NULL,
  col_blob blob,
  col_time time DEFAULT NULL,
  PRIMARY KEY (pk),
  KEY col_time_key (col_time_key),
  KEY col_int_key (col_int_key),
  KEY col_date_key (col_date_key),
  KEY col_blob_key (col_blob_key(255)),
  KEY col_datetime_key (col_datetime_key),
  KEY col_varchar_key (col_varchar_key)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
CREATE TABLE b (
  col_varchar_key varchar(30) DEFAULT NULL,
  col_blob blob,
  col_datetime datetime DEFAULT NULL,
  col_date_key date DEFAULT NULL,
  col_time time DEFAULT NULL,
  col_time_key time DEFAULT NULL,
  col_blob_key blob,
  pk int(11) NOT NULL AUTO_INCREMENT,
  col_datetime_key datetime DEFAULT NULL,
  col_int_key int(11) DEFAULT NULL,
  col_varchar varchar(30) DEFAULT NULL,
  col_date date DEFAULT NULL,
  col_int int(11) DEFAULT NULL,
  PRIMARY KEY (pk),
  KEY col_varchar_key (col_varchar_key),
  KEY col_date_key (col_date_key),
  KEY col_time_key (col_time_key),
  KEY col_blob_key (col_blob_key(255)),
  KEY col_datetime_key (col_datetime_key),
  KEY col_int_key (col_int_key),
  KEY test_idx (col_int_key,col_int) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
CREATE TABLE bb (
  col_varchar_key varchar(30) DEFAULT NULL,
  col_datetime datetime DEFAULT NULL,
  col_varchar varchar(30) DEFAULT NULL,
  col_blob_key blob,
  pk int(11) NOT NULL AUTO_INCREMENT,
  col_time_key time DEFAULT NULL,
  col_time time DEFAULT NULL,
  col_datetime_key datetime DEFAULT NULL,
  col_blob blob,
  col_date_key date DEFAULT NULL,
  col_int_key int(11) DEFAULT NULL,
  col_int int(11) DEFAULT NULL,
  col_date date DEFAULT NULL,
  PRIMARY KEY (pk),
  KEY col_varchar_key (col_varchar_key),
  KEY col_blob_key (col_blob_key(255)),
  KEY col_time_key (col_time_key),
  KEY col_datetime_key (col_datetime_key),
  KEY col_date_key (col_date_key),
  KEY col_int_key (col_int_key)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
CREATE TABLE c (
  col_varchar varchar(30) DEFAULT NULL,
  col_time time DEFAULT NULL,
  pk int(11) NOT NULL AUTO_INCREMENT,
  col_int int(11) DEFAULT NULL,
  col_date date DEFAULT NULL,
  col_blob_key blob,
  col_datetime datetime DEFAULT NULL,
  col_date_key date DEFAULT NULL,
  col_blob blob,
  col_datetime_key datetime DEFAULT NULL,
  col_varchar_key varchar(30) DEFAULT NULL,
  col_int_key int(11) DEFAULT NULL,
  col_time_key time DEFAULT NULL,
  PRIMARY KEY (pk),
  KEY col_blob_key (col_blob_key(255)),
  KEY col_date_key (col_date_key),
  KEY col_datetime_key (col_datetime_key),
  KEY col_varchar_key (col_varchar_key),
  KEY col_int_key (col_int_key),
  KEY col_time_key (col_time_key),
  KEY test_idx (pk,col_int_key)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
CREATE TABLE e (
  col_time_key time DEFAULT NULL,
  col_date_key date DEFAULT NULL,
  col_blob_key blob,
  col_int_key int(11) DEFAULT NULL,
  col_time time DEFAULT NULL,
  col_blob blob,
  pk int(11) NOT NULL AUTO_INCREMENT,
  col_datetime datetime DEFAULT NULL,
  col_varchar varchar(30) DEFAULT NULL,
  col_varchar_key varchar(30) DEFAULT NULL,
  col_int int(11) DEFAULT NULL,
  col_datetime_key datetime DEFAULT NULL,
  col_date date DEFAULT NULL,
  PRIMARY KEY (pk),
  KEY col_time_key (col_time_key),
  KEY col_date_key (col_date_key),
  KEY col_blob_key (col_blob_key(255)),
  KEY col_int_key (col_int_key),
  KEY col_varchar_key (col_varchar_key),
  KEY col_datetime_key (col_datetime_key),
  KEY test_idx (col_int_key,col_int) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
CREATE OR REPLACE VIEW view_c AS SELECT * FROM c;
CREATE OR REPLACE VIEW view_bb AS SELECT * FROM bb;
DROP VIEW view_c, view_bb;
DROP TABLE aa,b,bb,c,e;
CREATE TABLE E (
col_varchar_key varchar (1),
col_datetime_key datetime,
col_varchar varchar (1),
col_int_key int,
col_time time,
col_time_key time,
col_date_key date,
col_datetime datetime,
col_int int,
col_blob blob,
col_date date,
col_blob_key blob,
pk integer auto_increment,
/*Indices*/
key (col_varchar_key ),
key (col_datetime_key ),
key (col_int_key ),
key (col_time_key ),
key (col_date_key ),
key (col_blob_key  (255)),
primary key (pk)) ENGINE=innodb;
DROP TABLE E;
CREATE TABLE t1(a INT);
INSERT INTO t1 VALUES(1),(2),(3),(4),(5),(6);
CREATE TABLE t2 (a INT);
SELECT * FROM t2 tmp1, t2 tmp2 WHERE tmp1.a<>tmp2.a;
DELETE FROM t2;
SELECT * FROM t2 tmp1, t2 tmp2 WHERE tmp1.a<>tmp2.a;
DROP TABLE t1,t2;
create table t1(a int);
insert into t1 values(2),(3);
insert into t1 with t1 as (select 36 as col from t1) select * from t1;
select * from t1;
create table t2 with t1 as (select 72 as col from t1) select * from t1;
select * from t1;
select * from t2;
drop table t1,t2;
CREATE TABLE t1(a INTEGER);
DROP TABLE t1;
CREATE TABLE t1 (f1 TEXT);
INSERT INTO t1 VALUES ('x');
DROP TABLE t1;
