PRAGMA enable_verification;
CREATE TABLE tbl(col1 INTEGER, col2 INTEGER, col3 INTEGER);;
INSERT INTO tbl VALUES (1, 200, 10), (2, 100, 20), (3, 200, 0);
SELECT * FROM tbl ORDER BY COLUMNS('xxxx');
SELECT * FROM tbl ORDER BY COLUMNS('col1|col3');
SELECT * FROM tbl ORDER BY COLUMNS('col2|col3');
SELECT * FROM tbl ORDER BY COLUMNS('col2|col3') DESC;
SELECT * FROM tbl ORDER BY COLUMNS('col2') DESC, COLUMNS('col3') ASC;
SELECT * FROM tbl ORDER BY COLUMNS(x -> x[-1] IN ('2', '3'));
FROM tbl UNION FROM tbl ORDER BY COLUMNS('col2|col3') DESC;