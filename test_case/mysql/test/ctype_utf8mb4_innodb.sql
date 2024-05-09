create table t1 (c varchar(30) character set utf8mb4, unique(c(10))) engine=innodb;
insert into t1 values ('1'),('2'),('3'),('x'),('y'),('z');
insert into t1 values ('aaaaaaaaaa');
insert into t1 values (repeat('b',20));
select c c1 from t1 where c='1';
select c c2 from t1 where c='2';
select c c3 from t1 where c='3';
select c cx from t1 where c='x';
select c cy from t1 where c='y';
select c cz from t1 where c='z';
select c ca10 from t1 where c='aaaaaaaaaa';
select c cb20 from t1 where c=repeat('b',20);
drop table t1;
create table t1 (c char(3) character set utf8mb4, unique (c(2))) engine=innodb;
insert into t1 values ('1'),('2'),('3'),('4'),('x'),('y'),('z');
insert into t1 values ('a');
insert into t1 values ('aa');
insert into t1 values ('b');
insert into t1 values ('bb');
drop table t1;
create table t1 (
c char(10) character set utf8mb4,
unique key a (c(1))
) engine=innodb;
insert into t1 values ('a'),('b'),('c'),('d'),('e'),('f');
select c as c_all from t1 order by c;
select c as c_a from t1 where c='a';
select c as c_a from t1 where c='ÃÂÃÂ±';
drop table t1;
create table t1 (
c char(10) character set utf8mb4 collate utf8mb4_bin,
unique key a (c(1))
) engine=innodb;
insert into t1 values ('a'),('b'),('c'),('d'),('e'),('f');
select c as c_all from t1 order by c;
select c as c_a from t1 where c='a';
select c as c_a from t1 where c='ÃÂÃÂÃÂÃÂ±';
drop table t1;
create table t1 (
  str varchar(255) character set utf8mb4 not null,
  key str  (str(2))
) engine=innodb;
INSERT INTO t1 VALUES ('str');
INSERT INTO t1 VALUES ('str2');
select * from t1 where str='str';
drop table t1;
create table t1 (
  str varchar(255) character set utf8mb4 not null,
  key str (str(2))
) engine=innodb;
INSERT INTO t1 VALUES ('str');
INSERT INTO t1 VALUES ('str2');
select * from t1 where str='str';
drop table t1;
CREATE TABLE t1 (
  subject varchar(255) character set utf8mb4 collate utf8mb4_unicode_ci,
  p varchar(15) character set utf8mb4
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO t1 VALUES ('aaa','bbb');
SELECT length(subject) FROM t1;
SELECT length(subject) FROM t1 ORDER BY 1;
DROP TABLE t1;
create table t1 (a varchar(30) not null primary key)
engine=innodb  default character set utf8mb4 collate utf8mb4_general_ci;
select a as gci1 from t1 where a like 'ÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂ%';
select a as gci2 from t1 where a like 'ÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂ';
drop table t1;
create table t1 (a varchar(30) not null primary key)
engine=innodb default character set utf8mb4 collate utf8mb4_unicode_ci;
select a as uci1 from t1 where a like 'ÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂ%';
select a as uci2 from t1 where a like 'ÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂ';
drop table t1;
create table t1 (a varchar(30) not null primary key)
engine=innodb default character set utf8mb4 collate utf8mb4_bin;
select a as bin1 from t1 where a like 'ÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂ%';
select a as bin2 from t1 where a like 'ÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂÃÂ£ÃÂÃÂ';
drop table t1;
create table t1 (
  a int primary key,
  b varchar(6),
  index b3(b(3))
) engine=innodb character set=utf8mb4;
insert into t1 values(1,'foo'),(2,'foobar');
select * from t1 where b like 'foob%';
alter table t1 engine=innodb;
select * from t1 where b like 'foob%';
drop table t1;
CREATE TABLE t1 (
  colA int(11) NOT NULL,
  colB varchar(255) character set utf8mb4 NOT NULL,
   PRIMARY KEY  (colA)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO t1 (colA, colB) VALUES (1, 'foo'), (2, 'foo bar');
CREATE TABLE t2 (
  colA int(11) NOT NULL,
  colB varchar(255) character set utf8mb4 NOT NULL,
   KEY bad  (colA,colB(3))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO t2 (colA, colB) VALUES (1, 'foo'),(2, 'foo bar');
SELECT * FROM t1 JOIN t2 ON t1.colA=t2.colA AND t1.colB=t2.colB
WHERE t1.colA < 3;
DROP TABLE t1, t2;
