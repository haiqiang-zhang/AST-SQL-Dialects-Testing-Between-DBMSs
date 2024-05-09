CREATE TABLE t1
(
  id SMALLINT NOT NULL,
  PRIMARY KEY (id)
) ENGINE=innodb
PARTITION BY RANGE (id)
(
  PARTITION p1 VALUES LESS THAN (2),
  PARTITION p2 VALUES LESS THAN (4),
  PARTITION p3 VALUES LESS THAN (10)
);
INSERT INTO t1 VALUES (1),(2),(3);
SELECT * FROM t1;
INSERT INTO t1 VALUES(7);
SELECT * FROM t1;
INSERT INTO t1 VALUES(9);
DROP TABLE t1;
