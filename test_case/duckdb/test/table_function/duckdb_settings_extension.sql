SET default_null_order='nulls_first';;
SELECT * FROM duckdb_settings();;
SET default_null_order='nulls_last';
SELECT name, value FROM duckdb_settings() WHERE name='default_null_order';;
SELECT name, value FROM duckdb_settings() WHERE name='default_null_order';;