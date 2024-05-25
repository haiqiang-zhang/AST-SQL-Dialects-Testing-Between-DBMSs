ALTER TABLE t1 ADD COLUMN b DEFAULT 2;
CREATE TABLE t2(a, b);
INSERT INTO t2 SELECT * FROM t1;
SELECT * FROM t2;
DROP TABLE t1;
DROP TABLE t2;
CREATE TABLE t1(a, b);
CREATE TABLE t2(a, b);
DROP TABLE t1;
DROP TABLE t2;
CREATE TABLE t1(a, b DEFAULT 'x');
CREATE TABLE t2(a, b);
DROP TABLE t1;
DROP TABLE t2;
CREATE TABLE t1(a, b DEFAULT 'x');
CREATE TABLE t2(a, b DEFAULT 'x');
DROP TABLE t1;
DROP TABLE t2;
CREATE TABLE t1(a, b DEFAULT NULL);
CREATE TABLE t2(a, b);
DROP TABLE t1;
DROP TABLE t2;
CREATE TABLE t1(a DEFAULT 2, b);
CREATE TABLE t2(a DEFAULT 1, b);
DROP TABLE t1;
DROP TABLE t2;
CREATE TABLE t1(a DEFAULT 1, b);
CREATE TABLE t2(a DEFAULT 1, b);
DROP TABLE t1;
DROP TABLE t2;
CREATE TABLE t1(a DEFAULT 1, b DEFAULT 1);
CREATE TABLE t2(a DEFAULT 3, b DEFAULT 1);
DROP TABLE t1;
DROP TABLE t2;
CREATE TABLE t1(a DEFAULT 1, b DEFAULT 1);
CREATE TABLE t2(a DEFAULT 3, b DEFAULT 3);
