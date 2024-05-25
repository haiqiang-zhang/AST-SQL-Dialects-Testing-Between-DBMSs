SELECT '--- Aliases of SHOW INDEX';
SHOW INDEX FROM tbl;
SHOW INDEXES FROM tbl;
SHOW INDICES FROM tbl;
SHOW KEYS FROM tbl;
SELECT '--- EXTENDED';
SHOW EXTENDED INDEX FROM tbl;
SELECT '--- WHERE';
SHOW INDEX FROM tbl WHERE index_type LIKE '%minmax%';
SELECT '--- Check with weird table names';
DROP TABLE IF EXISTS `$4@^7`;
CREATE TABLE `$4@^7` (c String) ENGINE = MergeTree ORDER BY c;
SHOW INDEX FROM `$4@^7`;
DROP TABLE `$4@^7`;
DROP TABLE IF EXISTS NULL;
CREATE TABLE NULL (c String) ENGINE = MergeTree ORDER BY c;
SHOW INDEX FROM NULL;
DROP TABLE NULL;
DROP DATABASE IF EXISTS `'`;
CREATE DATABASE `'`;
CREATE TABLE `'`.`'` (c String) ENGINE = MergeTree ORDER BY c;
SHOW INDEX FROM `'` FROM `'`;
SHOW INDEX FROM `'`.`'`;
DROP TABLE `'`.`'`;
DROP DATABASE `'`;
-- we notice if something is buggy in the implementation of SHOW INDEX.
DROP DATABASE IF EXISTS database_123456789abcde;
CREATE DATABASE database_123456789abcde;
DROP TABLE IF EXISTS database_123456789abcde.tbl;
CREATE TABLE database_123456789abcde.tbl
(
    a UInt64,
    b UInt64,
    INDEX mmi_idx b TYPE minmax
)
ENGINE = MergeTree
PRIMARY KEY a;
SELECT '--- Original table';
SHOW INDEX FROM tbl;
SELECT '--- Equally named table in other database';
SHOW INDEX FROM tbl FROM database_123456789abcde;
SELECT '--- Short form';
SHOW INDEX FROM database_123456789abcde.tbl;
DROP DATABASE database_123456789abcde;
DROP TABLE tbl;
