CREATE TABLE t1 (
  f1 BLOB
) DEFAULT CHARSET=gb18030;
SELECT hex(f1), f1 FROM t1;
DROP TABLE t1;
