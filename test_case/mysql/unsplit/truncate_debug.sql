drop table if exists t1, t2;
CREATE TABLE t1(a INT, b TEXT, KEY (a)) SECONDARY_ENGINE=MOCK;
LOCK TABLES t1 WRITE;
SELECT * FROM t1;
UNLOCK TABLES;
DROP TABLE t1;