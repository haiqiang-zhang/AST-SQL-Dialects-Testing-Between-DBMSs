CREATE TABLE t1 (f0 INT KEY AUTO_INCREMENT, f1 INT, f2 INT);
CREATE TABLE t2 (f0 INT KEY AUTO_INCREMENT, f1 INT, f2 INT) ENGINE=MYISAM;
CREATE TABLE t3 (f0 INT KEY AUTO_INCREMENT, f1 INT, f2 INT, KEY (f0), KEY (f1), KEY (f1, f2));
INSERT INTO t1 (f1, f2) VALUES (1,1 ),(2,2),(3,3),(4,4);
INSERT INTO t1 (f1, f2) SELECT f1, f2 FROM t1;
INSERT INTO t1 (f1, f2) SELECT f1, f2 FROM t1;
INSERT INTO t1 (f1, f2) SELECT f1, f2 FROM t1;
INSERT INTO t2 (f1, f2) SELECT f1, f2 FROM t1;
INSERT INTO t3 (f1, f2) SELECT f1, f2 FROM t1;
DELETE FROM t1 WHERE f1=1;
DELETE FROM t2 WHERE f1=1;
SELECT COUNT(*) FROM t1;
SELECT COUNT(*) FROM t2;
SELECT COUNT(*) FROM t3;
SELECT table_rows, avg_row_length, data_length, max_data_length, index_length,
       data_free, auto_increment, checksum, update_time, check_time
FROM information_schema.tables WHERE table_name in ('t1', 't2');
SELECT * FROM information_schema.statistics WHERE table_name='t3'
ORDER BY index_name, seq_in_index;
SELECT table_rows, avg_row_length, data_length, max_data_length, index_length,
       data_free, auto_increment, checksum, update_time, check_time
FROM information_schema.tables WHERE table_name in ('t1', 't2');
SELECT * FROM information_schema.statistics WHERE table_name='t3'
ORDER BY index_name, seq_in_index;
DROP TABLE t1;
DROP TABLE t2;
DROP TABLE t3;
