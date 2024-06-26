DROP TABLE IF EXISTS test_01307;
CREATE TABLE test_01307 (id UInt64, val String, INDEX ind val TYPE bloom_filter() GRANULARITY 1) ENGINE = MergeTree() ORDER BY id SETTINGS index_granularity = 2, index_granularity_bytes = '10Mi';
INSERT INTO test_01307 (id, val) select number as id, toString(number) as val from numbers(4);
