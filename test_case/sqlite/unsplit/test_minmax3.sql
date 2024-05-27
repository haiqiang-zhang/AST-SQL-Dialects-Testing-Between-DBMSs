CREATE TABLE t1(x, y, z);
BEGIN;
INSERT INTO t1 VALUES('1', 'I',   'one');
INSERT INTO t1 VALUES('2', 'IV',  'four');
INSERT INTO t1 VALUES('2', NULL,  'three');
INSERT INTO t1 VALUES('2', 'II',  'two');
INSERT INTO t1 VALUES('2', 'V',   'five');
INSERT INTO t1 VALUES('3', 'VI',  'six');
PRAGMA automatic_index=OFF;
SELECT max(y) FROM t1 WHERE x = '2';
CREATE INDEX i1 ON t1(x);
CREATE INDEX i2 ON t1(x,y);
DROP INDEX i2;
CREATE INDEX i2 ON t1(x, y DESC);
DROP INDEX i1;
DROP INDEX i2;
SELECT min(y) FROM t1 WHERE x = '2';
CREATE INDEX i1 ON t1(x);
CREATE INDEX i2 ON t1(x,y);
DROP INDEX i2;
CREATE INDEX i2 ON t1(x, y DESC);
DROP INDEX i1;
DROP INDEX i2;
CREATE INDEX i1 ON t1(y);
DROP INDEX i1;
CREATE INDEX i1 ON t1(y DESC);
DROP INDEX i1;
CREATE INDEX i1 ON t1(y);
DROP INDEX i1;
CREATE INDEX i1 ON t1(y DESC);
SELECT y from t1;
DROP INDEX i1;
CREATE TABLE t2(a, b);
CREATE INDEX i3 ON t2(a, b);
INSERT INTO t2 VALUES(1, NULL);
INSERT INTO t2 VALUES(1, 1);
INSERT INTO t2 VALUES(1, 2);
INSERT INTO t2 VALUES(1, 3);
INSERT INTO t2 VALUES(2, NULL);
INSERT INTO t2 VALUES(2, 1);
INSERT INTO t2 VALUES(2, 2);
INSERT INTO t2 VALUES(2, 3);
INSERT INTO t2 VALUES(3, 1);
INSERT INTO t2 VALUES(3, 2);
INSERT INTO t2 VALUES(3, 3);
DROP TABLE t2;
CREATE TABLE t2(a, b);
CREATE INDEX i3 ON t2(a, b DESC);
INSERT INTO t2 VALUES(1, NULL);
INSERT INTO t2 VALUES(1, 1);
INSERT INTO t2 VALUES(1, 2);
INSERT INTO t2 VALUES(1, 3);
INSERT INTO t2 VALUES(2, NULL);
INSERT INTO t2 VALUES(2, 1);
INSERT INTO t2 VALUES(2, 2);
INSERT INTO t2 VALUES(2, 3);
INSERT INTO t2 VALUES(3, 1);
INSERT INTO t2 VALUES(3, 2);
INSERT INTO t2 VALUES(3, 3);
CREATE TABLE t4(x);
INSERT INTO t4 VALUES('abc');
INSERT INTO t4 VALUES('BCD');