CREATE TABLE "MyTable"(i integer);
SELECT * FROM mytable;
SELECT * FROM MyTable;
SELECT * FROM "MyTable";
ALTER TABLE MyTable ADD COLUMN j INTEGER;
ALTER TABLE MyTable RENAME TO "MyOtherTable";
DROP TABLE MyOtherTable;
CREATE TABLE "ABC"(i integer);
SELECT * FROM "ABC";
SELECT * FROM abc;
ALTER TABLE abc ADD COLUMN j INTEGER;
DROP TABLE abc;
