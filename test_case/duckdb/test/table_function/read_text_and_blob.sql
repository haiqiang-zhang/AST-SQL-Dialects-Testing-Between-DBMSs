SELECT parse_path(filename), size, content FROM read_text('test/sql/table_function/files/four.blob');
SELECT COUNT(*) FROM read_text('test/sql/table_function/files/*.txt');
SELECT COUNT(*) FROM read_blob('test/sql/table_function/files/*');
SELECT * FROM read_text('test/sql/table_function/files/nonexistentfile.txt') ORDER BY ALL;
SELECT parse_path(filename) FROM read_text('test/sql/table_function/files/nonexistentfile.txt') ORDER BY ALL;
SELECT parse_path(filename) FROM read_text(['test/sql/table_function/files/one.txt', 'test/sql/table_function/files/two.txt']) ORDER BY ALL;
SELECT parse_path(filename), size, content FROM read_blob('test/sql/table_function/files/four.blob');
SELECT size, parse_path(filename), content  FROM read_text('test/sql/table_function/files/*.txt') ORDER BY filename, size;
SELECT last_modified > '2024-01-01' AND last_modified < '2500-01-01' FROM read_blob('test/sql/table_function/files/*');