CREATE TABLE t1 (f1 TIMESTAMP, f2 TIMESTAMP);
ALTER TABLE t1 ADD COLUMN (f3 TIMESTAMP NOT NULL);
ALTER TABLE t1 ADD COLUMN (f4 TIMESTAMP DEFAULT NULL);
ALTER TABLE t1 ADD COLUMN (f6 TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);
DROP TABLE t1;
CREATE TABLE t1(
c1 TIMESTAMP NOT NULL,
c2 TIMESTAMP NOT NULL DEFAULT '2001-01-01 01:01:01',
c3 INT NOT NULL DEFAULT 42);
INSERT INTO t1 VALUES ('2005-05-05 06:06:06', DEFAULT, DEFAULT);
SELECT * FROM t1;
SELECT * FROM t1;
DROP TABLE t1;
CREATE TABLE t1(
dummy INT,
i1_null_const INT NULL DEFAULT 42,
t1_null_now TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
t1_null_const TIMESTAMP NULL DEFAULT '2001-01-01 03:03:03',
i2_not_null_const INT NOT NULL DEFAULT 42,
t2_not_null_now TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
t2_not_null_const TIMESTAMP NOT NULL DEFAULT '2001-01-01 03:03:03',
i3_null INT NULL,
t3_null TIMESTAMP NULL,
i4_not_null INT NOT NULL,
t4_not_null TIMESTAMP NOT NULL);
DROP TABLE t1;
CREATE TABLE t1(a TIMESTAMP, b TIMESTAMP);
CREATE TABLE t2(a INT);
ALTER TABLE t2 ADD COLUMN b TIMESTAMP;
ALTER TABLE t2 ADD COLUMN c TIMESTAMP;
ALTER TABLE t2 ADD COLUMN d TIMESTAMP;
INSERT INTO t1 VALUES();
INSERT INTO t1 VALUES();
SELECT b FROM t1;
CREATE TABLE t3(a TIMESTAMP, b TIMESTAMP);
INSERT INTO t3 SELECT * from t1;
CREATE TABLE t4 AS SELECT * FROM t1;
DELETE FROM t1;
DROP TABLE t4;
CREATE TABLE t4 AS SELECT * FROM t1;
INSERT INTO t1 VALUES(default, default);
INSERT INTO t1 VALUES(default(a), default(b));
UPDATE t1 SET b=default;
UPDATE t1 SET b=default(b);
CREATE TABLE t5(a TIMESTAMP NOT NULL);
CREATE TABLE t6(a TIMESTAMP, b TIMESTAMP NOT NULL);
DROP TABLE t1,t2,t3,t4,t5,t6;
CREATE TABLE t1(fld1 TIMESTAMP,PRIMARY KEY (fld1));
INSERT INTO t1 VALUES("20121231");
SELECT * from t1;
DROP TABLE t1;