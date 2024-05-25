DROP TABLE IF EXISTS t_src;
DROP TABLE IF EXISTS t_dst;
CREATE TABLE t_src (id UInt32, v UInt32) ENGINE = MergeTree ORDER BY id PARTITION BY id;
CREATE TABLE t_dst (id UInt32, v UInt32) ENGINE = MergeTree ORDER BY id PARTITION BY id;
SYSTEM STOP MERGES t_src;
SYSTEM STOP MERGES t_dst;
INSERT INTO t_dst VALUES (1, 1);
INSERT INTO t_dst VALUES (1, 2);
INSERT INTO t_dst VALUES (1, 3);
INSERT INTO t_src VALUES (1, 4);
ALTER TABLE t_src MOVE PARTITION 1 TO TABLE t_dst;
SELECT *, _part FROM t_dst ORDER BY v;
DROP TABLE t_src;
DROP TABLE t_dst;