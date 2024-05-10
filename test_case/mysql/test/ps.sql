drop table if exists t1,t2,t3,t4;
drop database if exists client_test_db;
create table t1
(
  a int primary key,
  b char(10)
);
insert into t1 values (1,'one');
insert into t1 values (2,'two');
insert into t1 values (3,'three');
insert into t1 values (4,'four');
prepare stmt1 from 'select * from t1 where a <= ?';
prepare stmt3 from 'insert into t1 values (?,?)';
select * from t1 where a>3;
prepare stmt4 from 'update t1 set a=? where b=?';
select * from t1 where a>3;
prepare stmt4 from 'create table t2 (a int)';
prepare stmt4 from 'drop table t2';
prepare stmt5 from 'select ? + a from t1';
create table t2
(
  a int
);
insert into t2 values (0);
prepare stmt1 from 'select 1 FROM t2 where a=?';
drop table t1,t2;
deallocate prepare stmt3;
deallocate prepare stmt4;
deallocate prepare stmt5;
PREPARE stmt1 FROM "select _utf8mb3 'A' COLLATE utf8mb3_bin = ?";
DEALLOCATE PREPARE stmt1;
create table t1 (id int);
prepare stmt1 from "select FOUND_ROWS()";
select SQL_CALC_FOUND_ROWS * from t1;
insert into t1 values (1);
select SQL_CALC_FOUND_ROWS * from t1;
deallocate prepare stmt1;
drop table t1;
create table t1 
(
  c1  tinyint, c2  smallint, c3  mediumint, c4  int,
  c5  integer, c6  bigint, c7  float, c8  double,
  c9  double precision, c10 real, c11 decimal(7, 4), c12 numeric(8, 4),
  c13 date, c14 datetime, c15 timestamp, c16 time,
  c17 year, c18 bit, c19 bool, c20 char,
  c21 char(10), c22 varchar(30), c23 tinyblob, c24 tinytext,
  c25 blob, c26 text, c27 mediumblob, c28 mediumtext,
  c29 longblob, c30 longtext, c31 enum('one', 'two', 'three'),
  c32 set('monday', 'tuesday', 'wednesday')
) engine = MYISAM;
create table t2 like t1;
drop tables t1,t2;
prepare stmt1 from ' create table t1 (m int) as select 1 as m ';
prepare stmt1 from ' create table t1 (m int) as select ? as m ';
deallocate prepare stmt1;
create table t1 (id int(10) unsigned NOT NULL default '0',
                 name varchar(64) NOT NULL default '',
                 PRIMARY KEY  (id), UNIQUE KEY `name` (`name`));
insert into t1 values (1,'1'),(2,'2'),(3,'3'),(4,'4'),(5,'5'),(6,'6'),(7,'7');
prepare stmt1 from 'select name from t1 where id=? or id=?';
select name from t1 where id=1 or id=6;
deallocate prepare stmt1;
drop table t1;
create table t1 ( a int primary key, b varchar(30)) engine = MYISAM;
prepare stmt1 from ' show table status from test like ''t1%'' ';
deallocate prepare stmt1;
drop table t1;
create table t1(a varchar(2), b varchar(3));
prepare stmt1 from "select a, b from t1 where (not (a='aa' and b < 'zzz'))";
deallocate prepare stmt1;
drop table t1;
prepare stmt1 from "select 1 into @var";
prepare stmt1 from "create table t1 select 1 as i";
prepare stmt1 from 'select 1';
prepare STMT1 from 'select 2';
deallocate prepare StMt1;
prepare `ÃÂÃÂ¼` from 'select 1234';
create table t1 (a varchar(10)) charset=utf8mb3;
insert into t1 (a) values ('yahoo');
prepare stmt from 'select a from t1 where a like ?';
deallocate prepare stmt;
drop table t1;
create table t1 (a bigint(20) not null primary key auto_increment);
insert into t1 (a) values (null);
select * from t1;
prepare stmt from "insert into t1 (a) values (?)";
select * from t1;
drop table t1;
create table t1 (a timestamp not null);
prepare stmt from "insert into t1 (a) values (CURRENT_TIMESTAMP)";
select * from t1;
deallocate prepare stmt;
drop table t1;
prepare stmt from "select 'abc' like convert('abc' using utf8mb3)";
deallocate prepare stmt;
create table t1 ( a bigint );
prepare stmt from 'select a from t1 where a between ? and ?';
drop table t1;
deallocate prepare stmt;
create table t1 (a int);
prepare stmt from "select * from t1 where 1 > (1 in (SELECT * FROM t1))";
drop table t1;
deallocate prepare stmt;
create table t1 (a int, b int) engine = myisam;
insert into t1 (a, b) values (1,1), (1,2), (2,1), (2,2);
prepare stmt from
"explain select * from t1 where t1.a=2 and t1.a=t1.b and t1.b > 1 + ?";
drop table t1;
deallocate prepare stmt;
create table t1 (a int);
insert into t1 (a) values (1), (2), (3), (4);
drop table t1;
create database mysqltest1;
create table t1 (a int);
create table mysqltest1.t1 (a int);
drop table t1;
drop table mysqltest1.t1;
drop database mysqltest1;
select '1.1' as a, '1.2' as a UNION SELECT '2.1', '2.2';
prepare stmt from
"select '1.1' as a, '1.2' as a UNION SELECT '2.1', '2.2'";
deallocate prepare stmt;
create table t1 (a int);
insert into t1 values (1),(2),(3);
create table t2 select * from t1;
prepare stmt FROM 'create table t2 select * from t1';
drop table t2;
deallocate prepare stmt;
insert into t1 (a) values (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);
prepare stmt from "select sql_calc_found_rows * from t1 limit 2";
select found_rows();
select found_rows();
select found_rows();
deallocate prepare stmt;
drop table t1;
CREATE TABLE t1 (N int, M tinyint);
INSERT INTO t1 VALUES (1,0),(1,0),(2,0),(2,0),(3,0);
PREPARE stmt FROM 'UPDATE t1 AS P1 INNER JOIN (SELECT N FROM t1 GROUP BY N HAVING COUNT(M) > 1) AS P2 ON P1.N = P2.N SET P1.M = 2';
DEALLOCATE PREPARE stmt;
DROP TABLE t1;
prepare stmt from "select ? is null, ? is not null, ?";
select @no_such_var is null, @no_such_var is not null, @no_such_var;
select @var is null, @var is not null, @var;
select @var is null, @var is not null, @var;
create table t1 (pnum char(3));
create table t2 (pnum char(3));
prepare stmt from "select pnum from t2 having pnum in (select 'p1' from t1)";
deallocate prepare stmt;
drop table t1, t2;
drop table if exists t1;
create temporary table if not exists t1 (a1 int);
prepare stmt from "delete t1 from t1 where (cast(a1/3 as unsigned) * 3) = a1";
drop temporary table t1;
create temporary table if not exists t1 (a1 int);
drop temporary table t1;
create temporary table if not exists t1 (a1 int);
drop temporary table t1;
create temporary table if not exists t1 (a1 int);
drop temporary table t1;
deallocate prepare stmt;
create table t1 (a varchar(20));
insert into t1 values ('foo');
prepare stmt FROM 'SELECT char_length (a) FROM t1';
drop table t1;
prepare stmt from "SELECT SQL_CALC_FOUND_ROWS 'foo' UNION SELECT 'bar' LIMIT 0";
SELECT FOUND_ROWS();
SELECT FOUND_ROWS();
deallocate prepare stmt;
drop table if exists t1;
create table t1 (c1 int(11) not null, c2 int(11) not null,
             primary key  (c1,c2), key c2 (c2), key c1 (c1));
insert into t1 values (200887, 860);
insert into t1 values (200887, 200887);
select * from t1 where (c1=200887 and c2=200887) or c2=860;
prepare stmt from
"select * from t1 where (c1=200887 and c2=200887) or c2=860";
prepare stmt from
"select * from t1 where (c1=200887 and c2=?) or c2=?";
deallocate prepare stmt;
drop table t1;
create table t1 (
   id bigint(20) not null auto_increment,
   code varchar(20) character set utf8mb3 COLLATE utf8mb3_bin not null default '',
   company_name varchar(250) character set utf8mb3 COLLATE utf8mb3_bin default null,
   setup_mode tinyint(4) default null,
   start_date datetime default null,
   primary key  (id), unique key code (code)
);
create table t2 (
   id bigint(20) not null auto_increment,
   email varchar(250) character set utf8mb3 COLLATE utf8mb3_bin default null,
   name varchar(250) character set utf8mb3 COLLATE utf8mb3_bin default null,
   t1_id bigint(20) default null,
   password varchar(250) character set utf8mb3 COLLATE utf8mb3_bin default null,
   primary_contact tinyint(4) not null default '0',
   email_opt_in tinyint(4) not null default '1',
   primary key  (id), unique key email (email), key t1_id (t1_id),
   constraint t2_fk1 foreign key (t1_id) references t1 (id)
);
insert into t1 values
(1, 'demo', 'demo s', 0, current_date()),
(2, 'code2', 'name 2', 0, current_date()),
(3, 'code3', 'name 3', 0, current_date());
insert into t2 values
(2, 'email1', 'name1', 3, 'password1', 0, 0),
(3, 'email2', 'name1', 1, 'password2', 1, 0),
(5, 'email3', 'name3', 2, 'password3', 0, 0);
prepare stmt from 'select t2.id from t2, t1 where (t1.id=? and t2.t1_id=t1.id)';
select t2.id from t2, t1 where (t1.id=1 and t2.t1_id=t1.id);
deallocate prepare stmt;
drop table t2, t1;
create table t1 (id int);
prepare stmt from "insert into t1 (id) select id from t1 union select id from t1";
deallocate prepare stmt;
drop table t1;
create table t1 (
  id int(11) unsigned not null primary key auto_increment,
  partner_id varchar(35) not null,
  t1_status_id int(10) unsigned
);
insert into t1 values ("1", "partner1", "10"), ("2", "partner2", "10"),
                      ("3", "partner3", "10"), ("4", "partner4", "10");
create table t2 (
  id int(11) unsigned not null default '0',
  t1_line_id int(11) unsigned not null default '0',
  article_id varchar(20),
  sequence int(11) not null default '0',
  primary key  (id,t1_line_id)
);
insert into t2 values ("1", "1", "sup", "0"), ("2", "1", "sup", "1"),
                      ("2", "2", "sup", "2"), ("2", "3", "sup", "3"),
                      ("2", "4", "imp", "4"), ("3", "1", "sup", "0"),
                      ("4", "1", "sup", "0");
create table t3 (
  id int(11) not null default '0',
  preceding_id int(11) not null default '0',
  primary key  (id,preceding_id)
);
create table t4 (
  user_id varchar(50) not null,
  article_id varchar(20) not null,
  primary key  (user_id,article_id)
);
insert into t4 values("nicke", "imp");
prepare stmt from
'select distinct t1.partner_id
from t1 left join t3 on t1.id = t3.id
     left join t1 pp on pp.id = t3.preceding_id
where
  exists (
    select *
    from t2 as pl_inner
    where pl_inner.id = t1.id
    and pl_inner.sequence <= (
      select min(sequence) from t2 pl_seqnr
      where pl_seqnr.id = t1.id
    )
    and exists (
      select * from t4
      where t4.article_id = pl_inner.article_id
      and t4.user_id = ?
    )
  )
  and t1.id = ?
group by t1.id
having count(pp.id) = 0';
deallocate prepare stmt;
drop table t1, t2, t3, t4;
prepare stmt from 'select ?=?';
deallocate prepare stmt;
create table t1 (a int);
drop table t1;
prepare stmt from "select @@time_zone";
prepare stmt from "select @@transaction_isolation";
deallocate prepare stmt;
prepare stmt from "create temporary table t1 (letter enum('','a','b','c')
not null)";
prepare stmt from "create table t1 (a enum('test') default 'test')
 character set utf8mb3";
deallocate prepare stmt;
create table t1 (
  word_id mediumint(8) unsigned not null default '0',
  formatted varchar(20) not null default ''
);
insert into t1 values
  (80,'pendant'), (475,'pretendants'), (989,'tendances'),
  (1019,'cependant'),(1022,'abondance'),(1205,'independants'),
  (13,'lessiver'),(25,'lambiner'),(46,'situer'),(71,'terminer'),
  (82,'decrocher');
select count(*) from t1 where formatted like '%NDAN%';
select count(*) from t1 where formatted like '%ER';
prepare stmt from "select count(*) from t1 where formatted like ?";
deallocate prepare stmt;
drop table t1;
prepare stmt from 'create table t1 (a varchar(10) character set utf8mb3)';
deallocate prepare stmt;
create table t1 (col1 integer, col2 integer);
insert into t1 values(100,100),(101,101),(102,102),(103,103);
prepare stmt from 'select col1, col2 from t1 where (col1, col2) in ((?,?))';
deallocate prepare stmt;
drop table t1;
select @@max_prepared_stmt_count;
select @@max_prepared_stmt_count;
select @@max_prepared_stmt_count;
select @@max_prepared_stmt_count;
select @@max_prepared_stmt_count;
select @@max_prepared_stmt_count;
prepare stmt from "select 1";
prepare stmt from "select 1";
prepare stmt1 from "select 1";
deallocate prepare stmt;
prepare stmt from "select 1";
prepare stmt from "select 2";
select @@max_prepared_stmt_count;
prepare stmt from "select 1";
prepare stmt from "select 1";
select @@max_prepared_stmt_count;
prepare stmt from "select 1";
prepare stmt from "select 2";
prepare stmt1 from "select 3";
prepare stmt2 from "select 4";
prepare stmt2 from "select 4";
select @@max_prepared_stmt_count;
deallocate prepare stmt;
select @@max_prepared_stmt_count;
drop table if exists t1;
create temporary table if not exists t1 (a1 int);
prepare stmt from "delete t1 from t1 where (cast(a1/3 as unsigned) * 3) = a1";
drop temporary table t1;
create temporary table if not exists t1 (a1 int);
drop temporary table t1;
create temporary table if not exists t1 (a1 int);
drop temporary table t1;
create temporary table if not exists t1 (a1 int);
drop temporary table t1;
deallocate prepare stmt;
CREATE TABLE t1(
  ID int(10) unsigned NOT NULL auto_increment,
  Member_ID varchar(15) NOT NULL default '',
  Action varchar(12) NOT NULL,
  Action_Date datetime NOT NULL,
  Track varchar(15) default NULL,
  User varchar(12) default NULL,
  Date_Updated timestamp NOT NULL default CURRENT_TIMESTAMP on update
    CURRENT_TIMESTAMP,
  PRIMARY KEY (ID),
  KEY Action (Action),
  KEY Action_Date (Action_Date)
);
INSERT INTO t1(Member_ID, Action, Action_Date, Track) VALUES
  ('111111', 'Disenrolled', '2006-03-01', 'CAD' ),
  ('111111', 'Enrolled', '2006-03-01', 'CAD' ),
  ('111111', 'Disenrolled', '2006-07-03', 'CAD' ),
  ('222222', 'Enrolled', '2006-03-07', 'CAD' ),
  ('222222', 'Enrolled', '2006-03-07', 'CHF' ),
  ('222222', 'Disenrolled', '2006-08-02', 'CHF' ),
  ('333333', 'Enrolled', '2006-03-01', 'CAD' ),
  ('333333', 'Disenrolled', '2006-03-01', 'CAD' ),
  ('444444', 'Enrolled', '2006-03-01', 'CAD' ),
  ('555555', 'Disenrolled', '2006-03-01', 'CAD' ),
  ('555555', 'Enrolled', '2006-07-21', 'CAD' ),
  ('555555', 'Disenrolled', '2006-03-01', 'CHF' ),
  ('666666', 'Enrolled', '2006-02-09', 'CAD' ),
  ('666666', 'Enrolled', '2006-05-12', 'CHF' ),
  ('666666', 'Disenrolled', '2006-06-01', 'CAD' );
PREPARE STMT FROM
"SELECT GROUP_CONCAT(Track SEPARATOR ', ') FROM t1
  WHERE Member_ID=? AND Action='Enrolled' AND
        (Track,Action_Date) IN (SELECT Track, MAX(Action_Date) FROM t1
                                  WHERE Member_ID=?
                                    GROUP BY Track 
                                      HAVING Track>='CAD' AND
                                             MAX(Action_Date)>'2006-03-01')";
DEALLOCATE PREPARE STMT;
DROP TABLE t1;
DROP TABLE IF EXISTS t1;
CREATE TABLE t1 (i INT, INDEX(i));
INSERT INTO t1 VALUES (1);
PREPARE stmt FROM "SELECT (COUNT(i) = 1), COUNT(i) FROM t1 WHERE i = ?";
PREPARE stmt FROM "SELECT (AVG(i) = 1), AVG(i) FROM t1 WHERE i = ?";
PREPARE stmt FROM "SELECT (VARIANCE(i) = 1), VARIANCE(i) FROM t1 WHERE i = ?";
PREPARE stmt FROM "SELECT (STDDEV(i) = 1), STDDEV(i) FROM t1 WHERE i = ?";
PREPARE stmt FROM "SELECT (BIT_OR(i) = 1), BIT_OR(i) FROM t1 WHERE i = ?";
PREPARE stmt FROM "SELECT (BIT_AND(i) = 1), BIT_AND(i) FROM t1 WHERE i = ?";
PREPARE stmt FROM "SELECT (BIT_XOR(i) = 1), BIT_XOR(i) FROM t1 WHERE i = ?";
DEALLOCATE PREPARE stmt;
DROP TABLE t1;
CREATE TABLE t1 (i INT);
PREPARE st_19182
FROM "CREATE TABLE t2 (i INT, j INT, KEY (i), KEY(j)) SELECT i FROM t1";
DEALLOCATE PREPARE st_19182;
drop database if exists mysqltest;
drop table if exists t1, t2;
create database mysqltest character set utf8mb3;
prepare stmt1 from "create table mysqltest.t1 (c char(10))";
alter database mysqltest character set latin1;
drop database mysqltest;
deallocate prepare stmt1;
CREATE TABLE t1(a int);
INSERT INTO t1 VALUES (2), (3), (1);
DROP TABLE t1;
create table t1 (a int, b tinyint);
prepare st1 from 'update t1 set b= (str_to_date(a, a))';
deallocate prepare st1;
drop table t1;
create table t1 (a varchar(20));
insert into t1 values ('foo');
prepare stmt FROM 'SELECT char_length (a) FROM t1';
drop table t1;
create table t1 (a char(3) not null, b char(3) not null,
                 c char(3) not null, primary key  (a, b, c));
create table t2 like t1;
prepare stmt from
  "select t1.a from (t1 left outer join t2 on t2.a=1 and t1.b=t2.b)
  where t1.a=1";
prepare stmt from
"select t1.a, t1.b, t1.c, t2.a, t2.b, t2.c from
(t1 left outer join t2 on t2.a=? and t1.b=t2.b)
left outer join t2 t3 on t3.a=? where t1.a=?";
deallocate prepare stmt;
drop table t1,t2;
create table t1 (a int);
insert into t1 (a) values (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);
prepare stmt from "select * from t1 limit ?, ?";
select * from t1 limit 0, 1;
select * from t1 limit 3, 2;
prepare stmt from "select * from t1 limit ?";
prepare stmt from "select * from t1 union all select * from t1 limit ?, ?";
prepare stmt from "(select * from t1 limit ?, ?) union all
                   (select * from t1 limit ?, ?) order by a limit ?";
drop table t1;
deallocate prepare stmt;
CREATE TABLE b12651_T1(a int) ENGINE=MYISAM;
CREATE TABLE b12651_T2(b int) ENGINE=MYISAM;
CREATE VIEW  b12651_V1 as SELECT b FROM b12651_T2;
PREPARE b12651 FROM 'SELECT 1 FROM b12651_T1 WHERE a IN (SELECT b FROM b12651_V1)';
DROP VIEW b12651_V1;
DROP TABLE b12651_T1, b12651_T2;
DEALLOCATE PREPARE b12651;
create table t1 (id int);
prepare ins_call from "insert into t1 (id) values (1)";
select row_count();
drop table t1;
create table t1 (a int, b int);
insert into t1 (a,b) values (2,8),(1,9),(3,7);
prepare stmt from "select * from t1 order by ?";
deallocate prepare stmt;
select * from t1 order by 1;
prepare stmt from "select * from t1 order by ?+1";
deallocate prepare stmt;
select * from t1 order by 1+1;
drop table t1;
create table t1 (a int) engine=myisam;
create table t2 like t1;
create table t3 like t2;
prepare stmt from "repair table t1";
prepare stmt from "optimize table t1";
prepare stmt from "analyze table t1";
prepare stmt from "repair table t1, t2, t3";
prepare stmt from "optimize table t1, t2, t3";
prepare stmt from "analyze table t1, t2, t3";
prepare stmt from "repair table t1, t4, t3";
prepare stmt from "optimize table t1, t3, t4";
prepare stmt from "analyze table t4, t1";
deallocate prepare stmt;
drop table t1, t2, t3;
create database mysqltest_long_database_name_to_thrash_heap;
create table t1 (i int);
prepare stmt from "alter table test.t1 rename t1";
prepare stmt from "alter table test.t1 rename t1";
deallocate prepare stmt;
prepare stmt_create from "create table t1 (i int)";
prepare stmt_insert from "insert into t1 (i) values (1)";
prepare stmt_update from "update t1 set i=2";
prepare stmt_delete from "delete from t1 where i=2";
prepare stmt_select from "select * from t1";
prepare stmt_alter from "alter table t1 add column (b int)";
prepare stmt_alter1 from "alter table t1 drop column b";
prepare stmt_analyze from "analyze table t1";
prepare stmt_optimize from "optimize table t1";
prepare stmt_show from "show tables like 't1'";
prepare stmt_truncate from "truncate table t1";
prepare stmt_drop from "drop table t1";
drop table t1;
drop database mysqltest_long_database_name_to_thrash_heap;
prepare stmt_create from "create table t1 (i int)";
prepare stmt_alter from "alter table t1 add column (b int)";
prepare stmt_alter1 from "alter table t1 drop column b";
prepare stmt_analyze from "analyze table t1";
prepare stmt_optimize from "optimize table t1";
prepare stmt_show from "show tables like 't1'";
prepare stmt_truncate from "truncate table t1";
prepare stmt_drop from "drop table t1";
create temporary table t1 (i int);
CREATE TABLE t1 (i BIGINT, j BIGINT);
CREATE TABLE t2 (i BIGINT);
CREATE TABLE t3 (i BIGINT, j BIGINT);
DROP TABLE IF EXISTS t1, t2, t3;
CREATE TABLE t2 (i INT);
INSERT INTO t2 VALUES (1);
PREPARE stmt FROM "SELECT t2.i FROM t1 LEFT JOIN t2 ON t2.i = t1.i
                   WHERE t1.i = ?";
DEALLOCATE PREPARE stmt;
DROP TABLE t1, t2;
CREATE TABLE t1 (i INT);
CREATE VIEW v1 AS SELECT * FROM t1;
INSERT INTO t1 VALUES (1), (2);
DROP VIEW v1;
DROP TABLE t1;
CREATE TABLE t1 (a int);
INSERT INTO t1 VALUES (1), (2);
CREATE TABLE t2 (b int);
INSERT INTO t2 VALUES (NULL);
SELECT a FROM t1 WHERE (SELECT b FROM t2) IS NULL;
PREPARE stmt FROM 'SELECT a FROM t1 WHERE (SELECT b FROM t2) IS NULL';
DEALLOCATE PREPARE stmt;
PREPARE stmt FROM 'SELECT a FROM t1 WHERE (SELECT b FROM t2 limit ?) IS NULL';
DEALLOCATE PREPARE stmt;
DROP TABLE t1,t2;
create table t1 (s1 char(20));
prepare stmt from "alter table t1 modify s1 int";
drop table t1;
deallocate prepare stmt;
create table t1 (a int, b int);
prepare s_6895 from "alter table t1 drop column b";
drop table t1;
create table t1 (a int, b int);
drop table t1;
create table t1 (a int, b int);
deallocate prepare s_6895;
drop table t1;
create table t1 (i int primary key auto_increment) comment='comment for table t1';
create table t2 (i int, j int, k int);
prepare stmt from "alter table t1 auto_increment=100";
select * from t2;
deallocate prepare stmt;
drop table t1, t2;
prepare stmt from "create database mysqltest_1";
deallocate prepare stmt;
create table t1 (id int primary key auto_increment, value varchar(10));
insert into t1 (id, value) values (1, 'FIRST'), (2, 'SECOND'), (3, 'THIRD');
drop tables t1;
prepare stmt from "create table t1 select ?";
create table t1 (a bigint unsigned, b bigint(20) unsigned);
prepare stmt from "insert into t1 values (?,?)";
insert into t1 values (@a, @b);
select * from t1 where a = @a and b = @b;
select * from t1 where a = @a and b = @b;
deallocate prepare stmt;
drop table t1;
drop view if exists v1;
drop table if exists t1;
create table t1 (a int, b int);
insert into t1 values (1,1), (2,2), (3,3);
insert into t1 values (3,1), (1,2), (2,3);
prepare stmt from "create view v1 as select * from t1";
drop table t1;
create table t1 (a int, b int);
prepare stmt from "create view v1 (c,d) as select a,b from t1";
deallocate prepare stmt;
prepare stmt from "create view v1 (c) as select b+1 from t1";
deallocate prepare stmt;
prepare stmt from "create view v1 (c,d,e,f) as select a,b,a in (select a+2 from t1), a = all (select a from t1) from t1";
deallocate prepare stmt;
prepare stmt from "create or replace view v1 as select 1";
deallocate prepare stmt;
prepare stmt from "create view v1 as select 1, 1";
deallocate prepare stmt;
prepare stmt from "create view v1 (x) as select a from t1 where a > 1";
deallocate prepare stmt;
prepare stmt from "create view v1 as select * from `t1` `b`";
deallocate prepare stmt;
drop table t1;
create temporary table t1 (a int, b int);
prepare stmt from "create view v1 as select * from t1";
deallocate prepare stmt;
drop table t1;
prepare stmt from "select ?";
select @arg;
select @arg;
select @arg;
select @arg;
deallocate prepare stmt;
create table t1(b int);
insert into t1 values (0);
create view v1 AS select 1 as a from t1 where b;
prepare stmt from "select * from v1 where a";
deallocate prepare stmt;
drop table t1;
drop view v1;
create table t1(a bigint);
create table t2(b tinyint);
insert into t2 values (null);
prepare stmt from "select 1 from t1 join  t2 on a xor b where b > 1  and a =1";
deallocate prepare stmt;
drop table t1,t2;
CREATE TABLE t1(a INT PRIMARY KEY);
INSERT INTO t1 VALUES(0), (1);
PREPARE stmt FROM 
  "SELECT 1 FROM t1 JOIN t1 t2 USING(a) GROUP BY t2.a, t1.a";
DEALLOCATE PREPARE stmt;
DROP TABLE t1;
create procedure proc_1() reset binary logs and gtids;
drop procedure proc_1;
prepare abc from "reset binary logs and gtids";
deallocate prepare abc;
create procedure proc_1() reset slave;
drop procedure proc_1;
prepare abc from "reset slave";
deallocate prepare abc;
create procedure proc_1(a integer) kill a;
drop procedure proc_1;
prepare abc from "kill 0";
deallocate prepare abc;
prepare abc from "TRUNCATE TABLE performance_schema.host_cache";
deallocate prepare abc;
create procedure proc_1() flush privileges;
drop procedure proc_1;
prepare abc from "flush privileges";
deallocate prepare abc;
create procedure proc_1() flush tables with read lock;
unlock tables;
unlock tables;
unlock tables;
drop procedure proc_1;
prepare abc from "flush tables with read lock";
deallocate prepare abc;
unlock tables;
create procedure proc_1() flush tables;
drop procedure proc_1;
prepare abc from "flush tables";
deallocate prepare abc;
create procedure proc_1() flush tables;
drop procedure proc_1;
prepare abc from "flush tables";
deallocate prepare abc;
create procedure proc_1() flush logs;
drop procedure proc_1;
prepare abc from "flush logs";
deallocate prepare abc;
create procedure proc_1() flush status;
drop procedure proc_1;
prepare abc from "flush status";
deallocate prepare abc;
create procedure proc_1() flush user_resources;
drop procedure proc_1;
prepare abc from "flush user_resources";
deallocate prepare abc;
create procedure proc_1() start slave;
drop procedure proc_1;
prepare abc from "start slave";
deallocate prepare abc;
create procedure proc_1() stop slave;
drop procedure proc_1;
prepare abc from "stop slave";
deallocate prepare abc;
create procedure proc_1() show binlog events;
drop procedure proc_1;
create procedure proc_1() show slave status;
drop procedure proc_1;
create procedure proc_1() show binary log status;
drop procedure proc_1;
create procedure proc_1() show binary logs;
drop procedure proc_1;
create procedure proc_1() show events;
drop procedure proc_1;
prepare abc from "show events";
deallocate prepare abc;
create procedure a() select 42;
create procedure proc_1(a char(2)) show create procedure a;
drop procedure proc_1;
prepare abc from "show create procedure a";
deallocate prepare abc;
drop procedure a;
create procedure proc_1(a char(2)) show create function a;
drop procedure proc_1;
prepare abc from "show create function a";
deallocate prepare abc;
create table tab1(a int, b char(1), primary key(a,b));
create procedure proc_1() show create table tab1;
drop procedure proc_1;
prepare abc from "show create table tab1";
deallocate prepare abc;
drop table tab1;
drop view if exists v1;
drop table if exists t1;
create table t1(a int, b char(5));
insert into t1 values (1, "one"), (1, "edno"), (2, "two"), (2, "dve");
create view v1 as
    (select a, count(*) from t1 group by a)
    union all
    (select b, count(*) from t1 group by b);
create procedure proc_1() show create view v1;
drop procedure proc_1;
prepare abc from "show create view v1";
deallocate prepare abc;
drop view v1;
drop table t1;
create procedure proc_1() install plugin my_plug soname 'some_plugin.so';
drop procedure proc_1;
prepare abc from "install plugin my_plug soname 'some_plugin.so'";
deallocate prepare abc;
create procedure proc_1() uninstall plugin my_plug;
drop procedure proc_1;
prepare abc from "uninstall plugin my_plug";
deallocate prepare abc;
create procedure proc_1() create database mysqltest_xyz;
drop database if exists mysqltest_xyz;
drop database if exists mysqltest_xyz;
drop database if exists mysqltest_xyz;
drop procedure proc_1;
prepare abc from "create database mysqltest_xyz";
drop database if exists mysqltest_xyz;
drop database if exists mysqltest_xyz;
drop database if exists mysqltest_xyz;
deallocate prepare abc;
create table t1 (a int, b char(5));
insert into t1 values (1, "one"), (2, "two"), (3, "three");
create procedure proc_1() checksum table xyz;
drop procedure proc_1;
prepare abc from "checksum table t1";
deallocate prepare abc;
create procedure proc_1() create user pstest_xyz@localhost;
drop procedure proc_1;
prepare abc from "create user pstest_xyz@localhost";
deallocate prepare abc;
drop event if exists xyz;
create event xyz on schedule every 5 minute disable do select 123;
create procedure proc_1() alter event xyz comment 'xyz';
drop event xyz;
create event xyz on schedule every 5 minute disable do select 123;
drop event xyz;
create event xyz on schedule every 5 minute disable do select 123;
drop event xyz;
drop procedure proc_1;
drop event if exists xyz;
create event xyz on schedule every 5 minute disable do select 123;
create procedure proc_1() drop event xyz;
drop procedure proc_1;
drop table if exists t1;
create table t1 (a int, b char(5)) engine=myisam;
insert into t1 values (1, "one"), (2, "two"), (3, "three");
create procedure proc_1() cache index t1 in new_cache;
drop procedure proc_1;
prepare abc from "cache index t1 in second_cache";
deallocate prepare abc;
drop table t1;
drop table if exists t1;
drop table if exists t2;
create table t1 (a int, b char(5)) engine=myisam;
insert into t1 values (1, "one"), (2, "two"), (3, "three");
create table t2 (a int, b char(5)) engine=myisam;
insert into t2 values (1, "one"), (2, "two"), (3, "three");
create procedure proc_1() load index into cache t1 ignore leaves;
drop procedure proc_1;
prepare abc from "load index into cache t2 ignore leaves";
deallocate prepare abc;
drop table t1, t2;
create procedure proc_1() show errors;
drop procedure proc_1;
drop table if exists t1;
drop table if exists t2;
create procedure proc_1() show warnings;
drop table if exists t1;
drop table if exists t2;
drop table if exists t1, t2;
drop procedure proc_1;
prepare stmt2 from 'select format(?, ?)';
deallocate prepare stmt2;
CREATE TABLE t1 (i INT);
INSERT INTO t1 VALUES (1);
CREATE TABLE t2 (i INT);
INSERT INTO t2 VALUES (2);
LOCK TABLE t1 READ, t2 WRITE;
PREPARE stmt1 FROM "SELECT i FROM t1";
PREPARE stmt2 FROM "INSERT INTO t2 (i) VALUES (3)";
SELECT * FROM t2;
UNLOCK TABLES;
SELECT * FROM t2;
ALTER TABLE t1 ADD COLUMN j INT;
ALTER TABLE t2 ADD COLUMN j INT;
INSERT INTO t1 VALUES (4, 5);
INSERT INTO t2 VALUES (4, 5);
SELECT * FROM t2;
DROP TABLE t1, t2;
drop table if exists t1;
prepare stmt
from "create table t1 (c char(100) character set utf8mb3, key (c(10)))";
create table t1 (a int, b int);
create table t2 like t1;
insert into t1 (a, b) values (1,1), (1,2), (1,3), (1,4), (1,5),
       (2,2), (2,3), (2,1), (3,1), (4,1), (4,2), (4,3), (4,4), (4,5), (4,6);
insert into t2 select a, max(b) from t1 group by a;
prepare stmt from "delete from t2 where (select (select max(b) from t1 group
by a having a < 2) x from t1) > 10000";
deallocate prepare stmt;
drop table t1, t2;
CREATE TABLE t1 (a TIME NOT NULL, b TINYINT);
INSERT IGNORE INTO t1 VALUES (0, 0),(0, 0);
PREPARE stmt FROM "SELECT 1 FROM t1 WHERE
ROW(a, b) >= ROW('1', (SELECT 1 FROM t1 WHERE a > '1234abc'))";
DEALLOCATE PREPARE stmt;
DROP TABLE t1;
CREATE TABLE t1(a INT);
INSERT INTO t1 VALUES (1),(2);
PREPARE stmt FROM 'EXPLAIN SELECT 1 FROM t1 RIGHT JOIN t1 t2 ON 1';
DEALLOCATE PREPARE stmt;
DROP TABLE t1;
CREATE TABLE t1(f1 INT);
INSERT INTO t1 VALUES (1),(1);
PREPARE stmt FROM 'EXPLAIN SELECT 1 FROM t1 WHERE (SELECT (SELECT 1 FROM t1 GROUP BY f1))';
DEALLOCATE PREPARE stmt;
DROP TABLE t1;
DROP PROCEDURE IF EXISTS p_string;
DROP PROCEDURE IF EXISTS p_double;
DROP PROCEDURE IF EXISTS p_int;
DROP PROCEDURE IF EXISTS p_decimal;
SELECT @x_int_1, @x_str_1, @x_str_2, @x_str_3;
SELECT @x_int_1, @x_str_1, @x_str_2, @x_str_3;
SELECT @x_int_1, @x_dbl_1, @x_dbl_2, @x_dbl_3;
SELECT @x_int_1, @x_dbl_1, @x_dbl_2, @x_dbl_3;
SELECT @x_str_1, @x_int_1, @x_int_2, @x_int_3;
SELECT @x_str_1, @x_int_1, @x_int_2, @x_int_3;
SELECT @x_int_1, @x_dec_1, @x_dec_2, @x_dec_3;
SELECT @x_int_1, @x_dec_1, @x_dec_2, @x_dec_3;
DROP PROCEDURE IF EXISTS p1;
DROP PROCEDURE IF EXISTS p2;
CREATE PROCEDURE p1(OUT v1 CHAR(10))
  SET v1 = 'test1';
SELECT @a;
DROP PROCEDURE p1;
CREATE TABLE t1 (a INT);
SELECT * FROM t1;
PREPARE stmt1 FROM "CREATE TABLE t1 AS SELECT 1";
DEALLOCATE PREPARE stmt1;
DROP TABLE t1;
CREATE TABLE t1 (a INT);
PREPARE stmt1 FROM "SELECT * FROM t1";
DROP TABLE t1;
SELECT *
FROM (SELECT 1 UNION SELECT 2) t;
PREPARE s1 FROM 
"
SELECT c1, t2.c2, count(c3)
FROM
  (
  SELECT 3 as c2 FROM dual WHERE @x = 1
  UNION
  SELECT 2       FROM dual WHERE @x = 1 OR @x = 2
  ) AS t1,
  (
  SELECT '2012-03-01 01:00:00' AS c1, 3 as c2, 1 as c3 FROM dual
  UNION
  SELECT '2012-03-01 02:00:00',       3,       2       FROM dual
  UNION
  SELECT '2012-03-01 01:00:00',       2,       1       FROM dual
  ) AS t2
WHERE t2.c2 = t1.c2
GROUP BY c1,c2
ORDER BY c1,c2
";
SELECT c1, t2.c2, count(c3)
FROM
  (
  SELECT 3 as c2 FROM dual WHERE @x = 1
  UNION
  SELECT 2       FROM dual WHERE @x = 1 OR @x = 2
  ) AS t1,
  (
  SELECT '2012-03-01 01:00:00' AS c1, 3 as c2, 1 as c3 FROM dual
  UNION
  SELECT '2012-03-01 02:00:00',       3,       2       FROM dual
  UNION
  SELECT '2012-03-01 01:00:00',       2,       1       FROM dual
  ) AS t2
WHERE t2.c2 = t1.c2
GROUP BY c1, c2
ORDER BY c1, c2;
SELECT c1, t2.c2, count(c3)
FROM
  (
  SELECT 3 as c2 FROM dual WHERE @x = 1
  UNION
  SELECT 2       FROM dual WHERE @x = 1 OR @x = 2
  ) AS t1,
  (
  SELECT '2012-03-01 01:00:00' AS c1, 3 as c2, 1 as c3 FROM dual
  UNION
  SELECT '2012-03-01 02:00:00',       3,       2       FROM dual
  UNION
  SELECT '2012-03-01 01:00:00',       2,       1       FROM dual
  ) AS t2
WHERE t2.c2 = t1.c2
GROUP BY c1, c2
ORDER BY c1, c2;
SELECT c1, t2.c2, count(c3)
FROM
  (
  SELECT 3 as c2 FROM dual WHERE @x = 1
  UNION
  SELECT 2       FROM dual WHERE @x = 1 OR @x = 2
  ) AS t1,
  (
  SELECT '2012-03-01 01:00:00' AS c1, 3 as c2, 1 as c3 FROM dual
  UNION
  SELECT '2012-03-01 02:00:00',       3,       2       FROM dual
  UNION
  SELECT '2012-03-01 01:00:00',       2,       1       FROM dual
  ) AS t2
WHERE t2.c2 = t1.c2
GROUP BY c1, c2
ORDER BY c1, c2;
DEALLOCATE PREPARE s1;
CREATE TABLE t1(a INTEGER);
CREATE TABLE t2(a INTEGER);
PREPARE stmt FROM '
SELECT (SELECT 1 FROM t2 WHERE ot.a) AS d
FROM t1 AS ot
GROUP BY d';
INSERT INTO t1 VALUES (0),(1),(2);
INSERT INTO t2 VALUES (1);
DEALLOCATE PREPARE stmt;
DROP TABLE t1, t2;
CREATE TABLE t1 (
  pk INTEGER AUTO_INCREMENT,
  col_int_nokey INTEGER,
  col_int_key INTEGER,

  col_varchar_key VARCHAR(1),
  col_varchar_nokey VARCHAR(1),

  PRIMARY KEY (pk),
  KEY (col_int_key),
  KEY (col_varchar_key, col_int_key)
);
INSERT INTO t1 (
  col_int_key, col_int_nokey,
  col_varchar_key, col_varchar_nokey
) VALUES 
(4,    2, 'v', 'v'),
(62, 150, 'v', 'v');
CREATE TABLE t2 (
  pk INTEGER AUTO_INCREMENT,
  col_int_nokey INTEGER,
  col_int_key INTEGER,

  col_varchar_key VARCHAR(1),
  col_varchar_nokey VARCHAR(1),

  PRIMARY KEY (pk),
  KEY (col_int_key),
  KEY (col_varchar_key, col_int_key)
);
INSERT INTO t2 (
  col_int_key, col_int_nokey,
  col_varchar_key, col_varchar_nokey
) VALUES 
(8, NULL, 'x', 'x'),
(7, 8,    'd', 'd');
PREPARE stmt FROM ' 
SELECT
  ( SELECT MAX( SQ1_alias2 .col_int_nokey ) AS SQ1_field1
    FROM ( t2 AS SQ1_alias1 RIGHT JOIN t1 AS SQ1_alias2
           ON ( SQ1_alias2.col_varchar_key = SQ1_alias1.col_varchar_nokey )
         )
    WHERE SQ1_alias2.pk < alias1.col_int_nokey OR alias1.pk
  ) AS field1
FROM ( t1 AS alias1 JOIN t2 AS alias2 ON alias2.pk )
GROUP BY field1
';
DEALLOCATE PREPARE stmt;
DROP TABLE t1, t2;
CREATE TABLE t1 (a INTEGER);
CREATE TABLE t2 (b INTEGER);
DROP TABLE t1, t2;
CREATE TABLE bug19894382(f1 CHAR(64) DEFAULT 'slave',
                         f2 TIME, f3 TIMESTAMP NULL, f4 DATETIME,
                         f5 TIME(3), f6 TIMESTAMP(3) NULL, f7 DATETIME(3));
SELECT * FROM bug19894382 ORDER BY f2;
DROP TABLE bug19894382;
prepare s from "select length(?)";
CREATE TABLE t1 (t time DEFAULT NULL);
INSERT INTO t1 VALUES ('16:07:44');
PREPARE s FROM "DELETE FROM t1 WHERE t = ?";
DEALLOCATE PREPARE s;
DROP TABLE t1;
CREATE TABLE t1 (dt datetime DEFAULT NULL);
INSERT INTO t1 VALUES ('2018-11-11 16:07:44');
PREPARE s FROM "DELETE FROM t1 WHERE dt = ?";
DEALLOCATE PREPARE s;
DROP TABLE t1;
CREATE TABLE t1 (d date DEFAULT NULL);
INSERT INTO t1 VALUES ('2018-11-11');
PREPARE s FROM "DELETE FROM t1 WHERE d = ?";
DEALLOCATE PREPARE s;
DROP TABLE t1;
CREATE TABLE t(a INT, b INT);
INSERT INTO t VALUES (1, 1), (2, 2), (3, 3), (4, 4);
PREPARE ps FROM
  'UPDATE t, (SELECT 1 FROM t UNION SELECT 2 FROM t) e SET a = 0 WHERE FALSE';
DROP PREPARE ps;
DROP TABLE t;
CREATE TABLE t1(c1 int);
INSERT INTO t1 VALUES(1),(2);
PREPARE stmt FROM "SHOW CREATE VIEW v1";
DEALLOCATE PREPARE stmt;
DROP TABLE t1;
CREATE TABLE t1 (a char (64) character set latin1, b int unsigned);
PREPARE s FROM 'SELECT a FROM t1 WHERE a=? AND b=?';
DEALLOCATE PREPARE s;
DROP TABLE t1;
CREATE TABLE t1 (a INTEGER);
PREPARE s FROM 'SELECT 1 FROM t1 WHERE TRUE OR ( SELECT 1 FROM (SELECT a) q ) = 1';
DROP TABLE t1;
CREATE TABLE t1 ( pk INTEGER NOT NULL, a INTEGER );
PREPARE q FROM 'EXPLAIN FORMAT=tree SELECT * FROM t1 WHERE pk = ?';
DROP TABLE t1;
CREATE TABLE t (f INT NOT NULL) ENGINE=InnoDB;
INSERT INTO t (f) VALUES (0);
PREPARE stmt FROM 'UPDATE t SET f = 100 * ?';
DEALLOCATE PREPARE stmt;
SELECT * FROM t;
DROP TABLE t;
CREATE TABLE t1 (int_column INT NOT NULL);
INSERT INTO t1 VALUES (1), (2), (3), (4);
SELECT * from t1 where int_column < '1.9';
PREPARE stmt FROM 'SELECT * from t1 where int_column < ?';
DEALLOCATE PREPARE stmt;
DROP TABLE t1;
CREATE TABLE ints(i INTEGER);
CREATE TABLE deci(d DECIMAL(12,4));
CREATE TABLE dbls(r DOUBLE);
CREATE TABLE flts(f FLOAT);
INSERT INTO ints VALUES (@empty);
INSERT INTO deci VALUES (@empty);
INSERT INTO dbls VALUES (@empty);
INSERT INTO flts VALUES (@empty);
INSERT INTO ints VALUES (@spaces);
INSERT INTO deci VALUES (@spaces);
INSERT INTO dbls VALUES (@spaces);
INSERT INTO flts VALUES (@spaces);
INSERT INTO ints VALUES ('666');
INSERT INTO deci VALUES ('777.777');
INSERT INTO dbls VALUES ('888.888e100');
INSERT INTO flts VALUES ('1e38');
INSERT INTO ints VALUES ('  666  ');
INSERT INTO deci VALUES ('  777.777  ');
INSERT INTO dbls VALUES ('  888.888e100  ');
INSERT INTO flts VALUES ('  1e38  ');
INSERT INTO ints VALUES (@intval);
INSERT INTO deci VALUES (@decval);
INSERT INTO dbls VALUES (@dblval);
INSERT INTO flts VALUES (@fltval);
INSERT INTO ints VALUES (@intvalx);
INSERT INTO deci VALUES (@decvalx);
INSERT INTO dbls VALUES (@dblvalx);
INSERT INTO flts VALUES (@fltvalx);
PREPARE ps1 FROM 'INSERT INTO ints VALUES (?)';
PREPARE ps2 FROM 'INSERT INTO deci VALUES (?)';
PREPARE ps3 FROM 'INSERT INTO dbls VALUES (?)';
PREPARE ps4 FROM 'INSERT INTO flts VALUES (?)';
DEALLOCATE PREPARE ps1;
DEALLOCATE PREPARE ps2;
DEALLOCATE PREPARE ps3;
DEALLOCATE PREPARE ps4;
SELECT * FROM ints;
SELECT * FROM deci;
SELECT * FROM dbls;
SELECT * FROM flts;
DROP TABLE ints, deci, dbls, flts;
CREATE TABLE t1 (
 id INT NOT NULL,
 value VARCHAR(100) NULL
);
INSERT INTO t1 VALUES ROW(1,'A');
prepare ps from "
UPDATE t1 AS ut
       INNER JOIN (VALUES ROW(?, ?)) AS vt (id, value)
       ON ut.id = vt.id
SET ut.value = vt.value";
SELECT * FROM t1;
UPDATE t1 SET id = 1, value = 'A';
prepare ps from "
UPDATE t1 AS ut
       INNER JOIN (VALUES ROW(CAST(? AS SIGNED), CAST(? AS CHAR))
                  ) AS vt (id, value)
       ON ut.id = vt.id
SET ut.value = vt.value";
SELECT * FROM t1;
deallocate prepare ps;
DROP TABLE t1;
