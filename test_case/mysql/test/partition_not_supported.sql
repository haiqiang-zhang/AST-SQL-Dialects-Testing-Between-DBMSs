CREATE TABLE t1 (i INTEGER NOT NULL)
  ENGINE InnoDB;
ALTER TABLE t1
  PARTITION BY HASH (i) PARTITIONS 2;
DROP TABLE t1;
