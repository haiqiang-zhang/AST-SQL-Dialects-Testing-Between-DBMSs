SELECT AVG(DISTINCT id) FROM t1 GROUP BY id % 13;
SELECT SUM(DISTINCT id)/COUNT(DISTINCT id) FROM t1 GROUP BY id % 13;
INSERT INTO t1 SELECT id+1024 FROM t1;
INSERT INTO t1 SELECT id+2048 FROM t1;
INSERT INTO t1 SELECT id+4096 FROM t1;
INSERT INTO t1 SELECT id+8192 FROM t1;
SELECT SUM(DISTINCT id) sm FROM t1;
SELECT SUM(DISTINCT id) sm FROM t2;
SELECT SUM(DISTINCT id) sm FROM t1 group by id % 13;
SELECT SUM(DISTINCT id) sm FROM t1;
SELECT SUM(DISTINCT id) sm FROM t2;
SELECT SUM(DISTINCT id) sm FROM t1 GROUP BY id % 13;
DROP TABLE t1;
DROP TABLE t2;
