
-- Test have expected differences in count of commit and prepare handlers
-- when run with and without binlog and/or with different binlog formats.
-- Test skips when log_bin is disabled OR binlog_format != ROW.
--source include/have_binlog_format_row.inc

-- Helper statement

create table thread_to_monitor(thread_id int);

insert into thread_to_monitor(thread_id)
  SELECT THREAD_ID FROM performance_schema.threads
    WHERE PROCESSLIST_ID=CONNECTION_ID();

-- This query needs to be in a separate monitoring session,
-- so we do not polute the test session statistics.

let $get_handler_status_counts= SELECT VARIABLE_NAME, VARIABLE_VALUE
  FROM performance_schema.status_by_thread
  WHERE VARIABLE_NAME LIKE 'HANDLER_%' AND VARIABLE_VALUE > 0
    AND THREAD_ID IN (SELECT thread_id from test.thread_to_monitor);
CREATE TABLE t1 (a int)
ENGINE = InnoDB
PARTITION BY HASH (a) PARTITIONS 2;
INSERT INTO t1 VALUES (0), (1), (2), (3);
CREATE VIEW v1 AS SELECT a FROM t1 PARTITION (p0);
SELECT * FROM v1;
SELECT a FROM t1 PARTITION (p0);
INSERT INTO v1 VALUES (10);
INSERT INTO v1 VALUES (11);
SELECT * FROM v1;
SELECT a FROM t1 PARTITION (p0);
SELECT * FROM t1;
DROP VIEW v1;
CREATE VIEW v1 AS SELECT a FROM t1 PARTITION (p0) WITH CHECK OPTION;
INSERT INTO v1 VALUES (20);
INSERT INTO v1 VALUES (21);
SELECT * FROM v1;
SELECT * FROM t1;
DROP VIEW v1;
CREATE VIEW v1 AS
SELECT a FROM t1 PARTITION (p0) WHERE a = 30 WITH CHECK OPTION;
INSERT INTO v1 VALUES (30);
INSERT INTO v1 VALUES (31);
INSERT INTO v1 VALUES (32);
SELECT * FROM v1;
SELECT * FROM t1;
DROP VIEW v1;
DROP TABLE t1;
SET @old_default_storage_engine = @@default_storage_engine;
SET @@default_storage_engine = 'InnoDB';

CREATE TABLE t1
(a INT NOT NULL,
 b varchar (64),
 INDEX (b,a),
 PRIMARY KEY (a))
ENGINE = InnoDB
charset latin1
PARTITION BY RANGE (a)
SUBPARTITION BY HASH (a) SUBPARTITIONS 2
(PARTITION pNeg VALUES LESS THAN (0)
 (SUBPARTITION subp0,
  SUBPARTITION subp1),
 PARTITION `p0-9` VALUES LESS THAN (10)
 (SUBPARTITION subp2,
  SUBPARTITION subp3),
 PARTITION `p10-99` VALUES LESS THAN (100)
 (SUBPARTITION subp4,
  SUBPARTITION subp5),
 PARTITION `p100-99999` VALUES LESS THAN (100000)
 (SUBPARTITION subp6,
  SUBPARTITION subp7));
INSERT INTO t1 PARTITION () VALUES (1, "error");
INSERT INTO t1 PARTITION (pNonExisting) VALUES (1, "error");
INSERT INTO t1 PARTITION (pNeg, pNonExisting) VALUES (1, "error");
INSERT INTO t1 PARTITION (pNeg, pNeg) VALUES (-1, "pNeg(-subp1)");
INSERT INTO t1 PARTITION (pNeg, subp0) VALUES (-3, "pNeg(-subp1)");
INSERT INTO t1 PARTITION (pNeg, subp0) VALUES (-2, "(pNeg-)subp0");
INSERT INTO t1 PARTITION (`p100-99999`) VALUES (100, "`p100-99999`(-subp6)"), (101, "`p100-99999`(-subp7)"), (1000, "`p100-99999`(-subp6)");
INSERT INTO t1 PARTITION(`p10-99`,subp3) VALUES (1, "subp3"), (10, "p10-99");
INSERT INTO t1 PARTITION(subp3) VALUES (3, "subp3");
INSERT INTO t1 PARTITION(`p0-9`) VALUES (5, "p0-9:subp3");
INSERT INTO t1 PARTITION (pNeg, pNeg) VALUES (1, "error");
INSERT INTO t1 PARTITION (pNeg, subp0) VALUES (1, "error");
INSERT INTO t1 PARTITION (`p100-99999`) VALUES (1, "error"), (10, "error");
INSERT INTO t1 VALUES (1000000, "error"), (9999999, "error");
INSERT INTO t1 PARTITION (`p100-99999`) VALUES (1000000, "error"), (9999999, "error");
INSERT INTO t1 PARTITION (pNeg, subp4) VALUES (-7, "pNeg(-subp1)"), (-10, "pNeg(-subp0)"), (-1, "pNeg(-subp1)"), (-99, "pNeg(-subp1)");

SELECT * FROM t1 ORDER BY a;

SET @save_innodb_stats_on_metadata=@@global.innodb_stats_on_metadata;
SET @@global.innodb_stats_on_metadata=ON;
SELECT PARTITION_NAME, SUBPARTITION_NAME, TABLE_ROWS
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_SCHEMA = 'test'
AND TABLE_NAME = 't1' ORDER BY SUBPARTITION_NAME;
SET @@global.innodb_stats_on_metadata=@save_innodb_stats_on_metadata;
SELECT * FROM t1 PARTITION (pNonexistent);
SELECT * FROM t1 PARTITION (subp2);
SELECT * FROM t1 PARTITION (subp2,pNeg) AS TableAlias;
SELECT * FROM t1 PARTITION (subp3) AS TableAlias;
SELECT COUNT(*) FROM t1 PARTITION (`p10-99`);
SELECT * FROM t1 WHERE a = 1000000;
SELECT * FROM t1 PARTITION (pNeg) WHERE a = 100;
SELECT * FROM t1 PARTITION;
SELECT * FROM t1 `PARTITION`;
SELECT * FROM t1 AS PARTITION;
SELECT * FROM t1 AS `PARTITION`;
SELECT * FROM t1 PARTITION (pNeg);
SELECT * FROM t1 PARTITION (pNeg);
DELETE FROM t1 PARTITION(subp1) WHERE b = "REPLACEd by REPLACE";
SELECT * FROM t1 PARTITION (subp1);
SELECT * FROM t1 PARTITION (pNeg, `p10-99`);
SELECT * FROM t1 PARTITION (pNeg, `p10-99`) INTO OUTFILE 'loadtest.txt';
ALTER TABLE t1 TRUNCATE PARTITION pNeg, `p10-99`;
SELECT * FROM t1 PARTITION (pNeg, `p10-99`);
SELECT * FROM t1 PARTITION (pNeg, `p10-99`);
ALTER TABLE t1 TRUNCATE PARTITION pNeg, `p10-99`;
UPDATE t1 PARTITION(subp0) SET b = concat(b, ', Updated');
SELECT * FROM t1 PARTITION (subp0) ORDER BY a;
UPDATE t1 PARTITION(subp0) SET b = concat(b, ', Updated2') WHERE a = -2;
UPDATE t1 PARTITION(subp0) SET a = -4, b = concat(b, ', Updated from a = -2')
WHERE a = -2;
UPDATE t1 PARTITION(subp0) SET b = concat(b, ', Updated2') WHERE a = 100;
UPDATE t1 PARTITION(subp0) SET a = -2, b = concat(b, ', Updated from a = 100')
WHERE a = 100;
SET a = -2, b = concat(b, ', Updated from a = 100') WHERE a = 100;
UPDATE t1 PARTITION(`p100-99999`) SET a = -2, b = concat(b, ', Updated from a = 100')
WHERE a = 100;
UPDATE t1 PARTITION(`p100-99999`, pNeg) SET a = -4, b = concat(b, ', Updated from a = 100')
WHERE a = 100;
UPDATE t1 PARTITION(`p100-99999`, pNeg) SET a = -222, b = concat(b, ', Updated from a = 100')
WHERE a = 100;

SELECT * FROM t1 ORDER BY a;
UPDATE t1 SET b = concat(b, ', Updated2') WHERE a = 1000000;
UPDATE t1 PARTITION (pNeg) SET b = concat(b, ', Updated2') WHERE a = 1000000;

UPDATE t1 PARTITION (subp7) SET b = concat(b, ', Updated to 103'), a = 103 WHERE a = 101;
UPDATE t1 PARTITION (`p100-99999`) SET b = concat(b, ', Updated to 110'), a = 110 WHERE a = 103;
SELECT * FROM t1 ORDER BY b, a;
DELETE FROM t1 PARTITION (pNeg) WHERE a = -1;
DELETE FROM t1 PARTITION (subp1) WHERE b like '%subp1%';

DELETE FROM t1 PARTITION (subp1) WHERE b = 'p0-9:subp3';
DELETE FROM t1 PARTITION (`p0-9`) WHERE b = 'p0-9:subp3';
CREATE TABLE t2 LIKE t1;
INSERT INTO t2 PARTITION (`p10-99`, subp3, `p100-99999`) SELECT * FROM t1 PARTITION (subp3, `p10-99`, `p100-99999`);
ALTER TABLE t2 TRUNCATE PARTITION `p10-99`, `p0-9`, `p100-99999`;
INSERT INTO t2 PARTITION (subp3) SELECT * FROM t1 PARTITION (subp3, `p10-99`, `p100-99999`);
INSERT IGNORE INTO t2 PARTITION (subp3) SELECT * FROM t1 PARTITION (subp3, `p10-99`, `p100-99999`);
INSERT INTO t2 SELECT * FROM t1 PARTITION (subp3, `p10-99`, `p100-99999`);

CREATE TABLE t3 SELECT * FROM t1 PARTITION (pNeg,subp3,`p100-99999`);
SELECT VARIABLE_NAME, VARIABLE_VALUE
  FROM performance_schema.status_by_thread
  WHERE VARIABLE_NAME IN ('Handler_read_first', 'Handler_read_next', 'Handler_write')
    AND VARIABLE_VALUE > 0
    AND THREAD_ID IN (SELECT thread_id from test.thread_to_monitor);
SELECT * FROM t1;
SELECT * FROM t2;
SELECT * FROM t3;
DELETE t1 PARTITION (pNeg), t3 FROM t1, t3
WHERE t1.a = t3.a AND t3.b = 'subp3';
DELETE t1, t2 FROM t1 PARTITION (pNeg), t3, t2 PARTITION (subp3)
WHERE t1.a = t3.a AND t3.b = 'subp3' AND t3.a = t2.a;
DELETE FROM t2, t3 USING t2, t3, t1 WHERE 0;
DELETE FROM t2, t3 USING t2 PARTITION (`p0-9`), t3, t1 PARTITION (subp3)
WHERE t1.a = t3.a AND t3.b = 'subp3' AND t2.a = t1.a;
SELECT * FROM t1 ORDER BY a;
SELECT * FROM t2 ORDER BY a;
SELECT * FROM t3 ORDER BY a;
ALTER TABLE t1 TRUNCATE PARTITION pNeg;
SELECT * FROM t3 PARTITION (pNeg);

DROP TABLE t1, t2, t3;
drop table if exists t1,t2,t3,t4,t5,t6,t7,t8,t9;

CREATE TABLE `t1` (
`id` int(11) default NULL
) DEFAULT CHARSET=latin1
PARTITION BY RANGE (id) (
PARTITION p0 VALUES LESS THAN (6),
PARTITION p1 VALUES LESS THAN (11),
PARTITION p2 VALUES LESS THAN (16),
PARTITION p3 VALUES LESS THAN (21));

INSERT INTO `t1` VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10),
(11), (12), (13), (14), (15), (16), (17), (18), (19), (20);
SELECT * FROM t1;
SELECT * FROM t1 PARTITION (p0);
SELECT * FROM t1 PARTITION (p1);
SELECT * FROM t1 PARTITION (p2);
SELECT * FROM t1 PARTITION (p3);
SELECT * FROM t1 PARTITION (p3) WHERE id = 2;
SELECT * FROM t1 PARTITION (foo);

-- now try indexes
CREATE TABLE `t2` (
`id` int(11) NOT NULL DEFAULT 0,
PRIMARY KEY (`id`)
) DEFAULT CHARSET=latin1
PARTITION BY RANGE (id) (
PARTITION p0 VALUES LESS THAN (6),
PARTITION p1 VALUES LESS THAN (11),
PARTITION p2 VALUES LESS THAN (16),
PARTITION p3 VALUES LESS THAN (21));

INSERT INTO `t2` VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10),
(11), (12), (13), (14), (15), (16), (17), (18), (19), (20);
SELECT * FROM t2;
SELECT * FROM t2 PARTITION (p0);
SELECT * FROM t2 PARTITION (p1);
SELECT * FROM t2 PARTITION (p2);
SELECT * FROM t2 PARTITION (p3);
SELECT * FROM t2 PARTITION (p3) ORDER BY id;
SELECT * FROM t2 PARTITION (p3) WHERE id = 2;
SELECT * FROM t2 PARTITION (foo);


CREATE TABLE `t3` (
  `id` int(32) default NULL,
  `name` varchar(32) default NULL
) DEFAULT CHARSET=latin1 
PARTITION BY LIST (id) (
  PARTITION p0 VALUES IN (1,3,5,7),
  PARTITION p1 VALUES IN (0,2,4,6,8),
  PARTITION p2 VALUES IN (9,10,11,12,13)
);

INSERT INTO `t3` VALUES (1,'first'), (3,'third'),(5,'fifth'),(7,'seventh'),(0,'zilch'),(2,'second'),(4,'fourth'),(6,'sixth'),(8,'eighth'),(9,'ninth'),(10,'tenth'),(11,'eleventh'),(12,'twelfth'),(13,'thirteenth');
SELECT * FROM `t3`;
SELECT * FROM `t3` PARTITION (p0);
SELECT * FROM `t3` PARTITION (p1);
SELECT * FROM `t3` PARTITION (p2);
SELECT * FROM `t3` PARTITION (p2) ORDER BY id;

DROP TABLE IF EXISTS `t4`;
CREATE TABLE `t4` (
  `id` int(32) default NULL
) DEFAULT CHARSET=latin1 PARTITION BY HASH (id) ;

INSERT INTO `t4` SELECT * FROM `t2`;
INSERT INTO `t4` SELECT * FROM `t2` ORDER BY id;

CREATE TABLE `t5` (
  id int(32),
  name varchar(64),
  purchased date)
PARTITION BY RANGE( YEAR(purchased) )
    SUBPARTITION BY HASH( TO_DAYS(purchased) ) (
        PARTITION p0 VALUES LESS THAN (1990) (
            SUBPARTITION s0,
            SUBPARTITION s1
        ),
        PARTITION p1 VALUES LESS THAN (2000) (
            SUBPARTITION s2,
            SUBPARTITION s3
        ),
        PARTITION p2 VALUES LESS THAN MAXVALUE (
            SUBPARTITION s4,
            SUBPARTITION s5
        )
    );

INSERT INTO `t5` VALUES (1, 'aaaaaaa', '2006-01-05 00:00:00');
INSERT INTO `t5` VALUES (2, 'bbbbbbb', '2005-08-05 00:00:00');
INSERT INTO `t5` VALUES (3, 'ccccccc', '1985-08-07 00:00:00');
INSERT INTO `t5` VALUES (4, 'ddddddd', '2000-01-01 00:00:00');
INSERT INTO `t5` VALUES (5, 'eeeeeee', '1999-12-01 00:00:00');
INSERT INTO `t5` VALUES (6, 'fffffff', '2003-11-12 00:00:00');
INSERT INTO `t5` VALUES (7, 'ggggggg', '1990-01-05 00:00:00');
INSERT INTO `t5` VALUES (8, 'hhhhhhh', '1978-01-05 00:00:00');
INSERT INTO `t5` VALUES (9, 'iiiiiii', '1979-01-05 00:00:00');
INSERT INTO `t5` VALUES (10, 'jjjjjjj', '1992-01-05 00:00:00');
INSERT INTO `t5` VALUES (11, 'kkkkkkk', '1993-01-05 00:00:00');
INSERT INTO `t5` VALUES (12, 'mmmmmmm', '1994-01-05 00:00:00');
INSERT INTO `t5` VALUES (13, 'nnnnnnn', '1989-01-05 00:00:00');
INSERT INTO `t5` VALUES (14, 'ooooooo', '1983-12-05 00:00:00');
INSERT INTO `t5` VALUES (15, 'ppppppp', '1986-06-05 00:00:00');
INSERT INTO `t5` VALUES (16, 'qqqqqqq', '1974-04-11 00:00:00');
INSERT INTO `t5` VALUES (17, 'qqqqqqq', '1960-03-15 00:00:00');
INSERT INTO `t5` VALUES (18, 'sssssss', '1950-09-23 00:00:00');
INSERT INTO `t5` VALUES (19, 'ttttttt', '1999-08-02 00:00:00');
INSERT INTO `t5` VALUES (20, 'uuuuuuu', '1994-05-28 00:00:00');
SELECT * FROM `t5`;
SELECT * FROM `t5` PARTITION(p0) ORDER BY id;
SELECT * FROM `t5` PARTITION(s0) ORDER BY id;
SELECT * FROM `t5` PARTITION(s1) ORDER BY id;
SELECT * FROM `t5` PARTITION(p1) ORDER BY id;
SELECT * FROM `t5` PARTITION(s2) ORDER BY id;
SELECT * FROM `t5` PARTITION(s3) ORDER BY id;
SELECT * FROM `t5` PARTITION(p2) ORDER BY id;
SELECT * FROM `t5` PARTITION(s4) ORDER BY id;
SELECT * FROM `t5` PARTITION(s5) ORDER BY id;
drop table t1,t2,t3,t4,t5;

-- Tests for working together with partition pruning.
create table t1 (a int) partition by hash(a) partitions 3;
insert into t1 values(1),(2),(3);

drop table t1;
CREATE TABLE t1
(a INT NOT NULL,
 b varchar (64),
 INDEX (b,a),
 PRIMARY KEY (a))
PARTITION BY RANGE (a)
SUBPARTITION BY HASH (a) SUBPARTITIONS 3
(PARTITION pNeg VALUES LESS THAN (0)
 (SUBPARTITION subp0,
  SUBPARTITION subp1,
  SUBPARTITION subp2),
 PARTITION `p0-29` VALUES LESS THAN (30)
 (SUBPARTITION subp3,
  SUBPARTITION subp4,
  SUBPARTITION subp5),
 PARTITION `p30-299` VALUES LESS THAN (300)
 (SUBPARTITION subp6,
  SUBPARTITION subp7,
  SUBPARTITION subp8),
 PARTITION `p300-2999` VALUES LESS THAN (3000)
 (SUBPARTITION subp9,
  SUBPARTITION subp10,
  SUBPARTITION subp11),
 PARTITION `p3000-299999` VALUES LESS THAN (300000)
 (SUBPARTITION subp12,
  SUBPARTITION subp13,
  SUBPARTITION subp14));

INSERT INTO t1 VALUES (-9, "negative nine"), (-8, "-8"), (-7, "-7"), (-6, "-6"), (-5, "-5"), (-4, "-4"), (-3, "-3"), (-2, "-2"), (-1, "-1");
INSERT INTO t1 VALUES (9, "nine"), (8, "8"), (7, "7"), (6, "6"), (5, "5"), (4, "4"), (3, "3"), (2, "2"), (1, "1");
INSERT INTO t1 VALUES (39, "Thirty nine"), (38, "38"), (37, "37"), (36, "36"), (35, "35"), (34, "34"), (33, "33"), (32, "32"), (31, "31");
INSERT INTO t1 VALUES (339, "Three hundred thirty nine"), (338, "338"), (337, "337"), (336, "336"), (335, "335"), (334, "334"), (333, "333"), (332, "332"), (331, "331");
INSERT INTO t1 VALUES (3339, "Three thousand three hundred thirty nine"), (3338, "3338"), (3337, "3337"), (3336, "3336"), (3335, "3335"), (3334, "3334"), (3333, "3333"), (3332, "3332"), (3331, "3331");
SELECT * FROM t1;
SELECT * FROM t1 PARTITION (subp3);

DELETE FROM t1 PARTITION (subp3);
SELECT * FROM t1;
SELECT * FROM t1 PARTITION (subp3);

DELETE FROM t1 PARTITION (`p0-29`);
SELECT * FROM t1;
SELECT * FROM t1 PARTITION (`p0-29`);

ALTER TABLE t1 PARTITION BY HASH (a) PARTITIONS 3;

DELETE FROM t1 PARTITION (p2);
SELECT * FROM t1;
SELECT * FROM t1 PARTITION (p2);

DROP TABLE t1;
CREATE TEMPORARY TABLE t1 (a INT);
SELECT * FROM t1 PARTITION(pNonexisting);
DROP TEMPORARY TABLE t1;
CREATE TABLE t1 (a INT) PARTITION BY HASH (a) PARTITIONS 3;
CREATE TABLE t2 LIKE t1 PARTITION (p0, p2);
DROP TABLE t1;

DROP TABLE test.thread_to_monitor;

SET @@default_storage_engine = @old_default_storage_engine;