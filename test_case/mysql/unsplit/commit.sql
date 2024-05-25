CREATE TABLE t1 (s1 INT) ENGINE=InnoDB;
INSERT INTO t1 VALUES (1),(2);
SELECT @@transaction_isolation;
SELECT * FROM t1;
SELECT @@transaction_isolation;
INSERT INTO t1 VALUES (-1);
SELECT @@transaction_isolation;
SELECT * FROM t1;
INSERT INTO t1 VALUES (1000);
SELECT * FROM t1;
SELECT * FROM t1;
INSERT INTO t1 VALUES (1001);
SELECT COUNT(*) FROM t1 WHERE s1 = 1001;
INSERT INTO t1 VALUES (1002);
SELECT COUNT(*) FROM t1 WHERE s1 = 1002;
SELECT * FROM t1;
DELETE FROM t1 WHERE s1 >= 1000;
INSERT INTO t1 VALUES (1001);
SELECT COUNT(*) FROM t1 WHERE s1 = 1001;
INSERT INTO t1 VALUES (1002);
SELECT COUNT(*) FROM t1 WHERE s1 = 1002;
SELECT * FROM t1;
DELETE FROM t1 WHERE s1 >= 1000;
INSERT INTO t1 VALUES (1001);
SELECT * FROM t1 WHERE s1 >= 1000;
INSERT INTO t1 VALUES (1002);
SELECT * FROM t1 WHERE s1 >= 1000;
INSERT INTO t1 VALUES (1003);
SELECT * FROM t1 WHERE s1 >= 1000;
SELECT * FROM t1;
DELETE FROM t1 WHERE s1 >= 1000;
INSERT INTO t1 VALUES (1001);
SELECT * FROM t1 WHERE s1 >= 1000;
INSERT INTO t1 VALUES (1002);
SELECT * FROM t1 WHERE s1 >= 1000;
INSERT INTO t1 VALUES (1003);
SELECT * FROM t1 WHERE s1 >= 1000;
SELECT * FROM t1;
DELETE FROM t1 WHERE s1 >= 1000;
SELECT * FROM t1;
INSERT INTO t1 VALUES (1000);
SELECT * FROM t1;
DELETE FROM t1 WHERE s1 >= 1000;
INSERT INTO t1 VALUES (1000);
SELECT * FROM t1;
INSERT INTO t1 VALUES (1001);
SELECT * FROM t1;
DROP TABLE t1;
SELECT @@transaction_read_only;
SELECT @@transaction_read_only;
SELECT @@transaction_read_only;
SELECT @@transaction_read_only;
CREATE TABLE t1(a INT);
CREATE TEMPORARY TABLE temp_t2(a INT);
CREATE TABLE t3(a INT);
ALTER TABLE t1 COMMENT "Test";
DROP TABLE t1;
CREATE TEMPORARY TABLE temp_t3(a INT);
ALTER TABLE temp_t2 COMMENT "Test";
DROP TEMPORARY TABLE temp_t2;
CREATE PROCEDURE p1() BEGIN END;
DROP PROCEDURE p1;
CREATE VIEW v1 AS SELECT 1;
DROP VIEW v1;
CREATE DATABASE db1;
DROP DATABASE db1;
CREATE PROCEDURE p1() DELETE FROM t1;
CREATE PROCEDURE p2() DELETE FROM temp_t2;
DROP PROCEDURE p1;
DROP PROCEDURE p2;
UNLOCK TABLES;
CREATE TABLE t1(a INT);
DELETE FROM t1;
DELETE FROM t1;
DELETE FROM t1;
DELETE FROM t1;
SELECT * FROM t1;
DELETE FROM t1;
SELECT * FROM t1;
DELETE FROM t1;
DROP TABLE t1;
CREATE TABLE t1 (only INT);
INSERT INTO t1 (only) values (1);
SELECT only FROM t1 WHERE only = 1;
DROP TABLE t1;
CREATE TABLE t1(a INT);
INSERT INTO t1 VALUES (1);
UPDATE t1 SET a=2;
DELETE FROM t1;
DROP TABLE t1;
CREATE PROCEDURE p1() SET SESSION TRANSACTION READ ONLY;
SELECT @@transaction_read_only;
DROP PROCEDURE p1;
CREATE PROCEDURE p1() SET SESSION TRANSACTION READ ONLY,
                                              ISOLATION LEVEL SERIALIZABLE;
SELECT @@transaction_read_only;
DROP PROCEDURE p1;
SELECT @@transaction_read_only;
SELECT @@transaction_read_only;
SELECT @@autocommit;
CREATE TABLE t1(a INT) engine=InnoDB;
SELECT * FROM t1;
INSERT INTO t1 VALUES (1);
DROP TABLE t1;