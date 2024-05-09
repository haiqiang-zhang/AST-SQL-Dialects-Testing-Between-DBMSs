SELECT COUNT(@@GLOBAL.table_open_cache);
SELECT IF(@@open_files_limit < 5000, 4000, @@GLOBAL.table_open_cache);
SELECT @@GLOBAL.table_open_cache;
SELECT @@GLOBAL.table_open_cache;
SELECT @@GLOBAL.table_open_cache;
SELECT @@GLOBAL.table_open_cache = VARIABLE_VALUE
FROM performance_schema.global_variables
WHERE VARIABLE_NAME='table_open_cache';
SELECT COUNT(@@GLOBAL.table_open_cache);
SELECT COUNT(VARIABLE_VALUE)
FROM performance_schema.global_variables 
WHERE VARIABLE_NAME='table_open_cache';
SELECT @@table_open_cache = @@GLOBAL.table_open_cache;
SELECT COUNT(@@GLOBAL.table_open_cache);
DROP TABLE IF EXISTS tab1;
DROP TABLE IF EXISTS tab2;
DROP TABLE IF EXISTS tab3;
select (select variable_value from performance_schema.session_status where variable_name ='Opened_tables') = @opened_tables;
select (select variable_value from performance_schema.session_status where variable_name ='Table_open_cache_hits') = @open_cache_hits + 2;
select (select variable_value from performance_schema.session_status where variable_name ='Table_open_cache_misses') = @open_cache_miss;
select (select variable_value from performance_schema.session_status where variable_name ='Table_open_cache_overflows') = @open_cache_overflow;
select (select variable_value from performance_schema.session_status where variable_name ='Opened_tables') = @opened_tables + 1;
select (select variable_value from performance_schema.session_status where variable_name ='Table_open_cache_hits') = @open_cache_hits + 2;
select (select variable_value from performance_schema.session_status where variable_name ='Table_open_cache_misses') = @open_cache_miss + 1;
select (select variable_value from performance_schema.session_status where variable_name ='Table_open_cache_overflows') = @open_cache_overflow + 1;
select (select variable_value from performance_schema.session_status where variable_name ='Opened_tables') = @opened_tables;
select (select variable_value from performance_schema.session_status where variable_name ='Table_open_cache_hits') = @open_cache_hits + 1;
select (select variable_value from performance_schema.session_status where variable_name ='Table_open_cache_misses') = @open_cache_miss;
select (select variable_value from performance_schema.session_status where variable_name ='Table_open_cache_overflows') = @open_cache_overflow;
select (select variable_value from performance_schema.global_status where variable_name ='Opened_tables') = @global_opened_tables;
select (select variable_value from performance_schema.global_status where variable_name ='Table_open_cache_hits') = @global_open_cache_hits + 1;
select (select variable_value from performance_schema.global_status where variable_name ='Table_open_cache_misses') = @global_open_cache_miss;
select (select variable_value from performance_schema.global_status where variable_name ='Table_open_cache_overflows') = @global_open_cache_overflow;
select (select variable_value from performance_schema.session_status where variable_name ='Opened_tables') = @opened_tables + 1;
select (select variable_value from performance_schema.session_status where variable_name ='Table_open_cache_hits') = @open_cache_hits;
select (select variable_value from performance_schema.session_status where variable_name ='Table_open_cache_misses') = @open_cache_miss + 1;
select (select variable_value from performance_schema.session_status where variable_name ='Table_open_cache_overflows') = @open_cache_overflow + 1;
select (select variable_value from performance_schema.global_status where variable_name ='Opened_tables') = @global_opened_tables + 1;
select (select variable_value from performance_schema.global_status where variable_name ='Table_open_cache_hits') = @global_open_cache_hits + 1;
select (select variable_value from performance_schema.global_status where variable_name ='Table_open_cache_misses') = @global_open_cache_miss + 1;
select (select variable_value from performance_schema.global_status where variable_name ='Table_open_cache_overflows') = @global_open_cache_overflow + 1;
DROP TABLE IF EXISTS tab1;
DROP TABLE IF EXISTS tab2;
DROP TABLE IF EXISTS tab3;
