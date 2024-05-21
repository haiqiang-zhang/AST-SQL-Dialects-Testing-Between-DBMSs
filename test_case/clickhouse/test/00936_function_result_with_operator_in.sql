SET force_primary_key = 1;
DROP TABLE IF EXISTS samples;
CREATE TABLE samples (key UInt32, value UInt32) ENGINE = MergeTree() ORDER BY key PRIMARY KEY key;
INSERT INTO samples VALUES (1, 1)(2, 2)(3, 3)(4, 4)(5, 5);
SELECT count() FROM samples WHERE key IN range(10);
SELECT count() FROM samples WHERE key IN arraySlice(range(100), 5, 10);
SELECT count() FROM samples WHERE toUInt64(key) IN range(100);
SELECT 'empty:';
SELECT count() FROM samples WHERE key IN arraySlice(range(100), 10, 10);
SELECT 'a' IN splitByChar('c', 'abcdef');
SELECT 'errors:';
SELECT count() FROM samples WHERE 1 IN range(samples.value);
-- index is not used
SELECT count() FROM samples WHERE value IN range(3);
-- wrong type
SELECT 123 IN splitByChar('c', 'abcdef');
DROP TABLE samples;