--
-- Simple key
--

DROP TABLE IF EXISTS simple_key_source_table_01862;
CREATE TABLE simple_key_source_table_01862
(
    id UInt64,
    value String
) ENGINE = Memory();
INSERT INTO simple_key_source_table_01862 VALUES (1, 'First');
INSERT INTO simple_key_source_table_01862 VALUES (1, 'First');
DROP DICTIONARY IF EXISTS simple_key_flat_dictionary_01862;
CREATE DICTIONARY simple_key_flat_dictionary_01862
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE 'simple_key_source_table_01862'))
LAYOUT(FLAT())
LIFETIME(MIN 0 MAX 1000);
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'simple_key_flat_dictionary_01862';
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'simple_key_flat_dictionary_01862';
SELECT name, round(found_rate, 2) FROM system.dictionaries WHERE database = currentDatabase() AND name = 'simple_key_flat_dictionary_01862';
DROP DICTIONARY simple_key_flat_dictionary_01862;
DROP DICTIONARY IF EXISTS simple_key_direct_dictionary_01862;
CREATE DICTIONARY simple_key_direct_dictionary_01862
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE 'simple_key_source_table_01862'))
LAYOUT(DIRECT());
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'simple_key_direct_dictionary_01862';
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'simple_key_direct_dictionary_01862';
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'simple_key_direct_dictionary_01862';
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'simple_key_direct_dictionary_01862';
DROP DICTIONARY simple_key_direct_dictionary_01862;
DROP DICTIONARY IF EXISTS simple_key_hashed_dictionary_01862;
CREATE DICTIONARY simple_key_hashed_dictionary_01862
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE 'simple_key_source_table_01862'))
LAYOUT(HASHED())
LIFETIME(MIN 0 MAX 1000);
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'simple_key_hashed_dictionary_01862';
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'simple_key_hashed_dictionary_01862';
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'simple_key_hashed_dictionary_01862';
DROP DICTIONARY simple_key_hashed_dictionary_01862;
DROP DICTIONARY IF EXISTS simple_key_sparse_hashed_dictionary_01862;
CREATE DICTIONARY simple_key_sparse_hashed_dictionary_01862
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE 'simple_key_source_table_01862'))
LAYOUT(SPARSE_HASHED())
LIFETIME(MIN 0 MAX 1000);
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'simple_key_sparse_hashed_dictionary_01862';
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'simple_key_sparse_hashed_dictionary_01862';
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'simple_key_sparse_hashed_dictionary_01862';
DROP DICTIONARY simple_key_sparse_hashed_dictionary_01862;
DROP DICTIONARY IF EXISTS simple_key_cache_dictionary_01862;
CREATE DICTIONARY simple_key_cache_dictionary_01862
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE 'simple_key_source_table_01862'))
LAYOUT(CACHE(SIZE_IN_CELLS 100000))
LIFETIME(MIN 0 MAX 1000);
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'simple_key_cache_dictionary_01862';
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'simple_key_cache_dictionary_01862';
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'simple_key_cache_dictionary_01862';
DROP DICTIONARY simple_key_cache_dictionary_01862;
DROP TABLE simple_key_source_table_01862;
-- Complex key
--

DROP TABLE IF EXISTS complex_key_source_table_01862;
CREATE TABLE complex_key_source_table_01862
(
    id UInt64,
    id_key String,
    value String
) ENGINE = Memory();
INSERT INTO complex_key_source_table_01862 VALUES (1, 'FirstKey', 'First');
INSERT INTO complex_key_source_table_01862 VALUES (1, 'FirstKey', 'First');
DROP DICTIONARY IF EXISTS complex_key_hashed_dictionary_01862;
CREATE DICTIONARY complex_key_hashed_dictionary_01862
(
    id UInt64,
    id_key String,
    value String
)
PRIMARY KEY id, id_key
SOURCE(CLICKHOUSE(TABLE 'complex_key_source_table_01862'))
LAYOUT(COMPLEX_KEY_HASHED())
LIFETIME(MIN 0 MAX 1000);
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'complex_key_hashed_dictionary_01862';
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'complex_key_hashed_dictionary_01862';
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'complex_key_hashed_dictionary_01862';
DROP DICTIONARY complex_key_hashed_dictionary_01862;
DROP DICTIONARY IF EXISTS complex_key_direct_dictionary_01862;
CREATE DICTIONARY complex_key_direct_dictionary_01862
(
    id UInt64,
    id_key String,
    value String
)
PRIMARY KEY id, id_key
SOURCE(CLICKHOUSE(TABLE 'complex_key_source_table_01862'))
LAYOUT(COMPLEX_KEY_DIRECT());
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'complex_key_direct_dictionary_01862';
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'complex_key_direct_dictionary_01862';
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'complex_key_direct_dictionary_01862';
DROP DICTIONARY complex_key_direct_dictionary_01862;
DROP DICTIONARY IF EXISTS complex_key_cache_dictionary_01862;
CREATE DICTIONARY complex_key_cache_dictionary_01862
(
    id UInt64,
    id_key String,
    value String
)
PRIMARY KEY id, id_key
SOURCE(CLICKHOUSE(TABLE 'complex_key_source_table_01862'))
LAYOUT(COMPLEX_KEY_CACHE(SIZE_IN_CELLS 100000))
LIFETIME(MIN 0 MAX 1000);
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'complex_key_cache_dictionary_01862';
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'complex_key_cache_dictionary_01862';
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'complex_key_cache_dictionary_01862';
DROP DICTIONARY complex_key_cache_dictionary_01862;
DROP TABLE complex_key_source_table_01862;
-- Range
--
DROP TABLE IF EXISTS range_key_source_table_01862;
CREATE TABLE range_key_source_table_01862
(
    id UInt64,
    value String,
    first Date,
    last Date
) ENGINE = Memory();
INSERT INTO range_key_source_table_01862 VALUES (1, 'First', today(), today());
INSERT INTO range_key_source_table_01862 VALUES (1, 'First', today(), today());
DROP DICTIONARY IF EXISTS simple_key_range_hashed_dictionary_01862;
CREATE DICTIONARY simple_key_range_hashed_dictionary_01862
(
    id UInt64,
    value String,
    first Date,
    last Date
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE 'range_key_source_table_01862'))
LAYOUT(RANGE_HASHED())
RANGE(MIN first MAX last)
LIFETIME(MIN 0 MAX 1000);
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'simple_key_range_hashed_dictionary_01862';
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'simple_key_range_hashed_dictionary_01862';
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'simple_key_range_hashed_dictionary_01862';
DROP DICTIONARY simple_key_range_hashed_dictionary_01862;
DROP TABLE range_key_source_table_01862;
-- IP Trie
--
DROP TABLE IF EXISTS ip_trie_source_table_01862;
CREATE TABLE ip_trie_source_table_01862
(
    prefix String,
    value String
) ENGINE = Memory();
INSERT INTO ip_trie_source_table_01862 VALUES ('127.0.0.0/8', 'First');
INSERT INTO ip_trie_source_table_01862 VALUES ('127.0.0.0/8', 'First');
DROP DICTIONARY IF EXISTS ip_trie_dictionary_01862;
CREATE DICTIONARY ip_trie_dictionary_01862
(
    prefix String,
    value String
)
PRIMARY KEY prefix
SOURCE(CLICKHOUSE(TABLE 'ip_trie_source_table_01862'))
LAYOUT(IP_TRIE())
LIFETIME(MIN 0 MAX 1000);
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'ip_trie_dictionary_01862';
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'ip_trie_dictionary_01862';
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'ip_trie_dictionary_01862';
DROP DICTIONARY ip_trie_dictionary_01862;
DROP TABLE ip_trie_source_table_01862;
DROP TABLE IF EXISTS polygons_01862;
CREATE TABLE polygons_01862 (
    key Array(Array(Array(Tuple(Float64, Float64)))),
    name String
) ENGINE = Memory;
INSERT INTO polygons_01862 VALUES ([[[(3, 1), (0, 1), (0, -1), (3, -1)]]], 'Click East');
INSERT INTO polygons_01862 VALUES ([[[(-1, 1), (1, 1), (1, 3), (-1, 3)]]], 'Click North');
INSERT INTO polygons_01862 VALUES ([[[(-3, 1), (-3, -1), (0, -1), (0, 1)]]], 'Click South');
INSERT INTO polygons_01862 VALUES ([[[(-1, -1), (1, -1), (1, -3), (-1, -3)]]], 'Click West');
DROP TABLE IF EXISTS points_01862;
CREATE TABLE points_01862 (x Float64, y Float64) ENGINE = Memory;
INSERT INTO points_01862 VALUES ( 0.1,  0.0);
INSERT INTO points_01862 VALUES (-0.1,  0.0);
INSERT INTO points_01862 VALUES ( 0.0,  1.1);
INSERT INTO points_01862 VALUES ( 0.0, -1.1);
INSERT INTO points_01862 VALUES ( 3.0,  3.0);
DROP DICTIONARY IF EXISTS polygon_dictionary_01862;
CREATE DICTIONARY polygon_dictionary_01862
(
    key Array(Array(Array(Tuple(Float64, Float64)))),
    name String
)
PRIMARY KEY key
SOURCE(CLICKHOUSE(USER 'default' TABLE 'polygons_01862'))
LIFETIME(0)
LAYOUT(POLYGON());
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'polygon_dictionary_01862';
SELECT name, found_rate FROM system.dictionaries WHERE database = currentDatabase() AND name = 'polygon_dictionary_01862';
DROP TABLE polygons_01862;
DROP TABLE points_01862;
DROP DICTIONARY polygon_dictionary_01862;