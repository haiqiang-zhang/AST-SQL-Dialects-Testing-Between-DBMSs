PRAGMA enable_verification;
CREATE TABLE integers AS SELECT a FROM generate_series(0, 9999, 1) tbl(a), generate_series(0, 9, 1) tbl2(b);
SELECT COUNT(*) FROM integers WHERE a<5;
SELECT COUNT(*) FROM (SELECT * FROM integers WHERE (a>1 AND a<10) OR a>9995) tbl(a) WHERE a<5;
SELECT COUNT(*) FROM (SELECT * FROM (SELECT * FROM integers WHERE (a <> 3 AND a<50) OR (a > 9995)) WHERE a>1 AND a<20) tbl(a) WHERE a<5;