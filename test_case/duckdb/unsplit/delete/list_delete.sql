PRAGMA enable_verification;
CREATE TABLE aggr (k int[]);
INSERT INTO aggr VALUES ([0, 1, 1, 1, 4, 0, 3, 3, 2, 2, 4, 4, 2, 4, 0, 0, 0, 1, 2, 3, 4, 2, 3, 3, 1]);
INSERT INTO aggr VALUES ([]), ([NULL]), (NULL), ([0, 1, 1, 1, 4, NULL, 0, 3, 3, 2, NULL, 2, 4, 4, 2, 4, 0, 0, 0, 1, NULL, 2, 3, 4, 2, 3, 3, 1]);
DELETE FROM aggr;
SELECT COUNT(k) FROM aggr;
SELECT COUNT(k) FROM aggr;
