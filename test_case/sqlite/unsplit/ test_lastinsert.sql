create table t1 (k integer primary key);
insert into t1 values (1);
insert into t1 values (NULL);
insert into t1 values (NULL);
select last_insert_rowid();
create table t1w (k integer primary key) WITHOUT ROWID;
insert into t1w values (123456);
select last_insert_rowid();
update t1 set k=4 where k=2;
select last_insert_rowid();
delete from t1 where k=4;
select last_insert_rowid();
create table t2 (k integer primary key, val1, val2, val3);
select last_insert_rowid();
create view v as select * from t1;
select last_insert_rowid();
delete from t2;
update t2 set k=k+10, val2=100+last_insert_rowid();
update t2 set val3=1000+last_insert_rowid();
insert into t1 values (13);
select last_insert_rowid();
select val1 from t2;
select val2 from t2;
select val3 from t2;
delete from t2;
update t2 set k=k+10, val2=100+last_insert_rowid();
update t2 set val3=1000+last_insert_rowid();
update t1 set k=14 where k=3;
select last_insert_rowid();
select val1 from t2;
select val2 from t2;
select val3 from t2;
delete from t2;
update t2 set k=k+10, val2=100+last_insert_rowid();
update t2 set val3=1000+last_insert_rowid();
select last_insert_rowid();
select val1 from t2;
select val2 from t2;
select val3 from t2;
delete from t2;
update t2 set k=k+10, val2=100+last_insert_rowid();
update t2 set val3=1000+last_insert_rowid();
delete from t1 where k=1;
select last_insert_rowid();
select val1 from t2;
select val2 from t2;
select val3 from t2;
delete from t2;
update t2 set k=k+10, val2=100+last_insert_rowid();
update t2 set val3=1000+last_insert_rowid();
select last_insert_rowid();
select val1 from t2;
select val2 from t2;
select val3 from t2;
drop table t1;
drop table t2;
create temp table t1 (k integer primary key);
create temp table t2 (k integer primary key);
create temp view v1 as select * from t1;
create temp view v2 as select * from t2;
create temp table rid (k integer primary key, rin, rout);
insert into rid values (1, NULL, NULL);
insert into rid values (2, NULL, NULL);
update rid set rout=last_insert_rowid() where k=1;
update rid set rout=last_insert_rowid() where k=2;
insert into t1 values (77);
select last_insert_rowid();
select last_insert_rowid();
select rin from rid where k=1;
select rout from rid where k=1;
select rin from rid where k=2;
select rout from rid where k=2;
CREATE TABLE t2(x INTEGER PRIMARY KEY, y);
CREATE TABLE t3(a, b);
SELECT last_insert_rowid();
