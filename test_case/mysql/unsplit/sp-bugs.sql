CREATE SCHEMA testdb;
DROP SCHEMA testdb;
CREATE SCHEMA testdb;
DROP SCHEMA testdb;
CREATE SCHEMA testdb;
DROP SCHEMA testdb;
DROP TABLE IF EXISTS t1;
DROP TRIGGER IF EXISTS tr1;
DROP PROCEDURE IF EXISTS p1;
CREATE TABLE t1 (f1 INTEGER);
CREATE PROCEDURE p1 () DROP TRIGGER tr1;
DROP TABLE t1;
DROP PROCEDURE p1;
DROP TABLE IF EXISTS t1;
DROP TRIGGER IF EXISTS tr1;
DROP PROCEDURE IF EXISTS p1;
CREATE TABLE t1 (f1 INTEGER);
CREATE PROCEDURE p1 () DROP TRIGGER tr1;
DROP TABLE t1;
DROP PROCEDURE p1;
DROP DATABASE IF EXISTS db1;
CREATE DATABASE db1;
DROP TABLE IF EXISTS t1;
CREATE TABLE t1 (c1 int NOT NULL PRIMARY KEY);
INSERT INTO t1 VALUES (1);
DROP DATABASE IF EXISTS db2;
CREATE DATABASE db2;
SELECT DATABASE();
SELECT DATABASE();
DROP DATABASE db1;
DROP DATABASE db2;
DROP DATABASE IF EXISTS testdb;
CREATE DATABASE testdb;
DROP DATABASE testdb;
SELECT specific_name FROM INFORMATION_SCHEMA.ROUTINES WHERE specific_name LIKE 'testf_bug11763507';
SELECT specific_name FROM INFORMATION_SCHEMA.ROUTINES WHERE specific_name LIKE 'TESTF_bug11763507';
SELECT specific_name FROM INFORMATION_SCHEMA.ROUTINES WHERE specific_name='testf_bug11763507';
SELECT specific_name FROM INFORMATION_SCHEMA.ROUTINES WHERE specific_name='TESTF_bug11763507';
SELECT SUBTIME('2006-07-16' , '05:05:02.040778');
SELECT abs('1bcd');
DROP TABLE t1;
SELECT 1/0;
SELECT 1/0;
CREATE TABLE t1 (
  id bigint(20) UNSIGNED NOT NULL
);
ALTER TABLE t1 ADD INDEX idx (id);
DROP TABLE t1;
CREATE TABLE t1(a INTEGER, b INTEGER);
INSERT INTO t1 VALUES (1,10);
DROP TABLE t1;
CREATE PROCEDURE cafe() BEGIN END;
CREATE PROCEDURE cafÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ©() BEGIN END;
DROP PROCEDURE CaFÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ©;
PREPARE stmt FROM 'SELECT CONCAT(UNIX_TIMESTAMP(?))';
DEALLOCATE PREPARE stmt;
