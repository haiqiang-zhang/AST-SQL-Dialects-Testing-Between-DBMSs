CREATE TABLE t1(f1 INT INVISIBLE, f2 INT);
CREATE TEMPORARY TABLE t2 LIKE t1;
SELECT * FROM t2;
DROP TABLE t1, t2;
CREATE TABLE t1 (f1 INT, f2 INT PRIMARY KEY INVISIBLE);
CREATE TABLE t2 (f1 INT PRIMARY KEY, f2 INT,
                 CONSTRAINT FOREIGN KEY (f1) REFERENCES t1(f2));
INSERT INTO t1(f1, f2) VALUES(1, 1);
INSERT INTO t2 VALUES (1, 2);
DROP TABLE t1, t2;
CREATE TABLE t1 (f1 INT, f2 INT PRIMARY KEY INVISIBLE);
CREATE TABLE t2 (f1 INT, f2 INT, CONSTRAINT FOREIGN KEY (f1) REFERENCES t1(f2));
INSERT INTO t1(f1, f2) VALUES(1, 1);
INSERT INTO t2 VALUES (1, 2);
DROP TABLE t1, t2;
CREATE TABLE t1 (f1 INT, f2 INT PRIMARY KEY);
CREATE TABLE t2 (f1 INT PRIMARY KEY INVISIBLE, f2 INT,
                 CONSTRAINT FOREIGN KEY (f1) REFERENCES t1(f2));
INSERT INTO t1 VALUES(1, 1);
INSERT INTO t2(f1, f2) VALUES (1, 2);
DROP TABLE t1, t2;
CREATE TABLE t1 (f1 INT, f2 INT PRIMARY KEY INVISIBLE);
CREATE TABLE t2 (f1 INT PRIMARY KEY, f2 INT);
INSERT INTO t1(f1, f2) VALUES (1, 1);
ALTER TABLE t2 ADD CONSTRAINT FOREIGN KEY (f1) REFERENCES t1(f2);
INSERT INTO t2 VALUES (1, 3);
DROP TABLE t2;
CREATE TABLE t2 (f1 INT PRIMARY KEY, f2 INT,
                 CONSTRAINT FOREIGN KEY (f1) REFERENCES t1(f2));
ALTER TABLE t2 DROP CONSTRAINT t2_ibfk_1;
DROP TABLE t1, t2;
CREATE TABLE t1 (f1 INT, f2 INT);
ALTER TABLE t1 ALTER COLUMN f1 SET INVISIBLE, ALGORITHM = INPLACE;
ALTER TABLE t1 CHANGE f1 f1 INT VISIBLE, ALGORITHM = INPLACE;
ALTER TABLE t1 MODIFY f1 INT INVISIBLE, ALGORITHM = INPLACE;
ALTER TABLE t1 ALTER COLUMN f1 SET INVISIBLE, ALGORITHM = INPLACE;
ALTER TABLE t1 ALTER COLUMN f1 SET INVISIBLE, ALGORITHM = INSTANT;
ALTER TABLE t1 CHANGE f1 f1 INT VISIBLE, ALGORITHM = INSTANT;
ALTER TABLE t1 MODIFY f1 INT INVISIBLE, ALGORITHM = INSTANT;
ALTER TABLE t1 ALTER COLUMN f1 SET INVISIBLE, ALGORITHM = INSTANT;
DROP TABLE t1;
CREATE TABLE t1(a INT, b DATE NOT NULL INVISIBLE)
        PARTITION BY RANGE( YEAR(b) ) (
        PARTITION p0 VALUES LESS THAN (1960),
        PARTITION p1 VALUES LESS THAN (1970),
        PARTITION p2 VALUES LESS THAN (1980),
        PARTITION p3 VALUES LESS THAN (1990));
INSERT INTO t1(a, b) VALUES(1, '1960-01-01');
SELECT a, b FROM t1;
DROP TABLE t1;
CREATE TABLE t1(id INT NOT NULL INVISIBLE, name VARCHAR(10))
        PARTITION BY LIST(id) (
        PARTITION p0 VALUES IN (10,19),
        PARTITION p1 VALUES IN (20,29),
        PARTITION p2 VALUES IN (30,39),
        PARTITION p3 VALUES IN (40,49));
INSERT INTO t1(id, name) VALUES(30,'aaa');
SELECT id, name FROM t1;
DROP TABLE t1;
CREATE TABLE t1(id INT NOT NULL INVISIBLE, name VARCHAR(40))
        PARTITION BY HASH(id)
        PARTITIONS 4;
INSERT INTO t1(id, name) VALUES(60,'aaa');
SELECT id, name FROM t1;
DROP TABLE t1;
CREATE TABLE t1(id INT PRIMARY KEY NOT NULL INVISIBLE, name VARCHAR(40))
        PARTITION BY KEY()
        PARTITIONS 4;
INSERT INTO t1(id, name) VALUES(60,'aaa');
SELECT id, name FROM t1;
DROP TABLE t1;
CREATE TABLE t1 (f1 INT PRIMARY KEY INVISIBLE, f2 INT UNIQUE INVISIBLE,
                 f3 INT, FOREIGN KEY (f2) REFERENCES t1(f1));
SELECT TABLE_NAME, COLUMN_NAME, EXTRA FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='t1';
SELECT TABLE_NAME, CONSTRAINT_NAME, COLUMN_NAME, REFERENCED_COLUMN_NAME
       FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME='t1';
DROP TABLE t1;
