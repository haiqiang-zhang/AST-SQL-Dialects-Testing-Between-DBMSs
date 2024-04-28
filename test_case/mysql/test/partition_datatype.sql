drop table if exists t1;

-- echo -- test with not null
create table t1 (a bit not null) partition by key (a);
insert into t1 values (b'1');
select hex(a) from t1 where a = b'1';
drop table t1;
create table t1 (a tinyint not null) partition by key (a);
insert into t1 values (2);
select * from t1 where a = 2;
drop table t1;
create table t1 (a smallint not null) partition by key (a);
insert into t1 values (2);
select * from t1 where a = 2;
drop table t1;
create table t1 (a mediumint not null) partition by key (a);
insert into t1 values (2);
select * from t1 where a = 2;
drop table t1;
create table t1 (a int not null) partition by key (a);
insert into t1 values (2);
select * from t1 where a = 2;
drop table t1;
create table t1 (a bigint not null) partition by key (a);
insert into t1 values (2);
select * from t1 where a = 2;
drop table t1;
create table t1 (a float not null) partition by key (a);
insert into t1 values (0.5);
select * from t1 where a = 0.5;
drop table t1;
create table t1 (a double not null) partition by key (a);
insert into t1 values (0.5);
select * from t1 where a = 0.5;
drop table t1;
create table t1 (a decimal(4,2) not null) partition by key (a);
insert into t1 values (2.1);
select * from t1 where a = 2.1;
drop table t1;
create table t1 (a date not null) partition by key (a);
insert into t1 values ('2001-01-01');
select * from t1 where a = '2001-01-01';
drop table t1;
create table t1 (a datetime not null) partition by key (a);
insert into t1 values ('2001-01-01 01:02:03');
select * from t1 where a = '2001-01-01 01:02:03';
drop table t1;
create table t1 (a timestamp not null) partition by key (a);
insert into t1 values ('2001-01-01 01:02:03');
select * from t1 where a = '2001-01-01 01:02:03';
drop table t1;
create table t1 (a time not null) partition by key (a);
insert into t1 values ('01:02:03');
select * from t1 where a = '01:02:03';
drop table t1;
create table t1 (a year not null) partition by key (a);
insert into t1 values ('2001');
select * from t1 where a = '2001';
drop table t1;
create table t1 (a varchar(10) character set utf8mb3 not null) partition by key (a);
insert into t1 values ('abc');
select * from t1 where a = 'abc';
drop table t1;
create table t1 (a varchar(300) character set utf8mb3 not null) partition by key (a);
insert into t1 values ('abc');
select * from t1 where a = 'abc';
drop table t1;
create table t1 (a varchar(10) character set latin1 not null) partition by key (a);
insert into t1 values ('abc');
select * from t1 where a = 'abc';
drop table t1;
create table t1 (a varchar(300) character set latin1 not null) partition by key (a);
insert into t1 values ('abc');
select * from t1 where a = 'abc';
drop table t1;
create table t1 (a char(10) character set utf8mb3 not null) partition by key (a);
insert into t1 values ('abc');
select * from t1 where a = 'abc';
drop table t1;
create table t1 (a char(10) character set latin1 not null) partition by key (a);
insert into t1 values ('abc');
select * from t1 where a = 'abc';
drop table t1;
create table t1 (a enum('y','n') not null) partition by key (a);
insert into t1 values ('y');
select * from t1 where a = 'y';
drop table t1;
create table t1 (a set('y','n') not null) partition by key (a);
insert into t1 values ('y');
select * from t1 where a = 'y';
drop table t1;
create table t1 (a bit) partition by key (a);
insert into t1 values (b'1');
insert into t1 values (NULL);
select hex(a) from t1 where a = b'1';
select hex(a) from t1 where a is NULL;
select hex(a) from t1 order by a;
drop table t1;
create table t1 (a tinyint) partition by key (a);
insert into t1 values (2);
select * from t1 where a = 2;
drop table t1;
create table t1 (a smallint) partition by key (a);
insert into t1 values (2);
select * from t1 where a = 2;
drop table t1;
create table t1 (a mediumint) partition by key (a);
insert into t1 values (2);
select * from t1 where a = 2;
drop table t1;
create table t1 (a int) partition by key (a);
insert into t1 values (2);
select * from t1 where a = 2;
drop table t1;
create table t1 (a bigint) partition by key (a);
insert into t1 values (2);
select * from t1 where a = 2;
drop table t1;
create table t1 (a float) partition by key (a);
insert into t1 values (0.5);
select * from t1 where a = 0.5;
drop table t1;
create table t1 (a double) partition by key (a);
insert into t1 values (0.5);
select * from t1 where a = 0.5;
drop table t1;
create table t1 (a decimal(4,2)) partition by key (a);
insert into t1 values (2.1);
select * from t1 where a = 2.1;
drop table t1;
create table t1 (a date) partition by key (a);
insert into t1 values ('2001-01-01');
select * from t1 where a = '2001-01-01';
drop table t1;
create table t1 (a datetime) partition by key (a);
insert into t1 values ('2001-01-01 01:02:03');
select * from t1 where a = '2001-01-01 01:02:03';
drop table t1;
create table t1 (a timestamp null) partition by key (a);
insert into t1 values ('2001-01-01 01:02:03');
select * from t1 where a = '2001-01-01 01:02:03';
drop table t1;
create table t1 (a time) partition by key (a);
insert into t1 values ('01:02:03');
select * from t1 where a = '01:02:03';
drop table t1;
create table t1 (a year) partition by key (a);
insert into t1 values ('2001');
select * from t1 where a = '2001';
drop table t1;
create table t1 (a varchar(10) character set utf8mb3) partition by key (a);
insert into t1 values ('abc');
select * from t1 where a = 'abc';
drop table t1;
create table t1 (a varchar(300) character set utf8mb3) partition by key (a);
insert into t1 values ('abc');
select * from t1 where a = 'abc';
drop table t1;
create table t1 (a varchar(10) character set latin1) partition by key (a);
insert into t1 values ('abc');
select * from t1 where a = 'abc';
drop table t1;
create table t1 (a varchar(300) character set latin1) partition by key (a);
insert into t1 values ('abc');
select * from t1 where a = 'abc';
drop table t1;
create table t1 (a char(10) character set utf8mb3) partition by key (a);
insert into t1 values ('abc');
select * from t1 where a = 'abc';
drop table t1;
create table t1 (a char(10) character set latin1) partition by key (a);
insert into t1 values ('abc');
select * from t1 where a = 'abc';
drop table t1;
create table t1 (a enum('y','n')) partition by key (a);
insert into t1 values ('y');
select * from t1 where a = 'y';
drop table t1;
create table t1 (a set('y','n')) partition by key (a);
insert into t1 values ('y');
select * from t1 where a = 'y';
drop table t1;
create table t1 (a varchar(3068)) charset latin1 partition by key (a);
insert into t1 values ('bbbb');
insert into t1 values ('aaaa');
select * from t1 where a = 'aaaa';
select * from t1 where a like 'aaa%';
select * from t1 where a = 'bbbb';
drop table t1;
create table t1 (a varchar(3069)) charset latin1 partition by key (a);
insert into t1 values ('bbbb');
insert into t1 values ('aaaa');
select * from t1 where a = 'aaaa';
select * from t1 where a like 'aaa%';
select * from t1 where a = 'bbbb';
drop table t1;
create table t1 (a varchar(3070) not null) charset latin1 partition by key (a);
insert into t1 values ('bbbb');
insert into t1 values ('aaaa');
select * from t1 where a = 'aaaa';
select * from t1 where a like 'aaa%';
select * from t1 where a = 'bbbb';
drop table t1;
create table t1 (a varchar(3070)) partition by key (a);
create table t1 (a varchar(65533)) charset latin1 partition by key (a);
create table t1 (a varchar(65534) not null) charset latin1 partition by key (a);
create table t1 (a varchar(65535)) charset latin1 partition by key (a);

--
-- Bug#34358: error in key_restore for bitfields with uneven bits
--
create table t1 (a bit(27), primary key (a))
partition by hash (a)
(partition p0, partition p1, partition p2);
insert into t1 values (1),(4),(7),(10),(13),(16),(19),(22),(25),(28),(31),(34);
select hex(a) from t1 where a = 7;
drop table t1;
SET @old_time_zone= @@session.time_zone;
SET @@session.time_zone = 'UTC';
CREATE TABLE t1
(a TIMESTAMP NULL,
 tz varchar(16));
CREATE TABLE t2 LIKE t1;
ALTER TABLE t2 PARTITION BY RANGE (UNIX_TIMESTAMP(a))
(PARTITION `p0` VALUES LESS THAN (0),
 PARTITION `p-2000` VALUES LESS THAN (UNIX_TIMESTAMP('2000-01-01')),
 PARTITION `p-2011-MSK` VALUES LESS THAN (UNIX_TIMESTAMP('2011-03-26 23:00:00')),
 PARTITION `p-2011-MSD-1` VALUES LESS THAN (UNIX_TIMESTAMP('2011-10-29 22:00:00')),
 PARTITION `p-2011-MSD-2` VALUES LESS THAN (UNIX_TIMESTAMP('2011-10-29 23:00:00')),
 PARTITION `p-2012-MSK-1` VALUES LESS THAN (UNIX_TIMESTAMP('2011-10-30 00:00:00')),
 PARTITION `p-2012-MSK-2` VALUES LESS THAN (UNIX_TIMESTAMP('2012-03-24 23:00:00')),
 PARTITION `pEnd` VALUES LESS THAN (UNIX_TIMESTAMP('2038-01-19 03:14:07')),
 PARTITION `pMax` VALUES LESS THAN MAXVALUE);

SET sql_mode = 'NO_ENGINE_SUBSTITUTION';
INSERT INTO t1 VALUES (NULL, 'UTC');
INSERT INTO t1 VALUES ('0000-00-00 00:00:00', 'UTC');
INSERT INTO t1 VALUES ('1901-01-01 00:00:00', 'UTCI');
INSERT INTO t1 VALUES ('1969-12-31 23:59:59', 'UTCI');
INSERT INTO t1 VALUES ('2038-01-19 03:14:08', 'UTCI');
INSERT INTO t1 VALUES ('1970-01-01 00:00:00', 'UTCI');
INSERT INTO t1 VALUES ('1970-01-01 00:00:01', 'UTC');
INSERT INTO t1 VALUES ('1974-02-05 21:28:16', 'UTC');
INSERT INTO t1 VALUES ('2038-01-19 03:14:06', 'UTC');
INSERT INTO t1 VALUES ('2038-01-19 03:14:07', 'UTC');
INSERT INTO t1 VALUES ('2011-03-26 22:59:59', 'UTC');
INSERT INTO t1 VALUES ('2011-03-26 23:00:00', 'UTC');
INSERT INTO t1 VALUES ('2011-03-26 23:00:01', 'UTC');
INSERT INTO t1 VALUES ('2011-10-29 21:59:59', 'UTC');
INSERT INTO t1 VALUES ('2011-10-29 22:00:00', 'UTC');
INSERT INTO t1 VALUES ('2011-10-29 22:00:01', 'UTC');
INSERT INTO t1 VALUES ('2011-10-29 22:59:59', 'UTC');
INSERT INTO t1 VALUES ('2011-10-29 23:00:00', 'UTC');
INSERT INTO t1 VALUES ('2011-10-29 23:00:01', 'UTC');
INSERT INTO t1 VALUES ('2011-10-29 23:59:59', 'UTC');
INSERT INTO t1 VALUES ('2011-10-30 00:00:00', 'UTC');
INSERT INTO t1 VALUES ('2011-10-30 00:00:01', 'UTC');

SET @@session.time_zone = 'Europe/Moscow';
INSERT INTO t1 VALUES (NULL, 'Moscow');
INSERT INTO t1 VALUES ('0000-00-00 00:00:00', 'Moscow');
INSERT INTO t1 VALUES ('0000-00-00 03:00:00', 'MoscowI');
INSERT INTO t1 VALUES ('1901-01-01 00:00:00', 'MoscowI');
INSERT INTO t1 VALUES ('1969-12-31 23:59:59', 'MoscowI');
INSERT INTO t1 VALUES ('1970-01-01 02:29:29', 'MoscowI');
INSERT INTO t1 VALUES ('2038-01-19 06:14:08', 'MoscowI');
INSERT INTO t1 VALUES ('1970-01-01 03:00:00', 'MoscowI');
INSERT INTO t1 VALUES ('2011-03-27 02:00:00', 'MoscowI');
INSERT INTO t1 VALUES ('2011-03-27 02:00:01', 'MoscowI');
INSERT INTO t1 VALUES ('2011-03-27 02:59:59', 'MoscowI');
INSERT INTO t1 VALUES ('1970-01-01 03:00:01', 'Moscow');
INSERT INTO t1 VALUES ('1974-02-05 21:28:16', 'Moscow');
INSERT INTO t1 VALUES ('2038-01-19 06:14:06', 'Moscow');
INSERT INTO t1 VALUES ('2038-01-19 06:14:07', 'Moscow');
INSERT INTO t1 VALUES ('2011-03-27 01:59:59', 'Moscow');
INSERT INTO t1 VALUES ('2011-03-27 03:00:00', 'Moscow');
INSERT INTO t1 VALUES ('2011-03-27 03:00:01', 'Moscow');
INSERT INTO t1 VALUES ('2011-10-30 01:59:59', 'Moscow');
INSERT INTO t1 VALUES ('2011-10-30 02:00:00', 'MoscowD');
INSERT INTO t1 VALUES ('2011-10-30 02:00:01', 'MoscowD');
INSERT INTO t1 VALUES ('2011-10-30 02:59:59', 'MoscowD');
INSERT INTO t1 VALUES ('2011-10-30 03:00:00', 'Moscow');
INSERT INTO t1 VALUES ('2011-10-30 03:00:01', 'Moscow');


SET @@session.time_zone = 'UTC';

INSERT INTO t2 SELECT * FROM t1;

-- Do ANALYZE to get predictable results from I_S and EXPLAIN.
--disable_query_log
--disable_result_log
ANALYZE TABLE t1;

SELECT PARTITION_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_NAME = 't2' ORDER BY PARTITION_NAME;

SELECT * FROM t1 ORDER BY a, tz;
SELECT * FROM t2 ORDER BY a, tz;

SELECT * FROM t2
WHERE a BETWEEN '2011-03-01 00:00:00' and '2011-03-26 23:00:00' ORDER BY a, tz;
SELECT * FROM t2
WHERE a BETWEEN '2011-03-01 00:00:00' and '2011-03-26 23:00:00' ORDER BY a, tz;

SELECT * FROM t2
WHERE a BETWEEN '2011-03-01 00:00:00' and '2011-03-26 22:59:59' ORDER BY a, tz;
SELECT * FROM t2
WHERE a BETWEEN '2011-03-01 00:00:00' and '2011-03-26 22:59:59' ORDER BY a, tz;


SELECT * FROM t2
WHERE a BETWEEN '2011-03-26 22:59:59' and '2011-03-28 00:00:00' ORDER BY a, tz;
SELECT * FROM t2
WHERE a BETWEEN '2011-03-26 22:59:59' and '2011-03-28 00:00:00' ORDER BY a, tz;

SELECT * FROM t2
WHERE a BETWEEN '2011-03-26 23:00:00' and '2011-03-28 00:00:00' ORDER BY a, tz;
SELECT * FROM t2
WHERE a BETWEEN '2011-03-26 23:00:00' and '2011-03-28 00:00:00' ORDER BY a, tz;



SELECT * FROM t2
WHERE a BETWEEN '2011-10-01 00:00:00' and '2011-10-29 23:00:00' ORDER BY a, tz;
SELECT * FROM t2
WHERE a BETWEEN '2011-10-01 00:00:00' and '2011-10-29 23:00:00' ORDER BY a, tz;

SELECT * FROM t2
WHERE a BETWEEN '2011-10-01 00:00:00' and '2011-10-29 22:59:59' ORDER BY a, tz;
SELECT * FROM t2
WHERE a BETWEEN '2011-10-01 00:00:00' and '2011-10-29 22:59:59' ORDER BY a, tz;


SELECT * FROM t2
WHERE a BETWEEN '2011-10-29 22:59:59' and '2011-10-31 00:00:00' ORDER BY a, tz;
SELECT * FROM t2
WHERE a BETWEEN '2011-10-29 22:59:59' and '2011-10-31 00:00:00' ORDER BY a, tz;

SELECT * FROM t2
WHERE a BETWEEN '2011-10-29 23:00:00' and '2011-10-31 00:00:00' ORDER BY a, tz;
SELECT * FROM t2
WHERE a BETWEEN '2011-10-29 23:00:00' and '2011-10-31 00:00:00' ORDER BY a, tz;
DELETE FROM t2 WHERE a = 0;
INSERT INTO t2 VALUES ('1970-01-01 00:00:00', 'UTC');
SELECT COUNT(*) FROM t2;
SELECT COUNT(*) FROM t2 WHERE a = 0;
SELECT * FROM t2 ORDER BY a, tz LIMIT 3;
SELECT * FROM t2 ORDER BY a DESC, tz LIMIT 3;
UPDATE t2 SET a = TIMESTAMPADD(SECOND, 1, a);
SELECT MIN(a), MAX(a) FROM t2;
SELECT COUNT(*) FROM t2;
SELECT COUNT(*) FROM t2 WHERE a = 0;
SELECT PARTITION_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_NAME = 't2' ORDER BY PARTITION_NAME;
SELECT * FROM t2 ORDER BY a, tz;
UPDATE t2 STRAIGHT_JOIN (SELECT 1) AS dt SET a = TIMESTAMPADD(SECOND, 1, a);
SELECT COUNT(*) FROM t2 WHERE a = 0;
SELECT * FROM t2 ORDER BY a, tz;
INSERT INTO t2 VALUES ('1970-01-01 00:00:00', 'UTC');
SELECT COUNT(*) FROM t2;
SELECT COUNT(*) FROM t2 WHERE a = 0;
SELECT * FROM t2 ORDER BY a, tz LIMIT 3;
SELECT * FROM t2 ORDER BY a DESC, tz LIMIT 3;
UPDATE t2 SET a = TIMESTAMPADD(SECOND, -1, a);
SELECT MIN(a), MAX(a) FROM t2;
SELECT COUNT(*) FROM t2;
SELECT COUNT(*) FROM t2 WHERE a = 0;
SELECT PARTITION_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_NAME = 't2' ORDER BY PARTITION_NAME;
SELECT * FROM t2 ORDER BY a, tz;

SET @@session.time_zone = 'Europe/Moscow';

INSERT INTO t2 SELECT * FROM t1;

SELECT PARTITION_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_NAME = 't2' ORDER BY PARTITION_NAME;

SELECT * FROM t1 ORDER BY a, tz;
SELECT * FROM t2 ORDER BY a, tz;
SELECT * FROM t2
WHERE a BETWEEN '2011-03-01 00:00:00' and '2011-03-27 03:00:00' ORDER BY a, tz;
SELECT * FROM t2
WHERE a BETWEEN '2011-03-01 00:00:00' and '2011-03-27 03:00:00' ORDER BY a, tz;

SELECT * FROM t2
WHERE a BETWEEN '2011-03-01 00:00:00' and '2011-03-27 01:59:59' ORDER BY a, tz;
SELECT * FROM t2
WHERE a BETWEEN '2011-03-01 00:00:00' and '2011-03-27 01:59:59' ORDER BY a, tz;


SELECT * FROM t2
WHERE a BETWEEN '2011-03-26 01:59:59' and '2011-03-28 00:00:00' ORDER BY a, tz;
SELECT * FROM t2
WHERE a BETWEEN '2011-03-26 01:59:59' and '2011-03-28 00:00:00' ORDER BY a, tz;

SELECT * FROM t2
WHERE a BETWEEN '2011-03-26 03:00:00' and '2011-03-28 00:00:00' ORDER BY a, tz;
SELECT * FROM t2
WHERE a BETWEEN '2011-03-26 03:00:00' and '2011-03-28 00:00:00' ORDER BY a, tz;
SELECT * FROM t2
WHERE a BETWEEN '2011-10-01 00:00:00' and '2011-10-29 02:00:00' ORDER BY a, tz;
SELECT * FROM t2
WHERE a BETWEEN '2011-10-01 00:00:00' and '2011-10-29 02:00:00' ORDER BY a, tz;

SELECT * FROM t2
WHERE a BETWEEN '2011-10-01 00:00:00' and '2011-10-29 02:59:59' ORDER BY a, tz;
SELECT * FROM t2
WHERE a BETWEEN '2011-10-01 00:00:00' and '2011-10-29 02:59:59' ORDER BY a, tz;


SELECT * FROM t2
WHERE a BETWEEN '2011-10-01 00:00:00' and '2011-10-29 03:00:00' ORDER BY a, tz;
SELECT * FROM t2
WHERE a BETWEEN '2011-10-01 00:00:00' and '2011-10-29 03:00:00' ORDER BY a, tz;

SELECT * FROM t2
WHERE a BETWEEN '2011-10-01 00:00:00' and '2011-10-29 01:59:59' ORDER BY a, tz;
SELECT * FROM t2
WHERE a BETWEEN '2011-10-01 00:00:00' and '2011-10-29 01:59:59' ORDER BY a, tz;



SELECT * FROM t2
WHERE a BETWEEN '2011-10-29 02:00:00' and '2011-10-31 00:00:00' ORDER BY a, tz;
SELECT * FROM t2
WHERE a BETWEEN '2011-10-29 02:00:00' and '2011-10-31 00:00:00' ORDER BY a, tz;

SELECT * FROM t2
WHERE a BETWEEN '2011-10-29 02:59:59' and '2011-10-31 00:00:00' ORDER BY a, tz;
SELECT * FROM t2
WHERE a BETWEEN '2011-10-29 02:59:59' and '2011-10-31 00:00:00' ORDER BY a, tz;


SELECT * FROM t2
WHERE a BETWEEN '2011-10-29 03:00:00' and '2011-10-31 00:00:00' ORDER BY a, tz;
SELECT * FROM t2
WHERE a BETWEEN '2011-10-29 03:00:00' and '2011-10-31 00:00:00' ORDER BY a, tz;

SELECT * FROM t2
WHERE a BETWEEN '2011-10-29 01:59:59' and '2011-10-31 00:00:00' ORDER BY a, tz;
SELECT * FROM t2
WHERE a BETWEEN '2011-10-29 01:59:59' and '2011-10-31 00:00:00' ORDER BY a, tz;
DELETE FROM t2 WHERE a = 0;
INSERT INTO t2 VALUES ('1970-01-01 00:00:00', 'Moscow');
SELECT COUNT(*) FROM t2;
SELECT COUNT(*) FROM t2 WHERE a = 0;
SELECT * FROM t2 ORDER BY a, tz LIMIT 3;
SELECT * FROM t2 ORDER BY a DESC, tz LIMIT 3;
UPDATE t2 SET a = TIMESTAMPADD(SECOND, 1, a);
SELECT MIN(a), MAX(a) FROM t2;
SELECT COUNT(*) FROM t2;
SELECT COUNT(*) FROM t2 WHERE a = 0;
SELECT PARTITION_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_NAME = 't2' ORDER BY PARTITION_NAME;
SELECT * FROM t2 ORDER BY a, tz;
INSERT INTO t2 VALUES ('1970-01-01 00:00:00', 'Moscow');
SELECT COUNT(*) FROM t2;
SELECT COUNT(*) FROM t2 WHERE a = 0;
SELECT * FROM t2 ORDER BY a, tz LIMIT 3;
SELECT * FROM t2 ORDER BY a DESC, tz LIMIT 3;
UPDATE t2 SET a = TIMESTAMPADD(SECOND, -1, a);
SELECT MIN(a), MAX(a) FROM t2;
SELECT COUNT(*) FROM t2;
SELECT COUNT(*) FROM t2 WHERE a = 0;
SELECT PARTITION_NAME, TABLE_ROWS FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_NAME = 't2' ORDER BY PARTITION_NAME;
SELECT * FROM t2 ORDER BY a, tz;
SET sql_mode = default;
DROP TABLE t1, t2;
SET @@session.time_zone= @old_time_zone;