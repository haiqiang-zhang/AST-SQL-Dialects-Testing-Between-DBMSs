PRAGMA enable_verification;
CREATE TABLE integers(i INTEGER, j INTEGER);
INSERT INTO integers VALUES (1, 1), (2, 2), (3, 3), (NULL, NULL);
EXPLAIN SELECT * FROM integers;
EXPLAIN select sum(i), j, sum(i), j from integers group by j having j < 10;;
EXPLAIN update integers set i=i+1;;
EXPLAIN delete from integers where i=1;;