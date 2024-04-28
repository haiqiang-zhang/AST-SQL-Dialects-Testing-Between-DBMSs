DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;

CREATE TABLE t1 (
  latin1_f CHAR(32) NOT NULL
) charset latin1;
CREATE TABLE t2 (
  latin1_f CHAR(32) CHARACTER SET latin1 COLLATE koi8r_general_ci NOT NULL
);
CREATE TABLE t2 (
  latin1_f CHAR(32) CHARACTER SET latin1 COLLATE some_non_existing_col NOT NULL
);


INSERT INTO t1 (latin1_f) VALUES (_latin1'A');
INSERT INTO t1 (latin1_f) VALUES (_latin1'a');

INSERT INTO t1 (latin1_f) VALUES (_latin1'AD');
INSERT INTO t1 (latin1_f) VALUES (_latin1'ad');

INSERT INTO t1 (latin1_f) VALUES (_latin1'AE');
INSERT INTO t1 (latin1_f) VALUES (_latin1'ae');

INSERT INTO t1 (latin1_f) VALUES (_latin1'AF');
INSERT INTO t1 (latin1_f) VALUES (_latin1'af');

INSERT INTO t1 (latin1_f) VALUES (_latin1'�');
INSERT INTO t1 (latin1_f) VALUES (_latin1'�');

INSERT INTO t1 (latin1_f) VALUES (_latin1'�');
INSERT INTO t1 (latin1_f) VALUES (_latin1'�');

INSERT INTO t1 (latin1_f) VALUES (_latin1'B');
INSERT INTO t1 (latin1_f) VALUES (_latin1'b');

INSERT INTO t1 (latin1_f) VALUES (_latin1'U');
INSERT INTO t1 (latin1_f) VALUES (_latin1'u');

INSERT INTO t1 (latin1_f) VALUES (_latin1'UE');
INSERT INTO t1 (latin1_f) VALUES (_latin1'ue');

INSERT INTO t1 (latin1_f) VALUES (_latin1'�');
INSERT INTO t1 (latin1_f) VALUES (_latin1'�');

INSERT INTO t1 (latin1_f) VALUES (_latin1'SS');
INSERT INTO t1 (latin1_f) VALUES (_latin1'ss');
INSERT INTO t1 (latin1_f) VALUES (_latin1'�');

INSERT INTO t1 (latin1_f) VALUES (_latin1'Y');
INSERT INTO t1 (latin1_f) VALUES (_latin1'y');

INSERT INTO t1 (latin1_f) VALUES (_latin1'Z');
INSERT INTO t1 (latin1_f) VALUES (_latin1'z');


-- ORDER BY

SELECT latin1_f FROM t1 ORDER BY latin1_f, hex(latin1_f);
SELECT latin1_f FROM t1 ORDER BY latin1_f COLLATE latin1_swedish_ci, hex(latin1_f);
SELECT latin1_f FROM t1 ORDER BY latin1_f COLLATE latin1_german2_ci, hex(latin1_f);
SELECT latin1_f FROM t1 ORDER BY latin1_f COLLATE latin1_general_ci, hex(latin1_f);
SELECT latin1_f FROM t1 ORDER BY latin1_f COLLATE latin1_bin;
SELECT latin1_f FROM t1 ORDER BY latin1_f COLLATE koi8r_general_ci;

-- SELECT latin1_f COLLATE koi8r FROM t1 ;

-- AS + ORDER BY
SELECT latin1_f COLLATE latin1_swedish_ci AS latin1_f_as FROM t1 ORDER BY latin1_f_as, hex(latin1_f_as);
SELECT latin1_f COLLATE latin1_german2_ci AS latin1_f_as FROM t1 ORDER BY latin1_f_as, hex(latin1_f_as);
SELECT latin1_f COLLATE latin1_general_ci AS latin1_f_as FROM t1 ORDER BY latin1_f_as, hex(latin1_f_as);
SELECT latin1_f COLLATE latin1_bin        AS latin1_f_as FROM t1 ORDER BY latin1_f_as;
SELECT latin1_f COLLATE koi8r_general_ci  AS latin1_f_as FROM t1 ORDER BY latin1_f_as;


-- GROUP BY

--skip_if_hypergraph  -- Picks a different (but equally valid) representative for each group.
SELECT latin1_f,count(*) FROM t1 GROUP BY latin1_f ORDER BY latin1_f;
SELECT latin1_f,count(*) FROM t1 GROUP BY latin1_f COLLATE latin1_swedish_ci ORDER BY latin1_f COLLATE latin1_swedish_ci;
SELECT latin1_f,count(*) FROM t1 GROUP BY latin1_f COLLATE latin1_german2_ci ORDER BY latin1_f COLLATE latin1_german2_ci;
SELECT latin1_f,count(*) FROM t1 GROUP BY latin1_f COLLATE latin1_general_ci ORDER BY latin1_f COLLATE latin1_general_ci;
SELECT latin1_f,count(*) FROM t1 GROUP BY latin1_f COLLATE latin1_bin ORDER BY latin1_f COLLATE latin1_bin;
SELECT latin1_f,count(*) FROM t1 GROUP BY latin1_f COLLATE koi8r_general_ci;

-- DISTINCT

--skip_if_hypergraph   -- Chooses different group representatives.
--sorted_result
SELECT DISTINCT latin1_f                           FROM t1;
SELECT DISTINCT latin1_f COLLATE latin1_swedish_ci FROM t1;
SELECT DISTINCT latin1_f COLLATE latin1_german2_ci FROM t1;
SELECT DISTINCT latin1_f COLLATE latin1_general_ci FROM t1;
SELECT DISTINCT latin1_f COLLATE latin1_bin        FROM t1;
SELECT DISTINCT latin1_f COLLATE koi8r             FROM t1;


-- Aggregates

--disable_testcase BUG--0000
SELECT MAX(k COLLATE latin1_german2_ci)
FROM t1
WHERE
SELECT *
FROM t1 
WHERE (_latin1'Mu"ller' COLLATE latin1_german2_ci) = k 
HAVING
SELECT *
FROM t1 
HAVING (_latin1'Mu"ller' COLLATE latin1_german2_ci) = k;

--
-- Check that SHOW displays COLLATE clause
--


--Replace default engine value with static engine string 
--replace_result $DEFAULT_ENGINE ENGINE
SHOW CREATE TABLE t1;
ALTER TABLE t1 CHANGE latin1_f 
latin1_f CHAR(32) CHARACTER SET latin1 COLLATE latin1_bin;
ALTER TABLE t1 CHARACTER SET latin1 COLLATE latin1_bin;

--
-- Check SET CHARACTER SET
--

SET CHARACTER SET 'latin1';
SELECT charset(_latin1 'a'),collation(_latin1 'a'),coercibility('a'),'a'='A';

SET CHARACTER SET koi8r;
SELECT charset(_latin1 'a'),collation(_latin1 'a'),coercibility('a'),'a'='A';
SET CHARACTER SET 'DEFAULT';

DROP TABLE t1;

CREATE TABLE t1 
(s1 CHAR(5) COLLATE latin1_german1_ci,
 s2 CHAR(5) COLLATE latin1_swedish_ci);
SELECT * FROM t1 WHERE s1 = s2;
DROP TABLE t1;


CREATE TABLE t1
(s1 CHAR(5) COLLATE latin1_german1_ci,
 s2 CHAR(5) COLLATE latin1_swedish_ci,
 s3 CHAR(5) COLLATE latin1_bin);
INSERT INTO t1 VALUES ('a','A','A');
SELECT * FROM t1 WHERE s1 = s2;
SELECT * FROM t1 WHERE s1 = s3;
SELECT * FROM t1 WHERE s2 = s3;
DROP TABLE t1;


--
-- Test that optimizer does not use indexes with wrong collation
--
--
-- BUG#48447, Delivering too few records with indexes using collate syntax
--
create table t1 (a varchar(1) character set latin1 collate latin1_general_ci);
insert into t1 values ('A'),('a'),('B'),('b'),('C'),('c');
select * from t1 where a > _latin1 'B' collate latin1_bin;
select * from t1 where a <> _latin1 'B' collate latin1_bin;
create index i on t1 (a);
select * from t1 where a > _latin1 'B' collate latin1_bin;
select * from t1 where a <> _latin1 'B' collate latin1_bin;
drop table t1;

SET NAMES latin1;
CREATE TABLE t1 
(s1 char(10) COLLATE latin1_german1_ci,
 s2 char(10) COLLATE latin1_swedish_ci,
 KEY(s1),
 KEY(s2));

INSERT INTO t1 VALUES ('a','a');
INSERT INTO t1 VALUES ('b','b');
INSERT INTO t1 VALUES ('c','c');
INSERT INTO t1 VALUES ('d','d');
INSERT INTO t1 VALUES ('e','e');
INSERT INTO t1 VALUES ('f','f');
INSERT INTO t1 VALUES ('g','g');
INSERT INTO t1 VALUES ('h','h');
INSERT INTO t1 VALUES ('i','i');
INSERT INTO t1 VALUES ('j','j');

DROP TABLE t1;

-- End of 4.1 tests

--
-- Bug#29261: Sort order of the collation wasn't used when comparing trailing
--            spaces.
--
create table t1(f1 varchar(10) character set latin2 collate latin2_hungarian_ci, key(f1));
insert into t1 set f1=0x3F3F9DC73F;
insert into t1 set f1=0x3F3F1E563F;
insert into t1 set f1=0x3F3F;
drop table t1;

--
-- Bug#29461: Sort order of the collation wasn't used when comparing characters
--            with the space character.
--
create table t1 (a varchar(2) character set latin7 collate latin7_general_ci,key(a));
insert into t1 set a=0x4c20;
insert into t1 set a=0x6c;
insert into t1 set a=0x4c98;
drop table t1;

--
-- Bug#41627 Illegal mix of collations in LEAST / GREATEST / CASE
--
SET sql_mode = 'NO_ENGINE_SUBSTITUTION';
select least(_latin1'a',_latin2'b',_latin5'c' collate latin5_turkish_ci);
create table t1 charset latin1
select least(_latin1'a',_latin2'b',_latin5'c' collate latin5_turkish_ci) as f1;
drop table t1;

select case _latin1'a' when _latin2'b' then 1 when _latin5'c' collate
latin5_turkish_ci then 2 else 3 end;

select concat(_latin1'a',_latin2'b',_latin5'c' collate latin5_turkish_ci);
SET sql_mode = default;
SET NAMES latin1 COLLATE latin1_german2_ci;
CREATE DATABASE test1 DEFAULT CHARACTER SET latin1 COLLATE latin1_german2_ci;
USE test1;
CREATE FUNCTION `getText`() RETURNS varchar(20) CHARSET latin1
BEGIN
  RETURN "Testtext";
SELECT getText(), CHARSET(getText()), COLLATION(getText()), COERCIBILITY(getText());
CREATE TABLE t1 AS SELECT ' - ' AS a UNION SELECT getText();
DROP FUNCTION getText;
CREATE FUNCTION `getText`() RETURNS varchar(20)
BEGIN
  RETURN "Testtext";
SELECT getText(), CHARSET(getText()), COLLATION(getText()), COERCIBILITY(getText());
CREATE TABLE t1 AS SELECT ' - ' AS a UNION SELECT getText();
DROP TABLE t1;
DROP FUNCTION getText;
CREATE FUNCTION `getText`() RETURNS varchar(20) CHARACTER SET latin1 COLLATE latin1_german2_ci
BEGIN
  RETURN "Testtext";
SELECT getText(), CHARSET(getText()), COLLATION(getText()), COERCIBILITY(getText());
CREATE TABLE t1 AS SELECT ' - ' AS a UNION SELECT getText();
DROP TABLE t1;
DROP FUNCTION getText;
DROP DATABASE test1;
USE test;
SET NAMES latin1;
CREATE TABLE t1(a TINYINT, b SMALLINT, c MEDIUMINT, d INT, e BIGINT);
CREATE TABLE t2(a DECIMAL(5,2));
CREATE TABLE t3(a FLOAT(5,2), b DOUBLE(5,2));
INSERT INTO t1 VALUES(1, 2, 3, 4, 100);
INSERT INTO t1 VALUES(2, 3, 4, 100, 1);
INSERT INTO t1 VALUES(3, 4, 100, 1, 2);
INSERT INTO t1 VALUES(4, 100, 1, 2, 3);
INSERT INTO t1 VALUES(100, 1, 2, 3, 4);
SELECT * FROM t1 ORDER BY a;
SELECT * FROM t1 ORDER BY a COLLATE utf8mb3_bin;
SELECT * FROM t1 ORDER BY b;
SELECT * FROM t1 ORDER BY b COLLATE latin1_swedish_ci;
SELECT * FROM t1 ORDER BY c;
SELECT * FROM t1 ORDER BY c COLLATE gb2312_chinese_ci;
SELECT * FROM t1 ORDER BY d;
SELECT * FROM t1 ORDER BY d COLLATE ascii_general_ci;
INSERT INTO t2 VALUES(1.01);
INSERT INTO t2 VALUES(2.99);
INSERT INTO t2 VALUES(100.49);
SELECT * FROM t2 ORDER BY a;
SELECT * FROM t2 ORDER BY a COLLATE latin1_german1_ci;
INSERT INTO t3 VALUES(1.01, 2.99);
INSERT INTO t3 VALUES(2.99, 100.49);
INSERT INTO t3 VALUES(100.49, 1.01);
SELECT * FROM t3 ORDER BY a;
SELECT * FROM t3 ORDER BY a COLLATE ascii_bin;
SELECT * FROM t3 ORDER BY b;
SELECT * FROM t3 ORDER BY b COLLATE utf8mb3_general_ci;
DROP TABLE t1;
DROP TABLE t2;
DROP TABLE t3;