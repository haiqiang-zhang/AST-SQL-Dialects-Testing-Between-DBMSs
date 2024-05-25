CREATE TABLE t1 (
   word VARCHAR(64),
   bar INT(11) DEFAULT 0,
   PRIMARY KEY (word))
   ENGINE=MyISAM
   CHARSET utf16le
   COLLATE utf16le_general_ci;
INSERT INTO t1 (word) VALUES ("aar");
INSERT INTO t1 (word) VALUES ("a");
INSERT INTO t1 (word) VALUES ("aardvar");
INSERT INTO t1 (word) VALUES ("aardvark");
INSERT INTO t1 (word) VALUES ("aardvara");
INSERT INTO t1 (word) VALUES ("aardvarz");
SELECT * FROM t1 ORDER BY word;
SELECT word FROM t1 ORDER by word;
DROP TABLE t1;
CREATE TABLE t1 (
   word VARCHAR(64) ,
   PRIMARY KEY (word))
   ENGINE=MyISAM
   CHARSET utf16le
   COLLATE utf16le_general_ci;
INSERT INTO t1 (word) VALUES ("aar");
INSERT INTO t1 (word) VALUES ("a");
INSERT INTO t1 (word) VALUES ("aardvar");
INSERT INTO t1 (word) VALUES ("aardvark");
INSERT INTO t1 (word) VALUES ("aardvara");
INSERT INTO t1 (word) VALUES ("aardvarz");
SELECT * FROM t1 ORDER BY word;
DROP TABLE t1;
CREATE TABLE t1 (
   word TEXT,
   bar INT(11) AUTO_INCREMENT,
   PRIMARY KEY (bar))
   ENGINE=MyISAM
   CHARSET utf16le
   COLLATE utf16le_general_ci;
INSERT INTO t1 (word) VALUES ("aar");
INSERT INTO t1 (word) VALUES ("a" );
INSERT INTO t1 (word) VALUES ("aardvar");
INSERT INTO t1 (word) VALUES ("aardvark");
INSERT INTO t1 (word) VALUES ("aardvara");
INSERT INTO t1 (word) VALUES ("aardvarz");
SELECT * FROM t1 ORDER BY word;
SELECT word FROM t1 ORDER BY word;
DROP TABLE t1;
CREATE TABLE t1 (
  a CHAR(10) CHARACTER SET utf16le NOT NULL,
  INDEX a (a)
) engine=myisam;
INSERT INTO t1 VALUES (REPEAT(_ucs2 0x201f, 10));
INSERT INTO t1 VALUES (REPEAT(_ucs2 0x2020, 10));
INSERT INTO t1 VALUES (REPEAT(_ucs2 0x2021, 10));
SELECT HEX(a) FROM t1 ORDER BY a;
ALTER TABLE t1 DROP INDEX a;
SELECT HEX(a) FROM t1 ORDER BY a;
DROP TABLE t1;
CREATE TABLE t1 (a VARCHAR(250) CHARACTER SET utf16le PRIMARY KEY) engine=MyISAM;
DROP TABLE t1;