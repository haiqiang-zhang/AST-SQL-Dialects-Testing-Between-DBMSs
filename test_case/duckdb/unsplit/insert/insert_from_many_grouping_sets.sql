CREATE TABLE integers AS SELECT i, i%2 as j FROM generate_series(0,999999,1) tbl(i);
CREATE TABLE integers2 AS SELECT * FROM integers GROUP BY GROUPING SETS ((), (i), (i, j), (j));
DROP TABLE integers;
DROP TABLE integers2;
CREATE TABLE integers AS SELECT case when i%2=0 then null else i end AS i, i%2 as j  FROM generate_series(0,999999,1) tbl(i);
CREATE TABLE integers2 AS SELECT * FROM integers GROUP BY GROUPING SETS ((), (i), (i, j), (j));
SELECT SUM(i), SUM(j), COUNT(*), COUNT(i), COUNT(j) FROM integers;
SELECT SUM(i), SUM(j), COUNT(*), COUNT(i), COUNT(j) FROM integers2;
SELECT SUM(i), SUM(j), COUNT(*), COUNT(i), COUNT(j) FROM integers;
SELECT SUM(i), SUM(j), COUNT(*), COUNT(i), COUNT(j) FROM integers2;
