SELECT * FROM t1 ORDER BY b;
SELECT a FROM (SELECT a FROM t1 ORDER BY b LIMIT 2) WHERE a=1;
SELECT count(*) FROM (SELECT a FROM t1 ORDER BY b LIMIT 2) WHERE a=1;
SELECT a FROM (SELECT a FROM t1 ORDER BY b LIMIT 3) WHERE a=1;
SELECT count(*) FROM (SELECT a FROM t1 ORDER BY b LIMIT 3) WHERE a=1;
SELECT a FROM (SELECT a FROM t1 ORDER BY b LIMIT 99) WHERE a=1;
SELECT count(*) FROM (SELECT a FROM t1 ORDER BY b LIMIT 99) WHERE a=1;
SELECT a FROM (SELECT a FROM t1 ORDER BY b) WHERE a=1;
SELECT count(*) FROM (SELECT a FROM t1 ORDER BY b) WHERE a=1;
SELECT a FROM (SELECT a FROM t1) WHERE a=1;
SELECT count(*) FROM (SELECT a FROM t1) WHERE a=1;
