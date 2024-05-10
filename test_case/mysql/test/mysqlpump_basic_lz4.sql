CREATE DATABASE bug21644479_lz4;
CREATE TABLE t1 (a INT);
CREATE TABLE t2 (a INT, b VARCHAR(10), primary key(a));
CREATE TABLE t3 (`a"b"` char(2));
CREATE TABLE t4 (
  name VARCHAR(64) NOT NULL,
  value FLOAT DEFAULT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  comment VARCHAR(1024) DEFAULT NULL,
  PRIMARY KEY (name)
);
CREATE TABLE t5 (
  id int(11) NOT NULL,
  id2 tinyint(3) NOT NULL,
  PRIMARY KEY (id),
  KEY index2 (id2)
);
INSERT INTO t1 VALUES (289), (298), (234), (456), (789);
INSERT INTO t2 VALUES (1, "on"), (2, "off"), (10, "pol"), (12, "meg");
INSERT INTO t3 VALUES ("1\""), ("\"2");
INSERT INTO t4  (name) VALUES ('disk_temptable_create_cost');
INSERT INTO t4  (name) VALUES ('disk_temptable_row_cost');
SELECT * FROM t1 ORDER BY 1;
SELECT * FROM t2 ORDER BY 1;
SELECT * FROM t3 ORDER BY 1;
SELECT name FROM t4 ORDER BY 1;
SELECT * FROM t5 ORDER BY 1;
DROP DATABASE bug21644479_lz4;
SELECT * FROM t1 ORDER BY 1;
SELECT * FROM t2 ORDER BY 1;
SELECT * FROM t3 ORDER BY 1;
SELECT name FROM t4 ORDER BY 1;
SELECT * FROM t5 ORDER BY 1;
