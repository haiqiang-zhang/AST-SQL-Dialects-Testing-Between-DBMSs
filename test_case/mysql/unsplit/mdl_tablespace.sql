SELECT COUNT(*) = 1 FROM information_schema.processlist
    WHERE state LIKE 'Waiting for tablespace metadata lock' AND
          info LIKE 'ALTER TABLESPACE%';
CREATE TABLESPACE ts1 ADD DATAFILE 'ts1_1.ibd';
DROP TABLESPACE ts1;
CREATE TABLESPACE ts1 ADD DATAFILE 'ts1_1.ibd';
CREATE TABLESPACE ts2 ADD DATAFILE 'ts2_1.ibd';
CREATE TABLE t1 (pk INTEGER PRIMARY KEY) TABLESPACE ts1;
CREATE TABLE t2 (pk INTEGER PRIMARY KEY) TABLESPACE ts1;
CREATE TABLE t3 (pk INTEGER PRIMARY KEY) TABLESPACE ts2;
SELECT COUNT(*) = 2 FROM information_schema.processlist
    WHERE state LIKE 'Waiting for tablespace metadata lock' AND
          info LIKE '%TABLESPACE%';
SELECT COUNT(*) = 1 FROM information_schema.processlist
    WHERE state LIKE 'Waiting for tablespace metadata lock' AND
          info LIKE 'ALTER TABLESPACE%';
SELECT COUNT(*) = 0 FROM information_schema.processlist
    WHERE state LIKE 'Waiting for tablespace metadata lock' AND
          info LIKE 'ALTER TABLESPACE%';
DROP TABLE t1;
DROP TABLE t3;
DROP TABLESPACE ts2;
CREATE TABLESPACE ts2 ADD DATAFILE 'ts2.ibd';
CREATE SCHEMA s1;
CREATE TABLE s1.t1 (pk INTEGER PRIMARY KEY) TABLESPACE ts1;
CREATE TABLE s1.t2 (pk INTEGER PRIMARY KEY) TABLESPACE ts2;
SELECT COUNT(*) = 2 FROM information_schema.processlist
    WHERE state LIKE 'Waiting for tablespace metadata lock' AND
          info LIKE 'DROP TABLESPACE%';
SELECT COUNT(*) = 0 FROM information_schema.processlist
    WHERE state LIKE 'Waiting for tablespace metadata lock' AND
          info LIKE 'DROP TABLESPACE%';
CREATE TABLESPACE ts3 ADD DATAFILE 'ts3_1.ibd';
CREATE TABLE t1 (pk INTEGER PRIMARY KEY) TABLESPACE ts1;
CREATE TABLE t3 (pk INTEGER PRIMARY KEY) TABLESPACE ts3;
UNLOCK TABLES;
UNLOCK TABLES;
UNLOCK TABLES;
DROP TABLE t1;
DROP TABLE t2;
DROP TABLE t3;
DROP TABLESPACE ts3;
CREATE TABLESPACE ts3 ADD DATAFILE 'ts3_1.ibd';
CREATE TABLE t1 (pk INTEGER PRIMARY KEY) TABLESPACE ts1;
CREATE TABLE t2 (pk INTEGER PRIMARY KEY) TABLESPACE ts2;
CREATE TABLE t3 (pk INTEGER PRIMARY KEY) TABLESPACE ts3;
UNLOCK TABLES;
UNLOCK TABLES;
LOCK TABLE t3 READ;
UNLOCK TABLES;
DROP TABLE t1;
DROP TABLE t2;
DROP TABLE t3;
DROP TABLESPACE ts3;
CREATE TABLE t1 (pk INTEGER PRIMARY KEY) TABLESPACE ts1;
UNLOCK TABLES;
DROP TABLE t1;
CREATE TABLE t1 (pk INTEGER PRIMARY KEY) TABLESPACE ts1;
INSERT INTO t1 (pk) VALUES (1);
SELECT * FROM t1 FOR UPDATE;
DROP TABLE t1;
CREATE TABLE t1 (pk INTEGER PRIMARY KEY) TABLESPACE ts1;
DROP TABLE t1;
CREATE TABLE t1 (pk INTEGER PRIMARY KEY) TABLESPACE ts1;
SELECT COUNT(*) = 1 FROM information_schema.processlist
    WHERE state LIKE 'Waiting for tablespace metadata lock' AND
          info LIKE 'DROP TABLESPACE%';
SELECT COUNT(*) = 0 FROM information_schema.processlist
    WHERE state LIKE 'Waiting for tablespace metadata lock' AND
          info LIKE 'DROP TABLESPACE%';
CREATE TABLESPACE xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx ADD DATAFILE 'x.ibd';
DROP TABLESPACE xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
LOCK TABLE t1 READ;
UNLOCK TABLES;
UNLOCK TABLES;
DROP TABLE t1;
CREATE TABLE t1_src (pk INTEGER PRIMARY KEY) TABLESPACE ts1;
CREATE TABLE t2_src (pk INTEGER PRIMARY KEY);
CREATE TABLE t1_new LIKE t1_src;
DROP TABLE t1_new;
CREATE TABLE t2_new LIKE t2_src;
DROP TABLE t2_new;
DROP TABLE t1_src;
DROP TABLE t2_src;
CREATE TABLE t1 (pk INTEGER PRIMARY KEY) TABLESPACE ts1;
DROP TABLE t1;
SELECT COUNT(*) = 1 FROM information_schema.processlist
    WHERE state LIKE 'Waiting for tablespace metadata lock' AND
          info LIKE 'ALTER TABLESPACE%';
SELECT COUNT(*) = 0 FROM information_schema.processlist
    WHERE state LIKE 'Waiting for tablespace metadata lock' AND
          info LIKE 'ALTER TABLESPACE%';
CREATE TABLE t1 (
  a INT NOT NULL,
  PRIMARY KEY (a)
)
ENGINE=InnoDB
TABLESPACE ts1;
UNLOCK TABLES;
ALTER TABLESPACE ts2 RENAME TO ts3;
ALTER TABLESPACE ts3 RENAME TO ts4;
ALTER TABLESPACE ts1 RENAME TO ts2;
UNLOCK TABLES;
LOCK TABLES t1 READ;
UNLOCK TABLES;
DROP TABLE t1;
CREATE TABLESPACE ts1 ADD DATAFILE 'df1.ibd';
DROP TABLESPACE ts1;
CREATE TABLESPACE ts1 ADD DATAFILE 'df1.ibd';
CREATE TABLE t1(i INT) TABLESPACE ts1;
ALTER TABLESPACE ts1 RENAME TO t1;
CREATE TABLESPACE s1 ADD DATAFILE 's1.ibd';
LOCK TABLE t1 WRITE;
ALTER TABLE t1 TABLESPACE s1;
UNLOCK TABLE;
DROP TABLE t1;
DROP TABLESPACE s1;
CREATE TABLE test1(a INT NOT NULL, b CHAR(2) NOT NULL, PRIMARY KEY(a, b))
ENGINE=INNODB;
CREATE TABLE test2(a INT NOT NULL, b CHAR(2) NOT NULL, PRIMARY KEY(a, b))
ENGINE=INNODB;
LOCK TABLES test1 WRITE;
ALTER TABLE test1 RENAME test1_tmp;
UNLOCK TABLES;
DROP TABLE test1_tmp;
CREATE TABLE part1(a INT) PARTITION BY HASH (a) PARTITIONS 10;
CREATE TABLE part2(a INT) PARTITION BY HASH (a) PARTITIONS 10;
LOCK TABLES part1 WRITE;
ALTER TABLE part1 RENAME TO part1_tmp;
UNLOCK TABLES;
DROP TABLE part1_tmp;