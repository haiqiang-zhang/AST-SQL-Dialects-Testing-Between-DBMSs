CREATE TABLE test_table as SELECT 1 as test_table_column;
COMMENT ON TABLE test_table IS 'very gezellige table';
ALTER TABLE test_table ADD COLUMN new_col INTEGER;
ALTER TABLE test_table ALTER new_col SET DATA TYPE TINYINT;
ALTER TABLE test_table ALTER new_col SET DATA TYPE TINYINT;
ALTER TABLE test_table ALTER COLUMN new_col SET DEFAULT 1;
ALTER TABLE test_table ALTER COLUMN new_col DROP DEFAULT;
ALTER TABLE test_table ALTER new_col SET DATA TYPE TINYINT;
ALTER TABLE test_table RENAME COLUMN new_col TO new_col_2;
ALTER TABLE test_table DROP COLUMN new_col_2;
ALTER TABLE test_table RENAME TO test_table_2;
ALTER TABLE test_table_2 RENAME TO test_table;
COMMENT ON TABLE test_table IS NULL;
CREATE VIEW test_view as SELECT 1 as test_view_column;
COMMENT ON VIEW test_view IS 'very gezellige view';
ALTER VIEW test_view RENAME TO test_view_2;
ALTER VIEW test_view_2 RENAME TO test_view;
COMMENT ON COLUMN test_view.test_view_column IS 'very gezellige viewcolumn';
DROP VIEW test_view;
CREATE INDEX test_index ON test_table using art(test_table_column);
COMMENT ON INDEX test_index IS 'very gezellige index';
DROP INDEX test_index;
CREATE SEQUENCE test_sequence;
COMMENT ON SEQUENCE test_sequence IS 'very gezellige sequence';
DROP SEQUENCE test_sequence;
CREATE TYPE test_type AS int32;
COMMENT ON TYPE test_type IS 'very gezellige type';
DROP TYPE test_type;
COMMENT ON COLUMN test_table.test_table_column IS 'very gezellige column';
ALTER TABLE test_table RENAME COLUMN test_table_column TO test_table_column_renamed;
CREATE MACRO test_macro(a, b) AS a + b;
COMMENT ON MACRO test_macro IS 'very gezellige macro';
DROP MACRO test_macro;
CREATE FUNCTION test_function(a, b) AS a + b;
COMMENT ON FUNCTION test_function IS 'very gezellige function';
CREATE MACRO test_table_macro(a,b) as TABLE select a,b;
COMMENT ON MACRO TABLE test_table_macro IS 'very gezellige table macro';
DROP MACRO TABLE test_table_macro;
DROP TABLE test_table;
select comment from duckdb_tables() where table_name='test_table';
select comment from duckdb_tables() where table_name='test_table';
select comment from duckdb_tables() where table_name='test_table';
select comment from duckdb_tables() where table_name='test_table';
select comment from duckdb_views() where view_name='test_view';
select comment from duckdb_views() where view_name='test_view';
select comment from duckdb_views() where view_name='test_view';
select comment from duckdb_columns() where column_name='test_view_column';
select comment from duckdb_columns() where column_name='test_view_column';
select comment from duckdb_columns() where column_name='test_view_column';
select comment from duckdb_indexes() where index_name='test_index';
select comment from duckdb_indexes() where index_name='test_index';
select comment from duckdb_indexes() where index_name='test_index';
select comment from duckdb_sequences() where sequence_name='test_sequence';
select comment from duckdb_sequences() where sequence_name='test_sequence';
select comment from duckdb_sequences() where sequence_name='test_sequence';
select comment from duckdb_types() where type_name='test_type';
select comment from duckdb_types() where type_name='test_type';
select comment from duckdb_types() where type_name='test_type';
select comment from duckdb_columns() where column_name='test_table_column';
select comment from duckdb_columns() where column_name='test_table_column';
select comment from duckdb_columns() where column_name='test_table_column';
select comment from duckdb_columns() where column_name='test_table_column_renamed';
select comment from duckdb_functions() where function_name='test_macro';
select comment from duckdb_functions() where function_name='test_macro';
select comment from duckdb_functions() where function_name='test_macro';
select comment from duckdb_functions() where function_name='test_function';
select comment from duckdb_functions() where function_name='test_function';
select comment from duckdb_functions() where function_name='test_function';
select comment from duckdb_functions() where function_name='test_table_macro';
select comment from duckdb_functions() where function_name='test_table_macro';
select comment from duckdb_functions() where function_name='test_table_macro';
