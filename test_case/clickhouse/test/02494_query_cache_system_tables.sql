-- Tag no-parallel: Messes with internal cache

SYSTEM DROP QUERY CACHE;
SELECT 'The Default for query_cache_system_table_handling is = throw';
SELECT count(*) FROM system.query_cache;
SYSTEM DROP QUERY CACHE;
SELECT 'Check behavior of query_cache_system_table_handling = throw';
SELECT count(*) FROM system.query_cache;
SYSTEM DROP QUERY CACHE;
SELECT 'Check behavior of query_cache_system_table_handling = save';
SELECT * FROM system.one SETTINGS use_query_cache = 1, query_cache_system_table_handling = 'save';
SELECT count(*) FROM system.query_cache;
SYSTEM DROP QUERY CACHE;
SELECT 'Check behavior of query_cache_system_table_handling = ignore';
SELECT * FROM system.one SETTINGS use_query_cache = 1, query_cache_system_table_handling = 'ignore';
SELECT count(*) FROM system.query_cache;
SYSTEM DROP QUERY CACHE;
SELECT 'Other tests';
USE system;
SELECT * FROM one SETTINGS use_query_cache = 1;
-- This query uses system.zero internally. Since the query cache works at AST level it does not "see' system.zero and must not complain.
SELECT * SETTINGS use_query_cache = 1;
-- Criminal edge case that a user creates a table named "system". The query cache must not reject queries against it.
DROP TABLE IF EXISTS system;
CREATE TABLE system (c UInt64) ENGINE = Memory;
SElECT * FROM system SETTINGS use_query_cache = 1;
DROP TABLE system;
DROP TABLE IF EXISTS system.system;
CREATE TABLE system.system (c UInt64) ENGINE = Memory;
DROP TABLE system.system;
SYSTEM DROP QUERY CACHE;