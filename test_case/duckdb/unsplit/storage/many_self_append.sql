CREATE TABLE vals(i TINYINT);
INSERT INTO vals SELECT (CASE WHEN i % 2 = 0 THEN NULL ELSE i % 100 END)::TINYINT i FROM range(10) tbl(i);
INSERT INTO vals SELECT * FROM vals;
CHECKPOINT;
INSERT INTO vals SELECT * FROM vals;
CHECKPOINT;
INSERT INTO vals SELECT * FROM vals;
CHECKPOINT;
INSERT INTO vals SELECT * FROM vals;
CHECKPOINT;
INSERT INTO vals SELECT * FROM vals;
CHECKPOINT;
SELECT MIN(i), MAX(i), COUNT(i), COUNT(*) FROM vals;
SELECT MIN(i), MAX(i), COUNT(i), COUNT(*) FROM vals;
SELECT MIN(i), MAX(i), COUNT(i), COUNT(*) FROM vals;
SELECT MIN(i), MAX(i), COUNT(i), COUNT(*) FROM vals;
SELECT MIN(i), MAX(i), COUNT(i), COUNT(*) FROM vals;
SELECT MIN(i), MAX(i), COUNT(i), COUNT(*) FROM vals;
