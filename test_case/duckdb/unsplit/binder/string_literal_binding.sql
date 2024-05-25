PRAGMA enable_verification;
CREATE TABLE test (
    "date" DATE,
    value VARCHAR
);
INSERT INTO test VALUES ('2023-08-01', 1), ('2023-08-02', 2), ('2023-08-03', 3), ('2023-08-04', 4), ('2023-08-05', 5), ('2023-08-06', 6), ('2023-08-07', 7);
select '01'=1;
SELECT cos('0');
select date '1992-01-01'>'1991-01-01';
select date '2023-12-11' < '2023-12-11 15:54:45.119';
SELECT * FROM test WHERE date >= '2023-08-05 00:00:00' AND date < '2023-08-06 00:00:00';
SELECT '[hello]'[1];
SELECT list('hello world');
select 1 IN ('1', '2');
SELECT COALESCE(1, '1');
select i=1 from (values ('01')) t(i);
select i IN (1) from (values ('01')) t(i);
WITH cte AS (SELECT '01' AS s)
SELECT 1=s AS in_res FROM cte;
WITH cte AS (SELECT '01' AS s)
SELECT 1 IN (s) AS in_res FROM cte;
