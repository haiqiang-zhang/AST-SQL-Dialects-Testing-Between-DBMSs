CREATE TABLE t1(C CHAR(10) CHARACTER SET gb18030 COLLATE gb18030_unicode_520_ci, UNIQUE KEY(c));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0x0149 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0x01F0 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0x0390 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0x03B0 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0x0587 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0x1E96 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0x1E97 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0x1E98 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0x1E99 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0x1E9A USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0x1FB2 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0x1FC2 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0x1FE4 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0x1FF2 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0xFB00 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0xFB01 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0xFB02 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0xFB03 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0xFB04 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0xFB05 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0xFB13 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0xFB14 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0xFB15 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0xFB16 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0xFB17 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0x00DF USING gb18030));
SELECT * FROM t1;
SELECT COUNT(*) FROM t1;
SELECT COUNT(*) FROM t1;
DROP TABLE t1;
CREATE TABLE t1 (c1 CHAR(20), c2 CHAR(20)) CHARACTER SET gb18030 COLLATE gb18030_unicode_520_ci;
INSERT INTO t1 VALUES(CONVERT(_ucs2 0x005300DF00DF00DF00DF00DF00DF USING gb18030), CONVERT(_ucs2 0x00DF00DF00DF00DF00DF00DF0053 USING gb18030));
SELECT * FROM t1 WHERE c1 = c2;
DROP TABLE t1;
CREATE TABLE t1 (c CHAR(10), KEY(c)) CHARACTER SET gb18030 COLLATE gb18030_unicode_520_ci;
INSERT INTO t1 VALUES(CONVERT(_ucs2 0xFB00 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0xFB01 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0xFB02 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0xFB03 USING gb18030));
INSERT INTO t1 VALUES(CONVERT(_ucs2 0xFB04 USING gb18030));
INSERT INTO t1 VALUES(CONCAT(CONVERT(_ucs2 0x0066 USING gb18030), CONVERT(_ucs2 0x0046 USING gb18030)));
INSERT INTO t1 VALUES(CONCAT(CONVERT(_ucs2 0x0066 USING gb18030), CONVERT(_ucs2 0x0066 USING gb18030)));
INSERT INTO t1 VALUES(CONCAT(CONVERT(_ucs2 0x0046 USING gb18030), CONVERT(_ucs2 0x0069 USING gb18030)));
INSERT INTO t1 VALUES(CONCAT(CONVERT(_ucs2 0x0066 USING gb18030), CONVERT(_ucs2 0x0049 USING gb18030)));
INSERT INTO t1 VALUES(CONCAT(CONVERT(_ucs2 0x0066 USING gb18030), CONVERT(_ucs2 0x0066 USING gb18030), CONVERT(_ucs2 0x0069 USING gb18030)));
INSERT INTO t1 VALUES(CONCAT(CONVERT(_ucs2 0xFB00 USING gb18030), CONVERT(_ucs2 0x0069 USING gb18030)));
INSERT INTO t1 VALUES(CONCAT(CONVERT(_ucs2 0x0046 USING gb18030), CONVERT(_ucs2 0xFB01 USING gb18030)));
INSERT INTO t1 VALUES(CONCAT(CONVERT(_ucs2 0x0066 USING gb18030), CONVERT(_ucs2 0xFB01 USING gb18030)));
INSERT INTO t1 VALUES(CONCAT(CONVERT(_ucs2 0x0046 USING gb18030), CONVERT(_ucs2 0x0046 USING gb18030), CONVERT(_ucs2 0x0049 USING gb18030)));
INSERT INTO t1 VALUES(CONCAT(CONVERT(_ucs2 0x0046 USING gb18030), CONVERT(_ucs2 0x0066 USING gb18030), CONVERT(_ucs2 0x0049 USING gb18030)));
INSERT INTO t1 VALUES(CONCAT(CONVERT(_ucs2 0x0066 USING gb18030), CONVERT(_ucs2 0x0066 USING gb18030), CONVERT(_ucs2 0x006C USING gb18030)));
INSERT INTO t1 VALUES(CONCAT(CONVERT(_ucs2 0xFB00 USING gb18030), CONVERT(_ucs2 0x006C USING gb18030)));
INSERT INTO t1 VALUES(CONCAT(CONVERT(_ucs2 0x0046 USING gb18030), CONVERT(_ucs2 0xFB02 USING gb18030)));
INSERT INTO t1 VALUES(CONCAT(CONVERT(_ucs2 0x0046 USING gb18030), CONVERT(_ucs2 0x0046 USING gb18030), CONVERT(_ucs2 0x004C USING gb18030)));
INSERT INTO t1 VALUES(CONCAT(CONVERT(_ucs2 0x0046 USING gb18030), CONVERT(_ucs2 0x0066 USING gb18030), CONVERT(_ucs2 0x004C USING gb18030)));
SELECT c, hex(c) FROM t1 ORDER BY c, hex(c) ASC;
SELECT c, hex(c) FROM t1 ORDER BY c, hex(c) DESC;
SELECT c, hex(c) FROM t1 WHERE c = 'FFI';
SELECT c, hex(c) FROM t1 WHERE c > 'FFI';
SELECT c, hex(c) FROM t1 WHERE c > 'FF';
SELECT c, hex(c) FROM t1 WHERE c <= 'FFL' AND c > 'FF';
SELECT c, hex(c) FROM t1 WHERE c LIKE 'FF%';
SELECT c, hex(c) FROM t1 WHERE c LIKE '%L';
DROP TABLE t1;
