CREATE TABLE t__fuzz_0 (`i` Int32, `j` Nullable(Int32), `k` Int32, PROJECTION p (SELECT * ORDER BY j)) ENGINE = MergeTree ORDER BY i SETTINGS index_granularity = 1, allow_nullable_key=1;
INSERT INTO t__fuzz_0 SELECT * FROM generateRandom() LIMIT 3;
INSERT INTO t__fuzz_0 SELECT * FROM generateRandom() LIMIT 3;
INSERT INTO t__fuzz_0 SELECT * FROM generateRandom() LIMIT 3;
INSERT INTO t__fuzz_0 SELECT * FROM generateRandom() LIMIT 3;
INSERT INTO t__fuzz_0 SELECT * FROM generateRandom() LIMIT 3;