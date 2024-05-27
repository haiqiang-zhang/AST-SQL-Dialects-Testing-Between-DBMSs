DROP TABLE IF EXISTS test_table;
CREATE TABLE test_table
(
    key UInt64,
    value UInt16
) ENGINE=Memory() AS SELECT number, number FROM numbers(1e5);
DROP TABLE IF EXISTS test_table_nullable;
CREATE TABLE test_table_nullable
(
    key UInt64,
    value Nullable(UInt16)
) ENGINE=Memory() AS SELECT number, number % 2 == 0 ? NULL : number FROM numbers(1e5);
DROP TABLE IF EXISTS test_table_string;
CREATE TABLE test_table_string
(
    key String,
    value UInt16
) ENGINE=Memory() AS SELECT 'foo' || number::String, number FROM numbers(1e5);
DROP TABLE IF EXISTS test_table_complex;
CREATE TABLE test_table_complex
(
    key_1 UInt64,
    key_2 UInt64,
    value UInt16
) ENGINE=Memory() AS SELECT number, number, number FROM numbers(1e5);
DROP DICTIONARY IF EXISTS test_sparse_dictionary_load_factor;
CREATE DICTIONARY test_sparse_dictionary_load_factor
(
    key UInt64,
    value UInt16
) PRIMARY KEY key
SOURCE(CLICKHOUSE(TABLE test_table))
LAYOUT(SPARSE_HASHED(MAX_LOAD_FACTOR 0.90))
LIFETIME(0);