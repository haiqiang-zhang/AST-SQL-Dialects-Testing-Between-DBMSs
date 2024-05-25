SELECT @@session.session_track_system_variables INTO @old_track_list;
SELECT @@session.session_track_state_change INTO @old_track_enable;
SELECT @@session.session_track_transaction_info INTO @old_track_tx;
CREATE TABLE t1 (f1 INT) ENGINE="InnoDB";
CREATE TABLE t2 (f1 INT) ENGINE="MyISAM";
INSERT INTO t1 VALUES(1);
SELECT 1 FROM DUAL;
DELETE FROM t1;
SELECT 1 FROM DUAL;
SELECT 1 FROM DUAL INTO @x;
DROP TABLE t1;
DROP TABLE t2;
CREATE TABLE t1 (f1 INT) ENGINE="InnoDB";
CREATE TABLE t2 (f1 INT) ENGINE="MyISAM";
INSERT INTO t1 VALUES (1);
INSERT INTO t2 VALUES (1);
INSERT INTO t1 VALUES (1);
INSERT INTO t2 VALUES (1);
INSERT INTO t1 VALUES (1);
SELECT f1 FROM t1;
SELECT f1 FROM t2;
DROP TABLE t1, t2;
CREATE TABLE t1 (f1 INT) ENGINE="InnoDB";
INSERT INTO t1 VALUES(1);
INSERT INTO t1 VALUES(3);
DROP TABLE t1;
SELECT 1 FROM DUAL;
SELECT 1 FROM DUAL INTO @dummy;
CREATE TABLE t2 (f1 INT) ENGINE="MyISAM";
SELECT f1 FROM t2;
DROP TABLE t2;
CREATE TABLE t2 (f1 INT) ENGINE="MyISAM";
DROP TABLE t2;
CREATE TABLE t1 (f1 INT) ENGINE="InnoDB";
CREATE TABLE t2 (f1 INT) ENGINE="MyISAM";
DROP TABLE t1;
DROP TABLE t2;
CREATE TABLE t1 (f1 INT) ENGINE="InnoDB";
CREATE TABLE t2 (f1 INT) ENGINE="MyISAM";
INSERT INTO t1 VALUES (1);
INSERT INTO t2 VALUES (2);
UPDATE t1 SET f1=4;
SELECT f1 FROM t2;
ALTER TABLE t1 ADD COLUMN f2 INT;
ALTER TABLE t1 ADD COLUMN f3 INT;
SELECT f1 FROM t2;
SELECT f1*2 FROM t1;
SELECT 1 FROM DUAL;
SELECT 1 FROM DUAL;
DROP TABLE t1;
DROP TABLE t2;
CREATE TABLE t2 (f1 INT) ENGINE="MyISAM";
SELECT CONVERT_TZ('2004-01-01 12:00:00','GMT','MET');
DROP TABLE t2;
CREATE TABLE t1 (f1 INT) ENGINE="InnoDB";
CREATE TABLE t2 (f1 INT) ENGINE="MyISAM";
SELECT 1  FROM DUAL;
SELECT f1 FROM t1;
UNLOCK TABLES;
LOCK TABLES t1 WRITE;
INSERT INTO t1 VALUES (1);
INSERT INTO t1 VALUES (2);
SELECT f1 FROM t1;
UNLOCK TABLES;
LOCK TABLE t1 WRITE, t2 WRITE;
INSERT INTO t2 VALUES (3);
INSERT INTO t1 VALUES (3);
SELECT f1 FROM t1 WHERE f1 > 2;
UNLOCK TABLES;
LOCK TABLE t1 WRITE;
INSERT INTO t1 VALUES (3);
SELECT f1 FROM t1 WHERE f1 > 2;
UNLOCK TABLES;
DROP TABLE t1;
DROP TABLE t2;