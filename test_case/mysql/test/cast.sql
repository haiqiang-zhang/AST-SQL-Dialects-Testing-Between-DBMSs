select CAST(1-2 AS UNSIGNED);
select CAST(CAST(1-2 AS UNSIGNED) AS SIGNED INTEGER);
select CAST('10 ' as unsigned integer);
select CAST('10x' as unsigned integer);
select cast(-5 as unsigned) | 1, cast(-5 as unsigned) & -1;
select cast(-5 as unsigned) -1, cast(-5 as unsigned) + 1;
select ~5, cast(~5 as signed);
select cast(5 as unsigned) -6.0;
select cast(NULL as signed), cast(1/0 as signed);
select cast(NULL as unsigned), cast(1/0 as unsigned);
select cast("A" as binary) = "a", cast(BINARY "a" as CHAR) = "A";
select cast("2001-1-1" as DATE), cast("2001-1-1" as DATETIME);
select cast("1:2:3" as TIME);
select CONVERT("2004-01-22 21:45:33",DATE);
select 10+'10';
select 10.0+'10';
select 10E+0+'10';
SELECT CONVERT(TIMESTAMP "2004-01-22 21:45:33" USING latin1);
SELECT CONVERT(TIMESTAMP "2004-01-22 21:45:33", CHAR);
SELECT CONVERT(TIMESTAMP "2004-01-22 21:45:33", CHAR(4));
SELECT CONVERT(TIMESTAMP "2004-01-22 21:45:33", BINARY(4));
select CAST(TIMESTAMP "2004-01-22 21:45:33" AS BINARY(4));
select CAST(0xb3 as signed);
select CAST(0x8fffffffffffffff as signed);
select CAST(0xffffffffffffffff as unsigned);
select CAST(0xfffffffffffffffe as signed);
select cast('-10a' as signed integer);
select cast('a10' as unsigned integer);
select 10+'a';
select 10.0+cast('a' as decimal);
select 10E+0+'a';
select cast('18446744073709551616' as unsigned);
select cast('18446744073709551616' as signed);
select cast('9223372036854775809' as signed);
select cast('-1' as unsigned);
select cast('abc' as signed);
select cast('1a' as signed);
select cast('' as signed);
select hex(cast(_latin1'test' as char character set latin2));
select hex(cast(_koi8r x'D4C5D3D4' as char character set cp1251));
create table t1 select cast(_koi8r x'D4C5D3D4' as char character set cp1251) as t;
drop table t1;
select
  cast(_latin1'ab'  AS char charset binary)    as c1,
  cast(_latin1'a '  AS char charset binary)    as c2,
  cast(_latin1'abc' AS char(2) charset binary) as c3,
  cast(_latin1'a  ' AS char(2) charset binary) as c4,
  hex(cast(_latin1'a'   AS char(2) charset binary)) as c5;
select cast(1000 as CHAR(3) charset binary);
select
  cast(_koi8r x'C6C7'   AS nchar)    as c1,
  cast(_koi8r x'C620'   AS nchar)    as c2,
  cast(_koi8r x'C6C7C8' AS nchar(2)) as c3,
  cast(_koi8r x'C62020' AS nchar(2)) as c4,
  cast(_koi8r x'C6'     AS nchar(2)) as c5;
SELECT
  CAST(_gb2312 x'CAFDBEDD'     AS NATIONAL CHAR)    AS c1,
  CAST(_gb2312 x'CAFD20'       AS NATIONAL CHAR)    AS c2,
  CAST(_gb2312 x'CAFDBEDDBFE2' AS NATIONAL CHAR(2)) AS c3,
  CAST(_gb2312 x'CAFD2020'     AS NATIONAL CHAR(2)) AS c4,
  CAST(_gb2312 x'CAFD'         AS NATIONAL CHAR(2)) AS c5;
create table t1 (a binary(4), b char(4) character set koi8r);
insert into t1 values (_binary x'D4C5D3D4',_binary x'D4C5D3D4');
select hex(a),hex(b),hex(cast(a as char character set cp1251)),hex(cast(b as binary)) from t1;
drop table t1;
select cast("2001-1-1" as date) = "2001-01-01";
select cast("2001-1-1" as datetime) = "2001-01-01 00:00:00";
select cast("1:2:3" as TIME) = "1:02:03";
select cast(NULL as DATE);
select cast(NULL as BINARY);
CREATE TABLE t1 (a enum ('aac','aab','aaa') not null);
INSERT INTO t1 VALUES ('aaa'),('aab'),('aac');
SELECT a, CAST(a AS CHAR charset binary) FROM t1 ORDER BY CAST(a AS UNSIGNED);
SELECT a, CAST(a AS CHAR(3) charset binary) FROM t1 ORDER BY CAST(a AS CHAR(2) charset binary), a;
SELECT a, CAST(a AS UNSIGNED) FROM t1 ORDER BY CAST(a AS CHAR charset binary);
SELECT a, CAST(a AS CHAR(2) charset binary ) FROM t1 ORDER BY CAST(a AS CHAR(3) charset binary), a;
DROP TABLE t1;
select date_add(cast('2004-12-30 12:00:00' as date), interval 0 hour);
select timediff(cast('2004-12-30 12:00:00' as time), '12:00:00');
select timediff(cast('1 12:00:00' as time), '12:00:00');
select cast(18446744073709551615 as unsigned);
select cast(18446744073709551615 as signed);
select cast('18446744073709551615' as unsigned);
select cast('18446744073709551615' as signed);
select cast('9223372036854775807' as signed);
select cast(concat('184467440','73709551615') as unsigned);
select cast(concat('184467440','73709551615') as signed);
select cast(repeat('1',20) as unsigned);
select cast(repeat('1',20) as signed);
select cast(1.0e+300 as signed int);
CREATE TABLE t1 (f1 double);
INSERT INTO t1 SET f1 = -1.0e+30;
INSERT INTO t1 SET f1 = +1.0e+30;
SELECT f1 AS double_val, CAST(f1 AS SIGNED INT) AS cast_val FROM t1;
DROP TABLE t1;
select isnull(date(NULL)), isnull(cast(NULL as DATE));
SELECT CAST(cast('01-01-01' as date) AS UNSIGNED);
SELECT CAST(cast('01-01-01' as date) AS SIGNED);
select cast('1.2' as decimal(3,2));
select 1e18 * cast('1.2' as decimal(3,2));
select cast(cast('1.2' as decimal(3,2)) as signed);
select cast(@v1 as decimal(22, 2));
select cast(-1e18 as decimal(22,2));
create table t1(s1 time);
insert into t1 values ('11:11:11');
select cast(s1 as decimal(7,2)) from t1;
drop table t1;
CREATE TABLE t1 (v varchar(10), tt tinytext, t text,
                 mt mediumtext, lt longtext);
INSERT INTO t1 VALUES ('1.01', '2.02', '3.03', '4.04', '5.05');
SELECT CAST(v AS DECIMAL), CAST(tt AS DECIMAL), CAST(t AS DECIMAL),
       CAST(mt AS DECIMAL), CAST(lt AS DECIMAL) from t1;
DROP TABLE t1;
select cast(NULL as decimal(6)) as t1;
select hex(cast('a' as char(2) binary));
select hex(cast('a' as binary(2)));
select hex(cast('a' as char(2) binary));
CREATE TABLE t1 (d1 datetime);
INSERT INTO t1(d1) VALUES ('2007-07-19 08:30:00'), (NULL),
  ('2007-07-19 08:34:00'), (NULL), ('2007-07-19 08:36:00');
SELECT cast(date(d1) as signed) FROM t1;
drop table t1;
CREATE TABLE t1 (f1 DATE);
INSERT INTO t1 VALUES ('2007-07-19'), (NULL);
SELECT HOUR(f1),
       MINUTE(f1),
       SECOND(f1) FROM t1;
SELECT HOUR(CAST('2007-07-19' AS DATE)),
       MINUTE(CAST('2007-07-19' AS DATE)),
       SECOND(CAST('2007-07-19' AS DATE));
SELECT HOUR(CAST(NULL AS DATE)),
       MINUTE(CAST(NULL AS DATE)),
       SECOND(CAST(NULL AS DATE));
SELECT HOUR(NULL),
       MINUTE(NULL),
       SECOND(NULL);
DROP TABLE t1;
CREATE TABLE t1(a tinyint);
INSERT INTO t1 VALUES (127);
SELECT 1 FROM
(
 SELECT CONVERT(t2.a USING utf8mb3) FROM t1, t1 t2 LIMIT 1
) AS s LIMIT 1;
DROP TABLE t1;
SELECT CONVERT('a', BINARY(2049));
SELECT CONVERT('a', CHAR(2049));
CREATE TABLE t1 (a VARCHAR(50));
SELECT a FROM t1 
WHERE CAST(a as BINARY)=x'62736D697468' 
  AND CAST(a AS BINARY)=x'65736D697468';
DROP TABLE t1;
SELECT CAST( 'a' AS BINARY(429496729));
SELECT CAST( 'a' AS BINARY(4294967294));
SELECT CAST( 'a' AS BINARY(4294967295));
CREATE TABLE t (c1 ENUM('a','b','c'));
INSERT INTO t VALUES ('a'), ('b'), ('c');
SELECT CAST(c1 AS UNSIGNED) AS c5 FROM t;
SELECT CAST(c1 AS UNSIGNED) AS c5 FROM (SELECT c1 FROM t) t;
DROP TABLE t;
SELECT CAST(1/3 AS FLOAT) as float_col,
       CAST(1/3 AS DOUBLE) as double_col,
       CAST(1/3 AS DOUBLE PRECISION) as double_prec_col,
       CAST(1/3 AS REAL) as real_col;
SELECT CAST(1/3 AS FLOAT(10)), CAST(1/3 AS FLOAT(53));
SELECT ADDDATE(CAST("20010101235959.9" AS DOUBLE), INTERVAL 1 DAY);
SELECT TIMEDIFF(CAST("101112" AS DOUBLE), TIME'101010');
SELECT CAST(DATE'2000-01-01' AS FLOAT), CAST(DATE'2000-01-01' AS DOUBLE);
SELECT CAST(TIME'23:59:59' AS FLOAT), CAST(TIME'23:59:59' AS DOUBLE);
SELECT CAST(TIME'23:59:59.123456' AS FLOAT),
       CAST(TIME'23:59:59.123456' AS DOUBLE);
SELECT CAST(TIMESTAMP'2000-01-01 23:59:59' AS FLOAT),
       CAST(TIMESTAMP'2000-01-01 23:59:59' AS DOUBLE);
SELECT CAST(TIMESTAMP'2000-01-01 23:59:59.123456' AS FLOAT),
       CAST(TIMESTAMP'2000-01-01 23:59:59.123456' AS DOUBLE);
CREATE TABLE t1 as SELECT CAST(1/3 AS FLOAT) as float_col,
                          CAST(1/3 AS DOUBLE) as double_col,
                          CAST(CAST(999.00009 AS DECIMAL(7,4)) AS DOUBLE) as d2;
DROP TABLE t1;
SELECT -1.0 *  CAST(3.14e19 AS DOUBLE);
SELECT CONCAT("value=", CAST("3.4e5" AS FLOAT));
CREATE VIEW v1 AS SELECT CAST(1/3 AS REAL), CAST(1/3 AS FLOAT(2)), CAST(1/3 AS FLOAT(50));
DROP VIEW v1;
SELECT CAST(NULL AS REAL), CAST(NULL AS FLOAT), CAST(NULL AS DOUBLE);
CREATE TABLE t AS SELECT CAST(34 AS REAL);
DROP TABLE t;
CREATE TABLE t AS SELECT CAST(34 AS REAL);
DROP TABLE t;
SELECT MAKETIME(1, 2, CAST("1.6" AS FLOAT));
CREATE TABLE dt_t (dt DATETIME, d DATE, t TIME);
CREATE TABLE n_t (i INT, d DECIMAL, f FLOAT, dc DECIMAL);
DROP TABLE dt_t, n_t;
CREATE TABLE t1 (spID int, userID int, date date);
INSERT INTO t1 VALUES (1,1,'1998-01-01');
INSERT INTO t1 VALUES (2,2,'2001-02-03');
INSERT INTO t1 VALUES (3,1,'1988-12-20');
INSERT INTO t1 VALUES (4,2,'1972-12-12');
DROP TABLE t1;
CREATE TABLE t(c CHAR(64), v VARCHAR(256), txt TEXT, b BINARY(64), vb VARBINARY(32),
               e ENUM ("v1", "v2"), set1 SET('101', '102'), bl  BLOB, i INT,
               si SMALLINT, ti TINYINT, mi MEDIUMINT, bi BIGINT, bt BIT,
               d DECIMAL, f FLOAT, dbl DOUBLE, dt DATETIME, dd  DATE, t TIME,
               y YEAR);
INSERT INTO t
VALUES ("char", "vchar","text", "binary", "varbinary", "v1", '101,102', "blob", 
        2001, 2, 3, 4, 200000002, 0x01, 2001.0, 2001.0, 2001.2,
        "2001-01-02 22:00", "2001-01-02", "20:01", 2010);
DROP TABLE t;
CREATE TABLE t1(a YEAR, b VARCHAR(10));
INSERT INTO t1 VALUES ('1997','random_str');
SELECT STRCMP(a, b) FROM t1;
DROP TABLE t1;
CREATE TABLE t (col_datetime datetime, col_date date, col_time time, col_char char);
insert into t values ('2013-03-15 18:35:20', '2013-03-15', '18:35:20','L'),
                     ('2003-01-10 00:00:23', '2003-01-10', '00:00:23', NULL);
SELECT CAST(col_char AS DATETIME) FROM t;
SELECT col_char /*CAST(col_char as datetime)*/ <> col_datetime FROM t;
SELECT CAST(col_char AS DATE) FROM t;
SELECT col_char <> col_date FROM t;
SELECT CAST(col_char as TIME) FROM t;
SELECT col_char <> col_time FROM t;
DROP TABLE t;
CREATE TABLE `BB` (`col_char_key` char(1));
CREATE TABLE `CC` ( `pk` int, `col_datetime_key` datetime,
KEY `idx_CC_col_datetime_key` (`col_datetime_key`));
INSERT INTO `BB` VALUES ('X');
INSERT INTO `CC` VALUES (1,'2027-03-17 00:10:00'), (2,'2004-11-14 12:46:43');
SELECT COUNT(table1.pk) FROM CC table1 JOIN BB table3 JOIN CC table2
WHERE (table3.col_char_key < table2.col_datetime_key);
DROP TABLE `BB`;
DROP TABLE `CC`;
SELECT CAST(CAST(-1 AS SIGNED) AS YEAR);
SELECT CAST(CAST(-99 AS SIGNED) AS YEAR);
SELECT CAST(CAST(0 AS SIGNED) AS YEAR);
SELECT CAST(CAST(69 AS SIGNED) AS YEAR);
SELECT CAST(CAST(70 AS SIGNED) AS YEAR);
SELECT CAST(CAST(99 AS SIGNED) AS YEAR);
SELECT CAST(CAST(100 AS SIGNED) AS YEAR);
SELECT CAST(CAST(2010 AS SIGNED) AS YEAR);
SELECT CAST(-1.1 AS YEAR);
SELECT CAST(1.1 AS YEAR);
SELECT CAST(0.0 AS YEAR);
SELECT CAST(69.1 AS YEAR);
SELECT CAST(70.1 AS YEAR);
SELECT CAST(100.1 AS YEAR);
SELECT CAST(2010.9 AS YEAR);
SELECT CAST(CAST(-1.1 AS DECIMAL) AS YEAR);
SELECT CAST(CAST(1.1 AS DECIMAL) AS YEAR);
SELECT CAST(CAST(0.0 AS DECIMAL) AS YEAR);
SELECT CAST(CAST(69.1 AS DECIMAL) AS YEAR);
SELECT CAST(CAST(70.1 AS DECIMAL) AS YEAR);
SELECT CAST(CAST(100.1 AS DECIMAL) AS YEAR);
SELECT CAST(CAST(2010.9 AS DECIMAL) AS YEAR);
SELECT CAST("-1" AS YEAR);
SELECT CAST("-99" AS YEAR);
SELECT CAST("0" AS YEAR);
SELECT CAST("69" AS YEAR);
SELECT CAST("70" AS YEAR);
SELECT CAST("99" AS YEAR);
SELECT CAST("100" AS YEAR);
SELECT CAST("2010" AS YEAR);
SELECT CAST("extra" AS YEAR);
SELECT CAST("22extra" AS YEAR);
SELECT CAST("2020extra" AS YEAR);
SELECT CAST(TIMESTAMP'2010-01-01 00:00' AS YEAR);
SELECT CAST(TIMESTAMP'2010-01-01 08:09:10' AS YEAR);
SELECT CAST(TIME'08:09:10' AS YEAR);
SELECT CAST(TIME'00:00:00' AS YEAR);
CREATE TABLE t AS SELECT CAST("2010" AS YEAR);
DROP TABLE t;
SELECT CAST(JSON_EXTRACT('{"key_year":1934}', '$.key_year') AS YEAR);
SELECT CAST(CAST('{"_id":"192312412512"}' AS JSON) AS YEAR);
CREATE TABLE t1 (i INT, j JSON) CHARSET utf8mb4;
INSERT INTO t1 VALUES (0, NULL);
INSERT INTO t1 VALUES (1, '"1901"');
INSERT INTO t1 VALUES (2, 'true');
INSERT INTO t1 VALUES (3, 'false');
INSERT INTO t1 VALUES (4, 'null');
INSERT INTO t1 VALUES (5, '-1');
INSERT INTO t1 VALUES (6, CAST(CAST(1 AS UNSIGNED) AS JSON));
INSERT INTO t1 VALUES (7, '1901');
INSERT INTO t1 VALUES (8, '-1901');
INSERT INTO t1 VALUES (9, '2147483647');
INSERT INTO t1 VALUES (10, '2147483648');
INSERT INTO t1 VALUES (11, '-2147483648');
INSERT INTO t1 VALUES (12, '-2147483649');
INSERT INTO t1 VALUES (13, '3.14');
INSERT INTO t1 VALUES (14, '{}');
INSERT INTO t1 VALUES (15, '[]');
INSERT INTO t1 VALUES (16, CAST(CAST('2015-01-15 23:24:25' AS DATETIME) AS JSON));
INSERT INTO t1 VALUES (17, CAST(CAST('23:24:25' AS TIME) AS JSON));
INSERT INTO t1 VALUES (18, CAST(CAST('2015-01-15' AS DATE) AS JSON));
INSERT INTO t1 VALUES (19, CAST(TIMESTAMP'2015-01-15 23:24:25' AS JSON));
INSERT INTO t1 VALUES (20, CAST(ST_GeomFromText('POINT(1 1)') AS JSON));
INSERT INTO t1 VALUES (21, CAST('1988' AS CHAR CHARACTER SET 'ascii'));
INSERT INTO t1 VALUES (22, CAST(x'07C4' AS JSON));
INSERT INTO t1 VALUES (23, CAST(x'07C407C4' AS JSON));
SELECT i, CAST(j AS YEAR), CAST(j AS SIGNED) FROM t1 ORDER BY i;
DROP TABLE t1;
CREATE TABLE t(numbers ENUM('0','1','2020'), colors ENUM('red', 'green', 'blue'));
INSERT INTO t values('2020', 'blue');
SELECT CAST(numbers AS YEAR), CAST(colors AS YEAR) FROM t;
DROP TABLE t;
CREATE TABLE t(y YEAR);
SELECT * FROM t;
DROP TABLE t;
SELECT CAST(1988 AS YEAR), REPEAT(CAST(1988 AS YEAR), 3) AS c2;
SELECT CONCAT('x', CAST(1988 AS YEAR));
SELECT CAST(1988 AS YEAR) + 1.5e0;
SELECT CAST(CAST(1988 AS YEAR) AS DECIMAL);
SELECT DATE_ADD(CAST(1988 AS YEAR), INTERVAL 1 DAY);
SELECT TIME_TO_SEC(CAST('2030' AS YEAR));
SELECT TIMESTAMPADD(MINUTE, 1, CAST(1988 AS YEAR));
SELECT CAST(CAST(1988 AS YEAR) AS SIGNED);
SELECT CAST(CAST(1988 AS YEAR) AS UNSIGNED);
SELECT CAST(TIMESTAMP'579-10-10 10:10:10' AS YEAR);
SELECT CAST(STR_TO_DATE('nope','%d-%m-%Y') AS YEAR);
SELECT CAST('0000-00-00' AS DATE) AS d1,
       CAST(@zero_date AS DATE) AS d2,
       CAST('0000-00-00 00:00:00.000000' AS DATETIME(6)) AS dt1,
       CAST(@zero_datetime AS DATETIME(6)) AS dt2;
SELECT CAST('2000-01-00' AS DATE) AS d1,
       CAST(@zero_day AS DATE) AS d2,
       CAST('2000-01-00 00:00:00.000000' AS DATETIME(6)) AS dt1,
       CAST(@zero_day_dt AS DATETIME(6)) AS dt2;
SELECT CAST('2000-00-01' AS DATE) AS d1,
       CAST(@zero_month AS DATE) AS d2,
       CAST('2000-00-01 00:00:00.000000' AS DATETIME(6)) AS dt1,
       CAST(@zero_month_dt AS DATETIME(6)) AS dt2;
SELECT CAST('0000-01-01' AS DATE) AS d1,
       CAST(@zero_year AS DATE) AS d2,
       CAST('0000-01-01 00:00:00.000000' AS DATETIME(6)) AS dt1,
       CAST(@zero_year_dt AS DATETIME(6)) AS dt2;
SELECT CAST('2000-02-31' AS DATE) AS d1,
       CAST(@invalid_date AS DATE) AS d2,
       CAST('2000-02-31 00:00:00.000000' AS DATETIME(6)) AS dt1,
       CAST(@invalid_datetime AS DATETIME(6)) AS dt2;
SELECT CAST('YYYY-MM-DD' AS DATE) AS d1,
       CAST(@bad_date AS DATE) AS d2,
       CAST('YYYY-MM-DD HH:MM:SS.ffffff' AS DATETIME(6)) AS dt1,
       CAST(@bad_datetime AS DATETIME(6)) AS dt2;
SELECT CAST('0000-00-00' AS DATE) AS d1,
       CAST(@zero_date AS DATE) AS d2,
       CAST('0000-00-00 00:00:00.000000' AS DATETIME(6)) AS dt1,
       CAST(@zero_datetime AS DATETIME(6)) AS dt2;
SELECT CAST('2000-01-00' AS DATE) AS d1,
       CAST(@zero_day AS DATE) AS d2,
       CAST('2000-01-00 00:00:00.000000' AS DATETIME(6)) AS dt1,
       CAST(@zero_day_dt AS DATETIME(6)) AS dt2;
SELECT CAST('2000-00-01' AS DATE) AS d1,
       CAST(@zero_month AS DATE) AS d2,
       CAST('2000-00-01 00:00:00.000000' AS DATETIME(6)) AS dt1,
       CAST(@zero_month_dt AS DATETIME(6)) AS dt2;
SELECT CAST('0000-01-01' AS DATE) AS d1,
       CAST(@zero_year AS DATE) AS d2,
       CAST('0000-01-01 00:00:00.000000' AS DATETIME(6)) AS dt1,
       CAST(@zero_year_dt AS DATETIME(6)) AS dt2;
SELECT CAST('2000-02-31' AS DATE) AS d1,
       CAST(@invalid_date AS DATE) AS d2,
       CAST('2000-02-31 00:00:00.000000' AS DATETIME(6)) AS dt1,
       CAST(@invalid_datetime AS DATETIME(6)) AS dt2;
SELECT CAST('YYYY-MM-DD' AS DATE) AS d1,
       CAST(@bad_date AS DATE) AS d2,
       CAST('YYYY-MM-DD HH:MM:SS.ffffff' AS DATETIME(6)) AS dt1,
       CAST(@bad_datetime AS DATETIME(6)) AS dt2;
SELECT CAST('0000-00-00' AS DATE) AS d1,
       CAST(@zero_date AS DATE) AS d2,
       CAST('0000-00-00 00:00:00.000000' AS DATETIME(6)) AS dt1,
       CAST(@zero_datetime AS DATETIME(6)) AS dt2;
SELECT CAST('2000-01-00' AS DATE) AS d1,
       CAST(@zero_day AS DATE) AS d2,
       CAST('2000-01-00 00:00:00.000000' AS DATETIME(6)) AS dt1,
       CAST(@zero_day_dt AS DATETIME(6)) AS dt2;
SELECT CAST('2000-00-01' AS DATE) AS d1,
       CAST(@zero_month AS DATE) AS d2,
       CAST('2000-00-01 00:00:00.000000' AS DATETIME(6)) AS dt1,
       CAST(@zero_month_dt AS DATETIME(6)) AS dt2;
SELECT CAST('0000-01-01' AS DATE) AS d1,
       CAST(@zero_year AS DATE) AS d2,
       CAST('0000-01-01 00:00:00.000000' AS DATETIME(6)) AS dt1,
       CAST(@zero_year_dt AS DATETIME(6)) AS dt2;
SELECT CAST('2000-02-31' AS DATE) AS d1,
       CAST(@invalid_date AS DATE) AS d2,
       CAST('2000-02-31 00:00:00.000000' AS DATETIME(6)) AS dt1,
       CAST(@invalid_datetime AS DATETIME(6)) AS dt2;
SELECT CAST('YYYY-MM-DD' AS DATE) AS d1,
       CAST(@bad_date AS DATE) AS d2,
       CAST('YYYY-MM-DD HH:MM:SS.ffffff' AS DATETIME(6)) AS dt1,
       CAST(@bad_datetime AS DATETIME(6)) AS dt2;
SELECT CAST('0000-00-00' AS DATE) AS d1,
       CAST(@zero_date AS DATE) AS d2,
       CAST('0000-00-00 00:00:00.000000' AS DATETIME(6)) AS dt1,
       CAST(@zero_datetime AS DATETIME(6)) AS dt2;
SELECT CAST('2000-01-00' AS DATE) AS d1,
       CAST(@zero_day AS DATE) AS d2,
       CAST('2000-01-00 00:00:00.000000' AS DATETIME(6)) AS dt1,
       CAST(@zero_day_dt AS DATETIME(6)) AS dt2;
SELECT CAST('2000-00-01' AS DATE) AS d1,
       CAST(@zero_month AS DATE) AS d2,
       CAST('2000-00-01 00:00:00.000000' AS DATETIME(6)) AS dt1,
       CAST(@zero_month_dt AS DATETIME(6)) AS dt2;
SELECT CAST('0000-01-01' AS DATE) AS d1,
       CAST(@zero_year AS DATE) AS d2,
       CAST('0000-01-01 00:00:00.000000' AS DATETIME(6)) AS dt1,
       CAST(@zero_year_dt AS DATETIME(6)) AS dt2;
SELECT CAST('2000-02-31' AS DATE) AS d1,
       CAST(@invalid_date AS DATE) AS d2,
       CAST('2000-02-31 00:00:00.000000' AS DATETIME(6)) AS dt1,
       CAST(@invalid_datetime AS DATETIME(6)) AS dt2;
SELECT CAST('YYYY-MM-DD' AS DATE) AS d1,
       CAST(@bad_date AS DATE) AS d2,
       CAST('YYYY-MM-DD HH:MM:SS.ffffff' AS DATETIME(6)) AS dt1,
       CAST(@bad_datetime AS DATETIME(6)) AS dt2;
CREATE TABLE t AS
  SELECT CONCAT(CAST(-1 AS UNSIGNED)) AS col1,
         1.0 + CAST(-1 AS UNSIGNED) AS col2,
         CONCAT(CAST(9223372036854775808 AS SIGNED)) AS col3;
SELECT * FROM t;
DROP TABLE t;
CREATE TABLE t (x VARCHAR(10) NOT NULL);
INSERT INTO t VALUES ('');
DROP TABLE t;
CREATE TABLE tmp(beer CHAR(1));
INSERT INTO tmp VALUES (CONVERT(X'F09F8DBA' USING utf8mb4));
SELECT HEX(beer), beer FROM tmp;
CREATE TABLE t AS
    SELECT CONVERT((SELECT beer FROM tmp) USING binary) AS beer;
SELECT HEX(beer) FROM t;
DROP TABLE t, tmp;
CREATE TABLE t AS
    SELECT CONVERT(X'F09F8DBA' USING utf8mb4) AS beer;
SELECT HEX(beer) FROM t;
DROP TABLE t;
CREATE TABLE t AS
    SELECT CONVERT(CONVERT(X'F09F8DBA' USING utf8mb4) USING binary) AS beer;
SELECT HEX(beer) FROM t;
DROP TABLE t;
CREATE TABLE t AS
    SELECT CONVERT(CONVERT(X'F09F8DBA', CHAR(1) CHARACTER SET utf8mb4) USING binary) AS beer;
SELECT HEX(beer) FROM t;
DROP TABLE t;
CREATE TABLE t AS
    SELECT CONVERT(CONVERT(_utf8mb3'a' USING utf8mb4) USING utf8mb3) AS a;
SELECT a FROM t;
DROP TABLE t;
CREATE TABLE t AS
    SELECT CONVERT(X'D83CDF7A' USING utf16) as beer;
SELECT HEX(beer), CHAR_LENGTH(beer) FROM t;
DROP TABLE t;
SELECT CAST(1111111111111111 AS FLOAT) = CAST(1111111111111110 AS FLOAT) AS eq;
SELECT CAST(CAST(1111111111111111 AS FLOAT) AS CHAR) AS v;
SELECT CAST(CAST(1111111111111111 AS FLOAT) AS SIGNED) AS v;
SELECT CAST(CAST(1111111111111111 AS FLOAT) AS DECIMAL(20,2)) AS v;
