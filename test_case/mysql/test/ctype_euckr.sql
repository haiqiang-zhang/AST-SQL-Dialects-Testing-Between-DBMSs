
--
-- Tests with the euckr character set
--
--disable_warnings
drop table if exists t1;

SET @test_character_set= 'euckr';
SET @test_collation= 'euckr_korean_ci';

SET NAMES euckr;
SET collation_connection='euckr_korean_ci';
SET collation_connection='euckr_bin';

--
-- Bug#15377 Valid multibyte sequences are truncated on INSERT
--
SET NAMES euckr;
CREATE TABLE t1 (a text) character set euckr;
INSERT INTO t1 VALUES (0xA2E6),(0xFEF7);
SELECT hex(a) FROM t1 ORDER BY a;
DROP TABLE t1;

-- End of 4.1 tests

--
--Bug #30315 Character sets: insertion of euckr code value 0xa141 fails
--
SET sql_mode = 'NO_ENGINE_SUBSTITUTION';
create table t1 (s1 varchar(5) character set euckr);
insert into t1 values (0xA141);
insert into t1 values (0xA15A);
insert into t1 values (0xA161);
insert into t1 values (0xA17A);
insert into t1 values (0xA181);
insert into t1 values (0xA1FE);
insert into t1 values (0xA140);
insert into t1 values (0xA15B);
insert into t1 values (0xA160);
insert into t1 values (0xA17B);
insert into t1 values (0xA180);
insert into t1 values (0xA1FF);
select hex(s1), hex(convert(s1 using utf8mb3)) from t1 order by binary s1;
drop table t1;
SET sql_mode = default;
SET NAMES utf8mb3;
CREATE TABLE t1 (a varchar(10) character set euckr);
INSERT INTO t1 VALUES (0xA2E6), (0xA2E7);
SELECT hex(a), hex(@utf8mb3:=convert(a using utf8mb3)), hex(convert(@utf8mb3 using euckr)) FROM t1;
DROP TABLE t1;
SET sql_mode = 'NO_ENGINE_SUBSTITUTION';
CREATE TABLE t1 (a binary(1), key(a));
let $1=255;
{
  eval INSERT INTO t1 VALUES (unhex(hex($1)));
  dec $1;

CREATE TABLE t2 (s VARCHAR(4), a VARCHAR(1) CHARACTER SET euckr);
INSERT INTO t2
SELECT hex(concat(t11.a, t12.a)), concat(t11.a, t12.a)
FROM t1 t11, t1 t12
WHERE t11.a >= 0x81 AND t11.a <= 0xFE
AND   t12.a >= 0x41 AND t12.a <= 0xFE
ORDER BY t11.a, t12.a;
SELECT s as bad_code FROM t2 WHERE a='' ORDER BY s;
DELETE FROM t2 WHERE a='';
ALTER TABLE t2 ADD u VARCHAR(1) CHARACTER SET utf8mb3, ADD a2 VARCHAR(1) CHARACTER SET euckr;
UPDATE t2 SET u=a, a2=u;
SELECT s as unassigned_code FROM t2 WHERE u='?';
DELETE FROM t2 WHERE u='?';
SELECT count(*) as roundtrip_problem_chars FROM t2 WHERE hex(a) <> hex(a2);
SELECT s, hex(a), hex(u), hex(a2) FROM t2 ORDER BY s;
DROP TABLE t1, t2;
SET sql_mode = default;
SET sql_mode = 'NO_ENGINE_SUBSTITUTION';
SET NAMES utf8mb3;
SET collation_connection=euckr_korean_ci;
CREATE TABLE t1 (b VARCHAR(2));
INSERT INTO t1 VALUES ('0'),('1'),('2'),('3'),('4'),('5'),('6'),('7');
INSERT INTO t1 VALUES ('8'),('9'),('A'),('B'),('C'),('D'),('E'),('F');
CREATE TEMPORARY TABLE head AS SELECT concat(b1.b, b2.b) AS head FROM t1 b1, t1 b2;
CREATE TEMPORARY TABLE tail AS SELECT concat(b1.b, b2.b) AS tail FROM t1 b1, t1 b2;
DROP TABLE t1;
CREATE TABLE t1 AS
SELECT concat(head, tail) AS code, ' ' AS a
FROM head, tail
WHERE (head BETWEEN '80' AND 'FF') AND (tail BETWEEN '20' AND 'FF')
ORDER BY head, tail;
DROP TEMPORARY TABLE head, tail;
SET @@session.max_error_count = 64;
UPDATE t1 SET a=unhex(code) ORDER BY code;
SET @@session.max_error_count = default;
SELECT COUNT(*) FROM t1 WHERE a<>'';
SELECT code, hex(upper(a)), hex(lower(a)),a, upper(a), lower(a) FROM t1 WHERE hex(a)<>hex(upper(a)) OR hex(a)<>hex(lower(a));
SELECT * FROM t1
WHERE HEX(CAST(LOWER(a) AS CHAR CHARACTER SET utf8mb3)) <>
      HEX(LOWER(CAST(a AS CHAR CHARACTER SET utf8mb3))) ORDER BY code;
SELECT * FROM t1
WHERE HEX(CAST(UPPER(a) AS CHAR CHARACTER SET utf8mb3)) <>
      HEX(UPPER(CAST(a AS CHAR CHARACTER SET utf8mb3))) ORDER BY code;

DROP TABLE t1;
SET sql_mode = default;
set names euckr;

set collation_connection=euckr_bin;

--
-- Bugs#12635232: VALGRIND WARNINGS: IS_IPV6, IS_IPV4, INET6_ATON,
-- INET6_NTOA + MULTIBYTE CHARSET.
--

SET NAMES euckr;