DROP TABLE IF EXISTS t1, t2;
CREATE TABLE t1 (id INTEGER);
CREATE TABLE t2 (id INTEGER);
INSERT INTO t1 (id) VALUES (1), (1), (1),(1);
INSERT INTO t1 (id) SELECT id FROM t1;
INSERT INTO t1 (id) SELECT id FROM t1;
INSERT INTO t1 (id) SELECT id FROM t1;
INSERT INTO t1 (id) SELECT id FROM t1;
INSERT INTO t1 (id) SELECT id FROM t1;
INSERT INTO t1 SELECT id+1 FROM t1;
INSERT INTO t1 SELECT id+2 FROM t1;
INSERT INTO t1 SELECT id+4 FROM t1;
INSERT INTO t1 SELECT id+8 FROM t1;
INSERT INTO t1 SELECT id+16 FROM t1;
INSERT INTO t1 SELECT id+32 FROM t1;
INSERT INTO t1 SELECT id+64 FROM t1;
INSERT INTO t1 SELECT id+128 FROM t1;
INSERT INTO t1 SELECT id+256 FROM t1;
INSERT INTO t1 SELECT id+512 FROM t1;
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
