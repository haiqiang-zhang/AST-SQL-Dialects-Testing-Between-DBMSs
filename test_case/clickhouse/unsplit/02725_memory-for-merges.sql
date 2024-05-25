DROP TABLE IF EXISTS 02725_memory_for_merges SYNC;
CREATE TABLE 02725_memory_for_merges
(   n UInt64,
    s String
)
ENGINE = MergeTree
ORDER BY n
SETTINGS merge_max_block_size_bytes=1024, index_granularity_bytes=1024;
INSERT INTO 02725_memory_for_merges SELECT number, randomPrintableASCII(1000000) FROM numbers(100);
INSERT INTO 02725_memory_for_merges SELECT number, randomPrintableASCII(1000000) FROM numbers(100);
INSERT INTO 02725_memory_for_merges SELECT number, randomPrintableASCII(1000000) FROM numbers(100);
INSERT INTO 02725_memory_for_merges SELECT number, randomPrintableASCII(1000000) FROM numbers(100);
INSERT INTO 02725_memory_for_merges SELECT number, randomPrintableASCII(1000000) FROM numbers(100);
OPTIMIZE TABLE 02725_memory_for_merges FINAL;
SYSTEM FLUSH LOGS;
DROP TABLE IF EXISTS 02725_memory_for_merges SYNC;
