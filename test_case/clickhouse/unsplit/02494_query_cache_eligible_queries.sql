-- Tag no-parallel: Messes with internal cache

SYSTEM DROP QUERY CACHE;
DROP TABLE IF EXISTS eligible_test;
DROP TABLE IF EXISTS eligible_test2;
SET use_query_cache = true;
SET query_cache_system_table_handling = 'save';
SELECT 1 SETTINGS use_query_cache = true;
SELECT COUNT(*) FROM system.query_cache;
SYSTEM DROP QUERY CACHE;
-- CREATE
CREATE TABLE eligible_test (a String) ENGINE=MergeTree ORDER BY a;
SELECT COUNT(*) FROM system.query_cache;
ALTER TABLE eligible_test ADD COLUMN b String SETTINGS use_query_cache = true;
SELECT COUNT(*) FROM system.query_cache;
INSERT INTO eligible_test VALUES('a', 'b');
SELECT COUNT(*) FROM system.query_cache;
INSERT INTO eligible_test SELECT * FROM eligible_test SETTINGS use_query_cache = true;
SELECT COUNT(*) FROM system.query_cache;
SHOW TABLES SETTINGS use_query_cache = true;
SELECT COUNT(*) FROM system.query_cache;
CHECK TABLE eligible_test SETTINGS use_query_cache = true;
SELECT COUNT(*) FROM system.query_cache;
DESCRIBE TABLE eligible_test SETTINGS use_query_cache = true;
SELECT COUNT(*) FROM system.query_cache;
EXISTS TABLE eligible_test SETTINGS use_query_cache = true;
SELECT COUNT(*) FROM system.query_cache;
KILL QUERY WHERE query_id='3-857d-4a57-9ee0-3c7da5d60a90' SETTINGS use_query_cache = true;
SELECT COUNT(*) FROM system.query_cache;
OPTIMIZE TABLE eligible_test FINAL SETTINGS use_query_cache = true;
SELECT COUNT(*) FROM system.query_cache;
TRUNCATE TABLE eligible_test SETTINGS use_query_cache = true;
SELECT COUNT(*) FROM system.query_cache;
RENAME TABLE eligible_test TO eligible_test2 SETTINGS use_query_cache = true;
SELECT COUNT(*) FROM system.query_cache;
SYSTEM DROP QUERY CACHE;
DROP TABLE eligible_test2;
