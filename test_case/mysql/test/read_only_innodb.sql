select @@global.read_only;
select * from table_11733;
drop table table_11733;
CREATE TABLE t1(a INT) ENGINE=INNODB;
INSERT INTO t1 VALUES (0), (1);
SELECT * FROM t1;
SELECT * FROM t1;
SELECT * FROM t1;
SELECT * FROM t1;
UNLOCK TABLES;
DROP TABLE t1;
DROP DATABASE IF EXISTS db1;
CREATE DATABASE db1;
CREATE TABLE db1.t1 (a INT) ENGINE=INNODB;
CREATE TABLE db1.t2 (a INT) ENGINE=INNODB;
CREATE TEMPORARY TABLE temp (a INT) ENGINE=INNODB;
INSERT INTO temp VALUES (1);
DROP TABLE temp;
CREATE TEMPORARY TABLE temp (a INT) ENGINE=INNODB;
INSERT INTO temp values (1);
UNLOCK TABLES;
DROP TABLE temp;
CREATE TEMPORARY TABLE temp (a INT) ENGINE=INNODB;
INSERT INTO temp VALUES (1);
SELECT * FROM temp;
DROP TABLE temp;
CREATE TEMPORARY TABLE temp (a INT) ENGINE=INNODB;
SELECT * FROM temp;
INSERT INTO temp VALUES (1);
DROP TABLE temp;
UNLOCK TABLES;
CREATE TEMPORARY TABLE t1 (a INT) ENGINE=INNODB;
LOCK TABLES t1 WRITE;
DROP TABLE t1;
CREATE TEMPORARY TABLE temp1 (a INT) ENGINE=INNODB;
CREATE TEMPORARY TABLE temp2 LIKE temp1;
INSERT INTO temp1 VALUES (10);
INSERT INTO temp2 VALUES (10);
SELECT * FROM temp1 ORDER BY a;
SELECT * FROM temp2 ORDER BY a;
SELECT * FROM temp1,temp2;
INSERT INTO temp1 VALUES (10);
INSERT INTO temp2 VALUES (10);
SELECT * FROM temp1 ORDER BY a;
SELECT * FROM temp2 ORDER BY a;
UNLOCK TABLES;
DELETE temp1, temp2 FROM temp1, temp2;
INSERT INTO temp1 VALUES (10);
INSERT INTO temp2 VALUES (10);
SELECT * FROM temp1 ORDER BY a;
SELECT * FROM temp2 ORDER BY a;
DROP TABLE temp1, temp2;
CREATE TEMPORARY TABLE temp1 (a INT) ENGINE=INNODB;
CREATE TEMPORARY TABLE temp2 LIKE temp1;
UNLOCK TABLES;
UNLOCK TABLES;
SELECT * FROM temp1 ORDER BY a;
SELECT * FROM temp2 ORDER BY a;
DROP TABLE temp1, temp2;
CREATE TEMPORARY TABLE temp1 (a INT) ENGINE=INNODB;
CREATE TEMPORARY TABLE temp2 LIKE temp1;
INSERT INTO temp1 VALUES (1),(2);
INSERT INTO temp2 VALUES (3),(4);
UPDATE temp1,temp2 SET temp1.a = 5, temp2.a = 10;
SELECT * FROM temp1, temp2;
DROP TABLE temp1, temp2;
DROP DATABASE db1;
