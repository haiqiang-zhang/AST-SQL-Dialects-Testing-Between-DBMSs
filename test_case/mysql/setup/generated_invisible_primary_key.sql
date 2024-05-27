CREATE TABLE t1(f1 INT, f2 INT);
DROP TABLE t1;
CREATE TABLE t1 (f1 INT PRIMARY KEY, f2 INT);
DROP TABLE t1;
CREATE TEMPORARY TABLE t1 (f1 INT PRIMARY KEY, f2 INT);
DROP TABLE t1;
CREATE TABLE t1 (f1 INT, f2 INT PRIMARY KEY) PARTITION BY RANGE (f2)
                   (PARTITION p0 VALUES LESS THAN (2011),
                    PARTITION p1 VALUES LESS THAN (2022));
DROP TABLE t1;
CREATE TABLE t1 (f1 INT, f2 INT) ENGINE = MyISAM;
DROP TABLE t1;
CREATE TABLE t1 (my_row_id INT, f2 INT);
DROP TABLE t1;
CREATE TEMPORARY TABLE t1(f1 INT);
DROP TABLE t1;
CREATE TABLE t1(f1 INT NOT NULL UNIQUE);
DROP TABLE t1;
CREATE TEMPORARY TABLE t1 (f1 INT NOT NULL UNIQUE);
DROP TABLE t1;
CREATE TABLE t1(f1 INT);
CREATE TABLE IF NOT EXISTS t1 (f1 INT, f2 INT);
DROP TABLE t1;
CREATE TEMPORARY TABLE t2 (f1 INT);
CREATE TEMPORARY TABLE IF NOT EXISTS t2 (f1 INT, f2 INT);
DROP TABLE t2;
CREATE VIEW t1 AS SELECT 1;
CREATE TABLE IF NOT EXISTS t1 (f1 INT);
DROP VIEW t1;
CREATE TABLE t1(f1 INT);
CREATE TABLE t2 LIKE t1;
CREATE TABLE t3 LIKE t1;
DROP TABLE t1, t2;
CREATE TABLE t1 (f1 INT);
CREATE TABLE t2 AS SELECT * FROM t1;
DROP TABLE t2;
CREATE TABLE t2 (f1 INT NOT NULL UNIQUE) AS SELECT * FROM t1;
DROP TABLE t2;
CREATE TABLE t2 (f1 INT, PRIMARY KEY(f1)) AS SELECT * FROM t1;
DROP TABLE t2;
CREATE TABLE t2 (f1 INT, f2 INT);
DROP TABLE t1;
DROP TABLE t2;
CREATE TABLE t1 (f1 INT);
CREATE TABLE t2 (f1 INT);
CREATE TEMPORARY TABLE t4 (f1 INT);
DROP TABLE t1;
DROP TABLE t2;
DROP TABLE t3;
DROP TABLE t4;
CREATE TABLE t1 (f1 INT);
CREATE TEMPORARY TABLE t2 (f1 INT);
ALTER TABLE t1 ADD PRIMARY KEY(f1);
ALTER TABLE t2 ADD PRIMARY KEY(f1);
ALTER TABLE t1 ADD UNIQUE KEY(f1);
DROP TABLE t1;
ALTER TABLE t2 ADD UNIQUE KEY(f1);
DROP TABLE t2;
CREATE TABLE t1 (f1 INT, f2 INT);
CREATE TEMPORARY TABLE t2 (f1 INT, f2 INT);
DROP TABLE t1, t2;
CREATE TABLE t1 (f1 INT);
ALTER TABLE t1 ENGINE='MyISAM';
ALTER TABLE t1 ENGINE='InnoDB';
ALTER TABLE t1 ENGINE='MYISAM',
               ADD COLUMN my_row_id bigint unsigned NOT NULL AUTO_INCREMENT INVISIBLE FIRST,
               ADD PRIMARY KEY(my_row_id);
ALTER TABLE t1 DROP COLUMN my_row_id;
DROP TABLE t1;
CREATE TEMPORARY TABLE t1 (f1 INT);
ALTER TABLE t1 ENGINE='MyISAM';
ALTER TABLE t1 ENGINE='InnoDB';
ALTER TABLE t1 ENGINE='MYISAM',
               ADD COLUMN my_row_id bigint unsigned NOT NULL AUTO_INCREMENT INVISIBLE FIRST,
               ADD PRIMARY KEY(my_row_id);
ALTER TABLE t1 DROP COLUMN my_row_id;
DROP TABLE t1;
CREATE TABLE t1(my_row_id bigint unsigned NOT NULL AUTO_INCREMENT INVISIBLE,
                f1 INT, primary key(my_row_id)) ENGINE = 'MyISAM';
ALTER TABLE t1 ENGINE='InnoDB';
ALTER TABLE t1 DROP COLUMN my_row_id;
DROP TABLE t1;
CREATE TEMPORARY TABLE t1(my_row_id bigint unsigned NOT NULL AUTO_INCREMENT INVISIBLE,
                f1 INT, primary key(my_row_id)) ENGINE = 'MyISAM';
ALTER TABLE t1 ENGINE='InnoDB';
ALTER TABLE t1 DROP COLUMN my_row_id;
DROP TABLE t1;
CREATE TABLE t1 (f2 INT, f3 INT);
CREATE TEMPORARY TABLE t2 (f2 INT, f3 INT);
ALTER TABLE t1 ADD COLUMN f1 INT FIRST;
ALTER TABLE t2 ADD COLUMN f1 INT FIRST;
ALTER TABLE t1 ADD COLUMN f0 INT FIRST;
ALTER TABLE t1 ADD COLUMN f INT FIRST;
DROP TABLE t1;
ALTER TABLE t2 ADD COLUMN f0 INT FIRST;
ALTER TABLE t2 ADD COLUMN f INT FIRST;
DROP TABLE t2;
CREATE TABLE t1(f2 INT);
DROP TABLE t1;
CREATE TEMPORARY TABLE t1(f2 INT);
DROP TABLE t1;
CREATE TABLE t1(f2 INT);
ALTER TABLE t1 ADD COLUMN my_row_id bigint unsigned NOT NULL AUTO_INCREMENT INVISIBLE FIRST,
               ADD PRIMARY KEY(my_row_id);
ALTER TABLE t1 ADD COLUMN f1 INT FIRST;
ALTER TABLE t1 ADD COLUMN f0 INT FIRST;
DROP TABLE t1;
CREATE TABLE t1 (f1 INT);
DROP TABLE t1;
CREATE TABLE t1 (f1 INT) PARTITION BY RANGE(f1) (PARTITION p1 VALUES LESS THAN (1991));
ALTER TABLE t1 REMOVE PARTITIONING;
ALTER TABLE t1 ADD COLUMN my_row_id bigint unsigned NOT NULL AUTO_INCREMENT INVISIBLE FIRST,
               ADD PRIMARY KEY(my_row_id);
DROP TABLE t1;
CREATE TABLE t2 (f1 INT);
CREATE TABLE t3 AS SELECT * FROM t2;
CREATE TABLE t(f1 INT);