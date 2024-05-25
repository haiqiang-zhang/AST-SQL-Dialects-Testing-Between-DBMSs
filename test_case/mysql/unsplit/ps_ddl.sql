drop temporary table if exists t1, t2, t3;
drop table if exists t1, t2, t3;
drop procedure if exists p_verify_reprepare_count;
drop procedure if exists p1;
drop function if exists f1;
drop view if exists v1, v2;
select variable_value from
  performance_schema.session_status where
  variable_name='com_stmt_reprepare'
  into @reprepare_count;
select '' as "SUCCESS";
create table t1 (a int);
prepare stmt from "select * from t1";
drop table t1;
deallocate prepare stmt;
create table t1 (a int);
prepare stmt from "select * from t1";
deallocate prepare stmt;
prepare stmt from "select a from t1";
alter table t1 add column (b int);
drop table t1;
deallocate prepare stmt;
create table t1 (a int);
prepare stmt from "insert into t1 (a) value (?)";
select @message;
select @message;
prepare stmt from "insert into t1 (a) value (?)";
select @message;
select @message;
select @message;
prepare stmt from "insert into t1 (a) value (?)";
select @message;
select @message;
select @message;
prepare stmt from "insert into t1 (a) value (?)";
select @message;
select @message;
select @message;
select @message;
prepare stmt from "insert into t1 (a) value (?)";
select @message;
select * from t1 order by a;
drop table t1;
deallocate prepare stmt;
create table t1 (a int);
create procedure p1(a int) begin end;
prepare stmt from "insert into t1 (a) values (?)";
drop procedure p1;
create procedure p1 (a int) begin end;
drop procedure p1;
prepare stmt from "insert into t1(a) values (?)";
select @var;
deallocate prepare stmt;
create table t2 (a int unique);
create table t3 (a int unique);
create view v1 as select a from t2;
insert into t1 (a) values (5);
select * from t2;
select * from t3;
drop view v1;
create view v1 as select a from t3;
insert into t1 (a) values (6);
select * from t2;
select * from t3;
prepare stmt from "insert into t1 (a) values (?)";
select * from t3;
select * from t2;
drop view v1;
create view v1 as select a from t2;
select * from t2;
select * from t3;
drop view v1;
drop table t1,t2,t3;
create table t1 (a int);
create table t2 (a int);
prepare stmt from "insert into t1 (a) values (?)";
alter table t2 add column comment varchar(255);
select * from t1;
select * from t2;
drop table t1,t2;
create table t1 (a int);
create table t2 (a int unique);
create table t3 (a int unique);
create table t4 (a int unique);
insert into t1 (a) values (1);
select * from t1 join t2 on (t1.a=t2.a) join t3 on (t2.a=t3.a);
insert into t1 (a) values (2);
select * from t1 join t2 on (t1.a=t2.a) join t4 on (t2.a=t4.a);
prepare stmt from "insert into t1 (a) values (?)";
select * from t1 join t2 on (t1.a=t2.a) join t4 on (t2.a=t4.a);
select * from t1 join t2 on (t1.a=t2.a) join t3 on (t2.a=t3.a);
select * from t1 join t2 on (t1.a=t2.a) join t4 on (t2.a=t4.a);
drop table t1, t2, t3, t4;
deallocate prepare stmt;
create table t1 (a int);
prepare stmt from "select * from t1";
drop table t1;
create temporary table t1 (a int);
drop table t1;
deallocate prepare stmt;
create table t1 (a int);
prepare stmt from 'select count(*) from t1';
create temporary table t1 AS SELECT 1;
deallocate prepare stmt;
drop temporary table t1;
drop table t1;
create table t1 (a int);
prepare stmt from "select * from t1";
drop table t1;
create table t2 (a int);
create view t1 as select * from t2;
drop view t1;
drop table t2;
deallocate prepare stmt;
create temporary table t1 (a int);
prepare stmt from "select * from t1";
drop temporary table t1;
deallocate prepare stmt;
create table t1 (a int);
insert into t1 (a) value (1);
create temporary table t1 (a int);
prepare stmt from "select * from t1";
drop temporary table t1;
select * from t1;
drop table t1;
deallocate prepare stmt;
create table t1 (a int);
create temporary table t1 as select 1 as a;
prepare stmt from "select count(*) from t1";
drop temporary table t1;
deallocate prepare stmt;
drop table t1;
create temporary table t1 (a int);
prepare stmt from "select a from t1";
drop temporary table t1;
create temporary table t1 (a int, b int);
select * from t1;
drop temporary table t1;
deallocate prepare stmt;
create temporary table t1 (a int);
create table t2 (a int);
prepare stmt from "select * from t1";
drop temporary table t1;
create view t1 as select * from t2;
drop view t1;
drop table t2;
deallocate prepare stmt;
create table t2 (a int);
create view t1 as select * from t2;
prepare stmt from "select * from t1";
drop view t1;
drop table t2;
deallocate prepare stmt;
create table t2 (a int);
create view t1 as select * from t2;
prepare stmt from "select * from t1";
drop view t1;
create table t1 (a int);
drop table t2;
drop table t1;
deallocate prepare stmt;
create table t2 (a int);
insert into t2 (a) values (1);
create view t1 as select * from t2;
prepare stmt from "select * from t1";
create temporary table t1 (a int);
drop view t1;
drop table t2;
drop temporary table t1;
deallocate prepare stmt;
create table t2 (a int);
insert into t2 (a) values (1);
create algorithm = temptable view t1 as select * from t2;
prepare stmt from "select * from t1";
create temporary table t1 (a int);
drop view t1;
drop table t2;
drop temporary table t1;
deallocate prepare stmt;
create view t1 as select table_name from information_schema.views where table_schema != 'sys';
prepare stmt from "select * from t1";
create temporary table t1 (a int);
drop view t1;
drop temporary table t1;
deallocate prepare stmt;
create table t2 (a int);
insert into t2 values (10), (20), (30);
create view t1 as select a, 2*a as b, 3*a as c from t2;
select * from t1;
prepare stmt from "select * from t1";
drop view t1;
create view t1 as select a, 2*a as b, 5*a as c from t2;
select * from t1;
alter view t1 as select a, 3*a as b, 4*a as c from t2;
select * from t1;
drop view t1;
create view t1 as select a, 5*a as b, 6*a as c from t2;
lock tables t1 read, t2 read;
unlock tables;
drop view t1;
create view t1 as select a, 6*a as b, 7*a as c from t2;
lock tables t1 read, t2 read;
unlock tables;
alter view t1 as select a, 7*a as b, 8*a as c from t2;
lock tables t1 read, t2 read;
unlock tables;
drop table t2;
drop view t1;
deallocate prepare stmt;
create table t1(a int);
insert into t1 values (1), (2), (3);
create view v1 as select a from t1;
lock tables t1 read, v1 read;
prepare stmt from 'select * from v1';
unlock tables;
drop view v1;
create view v1 as select 2*a from t1;
lock tables t1 read;
unlock tables;
drop table t1;
drop view v1;
deallocate prepare stmt;
create table t1(a int);
insert into t1 values (1), (2), (3);
create view v1 as select a from t1;
lock tables t1 read, v1 read;
prepare stmt from 'select * from v1';
unlock tables;
alter view v1 as select 2*a from t1;
lock tables t1 read;
unlock tables;
drop table t1;
drop view v1;
deallocate prepare stmt;
create table t1 (a int);
insert into t1 (a) values (1), (2), (3);
create table t2 (a int);
insert into t2 (a) values (4), (5), (6);
create procedure p1(out x int) select max(a) from t1 into x;
drop procedure p1;
create procedure p1(out x int) select max(a) from t2 into x;
create view v2 as select a from t1;
create view v1 as select * from v2;
prepare stmt from "select * from v1";
drop view v2;
create view v2 as select a from t2;
drop view v2;
create table v2 as select * from t1;
drop table v2;
create table v2 (a int unique) as select * from t2;
prepare stmt from "insert into v1 (a) values (?)";
select @message;
select @message;
select @message;
select * from v1;
drop table if exists t1, t2, v1, v2;
drop view if exists v1, v2;
drop procedure p1;
deallocate prepare stmt;
prepare stmt from
 "select ROUTINE_SCHEMA, ROUTINE_NAME, ROUTINE_TYPE
 from INFORMATION_SCHEMA.ROUTINES where
 routine_name='p1'";
create procedure p1() select "hi there";
drop procedure p1;
create procedure p1() select "hi there, again";
drop procedure p1;
deallocate prepare stmt;
create table t1 (a int);
create algorithm=temptable view v1 as select a*a as a2 from t1;
prepare stmt from "select * from v1";
insert into t1 values (1), (2), (3);
insert into t1 values (4), (5), (6);
drop table t1;
drop view v1;
create table t1 (a int);
prepare stmt from "alter table t1 add column b int";
drop table t1;
create table t1 (a1 int, a2 int);
drop table t1;
prepare stmt from "show create procedure p1";
create procedure p1() begin end;
drop procedure p1;
create procedure p1(x int, y int) begin end;
drop procedure p1;
prepare stmt from "show create function f1";
create table t1 (a int);
prepare stmt from "show create trigger t1_bi";
drop table t1;
deallocate prepare stmt;
create table t1 (a int);
prepare stmt from "select a from t1";
alter table t1 add column b varchar(50) default NULL;
alter table t1 change b c int;
alter table t1 change a a varchar(10);
alter table t1 change a a varchar(20);
alter table t1 change a a varchar(20) NOT NULL;
alter table t1 change c c int DEFAULT 20;
create unique index t1_a_idx on t1 (a);
drop index t1_a_idx on t1;
create index t1_a_idx on t1 (a);
drop table t1;
deallocate prepare stmt;
drop table if exists t_27420_100;
drop table if exists t_27420_101;
drop view if exists v_27420;
create table t_27420_100(a int);
insert into t_27420_100 values (1), (2);
create table t_27420_101(a int);
insert into t_27420_101 values (1), (2);
create view v_27420 as select t_27420_100.a X, t_27420_101.a Y
  from t_27420_100, t_27420_101
  where t_27420_100.a=t_27420_101.a;
prepare stmt from "select * from v_27420";
drop view v_27420;
create table v_27420(X int, Y int);
drop table v_27420;
create table v_27420 (a int, b int, filler char(200));
drop table t_27420_100;
drop table t_27420_101;
drop table v_27420;
deallocate prepare stmt;
drop table if exists t_27430_1;
drop table if exists t_27430_2;
create table t_27430_1 (a int not null, oref int not null, key(a));
insert into t_27430_1 values
  (1, 1),
  (1, 1234),
  (2, 3),
  (2, 1234),
  (3, 1234);
create table t_27430_2 (a int not null, oref int not null);
insert into t_27430_2 values
  (1, 1),
  (2, 2),
  (1234, 3),
  (1234, 4);
prepare stmt from
 "select oref, a, a in (select a from t_27430_1 where oref=t_27430_2.oref) Z from t_27430_2";
drop table t_27430_1, t_27430_2;
create table t_27430_1 (a int, oref int, key(a));
insert into t_27430_1 values
  (1, 1),
  (1, NULL),
  (2, 3),
  (2, NULL),
  (3, NULL);
create table t_27430_2 (a int, oref int);
insert into t_27430_2 values
  (1, 1),
  (2,2),
  (NULL, 3),
  (NULL, 4);
drop table t_27430_1;
drop table t_27430_2;
deallocate prepare stmt;
drop table if exists t_27690_1;
drop view if exists v_27690_1;
drop table if exists v_27690_2;
create table t_27690_1 (a int, b int);
insert into t_27690_1 values (1,1),(2,2);
create table v_27690_1 as select * from t_27690_1;
create table v_27690_2 as select * from t_27690_1;
prepare stmt from "select * from v_27690_1, v_27690_2";
drop table v_27690_1;
create view v_27690_1 as select A.a, A.b from t_27690_1 A, t_27690_1 B;
drop table t_27690_1;
drop view v_27690_1;
drop table v_27690_2;
deallocate prepare stmt;
drop table if exists t_12093;
drop function if exists f_12093;
drop function if exists f_12093_unrelated;
drop procedure if exists p_12093;
drop view if exists v_12093_unrelated;
create table t_12093 (a int);
create procedure p_12093(a int) select * from t_12093;
create procedure p_12093_unrelated() begin end;
create view v_12093_unrelated as select * from t_12093;
drop table t_12093;
drop procedure p_12093;
create table t1 (a int);
prepare stmt from "select 1 as res from dual where (1) in (select * from t1)";
drop table t1;
create table t1 (x int);
drop table t1;
deallocate prepare stmt;
drop table if exists t1;
drop table if exists t2;
create table t1 (a int);
prepare stmt from 'create table t2 as select * from t1';
create temporary table t2 (a int);
drop temporary table t2;
create view t2 as select 1;
drop view t2;
drop table t1;
create table t1 (x varchar(20));
alter table t1 add column y decimal(10,3);
drop table t1;
deallocate prepare stmt;
create table t1 (a int);
insert into t1 (a) values (1);
prepare stmt from "create temporary table if not exists t2 as select * from t1";
create temporary table t2 (a varchar(10));
select * from t2;
drop table t1;
create table t1 (x int);
drop table t1;
drop temporary table t2;
deallocate prepare stmt;
create table t1 (a int);
prepare stmt from "create table t2 like t1";
drop table t1;
create table t1 (x char(17));
alter table t1 add column y time;
drop table t1;
deallocate prepare stmt;
create table t1 (a int);
create table t2 (a int);
prepare stmt from "update t2 set a=a+1 where (1) in (select * from t1)";
drop table t1;
create table t1 (x int);
drop table t1, t2;
deallocate prepare stmt;
create table t1 (a int);
create table t2 (a int);
prepare stmt from "insert into t2 set a=((1) in (select * from t1))";
drop table t1;
create table t1 (x int);
drop table t1, t2;
deallocate prepare stmt;
create table t1 (a int);
create table t2 (a int);
prepare stmt from "insert into t2 select * from t1";
drop table t1;
create table t1 (x int);
drop table t1, t2;
deallocate prepare stmt;
create table t1 (a int);
create table t2 (a int);
prepare stmt from "replace t2 set a=((1) in (select * from t1))";
drop table t1;
create table t1 (x int);
drop table t1, t2;
deallocate prepare stmt;
create table t1 (a int);
create table t2 (a int);
prepare stmt from "replace t2 select * from t1";
drop table t1;
create table t1 (x int);
drop table t1, t2;
deallocate prepare stmt;
create table t1 (a int);
create table t2 (a int);
prepare stmt from "delete from t2 where (1) in (select * from t1)";
drop table t1;
create table t1 (x int);
drop table t1, t2;
deallocate prepare stmt;
create table t1 (a int);
create table t2 (a int);
create table t3 (a int);
prepare stmt from "delete t2, t3 from t2, t3 where (1) in (select * from t1)";
drop table t1;
create table t1 (x int);
drop table t1, t2, t3;
deallocate prepare stmt;
create table t1 (a int);
create table t2 (a int);
create table t3 (a int);
prepare stmt from "update t2, t3 set t3.a=t2.a, t2.a=null where (1) in (select * from t1)";
drop table t1;
create table t1 (x int);
drop table t1, t2, t3;
deallocate prepare stmt;
create table t1 (a varchar(20));
drop table t1;
create table t1 (a int);
prepare stmt from "show databases where (1) in (select * from t1)";
drop table t1;
create table t1 (x int);
drop table t1;
deallocate prepare stmt;
create table t1 (a int);
prepare stmt from "show tables where (1) in (select * from t1)";
drop table t1;
create table t1 (x int);
drop table t1;
deallocate prepare stmt;
create table t1 (a int);
prepare stmt from "show fields from t1 where (1) in (select * from t1)";
drop table t1;
create table t1 (x int);
drop table t1;
deallocate prepare stmt;
create table t1 (a int);
prepare stmt from "show keys from t1 where (1) in (select * from t1)";
drop table t1;
create table t1 (x int);
drop table t1;
deallocate prepare stmt;
create table t1 (a int);
prepare stmt from "show variables where (1) in (select * from t1)";
drop table t1;
create table t1 (x int);
drop table t1;
deallocate prepare stmt;
create table t1 (a int);
prepare stmt from "show status where (1) in (select * from t1)";
drop table t1;
create table t1 (x int);
drop table t1;
deallocate prepare stmt;
create table t1 (a int);
drop table t1;
create table t1 (a int);
prepare stmt from "show charset where (1) in (select * from t1)";
drop table t1;
create table t1 (x int);
drop table t1;
deallocate prepare stmt;
create table t1 (a int);
prepare stmt from "show collation where (1) in (select * from t1)";
drop table t1;
create table t1 (x int);
drop table t1;
deallocate prepare stmt;
create table t1 (a int);
prepare stmt from "show table status where (1) in (select * from t1)";
drop table t1;
create table t1 (x int);
drop table t1;
deallocate prepare stmt;
create table t1 (a int);
prepare stmt from "show triggers where (1) in (select * from t1)";
drop table t1;
create table t1 (x int);
drop table t1;
deallocate prepare stmt;
create table t1 (a int);
prepare stmt from "show open tables where (1) in (select * from t1)";
drop table t1;
create table t1 (x int);
drop table t1;
deallocate prepare stmt;
create table t1 (a int);
prepare stmt from "show procedure status where (1) in (select * from t1)";
drop table t1;
create table t1 (x int);
drop table t1;
deallocate prepare stmt;
create table t1 (a int);
prepare stmt from "show function status where (1) in (select * from t1)";
drop table t1;
create table t1 (x int);
drop table t1;
deallocate prepare stmt;
create table t1 (a int);
prepare stmt from "show events where (1) in (select * from t1)";
drop table t1;
create table t1 (x int);
drop table t1;
deallocate prepare stmt;
create table t1 (a int);
prepare stmt from "set @a=((1) in (select * from t1))";
drop table t1;
create table t1 (x int);
drop table t1;
deallocate prepare stmt;
create table t1 (a int);
prepare stmt from "do ((1) in (select * from t1))";
drop table t1;
create table t1 (x int);
drop table t1;
deallocate prepare stmt;
drop table if exists t1;
drop procedure if exists p1;
create procedure p1(a int) begin end;
create table t1 (a int);
prepare stmt from "call p1((1) in (select * from t1))";
drop table t1;
create table t1 (x int);
drop table t1;
drop procedure p1;
deallocate prepare stmt;
drop table if exists t1;
drop view if exists v1;
create table t1 (a int);
prepare stmt from "create view v1 as select * from t1";
drop table t1;
create table t1 (x int);
drop table t1;
deallocate prepare stmt;
create view v1 as select 1;
drop view v1;
drop temporary table if exists t1, t2, t3;
drop table if exists t1, t2, t3, v1, v2;
drop procedure if exists p_verify_reprepare_count;
drop procedure if exists p1;
drop function if exists f1;
drop view if exists v1, v2;
CREATE TABLE t1 (a INT);
PREPARE stmt1 FROM 'INSERT INTO t1 VALUES (1)';
CREATE TEMPORARY TABLE t1 (b int);
DEALLOCATE PREPARE stmt1;
DROP TEMPORARY TABLE t1;
DROP TABLE t1;
CREATE TEMPORARY TABLE t1 (i INT);
PREPARE stmt2 FROM 'CREATE TEMPORARY TABLE tm (i INT) ENGINE=InnoDB UNION=(t1)';
DEALLOCATE PREPARE stmt2;
PREPARE stmt3 FROM 'ALTER TABLE tm UNION=(t1)';
DEALLOCATE PREPARE stmt3;
