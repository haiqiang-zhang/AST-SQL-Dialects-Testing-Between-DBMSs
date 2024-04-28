PRAGMA threads=4;
PRAGMA verify_parallelism;
CREATE TABLE tbl AS SELECT * FROM range(10000) tbl(i) UNION ALL SELECT NULL;
SELECT SUM(i) FROM tbl
UNION ALL
SELECT COUNT(i) FROM tbl
UNION ALL
SELECT AVG(i) FROM tbl
UNION ALL
SELECT AVG(i) + SUM(i) FROM tbl
ORDER BY 1;