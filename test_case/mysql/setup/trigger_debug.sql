CREATE TABLE th1(a TEXT,FULLTEXT INDEX(a)) ENGINE=MyISAM;
CREATE TABLE th2(a TEXT,FULLTEXT INDEX(a)) ENGINE=MyISAM;
INSERT INTO th1 VALUES(1);
INSERT INTO th1 VALUES(1);
DROP TABLE th1;
DROP TABLE th2;
CREATE TABLE t1(a INT);