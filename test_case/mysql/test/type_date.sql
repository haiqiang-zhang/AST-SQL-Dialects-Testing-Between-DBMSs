drop table if exists t1,t2;

create table t1 (a char(16), b date, c datetime);
insert into t1 SET a='test 2000-01-01', b='2000-01-01', c='2000-01-01';
select * from t1 where c = '2000-01-01';
select * from t1 where b = '2000-01-01';
drop table t1;

--
-- problem with date conversions
--

CREATE TABLE t1 (name char(6),cdate date);
INSERT INTO t1 VALUES ('name1','1998-01-01');
INSERT INTO t1 VALUES ('name2','1998-01-01');
INSERT INTO t1 VALUES ('name1','1998-01-02');
INSERT INTO t1 VALUES ('name2','1998-01-02');
CREATE TABLE t2 (cdate date, note char(6));
INSERT INTO t2 VALUES ('1998-01-01','note01');
INSERT INTO t2 VALUES ('1998-01-02','note02');
select name,t1.cdate,note from t1,t2 where t1.cdate=t2.cdate and t1.cdate='1998-01-01';
drop table t1,t2;

--
-- Date and BETWEEN
--

CREATE TABLE t1 ( datum DATE );
INSERT INTO t1 VALUES ( "2000-1-1" );
INSERT INTO t1 VALUES ( "2000-1-2" );
INSERT INTO t1 VALUES ( "2000-1-3" );
INSERT INTO t1 VALUES ( "2000-1-4" );
INSERT INTO t1 VALUES ( "2000-1-5" );
SELECT * FROM t1 WHERE datum BETWEEN cast("2000-1-2" as date) AND cast("2000-1-4" as date);
SELECT * FROM t1 WHERE datum BETWEEN cast("2000-1-2" as date) AND datum - INTERVAL 100 DAY;
DROP TABLE t1;

--
-- test of max(date) and having
--

CREATE TABLE t1 (
  user_id char(10),
  summa int(11),
  rdate date
);
INSERT INTO t1 VALUES ('aaa',100,'1998-01-01');
INSERT INTO t1 VALUES ('aaa',200,'1998-01-03');
INSERT INTO t1 VALUES ('bbb',50,'1998-01-02');
INSERT INTO t1 VALUES ('bbb',200,'1998-01-04');
select max(rdate) as s from t1 where rdate < '1998-01-03' having s> "1998-01-01";
select max(rdate) as s from t1 having s="1998-01-04";
select max(rdate+0) as s from t1 having s="19980104";
drop table t1;

--
-- Test of date and not null
--

create table t1 (date date);
insert into t1 values ("2000-08-10"),("2000-08-11");
select date_add(date,INTERVAL 1 DAY),date_add(date,INTERVAL 1 SECOND) from t1;
drop table t1;

--
-- Test problem with DATE_FORMAT
--

CREATE TABLE t1(AFIELD INT);
INSERT INTO t1 VALUES(1);
CREATE TABLE t2(GMT  VARCHAR(32));
INSERT INTO t2 VALUES('GMT-0800');
SELECT DATE_FORMAT("2002-03-06 10:11:12", CONCAT('%a, %d %M %Y %H:%i:%s ', t2.GMT))
FROM t1, t2 GROUP BY t1.AFIELD;
INSERT INTO t1 VALUES(1);
SELECT DATE_FORMAT("2002-03-06 10:11:12", CONCAT('%a, %d %M %Y %H:%i:%s ', t2.GMT)),
       DATE_FORMAT("2002-03-06 10:11:12", CONCAT('%a, %d %M %Y %H:%i:%s ', t2.GMT))
FROM t1,t2 GROUP BY t1.AFIELD;
drop table t1,t2;

--
-- Multiple SELECT DATE_FORMAT gave incorrect results (Bug #4036)
--

CREATE TABLE t1 (f1 time default NULL, f2 time default NULL);
INSERT INTO t1 (f1, f2) VALUES ('09:00', '12:00');
SELECT DATE_FORMAT(f1, "%l.%i %p") , DATE_FORMAT(f2, "%l.%i %p") FROM t1;
DROP TABLE t1;

--
-- Bug#4937: different date -> string conversion when using SELECT ... UNION
-- and INSERT ... SELECT ... UNION
--

CREATE TABLE t1 (f1 DATE);
CREATE TABLE t2 (f2 VARCHAR(8));
CREATE TABLE t3 (f2 CHAR(8));

INSERT INTO t1 VALUES ('1978-11-26');
INSERT INTO t2 SELECT f1+0 FROM t1;
INSERT INTO t2 SELECT f1+0 FROM t1 UNION SELECT f1+0 FROM t1;
INSERT INTO t3 SELECT f1+0 FROM t1;
INSERT INTO t3 SELECT f1+0 FROM t1 UNION SELECT f1+0 FROM t1;
SELECT * FROM t2;
SELECT * FROM t3;

DROP TABLE t1, t2, t3;

-- Test that setting YEAR to invalid string results in default value, not
-- 2000. (Bug #6067)
CREATE TABLE t1 (y YEAR);
INSERT IGNORE INTO t1 VALUES ('abc');
SELECT * FROM t1;
DROP TABLE t1;

--
-- Bug#21677: Wrong result when comparing a DATE and a DATETIME in BETWEEN
--
create table t1(start_date date, end_date date);
insert into t1 values ('2000-01-01','2000-01-02');
select 1 from t1 where cast('2000-01-01 12:01:01' as datetime) between start_date and end_date;
drop table t1;

--
-- Bug #23093: Implicit conversion of 9912101 to date does not match
-- cast(9912101 as date)
--
select @d:=1111;
select year(@d), month(@d), day(@d), cast(@d as date);
select @d:=011111;
select year(@d), month(@d), day(@d), cast(@d as date);
select @d:=1311;
select year(@d), month(@d), day(@d), cast(@d as date);
create table t1 (d  date , dt datetime , ts timestamp);
insert ignore into t1 values (9912101,9912101,9912101);
insert into t1 values (11111,11111,11111);
select * from t1;
drop table t1;

--
-- Bug#30942: select str_to_date from derived table returns varying results
--
SET sql_mode='STRICT_TRANS_TABLES';
CREATE TABLE t1 (
  a INT
);

INSERT INTO t1 VALUES (1);
INSERT INTO t1 VALUES (NULL);

SELECT str_to_date( '', a ) FROM t1;
DROP TABLE t1;
SET sql_mode=default;

--
-- Bug#31221: Optimizer incorrectly identifies impossible WHERE clause
--

CREATE TABLE t1 (a DATE, b INT, PRIMARY KEY (a,b));
--# The current sub test could fail (difference to expected result) if we
--# have just reached midnight.
--# (Bug#41776 type_date.test may fail if run around midnight)
--# Therefore we sleep a bit if we are too close to midnight.
--# The complete test itself needs in average less than 1 second.
--# Therefore a time_distance to midnight of 5 seconds should be sufficient.
if (`SELECT CURTIME() > SEC_TO_TIME(24 * 3600 - 5)`)
{
   -- We are here when CURTIME() is between '23:59:56' and '23:59:59'.
   -- So a sleep time of 5 seconds brings us between '00:00:01' and '00:00:04'.
   --sleep 5
}
INSERT INTO t1 VALUES (DATE(NOW()), 1);
SELECT COUNT(*) FROM t1 WHERE a = NOW();
INSERT INTO t1 VALUES (DATE(NOW()), 2);
SELECT COUNT(*) FROM t1 WHERE a = NOW();
SELECT COUNT(*) FROM t1 WHERE a = NOW() AND b = 1;
ALTER TABLE t1 DROP PRIMARY KEY;
SELECT COUNT(*) FROM t1 WHERE a = NOW();

DROP TABLE t1;

--
-- Bug#28687: Search fails on '0000-00-00' date after sql_mode change
--

CREATE TABLE t1 (a DATE);
CREATE TABLE t2 (a DATE);
CREATE INDEX i ON t1 (a);
INSERT IGNORE INTO t1 VALUES ('0000-00-00'),('0000-00-00');
INSERT IGNORE INTO t2 VALUES ('0000-00-00'),('0000-00-00');
SET sql_mode = 'ALLOW_INVALID_DATES';
SELECT * FROM t1 WHERE a = '0000-00-00';
SELECT * FROM t2 WHERE a = '0000-00-00';
SET SQL_MODE=TRADITIONAL;
SELECT * FROM t1 WHERE a = '0000-00-00';
SELECT * FROM t2 WHERE a = '0000-00-00';
INSERT INTO t1 VALUES ('0000-00-00');
SET SQL_MODE=DEFAULT;
DROP TABLE t1,t2;

--
-- Bug #31928: Search fails on '1000-00-00' date after sql_mode change
--

SET sql_mode = 'ALLOW_INVALID_DATES';
CREATE TABLE t1 (a DATE);
CREATE TABLE t2 (a DATE);
CREATE INDEX i ON t1 (a);
INSERT IGNORE INTO t1 VALUES ('1000-00-00'),('1000-00-00');
INSERT IGNORE INTO t2 VALUES ('1000-00-00'),('1000-00-00');
SELECT * FROM t1 WHERE a = '1000-00-00';
SELECT * FROM t2 WHERE a = '1000-00-00';
SET SQL_MODE=TRADITIONAL;
SELECT * FROM t1 WHERE a = '1000-00-00';
SELECT * FROM t2 WHERE a = '1000-00-00';
INSERT INTO t1 VALUES ('1000-00-00');
SET SQL_MODE=DEFAULT;
DROP TABLE t1,t2;

--
-- Bug #31990: MINUTE() and SECOND() return bogus results when used on a DATE
--

CREATE TABLE t1 SELECT curdate() AS f1;
SELECT hour(f1), minute(f1), second(f1) FROM t1;
DROP TABLE t1;

--
-- Bug#32021: Using Date 000-00-01 in WHERE causes wrong result
--
create table t1 (a date, primary key (a))engine=memory;
insert into t1 values ('0000-01-01'), ('0000-00-01'), ('0001-01-01');
select * from t1 where a between '0000-00-01' and '0000-00-02';
drop table t1;
CREATE TABLE t1 ( the_date DATE, the_time TIME );
INSERT INTO t1 VALUES ( '2010-01-01', '01:01:01' );

SELECT * FROM t1 t11 JOIN t1 t12 ON addtime( t11.the_date, t11.the_time ) = 
                                    addtime( t12.the_date, t12.the_time );

CREATE VIEW v1 AS SELECT * FROM t1;
SELECT * FROM t1 JOIN v1 ON addtime( t1.the_date, t1.the_time ) = 
                            addtime( v1.the_date, v1.the_time );

SELECT * FROM t1 JOIN v1 ON addtime( t1.the_date, t1.the_time ) = 
                            addtime( cast(v1.the_date AS DATETIME), v1.the_time );

DROP TABLE t1;
DROP VIEW v1;

CREATE TABLE t1(a DATE, b YEAR, KEY(a));
INSERT INTO t1 VALUES ('2011-01-01',2011);

SELECT b = CONVERT(a, DATE) FROM t1;
SELECT b = (SELECT CONVERT(a, DATE) FROM t1 GROUP BY a) FROM t1;
SELECT b = CONVERT((SELECT CONVERT(a, DATE) FROM t1 GROUP BY a), DATE) FROM t1;

DROP TABLE t1;

SELECT 1 FROM (SELECT LAST_DAY('0')) a;
SELECT 1 FROM (SELECT MAKEDATE(2011,0)) a;

CREATE TABLE t1 AS
  SELECT LAST_DAY('1970-01-01') AS f1,
         MAKEDATE(1970, 1)      AS f2;
DROP TABLE t1;
set @a=(select min(makedate('111','1'))) ;
select @a;
SET timestamp=UNIX_TIMESTAMP('2001-01-01 00:00:00');
CREATE TABLE t1 (a DATE);
INSERT INTO t1 VALUES ('2001-01-01 23:59:59.4');
INSERT INTO t1 VALUES (TIMESTAMP'2001-01-01 23:59:59.4');
INSERT INTO t1 VALUES (20010101235959.4);
INSERT INTO t1 VALUES (TIME'23:59:59.4');
INSERT INTO t1 VALUES
   (TIMESTAMP'9999-12-30 23:59:59.4'),
   (TIMESTAMP'9999-12-31 23:59:59.4');
SELECT * FROM t1;
DROP TABLE t1;
SET timestamp=DEFAULT;

SET timestamp=UNIX_TIMESTAMP('2001-01-01 00:00:00');
CREATE TABLE t1 (a DATE);
INSERT INTO t1 VALUES ('2001-01-01 23:59:59.9');
INSERT INTO t1 VALUES (TIMESTAMP'2001-01-01 23:59:59.9');
INSERT INTO t1 VALUES (20010101235959.9);
INSERT INTO t1 VALUES (TIME'23:59:59.9');
INSERT INTO t1 VALUES
   (TIMESTAMP'9999-12-30 23:59:59.9'),
   (TIMESTAMP'9999-12-31 23:59:59.9');
SELECT * FROM t1;
DROP TABLE t1;
SET timestamp=DEFAULT;
CREATE TABLE t1 (a DECIMAL(23,4));
INSERT INTO t1 VALUES (NULL),(101010.9999),(-101010.9999);
SELECT a, CAST(a AS DATE) FROM t1;
DROP TABLE t1;
SELECT CAST(CASE WHEN 0 THEN '2001-01-01' END AS DATE);
SELECT CAST(CASE WHEN 0 THEN DATE'2001-01-01' END AS DATE);
CREATE TABLE t1 (a DATE);
INSERT INTO t1 VALUES (NULL);
SELECT * FROM t1 WHERE a NOT IN (DATE'2001-01-01',DATE'2002-02-02');
DROP TABLE t1;
SELECT COALESCE(DATE(NULL));
SELECT CAST(LEAST(DATE(NULL), DATE(NULL)) AS CHAR);
SELECT CAST(LEAST(20010101,20020202) AS DATE);
SELECT CAST(SUM(0) AS DATETIME);
SELECT CAST(SUM(0 + 0e0) AS DATETIME);
SET timestamp=1322115004;
SELECT CAST(UNIX_TIMESTAMP() AS DATE);
SET timestamp=DEFAULT;
SELECT DATE(20110512154559.6 + 0e0);
SELECT DATE(NAME_CONST('a', 0));
SET timestamp=UNIX_TIMESTAMP('2011-11-24');
CREATE TABLE t1 (a TIME);
INSERT INTO t1 VALUES (0);
SELECT DATE(MIN(a)) FROM t1;
DROP TABLE t1;
SET timestamp=DEFAULT;

CREATE TABLE t1(a INT) ENGINE=InnoDB;
CREATE TABLE t2(b CHAR(19));
INSERT INTO t1 VALUES(1);
INSERT INTO t2 VALUES('0000-00-00 00:00:00');
SELECT * FROM t1 WHERE LAST_DAY('0000-00-00 00:00:00') IS NULL;
SELECT * FROM t1 WHERE
LAST_DAY((SELECT b FROM t2 WHERE b = '0000-00-00 00:00:00')) IS NULL;
DROP TABLE t1,t2;
DROP TABLE IF EXISTS t1, t2, t3;
SET @org_mode=@@sql_mode;
SET @@sql_mode='NO_ZERO_DATE,STRICT_ALL_TABLES';
CREATE TABLE t1 (c1 DATE DEFAULT 0);
CREATE TABLE t1 (c1 DATE DEFAULT '0000-00-00');
SET @@sql_mode='NO_ZERO_IN_DATE,STRICT_ALL_TABLES';
CREATE TABLE t1 (c1 DATE DEFAULT '2012-02-00');
SET @@sql_mode='NO_ZERO_DATE';
CREATE TABLE t1 (c1 DATE DEFAULT 0);
CREATE TABLE t2 (c1 DATE DEFAULT '0000-00-00');
SET @@sql_mode='NO_ZERO_IN_DATE';
CREATE TABLE t3 (c1 DATE DEFAULT '2012-02-00');
DROP TABLE t1, t2, t3;
SET @@sql_mode='';
CREATE TABLE t1 (c1 DATE DEFAULT 0);
CREATE TABLE t2 (c1 DATE DEFAULT '0000-00-00');
CREATE TABLE t3 (c1 DATE DEFAULT '2012-02-00');
DROP TABLE t1, t2, t3;

CREATE TABLE t1 (c1 INT);
SET @@sql_mode='NO_ZERO_DATE,STRICT_ALL_TABLES';
ALTER TABLE t1 ADD c2 DATE DEFAULT 0;
ALTER TABLE t1 ADD c2 DATE DEFAULT '0000-00-00';
SET @@sql_mode='NO_ZERO_IN_DATE,STRICT_ALL_TABLES';
ALTER TABLE t1 ADD c2 DATE DEFAULT '2012-02-00';
SET @@sql_mode='NO_ZERO_DATE';
ALTER TABLE t1 ADD c2 DATE DEFAULT 0;
ALTER TABLE t1 ADD c3 DATE DEFAULT '0000-00-00';
SET @@sql_mode='NO_ZERO_IN_DATE';
ALTER TABLE t1 ADD c4 DATE DEFAULT '2012-02-00';
DROP TABLE t1;
CREATE TABLE t1 (c1 int);
SET @@sql_mode='';
ALTER TABLE t1 ADD c2 DATE DEFAULT 0;
ALTER TABLE t1 ADD c3 DATE DEFAULT '0000-00-00';
ALTER TABLE t1 ADD c4 DATE DEFAULT '2012-02-00';
DROP TABLE t1;

SET @@sql_mode= @org_mode;
CREATE TABLE t1(a int);
INSERT INTO t1 VALUE(15.00+adddate('2011-00-00', 1));
DROP TABLE t1;

-- Check prepared statements with various DATE comparisons

set @d_str = '2020-01-01';
set @t_str = '01:01:01';
set @dt_str = '2020-01-01 01:01:01';
set @dt_tz = '2020-01-01 01:01:01+03:00';
set @d_int = 20200101;
set @t_int = 010101;
set @dt_int = 20200101010101;
set @d_dec = 20200101.0;
set @t_dec = 010101.0;
set @dt_dec = 20200101010101.0;
set @d_flt = 20200101E0;
set @t_flt = 010101E0;
set @dt_flt = 20200101010101E0;

-- Executions that supply a date literal will convert the literal to a
-- DATE value, and the comparison should succeed.
-- Executions that supply a time literal will convert the literal to
-- some DATE value, and the comparison will fail.
-- Executions that supply a datetime literal will convert the literal into
-- a DATETIME value. This is incompatible with the expected DATE value and
-- a reprepare is triggered. The DATE literal is extended with '00:00:00' and
-- the comparison will fail.

prepare stmt from "SELECT DATE'2020-01-01' = ?";

CREATE TABLE dt(dt DATETIME);
INSERT INTO dt VALUES('2021-10-10 23:00:00.123456+01:00');

CREATE TABLE d(d DATE);

INSERT INTO d VALUES('2021-10-10 23:00:00.123456+01:00');
INSERT INTO d SELECT * FROM dt;
set @t='2021-10-10 23:00:00.123456+01:00';

SELECT * FROM d;

DROP TABLE d, dt;

CREATE TABLE t(a VARCHAR(100) CHARSET latin1, KEY(a));
INSERT INTO t VALUES ('2023-1-1'), ('2023-01-01');
SELECT * FROM t WHERE a = DATE'2023-01-01';
DROP TABLE t;

CREATE TABLE t (a VARCHAR(10) CHARSET latin1,
                b VARCHAR(10) CHARSET latin1);
INSERT INTO t VALUES
  ('2023-01-01', '2023-01-01'),
  ('2023-01-01', '2023-1-1'),
  ('2023-1-1',   '2023-01-01'),
  ('2023-1-1',   '2023-1-1');
SELECT * FROM t WHERE a = b and b = DATE'2023-01-01';
DROP TABLE t;

-- Complements a test case with the same bug number in type_time. The
-- assertion was only seen when the indexed column was a TIME column,
-- so this test case is only for extra test coverage.
CREATE TABLE t(a DATE, KEY(a));
INSERT INTO t VALUES ('2023-03-15');
SET timestamp = UNIX_TIMESTAMP('2023-03-15 01:02:03');
SELECT * FROM t WHERE a = CURRENT_TIME;
SELECT * FROM t WHERE a = CURRENT_TIMESTAMP;
SELECT * FROM t WHERE a = CURRENT_DATE;
SET timestamp = DEFAULT;
DROP TABLE t;