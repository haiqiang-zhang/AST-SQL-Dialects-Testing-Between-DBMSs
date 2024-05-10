DROP TABLE IF EXISTS t1,t2,t3,t4;
CREATE TABLE t1 (
  project_id int(11) NOT NULL auto_increment,
  project_row_lock int(11) NOT NULL default '0',
  project_name varchar(80) NOT NULL default '',
  client_ptr int(11) NOT NULL default '0',
  project_contact_ptr int(11) default NULL,
  client_contact_ptr int(11) default NULL,
  billing_contact_ptr int(11) default NULL,
  comments mediumtext,
  PRIMARY KEY  (project_id),
  UNIQUE KEY project (client_ptr,project_name)
) PACK_KEYS=1;
INSERT INTO t1 VALUES (1,0,'Rejected Time',1,NULL,NULL,NULL,NULL);
INSERT INTO t1 VALUES (209,0,'MDGRAD Proposal/Investigation',97,NULL,NULL,NULL,'');
INSERT INTO t1 VALUES (208,0,'Font 9 Design',84,NULL,NULL,NULL,'');
INSERT INTO t1 VALUES (207,0,'Web Based Order Processing',95,NULL,NULL,NULL,'');
INSERT INTO t1 VALUES (205,0,'Mac Screen Saver',95,NULL,NULL,NULL,'');
INSERT INTO t1 VALUES (206,0,'Web Site',96,NULL,NULL,NULL,'');
INSERT INTO t1 VALUES (204,0,'Magnafire Glue',94,NULL,NULL,NULL,'');
INSERT INTO t1 VALUES (203,0,'Print Bid',93,NULL,NULL,NULL,'');
INSERT INTO t1 VALUES (202,0,'EPOC Port',92,NULL,NULL,NULL,'');
INSERT INTO t1 VALUES (201,0,'TravelMate',88,NULL,NULL,NULL,'');
CREATE TABLE t2 (
  period_id int(11) NOT NULL auto_increment,
  period_type enum('user_table','client_table','role_table','member_table','project_table') default NULL,
  period_key int(11) default NULL,
  start_date datetime default NULL,
  end_date datetime default NULL,
  work_load int(11) default NULL,
  PRIMARY KEY  (period_id),
  KEY period_index (period_type,period_key),
  KEY date_index (start_date,end_date)
) PACK_KEYS=1;
INSERT INTO t2 VALUES (1,'user_table',98,'2000-01-01 00:00:00',NULL,NULL);
INSERT INTO t2 VALUES (2,'user_table',99,'2000-01-01 00:00:00',NULL,NULL);
INSERT INTO t2 VALUES (3,'user_table',100,'2000-01-01 00:00:00',NULL,NULL);
INSERT INTO t2 VALUES (49,'project_table',148,'2000-01-01 00:00:00',NULL,NULL);
INSERT INTO t2 VALUES (50,'client_table',68,'2000-01-01 00:00:00',NULL,NULL);
INSERT INTO t2 VALUES (51,'project_table',149,'2000-01-01 00:00:00',NULL,NULL);
INSERT INTO t2 VALUES (52,'project_table',150,'2000-01-01 00:00:00',NULL,NULL);
INSERT INTO t2 VALUES (53,'client_table',69,'2000-01-01 00:00:00',NULL,NULL);
INSERT INTO t2 VALUES (54,'project_table',151,'2000-01-01 00:00:00',NULL,NULL);
INSERT INTO t2 VALUES (55,'client_table',70,'2000-01-01 00:00:00',NULL,NULL);
INSERT INTO t2 VALUES (155,'role_table',1,'2000-01-01 00:00:00',NULL,NULL);
INSERT INTO t2 VALUES (156,'role_table',2,'2000-01-01 00:00:00',NULL,NULL);
INSERT INTO t2 VALUES (160,'member_table',1,'2000-01-01 00:00:00',NULL,1);
INSERT INTO t2 VALUES (161,'member_table',2,'2000-01-01 00:00:00',NULL,1);
INSERT INTO t2 VALUES (162,'member_table',3,'2000-01-01 00:00:00',NULL,1);
CREATE TABLE t3 (
  budget_id int(11) NOT NULL auto_increment,
  project_ptr int(11) NOT NULL default '0',
  po_number varchar(20) NOT NULL default '',
  status enum('open','closed') default NULL,
  date_received datetime default NULL,
  amount_received float(10,2) default NULL,
  adjustment float(10,2) default NULL,
  PRIMARY KEY  (budget_id),
  UNIQUE KEY po (project_ptr,po_number)
) PACK_KEYS=1;
CREATE TABLE t4 (
  client_id int(11) NOT NULL auto_increment,
  client_row_lock int(11) NOT NULL default '0',
  client_name varchar(80) NOT NULL default '',
  contact_ptr int(11) default NULL,
  comments mediumtext,
  PRIMARY KEY  (client_id),
  UNIQUE KEY client_name (client_name)
) PACK_KEYS=1;
INSERT INTO t4 VALUES (1,0,'CPS',NULL,NULL);
DROP TABLE t1,t2,t3,t4;
