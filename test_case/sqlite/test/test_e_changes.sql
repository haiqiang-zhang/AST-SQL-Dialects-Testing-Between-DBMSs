CREATE INDEX i1 ON t1(a);
CREATE INDEX i2 ON t2(y);
INSERT INTO t1 VALUES(0, 0);
WITH rows(i, j) AS (
        SELECT 1, 1 UNION ALL SELECT i+1, j+i FROM rows WHERE i<10
    )
    INSERT INTO t1 SELECT * FROM rows;
UPDATE t1 SET b=b+1 WHERE a<5;
DELETE FROM t1 WHERE a>6;
INSERT INTO t1 VALUES(-1, -1);
INSERT INTO t1 VALUES('a', 0), ('b', 0), ('c', 0), (0, 11);
BEGIN;
INSERT INTO t1 VALUES('a', 0), ('b', 0), ('c', 0), (0, 11);
INSERT INTO t1 VALUES(0, 0);
WITH rows(i, j) AS (
        SELECT 1, 1 UNION ALL SELECT i+1, j+i FROM rows WHERE i<10
    )
    INSERT INTO t1 SELECT * FROM rows;
UPDATE t1 SET b=b+1 WHERE a<5;
DELETE FROM t1 WHERE a>6;
INSERT INTO t1 VALUES(-1, -1);
INSERT INTO t1 VALUES('a', 0), ('b', 0), ('c', 0), (0, 11);
BEGIN;
INSERT INTO t1 VALUES('a', 0), ('b', 0), ('c', 0), (0, 11);
DROP TABLE t1;
CREATE TABLE t1(x);
ALTER TABLE t1 ADD COLUMN b;
CREATE TABLE log(x);
CREATE TABLE p1(one PRIMARY KEY, two);
INSERT INTO p1 VALUES('a', 'A'), ('b', 'B'), ('c', 'C');
UPDATE p1 SET two = two||two;
DELETE FROM p1 WHERE one IN ('a', 'c');
-- None of the inserts on table log were counted.
  SELECT count(*) FROM log;
DELETE FROM p1;
INSERT INTO p1 VALUES('a', 'A'), ('b', 'B'), ('c', 'C');
CREATE TABLE c1(a, b, FOREIGN KEY(a) REFERENCES p1 ON DELETE SET NULL);
CREATE TABLE c2(a, b, FOREIGN KEY(a) REFERENCES p1 ON DELETE SET DEFAULT);
CREATE TABLE c3(a, b, FOREIGN KEY(a) REFERENCES p1 ON DELETE CASCADE);
INSERT INTO c1 VALUES('a', 'aaa');
INSERT INTO c2 VALUES('b', 'bbb');
INSERT INTO c3 VALUES('c', 'ccc');
INSERT INTO p1 VALUES('d', 'D'), ('e', 'E'), ('f', 'F');
CREATE TABLE c4(a, b, FOREIGN KEY(a) REFERENCES p1 ON UPDATE SET NULL);
CREATE TABLE c5(a, b, FOREIGN KEY(a) REFERENCES p1 ON UPDATE SET DEFAULT);
CREATE TABLE c6(a, b, FOREIGN KEY(a) REFERENCES p1 ON UPDATE CASCADE);
INSERT INTO c4 VALUES('d', 'aaa');
INSERT INTO c5 VALUES('e', 'bbb');
INSERT INTO c6 VALUES('f', 'ccc');
PRAGMA foreign_keys = ON;
DELETE FROM p1 WHERE one = 'a';
DELETE FROM p1 WHERE one = 'b';
DELETE FROM p1 WHERE one = 'c';
SELECT * FROM c1;
SELECT * FROM c2;
SELECT * FROM c3;
UPDATE p1 SET one = 'g' WHERE one = 'd';
UPDATE p1 SET one = 'h' WHERE one = 'e';
UPDATE p1 SET one = 'i' WHERE one = 'f';
SELECT * FROM c4;
SELECT * FROM c5;
SELECT * FROM c6;
CREATE TABLE r1(a UNIQUE, b UNIQUE);
INSERT INTO r1 VALUES('i', 'i');
INSERT INTO r1 VALUES('ii', 'ii');
INSERT INTO r1 VALUES('iii', 'iii');
INSERT INTO r1 VALUES('iv', 'iv');
INSERT INTO r1 VALUES('v', 'v');
INSERT INTO r1 VALUES('vi', 'vi');
INSERT INTO r1 VALUES('vii', 'vii');
INSERT OR REPLACE INTO r1 VALUES('i', 1);
INSERT OR REPLACE INTO r1 VALUES('iv', 'v');
UPDATE OR REPLACE r1 SET b='v' WHERE a='iii';
UPDATE OR REPLACE r1 SET b='vi',a='vii' WHERE a='ii';
SELECT * FROM r1 ORDER BY a;
INSERT INTO t1 VALUES(1, 2);
INSERT INTO t1 VALUES(3, 4);
INSERT INTO t1 VALUES(5, 6);
CREATE VIEW v1 AS SELECT * FROM t1;
INSERT INTO t1 SELECT * FROM t1;
INSERT INTO t1 SELECT * FROM t1;
INSERT INTO t1 SELECT * FROM t1;
INSERT INTO t1 VALUES(1, NULL);
INSERT INTO t1 VALUES(2, NULL);
INSERT INTO t1 VALUES(3, NULL);
SELECT * FROM t1;
INSERT INTO t1 VALUES(1, 0);
INSERT INTO t1 VALUES(2, 0);
INSERT INTO t1 VALUES(3, 0);
UPDATE t1 SET b = changes();
SELECT * FROM t1;
SELECT * FROM log;
CREATE TABLE t3(a, b);
INSERT INTO log VALUES('t2->' || changes());
INSERT INTO log VALUES('t3->' || changes());
INSERT INTO log VALUES('t2->' || changes());
INSERT INTO log VALUES('t3->' || changes());
INSERT INTO log VALUES('t2->' || changes());
INSERT INTO log VALUES('t3->' || changes());
INSERT INTO t1 VALUES('+', 'o');
SELECT * FROM log;
DELETE FROM log;
UPDATE t1 SET b='*';
SELECT * FROM log;
DELETE FROM log;
DELETE FROM t1;
SELECT * FROM log;
CREATE TABLE q1(t);
CREATE TABLE q2(u, v);
CREATE TABLE q3(w);
/* changes() returns value of previous I/U/D in this context */
    INSERT INTO q3 VALUES(changes()), (2), (3);
INSERT INTO q1 VALUES('2:' || changes());
INSERT INTO q3 VALUES(changes() + 3), (changes()+4);
SELECT 'this does not affect things!';
INSERT INTO q1 VALUES('3:' || changes());
UPDATE q3 SET w = w+10 WHERE w%2;
INSERT INTO q1 VALUES('4:' || changes());
DELETE FROM q3;
INSERT INTO q1 VALUES('5:' || changes());
INSERT INTO q2 VALUES('x', 'y');
SELECT * FROM q1;
DELETE FROM q1;
INSERT INTO q2 VALUES('x', 'y');
SELECT * FROM q1;