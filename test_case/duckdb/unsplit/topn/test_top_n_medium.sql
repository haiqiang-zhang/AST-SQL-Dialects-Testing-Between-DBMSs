PRAGMA enable_verification;
CREATE TABLE tbl AS SELECT i, i % 1000 j FROM range(1000000) tbl(i);
SELECT * FROM tbl ORDER BY j, i LIMIT 5;
SELECT * FROM tbl ORDER BY j DESC, i DESC LIMIT 5;