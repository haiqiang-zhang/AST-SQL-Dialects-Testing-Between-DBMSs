CREATE SCHEMA collate_tests;
SET search_path = collate_tests;
CREATE TABLE collate_test1 (
    a int,
    b text COLLATE "C" NOT NULL
);
CREATE TABLE collate_test_like (
    LIKE collate_test1
);
CREATE TABLE collate_test2 (
    a int,
    b text COLLATE "POSIX"
);
INSERT INTO collate_test1 VALUES (1, 'abc'), (2, 'Abc'), (3, 'bbc'), (4, 'ABD');
INSERT INTO collate_test2 SELECT * FROM collate_test1;
SELECT * FROM collate_test1 WHERE b COLLATE "C" >= 'abc';
SELECT * FROM collate_test1 WHERE b >= 'abc' COLLATE "C";
SELECT * FROM collate_test1 WHERE b COLLATE "C" >= 'abc' COLLATE "C";
CREATE DOMAIN testdomain_p AS text COLLATE "POSIX";
CREATE TABLE collate_test4 (
    a int,
    b testdomain_p
);
INSERT INTO collate_test4 SELECT * FROM collate_test1;
SELECT a, b FROM collate_test4 ORDER BY b;
CREATE TABLE collate_test5 (
    a int,
    b testdomain_p COLLATE "C"
);
INSERT INTO collate_test5 SELECT * FROM collate_test1;
SELECT a, b FROM collate_test5 ORDER BY b;
SELECT a, b FROM collate_test1 ORDER BY b;
SELECT a, b FROM collate_test2 ORDER BY b;
SELECT a, b FROM collate_test1 ORDER BY b COLLATE "C";
SELECT * FROM collate_test1 ORDER BY b;
SELECT * FROM collate_test2 ORDER BY b;
SELECT 'bbc' COLLATE "C" > 'Abc' COLLATE "C" AS "true";
SELECT 'bbc' COLLATE "POSIX" < 'Abc' COLLATE "POSIX" AS "false";
CREATE TABLE collate_test10 (
    a int,
    x text COLLATE "C",
    y text COLLATE "POSIX"
);
INSERT INTO collate_test10 VALUES (1, 'hij', 'hij'), (2, 'HIJ', 'HIJ');
SELECT a, lower(x), lower(y), upper(x), upper(y), initcap(x), initcap(y) FROM collate_test10;
SELECT a, lower(x COLLATE "C"), lower(y COLLATE "C") FROM collate_test10;
CREATE VIEW collview1 AS SELECT * FROM collate_test1 WHERE b COLLATE "C" >= 'bbc';
CREATE VIEW collview2 AS SELECT a, b FROM collate_test1 ORDER BY b COLLATE "C";
CREATE VIEW collview3 AS SELECT a, lower((x || x) COLLATE "POSIX") FROM collate_test10;
SELECT table_name, view_definition FROM information_schema.views
  WHERE table_name LIKE 'collview%' ORDER BY 1;
SELECT a, coalesce(b, 'foo') FROM collate_test1 ORDER BY 2;
SELECT a, b, greatest(b, 'CCC') FROM collate_test1 ORDER BY 3;
SELECT a, nullif(b, 'abc') FROM collate_test1 ORDER BY 2;
SELECT a, CASE b WHEN 'abc' THEN 'abcd' ELSE b END FROM collate_test1 ORDER BY 2;
SELECT a, CASE b WHEN 'abc' THEN 'abcd' ELSE b END FROM collate_test2 ORDER BY 2;
CREATE DOMAIN testdomain AS text;
SELECT a, b::testdomain FROM collate_test1 ORDER BY 2;
SELECT a, b::testdomain FROM collate_test2 ORDER BY 2;
SELECT a, b::testdomain_p FROM collate_test2 ORDER BY 2;
SELECT min(b), max(b) FROM collate_test1;
SELECT array_agg(b ORDER BY b) FROM collate_test1;
SELECT a, b FROM collate_test1 UNION ALL SELECT a, b FROM collate_test1 ORDER BY 2;
SELECT a, b FROM collate_test2 UNION SELECT a, b FROM collate_test2 ORDER BY 2;
SELECT a, b FROM collate_test2 WHERE a < 4 INTERSECT SELECT a, b FROM collate_test2 WHERE a > 1 ORDER BY 2;
SELECT a, b FROM collate_test2 EXCEPT SELECT a, b FROM collate_test2 WHERE a < 2 ORDER BY 2;
SELECT a, b FROM collate_test1 UNION ALL SELECT a, b FROM collate_test2;
SELECT a, b COLLATE "C" FROM collate_test1 UNION SELECT a, b FROM collate_test2 ORDER BY 2;
select x || y from collate_test10;
SELECT a, b, a < b as lt FROM
  (VALUES ('a', 'B'), ('A', 'b' COLLATE "C")) v(a,b);
SELECT * FROM collate_test10 WHERE (x COLLATE "POSIX", y COLLATE "C") NOT IN (SELECT y, x FROM collate_test10);
SELECT * FROM collate_test10 WHERE (x, y) NOT IN (SELECT y COLLATE "C", x COLLATE "POSIX" FROM collate_test10);
SELECT a, CAST(b AS varchar) FROM collate_test1 ORDER BY 2;
CREATE FUNCTION vc (text) RETURNS text LANGUAGE sql
    AS 'select $1::varchar';
SELECT a, b FROM collate_test1 ORDER BY a, vc(b);
SELECT * FROM unnest((SELECT array_agg(b ORDER BY b) FROM collate_test1)) ORDER BY 1;
CREATE FUNCTION dup (anyelement) RETURNS anyelement
    AS 'select $1' LANGUAGE sql;
SELECT a, dup(b) FROM collate_test1 ORDER BY 2;
CREATE INDEX collate_test1_idx1 ON collate_test1 (b);
CREATE INDEX collate_test1_idx2 ON collate_test1 (b COLLATE "POSIX");
CREATE INDEX collate_test1_idx3 ON collate_test1 ((b COLLATE "POSIX"));
CREATE INDEX collate_test1_idx4 ON collate_test1 (((b||'foo') COLLATE "POSIX"));
SELECT relname, pg_get_indexdef(oid) FROM pg_class WHERE relname LIKE 'collate_test%_idx%' ORDER BY 1;
SET enable_seqscan TO 0;
SET enable_hashjoin TO 0;
SET enable_nestloop TO 0;
CREATE TABLE collate_test20 (f1 text COLLATE "C" PRIMARY KEY);
INSERT INTO collate_test20 VALUES ('foo'), ('bar');
CREATE TABLE collate_test21 (f2 text COLLATE "POSIX" REFERENCES collate_test20);
INSERT INTO collate_test21 VALUES ('foo'), ('bar');
CREATE TABLE collate_test22 (f2 text COLLATE "POSIX");
INSERT INTO collate_test22 VALUES ('foo'), ('bar'), ('baz');
DELETE FROM collate_test22 WHERE f2 = 'baz';
ALTER TABLE collate_test22 ADD FOREIGN KEY (f2) REFERENCES collate_test20;
RESET enable_seqscan;
RESET enable_hashjoin;
RESET enable_nestloop;
EXPLAIN (COSTS OFF)
  SELECT * FROM collate_test10 ORDER BY x, y;
EXPLAIN (COSTS OFF)
  SELECT * FROM collate_test10 ORDER BY x DESC, y COLLATE "C" ASC NULLS FIRST;
CREATE COLLATION mycoll1 FROM "C";
CREATE COLLATION mycoll2 ( LC_COLLATE = "POSIX", LC_CTYPE = "POSIX" );
DROP COLLATION mycoll1;
CREATE TABLE collate_test23 (f1 text collate mycoll2);
CREATE TEMP TABLE vctable (f1 varchar(25));
INSERT INTO vctable VALUES ('foo' COLLATE "C");
SELECT collation for ('foo');
SELECT collation for ('foo'::text);
SELECT collation for ((SELECT b FROM collate_test1 LIMIT 1));
CREATE VIEW collate_on_int AS
SELECT c1+1 AS c1p FROM
  (SELECT ('4' COLLATE "C")::INT AS c1) ss;
DROP SCHEMA collate_tests CASCADE;
