drop table if exists t1,t2,t3,t4,t5,t6;
CREATE TABLE t1 (c1 INT) ENGINE= MyISAM;
LOCK TABLE t1 WRITE;
SELECT * FROM t1;
UNLOCK TABLES;
DROP TABLE t1;
