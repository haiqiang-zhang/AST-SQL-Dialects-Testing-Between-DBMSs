DROP TABLE IF EXISTS t1;
CREATE TABLE t1(a VARCHAR(255) CHARACTER SET gbk, FULLTEXT(a));
INSERT INTO t1 VALUES(0xF043616161),(0xBEF361616197C22061616161);
SELECT HEX(a) FROM t1 WHERE MATCH(a) AGAINST(0x97C22061616161 IN BOOLEAN MODE);
DELETE FROM t1 LIMIT 1;
DROP TABLE t1;
CREATE TABLE t1(a VARCHAR(2) CHARACTER SET big5 COLLATE big5_chinese_ci,
FULLTEXT(a));
INSERT INTO t1 VALUES(0xA3C2);
DROP TABLE t1;
CREATE TABLE t1 (a TEXT CHARSET LATIN1, FULLTEXT(a)) ENGINE=INNODB;
DROP TABLE t1;