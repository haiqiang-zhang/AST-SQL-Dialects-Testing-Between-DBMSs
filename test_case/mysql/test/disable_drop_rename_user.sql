
-- This test takes long time, so only run it with the --big-test mtr-flag.
--source include/big_test.inc

--enable_connect_log

CREATE DATABASE wl14073;
USE wl14073;
CREATE table t1(i int);
CREATE USER normal_user;
  ON *.* FROM normal_user;
CREATE USER power_user;
CREATE USER u1;
USE wl14073;
CREATE DEFINER = u1 VIEW v1 as SELECT * FROM t1;
DROP USER u1;
DROP VIEW v1;
DROP USER new_u1;
CREATE USER u1;
USE wl14073;
CREATE DEFINER = u1 VIEW v1 as SELECT * FROM t1;
DROP USER new_u1;
DROP VIEW v1;
CREATE USER u1;
USE wl14073;
CREATE DEFINER = u1 EVENT ev1 ON SCHEDULE EVERY 5 HOUR DO SELECT 1;
DROP USER u1;
DROP EVENT ev1;
DROP USER new_u1;
CREATE USER u1;
USE wl14073;
CREATE DEFINER = u1 EVENT ev1 ON SCHEDULE EVERY 5 HOUR DO SELECT 1;
DROP USER new_u1;
DROP EVENT ev1;
CREATE USER u1;
USE wl14073;
CREATE DEFINER = u1 PROCEDURE p1() DELETE FROM t1;
DROP USER u1;
DROP PROCEDURE p1;
DROP USER new_u1;
CREATE USER u1;
USE wl14073;
CREATE DEFINER = u1 PROCEDURE p1() DELETE FROM t1;
DROP USER new_u1;
DROP PROCEDURE p1;
set GLOBAL log_bin_trust_function_creators=1;
CREATE USER u1;
USE wl14073;
CREATE DEFINER = u1 FUNCTION f1() RETURNS INT RETURN 1;
DROP USER u1;
DROP FUNCTION f1;
DROP USER new_u1;
CREATE USER u1;
USE wl14073;
CREATE DEFINER = u1 FUNCTION f1() RETURNS INT RETURN 1;
DROP USER new_u1;
DROP FUNCTION f1;
CREATE USER u1;
USE wl14073;
CREATE DEFINER = u1 TRIGGER trig1 BEFORE INSERT ON t1 FOR EACH ROW DELETE FROM t1;
DROP USER u1;
DROP TRIGGER trig1;
DROP USER new_u1;
CREATE USER u1;
USE wl14073;
CREATE DEFINER = u1 TRIGGER trig1 BEFORE INSERT ON t1 FOR EACH ROW DELETE FROM t1;
DROP USER new_u1;
DROP TRIGGER trig1;
USE wl14073;
CREATE USER dummy;
CREATE DEFINER = u1 VIEW v1 as SELECT * FROM t1;
SELECT * FROM v1;
CREATE USER u1;
USE wl14073;
SELECT * FROM v1;
CREATE USER u1;
DROP USER u1;
DROP VIEW v1;
DROP USER u1;
USE wl14073;
CREATE USER dummy;
CREATE DEFINER = u1 EVENT ev1 ON SCHEDULE EVERY 5 HOUR DO SELECT 1;
CREATE USER u1;
USE wl14073;
CREATE USER u1;
DROP USER u1;
DROP EVENT ev1;
DROP USER u1;
USE wl14073;
CREATE USER dummy;
CREATE DEFINER = u1 PROCEDURE p1() DELETE FROM t1;
CREATE USER u1;
USE wl14073;
CREATE USER u1;
DROP USER u1;
DROP PROCEDURE p1;
DROP USER u1;
USE wl14073;
CREATE USER dummy;
CREATE DEFINER = u1 FUNCTION f1() RETURNS INT RETURN 1;
SELECT f1();
CREATE USER u1;
USE wl14073;
SELECT f1();
CREATE USER u1;
DROP USER u1;
DROP FUNCTION f1;
DROP USER u1;
USE wl14073;
CREATE USER dummy;
CREATE DEFINER = u1 TRIGGER trig1 BEFORE INSERT ON t1 FOR EACH ROW DELETE FROM t1;
INSERT INTO t1 VALUES (10);
CREATE USER u1;
USE wl14073;
INSERT INTO t1 VALUES (10);
CREATE USER u1;
DROP USER u1;
DROP TRIGGER trig1;
DROP USER u1;

-- Cleanup
--connection default
--disconnect normal_conn
--disconnect power_conn
DROP USER normal_user, power_user;
CREATE USER ABC;
CREATE USER ABc;
USE wl14073;
CREATE DEFINER = ABC VIEW v2 as SELECT * FROM t1;
DROP USER ABc;
DROP USER ABC;
CREATE USER u1@192.129.12.11;
CREATE USER 'u1'@'%.com';
CREATE USER 'u1'@'abc.com';
USE wl14073;
CREATE DEFINER = u1@192.129.12.11 VIEW v3 as SELECT * FROM t1;
CREATE DEFINER = 'u1'@'%.com' VIEW v4 as SELECT * FROM t1;
CREATE DEFINER = 'u1'@'AbC.com' VIEW v5 as SELECT * FROM t1;
DROP USER 'u1'@'192.129.12.%';
DROP USER 'u1'@'%';
DROP USER u1@192.129.12.11;
DROP USER 'u1'@'%.com';
DROP USER 'u1'@'ABC.COM';
CREATE USER u1;
CREATE USER u2;

USE wl14073;

CREATE DEFINER = u1 VIEW v6 as SELECT * FROM t1;
CREATE DEFINER = u1 EVENT ev1 ON SCHEDULE EVERY 5 HOUR DO SELECT 1;

CREATE DEFINER = u2 VIEW v7 as SELECT * FROM t1;
CREATE DEFINER = u2 EVENT ev2 ON SCHEDULE EVERY 5 HOUR DO SELECT 1;
DROP USER u1, u2;
DROP DATABASE wl14073;