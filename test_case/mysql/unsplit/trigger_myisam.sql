create table t1 (i int, at int, k int, key(k)) engine=myisam;
create table t2 (i int);
insert into t1 values (1, 1, 1);
insert into t2 values (1), (2), (3);
alter table t1 drop column at;
select * from t1;
insert into t1 values (2, 1);
select * from t1;
update t1 set k = 2 where i = 2;
select * from t1;
delete from t1 where i = 2;
select * from t1;
select * from t1;
insert into t1 select 3, 3;
select * from t1;
update t1, t2 set k = k + 10 where t1.i = t2.i;
select * from t1;
update t1, t2 set k = k + 10 where t1.i = t2.i and k < 3;
select * from t1;
delete t1, t2 from t1 straight_join t2 where t1.i = t2.i;
select * from t1;
delete t2, t1 from t2 straight_join t1 where t1.i = t2.i;
select * from t1;
alter table t1 add primary key (i);
insert into t1 values (3, 4) on duplicate key update k= k + 10;
select * from t1;
select * from t1;
drop table t1, t2;
CREATE TABLE t1 (id INTEGER) ENGINE=MyISAM;
CREATE TABLE t2 (id INTEGER) ENGINE=MyISAM;
INSERT INTO t2 VALUES (1),(2);
SELECT GET_LOCK('B26162',120);
SELECT 'rl_acquirer', GET_LOCK('B26162',120), id FROM t2 WHERE id = 1;
INSERT INTO t1 VALUES (5);
SELECT 'rl_contender', id FROM t2 WHERE id > 1;
SELECT RELEASE_LOCK('B26162');
SELECT RELEASE_LOCK('B26162');
DROP TABLE t1,t2;
CREATE TABLE t1 (id INT NOT NULL) ENGINE=MyISAM;
CREATE TABLE t2 (id INT NOT NULL) ENGINE=MyISAM;
INSERT t1 VALUES (1),(2),(3);
UPDATE IGNORE t1 SET id=NULL;
DROP TABLE t1,t2;