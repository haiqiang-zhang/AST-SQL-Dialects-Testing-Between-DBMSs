
--
-- Single table specific update/delete tests (mysql_update and mysql_delete)
--

--echo --
--echo -- Bug #30584: delete with order by and limit clauses does not use
--echo --             limit efficiently
--echo --

CREATE TABLE t1 (i INT);
INSERT INTO t1 VALUES (10),(11),(12),(13),(14),(15),(16),(17),(18),(19),
                      (20),(21),(22),(23),(24),(25),(26),(27),(28),(29),
                      (30),(31),(32),(33),(34),(35);

CREATE TABLE t2(a INT, i INT PRIMARY KEY);
INSERT INTO t2 (i) SELECT i FROM t1;
SELECT * FROM t2 WHERE i > 10 AND i <= 18 ORDER BY i LIMIT 1;
DELETE FROM t2 WHERE i > 10 AND i <= 18 ORDER BY i LIMIT 1;
SELECT * FROM t2 WHERE i > 10 AND i <= 18 ORDER BY i;

DROP TABLE t2;

CREATE TABLE t2(a INT, i CHAR(2), INDEX(i(1)));
INSERT INTO t2 (i) SELECT i FROM t1;
SELECT * FROM t2 WHERE i > 10 AND i <= 18 ORDER BY i LIMIT 1;
DELETE FROM t2 WHERE i > 10 AND i <= 18 ORDER BY i LIMIT 1;
SELECT * FROM t2 WHERE i > 10 AND i <= 18 ORDER BY i;

DROP TABLE t2;

CREATE TABLE t2(a INT, b INT, c INT, d INT, INDEX(a, b, c));
INSERT INTO t2 (a, b, c) SELECT i, i, i FROM t1;
SELECT * FROM t2 WHERE b = 10 ORDER BY a, c LIMIT 12;

let $cnt = `SELECT COUNT(*) FROM t2 WHERE b = 10`;
DELETE FROM t2 WHERE b = 10 ORDER BY a, c LIMIT 12;

DROP TABLE t2;

CREATE TABLE t2(a INT, b INT, c INT, d INT, INDEX(a, b, c));
INSERT INTO t2 (a, b, c) SELECT i, i, i FROM t1;

INSERT INTO t2 (a, b, c) SELECT t1.i, t1.i, t1.i FROM t1, t1 x1, t1 x2;
SELECT * FROM t2 WHERE b = 10 ORDER BY a, c LIMIT 12;

let $cnt = `SELECT COUNT(*) FROM t2 WHERE b = 10`;
DELETE FROM t2 WHERE b = 10 ORDER BY a, c LIMIT 12;

DROP TABLE t2;

CREATE TABLE t2 (a CHAR(2), b CHAR(2), c CHAR(2), d CHAR(2), INDEX (a,b(1),c));
INSERT INTO t2 SELECT i, i, i, i FROM t1;
SELECT * FROM t2 WHERE b = 10 ORDER BY a, c LIMIT 1;
DELETE FROM t2 WHERE b = 10 ORDER BY a, c LIMIT 1;
SELECT * FROM t2 WHERE b = 10 ORDER BY a, c;

DROP TABLE t2;

CREATE TABLE t2 (a CHAR(2), b CHAR(2), c CHAR(2), d CHAR(2), INDEX (a,b,c)) ENGINE=HEAP;
INSERT INTO t2 SELECT i, i, i, i FROM t1;
SELECT * FROM t2 WHERE b = 10 ORDER BY a, c LIMIT 5;
DELETE FROM t2 WHERE b = 10 ORDER BY a, c LIMIT 5;
SELECT * FROM t2 WHERE b = 10 ORDER BY a, c;

DROP TABLE t2;

CREATE TABLE t2 (i INT, key1 INT, key2 INT, INDEX (key1), INDEX (key2))
ENGINE= MyISAM;
INSERT INTO t2 (key1, key2) SELECT i, i FROM t1;
SELECT * FROM t2 WHERE key1 < 13 or key2 < 14 ORDER BY key1;
DELETE FROM t2 WHERE key1 < 13 or key2 < 14 ORDER BY key1;
SELECT * FROM t2 WHERE key1 < 13 or key2 < 14 ORDER BY key1;
DROP TABLE t2;

CREATE TABLE t2(a INT, i INT PRIMARY KEY);
INSERT INTO t2 (i) SELECT i FROM t1;
SELECT * FROM t2 WHERE i > 10 AND i <= 18 ORDER BY i DESC LIMIT 1;
DELETE FROM t2 WHERE i > 10 AND i <= 18 ORDER BY i DESC LIMIT 1;
SELECT * FROM t2 WHERE i > 10 AND i <= 18 ORDER BY i;

DROP TABLE t2;

CREATE TABLE t2 (a CHAR(2), b CHAR(2), c CHAR(2), INDEX (a, b));
INSERT INTO t2 SELECT i, i, i FROM t1;
SELECT * FROM t2 ORDER BY a, b DESC LIMIT 5;
DELETE FROM t2 ORDER BY a, b DESC LIMIT 5;
SELECT * FROM t2 ORDER BY a, b DESC;

DROP TABLE t2;

CREATE TABLE t2 (a CHAR(2), b CHAR(2), c CHAR(2), INDEX (a, b));
INSERT INTO t2 (a, b) SELECT i, i FROM t1;
INSERT INTO t2 (a, b) SELECT t1.i, t1.i FROM t1, t1 x1, t1 x2;
SELECT * FROM t2 ORDER BY a, b LIMIT 5;
SELECT * FROM t2 ORDER BY a DESC, b DESC LIMIT 5;
DELETE FROM t2 ORDER BY a DESC, b DESC LIMIT 5;
SELECT * FROM t2 WHERE c = 10 ORDER BY a DESC, b DESC;

DROP TABLE t1, t2;

CREATE TABLE t1 (i INT);
INSERT INTO t1 VALUES (10),(11),(12),(13),(14),(15),(16),(17),(18),(19),
                      (20),(21),(22),(23),(24),(25),(26),(27),(28),(29),
                      (30),(31),(32),(33),(34),(35);

CREATE TABLE t2(a INT, i INT PRIMARY KEY);
INSERT INTO t2 (i) SELECT i FROM t1;
SELECT * FROM t2 WHERE i > 10 AND i <= 18 ORDER BY i LIMIT 1;
UPDATE t2 SET a = 10 WHERE i > 10 AND i <= 18 ORDER BY i LIMIT 1;
SELECT * FROM t2 WHERE i > 10 AND i <= 18 ORDER BY i;

DROP TABLE t2;

CREATE TABLE t2(a INT, i CHAR(2), INDEX(i(1)));
INSERT INTO t2 (i) SELECT i FROM t1;
SELECT * FROM t2 WHERE i > 10 AND i <= 18 ORDER BY i LIMIT 5;
UPDATE t2 SET a = 10 WHERE i > 10 AND i <= 18 ORDER BY i LIMIT 5;
SELECT * FROM t2 WHERE i > 10 AND i <= 18 ORDER BY i;

DROP TABLE t2;

CREATE TABLE t2(a INT, b INT, c INT, d INT, INDEX(a, b, c));
INSERT INTO t2 (a, b, c) SELECT i, i, i FROM t1;
SELECT * FROM t2 WHERE b = 10 ORDER BY a, c LIMIT 12;

let $cnt = `SELECT COUNT(*) FROM t2 WHERE b = 10`;
UPDATE t2 SET d = 10 WHERE b = 10 ORDER BY a, c LIMIT 12;
SELECT COUNT(*) FROM t2 WHERE b = 10 AND d = 10 ORDER BY a, c;

DROP TABLE t2;

CREATE TABLE t2(a INT, b INT, c INT, d INT, INDEX(a, b, c));
INSERT INTO t2 (a, b, c) SELECT i, i, i FROM t1;

INSERT INTO t2 (a, b, c) SELECT t1.i, t1.i, t1.i FROM t1, t1 x1, t1 x2;
SELECT * FROM t2 WHERE b = 10 ORDER BY a, c LIMIT 12;

let $cnt = `SELECT COUNT(*) FROM t2 WHERE b = 10`;
UPDATE t2 SET d = 10 WHERE b = 10 ORDER BY a, c LIMIT 12;
SELECT COUNT(*) FROM t2 WHERE b = 10 AND d = 10 ORDER BY a, c;

DROP TABLE t2;

CREATE TABLE t2 (a CHAR(2), b CHAR(2), c CHAR(2), d CHAR(2), INDEX (a,b(1),c));
INSERT INTO t2 SELECT i, i, i, i FROM t1;
SELECT * FROM t2 WHERE b = 10 ORDER BY a, c LIMIT 5;
UPDATE t2 SET d = 10 WHERE b = 10 ORDER BY a, c LIMIT 5;
SELECT * FROM t2 WHERE b = 10 ORDER BY a, c;

DROP TABLE t2;

CREATE TABLE t2 (a CHAR(2), b CHAR(2), c CHAR(2), d CHAR(2), INDEX (a,b,c)) ENGINE=HEAP;
INSERT INTO t2 SELECT i, i, i, i FROM t1;
SELECT * FROM t2 WHERE b = 10 ORDER BY a, c LIMIT 5;
UPDATE t2 SET d = 10 WHERE b = 10 ORDER BY a, c LIMIT 5;
SELECT * FROM t2 WHERE b = 10 ORDER BY a, c;

DROP TABLE t2;

CREATE TABLE t2 (i INT, key1 INT, key2 INT, INDEX (key1), INDEX (key2))
ENGINE= MyISAM;
INSERT INTO t2 (key1, key2) SELECT i, i FROM t1;
SELECT * FROM t2 WHERE key1 < 13 or key2 < 14 ORDER BY key1;
UPDATE t2 SET i = 123 WHERE key1 < 13 or key2 < 14 ORDER BY key1;
SELECT * FROM t2 WHERE key1 < 13 or key2 < 14 ORDER BY key1;

DROP TABLE t2;

CREATE TABLE t2(a INT, i INT PRIMARY KEY);
INSERT INTO t2 (i) SELECT i FROM t1;
SELECT * FROM t2 WHERE i > 10 AND i <= 18 ORDER BY i DESC LIMIT 1;
UPDATE t2 SET a = 10 WHERE i > 10 AND i <= 18 ORDER BY i DESC LIMIT 1;
SELECT * FROM t2 WHERE i > 10 AND i <= 18 ORDER BY i;

DROP TABLE t2;

CREATE TABLE t2 (a CHAR(2), b CHAR(2), c CHAR(2), INDEX (a, b));
INSERT INTO t2 SELECT i, i, i FROM t1;
SELECT * FROM t2 ORDER BY a, b DESC LIMIT 5;
UPDATE t2 SET c = 10 ORDER BY a, b DESC LIMIT 5;
SELECT * FROM t2 WHERE c = 10 ORDER BY a, b DESC;

DROP TABLE t2;

CREATE TABLE t2 (a CHAR(2), b CHAR(2), c CHAR(2), INDEX (a, b));
INSERT INTO t2 (a, b) SELECT i, i FROM t1;
INSERT INTO t2 (a, b) SELECT t1.i, t1.i FROM t1, t1 x1, t1 x2;
SELECT * FROM t2 ORDER BY a, b LIMIT 5;
SELECT * FROM t2 ORDER BY a DESC, b DESC LIMIT 5;
UPDATE t2 SET c = 10 ORDER BY a DESC, b DESC LIMIT 5;
SELECT * FROM t2 WHERE c = 10 ORDER BY a DESC, b DESC;

DROP TABLE t1, t2;
CREATE TABLE t1 (
  pk INT NOT NULL AUTO_INCREMENT,
  c1_idx CHAR(1) DEFAULT 'y',
  c2 INT,
  PRIMARY KEY (pk),
  INDEX c1_idx (c1_idx)
) ENGINE=InnoDB;

INSERT INTO t1 VALUES (), (), (), ();

SELECT * FROM t1 WHERE c1_idx = 'y' ORDER BY pk DESC LIMIT 2;
UPDATE t1 SET c2 = 0 WHERE c1_idx = 'y' ORDER BY pk DESC LIMIT 2;
SELECT * FROM t1 WHERE c1_idx = 'y' ORDER BY pk DESC LIMIT 2;
SELECT * FROM t1 WHERE c1_idx = 'y' ORDER BY pk DESC;

DELETE FROM t1 WHERE c1_idx = 'y' ORDER BY pk DESC LIMIT 2;
SELECT * FROM t1 WHERE c1_idx = 'y' ORDER BY pk DESC;

DROP TABLE t1;