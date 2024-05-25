CREATE TABLE t1 (f1 INT, f2 INT, f3 CHAR(1), f4 CHAR(1), f5 CHAR(1), f6 CHAR(1), f7 CHAR(1),
PRIMARY KEY (f5, f1), KEY (f2), KEY (f3), KEY (f4), KEY(f7) );
INSERT INTO t1 VALUES (1, 1, 'a', 'h', 'i', '', ''), (2, 3, 'a', 'h', 'i', '', ''),
                      (3, 2, 'b', '', 'j', '', ''), (4, 2, 'b', '', 'j', '', '');
INSERT INTO t1 VALUES (5, 1, 'a', 'h', 'i', '', ''), (6, 3, 'a', 'h', 'i', '', ''),
                      (7, 2, 'b', '', 'j', '', ''), (8, 2, 'b', '', 'j', '', '');
INSERT INTO t1 SELECT f1 + 8, f2, f3, f4, f5, f6, f7 FROM t1;
INSERT INTO t1 SELECT f1 + 16, f2, f3, f4, f5, f6, f7 FROM t1;
INSERT INTO t1 VALUES (33, 3, 'c', 'g', '', '', ''), (34, 4, 'c', 'g', '', '', ''),
                      (35, 5, 'd', 'f', '', '', ''), (36, 6, 'd', 'f', '', '', '');
INSERT INTO t1 SELECT f1 + 36, f2, f3, f4, f5, f6, f7 FROM t1;
INSERT INTO t1 SELECT f1 + 72, f2, f3, f4, f5, f6, f7 FROM t1;
INSERT INTO t1 SELECT f1 + 144, f2, f3, f4, f5, f6, f7 FROM t1;
ALTER TABLE t1 ADD KEY idx(f3, f4);
DROP TABLE t1;
CREATE TABLE t1(f1 INT NOT NULL, f2 INT, f3 INT, PRIMARY KEY(f1), KEY(f2), KEY(f3));
DROP TABLE t1;
CREATE TABLE t1 (
  f1 VARCHAR(10) DEFAULT NULL,
  f2 INT(11) NOT NULL,
  f3 INT(11) DEFAULT NULL,
  PRIMARY KEY (f2),
  KEY f1 (f1),
  KEY f3 (f3)
);
INSERT INTO t1 VALUES ('b',1,NULL), ('h',5,NULL);
SELECT /*+ INDEX_MERGE(t1 f3, primary) */ f2 FROM t1
WHERE f1 = 'o' AND f2 = f3 AND f3 <= 4;
DROP TABLE t1;
