CREATE INDEX t1_b ON t1(b);
CREATE TABLE t2(x, y, PRIMARY KEY(x, y)) WITHOUT ROWID;
CREATE INDEX t2_y ON t2(y);
INSERT INTO t1 VALUES(1, 2);
INSERT INTO t1 VALUES(3, 4);
UPDATE t1 SET a = a+1;
DELETE FROM t1;
DELETE FROM t1;
WITH data(a,b) AS (
      SELECT 0, 0 UNION ALL SELECT a+1, b+1 FROM data WHERE a<99
  )
  INSERT INTO t1 SELECT * FROM data;
INSERT INTO t2 SELECT * FROM t1 WHERE a<50;
UPDATE t2 SET y=y+1;
DELETE FROM t2 WHERE y<=25;
DELETE FROM t1;
DELETE FROM t2;
CREATE TABLE log(detail);
INSERT INTO log VALUES('here we go!');
DELETE FROM log;
INSERT INTO t1 VALUES('a', 'b');
-- 1 + 1
  UPDATE t1 SET b='c';
-- 1 + 1 + 2
  DELETE FROM t1;
-- 1 + 1 + 1;
INSERT INTO t1 VALUES(1, 2), (3, 4);
INSERT INTO t2 VALUES(1, 2), (3, 4);
SELECT count(*) FROM t1;
CREATE TABLE t4(a, b);
ALTER TABLE t4 ADD COLUMN c;
CREATE INDEX i4 ON t4(c);
ALTER TABLE t4 RENAME TO t5;
ANALYZE;
BEGIN;
DROP TABLE t2;
VACUUM;
CREATE TABLE p1(c PRIMARY KEY, d);
CREATE TABLE c1(a, b, FOREIGN KEY(a) REFERENCES p1 ON DELETE SET NULL);
CREATE TABLE c2(a, b, FOREIGN KEY(a) REFERENCES p1 ON DELETE CASCADE);
CREATE TABLE c3(a, b, FOREIGN KEY(a) REFERENCES p1 ON DELETE SET DEFAULT);
INSERT INTO p1 VALUES(1, 'one');
INSERT INTO p1 VALUES(2, 'two');
INSERT INTO p1 VALUES(3, 'three');
INSERT INTO p1 VALUES(4, 'four');
INSERT INTO c1 VALUES(1, 'i');
INSERT INTO c2 VALUES(2, 'ii');
INSERT INTO c3 VALUES(3, 'iii');
PRAGMA foreign_keys = ON;
DELETE FROM p1 WHERE c=1;
DELETE FROM p1 WHERE c=2;
DELETE FROM p1 WHERE c=3;
DELETE FROM p1 WHERE c=4;
DROP TABLE c1;
DROP TABLE c2;
DROP TABLE c3;
CREATE TABLE c1(a, b, FOREIGN KEY(a) REFERENCES p1 ON UPDATE SET NULL);
CREATE TABLE c2(a, b, FOREIGN KEY(a) REFERENCES p1 ON UPDATE CASCADE);
CREATE TABLE c3(a, b, FOREIGN KEY(a) REFERENCES p1 ON UPDATE SET DEFAULT);
INSERT INTO p1 VALUES(1, 'one');
INSERT INTO p1 VALUES(2, 'two');
INSERT INTO p1 VALUES(3, 'three');
INSERT INTO p1 VALUES(4, 'four');
INSERT INTO c1 VALUES(1, 'i');
INSERT INTO c2 VALUES(2, 'ii');
INSERT INTO c3 VALUES(3, 'iii');
PRAGMA foreign_keys = ON;
UPDATE p1 SET c=c+4 WHERE c=1;
UPDATE p1 SET c=c+4 WHERE c=2;
UPDATE p1 SET c=c+4 WHERE c=3;
UPDATE p1 SET c=c+4 WHERE c=4;
CREATE TABLE t3(a UNIQUE, b UNIQUE);
INSERT INTO t3 VALUES('one', 'one');
INSERT INTO t3 VALUES('two', 'two');
INSERT OR REPLACE INTO t3 VALUES('one', 'two');
INSERT INTO t3 VALUES('three', 'one');
UPDATE OR REPLACE t3 SET b='two' WHERE b='one';
SELECT * FROM t3;
CREATE TABLE t6(x);
CREATE VIEW v1 AS SELECT * FROM t6;
