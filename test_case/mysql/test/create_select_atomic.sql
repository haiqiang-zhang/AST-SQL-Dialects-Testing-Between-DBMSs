select count(*) = 1 from information_schema.processlist
  where state = "Waiting for table metadata lock" and
        info = "SELECT * FROM t1";
CREATE TABLE t1 (f1 INT) START TRANSACTION;
DROP TABLE t1;
CREATE TABLE t1 (f1 INT) START TRANSACTION;
DROP TABLE t1;
CREATE TABLE t1 (f1 INT) START TRANSACTION;
INSERT INTO t1 VALUES (1);
UPDATE t1 SET f1=932;
CREATE TABLE t2 (f2 INT);
DROP TABLE t1;
