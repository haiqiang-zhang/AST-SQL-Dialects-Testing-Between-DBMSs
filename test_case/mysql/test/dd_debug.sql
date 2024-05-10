CREATE TABLE t1 (pk INT, col1 INT) ENGINE=InnoDB PARTITION BY KEY(pk) PARTITIONS 2;
DROP TABLE t1;
CREATE SCHEMA s1;
ALTER SCHEMA s1 DEFAULT COLLATE 'utf8_bin';
ALTER SCHEMA s1 DEFAULT COLLATE 'utf8_bin';
DROP SCHEMA s1;
CREATE TABLE t1 (pk INT PRIMARY KEY);
ALTER TABLE t1 ADD COLUMN c1 INT;
DROP TABLE t1;
DROP TABLE IF EXISTS t1;
CREATE TABLE v1_base_table (pk INT PRIMARY KEY);
CREATE VIEW v1 AS SELECT * from v1_base_table;
DROP VIEW v1;
DROP TABLE v1_base_table;
DROP TABLESPACE ts1;
CREATE TABLESPACE ts1 ADD DATAFILE 'ts1.ibd';
DROP TABLESPACE ts1;
CREATE TABLE t1 (pk INT PRIMARY KEY);
CREATE VIEW v1 AS SELECT * FROM t1;
ALTER TABLE t1 RENAME TO t2, MODIFY COLUMN pk INTEGER;
DROP TABLE IF EXISTS t1;
DROP VIEW v1;
DROP TABLE t2;
CREATE TABLE t1 (pk INT PRIMARY KEY);
CREATE TABLE t2 (i INT);
CREATE VIEW v1 AS SELECT * FROM t1, t2;
DROP TABLE t2;
ALTER TABLE t1 RENAME TO t2, MODIFY COLUMN pk INTEGER;
DROP TABLE IF EXISTS t1;
DROP VIEW v1;
DROP TABLE t2;
CREATE TABLE t1(a INT PRIMARY KEY);
CREATE VIEW v1 AS SELECT * FROM t1;
ALTER TABLE t1 RENAME TO t2, ALGORITHM= COPY;
DROP TABLE IF EXISTS t1;
DROP TABLE t2;
DROP VIEW v1;
CREATE TABLE t1 (pk INT PRIMARY KEY);
CREATE TABLE t2 (fk INT, FOREIGN KEY (FK) REFERENCES t1 (PK));
DROP TABLE t2, t1;
CREATE TABLE t1(a INT) Engine=InnoDB;
INSERT INTO t1 VALUES (1), (2);
DROP TABLE t1;
CREATE TABLE t1(pk INT PRIMARY KEY, s VARCHAR(10), FULLTEXT idx(s));
DROP TABLE t1;
