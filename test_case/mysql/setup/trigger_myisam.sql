create table t1 (i int, at int, k int, key(k)) engine=myisam;
create table t2 (i int);
insert into t1 values (1, 1, 1);
insert into t2 values (1), (2), (3);
alter table t1 drop column at;