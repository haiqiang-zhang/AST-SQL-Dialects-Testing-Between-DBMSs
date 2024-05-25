DROP TABLE IF EXISTS t1;
create table t1 (a int);
drop table t1;
create table t1 (a char(1) character set latin1);
insert into t1 values ('a'),('b'),('c');
select hex(group_concat(a)) from t1;
drop table t1;
CREATE TABLE t1(col1 VARCHAR(32) CHARACTER SET ucs2 COLLATE ucs2_bin NOT NULL, 
                col2 VARCHAR(32) CHARACTER SET ucs2 COLLATE ucs2_bin NOT NULL, 
                UNIQUE KEY key1 USING HASH (col1, col2)) ENGINE=MEMORY;
INSERT INTO t1 VALUES('A', 'A'), ('B', 'B'), ('C', 'C');
DROP TABLE t1;
