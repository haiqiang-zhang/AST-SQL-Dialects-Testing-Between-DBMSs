SELECT 'Bloom filter on sort key';
DROP TABLE IF EXISTS bloom_filter_sizing_pk;
CREATE TABLE bloom_filter_sizing_pk(
  key UInt64,
  value UInt64,

  -- Very high granularity to have one filter per part.
  INDEX key_bf key TYPE bloom_filter(0.01) GRANULARITY 2147483648
) ENGINE=MergeTree ORDER BY key;
INSERT INTO bloom_filter_sizing_pk
SELECT
number % 100 as key, -- 100 unique keys
number as value -- whatever
FROM numbers(1000 * 1000);

OPTIMIZE TABLE bloom_filter_sizing_pk FINAL;
SELECT COUNT() from bloom_filter_sizing_pk WHERE key = 1;
SELECT COUNT() from system.parts where database = currentDatabase() AND table = 'bloom_filter_sizing_pk' and secondary_indices_uncompressed_bytes > 200 and active;
SELECT 'Bloom filter on non-sort key';
DROP TABLE IF EXISTS bloom_filter_sizing_sec;
CREATE TABLE bloom_filter_sizing_sec(
  key1 UInt64,
  key2 UInt64,
  value UInt64,

  -- Very high granularity to have one filter per part.
  INDEX key_bf key2 TYPE bloom_filter(0.01) GRANULARITY 2147483648
) ENGINE=MergeTree ORDER BY key1;

OPTIMIZE TABLE bloom_filter_sizing_sec FINAL;
SELECT COUNT() from bloom_filter_sizing_sec WHERE key1 = 1;
SELECT COUNT() from system.parts where database = currentDatabase() AND table = 'bloom_filter_sizing_sec' and secondary_indices_uncompressed_bytes > 200 and active;
