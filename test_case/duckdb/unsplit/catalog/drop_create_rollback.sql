PRAGMA enable_verification;
CREATE TABLE t1 (c1 CHAR(5));
BEGIN TRANSACTION;
DROP TABLE IF EXISTS t1;
CREATE TABLE T1 (C2 CHAR(5));
SELECT C2 FROM T1;
ROLLBACK;
