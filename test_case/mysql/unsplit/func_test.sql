drop table if exists t1,t2;
select 0=0,1>0,1>=1,1<0,1<=0,1!=0,strcmp("abc","abcd"),strcmp("b","a"),strcmp("a","a");
select "a"<"b","a"<="b","b">="a","b">"a","a"="A","a"<>"b";
select "a "="A", "A "="a", "a  " <= "A b";
select "abc" like "a%", "abc" not like "%d%", "a%" like "a\%","abc%" like "a%\%","abcd" like "a%b_%d", "a" like "%%a","abcde" like "a%_e","abc" like "abc%";
select "a" like "%%b","a" like "%%ab","ab" like "a\%", "ab" like "_", "ab" like "ab_", "abc" like "%_d", "abc" like "abc%d";
select '?' like '|%', '?' like '|%' ESCAPE '|', '%' like '|%', '%' like '|%' ESCAPE '|', '%' like '%';
select 'abc' like '%c','abcabc' like '%c',  "ab" like "", "ab" like "a", "ab" like "ab";
select "Det hÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¤r ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¤r svenska" regexp "h[[:alpha:]]+r", "aba" regexp "^(a|b)*$";
select "aba" regexp concat("^","a");
select !0,NOT 0=1,!(0=0),1 AND 1,1 && 0,0 OR 1,1 || NULL, 1=1 or 1=1 and 1=0;
select 2 between 1 and 3, "monty" between "max" and "my",2=2 and "monty" between "max" and "my" and 3=3;
select 'b' between 'a' and 'c', 'B' between 'a' and 'c';
select 2 in (3,2,5,9,5,1),"monty" in ("david","monty","allan"), 1.2 in (1.4,1.2,1.0);
select -1.49 or -1.49,0.6 or 0.6;
select 3 ^ 11, 1 ^ 1, 1 ^ 0, 1 ^ NULL, NULL ^ 1;
select 1 XOR 1, 1 XOR 0, 0 XOR 1, 0 XOR 0, NULL XOR 1, 1 XOR NULL, 0 XOR NULL;
select 1 like 2 xor 2 like 1;
select 10 % 7, 10 mod 7, 10 div 3;
select 18446744073709551615, 18446744073709551615 DIV 1, 18446744073709551615 DIV 2;
create table t1 (a int);
insert t1 values (1);
select * from t1 where 1 xor 1;
select - a from t1;
drop table t1;
select 5 between 0 and 10 between 0 and 1,(5 between 0 and 10) between 0 and 1;
select 1 and 2 between 2 and 10, 2 between 2 and 10 and 1;
select 1 and 0 or 2, 2 or 1 and 0;
select _koi8r'a' = _koi8r'A';
select _koi8r'a' = _koi8r'A' COLLATE koi8r_general_ci;
select _koi8r'a' = _koi8r'A' COLLATE koi8r_bin;
select _koi8r'a' COLLATE koi8r_general_ci = _koi8r'A';
select _koi8r'a' COLLATE koi8r_bin = _koi8r'A';
select strcmp(_koi8r'a', _koi8r'A');
select strcmp(_koi8r'a', _koi8r'A' COLLATE koi8r_general_ci);
select strcmp(_koi8r'a', _koi8r'A' COLLATE koi8r_bin);
select strcmp(_koi8r'a' COLLATE koi8r_general_ci, _koi8r'A');
select strcmp(_koi8r'a' COLLATE koi8r_bin, _koi8r'A');
select _koi8r'a' LIKE _koi8r'A';
select _koi8r'a' LIKE _koi8r'A' COLLATE koi8r_general_ci;
select _koi8r'a' LIKE _koi8r'A' COLLATE koi8r_bin;
select _koi8r'a' COLLATE koi8r_general_ci LIKE _koi8r'A';
select _koi8r'a' COLLATE koi8r_bin LIKE _koi8r'A';
CREATE TABLE t2 (  access_id smallint(6) NOT NULL default '0',   name varchar(20) binary default NULL,   `rank` smallint(6) NOT NULL default '0',   KEY t2$access_id (access_id) ) ENGINE=InnoDB;
INSERT INTO t2 VALUES (1,'Everyone',2),(2,'Help',3),(3,'Customer Support',1);
CREATE TABLE t1 (d varchar(6), k int);
INSERT INTO t1 VALUES (NULL, 2);
SELECT GREATEST(d,d) FROM t1 WHERE k=2;
DROP TABLE t1;
select 1197.90 mod 50;
select 5.1 mod 3, 5.1 mod -3, -5.1 mod 3, -5.1 mod -3;
select 5 mod 3, 5 mod -3, -5 mod 3, -5 mod -3;
select (12%0) <=> null      as '1';
select (12%0) is null       as '1';
select 12%0                 as 'NULL';
select 12%2                 as '0';
select 12%NULL              as 'NULL';
select 12 % null            as 'NULL';
select null % 12            as 'NULL';
select null % 0             as 'NULL';
select 0 % null             as 'NULL';
select null % null          as 'NULL';
select (12 mod 0) <=> null  as '1';
select (12 mod 0) is null   as '1';
select 12 mod 0             as 'NULL';
select 12 mod 2             as '0';
select 12 mod null          as 'NULL';
select null mod 12          as 'NULL';
select null mod 0           as 'NULL';
select 0 mod null           as 'NULL';
select null mod null        as 'NULL';
select mod(12.0, 0)         as 'NULL';
select mod(12, 0.0)         as 'NULL';
select mod(12, NULL)        as 'NULL';
select mod(12.0, NULL)      as 'NULL';
select mod(NULL, 2)         as 'NULL';
select mod(NULL, 2.0)       as 'NULL';
create table t1 (a int, b int);
insert into t1 values (1,2), (2,3), (3,4), (4,5);
select * from t1 where a not between 1 and 2;
select * from t1 where a not between 1 and 2 and b not between 3 and 4;
drop table t1;
SELECT GREATEST(1,NULL) FROM DUAL;
SELECT LEAST('xxx','aaa',NULL,'yyy') FROM DUAL;
SELECT LEAST(1.1,1.2,NULL,1.0) FROM DUAL;
SELECT GREATEST(1.5E+2,1.3E+2,NULL) FROM DUAL;
SELECT greatest( 9223372036854775807 , 9223372036854775808 ) as g;
SELECT least   ( 9223372036854775807 , 9223372036854775808 ) as l;
SELECT greatest (9223372036854775808, -1, 18446744073709551615 ) as g;
SELECT least    (9223372036854775808, -1, 18446744073709551615 ) as l;
SELECT greatest (9223372036854775808, 18446744073709551615) as g;
SELECT least    (9223372036854775808, 18446744073709551615) as l;
CREATE TABLE t1 AS SELECT greatest(-1, 9223372036854775808);
DROP TABLE t1, t2;
CREATE TABLE t1 AS
SELECT 5 AS c1, 5 AS c2, 5 AS c3, 5 AS c4, 20010101 AS c5, 010101 AS c6,
       010101 AS c7, 20010101 AS c8, 5.55 AS c11, 5.5 AS c12, 5.5 AS c13,
       010101.5 AS c14, 5.5 AS c15, 010101.5 as c16, 5.5e5 as c21,
       2004041e1 as c22, 150505.0e5 AS c23, 2004041e1 AS c24, '010101' AS c31,
       '5' AS c32, '010101' AS c33, date '2005-05-05' AS c41,
       date '2005-05-05' AS c42, time '05:05:05.555555' AS c51,
       x'c3a5' AS c61, x'c3a5' AS c62, _utf8mb4 x'c3a5' AS c63,
       _utf8mb4 x'c3a5' AS c64, JSON_OBJECT('a', 1) as c71
UNION
SELECT -5, 5.5, 5.5e5, '5', date '2005-05-05', time '05:05:05.555555',
       timestamp '2005-05-05 05:05:05.555555', NOW(0), 88.8,
       5.5e5, '5', date '2005-05-05', time '05:05:05.555555',
       timestamp '2005-05-05 05:05:05.555555',
       '5', date '2005-05-05', time '05:05:05.555555',
       timestamp '2005-05-05 05:05:05.555555',
       date '2005-05-05', time '05:05:05.555555',
       timestamp '2005-05-05 05:05:05.555555',
       time '05:05:05.555555', timestamp '2005-05-05 05:05:05.555555',
       timestamp '2005-05-05 05:05:05.555555', '1', _binary '1', '1',
       _binary '1', NULL;
CREATE TABLE t2 AS
SELECT COALESCE(5, -5) AS c1,
       COALESCE(5, 5.5) AS c2,
       COALESCE(5, 5.5e5) AS c3,
       COALESCE(5, '5') AS c4,
       COALESCE(20010101, date '2005-05-05') AS c5,
       COALESCE(010101, time '05:05:05.555555') AS c6,
       COALESCE(010101, timestamp '2005-05-05 05:05:05.555555') AS c7,
       COALESCE(20010101, NOW(0)) AS c8,
       COALESCE(5.55, 88.8) AS c11,
       COALESCE(5.5, 5.5e5) AS c12,
       COALESCE(5.5, '5') AS c13,
       COALESCE(010101.5, date '2005-05-05') AS c14,
       COALESCE(5.5, time '05:05:05.555555') AS c15,
       COALESCE(010101.5, timestamp '2005-05-05 05:05:05.555555') AS c16,
       COALESCE(5.5e5, '5') AS c21,
       COALESCE(2004041e1, date '2005-05-05') AS c22,
       COALESCE(150505.0e5, time '05:05:05.555555') AS c23,
       COALESCE(2004041e1, timestamp '2005-05-05 05:05:05.555555') AS c24,
       COALESCE('010101', date '2005-05-05') AS c31,
       COALESCE('5', time '05:05:05.555555') AS c32,
       COALESCE('010101', timestamp '2005-05-05 05:05:05.555555') AS c33,
       COALESCE(date '2005-05-05', time '05:05:05.555555') AS c41,
       COALESCE(date '2005-05-05', timestamp '2005-05-05 05:05:05.555555') AS
c42,
       COALESCE(time '05:05:05.555555', timestamp '2005-05-05
05:05:05.555555') AS c51,
       COALESCE(x'c3a5', '1') AS c61,
       COALESCE(x'c3a5', _binary '1') AS c62,
       COALESCE(_utf8mb4 x'c3a5', '1') AS c63,
       COALESCE(_utf8mb4 x'c3a5', _binary '1') AS c64,
       COALESCE(JSON_OBJECT('a', 1), NULL) AS c71;
CREATE TABLE t3 AS
SELECT GREATEST(5, -5) AS c1,
       GREATEST(5, 5.5) AS c2,
       GREATEST(5, 5.5e5) AS c3,
       GREATEST(5, '5') AS c4,
       GREATEST(20010101, date '2005-05-05') AS c5,
       GREATEST(010101, time '05:05:05.555555') AS c6,
       GREATEST(010101, timestamp '2005-05-05 05:05:05.555555') AS c7,
       GREATEST(20010101, NOW(0)) AS c8,
       GREATEST(5.55, 88.8) AS c11,
       GREATEST(5.5, 5.5e5) AS c12,
       GREATEST(5.5, '5') AS c13,
       GREATEST(010101.5, date '2005-05-05') AS c14,
       GREATEST(5.5, time '05:05:05.555555') AS c15,
       GREATEST(010101.5, timestamp '2005-05-05 05:05:05.555555') AS c16,
       GREATEST(5.5e5, '5') AS c21,
       GREATEST(2004041e1, date '2005-05-05') AS c22,
       GREATEST(150505.0e5, time '05:05:05.555555') AS c23,
       GREATEST(2004041e1, timestamp '2005-05-05 05:05:05.555555') AS c24,
       GREATEST('010101', date '2005-05-05') AS c31,
       GREATEST('5', time '05:05:05.555555') AS c32,
       GREATEST('010101', timestamp '2005-05-05 05:05:05.555555') AS c33,
       GREATEST(date '2005-05-05', time '05:05:05.555555') AS c41,
       GREATEST(date '2005-05-05', timestamp '2005-05-05 05:05:05.555555') AS
c42,
       GREATEST(time '05:05:05.555555', timestamp '2005-05-05
05:05:05.555555') AS c51,
       GREATEST(x'c3a5', '1') AS c61,
       GREATEST(x'c3a5', _binary '1') AS c62,
       GREATEST(_utf8mb4 x'c3a5', '1') AS c63,
       GREATEST(_utf8mb4 x'c3a5', _binary '1') AS c64;
DROP TABLE t1, t2, t3;
SELECT GREATEST('11', '5', '2');
SELECT GREATEST('11', 5, 2);
SELECT GREATEST(11, 5, 2);
SELECT LEAST('11', '5', '2');
SELECT LEAST('11', 5, 2);
SELECT LEAST(11, 5, 2);
SELECT GREATEST(date '2005-05-05', 20010101, 20040404, 20030303);
SELECT LEAST(date '2005-05-05', 20030303, 20010101, 20040404);
SELECT GREATEST(date '2005-05-05', '20010101', '20040404', '20030303');
SELECT LEAST(date '2005-05-05', '20030303', '20010101', '20040404');
SELECT GREATEST(time '00:00:00', 120000);
SELECT LEAST(time '00:00:00', 120000);
SELECT GREATEST(time '20:00:00', 120000);
SELECT LEAST(time '20:00:00', 120000);
SELECT GREATEST('95-05-05', date '10-10-10');
SELECT GREATEST(date '1995-05-05', '10-10-10');
SELECT LEAST(date '1995-05-05', '10-10-10');
SELECT LEAST('95-05-05', date '10-10-10');
SELECT GREATEST('11', '5', '2') + 0;
SELECT GREATEST('11', 5, 2) + 0;
SELECT GREATEST(11, 5, 2) + 0;
SELECT GREATEST(date '2005-05-05', 20010101, 20040404, 20030303) + 0;
SELECT GREATEST(time '00:00:00', 120000) + 0;
SELECT GREATEST(time '20:00:00', 120000) + 0;
SELECT GREATEST('95-05-05', date '10-10-10') + 0;
SELECT GREATEST(date '1995-05-05', '10-10-10') + 0;
SELECT GREATEST('11', '5', '2') + 0.00;
SELECT GREATEST('11', 5, 2) + 0.00;
SELECT GREATEST(11, 5, 2) + 0.00;
SELECT GREATEST(date '1995-05-05', 19910101, 20050505, 19930303) + 0.00;
SELECT GREATEST(time '00:00:00', 120000) + 0.00;
SELECT GREATEST(time '20:00:00', 120000) + 0.00;
SELECT GREATEST('95-05-05', date '10-10-10') + 0.00;
SELECT GREATEST(date '1995-05-05', '10-10-10') + 0.00;
CREATE TABLE t1 (a DATETIME, b BLOB, c TEXT, d CHAR(10), e BINARY(10),
f VARBINARY(10));
INSERT INTO t1 VALUES ('2017-02-02 12:00:00', @a, @a, @a, @a, @a);
SELECT GREATEST(a, b), GREATEST(a, c), GREATEST(a, d), GREATEST(a, e),
GREATEST(a, f) FROM t1;
DROP TABLE t1;
CREATE TABLE t1 (a INT PRIMARY KEY, b BIGINT(20) UNSIGNED);
INSERT INTO t1 VALUES (1, 13836376518955650385);
INSERT INTO t1 VALUES (1, 13836376518955650385) ON DUPLICATE KEY UPDATE b=GREATEST(b, VALUES(b));
SELECT * FROM t1;
DROP TABLE t1;
CREATE TABLE t0017 (
  c0002 bigint(20) NOT NULL
);
INSERT INTO t0017 (c0002)
VALUES (0);
SELECT greatest(18446744073709551615, NULL)
FROM t0017;
SELECT
count(greatest(18446744073709551615, NULL))
FROM t0017;
DROP TABLE t0017;
CREATE TABLE t1 (c1 INT UNSIGNED, c2 INT UNSIGNED);
INSERT INTO t1 VALUES (202, 1);
SELECT * FROM t1 WHERE (GREATEST(c1, c2) = 42) AND (c2 = 1);
DROP TABLE t1;
CREATE TABLE t1 (a DOUBLE, b DOUBLE);
CREATE TABLE t2 (a INTEGER, b INTEGER);
INSERT INTO t1 values(1, NULL), (1, 1);
INSERT INTO t2 values(1, NULL), (1, 1);
SELECT SUM(LEAST(a, b)) FROM t1;
SELECT SUM(LEAST(a, b)) FROM t2;
DROP TABLE t1, t2;
CREATE TABLE t1 (
c1 VARCHAR(10),
c2 VARCHAR(10),
c3 DATE NOT NULL,
c4 INT,
UNIQUE KEY ix (c1, c3 DESC, c4 DESC));
SELECT c1 FROM t1
WHERE c1= 'abc' AND
      c2 IN ('def') AND
      c3 BETWEEN '2022-03-16' AND '2022-03-16'
ORDER BY c3 DESC;
DROP TABLE t1;
CREATE TABLE T4 (
  F1 DATE,
  F2 DATETIME,
  F3 TIMESTAMP,
  F4 INTEGER,
  F5 TIME
);
INSERT INTO T4 VALUES
('2018-10-10', '2018-11-11 01:01:01', '2018-10-10 02:02:02', 19590425, '838:01:01'),
('2018-12-31', '2018-12-31 23:59:59', '2019-01-01 00:00:01', 19590425, '000:01:01'),
('1901-12-31', '1901-12-31 23:59:59', '1971-01-01 00:00:01', 20220801, '800:01:01'),
('2060-12-31', '2060-12-31 23:59:59', '2037-01-01 00:00:01', 12350101, '01:01:01'),
('2060-12-31', '2018-12-31 23:59:59', '2018-12-31 23:59:59', 12350101, '01:01:01'),
('2060-12-31', '2018-12-31 23:59:59', '2018-12-31 23:59:59', 20601231, '01:01:01'),
('2060-12-31', '2018-12-31 23:59:59', '2018-12-31 23:59:59', 20601231, '01:01:01'),
('2060-12-31', '2018-12-31 23:59:59', '2018-12-31 23:59:59', 20601231, '01:01:01');
SELECT GREATEST(F4, F1) FROM T4;
SELECT GREATEST(F1, F4) FROM T4;
SELECT GREATEST(F1, F4, F3) FROM T4;
SELECT GREATEST(F3, F4, F1) FROM T4;
SELECT GREATEST(F1, F4, F2) FROM T4;
DROP TABLE T4;
CREATE TABLE t1 (
  c1 datetime NOT NULL,
  c2 varchar(7) NOT NULL
);
INSERT INTO t1 VALUES
('1900-01-01 10:10:10','zgkt'),
('2000-08-19 10:10:10','yzgk'),
('2005-10-18 17:41:54','tyz'),
('2000-03-03 23:40:04','ityzg'),
('1900-01-01 10:10:10','wityzg');
DROP TABLE t1;
CREATE TABLE t1 (
  c1 datetime NOT NULL
);
INSERT INTO t1 VALUES
('2007-05-16 19:15:59'),
('2004-10-19 22:37:33'),
('2000-08-16 05:05:15'),
('2001-11-04 19:07:55');
DROP TABLE t1;
