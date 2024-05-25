CREATE TABLE t1(
  pk INT,
  a INT,
  PRIMARY KEY (pk)
) ENGINE=MyISAM;
INSERT INTO t1 VALUES (0,0);
UPDATE t1 AS A, t1 AS B SET A.pk = 1, B.a = 2;
SELECT * FROM t1;
DROP TABLE t1;
CREATE TABLE t1 (
  col_int_key int,
  pk int,
  col_int int,
  key(col_int_key),
  primary key (pk)
) ENGINE=MyISAM;
INSERT INTO t1 VALUES (1,2,3);
CREATE TABLE t2 (
  col_int_key int,
  pk_1 int,
  pk_2 int,
  col_int int,
  key(col_int_key),
  primary key (pk_1,pk_2)
) ENGINE=MyISAM;
INSERT INTO t2 VALUES (1,2,3,4);
UPDATE t1 AS A NATURAL JOIN t1 B SET A.pk=5,B.pk=7;
SELECT * FROM t1;
UPDATE t2 AS A NATURAL JOIN t2 B SET A.pk_1=5,B.pk_1=7;
UPDATE t2 AS A NATURAL JOIN t2 B SET A.pk_2=10,B.pk_2=11;
SELECT * FROM t2;
DROP TABLE t1,t2;
CREATE TABLE table_11757486 (field1 tinyint) ENGINE=MYISAM;
INSERT INTO table_11757486 VALUES (0),(0);
UPDATE IGNORE (SELECT 128 as col1) x, table_11757486 SET field1=x.col1;
UPDATE IGNORE (SELECT 128 as col1) x, table_11757486 SET field1=x.col1;
DROP TABLE table_11757486;
CREATE TABLE `t1` (
  `a` int(11) NOT NULL auto_increment,
  `b` int(11) default NULL,
  PRIMARY KEY  (`a`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `t2` (
  `a` int(11) NOT NULL auto_increment,
  `b` int(11) default NULL,
  PRIMARY KEY  (`a`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
insert into t1 values (1,1),(2,2);
insert into t2 values (1,1),(4,4);
select * from t2 /* must be (3,1), (4,4) */;
delete from t1;
delete from t2;
insert into t1 values (1,2),(3,4),(4,4);
insert into t2 values (1,2),(3,4),(4,4);
drop table t1, t2;
CREATE TABLE t1 (
  pk int NOT NULL,
  col_int int DEFAULT NULL,
  PRIMARY KEY (pk)
) ENGINE=MyISAM;
INSERT INTO t1 VALUES (2,9), (6,NULL), (0,7);
PREPARE s FROM
'UPDATE t1 AS a NATURAL JOIN t1 AS b SET a.col_int = 9, b.col_int = 9';
SELECT ROW_COUNT();
SELECT ROW_COUNT();
DEALLOCATE PREPARE s;
DROP TABLE t1;
