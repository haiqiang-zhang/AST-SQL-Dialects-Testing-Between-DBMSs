CREATE TABLE t1 (a SERIAL) ENGINE = InnoDB
PARTITION BY KEY ALGORITHM = 1 () PARTITIONS 3;
INSERT INTO t1 VALUES (10);
INSERT INTO t1 VALUES (5);