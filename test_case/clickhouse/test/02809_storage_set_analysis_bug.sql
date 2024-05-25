set allow_suspicious_low_cardinality_types = 1;
CREATE TABLE null_in__fuzz_6 (`dt` LowCardinality(UInt16), `idx` Int32, `i` Nullable(Int256), `s` Int32) ENGINE = MergeTree PARTITION BY dt ORDER BY idx;
insert into null_in__fuzz_6 select * from generateRandom() limit 1;
SET transform_null_in = 0;
CREATE TABLE test_set (i Nullable(int)) ENGINE = Set();
INSERT INTO test_set VALUES (1), (NULL);
DROP TABLE test_set;
DROP TABLE null_in__fuzz_6;
