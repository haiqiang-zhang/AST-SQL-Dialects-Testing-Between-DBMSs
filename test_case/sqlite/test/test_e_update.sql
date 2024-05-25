ATTACH 'test.db2' AS aux;
CREATE TABLE t1(a, b);
CREATE TABLE t2(a, b, c);
CREATE TABLE t3(a, b UNIQUE);
CREATE TABLE t6(x, y);
CREATE INDEX i1 ON t1(a);
CREATE TEMP TABLE t4(x, y);
CREATE TEMP TABLE t6(x, y);
CREATE TABLE aux.t1(a, b);
CREATE TABLE aux.t5(a, b);
UPDATE t1 SET a=10;
UPDATE t1 SET a=10, b=5;
UPDATE t1 SET a=10 WHERE b=5;
UPDATE t1 SET b=5,a=10 WHERE 1;
UPDATE main.t1 SET a=10;
UPDATE main.t1 SET a=10, b=5;
UPDATE main.t1 SET a=10 WHERE b=5;
UPDATE OR ROLLBACK t1 SET a=10;
UPDATE OR ROLLBACK t1 SET a=10, b=5;
UPDATE OR ROLLBACK t1 SET a=10 WHERE b=5;
UPDATE OR ROLLBACK t1 SET b=5,a=10 WHERE 1;
UPDATE OR ROLLBACK main.t1 SET a=10;
UPDATE OR ROLLBACK main.t1 SET a=10, b=5;
UPDATE OR ROLLBACK main.t1 SET a=10 WHERE b=5;
UPDATE OR ROLLBACK main.t1 SET b=5,a=10 WHERE 1;
UPDATE OR ABORT t1 SET a=10;
UPDATE OR ABORT t1 SET a=10, b=5;
UPDATE OR ABORT t1 SET a=10 WHERE b=5;
UPDATE OR ABORT t1 SET b=5,a=10 WHERE 1;
UPDATE OR ABORT main.t1 SET a=10;
UPDATE OR ABORT main.t1 SET a=10, b=5;
UPDATE OR ABORT main.t1 SET a=10 WHERE b=5;
UPDATE OR ABORT main.t1 SET b=5,a=10 WHERE 1;
UPDATE OR REPLACE t1 SET a=10;
UPDATE OR REPLACE t1 SET a=10, b=5;
UPDATE OR REPLACE t1 SET a=10 WHERE b=5;
UPDATE OR REPLACE t1 SET b=5,a=10 WHERE 1;
UPDATE OR REPLACE main.t1 SET a=10;
UPDATE OR REPLACE main.t1 SET a=10, b=5;
UPDATE OR REPLACE main.t1 SET a=10 WHERE b=5;
UPDATE OR REPLACE main.t1 SET b=5,a=10 WHERE 1;
UPDATE OR FAIL t1 SET a=10;
UPDATE OR FAIL t1 SET a=10, b=5;
UPDATE OR FAIL t1 SET a=10 WHERE b=5;
UPDATE OR FAIL t1 SET b=5,a=10 WHERE 1;
UPDATE OR FAIL main.t1 SET a=10;
UPDATE OR FAIL main.t1 SET a=10, b=5;
UPDATE OR FAIL main.t1 SET a=10 WHERE b=5;
UPDATE OR FAIL main.t1 SET b=5,a=10 WHERE 1;
UPDATE OR IGNORE t1 SET a=10;
UPDATE OR IGNORE t1 SET a=10, b=5;
UPDATE OR IGNORE t1 SET a=10 WHERE b=5;
UPDATE OR IGNORE t1 SET b=5,a=10 WHERE 1;
UPDATE OR IGNORE main.t1 SET a=10;
UPDATE OR IGNORE main.t1 SET a=10, b=5;
UPDATE OR IGNORE main.t1 SET a=10 WHERE b=5;
UPDATE OR IGNORE main.t1 SET b=5,a=10 WHERE 1;
INSERT INTO main.t1 VALUES(1, 'i');
INSERT INTO main.t1 VALUES(2, 'ii');
INSERT INTO main.t1 VALUES(3, 'iii');
INSERT INTO aux.t1 VALUES(1, 'I');
INSERT INTO aux.t1 VALUES(2, 'II');
INSERT INTO aux.t1 VALUES(3, 'III');
UPDATE t1 SET a = a+1;
SELECT * FROM t1;
UPDATE main.t1 SET a = a+1;
SELECT * FROM main.t1;
UPDATE aux.t1 SET a = a+1;
SELECT * FROM aux.t1;
UPDATE t1 SET a = a+1 WHERE a = 1;
SELECT * FROM t1;
UPDATE t1 SET a = a+1 WHERE a = 4;
SELECT * FROM t1;
DELETE FROM main.t1;
INSERT INTO main.t1 VALUES(1, 'i');
INSERT INTO main.t1 VALUES(2, 'ii');
INSERT INTO main.t1 VALUES(3, 'iii');
UPDATE t1 SET b = 'roman';
SELECT * FROM t1;
UPDATE t1 SET a = 'greek';
SELECT * FROM t1;
DELETE FROM main.t1;
INSERT INTO main.t1 VALUES(NULL, '');
INSERT INTO main.t1 VALUES(1, 'i');
INSERT INTO main.t1 VALUES(2, 'ii');
INSERT INTO main.t1 VALUES(3, 'iii');
UPDATE t1 SET b = 'roman' WHERE a<2;
SELECT * FROM t1;
UPDATE t1 SET b = 'egyptian' WHERE (a-3)/10.0;
SELECT * FROM t1;
UPDATE t1 SET b = 'macedonian' WHERE a;
SELECT * FROM t1;
UPDATE t1 SET b = 'lithuanian' WHERE a IS NULL;
SELECT * FROM t1;
DELETE FROM main.t1;
INSERT INTO main.t1 VALUES(NULL, '');
INSERT INTO main.t1 VALUES(1, 'i');
INSERT INTO main.t1 VALUES(2, 'ii');
INSERT INTO main.t1 VALUES(3, 'iii');
UPDATE t1 SET b = 'burmese' WHERE a=5;
SELECT * FROM t1;
UPDATE t1 SET b = 'burmese' WHERE length(b)<1 AND a IS NOT NULL;
SELECT * FROM t1;
UPDATE t1 SET b = 'burmese' WHERE 0;
SELECT * FROM t1;
UPDATE t1 SET b = 'burmese' WHERE (SELECT a FROM t1 WHERE rowid=1);
SELECT * FROM t1;
INSERT INTO t2(rowid, a, b, c) VALUES(1,  3, 1, 4);
INSERT INTO t2(rowid, a, b, c) VALUES(2,  1, 5, 9);
INSERT INTO t2(rowid, a, b, c) VALUES(3,  2, 6, 5);
UPDATE t2 SET c = 1+1 WHERE a=2;
SELECT * FROM t2;
UPDATE t2 SET b = 4/2, c=CAST((0.4*5) AS INTEGER) WHERE a<3;
SELECT * FROM t2;
UPDATE t2 SET a = 1;
SELECT * FROM t2;
UPDATE t2 SET b = (SELECT count(*)+2 FROM t2), c = 24/3+1 WHERE rowid=2;
SELECT * FROM t2;
UPDATE t2 SET a = 3 WHERE c = 4;
SELECT * FROM t2;
UPDATE t2 SET a = b WHERE rowid>2;
SELECT * FROM t2;
UPDATE t2 SET b=6, c=5 WHERE a=b AND b=c;
SELECT * FROM t2;
UPDATE t2 SET c=5, c=6, c=7 WHERE rowid=1;
SELECT * FROM t2;
UPDATE t2 SET c=7, c=6, c=5 WHERE rowid=1;
SELECT * FROM t2;
UPDATE t2 SET c=5, b=6, c=7 WHERE rowid=1;
SELECT * FROM t2;
DELETE FROM t2;
INSERT INTO t2(rowid, a, b, c) VALUES(1,  3, 1, 4);
INSERT INTO t2(rowid, a, b, c) VALUES(2,  1, 5, 9);
INSERT INTO t2(rowid, a, b, c) VALUES(3,  2, 6, 5);
UPDATE t2 SET a=b+c;
SELECT * FROM t2;
UPDATE t2 SET a=b, b=a;
SELECT * FROM t2;
UPDATE t2 SET a=c||c, c=NULL;
SELECT * FROM t2;
DELETE FROM t3;
INSERT INTO t3 VALUES(1, 'one');
INSERT INTO t3 VALUES(2, 'two');
INSERT INTO t3 VALUES(3, 'three');
INSERT INTO t3 VALUES(4, 'four');
SELECT * FROM t3;
UPDATE OR REPLACE t3 SET b='one' WHERE a=3;
SELECT * FROM t3;
SELECT * FROM t3;
UPDATE OR IGNORE t3 SET b='three' WHERE a=3;
SELECT * FROM t3;
SELECT * FROM t3;
BEGIN;
SELECT * FROM t3;
SELECT * FROM t3;
SELECT * FROM t3;
SELECT * FROM t3;
UPDATE OR IGNORE t3 SET b='four' WHERE a=3;
SELECT * FROM t3;
UPDATE OR REPLACE t3 SET b='four' WHERE a=3;
SELECT * FROM t3;
SELECT * FROM t3;
INSERT INTO t1 VALUES(1, 2);
INSERT INTO t5 VALUES(1, 2);
SELECT 'main', tbl_name FROM main.sqlite_master WHERE type = 'table';
SELECT 'temp', tbl_name FROM sqlite_temp_master WHERE type = 'table';
SELECT 'aux', tbl_name FROM aux.sqlite_master WHERE type = 'table';
DELETE FROM main.t6;
DELETE FROM temp.t6;
INSERT INTO main.t6 VALUES(1, 2);
INSERT INTO temp.t6 VALUES(1, 2);
INSERT INTO t4 VALUES(1, 2);
SELECT * FROM main.t6;
SELECT * FROM temp.t6;
DELETE FROM main.t1;
DELETE FROM aux.t1;
INSERT INTO main.t1 VALUES(1, 2);
INSERT INTO aux.t1 VALUES(1, 2);
DELETE FROM t4;
SELECT * FROM main.t1;
SELECT * FROM aux.t1;
DELETE FROM aux.t5;
INSERT INTO aux.t5 VALUES(1, 2);
INSERT INTO t4 VALUES('x', 'y');
UPDATE t4 SET x=10;
SELECT * FROM aux.t5;
