ALTER TABLE t3 ALTER INDEX a INVISIBLE;
CREATE TABLE t4 ( a INT, KEY (a)) ENGINE=MyISAM;
ALTER TABLE t4 ALTER INDEX a INVISIBLE;
DROP TABLE t1;
DROP TABLE t2;
DROP TABLE t3;
DROP TABLE t4;
