
CREATE TABLE t1 (i INTEGER, f DOUBLE, s CHAR(10), j JSON);
INSERT INTO t1 VALUES (1, 3.4, 'efghi', '10');
INSERT INTO t1 VALUES (2, 2.3, 'sdfsd', '30');
INSERT INTO t1 VALUES (3, 6.5, 'efghi', '20');
INSERT INTO t1 VALUES (5, NULL, 'dfgdf', '23');
INSERT INTO t1 VALUES (NULL, 3.4, 'wqweq', '32');
INSERT INTO t1 VALUES (4, 8.9, 'ffhfg', '13');
INSERT INTO t1 VALUES (8, 1.2, 'efghi', '21');
INSERT INTO t1 VALUES (10, 3.4, 'fsfd', '10');
INSERT INTO t1 VALUES (2, 2.3, NULL, '29');
INSERT INTO t1 VALUES (4, NULL, NULL, '100');
INSERT INTO t1 VALUES (8, 99.3, '24324', '1');
INSERT INTO t1 VALUES (9, 32.4, 'poipo', '6');
INSERT INTO t1 VALUES (NULL, 0, 'zxczcx', '39');
INSERT INTO t1 VALUES (11, 21, 'uwrteu', '43');
INSERT INTO t1 VALUES (15, 0.9, 'dkfhk', '28');
INSERT INTO t1 VALUES (13, 1.1, NULL, '0');

SELECT j, i, f, JSON_ARRAYAGG(i) OVER w jarray_i, JSON_ARRAYAGG(f)
  OVER w jarray_f FROM t1 WINDOW w AS (ORDER BY j);
SELECT j, s, JSON_ARRAYAGG(s) OVER w jarray_s, JSON_ARRAYAGG(j)
  OVER w jarray_j FROM t1 WINDOW w AS (ORDER BY j);
SELECT i, JSON_ARRAYAGG(i) OVER() FROM t1;

SELECT s, j, JSON_ARRAYAGG(s) OVER w jarray_s, JSON_ARRAYAGG(j)
  OVER w jarray_j FROM t1 WINDOW w AS (ORDER BY j) ORDER BY j DESC;

SELECT j, i, f, JSON_ARRAYAGG(i) OVER w jarray_i, JSON_ARRAYAGG(f)
  OVER w jarray_f FROM t1 WINDOW w AS (ORDER BY j DESC);

CREATE VIEW v AS SELECT i, j, JSON_ARRAYAGG(j)
  OVER (ORDER BY i DESC ROWS UNBOUNDED PRECEDING) jarray_j FROM t1;
SELECT * FROM v;
DROP VIEW v;

SELECT s, j, JSON_ARRAYAGG(s) OVER w jarray_s, JSON_ARRAYAGG(j)
  OVER w jarray_j FROM t1 GROUP BY s,j WINDOW w AS (ORDER BY j);

-- The order here is undefined and implementation-dependent.
--sorted_result
--replace_regex /9, 10, 8, 11, 5, 4, 3, 13, 2, 1, 15, null, null/null, 1, 2, 3, 4, 5, 8, 9, 10, 11, 13, 15, null/
SELECT i, f, JSON_ARRAYAGG(i) OVER w jarray_i, JSON_ARRAYAGG(f)
  OVER w jarray_f FROM t1 GROUP BY i,f WITH ROLLUP HAVING GROUPING(f)=1
  WINDOW w AS (ORDER BY f);

SELECT i, f, RANK() OVER w rank1, NTH_VALUE(i,3)
  OVER w nth, LEAD(f, 2) OVER w lead1, LAG(f,2) OVER w lag1, JSON_ARRAYAGG(i)
  OVER w jarray_i FROM t1 WINDOW w AS (ORDER BY f);

SELECT i, PERCENT_RANK() OVER (ORDER BY f) p_rank, JSON_ARRAYAGG(j)
  OVER (ORDER BY i,j ROWS UNBOUNDED PRECEDING) jarray_j FROM t1;

SELECT i, f, MIN(i) OVER w min, JSON_ARRAYAGG(i) OVER w jarray_i FROM t1
       WINDOW w AS (PARTITION BY f);
SELECT i, f, MAX(i) OVER w max, JSON_ARRAYAGG(i) OVER w jarray_i FROM t1
       WINDOW w AS (PARTITION BY i ROWS UNBOUNDED PRECEDING);

SELECT i, j, f, RANK() OVER w rank1, JSON_ARRAYAGG(i)
  OVER w jarray_i FROM t1 WINDOW w AS (PARTITION BY i ORDER BY j ROWS
                                       BETWEEN 2 PRECEDING AND 1 PRECEDING);
SELECT i, j, f, CUME_DIST() OVER w c_dist, JSON_ARRAYAGG(i)
  OVER w jarray_i FROM t1 WINDOW w AS (PARTITION BY i ORDER BY j ROWS
                                       BETWEEN 1 FOLLOWING AND 2 FOLLOWING);

SELECT i, f, PERCENT_RANK() OVER w p_rank, JSON_ARRAYAGG(i)
  OVER w jarray_i FROM t1 WINDOW w AS (PARTITION BY i ORDER BY f RANGE
                                       BETWEEN 2.1 FOLLOWING AND 4.5 FOLLOWING);
SELECT i, f, j, CUME_DIST() OVER w c_dist, JSON_ARRAYAGG(j)
  OVER w jarray_j FROM t1 WINDOW w AS (PARTITION BY i ORDER BY f RANGE
                                       BETWEEN 1 PRECEDING AND 10 FOLLOWING);

DROP TABLE t1;

CREATE TABLE t1 (i INTEGER, f DOUBLE, s CHAR(10), j JSON);
INSERT INTO t1 VALUES (1, 3.4, 'efghi', '10');
INSERT INTO t1 VALUES (2, 3.3, 'efghi', '29');
INSERT INTO t1 VALUES (2, 2.3, 'efghi', '29');
INSERT INTO t1 VALUES (2, 2.3, 'efghi', '29');
INSERT INTO t1 VALUES (2, 2.3, 'sdfsd', '30');
INSERT INTO t1 VALUES (2, 2.3, 'sdfsd', '30');
INSERT INTO t1 VALUES (2, 2.3, 'sdfsd', '31');
INSERT INTO t1 VALUES (2, 2.3, 'sdfsd', '40');
INSERT INTO t1 VALUES (2, 3.3, 'sdfsd', '20');
INSERT INTO t1 VALUES (2, 4.5, 'sdfsd', '45');
INSERT INTO t1 VALUES (3, 6.5, 'efghi', '10');
INSERT INTO t1 VALUES (5, 8, 'dfgdf', '23');
INSERT INTO t1 VALUES (5, 3.4, 'wqweq', '32');
INSERT INTO t1 VALUES (4, 8.9, 'ffhfg', '13');
INSERT INTO t1 VALUES (8, 1.2, 'efghi', '21');

SELECT j, s, f, JSON_OBJECTAGG(j,f) OVER w jobject_f, JSON_OBJECTAGG(j,s)
  OVER w jobject_s FROM t1 WINDOW w AS (ORDER BY j);
SELECT i, JSON_OBJECTAGG(i,j) OVER() FROM t1;

SELECT j, s, JSON_OBJECTAGG(j,s) OVER w jobject_s, JSON_OBJECTAGG(f,j)
  OVER w jobject_j FROM t1 WINDOW w AS (ORDER BY j) ORDER BY j DESC;

SELECT j, i, JSON_OBJECTAGG(j,i) OVER w jobject_i, JSON_OBJECTAGG(j,f)
  OVER w jobject_f FROM t1 WINDOW w AS (ORDER BY j DESC);

SELECT i, j, JSON_OBJECTAGG(j,f) OVER w jobject_i, JSON_OBJECTAGG(j,s)
  OVER w jobject_f FROM t1 WINDOW w AS (PARTITION BY i ORDER BY j);
SELECT j, s, f, JSON_OBJECTAGG(j,s) OVER w jobject_s, JSON_OBJECTAGG(f,j)
  OVER w jobject_j FROM t1 WINDOW w AS (PARTITION BY i ORDER BY s);
SELECT i, JSON_OBJECTAGG(i,j) OVER(PARTITION BY i) FROM t1;

CREATE VIEW v AS SELECT i, j, JSON_OBJECTAGG(i,j)
  OVER (ORDER BY i DESC ROWS UNBOUNDED PRECEDING) jobject_j FROM t1;
SELECT * FROM v;
DROP VIEW v;

SELECT j, s, JSON_OBJECTAGG(j, s) OVER w jobject_s FROM t1
  GROUP BY j,s WINDOW w AS (ORDER BY j);
SELECT i, JSON_OBJECTAGG(i,f) OVER w jobject_f FROM t1 GROUP BY i,f
  WITH ROLLUP HAVING GROUPING(f)=1  WINDOW w AS (ORDER BY f);

SELECT i, j, f, JSON_OBJECTAGG(j,f) OVER w jobject_f, RANK()
  OVER w rank1 FROM t1 WINDOW w AS (PARTITION BY i ORDER BY i);
SELECT i, j, f, JSON_OBJECTAGG(i,j) OVER w jobject_i, RANK()
  OVER w rank1, NTH_VALUE(i,2) OVER w nth, LEAD(f, 1)
  OVER w lead1, LAG(f,1) OVER w lag1 FROM t1
  WINDOW w AS (PARTITION BY i ORDER BY j);

SELECT i, f, PERCENT_RANK() OVER (ORDER BY f) p_rank, JSON_OBJECTAGG(i,j)
  OVER (ORDER BY i,j ROWS UNBOUNDED PRECEDING) jobject_j FROM t1;

SELECT i, j, f, JSON_OBJECTAGG(i,j) OVER w jobject_i, MIN(i)
  OVER w min FROM t1 WINDOW w AS (PARTITION BY i);

SELECT i, j, f, JSON_OBJECTAGG(j,f) OVER w jobject_j, MAX(i)
  OVER w max FROM t1 WINDOW w AS (PARTITION BY f ROWS UNBOUNDED PRECEDING);
SELECT i, j, f, JSON_OBJECTAGG(j,f) OVER w jobject_j, RANK()
  OVER w rank1 FROM t1 WINDOW w AS (PARTITION BY f ORDER BY j ROWS
                                    BETWEEN 2 PRECEDING AND 1 PRECEDING);
SELECT i, j, f, JSON_OBJECTAGG(j,f) OVER w jobject_j, RANK()
  OVER w rank1 FROM t1 WINDOW w AS (PARTITION BY f ORDER BY j ROWS
                                    BETWEEN 2 PRECEDING AND CURRENT ROW);

SELECT i, j, f, JSON_OBJECTAGG(j,f) OVER w jobject_j, CUME_DIST()
  OVER w c_dist FROM t1 WINDOW w AS (PARTITION BY i ORDER BY j ROWS
                                     BETWEEN 1 FOLLOWING AND 2 FOLLOWING);

SELECT i, j, f, JSON_OBJECTAGG(f,j) OVER w jobject_i FROM t1
WINDOW w AS (PARTITION BY i ORDER BY f RANGE BETWEEN 2.1 FOLLOWING
             AND 4.5 FOLLOWING);

SELECT i, j, f, JSON_OBJECTAGG(j,f) OVER w jobject_j, CUME_DIST()
  OVER w c_dist FROM t1 WINDOW w AS (PARTITION BY i ORDER BY j,f ROWS
                                     BETWEEN 2 PRECEDING AND 2 FOLLOWING);

SELECT i, j, f, JSON_OBJECTAGG(i,j) OVER w jobject_i, MAX(i) OVER w max FROM t1
  WINDOW w AS (PARTITION BY f ROWS UNBOUNDED PRECEDING);

SELECT i, j, f, JSON_OBJECTAGG(i,j) OVER w jobject_i, RANK()
  OVER w rank1 FROM t1 WINDOW w AS (PARTITION BY f ORDER BY j ROWS
                                    BETWEEN 2 PRECEDING AND 1 PRECEDING);
SELECT i, j, f, JSON_OBJECTAGG(i,j) OVER w jobject_i, RANK()
  OVER w rank1 FROM t1 WINDOW w AS (PARTITION BY f ORDER BY j ROWS
                                    BETWEEN 2 PRECEDING AND CURRENT ROW);

SELECT i, j, f, JSON_OBJECTAGG(i,j) OVER w jobject_i FROM t1
  WINDOW w AS (PARTITION BY i ORDER BY j ROWS BETWEEN 1 FOLLOWING
               AND 5 FOLLOWING);
SELECT i, j, f, JSON_OBJECTAGG(j,f) OVER w jobject_j FROM t1
  WINDOW w AS (PARTITION BY i ROWS BETWEEN 1 FOLLOWING AND
               UNBOUNDED FOLLOWING);
SELECT i, j, f, JSON_OBJECTAGG(j,f) OVER w jobject_j FROM t1
  WINDOW w AS (PARTITION BY i ROWS BETWEEN 2 PRECEDING AND 4 FOLLOWING);

SELECT i, j, f, JSON_OBJECTAGG(i,f) OVER w jobject_i FROM t1
  WINDOW w AS (PARTITION BY i ORDER BY f RANGE BETWEEN 2.1 FOLLOWING AND
               4.5 FOLLOWING);

DROP TABLE t1;

-- Coverage tests for Item_sum_json::val_*
-- Different warnings in the hypergraph optimizer.
--disable_warnings
SELECT 0 & (JSON_ARRAYAGG(1) OVER w) FROM (select 1) as dt  WINDOW w as ();
SELECT MAKETIME(((1)<=> (JSON_OBJECTAGG('1',1)OVER())),'1',1);
SELECT MAKETIME(((1)<=> (2*JSON_OBJECTAGG('1',1)OVER())),'1',1);
SELECT (1 + CAST(JSON_OBJECTAGG(1,2) OVER () AS DECIMAL));
CREATE TABLE t(`key` VARCHAR(10), i INT);
INSERT INTO t VALUES ('e', 1), ('e', 2), ('f', 3),
                     ('a', 4), ('a', 5), ('b', 6);

SELECT JSON_OBJECTAGG(`key`, i) OVER w AS agg
       FROM t WINDOW w AS (ORDER BY `key` ROWS CURRENT ROW);

SELECT JSON_OBJECTAGG(`key`, i) OVER w AS agg
       FROM t WINDOW w AS (ORDER BY i ROWS CURRENT ROW);

DROP TABLE t;