PRAGMA enable_verification;
CREATE TABLE integers(i INTEGER);
INSERT INTO integers SELECT 1 FROM range(65534);
INSERT INTO integers SELECT 2 FROM range(65534);
INSERT INTO integers SELECT 3 FROM range(65534);
INSERT INTO integers SELECT 4 FROM range(65534);
INSERT INTO integers SELECT 5 FROM range(65534);
SELECT SUM(i) FROM integers WHERE i=1;
SELECT SUM(i) FROM integers WHERE i=2;
SELECT SUM(i) FROM integers WHERE i=3;
SELECT SUM(i) FROM integers WHERE i=4;
SELECT SUM(i) FROM integers WHERE i=1;
SELECT SUM(i) FROM integers WHERE i=2;
SELECT SUM(i) FROM integers WHERE i=3;
SELECT SUM(i) FROM integers WHERE i=4;
SELECT SUM(i) FROM integers WHERE i=4;
SELECT SUM(i) FROM integers WHERE i=5;
SELECT SUM(i) FROM integers WHERE i=1;
SELECT SUM(i) FROM integers WHERE i=2;
SELECT SUM(i) FROM integers WHERE i=3;
SELECT SUM(i) FROM integers WHERE i=4;
SELECT SUM(i) FROM integers WHERE i=5;
SELECT SUM(i) FROM integers WHERE i=6;