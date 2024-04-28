CREATE TABLE tbl_int (col1 INT);
INSERT INTO tbl_int VALUES (1), (2), (3), (4), (5), (6), (7), (8), (NULL), (NULL);

DROP TABLE tbl_int;
CREATE TABLE tbl_varchar (col1 VARCHAR(255));
INSERT INTO tbl_varchar VALUES
  ("abcd"), ("🍣"), ("🍺"), ("eeeeeeeeee"), ("ef"), ("AG"),
  ("a very long string that is longer than 42 characters"),
  ("lorem ipsum"), (NULL), (NULL);

DROP TABLE tbl_varchar;

CREATE TABLE tbl_varchar (col1 VARCHAR(255));
INSERT INTO tbl_varchar VALUES
--   |------------ 42 characters -------------|
  ("abcdefghijklmnopqrstuvwxyzabcdefghijklmnop"),
  ("abcdefghijklmnopqrstuvwxyzabcdefghijklmnoq"),
  ("abcdefghijklmnopqrstuvwxyzabcdefghijklmnor"),
  ("abcdefghijklmnopqrstuvwxyzabcdefghijklmnos"),
  ("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopp"),
  ("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopq"),
  ("abcdefghijklmnopqrstuvwxyzabcdefghijklmnoss"),
  ("abcdefghijklmnopqrstuvwxyzabcdefghijklmnost");

DROP TABLE tbl_varchar;
CREATE TABLE tbl_double (col1 DOUBLE);
INSERT INTO tbl_double VALUES (-1.1), (0.0), (1.1), (2.2), (3.3), (4.4), (5.5), (6.6), (NULL), (NULL);

DROP TABLE tbl_double;
CREATE TABLE tbl_time (col1 TIME);
INSERT INTO tbl_time VALUES
  ("-01:00:00"), ("00:00:00"), ("00:00:01"), ("00:01:00"), ("01:00:00"),
  ("01:01:00"), ("02:00:00"), ("03:00:00"), (NULL), (NULL);

DROP TABLE tbl_time;

CREATE TABLE tbl_time (col1 TIME(6));
INSERT INTO tbl_time VALUES
  ("00:00:00.000000"), ("00:00:00.000001"), ("00:00:00.000002"),
  ("00:00:00.000003"), ("00:00:00.000004"), ("00:00:00.000005");

DROP TABLE tbl_time;
CREATE TABLE tbl_date (col1 DATE);
INSERT INTO tbl_date VALUES
  ("1000-01-01"), ("9999-12-30"), ("2017-01-01"), ("2017-01-02"), ("2017-02-01"),
  ("2018-01-01"), ("2019-01-01"), ("3019-01-01"), (NULL), (NULL);

DROP TABLE tbl_date;
CREATE TABLE tbl_datetime (col1 DATETIME(6));
INSERT INTO tbl_datetime VALUES
  ("1000-01-01 00:00:00"), ("9999-12-31 23:59:59.999998"),
  ("2017-01-01 00:00:00"), ("2017-01-01 00:00:00.000001"),
  ("2017-02-01 00:00:00"), ("2018-01-01 00:00:00.999999"),
  ("2018-01-01 00:00:01"), ("3019-01-01 10:10:10.101010"), (NULL), (NULL);

DROP TABLE tbl_datetime;
CREATE TABLE tbl_decimal (col1 DECIMAL(65, 30));
INSERT INTO tbl_decimal VALUES
  (00000000000000000000000000000000000.000000000000000000000000000000),
  (99999999999999999999999999999999999.999999999999999999999999999998),
  (-99999999999999999999999999999999999.999999999999999999999999999999),
  (1), (2), (3), (4), (-1), (NULL), (NULL);

DROP TABLE tbl_decimal;
CREATE TABLE tbl_enum (col1 ENUM('red', 'black', 'blue', 'green'));
INSERT INTO tbl_enum VALUES ('red'), ('red'), ('black'), ('blue'), ('green'),
                            ('green'), (NULL), (NULL), (NULL);

DROP TABLE tbl_enum;
CREATE TABLE tbl_set (col1 SET('red', 'black', 'blue', 'green'));
INSERT INTO tbl_set VALUES ('red'), ('red,black'), ('black,green,blue'),
                           ('black,green,blue'), ('black,green,blue'),
                           ('green'), ('green,red'), ('red,green'), (NULL),
                           (NULL), (NULL);

DROP TABLE tbl_set;
CREATE TABLE t1 (col1 VARCHAR(255));
INSERT INTO t1 VALUES ("a"), ("a"), ("a"), ("a"), ("a"), ("a"), ("a"), ("b"),
                      ("c"), ("d");
DROP TABLE t1;

CREATE TABLE t1 (col1 DECIMAL);
INSERT INTO t1 VALUES (1.0), (1.0), (1.0), (1.0), (1.0), (1.0), (1.0), (2.0),
                      (3.0), (4.0);
DROP TABLE t1;

CREATE TABLE t1 (col1 BIGINT UNSIGNED);
INSERT INTO t1 VALUES (100), (100), (100), (100), (100), (100), (100), (200),
                      (300), (400);
DROP TABLE t1;


CREATE TABLE t1 (col1 TIME);
INSERT INTO t1 VALUES ("00:00:00"), ("00:00:00"), ("00:00:00"), ("00:00:00"),
                      ("00:00:00"), ("00:00:00"), ("00:00:00"), ("00:01:00"),
                      ("00:02:00"), ("00:03:00");
DROP TABLE t1;

-- Histogram construction bug example:
--
-- A data distribution with a few highly frequent largest values can cause
-- two distinct values that together account for almost the entire distribution
-- to end up in the same bucket, causing large potential errors in selectivity
-- estimates.

-- Explanation of the bug:
--
-- If during histogram construction, we end up in a state with at least as many
-- buckets remaining as there are there are distinct values remaining, we begin
-- adding buckets indiscriminately. If many "light" buckets are added this way,
-- the target threshold is moved far ahead of the actual cumulative frequency of
-- the buckets. It might then happen that placing two "heavy" values in the same
-- bucket will bring us closer to the target than just adding one.

delimiter //;

CREATE PROCEDURE insert_repeat(IN value INT, IN num_insertions INT)
BEGIN
  DECLARE i INT DEFAULT 0;
  SET i = 1;
    INSERT INTO t1 VALUES (value);
    SET i = i + 1;
  END WHILE;

CREATE PROCEDURE insert_range(IN first INT, IN last INT)
BEGIN
  DECLARE i INT DEFAULT 0;
  SET i = first;
    INSERT INTO t1 VALUES (i);
    SET i = i + 1;
  END WHILE;

CREATE TABLE t1(x INT);

-- With the bug the value 11 (25% of values) and 12 (50% of values) end up in the
-- same bucket. They should be placed in singleton buckets.
ANALYZE TABLE t1 UPDATE HISTOGRAM ON x WITH 10 BUCKETS;

-- It seems that we have to call ANALYZE TABLE for the histogram to be used.
-- TODO(christiani): Investigate if this is a bug.
ANALYZE TABLE t1;

-- Test that we get selectivity estimates that correspond to singleton buckets.
EXPLAIN SELECT * FROM t1 WHERE x = 11;

-- Create histograms for a couple of different data sets and verify manually that
-- the output looks reasonable.

-- Test case: Uniform data set.
-- Buckets should be evenly distributed and contain close to 10 values each.
CALL insert_range(1, 100);
SELECT JSON_PRETTY(JSON_REMOVE(histogram, '$."last-updated"'))
FROM INFORMATION_SCHEMA.column_statistics
WHERE table_name = 't1' AND column_name = 'x';

-- Test case: A few heavy hitters at the end.
-- The heavy values should be placed in singleton buckets and the remaining buckets
-- should be used efficiently, i.e, they should contain roughly 100/7 = 14.3
-- values each.
CALL insert_range(1, 100);
SELECT JSON_PRETTY(JSON_REMOVE(histogram, '$."last-updated"'))
FROM INFORMATION_SCHEMA.column_statistics
WHERE table_name = 't1' AND column_name = 'x';

-- Test case: Heavy hitters with a few values in between.
-- The heavy values should be placed in singleton buckets. This will force the
-- values between them, e.g. 1, 3-4, and 6-9, to be placed in their own buckets.
-- The remaining 4 buckets should contain approximately 23 values each.
CALL insert_range(1, 100);
SELECT JSON_PRETTY(JSON_REMOVE(histogram, '$."last-updated"'))
FROM INFORMATION_SCHEMA.column_statistics
WHERE table_name = 't1' AND column_name = 'x';

DROP TABLE t1;
DROP PROCEDURE insert_repeat;
DROP PROCEDURE insert_range;