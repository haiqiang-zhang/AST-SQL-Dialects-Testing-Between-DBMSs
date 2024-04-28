--

-- MERGE tables require MyISAM tables
--source include/force_myisam_default.inc
--source include/have_myisam.inc

-- Clean up resources used in this test case.
--disable_warnings
DROP TABLE IF EXISTS t1, t2, m1, m2;
--# No locked tables.
--###################
--
-- INSERT-SELECT with no TEMPORARY table.
--
CREATE TABLE t1 (c1 INT);
CREATE TABLE t2 (c1 INT);
CREATE TABLE m1 (c1 INT) ENGINE=MRG_MyISAM UNION=(t1,t2)
  INSERT_METHOD=LAST;
CREATE TABLE m2 (c1 INT) ENGINE=MRG_MyISAM UNION=(t1,t2)
  INSERT_METHOD=LAST;
INSERT INTO t1 VALUES (1);
INSERT INTO t2 VALUES (2), (3), (4);
INSERT INTO m2 SELECT * FROM m1;
SELECT * FROM m2;
SELECT * FROM t2;
DROP TABLE m2, m1, t2, t1;
CREATE TABLE t1 (c1 INT);
CREATE TABLE t2 (c1 INT);
CREATE TEMPORARY TABLE m1 (c1 INT) ENGINE=MRG_MyISAM UNION=(t1,t2)
  INSERT_METHOD=LAST;
CREATE TABLE m2 (c1 INT) ENGINE=MRG_MyISAM UNION=(t1,t2)
  INSERT_METHOD=LAST;
INSERT INTO t1 VALUES (1);
INSERT INTO t2 VALUES (2), (3), (4);
INSERT INTO m2 SELECT * FROM m1;
SELECT * FROM m2;
DROP TABLE m2, m1, t2, t1;
CREATE TABLE t1 (c1 INT);
CREATE TABLE t2 (c1 INT);
CREATE TABLE m1 (c1 INT) ENGINE=MRG_MyISAM UNION=(t1,t2)
  INSERT_METHOD=LAST;
CREATE TEMPORARY TABLE m2 (c1 INT) ENGINE=MRG_MyISAM UNION=(t1,t2)
  INSERT_METHOD=LAST;
INSERT INTO t1 VALUES (1);
INSERT INTO t2 VALUES (2), (3), (4);
INSERT INTO m2 SELECT * FROM m1;
SELECT * FROM m2;
DROP TABLE m2, m1, t2, t1;
CREATE TABLE t1 (c1 INT);
CREATE TABLE t2 (c1 INT);
CREATE TEMPORARY TABLE m1 (c1 INT) ENGINE=MRG_MyISAM UNION=(t1,t2)
  INSERT_METHOD=LAST;
CREATE TEMPORARY TABLE m2 (c1 INT) ENGINE=MRG_MyISAM UNION=(t1,t2)
  INSERT_METHOD=LAST;
INSERT INTO t1 VALUES (1);
INSERT INTO t2 VALUES (2), (3), (4);
INSERT INTO m2 SELECT * FROM m1;
SELECT * FROM m2;
DROP TABLE m2, m1, t2, t1;
--# With LOCK TABLES.
--###################
--
-- INSERT-SELECT with no TEMPORARY table.
--
CREATE TABLE t1 (c1 INT);
CREATE TABLE t2 (c1 INT);
CREATE TABLE m1 (c1 INT) ENGINE=MRG_MyISAM UNION=(t1,t2)
  INSERT_METHOD=LAST;
CREATE TABLE m2 (c1 INT) ENGINE=MRG_MyISAM UNION=(t1,t2)
  INSERT_METHOD=LAST;
INSERT INTO t1 VALUES (1);
INSERT INTO t2 VALUES (2), (3), (4);
INSERT INTO m2 SELECT * FROM m1;
SELECT * FROM m2;
SELECT * FROM t2;
DROP TABLE m2, m1, t2, t1;
CREATE TABLE t1 (c1 INT);
CREATE TABLE t2 (c1 INT);
CREATE TEMPORARY TABLE m1 (c1 INT) ENGINE=MRG_MyISAM UNION=(t1,t2)
  INSERT_METHOD=LAST;
CREATE TABLE m2 (c1 INT) ENGINE=MRG_MyISAM UNION=(t1,t2)
  INSERT_METHOD=LAST;
INSERT INTO t1 VALUES (1);
INSERT INTO t2 VALUES (2), (3), (4);
INSERT INTO m2 SELECT * FROM m1;
SELECT * FROM m2;
DROP TABLE m2, m1, t2, t1;
CREATE TABLE t1 (c1 INT);
CREATE TABLE t2 (c1 INT);
CREATE TABLE m1 (c1 INT) ENGINE=MRG_MyISAM UNION=(t1,t2)
  INSERT_METHOD=LAST;
CREATE TEMPORARY TABLE m2 (c1 INT) ENGINE=MRG_MyISAM UNION=(t1,t2)
  INSERT_METHOD=LAST;
INSERT INTO t1 VALUES (1);
INSERT INTO t2 VALUES (2), (3), (4);
INSERT INTO m2 SELECT * FROM m1;
SELECT * FROM m2;
DROP TABLE m2, m1, t2, t1;
CREATE TABLE t1 (c1 INT);
CREATE TABLE t2 (c1 INT);
CREATE TEMPORARY TABLE m1 (c1 INT) ENGINE=MRG_MyISAM UNION=(t1,t2)
  INSERT_METHOD=LAST;
CREATE TEMPORARY TABLE m2 (c1 INT) ENGINE=MRG_MyISAM UNION=(t1,t2)
  INSERT_METHOD=LAST;
INSERT INTO t1 VALUES (1);
INSERT INTO t2 VALUES (2), (3), (4);
INSERT INTO m2 SELECT * FROM m1;
SELECT * FROM m2;
DROP TABLE m2, m1, t2, t1;