DROP TABLE if exists t1,t2,t3,t4,t5,t6;
CREATE TABLE t1 (
  Period smallint(4) unsigned zerofill DEFAULT '0000' NOT NULL,
  Varor_period smallint(4) unsigned DEFAULT '0' NOT NULL
) ENGINE=archive;
INSERT INTO t1 VALUES (9410,9412);