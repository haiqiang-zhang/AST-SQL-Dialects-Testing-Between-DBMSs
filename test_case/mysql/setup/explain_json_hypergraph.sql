CREATE TABLE t1 ( f1 INT PRIMARY KEY );
INSERT INTO t1 VALUES ( 1 );
INSERT INTO t1 VALUES ( 2 );
INSERT INTO t1 VALUES ( 3 );
drop table t1;
create table t1 ( a int, b int, c int, d int, primary key(a,b));
insert into t1 values
(1,1,1,1), (2,2,2,2), (3,3,3,3), (4,4,4,4),
(1,2,5,1), (1,3,1,2), (1,4,2,3),
(2,1,3,4), (2,3,4,5), (2,4,5,1),
(3,1,1,2), (3,2,2,3), (3,4,3,4),
(4,1,4,5), (4,2,5,1), (4,3,1,2);
drop table t1;
CREATE TABLE t1 ( i INTEGER, PRIMARY KEY (i) );
CREATE TABLE t2 ( i INTEGER, INDEX i1 (i) );
INSERT INTO t1 VALUES (2), (3), (4), (5);
INSERT INTO t2 VALUES (1), (2), (3), (4);
DROP TABLE t1,t2;
CREATE TABLE t1 (col_int INT, pk INT) ENGINE=InnoDB STATS_PERSISTENT=0;
INSERT INTO t1 VALUES (-100,1),(1,6);
CREATE TABLE t2 (
col_int_key INT,
col_varchar VARCHAR(100) NOT NULL DEFAULT "DEFAULT",
pk INT NOT NULL,
PRIMARY KEY (pk),
KEY (col_int_key)
) ENGINE=InnoDB STATS_PERSISTENT=0;
INSERT INTO t2 VALUES
(1,"GOOD",1),(100,"",2),(200,"",3),(300,"",4),(400,"",5),(500,"",8);
DROP TABLE t1,t2;
CREATE TABLE t1 (
pk int NOT NULL AUTO_INCREMENT,
col_varchar varchar(1),
col_varchar_key varchar(1),
PRIMARY KEY (pk),
KEY idx_CC_col_varchar_key (col_varchar_key)
);
INSERT INTO t1 VALUES (1,'n','X'),(2,'Y','8'),(3,'R','l');
drop table t1;
CREATE TABLE t0 (i0 INTEGER);
INSERT INTO t0 VALUES (0),(1),(2),(3),(4);
CREATE TABLE t1 (f1 INTEGER, f2 INTEGER, f3 INTEGER,
KEY(f1), KEY(f1,f2), KEY(f3));
INSERT INTO t1
SELECT i0, i0 + 10*i0,
i0 + 10*i0 + 100*i0
FROM t0 AS a0;
INSERT INTO t1
SELECT i0, i0 + 10*i0,
i0 + 10*i0 + 100*i0
FROM t0 AS a0;
INSERT INTO t1 VALUES (NULL, 1, 2);
INSERT INTO t1 VALUES (NULL, 1, 3);
drop table t0, t1;
CREATE TABLE t1 (a INT NOT NULL, b CHAR(3) NOT NULL, PRIMARY KEY (a));
INSERT INTO t1 VALUES (1,'ABC'), (2,'EFG'), (3,'HIJ');
CREATE TABLE t2 (a INT NOT NULL,b CHAR(3) NOT NULL,PRIMARY KEY (a, b));
INSERT INTO t2 VALUES (1,'a'),(1,'b'),(3,'F');
drop table t1;
drop table t2;
CREATE TABLE t1 (a INTEGER NOT NULL);
INSERT INTO t1 VALUES (1),(2),(3),(4);
DROP TABLE t1;
CREATE TABLE t (a INT);