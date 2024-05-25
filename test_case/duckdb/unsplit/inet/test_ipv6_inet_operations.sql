SET default_null_order='nulls_first';
PRAGMA enable_verification;
CREATE TABLE tbl(id INTEGER, i INET);
INSERT INTO tbl VALUES (1, '::1'), (2, NULL), (3, 'ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff/127'), (4, '::/0'), (5, '::1/128'), (6, '::1/127');
CREATE TABLE tbl2(id INTEGER, j INET);
INSERT INTO tbl2 VALUES (3, '::1');
SELECT i FROM tbl ORDER BY i;
SELECT i FROM tbl ORDER BY i DESC;
SELECT i, COUNT(*) FROM tbl GROUP BY i ORDER BY i;
SELECT MIN(i), MAX(i) FROM tbl;
SELECT FIRST(i ORDER BY id), FIRST(i) FILTER (id=4) FROM tbl;
SELECT id, i, j FROM tbl JOIN tbl2 USING (id);
SELECT tbl.id, tbl2.id, i, j FROM tbl JOIN tbl2 ON (i=j) ORDER BY tbl.id;
