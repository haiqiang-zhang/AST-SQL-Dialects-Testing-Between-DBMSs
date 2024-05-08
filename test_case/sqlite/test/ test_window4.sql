DROP TABLE IF EXISTS t3;
CREATE TABLE t3(a TEXT PRIMARY KEY);
INSERT INTO t3 VALUES('a'), ('b'), ('c'), ('d'), ('e');
INSERT INTO t3 VALUES('f'), ('g'), ('h'), ('i'), ('j');
SELECT a, ntile(1) OVER (ORDER BY a) FROM t3;
SELECT a, ntile(2) OVER (ORDER BY a) FROM t3;
SELECT a, ntile(3) OVER (ORDER BY a) FROM t3;
SELECT a, ntile(4) OVER (ORDER BY a) FROM t3;
SELECT a, ntile(5) OVER (ORDER BY a) FROM t3;
SELECT a, ntile(6) OVER (ORDER BY a) FROM t3;
SELECT a, ntile(7) OVER (ORDER BY a) FROM t3;
SELECT a, ntile(8) OVER (ORDER BY a) FROM t3;
SELECT a, ntile(9) OVER (ORDER BY a) FROM t3;
SELECT a, ntile(10) OVER (ORDER BY a) FROM t3;
SELECT a, ntile(11) OVER (ORDER BY a) FROM t3;
SELECT a, ntile(12) OVER (ORDER BY a) FROM t3;
SELECT a, ntile(13) OVER (ORDER BY a) FROM t3;
SELECT a, ntile(14) OVER (ORDER BY a) FROM t3;
SELECT a, ntile(15) OVER (ORDER BY a) FROM t3;
SELECT a, ntile(16) OVER (ORDER BY a) FROM t3;
SELECT a, ntile(17) OVER (ORDER BY a) FROM t3;
SELECT a, ntile(18) OVER (ORDER BY a) FROM t3;
SELECT a, ntile(19) OVER (ORDER BY a) FROM t3;
DROP TABLE IF EXISTS t4;
CREATE TABLE t4(a INTEGER PRIMARY KEY, b TEXT, c INTEGER);
INSERT INTO t4 VALUES(1, 'A', 9);
INSERT INTO t4 VALUES(2, 'B', 3);
INSERT INTO t4 VALUES(3, 'C', 2);
INSERT INTO t4 VALUES(4, 'D', 10);
INSERT INTO t4 VALUES(5, 'E', 5);
INSERT INTO t4 VALUES(6, 'F', 1);
INSERT INTO t4 VALUES(7, 'G', 1);
INSERT INTO t4 VALUES(8, 'H', 2);
INSERT INTO t4 VALUES(9, 'I', 10);
INSERT INTO t4 VALUES(10, 'J', 4);
SELECT a, nth_value(b, c) OVER (ORDER BY a) FROM t4;
SELECT a, lead(b) OVER (ORDER BY a) FROM t4;
SELECT a, lead(b, 2) OVER (ORDER BY a) FROM t4;
SELECT a, lead(b, 3, 'abc') OVER (ORDER BY a) FROM t4;
SELECT a, lag(b) OVER (ORDER BY a) FROM t4;
SELECT a, lag(b, 2) OVER (ORDER BY a) FROM t4;
SELECT a, lag(b, 3, 'abc') OVER (ORDER BY a) FROM t4;
SELECT group_concat(b, '.') OVER (
    ORDER BY a ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
  ) FROM t4;
DROP TABLE IF EXISTS t5;
CREATE TABLE t5(a INTEGER PRIMARY KEY, b TEXT, c TEXT, d INTEGER);
INSERT INTO t5 VALUES(1, 'A', 'one',   5);
INSERT INTO t5 VALUES(2, 'B', 'two',   4);
INSERT INTO t5 VALUES(3, 'A', 'three', 3);
INSERT INTO t5 VALUES(4, 'B', 'four',  2);
INSERT INTO t5 VALUES(5, 'A', 'five',  1);
SELECT a, nth_value(c, d) OVER (ORDER BY b) FROM t5;
SELECT a, nth_value(c, d) OVER (PARTITION BY b ORDER BY a) FROM t5;
SELECT a, count(*) OVER abc, count(*) OVER def FROM t5
  WINDOW abc AS (ORDER BY a), 
         def AS (ORDER BY a DESC)
  ORDER BY a;
SELECT a, max(a) FILTER (WHERE (a%2)=0) OVER w FROM t5 
  WINDOW w AS (ORDER BY a);
SELECT a, max(c) OVER (ORDER BY a ROWS BETWEEN 1 PRECEDING AND 2 PRECEDING)
  FROM t5;
SELECT a, max(c) OVER (ORDER BY a ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING)
  FROM t5;
SELECT a, max(c) OVER (ORDER BY a ROWS BETWEEN 0 PRECEDING AND 0 PRECEDING)
  FROM t5;
SELECT a, max(c) OVER (ORDER BY a ROWS BETWEEN 2 FOLLOWING AND 1 FOLLOWING)
  FROM t5;
SELECT a, max(c) OVER (ORDER BY a ROWS BETWEEN 1 FOLLOWING AND 1 FOLLOWING)
  FROM t5;
SELECT a, max(c) OVER (ORDER BY a ROWS BETWEEN 0 FOLLOWING AND 0 FOLLOWING)
  FROM t5;
DROP TABLE IF EXISTS ttt;
CREATE TABLE ttt(a INTEGER PRIMARY KEY, b INTEGER, c INTEGER);
INSERT INTO ttt VALUES(1, 1, 1);
INSERT INTO ttt VALUES(2, 2, 2);
INSERT INTO ttt VALUES(3, 3, 3);
INSERT INTO ttt VALUES(4, 1, 2);
INSERT INTO ttt VALUES(5, 2, 3);
INSERT INTO ttt VALUES(6, 3, 4);
INSERT INTO ttt VALUES(7, 1, 3);
INSERT INTO ttt VALUES(8, 2, 4);
INSERT INTO ttt VALUES(9, 3, 5);
SELECT max(c), max(b) OVER (ORDER BY b) FROM ttt GROUP BY b;
SELECT max(b) OVER (ORDER BY max(c)) FROM ttt GROUP BY b;
SELECT abs(max(b) OVER (ORDER BY b)) FROM ttt GROUP BY b;
SELECT sum(b) OVER (
    ORDER BY a RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
  ) FROM ttt;
SELECT max(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b, a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b, a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER ( ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER ( ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b, a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b, a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b, a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b, a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b, a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b, a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b, a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER ( ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b, a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER ( ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b, a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b, a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER ( ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER ( ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER ( ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b, a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER ( ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b, a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER ( ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER ( ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER ( ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER ( ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER ( ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER ( ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b, a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b, a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER ( ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER ( ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY a ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING), 
  min(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING), 
         sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING), 
  min(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING), 
         sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING), 
  min(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING), 
         sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING), 
  min(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING), 
         sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING), 
  min(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING), 
         sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING), 
  min(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING), 
         sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING), 
  min(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING), 
         sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING), 
  min(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING), 
         sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 1 FOLLOWING), 
  min(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 1 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 1 FOLLOWING), 
         sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 1 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 1 FOLLOWING), 
  min(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 2 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 1 FOLLOWING), 
         sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 2 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 1 FOLLOWING), 
  min(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 1 FOLLOWING), 
         sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 1 FOLLOWING), 
  min(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 0 PRECEDING AND 1 PRECEDING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 1 FOLLOWING), 
         sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 0 PRECEDING AND 1 PRECEDING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 1 FOLLOWING), 
  min(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 FOLLOWING AND 500 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 1 FOLLOWING), 
         sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 FOLLOWING AND 500 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 2 FOLLOWING), 
  min(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 1 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 2 FOLLOWING), 
         sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 1 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 2 FOLLOWING), 
  min(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 2 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 2 FOLLOWING), 
         sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 2 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 2 FOLLOWING), 
  min(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 2 FOLLOWING), 
         sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 2 FOLLOWING), 
  min(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 0 PRECEDING AND 1 PRECEDING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 2 FOLLOWING), 
         sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 0 PRECEDING AND 1 PRECEDING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 2 FOLLOWING), 
  min(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 FOLLOWING AND 500 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 2 FOLLOWING), 
         sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 FOLLOWING AND 500 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING), 
  min(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 1 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING), 
         sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 1 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING), 
  min(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 2 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING), 
         sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 2 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING), 
  min(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING), 
         sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING), 
  min(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 0 PRECEDING AND 1 PRECEDING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING), 
         sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 0 PRECEDING AND 1 PRECEDING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING), 
  min(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 FOLLOWING AND 500 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING), 
         sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 FOLLOWING AND 500 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 0 PRECEDING AND 1 PRECEDING), 
  min(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 1 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 0 PRECEDING AND 1 PRECEDING), 
         sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 1 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 0 PRECEDING AND 1 PRECEDING), 
  min(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 2 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 0 PRECEDING AND 1 PRECEDING), 
         sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 2 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 0 PRECEDING AND 1 PRECEDING), 
  min(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 0 PRECEDING AND 1 PRECEDING), 
         sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 0 PRECEDING AND 1 PRECEDING), 
  min(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 0 PRECEDING AND 1 PRECEDING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 0 PRECEDING AND 1 PRECEDING), 
         sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 0 PRECEDING AND 1 PRECEDING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 0 PRECEDING AND 1 PRECEDING), 
  min(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 FOLLOWING AND 500 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 0 PRECEDING AND 1 PRECEDING), 
         sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 FOLLOWING AND 500 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 FOLLOWING AND 500 FOLLOWING), 
  min(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 1 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 FOLLOWING AND 500 FOLLOWING), 
         sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 1 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 FOLLOWING AND 500 FOLLOWING), 
  min(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 2 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 FOLLOWING AND 500 FOLLOWING), 
         sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 3 PRECEDING AND 2 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 FOLLOWING AND 500 FOLLOWING), 
  min(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 FOLLOWING AND 500 FOLLOWING), 
         sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 FOLLOWING AND 500 FOLLOWING), 
  min(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 0 PRECEDING AND 1 PRECEDING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 FOLLOWING AND 500 FOLLOWING), 
         sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 0 PRECEDING AND 1 PRECEDING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 FOLLOWING AND 500 FOLLOWING), 
  min(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 FOLLOWING AND 500 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 FOLLOWING AND 500 FOLLOWING), 
         sum(c) OVER (PARTITION BY b ORDER BY a ROWS BETWEEN 1 FOLLOWING AND 500 FOLLOWING)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b ORDER BY a DESC RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b ORDER BY a DESC RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b  RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b  RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b ORDER BY b, a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b ORDER BY b, a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a DESC RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a DESC RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a DESC RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b ORDER BY a DESC RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a DESC RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b ORDER BY a DESC RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a DESC RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b  RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a DESC RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b  RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY a DESC RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b ORDER BY b, a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY a DESC RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b ORDER BY b, a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b  RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b  RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b  RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b ORDER BY a DESC RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b  RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b ORDER BY a DESC RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b  RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b  RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b  RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b  RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b  RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b ORDER BY b, a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b  RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b ORDER BY b, a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY b, a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY b, a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b ORDER BY a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY b, a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b ORDER BY a DESC RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY b, a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b ORDER BY a DESC RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY b, a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b  RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY b, a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b  RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT max(c) OVER (PARTITION BY b ORDER BY b, a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
  min(c) OVER (PARTITION BY b ORDER BY b, a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
SELECT sum(c) OVER (PARTITION BY b ORDER BY b, a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 
         sum(c) OVER (PARTITION BY b ORDER BY b, a RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  FROM ttt ORDER BY a;
DROP TABLE IF EXISTS t1;
CREATE TABLE t1(x INTEGER, y INTEGER);
INSERT INTO t1 VALUES(1, 2);
INSERT INTO t1 VALUES(3, 4);
INSERT INTO t1 VALUES(5, 6);
INSERT INTO t1 VALUES(7, 8);
INSERT INTO t1 VALUES(9, 10);
SELECT lead(y) OVER win FROM t1
  WINDOW win AS (ORDER BY x);
SELECT lead(y, 2) OVER win FROM t1
  WINDOW win AS (ORDER BY x);
SELECT lead(y, 3, -1) OVER win FROM t1
  WINDOW win AS (ORDER BY x);
SELECT 
    lead(y) OVER win, lead(y) OVER win
  FROM t1
  WINDOW win AS (ORDER BY x);
SELECT 
    lead(y) OVER win, 
    lead(y, 2) OVER win, 
    lead(y, 3, -1) OVER win
  FROM t1
  WINDOW win AS (ORDER BY x);
DROP TABLE IF EXISTS t1;
CREATE TABLE t1(a INTEGER, b INTEGER, c INTEGER, d INTEGER);
INSERT INTO t1 VALUES(1, 2, 3, 4);
INSERT INTO t1 VALUES(5, 6, 7, 8);
INSERT INTO t1 VALUES(9, 10, 11, 12);
SELECT row_number() OVER win,
         nth_value(d,2) OVER win,
         lead(d) OVER win
  FROM t1
  WINDOW win AS (ORDER BY a);
SELECT row_number() OVER win,
           rank() OVER win,
           dense_rank() OVER win,
           ntile(2) OVER win,
           first_value(d) OVER win,
           last_value(d) OVER win,
           nth_value(d,2) OVER win,
           lead(d) OVER win,
           lag(d) OVER win,
           max(d) OVER win,
           min(d) OVER win
    FROM t1
    WINDOW win AS (ORDER BY a);
DROP TABLE IF EXISTS t2;
CREATE TABLE t2(x INTEGER);
INSERT INTO t2 VALUES(1), (1), (1), (4), (4), (6), (7);
SELECT rank() OVER () FROM t2;
SELECT dense_rank() OVER (PARTITION BY x) FROM t2;
SELECT x, rank() OVER (ORDER BY x) FROM t2 ORDER BY 1,2;
SELECT DISTINCT x, rank() OVER (ORDER BY x) FROM t2 ORDER BY 1,2;
DROP TABLE IF EXISTS t7;
CREATE TABLE t7(id INTEGER PRIMARY KEY, a INTEGER, b INTEGER);
INSERT INTO t7(id, a, b) VALUES
    (1, 1, 2), (2, 1, NULL), (3, 1, 4),
    (4, 3, NULL), (5, 3, 8), (6, 3, 1);
SELECT id, min(b) OVER (PARTITION BY a ORDER BY id) FROM t7;
SELECT id, lead(b, -1) OVER (PARTITION BY a ORDER BY id) FROM t7;
SELECT id, lag(b, -1) OVER (PARTITION BY a ORDER BY id) FROM t7;
DROP VIEW IF EXISTS v8;
DROP TABLE IF EXISTS t8;
CREATE TABLE t8(t INT, total INT);
INSERT INTO t8 VALUES(0,2);
INSERT INTO t8 VALUES(5,1);
INSERT INTO t8 VALUES(10,1);
SELECT NTILE(256) OVER (ORDER BY total) - 1 AS nt FROM t8;
CREATE VIEW v8 AS SELECT NTILE(256) OVER (ORDER BY total) - 1 AS nt FROM t8;
SELECT * FROM v8;
SELECT * FROM (
    SELECT NTILE(256) OVER (ORDER BY total) - 1 AS nt FROM t8
  ) sub;
SELECT sum( min(t) ) OVER () FROM t8 GROUP BY total;
SELECT sum( max(t) ) OVER () FROM t8 GROUP BY total;
SELECT sum( min(t) ) OVER () FROM t8;
SELECT sum( max(t) ) OVER () FROM t8;
DROP TABLE IF EXISTS t2;
CREATE TABLE t2(a INTEGER);
INSERT INTO t2 VALUES(1), (2), (3);
SELECT (SELECT min(a) OVER ()) FROM t2;