
-- Skipping the test when log-bin is enabled due to Bug#22472365
--source include/not_log_bin.inc
--source include/not_hypergraph.inc
--source include/elide_costs.inc

--echo --
--echo -- wl#6711:User can choose tmp table engine between MyISAM and InnoDB
--echo --
--echo -- NOTE: internal_tmp_disk_storage_engine system variable is removed, WL#11974.
--echo -- So on-disk tmp table engine is always InnoDB now.

-- In order to support innodb_limit_optimistic_insert_debug
--source include/have_debug.inc
-- In order to make the output of explain json-format stable
-- Contains several strange queries with GROUP BY, so:
--source include/turn_off_only_full_group_by.inc
-- =======================initialization====================
create table t1(a int, b varchar(20));
create table t2(a int, b varchar(20));
insert into t1 values(1, 'a'), (2, 'b'), (3, 'c'), (3, 'c'), (4, 'c');
insert into t2 values(2, 'd'), (3, 'e'), (4, 'f'), (4, 'f'), (5, 'e'),
                      (6, 'g'), (7, 'h');

-- Notice: if want mysql to use innodb tmp table, the following variable
-- settings should not be commented 
--
set @old_big_tables= @@big_tables;
set big_tables= on;
set @old_optimizer_switch= @@optimizer_switch;
set optimizer_switch='derived_merge=off';
select SQL_BUFFER_RESULT * from t1 order by 1, 2;

-- If order by is not simple order
  -- If not(sort_order only uses fields from head table and the head table is not left join table)
--replace_regex $elide_costs
  explain format=tree select * from t1 left join t2 on t1.b = t2.b order by t1.a;
  select * from t1 left join t2 on t1.b = t2.b order by t1.a;
  -- If sorting by a sp or udf function due to their expensive and probably non-deterministic nature.
  drop function if exists func1;
  create function func1(x int)
    returns int deterministic
    begin
    declare z1, z2 int;
    set z1 = x;
    set z2 = z1+2;
    return z2;
    end|
   delimiter ;
   select * from t1 order by func1(a);
   drop function func1;
  -- order by agg  --In order to make it simple, we make group by index
  create index indx1 on t1(b);
  SELECt a FROM t1 group by b order by sum(a);
  drop index indx1 on t1;
  select SQL_BIG_RESULT distinct * from t1, t2 order by 1, 2, 3, 4;
  select SQL_BIG_RESULT t1.b from t1, t2 group by t1.b order by 1;
  select SQL_BIG_RESULT distinct t1.a from t1, t2 group by t1.b order by 1;

-- a select with join and grouping that uses tmp table for grouping
--replace_regex $elide_costs
  explain format=tree select t1.* from t1 inner join t2 where t1.a = t2.a group by t1.a;
  select t1.* from t1 inner join t2 where t1.a = t2.a group by t1.a order by 1, 2;

-- select distinct that uses tmp table for duplicate elimination
--replace_regex $elide_costs
  explain format=tree select distinct t1.a from t1, t2 where  t1.b = t2.b;
  select distinct t1.a from t1, t2 where  t1.b = t2.b order by 1;
  -- remove_dup_with_hash_index
--replace_regex $elide_costs
  explain format=tree select distinct a from t1 group by b,a;
  select distinct a from t1 group by b,a order by 1;
  set @old_big_tables=@@big_tables;
  set big_tables=1;
  drop table if exists t3;
  create table t3 like t1;
  INSERT INTO t3 VALUES (1, '1'), (1, '1'), (2, '2'), (3, '1'), (3, '1'), (4, '4');
  insert into t3 select 5 + 10000 * rand(), '5' from t3;
  insert into t3 select 5 + 10000 * rand(), '5' from t3;
  insert into t3 select 5 + 10000 * rand(), '5' from t3;
  insert into t3 select 5 + 10000 * rand(), '5' from t3;
  insert into t3 select 5 + 10000 * rand(), '5' from t3;
  insert into t3 select 5 + 10000 * rand(), '5' from t3;
  insert into t3 select 5 + 10000 * rand(), '5' from t3;
  insert into t3 select 5 + 10000 * rand(), '5' from t3;
  set @old_sort_buffer_size = @@sort_buffer_size;
  set @@sort_buffer_size = 32804;
  select distinct b from t3 group by a order by 1;
  set @@sort_buffer_size = @old_sort_buffer_size;
  set big_tables=@old_big_tables;
  drop table t3;
  drop table if exists t3;
  create table t3(a int, b int, c int, d char, e blob);
  insert into t3 values(1,2,3,'4','5');
  select distinct t3.a,e from t3, t1 order by t3.b;
  drop table t3;
select * from t1 union all select * from t2;
  -- filesort
--replace_regex $elide_costs
  explain format=tree select * from t1 union select * from t2 order by 1, 2;
  select * from t1 union select * from t2 order by 1, 2;

-- select with a single derived table
--replace_regex $elide_costs
explain format=tree select tt.* from (select * from t1) as tt;
select tt.* from (select * from t1) as tt order by 1, 2;
select * from (select b from t1) as t1, (select b from t2) as t2 order by 1, 2;
drop table if exists t3;
create table t3(a int, b int, c int, d char);
insert into t3 values(1,2,3,'4');
create index t3_indx1 on t3(a);
select * from t1, (select * from t3) as t where t.a =5 order by 1, 2;
drop table t3;
select * from t1 where t1.a in (select a from t2) order by 1, 2;
set @tmp_optimizer_switch= @@optimizer_switch;

if (`select locate('materialization', @@optimizer_switch) > 0`) 
{
    set optimizer_switch='materialization=off';
{
    set optimizer_switch='firstmatch=off';
{
    set optimizer_switch='loosescan=off';
select * from t1 where t1.a in (select a from t2) order by 1, 2;
set optimizer_switch= @tmp_optimizer_switch;
SET DEBUG='+d,skip_dd_table_access_check';
select * from information_schema.character_sets order by 1 limit 3;
update t1, t2 set t1.a = 9, t2.a = 10 where t1.b = 'a';
select count(distinct a) from t1;
select b, group_concat(a) from t1 order by 1, 2;
drop table if exists t1;
create table t1(a int, b blob);
insert into t1 values(1, 'ababab');
insert into t1 values(2, 'cccddd');
insert into t1 values(2, 'cccddd');
insert into t1 values(3, 'eeffddd');
  select * from t1 left join t2 on t1.a = t2.a order by t1.b;
select * from t1 left join t2 on t1.a = t2.a order by t1.b;
select a from t1 group by b order by 1;
select distinct b from t1 order by 1;
drop table if exists t2;
CREATE TABLE `t2`
(
 `i1` int NOT NULL,
 `i2` int NOT NULL,
 `c1` tinytext
 );
insert into t2 values(10, 20, 'aa');
insert into t2 values(20, 30, 'aabb');
insert into t2 values(30, 40, 'aabbcc');
select distinct concat(c1, repeat('xx', 250)) as cc from t2 order by 1;
select concat(c1, repeat('xx', 250)) as cc from t2 group by cc order by 1;
select count(distinct concat(c1, repeat('xx', 250))) as cc from t2 order by 1;

create table test(c1 int, c2 int, c3 int, c4 int, c5 int, c6 int,
                  c7 int, c8 int, c9 int, c10 int, c11 int, c12 int,
                  c13 int, c14 int, c15 int, c16 int, c17 int, c18 int
                 );
insert into test values(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
                        13, 14, 15, 16, 17, 18);
select distinct * from test;
drop table test;
--        for having condition which including avg
--##################################################
drop table if exists t1;
create table t1
(
a int, b varchar(30),
primary key(a)
);
insert into t1 values (1,'one');
insert into t1 values (2,'two');
insert into t1 values (3,'three');
insert into t1 values (4,'four');
set @Oporto='Oporto';
select sum(a) + 200 as the_sum, @Oporto as the_town from t1
where a > 1 
group by b 
having avg(a) > 2;
create table t0 (a int);
insert into t0 values (0),(1),(2),(3),(4),(5),(6),(7),(8),(9);
drop table if exists t1;
create table t1 (
                 a int, 
                 b int 
                ) engine=innodb;
insert into t1 values (1,1),(1,1),(2,2);
create table t3 (
                 a int,
                 b int,
                 key(b),
                 pk1 char(200), pk2 char(200), pk3 char(200),
                 primary key(pk1, pk2, pk3)
                ) engine=innodb;
insert into t3 select a,a, a,a,a from t0;
set @old_optimizer_switch=@@optimizer_switch;
set optimizer_switch='materialization=off';
select * from t3 where b in (select a from t1);
set @@optimizer_switch=@old_optimizer_switch;
select * from t1 order by 1,2;
select * from t3 order by 1,2;
create trigger trg before update on t3 for each row set new.b=new.b+1;
select * from t3 order by 1,2;
drop table t0, t1, t3;
create table t1(f1 text);
insert into t1 values ('a'),('a'),('mn');
select f1,'' from t1 union select f1,'' from t1;
select distinct *,if(1,'',f1) from t1;
select count(*), f1,if(1,'',f1) from t1 group by 2,3;
select count(distinct f1,if(1,'',f1)) from t1;
drop table t1;
drop table t2;
SET @old_big_tables=@@big_tables;
SET big_tables=on;
SET sql_mode = 'NO_ENGINE_SUBSTITUTION';
CREATE TABLE N (
col_int_key int DEFAULT NULL,
pk int NOT NULL AUTO_INCREMENT,
col_varchar_1024_utf8_key varchar(1024) CHARACTER SET utf8mb3 DEFAULT NULL,
PRIMARY KEY (pk),
KEY col_int_key (col_int_key),
KEY col_varchar_1024_utf8_key (col_varchar_1024_utf8_key(333))
) ROW_FORMAT=DYNAMIC;

INSERT INTO N VALUES
(1,3,repeat('a',1000)),(0,4,'tell'),(7,6,'o'),(6,7,'g'),(8,8,'can'),
(9,15,repeat('a',1020)),(4,16,repeat('a',1020)),(6,18,'his'),(NULL,19,'going'),
(7,22,'mean'),(8,23,'here');

CREATE TABLE P (
pk int NOT NULL AUTO_INCREMENT,
col_int_key int DEFAULT NULL,
col_varchar_10_latin1 varchar(10) DEFAULT NULL,
PRIMARY KEY (pk),
KEY col_int_key (col_int_key)
) ;

INSERT INTO P VALUES
(1,4,'want'),(2,3,'g'),(3,NULL,'n'),(4,1,'so'),(5,-71827456,'k'),(6,NULL,'btez
ldxvuu'),(7,NULL,'p'),(8,5,'t'),(9,517341184,'don\'t'),(10,-1507786752,'that\'s');

SELECT
alias1 . pk AS field3 ,
alias3 . pk AS field5 ,
MIN( DISTINCT alias2 . col_int_key ) AS field8
FROM  ( SELECT * FROM  P  ) AS  alias1  LEFT  JOIN  ( SELECT * FROM  N  ) AS
alias2  RIGHT  JOIN ( SELECT * FROM  P  ) AS  alias3
ON  alias2 . col_varchar_1024_utf8_key =  alias3 . col_varchar_10_latin1
ON  alias1 . pk =  alias3 . col_int_key
GROUP BY field3, field5
ORDER BY 1,2,3;

DROP TABLE N,P;
SET big_tables=@old_big_tables;
SET sql_mode = 'NO_ENGINE_SUBSTITUTION';
CREATE TABLE t1 (  col_int_key int,  col_varchar_key varchar(1),  KEY col_int_key (col_int_key),  KEY col_varchar_key (col_varchar_key,col_int_key))/*! engine=MyISAM */;
INSERT INTO t1 VALUES (1,'a');
INSERT INTO t1 VALUES (4,'c');
INSERT INTO t1 VALUES (9,'e');
INSERT INTO t1 VALUES (5,'h');
INSERT INTO t1 VALUES (204,'h');
INSERT INTO t1 VALUES (2,'i');
INSERT INTO t1 VALUES (5,'i');
INSERT INTO t1 VALUES (9,'l');
INSERT INTO t1 VALUES (224,'p');
INSERT INTO t1 VALUES (3,'q');
INSERT INTO t1 VALUES (0,'s');
INSERT INTO t1 VALUES (7,'s');
INSERT INTO t1 VALUES (6,'u');
INSERT INTO t1 VALUES (3,'v');
INSERT INTO t1 VALUES (7,'v');
INSERT INTO t1 VALUES (3,'w');
INSERT INTO t1 VALUES (0,'y');
INSERT INTO t1 VALUES (3,'y');
INSERT INTO t1 VALUES (5,'y');
INSERT INTO t1 VALUES (1,'z');
CREATE TABLE t2 (  col_int_key int,  col_varchar_key varchar(1),  KEY col_int_key (col_int_key),  KEY col_varchar_key (col_varchar_key,col_int_key))/*! engine=MyISAM */;
INSERT INTO t2 VALUES (4,'b');
INSERT INTO t2 VALUES (1,'c');
INSERT INTO t2 VALUES (4,'d');
INSERT INTO t2 VALUES (6,'d');
INSERT INTO t2 VALUES (9,'d');
INSERT INTO t2 VALUES (24,'d');
INSERT INTO t2 VALUES (8,'e');
INSERT INTO t2 VALUES (7,'g');
INSERT INTO t2 VALUES (0,'j');
INSERT INTO t2 VALUES (8,'m');
INSERT INTO t2 VALUES (8,'m');
INSERT INTO t2 VALUES (4,'p');
INSERT INTO t2 VALUES (1,'q');
INSERT INTO t2 VALUES (4,'r');
INSERT INTO t2 VALUES (2,'s');
INSERT INTO t2 VALUES (1,'t');
INSERT INTO t2 VALUES (8,'v');
INSERT INTO t2 VALUES (9,'w');
INSERT INTO t2 VALUES (4,'x');
INSERT INTO t2 VALUES (6,'y');

SELECT DISTINCT 'i'
FROM t1 STRAIGHT_JOIN ( t2 AS table2 JOIN t2 AS table3 ON ( table3.col_varchar_key = table2.col_varchar_key ))
ON ( table3.col_varchar_key = table2.col_varchar_key )
ORDER BY table3.col_varchar_key ;

SELECT found_rows();

SET @var1 = 'i';

SELECT DISTINCT @var1
FROM t1 STRAIGHT_JOIN ( t2 AS table2 JOIN t2 AS table3 ON ( table3.col_varchar_key = table2.col_varchar_key ))
ON ( table3.col_varchar_key = table2.col_varchar_key )
ORDER BY table3.col_varchar_key;

SELECT found_rows();

DROP TABLE t1;
DROP TABLE t2;
SET sql_mode = default;
CREATE TABLE t1 (col_varchar_10_utf8_key varchar(10),
col_varchar_10_latin1_key varchar(10),
col_int_key int,
col_varchar_1024_latin1_key varchar(1024),
pk int auto_increment,
PRIMARY KEY (pk),
KEY col_varchar_10_utf8_key (col_varchar_10_utf8_key),
KEY col_varchar_10_latin1_key (col_varchar_10_latin1_key),
KEY col_int_key (col_int_key),
KEY col_varchar_1024_latin1_key (col_varchar_1024_latin1_key (767)))/*! engine=InnoDB */;
INSERT INTO t1 VALUES ('VPANI','fhlsfqrskw',NULL,'no',1);
INSERT INTO t1 VALUES ('x','or',NULL,'lsfqrskwmxgptnmvqpufippfjswvzbtnvzocndndyymyjuhfntqersfsyqfdqdlnnaytyyybseabbrrfgjltjkhakdezpelkaqycfznlnhkddyuxbdybmbilkqrpmamnnhugtiirhldcncsuhynrejvficieitkbhfotgbxgnuyypbbpmclmxmnujdecohzvghxenmiqnldebgypjleqqrhvnzkertpohjvhcxhjgggmamgyauappsohijbklnmomfvtylahsatyeiodhbunlbbgqwayvaomtxkpvxdyozhioaxilvxhnjkmvgnrrugibyodirihwmohmvmhytcqphbqbcbjuxfenmghuigxsxtefiogkhiuijfajsuaympcmtezmxfezfwaaelkwdtlynyoyhwptdqffjihimhurbfxuagggpjuyyzclxcuuymzjbsiiwnxagdhzgrbjgkhtxlkjvzskzkybksdmzqajmsxoaejgtegzgbzuktuecedpoztsvrqwjkbavfmvkoyasnnyfhfnexgifgbubiwfmijaskpmekaxdieiubnvfepflkpnmoqroxehhkhtvkjcu',2);
INSERT INTO t1 VALUES ('XUPNQ','sfqrskwmxg',0,'h',3);
INSERT INTO t1 VALUES ('k','out',1,'qrskwmxgptnmvqpufippfjswvzbtnvzocndndyymyjuhfntqersfsyqfdqdlnnaytyyybseabbrrfgjltjkhakdezpelkaqycfznlnhkddyuxbdybmbilkqrpmamnnhugtiirhldcncsuhynrejvficieitkbhfotgbxgnuyypbbpmclmxmnujdecohzvghxenmiqnldebgypjleqqrhvnzkertpohjvhcxhjgggmamgyauappsohijbklnmomfvtylahsatyeiodhbunlbbgqwayvaomtxkpvxdyozhioaxilvxhnjkmvgnrrugibyodirihwmohmvmhytcqphbqbcbjuxfenmghuigxsxtefiogkhiuijfajsuaympcmtezmxfezfwaaelkwdtlynyoyhwptdqffjihimhurbfxuagggpjuyyzclxcuuymzjbsiiwnxagdhzgrbjgkhtxlkjvzskzkybksdmzqajmsxoaejgtegzgbzuktuecedpoztsvrqwjkbavfmvkoyasnnyfhfnexgifgbubiwfmijaskpmekaxdieiubnvfepflkpnmoqroxehhkhtvkjcuvstuufixrwmdptkmtjyhmgutwjfckdersujhfhxahpkloqgubkwvkhijboxnnztgjjtvbxqczomrnkfrkeicfynbpxkileklntghbckaqvjwqdegqbrcbhlbnasnqtauzhgivbxrnhtdcydodqphzihacfzxuzppaxpshqqghpztmmtbwqcebmqburuddenzepxhnfnlfmycgfdeilzyrnurvphljmhsjdejcjtonftcwojbqkksoimsiaxjiivsgogwswxzsxmpcjvtvhmkupgblnvgyhfrojviuuilaghuwflvgwwxlbaboktrgtlsbnmleemfxvcsdwulizbggywpjdlutquetytfbeohpumbbatkjrvxvvslg',4);
INSERT INTO t1 VALUES ('i','something',1309278208,'CJPYD',5);
INSERT INTO t1 VALUES ('OIQHF','PLDJR',NULL,'kwmxgptnmvqpufippfjswvzbtnvzocndndyymyjuhfntqersfsyqfdqdlnnaytyyybseabbrrfgjltjkhakdezpelkaqycfznlnhkddyuxbdybmbilkqrpmamnnhugtiirhldcncsuhynrejvficieitkbhfotgbxgnuyypbbpmclmxmnujdecohzvghxenmiqnldebgypjleqqrhvnzkertpohjvhcxhjgggmamgyauappsohijbklnmomfvtylahsatyeiodhbunlbbgqwayvaomtxkpvxdyozhioaxilvxhnjkmvgnrrugibyodirihwmohmvmhyt',6);
INSERT INTO t1 VALUES ('ZIGQI','wmxgptnmvq',-1216937984,'xgptnmvqpufippfjswvzbtnvzocndndyymyjuhfntqersfsyqfdqdlnnaytyyybseabbrrfgjltjkhakdezpelkaqycfznlnhkddyuxbdybmbilkqrpmamnnhugtiirhldcncsuhynrejvficieitkbhfotgbxgnuyypbbpmclmxmnujdecohzvghxenmiqnldebgypjleqqrhvnzkertpohjvhcxhjgggmamgyauappsohijbklnmomfvtylahsatyeiodhbunlbbgqwayvaomtxkpvxdyozhioaxi',7);
INSERT INTO t1 VALUES ('gptnmvqpuf','UMZNK',-1198915584,'tnmvqpufippfjswvzbtnvzocndndyymyjuhfntqersfsyqfdqdlnnaytyyybseabbrrfgjltjkhakdezpelkaqycfznlnhkddyuxbdybmbilkqrpmamnnhugtiirhldcncsuhynrejvficieitkbhfotgbxgnuyypbbpmclmxmnujdecohzvghxenmiqnldebgypjleqqrhvnzkertpohjvhcxhjgggmamgyauappsohijbklnmomfvtylahsatyeiodhbunlbbgqwayvaomtxkpvxdyozhioaxilvxhnjkmvgnrrugibyodirihwmohmvmhytcqphbqbcbjuxfenmghuigxsxtefiogkhiuijfajsuaympcmtezmxfezfwaaelkwdtlynyoyhwptdqffjihimhurbfxuagggpjuyyzclxcuuymzjbsiiwnxagdhzgrbjgkhtxlkjvzskzkybksdmzqajmsxoaejgtegzgbzuktuecedpoztsvrqwjkbavfmvkoyasnnyfhfnexgifgbubiwfmijaskpmekaxdieiubnvfepflkpnmoqroxehhkhtvkjcuvstuufixrwmdptkmtjyhmgutwjfckdersujhfhxahpkloqgubkwvkhijboxnnztgjjtvbxqczomrnkfrkeicfynbpxkileklntghbckaqvjwqdegqbrcbhlbnasnqtauzhgivbxrnhtdcydodqphzihacfzxuzppaxpshqqghpztmmtbwqcebmqburuddenzepxhnfnlfmycgfdeilzyrnurvphljmhsjdejcjt',8);
INSERT INTO t1 VALUES ('GMKDJ','mvqpufippf',NULL,'w',9);
INSERT INTO t1 VALUES ('okay','t',662765568,'to',10);
INSERT INTO t1 VALUES ('pufippfjsw','g',0,'AFNKO',11);
INSERT INTO t1 VALUES ('QXCYP','you\'re',4,'KCMVA',12);
INSERT INTO t1 VALUES ('okay','DTEDL',63635456,'LJTAI',13);
INSERT INTO t1 VALUES ('XOPQC','PCSAX',1,'PWVIZ',14);
INSERT INTO t1 VALUES ('or','ADLAS',747241472,'r',15);
INSERT INTO t1 VALUES ('j','vzbtnvzocn',NULL,'m',16);
INSERT INTO t1 VALUES ('x','SRJST',6,'up',17);
INSERT INTO t1 VALUES ('m','been',NULL,'tnvzocndndyymyjuhfntqersfsyqfdqdlnnaytyyybseabbrrfgjltjkhakdezpelkaqycfznlnhkddyuxbdybmbilkqrpmamnnhugtiirhldcncsuhynrejvficieitkbhfotgbxgnuyypbbpmclmxmnujdecohzvghxenmiqnldebgypjleqqrhvnzkertpohjvhcxhjgggmamgyauappsohijbklnmomfvtylahsatyeiodhbunlbbgqwayvaomtxkpvxdyozhioaxilvxhnjkmvgnrrugibyodirihwmohmvmhytcqphbqbcbjuxfenmghuigxsxtefiogkhiuijfajsuaympcmtezmxfezfwaaelkwdtlynyoyhwptdqffjihimhurbfxuagggpjuyyzclxcuuymzjbsiiwnxagdhzgrbjgkhtxlkjvzskzkybksdmzqajmsxoaejgtegzg',18);
INSERT INTO t1 VALUES ('you','MSKTD',-1543307264,'is',19);
INSERT INTO t1 VALUES ('JGKZD','zocndndyym',NULL,'IYVZN',20);
INSERT INTO t1 VALUES ('u','ocndndyymy',-488439808,'v',21);
INSERT INTO t1 VALUES ('v','and',NULL,'OMAKY',22);
INSERT INTO t1 VALUES ('from','yymyjuhfnt',2002321408,'e',23);
INSERT INTO t1 VALUES ('it\'s','yjuhfntqer',NULL,'come',24);
INSERT INTO t1 VALUES ('a','hfntqersfs',53542912,'FIHNG',25);
INSERT INTO t1 VALUES ('ntqersfsyq','tell',7,'qersfsyqfdqdlnnaytyyybseabbrrfgjltjkhakdezpelkaqycfznlnhkddyuxbdybmbilkqrpmamnnhugtiirhldcncsuhynrejvficieitkbhfotgbxgnuyypbbpmclmxmnujdecohzvghxenmiqnldebgypjleqqrhvnzkertpohjvhcxhjgggmamgyauappsohijbklnmomfvtylahsatyeiodhbunlbbgqwayvaomtxkpvxdyozhioaxilvxhnjkmvgnrrugibyodirihwmohmvmhytcqphbqbcbjuxfenmghuigxsxtefiogkhiuijfajsuaympcmtezmxfezfwaaelkwdtlynyoyhwptdqffjihimhurbfxuagggpjuyyzclxcuuymzjbsiiwnxagdhzgrbjgkhtxlkjvzskzkybksdmzqajmsxoaejgtegzgbzuktuecedpoztsvrqwjkbavfmvkoyasnnyfhfnexgifgbubiwfmijaskpmekaxdieiubnvfepflkpnmoqr',26);
INSERT INTO t1 VALUES ('ersfsyqfdq','x',3,'TLKCK',27);
INSERT INTO t1 VALUES ('w','fsyqfdqdln',NULL,'qfdqdlnnaytyyybseabbrrfgjltjkhakdezpelkaqycfznlnhkddyuxbdybmbilkqrpmamnnhugtiirhldcncsuhynrejvficieitkbhfotgbxgnuyypbbpmclmxmnujdecohzvghxenmiqnldebgypjleqqrhvnzkertpohjvhcxhjgggmamgyauappsohijbklnmomfvtylahsatyeiodhbunlbbgqwayvaomtxkpvxdyozhioaxilvxhnjkmvgnrrugibyodirihwmohmvmhytcqphbqbcbjuxfenmghuigxsxtefiogkhiuijfajsuaympcmtezmxfezfwaaelkwdtlynyoyhwptdqffjihimhurbfxuagggpjuyyzclxcuuymzjbsiiwnxagdhzgrbjgkhtxlkjvzskzkybksdmzqajmsxoaejgtegzgbzuktuecedpoztsvrqwjkbavfmvkoyasnnyfhfnexgifgbubiwfmijaskpmekaxdieiubnvfepflkpnmoqroxehhkhtvkjcuvstuufixrwmdptkmtjyhmgutwjfckdersujhfhxahpkloqgubkwvkhijboxnnztgjjtvbxqczomrnkfrkeicfynbpxkileklntghbckaqvjwqdegqbrcbhlbnasn',28);
INSERT INTO t1 VALUES ('fdqdlnnayt','l',9,'SKRVI',29);
INSERT INTO t1 VALUES ('RSQKC','I\'ll',5,'RIYFY',30);
INSERT INTO t1 VALUES ('aytyyybsea','PPCCF',NULL,'ytyyybseabbrrfgjltjkhakdezpelkaqycfznlnhkddyuxbdybmbilkqrpmamnnhugtiirhldcncsuhynrejvficieitkbhfotgbxgnuyypbbpmclmxmnujdecohzvghxenmiqnldebgypjleqqrhvnzkertpohjvhcxhjgggmamgyauappsohijbklnmomfvtylahsatyeiodhbunlbbgqwayvaomtxkpvxdyozhioaxilvxhnjkmvgnrrugibyodirihwmohmvmhytcqphbqbcbjuxfenmghuigxsxtefiogkhiuijfajsuaympcmtezmxfezfwaaelkwdtlynyoyhwptdqffjihimhurbfxuagggpjuyyzclxcuuymzjbsiiwnxagdhzgrbjgkhtxlkjvzskzkybksdmzqajmsxoaejgtegzgbzuktuecedpoztsvrqwjkbavfmvkoyasnnyfhfnexgifgbubiwfmijaskpmekaxdieiubnvfepflkpnmoqroxehhkhtvkjcuvstuufixrwmdptkmtjyhmgutwjfckdersujhfhxahpkloqgubkwvkhijboxnnztgjjtvbxqczomrnkfrkeicfynbpxkileklntghbckaqvjwqdegqbrcbhlbnasnqtauzhgiv',31);
INSERT INTO t1 VALUES ('ORAGP','l',NULL,'AAANT',32);
INSERT INTO t1 VALUES ('she','RFZSD',8,'WFINT',33);
INSERT INTO t1 VALUES ('h','UASMF',-1822425088,'get',34);
INSERT INTO t1 VALUES ('yybseabbrr','ZZJHQ',NULL,'a',35);
INSERT INTO t1 VALUES ('her','seabbrrfgj',1366753280,'going',36);
INSERT INTO t1 VALUES ('you\'re','eabbrrfgjl',NULL,'good',37);
INSERT INTO t1 VALUES ('d','with',-441319424,'a',38);
INSERT INTO t1 VALUES ('brrfgjltjk','rrfgjltjkh',NULL,'my',39);
INSERT INTO t1 VALUES ('jltjkhakde','UQAIL',312999936,'DAFWP',40);
INSERT INTO t1 VALUES ('ltjkhakdez','tjkhakdezp',129892352,'e',41);
INSERT INTO t1 VALUES ('did','can\'t',6,'akdezpelkaqycfznlnhkddyuxbdybmbilkqrpmamnnhugtiirhldcncsuhynrejvficieitkbhfotgbxgnuyypbbpmclmxmnujdecohzvghxenmiqnldebgypjleqqrhvnzkertpohjvhcxhjgggmamgyauappsohijbklnmomfvtylahsatyeiodhbunlbbgqwayvaomtxkpvxdyozhioaxilvxhnjkmvgnrrugibyodirihwmohmvmhytcqphbqbcbjuxfenmghuigxsxtefiogkhiuijfajsuaympcmtezmxfezfwaaelkwdtlynyoyhwptdqffjihimhurbfxuagggpjuyyzclxcuuymzjbsiiwnxagdhzgrbjgkhtxlkjvzskzkybksdmzqajmsxoaejgtegzgbzuktuecedpoztsvrqwjkbavfmvkoyasnnyfhfnexgifgbubiwfmijaskpmekaxdieiubnvfepflkpnmoqroxehhkhtvkjcuvstuufixrwmdptkmtjyhmgutwjfckdersujhfhxahpkloqgubkwvkhijboxnnztgjjtvbxqczomrnkfrkeicfynbpxkileklntghbckaqvjwqdegqbrcbhlbnasnqtauzhgivbxrnhtdcydodqphzihacfzxuzppaxpshqqghpztmmtbwqcebmqburuddenzepxhnfnlfmycgfdeilzyrnurvphljmhsjdejcjtonftcwojb',42);
INSERT INTO t1 VALUES ('him','there',-922222592,'k',43);
INSERT INTO t1 VALUES ('was','is',2,'pelkaqycfznlnhkddyuxbdybmbilkqrpmamnnhugtiirhldcncsuhynrejvficieitkbhfotgbxgnuyypbbpmclmxmnujdecohzvghxenmiqnldebgypjleqqrhvnzkertpohjvhcxhjgggmamgyauappsohijbklnmomfvtylahsatyeiodhbunlbbgqwayvaomtxkpvxdyozhioaxilvxhnjkmvgnrrugibyodirihwmohmvmhytcqphbqbcbjuxfenmghuigxsxtefiogkhiuijfajsuaympcmtezmxfezfwaaelkwdtlynyoyhwptdqffjihimhurbfxuagggpjuyyzclxcuuymzjbsiiwnxagdhzgrbjgkhtxlkjvzskzkybksdmzqajmsxoaejgtegzgbzuktuecedpoztsvrqwjkbavfmvkoyasnnyfhfnexgifgbubiwfmijaskpmekaxdieiubnvfepflkpnmoqroxehhkhtvkjcuvstuufixrwmdptkmtjyhmgutwjfckdersujhfhxahpkloqgubkwvkhijboxnnztgjjtvbxqczomrnkfrkeicfynbpxkileklntghbckaqvjwqdegqbrcbhlbnasnqtauzhgivbxrnhtdcydodqphzihacfzxuzp',44);
INSERT INTO t1 VALUES ('q','WDPLG',-1286144000,'QCWSP',45);
INSERT INTO t1 VALUES ('elkaqycfzn','YUUZH',250347520,'kaqycfznlnhkddyuxbdybmbilkqrpmamnnhugtiirhldcncsuhynrejvficieitkbhfotgbxgnuyypbbpmclmxmnujdecohzvghxenmiqnldebgypjleqqrhvnzkertpohjvhcxhjgggmamgyauappsohijbklnmomfvtylahsatyeiodhbunlbbgqwayvaomtxkpvxdyozhioaxilvxhnjkmvgnrrugibyodirihwmohmvmhytcqphbqbcbjuxfenmghuigxsxtefiogkhiuijfajsuaympcmtezmxfezf',46);
INSERT INTO t1 VALUES ('IHSMI','qycfznlnhk',2,'fznlnhkddyuxbdybmbilkqrpmamnnhugtiirhldcncsuhynrejvficieitkbhfotgbxgnuyypbbpmclmxmnujdecohzvghxenmiqnldebgypjleqqrhvnzker',47);
INSERT INTO t1 VALUES ('for','what',NULL,'is',48);
INSERT INTO t1 VALUES ('znlnhkddyu','nlnhkddyux',NULL,'lnhkddyuxbdybmbilkqrpmamnnhugtiirhldcncsuhynrejvfici',49);
INSERT INTO t1 VALUES ('d','FDBPU',-726204416,'a',50);
INSERT INTO t1 VALUES ('know','FCZRO',5,'r',51);
INSERT INTO t1 VALUES ('d','dyuxbdybmb',NULL,'p',52);
INSERT INTO t1 VALUES ('could','OWEYU',NULL,'xbdybmbilkqrpmamnnhugtiirhldcncsuhynrejvficieitkbhfotgbxgnuyypbbpmclmxmnujdecohzvghxenmiqnldebgypjleqqrhvnzkertpohjvhcxhjgggmamgyauappsohijbklnmomfvtylahsatyeiodhbunlbbgqwayvaomtxkpvxdyozhioaxilvxhnjkmvgnrrugibyodirihwmohmvmhytcqphbqbcbjuxfenmghuigxsxtefiogkhiuijfajsuaympcmtezmxfezfwaaelkwdtlynyoyhwptdqffjihimhurbfxuagggpjuyyzclxcuuymzjbsiiwnxagdhzgrbjgkhtxlkjvzskzkybksdmzqajmsxoaejgtegzgbzuktuecedpoztsvrqwjkbavfmvkoyasnnyfhfnexgifgbubiwfmijaskpmekaxdieiubnvfepflkpnmoqroxehhkhtvkjcuvstuufixrwmdptkmtjyhmgutwjfckdersujhfhxahpkloqgubkwvkhijboxnnztgjjtvbxqczomrnkfrkeicfynbpxkileklntghbckaqvjwqdegqbrcbhlbnasnqtauzhgivbxrnhtdcydodqphzihacfzxuzppaxpshqqghpztmmtbwqcebmqburuddenzepxhnfnlfmycgfdeilzyrnurvphljmhsjdejcjtonftcwojbqkksoimsiaxjiivsgogwswxzsxmpcjvtvhmkupgblnvgyhfrojviuuilaghuwflvgwwxlbaboktrgtlsbnmleemfxvcsdwulizbggywpjdlutquetytfbeohpumbbatkjrvxvvslgkvonz',53);
INSERT INTO t1 VALUES ('when','really',1748828160,'i',54);
INSERT INTO t1 VALUES ('n','BXWOW',NULL,'EXDPY',55);
INSERT INTO t1 VALUES ('can','w',5,'CUPBP',56);
INSERT INTO t1 VALUES ('w','h',NULL,'PJMRU',57);
INSERT INTO t1 VALUES ('y','t',4,'BQGLF',58);
INSERT INTO t1 VALUES ('he\'s','ESKUI',NULL,'pmamnnhugtiirhldcncsuhynrejvficieitkbhfotgbxgnuyypbbpmclmxmnujdecohzvghxenmiqnldebgypjleqqrhvnzkertpohjvhcxhjgggmamgyauappsohijbklnmomfvtylahsatyeiodhbunlbbgqwayvaomtxkpvxdyozhioaxilvxhnjkmvgnrrugibyodirihwmohmvmhytcqphbqbcbjuxfenmghuigxsxtefiogkhiuijfajsuaympcmtezmxfezfwaaelkwdtlynyoyhwptdqffjihimhurbfxuagggpjuyyzclxcuuymzjbsiiwnxagdhzgrbjgkhtxlkjvzskzkybksdmzqajmsxoaejgtegzgbzuktuecedpoztsvrqwjkbavfmvkoyasnnyfhfnexgifgbubiwfmijaskpmekaxdieiubnvfepflkpnmoqroxehhkhtvkjcuvstuufixrwmdptkmtjyhmgutwjfckdersujhfhxahpkloqgubkwvkhijboxnnztgjjtvbxq',59);
INSERT INTO t1 VALUES ('NUMTW','right',1108148224,'had',60);
INSERT INTO t1 VALUES ('t','q',NULL,'g',61);
INSERT INTO t1 VALUES ('amnnhugtii','e',NULL,'n',62);
INSERT INTO t1 VALUES ('UTPGW','nnhugtiirh',8,'your',63);
INSERT INTO t1 VALUES ('f','ALMKN',6,'s',64);
INSERT INTO t1 VALUES ('gtiirhldcn','OMYWP',NULL,'can',65);
INSERT INTO t1 VALUES ('iirhldcncs','irhldcncsu',-1262747648,'rhldcncsuhynrejvficieitkbhfotgbxgnuyypbbpmclmxmnujdecohzvghxenmiqnldebgypjleqqrhvnzkertpohjvhcxhjgggmamgyauappsohijbklnmomfvtylahsatyeiodhbunlbbgqwayvaomtxkpvxdyozhioaxilvxhnjkmvgnrrugibyodirihwmohmvmhytcqphbqbcbjuxfenmghuigxsxtefiogkhiuijfajsuaympcmtezmxfezfwaaelkwdtlynyoyhwptdqffjihimhurbfxuagggpjuyyzclxcuuymzjbsiiwnxagdhzgrbjgkhtxlkjvzskzkybksdmzqajmsxoaejgtegzgbzuktuecedpoztsvrqwjkbavfmvkoyasnnyfhfnexgifgbubiwfmijaskpmekaxdieiubnvfepflkpnmoqroxehhkhtvkjcuvstuufixrwmdptkmtjyhmgutwjfckders',66);
INSERT INTO t1 VALUES ('DSGUR','RTPKW',-1477967872,'ldcncsuhynrejvficieitkbhfotgbxgnuyypbbpmclmxmnujdecohzvghxenmiqnldebgypjleqqrhvnzkertpohjvhcxhjgggmamgyauappsohijbklnmomfvtylahsatyeiodhbunlbbgqwayvaomtxkpvxdyozhioaxilvxhnjkmvgnrrugibyodirihwmohmvmhytcqphbqbcbjuxfenmghuigxsxtefiogkhiuijfajsuaympcmtezmxfezfwaaelkwdtlynyoyhwptdqffjihimhurbfxuagggpjuyyzclxcuuymzjbsiiwnxagdhzgrbjgkhtxlkjvzskzkybksdmzqajmsxoaejgtegzgbzuktuecedpoztsvrqwjkbavfmvkoyasnnyfhfnexgifgbubiwfmijaskpmekaxdieiubnvfepflkpnmoqroxehhkhtvkjcuvstuufixrwmdptkmtjyhmgutwjfckdersujhfhxahpkloqgubkwvkhijboxnnztgjjtvbxqczomrnkfrkeicfynbpxkileklntghbckaqvjwqdegqbrcbhlbnasnqtauzhgivbxrnhtdcydodqphzihacfzxuzppaxpshqqghpztmmtbwqcebmqburuddenzepxhnfnlfmycgfdeilzyrnurvphljmhsjdejcjtonftcwojbqkksoimsiaxjiivsgogwswxzsxmpcjvtvhmkupgblnvgyhfrojviuuilaghuwflvgwwxlbaboktrgtlsbnmleemfxvcsdwulizbggywpjdlutquetytfbeohpumbbatkjrvxvvslgkvonzzrzteofjypextjfqqephtuywufiuuanklyghkrehibjitgbnhltciuszfiftxqdzjgulxdgfabupcsuexymxpvlxbutpls',67);
INSERT INTO t1 VALUES ('dcncsuhynr','OUXZT',NULL,'no',68);
INSERT INTO t1 VALUES ('could','if',NULL,'ncsuhynrejvficieitkbhfotgbxgnuyypbbpmclmxmnujdecohzvghxenmiqnldebgypjleqqrhvnzkertpohjvhcxhjgggmamgyauappsohijbklnmomfvtylahsatyeiodhbunlbbgqwayvaomtxkpvxdyozhioaxilvxhnjkmvgnrrugibyodirihwmohmvmhytcqphbqbcbjuxfenmghuigxsxtefiogkhiuijfajsuaympcmtezmxfezfwaaelkwdtlynyoyhwptdqffjihimhurbfxuagggpjuyyzclxcuuymzjbsiiwnxagdhzg',69);
INSERT INTO t1 VALUES ('u','k',2,'suhynrejvficieitkbhfotgbxgnuyypbbpmclmxmnujdecohzvghxenmiqnldebgypjleqqrhvnzkertpohjvhcxhjgggmamgyauappsohijbklnmomfvtylahsatyeiodhbunlbbgqwayvaomtxkpvxdyozhioaxilvxhnjkmvgnrrugibyodirihwmohmvmhytcqphbqbcbjuxfenmghuigxsxtefiogkhiuijfajsuaympcmtezmxfezfwaaelkwdtlynyoyhwptdqffjihimhurbfxuagggpjuyyzclxcuuymzjbsiiwnxagdhzgrbjgkhtxlkjvzskzkybksdmzqajmsxoaejgtegzgbzuktuecedpoztsvrqwjkbavfmvkoyasnnyfhfnexgifgbubiwfmijaskpmekaxdieiubnvfepflkpnmoqroxehhkhtvkjcuvstuufixrwmdptkmtjyhmgutwjfckdersujhfhxahpkloqgubkwvkhijboxnnztgjjtvbxqczomrnkfrkeicfynbpx',70);
INSERT INTO t1 VALUES ('all','are',-1586626560,'WGOKF',71);
INSERT INTO t1 VALUES ('for','UBHHV',-959578112,'NCUGL',72);
INSERT INTO t1 VALUES ('LJCIT','UVOAJ',NULL,'c',73);
INSERT INTO t1 VALUES ('just','FGLLB',NULL,'b',74);
INSERT INTO t1 VALUES ('not','they',1258029056,'BGJKE',75);
INSERT INTO t1 VALUES ('DJFLP','JTQYF',-982384640,'it',76);
INSERT INTO t1 VALUES ('were','OUKIQ',1,'FTSLX',77);
INSERT INTO t1 VALUES ('who','icieitkbhf',2,'some',78);
INSERT INTO t1 VALUES ('cieitkbhfo','ieitkbhfot',3,'q',79);
INSERT INTO t1 VALUES ('d','oh',NULL,'IXASL',80);
INSERT INTO t1 VALUES ('ZVPHZ','one',NULL,'your',81);
INSERT INTO t1 VALUES ('JLKVG','kbhfotgbxg',488308736,'bhfotgbxgnuyypbbpmclmxmnujdecohzvghxenmiqnldebgypjleqqrhvnzkertpohjvhcxhjgggmamgyauappsohijbklnmomfvtylahsatyeiodhbunlbbgqwayvaomtxkpvxdyozhioaxilvxhnjkmvgnrrugibyodirihwmohmvmhytcqphbqbcbjuxfenmghuigxsxtefiogkhiuijfajsuaympcmtezmxfezfwaaelkwdtlynyoyhwptdqffjihimhurbfxuagggpjuyyzclxcuuymzjbsiiwnxagdhzgrbjgkhtxlkjvzskzkybksdmzqajmsxoaejgtegzgbzuktuecedpoztsvrqwjkbavfmvkoyasnnyfhfnexgifgbubiwfmijaskpmekaxdiei',82);
INSERT INTO t1 VALUES ('LDPIN','what',1641086976,'UPYHB',83);
INSERT INTO t1 VALUES ('k','o',25952256,'gbxgnuyypbbpmclmxmnujdecohzvghxenmiqnldebgypjleqqrhvnzkertpohjvhcxhjgggmamgyauappsohijbklnmomfvtylahsatyeiodhbunlbbgqwayvaomtxkpvxdyozhioaxilvxhnjkmvgnrrugibyodirihwmohmvmhytcqphbqbcbjuxfenmghuigxsxtefiogkhiuijfajsuaympcmtezmxfezfwaaelkwdtlynyoyhwptdqffjihimhurbfxuagggpjuyyzclxcuuymzjbsiiwnxagdhzgrbjgkhtxlkjvzskzkybksdmzqajmsxoaejgtegzgbzuktuecedpoztsvrqwjkbavfmvkoyasnnyfhfnexgifgbu',84);
INSERT INTO t1 VALUES ('hey','TXSJD',361758720,'been',85);
INSERT INTO t1 VALUES ('xgnuyypbbp','x',4,'gnuyypbbpmclmxmnujdecohzvghxenmiqnldebgypjleqqrhvnzkertpohjvhcxhjgggmamgyauappsohijbklnmomfvtylahsatyeiodhbunlbbgqwayvaomtxkpvxdyozhioaxilvxhnjkmvgnrrugibyodirihwmohmvmhytcqphbqbcbjuxfenmghuigxsxtefiogkhiuijfajsuaympcmtezmxfezfwaaelkwdtlynyoyhwptdqffjihimhurbfxuagggpjuyyzclxcuuymzjbsiiwnxagdhzgrbjgkhtxlkjvzskzkybksdmzqajmsxoaejgtegzgbzuktuecedpoztsvrqwjkbavfmvkoyasnnyfhfnexgifgbubiwfmijaskpmekaxdieiubnvfepflkpnmoqroxehhkhtvkjcuvstuufixrwmdptkmtjyhmgutwjfckdersujhfhxahpkloqgubkwvkhijboxnnztgjjtvbxqczomrnkfrkeicfynbpxkileklntghbckaqvjwqdegqbrcbhlbnasnqtauzhgivbxrnhtdcydodqphzihacfzxuzppaxpshqqghpztmmtbwqcebmqburuddenzepxhnfnlfmycgfdeilzyrnurvphljmhsjdejcjtonftcwojbqkksoimsiaxjiivsgogwswxzsxmpcjvtvhmkupgblnvgyhfrojviuuilaghuwflvgwwxlbaboktrgtlsbnmleemfxvcsdwulizbggywpjdlutquetytfbeohpumbbatkjrvxvvslgkvonzzrzteofjypextjfqqephtuywufiuuanklyghkrehibjitgbnhltciuszfiftxqdzjgulxdgfabupcsuexymxpvlxbutplszcgzbpoomzheecewlmxcojkutqvjkbjwhoziafrmbfryznogbmiaqdnxgmwpm',86);
INSERT INTO t1 VALUES ('XSKDR','CVEQA',NULL,'w',87);
INSERT INTO t1 VALUES ('n','m',NULL,'had',88);
INSERT INTO t1 VALUES ('really','how',NULL,'v',89);
INSERT INTO t1 VALUES ('pbbpmclmxm','j',NULL,'c',90);
INSERT INTO t1 VALUES ('say','IUPWT',NULL,'HYYXB',91);
INSERT INTO t1 VALUES ('if','r',NULL,'PIPQP',92);
INSERT INTO t1 VALUES ('up','w',-1128988672,'some',93);
INSERT INTO t1 VALUES ('lmxmnujdec','xmnujdecoh',NULL,'did',94);
INSERT INTO t1 VALUES ('p','you\'re',9,'CUNBE',95);
INSERT INTO t1 VALUES ('ujdecohzvg','then',6,'cohzvghxenmiqnldebgypjleqqrhvnzkertpohjvhcxhjgggmamgyauappsohijbklnmomfvtylahsatyeiodhbunlbbgqwayvaomtxkpvxdyozhioaxilvxhnjkmvgnrrugibyodirihwmohmvmhytcqphbqbcbjuxfenmghuigxsxtefiogkhiuijfajsuaympcmtezmxfezfwaaelkwdtlynyoyhwptdqffjihimhurbfxuagggpjuyyzclxcuuymzjbsiiwnxagdhzgrbjgkhtxlkjvzskzkybksdmzqajmsxoaejgtegzgbzuktuecedpoztsvrqwjkbavfmvkoyasnnyfhfnexgifgbubiwfmijaskpmekaxdieiubnvfepflkpnmoqroxehhkhtvkjcuvstuufixrwmdptkmtjyhmgutwjfckdersujhfhxahpkloqgubkwvkhijboxnnztgjjtvbxqczomrnkfrkeicfynbpxkileklntghbckaqvjwqdegqbrcbhlbnasnqtauzhgivbxrnhtdcydodqphzihacfzxuzppaxpshqqghpztmmtbwqcebmqburuddenzepxhnfnlfmycgfdeilzyrnurvphljmhsjdejcjtonftcwojbqkksoimsiaxjiivsgogwswxzsxmpcjvtvhmkupgblnvgyhfrojviuuilaghuwf',96);
INSERT INTO t1 VALUES ('v','o',-46530560,'zvghxenmiqnldebgypjleqqrhvnzkertpohjvhcxhjgggmamgyauappsohijbklnmomfvtylahsatyeiodhbunlbbgqwayvaomtxkpvxdyozhioaxilvxhnjkmvgnrrugibyodirihwmohmvmhytcqphbqbcbjuxfenmghuigxsxtefiogkhiuijfajsuaympcmtezmxfezfwaaelkwdtlynyoyhwptdqffjihimhurbfxuagggpjuyyzclxcuuymzjbsiiwnxagdhzgrbjgkhtxlkjvzskzkybksdmzqajmsxo',97);
INSERT INTO t1 VALUES ('d','mean',NULL,'one',98);
INSERT INTO t1 VALUES ('VYJFE','LQAHF',NULL,'with',99);
INSERT INTO t1 VALUES ('h','CSIEW',4,'z',100);
SET sql_mode = 'NO_ENGINE_SUBSTITUTION';
CREATE TABLE E (
col_datetime datetime,
col_varchar_1024_utf8 varchar(1024)  CHARACTER SET utf8mb3,
col_varchar_1024_latin1_key varchar(1024)  CHARACTER SET latin1,
col_varchar_1024_utf8_key varchar(1024)  CHARACTER SET utf8mb3,
col_varchar_10_latin1 varchar(10)  CHARACTER SET latin1,
pk integer auto_increment,
col_varchar_10_latin1_key varchar(10)  CHARACTER SET latin1,
col_date_key date,
col_int_key int,
col_varchar_10_utf8_key varchar(10)  CHARACTER SET utf8mb3,
col_varchar_10_utf8 varchar(10)  CHARACTER SET utf8mb3,
col_int int,
col_datetime_key datetime,
col_date date,
col_varchar_1024_latin1 varchar(1024)  CHARACTER SET latin1,
/*Indices*/
key (col_varchar_1024_latin1_key ),
key (col_varchar_1024_utf8_key ),
primary key (pk),
key (col_varchar_10_latin1_key ),
key (col_date_key ),
key (col_int_key ),
key (col_varchar_10_utf8_key ),
key (col_datetime_key )) ENGINE=myisam;

CREATE OR REPLACE VIEW view_e AS SELECT * FROM E;

INSERT /*! IGNORE */ INTO E VALUES  ('01:41:57.028251', 'AZTSD', 'CTOWO', 'vwudihwrhagghnfsjivypqlxfopjvkegvqzbulawucdduxvslfzfaysgqvolxnfzpoaqmvzwtlfjttprznxyzxgugyqauhibniamhtmnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbj', 'she', NULL, 'wudihwrhagghnfsjivypqlxfopjvkegvqzbulawucdduxvslfzfaysgqvolxnfzpoaqmvzwtlfjttprznxyzxgugyqauhibniamhtmnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoq', '2002', 4, 'a', 'udihwrhagghnfsjivypqlxfopjvkegvqzbulawucdduxvslfzfaysgqvolxnfzpoaqmvzwtlfjttprznxyzxgugyqauhibniamhtmnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobdsjhdymqwmjsznpygumzsalkmlojinuxoakfrkmsctseenuwdtroyrqoocpmpgsouthzzugewroaxcipvpdxmdpgpjdcpypqcdeawvhyzrahmbdjungbhpvtozzstmbweqmzshvpcbyawbtyiwfamoecfbfkfzuhuvrdxxe', 1248788480, '2000-09-14 16:05:58.011397', '20060324201916.058151', 'dihwrhagghnfsjivypqlxfopjvkegvqzbulawucdduxvslfzfaysgqvolxnfzpoaqmvzwtlfjttprznxyzxgugyqauhibniamhtmnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjx') ,  ('2008', 'like', 'i', 'j', 'YGSUR', NULL, 'ihwrhagghnfsjivypqlxfopjvkegvqzbulawucdduxvslfzfaysgqvolxnfzpoaqmvzwtlfjttprznxyzxgugyqauhibniamhtmnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobdsjhdymqwmjsznpygumzsalkmlojinuxoakf', '2007-02-09', 665124864, 'e', 'how', 9, NULL, '2002-01-01 11:24:35.034815', 'hwrhagghnfsjivypqlxfopjvkegvqzbulawucdduxvslfzfaysgqvolxnfzpoaqmvzwtlfjttprznxyzxgugyqauhibniamhtmnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobdsjhdymqwmjsznpygumzsalkmlojin') ,  ('2008', 'd', 'the', 'wrhagghnfsjivypqlxfopjvkegvqzbulawucdduxvslfzfaysgqvolxnfzpoaqmvzwtlfjttprznxyzxgugyqauhibniamhtmnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobdsjhdymqwmjsznpygumzsalkmlojinuxoakfrkmsctseenuwdtroyrqoocpmpgsouth', 'g', NULL, 'rhagghnfsjivypqlxfopjvkegvqzbulawucdduxvslfzfaysgqvolxnfzpoaqmvzwt', '10:06:36.028525', 1327169536, 'a', 'ZMLOK', 1, '02:03:19.003912', '2008-05-28 03:41:19.063907', 'hagghnfsjivypqlxfopjvkegvqzbulawucdduxvslfzfaysgqvolxnfzpoaqmvzwtlfjttprznxyzxgugyqauhibniamhtmnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobdsjhdymqwmjsznpygumzsalkmlojinuxoakfrkmsctseenuwdtroyrqoocpmpgsouthzzugewroaxcipvpdxmdpgpjdcpypqcdeawvhyzrahm') ,  ('2007-08-04', 'FHVLF', 'see', 'q', 'can', NULL, 'me', '2003-05-23', 557776896, 'FTXMB', 'agghnfsjivypqlxfopj', NULL, NULL, '20:23:24.057760', 'PPNGL') ,  (NULL, 'gghnfsjivypqlxfopjvkegvqzbulawucdduxvslfzfaysgqvolxnfzpoaqmvzwtlfjttprznxyzxgugyqauhibniamhtmnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqv', 'd', 'ghnfsjivypqlxfopjvkegvqzbulawucdduxvslfzfaysgqvolxnfzpoaqmvzwtlfjttprznxyzxgugyqauhibniamhtmnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdw', 'l', NULL, 'say', '2009-12-07', NULL, 'CZZLN', 'c', 1871904768, '2003-03-25', '2006-08-08 12:45:22.031446', 'a') ,  (NULL, 'I', 'hnfsjivypqlxfopjvkegvqzbulawucdduxvslfzfaysgqvolxnfzpoaqmvzwtlfjttprznxyzxgugyqauhi', 'r', 'w', NULL, 'say', '2008', NULL, 'nfsjivypqlxfopjvkegvqzbulawucdduxvslfzfaysgqvolxnfzpoaqmvzwtlfjttprznxyzxgugyqauhibniamhtmnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobdsjhdymqwmjsznpygumzsalkmlojinuxoakfrkmsctseenuwdtroyrqoocpmpgsouthzzugewroaxcipvpdxmdpgpjdcpypqcdeawvhyzrahmbdjungbhpvtozzstmbweqmzshvpcbyawbtyiwfamoecfbfkfzuhuvrdxxewbmmwvpxrhtni', 'BXODI', 59375616, '15:21:03.064839', NULL, 'v') ,  ('2009-05-01', 'MQSDX', 'look', 'so', 'is', NULL, 'something', '2001-05-27', -145293312, 'on', 'fsjivypqlxfopjvkegvqzbulawucdduxvslfzfaysgqvolxnfzpoaqmvzwtlfjttprznxyzxgugyqauhibniamhtmnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobdsjhdymqwmjsznpygumzsalkmlojinuxoakfrkmsctseenuwdtroyrqoocpmpgsouthzzugewroaxcipvpdxmdpgpjdcpypq', NULL, '2005-05-08', '2008-05-02', 'k') ,  (NULL, 'do', 'the', 'p', 'e', NULL, 'z', '2004-11-27', NULL, 'MUTTT', 'ILFHK', 8, '2008-10-27', '2006-12-05', 'want') ,  ('00:39:54.026500', 'c', 'sjivypqlxfopjvkegvqzbulawucdduxvslfzfaysgqvolxnfzpoaqmvzwtlfjttprznxyzxgugyqauhibniamhtmnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkce', 'u', 'jivypqlxfopjvkegvqzbulawucdduxvslfzfaysgqvolxnfzpoaqmvzwtlfjttprznxyzxgugyqauhibnia', NULL, 'o', '20:10:45.007165', NULL, 'YWLDS', 'ivypqlxfopjvkegvqzbulawucdduxvslfzfaysgqvolxnfzpoaqmvzwtlfjttprznxyzxgugyqauhibniamhtmnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtn', 1188823040, '08:14:32.025363', NULL, 'the') ,  ('2008-03-13 04:28:25.065216', 'NCIIY', 'vypqlxfopjvkegvqzbulawucdduxvslfzfaysgqvolxnfzpoaqmvzwtlfjttprznxyzxgugyqauhibniamhtmnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhso', 'n', 'come', NULL, 'back', NULL, 476905472, 'all', 'that', 8, '17:35:35.043707', '20031126235244.059587', 'NSOJS');

CREATE TABLE H (
col_varchar_1024_utf8 varchar(1024)  CHARACTER SET utf8mb3,
col_date date,
col_int int,
col_varchar_10_utf8_key varchar(10)  CHARACTER SET utf8mb3,
col_datetime datetime,
col_datetime_key datetime,
col_varchar_1024_latin1_key varchar(1024)  CHARACTER SET latin1,
col_varchar_1024_latin1 varchar(1024)  CHARACTER SET latin1,
col_date_key date,
col_varchar_1024_utf8_key varchar(1024)  CHARACTER SET utf8mb3,
col_varchar_10_utf8 varchar(10)  CHARACTER SET utf8mb3,
col_varchar_10_latin1 varchar(10)  CHARACTER SET latin1,
col_int_key int,
col_varchar_10_latin1_key varchar(10)  CHARACTER SET latin1,
pk integer auto_increment,
/*Indices*/
key (col_varchar_10_utf8_key ),
key (col_datetime_key ),
key (col_varchar_1024_latin1_key ),
key (col_date_key ),
key (col_varchar_1024_utf8_key ),
key (col_int_key ),
key (col_varchar_10_latin1_key ),
primary key (pk)) ENGINE=innodb ROW_FORMAT=DYNAMIC;
SET sql_mode = default;
CREATE OR REPLACE VIEW view_h AS SELECT * FROM H;

INSERT /*! IGNORE */ INTO H VALUES  ('PWKPA', '2003', -2071461888, 'ZMAPA', NULL, '2007-06-01', 'j', 'qauhibniamhtmnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobdsjhdymqwmjsznpygumzsalkmlojinuxoakfrkmsctseenuwdtroyrqoocpmpgsouthzzugewroaxcipvpdxmdpgpjdcpypqcdeawvhyzrahmbdjungbhpvtozzstmbweqmzshvpcbyawbtyiwfamoecfbfkfzuhuvrdxxewbmmwvpxrhtnigmoxbabdhfpkdifnjmfshrssbwxsdrtmugchxgaehhsf', '2003', 'v', 'can\'t', 'auhibniamhtmnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqv', 9, 'for', NULL) ,  ('IYAMG', '2002-06-24', 3, 'HVCLY', '20051101101903.027848', '2007-11-13', 'i', 'uhibniamhtmnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobdsjhdymqwmjsznpygumzsalkmlojinuxoakfrkmsctseenuwdtroyrqoocpmpgsouthzzugewroaxcipvpdxmdpgpjdcpypqcdeawvhyzrahmbdjungbhpvtozzstmbweqmzshvpcbyawbtyiwfamoecfbfkfzuhuvrdxxewbmmwvpxrhtnigmoxbabdhfpkdifnjmfshrssbwxsdrtmugchxgaehhsfrhfjfqkmsvgowahrffhlsfqrskwmxgptnmvqpufippfjswvzbtnvzocndndyymyjuhfntqersfsyqfdqdlnnaytyyybseabbrrfgjltjkhakdezpelkaqycfznlnhkddyuxbdybmbilkqrpmamnnhugtiirhldcncsuh', '2006', 'JNNLF', 'hibniamhtmnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobdsjhdymqwmjsznpygumzsalkmlojinuxoakfrkmsctseenuwdtroyrqoocpmpgsouthzzugewroaxcipvpdxmdpgpjdcpypqcdeawvhyzrahmbdjungbhpvtozzstmbweqmzshvpcbyawbtyiwfamoecfbfkfzuhuvrdxxewbmmwvpxrhtnigmoxbabdhfpkdifnjmfshrssbwxsdrtmugchxgaehhsfrhfjfqkmsvgowahrffhlsfqrskwmxgptnmvqpufippfjswvzbtnvzocndndyymyjuhfntqersfsyqfdqdlnnaytyyybseab', 'ibniamhtmnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobdsjhdymqwmjsznpygumzsalkmlojinuxoakfrkmsctseenuwdtroyrqoocpmpgsouthzzugewroaxcipvpdxmdpgpjdcpypqcdeawvhyzrahmbdjun', NULL, 'right', NULL) ,  ('PIKTS', '20040703134305.015635', -1793392640, 'o', '10:13:42.038677', '08:06:05.040877', 'IVHVM', 'bniamhtmnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunp', '20050426124618.033428', 'BQLRU', 'niamhtmnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobdsjhdymqwmjsznpygumzsalkmlojinuxoakfrkmsctseenuwdtroyrqoocpmpgsouthzzugewroaxcipvpdxmdpgpjdcpypqcdeawvhyzrahmbdjungbhpvtozzstmbweqmzshvpcbyawbtyiwfamoecfbfkfzuhuvrdxxewbmmwvpxrhtnigmoxbabdhfpkdifnjmfshrssbwxsdrtmugchxgaehhsfrhfjfqkmsvgowahrffhlsfqr', 'mean', 488243200, 'I\'m', NULL) ,  ('iamhtmnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhay', NULL, NULL, 'u', '10:38:19.045782', '2002', 'j', 'WCTUZ', '20080912005520.009494', 'amhtmnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmn', 'all', 'mhtmnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobdsjhdymqwmjsznpygumzsalkmlojinuxoakfrkmsctseenuwdtroy', -695730176, 'that', NULL) ,  ('htmnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfw', '15:58:38.020659', 5, 'just', NULL, NULL, 'got', 'tmnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobdsjhdymqwmjsznpygumzsalkmlojinuxoakfrkmsctseenuwdtroyrqoocpmpgsouthzzugewroaxcip', '11:09:00.032967', 'mnfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiez', 'n', 'UIEZD', -793837568, 'JQCCK', NULL) ,  ('c', NULL, 2, 'OOCDS', '2004-10-14 09:59:29.025521', NULL, 'nfxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfk', 'this', '2000-04-01', 'it', 'this', 'or', 1732050944, 'ZBICQ', NULL) ,  ('know', '04:37:06.005578', 8, 'b', '2005-07-06 04:13:32.018141', '00:54:10.040062', 'i', 'fxfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavo', NULL, 'r', 'KARHF', 'p', 319291392, 'xfmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfz', NULL) ,  ('IVUJL', '2000-11-25 23:28:42.038112', 898301952, 'fmxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobdsjhdymqwmjsznpygumzsalkml', NULL, '2002', 'NJUNY', 'VJCPX', '2008', 'o', 'PCIRX', 'w', -1041825792, 'v', NULL) ,  ('are', '2003-12-09 01:30:03.025234', -1310785536, 'b', '2005-04-05 07:49:11.008399', '20090315000439.040497', 'UKBQS', 'z', '2002-03-22 12:26:57.006275', 'look', 'come', 'for', 2490368, 'ULYXS', NULL) ,  ('i', NULL, -730923008, 'ZFKUP', '20040807230832.006451', '20051210104822.018844', 'mxslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxe', 'f', '2000-12-19', 'xslmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacg', 'y', 'EUETM', 3, 'HNFFZ', NULL) ,  ('ESQVC', '2005-08-10 20:19:43.000027', 5, 'NGYTB', NULL, NULL, 'd', 'd', '13:27:32.062794', 'slmxvfonsluayrofwafllupikoapp', 't', 'lmxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobdsjhdymqwmjsznpygumzsalkmlojinuxoakfrkmsctseenuwdtroyrqoocpmpgsouthzzugewroaxcipvpdxmdpgpjdcpypqcdeawvhyzrahmbdjungbhpvtozzstmbweqmzshvpcbyawbtyiwfamoecfbfkfzuhuvrdxxewbmmwvpxrhtnigmoxbabdhfpkdifnjmfshrssbwxsdrtmugchxgaehhsfrhfjfqkmsvgowahrffhl', 795148288, 'XMOZQ', NULL) ,  ('really', '2001-05-22', 8, 'mxvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvq', '20080504174501.046646', '2003-07-26 16:59:01.062296', 'n', 'how', '20070508055627.026593', 'RRFNA', 'in', 'xvfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjp', 132251648, 'get', NULL) ,  ('v', '19:53:48.009433', NULL, 'vfonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsus', '2008-08-08', '2001', 'JQUQZ', 'fonsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpg', '2006-05-05', 'x', 'for', 'WJXOZ', 131596288, 'want', NULL) ,  ('mean', NULL, 564068352, 'onsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobdsjhdymqwmjsznpygumzsalkmlojinuxoakfrkmsctseenuwdtroyrqoocpmpgsouthzzugewroaxcipvpdxmdpgpjdcpypqcdeawvhyzrahmbdjungbhpvtozzstmbweqmzshvpcbyawbtyiwfamoecfbfkfzuhuvrdxxewbmmwvpxrhtnigmoxbabdhfpkdifnjmfshrssbwxsdrtmugchxgaehhsfrhfjfqkmsvgowahrffhlsfqrskwmxgptnmvqpufippfjswvzb', '2007-09-04 06:46:51.041078', '11:50:05.047592', 'LITLN', 'd', '01:29:28.040385', 'UMOLK', 'l', 'they', 1351614464, 'TJEWO', NULL) ,  ('nsluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobdsjhdymqwmjsznpygumzsalkmlojinuxoakfrkmsctseenuwdtroyrqoocpmpgsouthzzugewroaxcipvpdxmdpgpjdcpypqcdeawvhyzrahmbdjungbhpvtozzstmbweqmzshvpcbyawbtyiwfamoecfbfkfzuhuvrdxxewbmmwvpxrhtnigmoxbabdhfpkdifnjmfshrssbwxsdrtmugchxgaehhsfrhfjfqkmsvgowahrffhlsfqrskwmxgptnmvqpufippfjswvzbtnvzocndndyymyjuhfntqersfsyqfdqdlnnaytyyybseabbrrfgjltjkhakdezpe', NULL, 3, 'did', '01:26:29.025020', '09:49:47.038765', 'VNUAV', 'sluayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobds', '2001-04-14', 'CIOAI', 'him', 'luayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxb', 7, 'get', NULL) ,  ('him', '20051204062403.046858', 7, 'his', '2003-10-28', '20030112051727.032070', 'MNJBY', 'uayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdq', NULL, 'o', 'WUELI', 'ayrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuy', 3, 'yrofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlis', NULL) ,  ('MNAVL', '2008-03-06 19:35:21.003444', 6, 'rofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobdsjhdymqwmjsznpygumzsalkmlojinuxoakfrkmsctseenuwdtr', '20000826213619.059974', '2008-01-09', 'ofwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobdsjhdymqwmjsznpygumzsalkmlojinuxoakfrkmsctseenuwdtroyrqoocpmpgsouthzzugewroaxcipvpdxmdpgp', 'they', '2001-01-13 13:17:36.051819', 'j', 'fwafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobdsjhdymqwmjsznpygumzsalkmlojinuxoakfrkmsctseenuwdtroyrqoocpmpgsouthzzugewroax', 't', -1574109184, 'MYHDH', NULL) ,  ('NLQQN', '2007', 1663107072, 'RLVYW', '20060608121825.039733', '2009-12-14', 'have', 'wafllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobdsjhdymqwmjsznpygumzsalkmlojinuxoakfrkmsctseenuwdtroyrqoocpmpgsouthzzugewroaxcipvpdxmdpgpjdcpypqcdeawvhyzrahmbdjungbhpvtozzstmbweqmzshvpcbyawbtyiwfamoecfbfkfzuhuvrdxxewbmmwvpxrhtnigmoxb', '2006-11-01', 'afllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobdsjhdymqwmjsznpygumzsalkmlojinuxoakfrkmsctseenuwdtroyrqoocpmpgsouthz', 'IZLCS', 'fllupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobdsjhdymqwmjsznpygumzsalkmlojinuxoakfrkmsctseenuwdtroyrqoocpmpgsouthzzugewroaxcipvpdxmdpgpjdcpypqcdeawvhyzrahmbdjungbhpvtozzstmbweqmzshvpcbyawbtyiwfamoecfbfkfzuh', NULL, 'llupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgp', NULL) ,  ('all', '2004-10-20 06:15:14.000148', 1531052032, 'lupikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojx', '2008-07-04', '20051221140927.040451', 'HQHLZ', 'upikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobdsjhdymqwmjsznpygumzsalkmlojinuxoakfrkmsctseenuwdtroyrqoocpmpgsouthzzugewroaxcipvpdxmdpgpjdcpypqcdeawvhyzrahmbdjungbhpvtozzstmbweqmzshvpcbyawbtyiwfamoecfbfkfzuhuvrdxxewbmmwvpxrhtnigmoxbabdhfpkdifnjmfshrssbwxsdrtmugchxgaehhsfrhfjfqkmsvgowahrffhlsfqrskwmxgptnmvqpufippfjswvzbtnvzocndndyymyjuhfntqersfsyqfdqdlnnaytyyybseabbrrfgjltjkhakdezpelkaqycfznlnhkddyuxbdybmbilkqrpmamnnhugtiirhldcncsuhynrejvficieitkbhfotgbxgnuyypbbpmclmxmnujdecohzvghxenmiq', '23:21:16.032958', 'x', 'who', 'DUCAC', -1769340928, 'RCCAO', NULL) ,  ('LLRCI', '2001', 1, 'JAFVM', '20081001131456.014526', '2005-08-01 02:35:59.003461', 'XDKFW', 'pikoappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobdsjhdymqwmjsznpygumzsalkmlojinuxoakfrkmsctseenuwdtroyrqoocpmpgsouthzzugewroaxcipvpdxmdpgpjdcpypqcdeawvhyzrahmbdjungbhpvtozzstmbweqmzshvpcbyawbtyiwfamoecfbfkfzuhuvrdxxewbmmwvpxrhtnigmoxbabdhfpkdifnjmfshrssbwxsdrtmugchxgaehhsfrhfjfqkmsvgowahrffhlsfqrskwmxgptnmvqpufippfjswvzbtnvzocndndyymyjuhfntqersfsyqfdqdlnnaytyyybseabbrrfgjltjkhakdezpelkaqycfznlnh', '20000112134749.024329', 'ikoappgllpkbyrdtndwiuyqhqwojelnqhxb', 'JWYNU', 'koappgllpkbyrdtndwiuyqhqwojelnqhxbjofuiriycjpvagsuslqucvesvyryyjweexpijmgvjtgoezsrmunpdoqtzxndnpykhcpjcdwggiezgodearmshmwmkkrfjzusjavotnutitpavotqbpzwwjvxeortxgyqkcgmdtlmnbfcheiknzwgpepqxrzxljangusrqbmtlgtaluztuozrnvqqjeqqrblaolnyqgeovcddebcxpdmfddubuyyfjxbxdgrqejaewcldqyxhwkyragqvpahruvgmjupbfzyhfqzdoyoqjsfaucwloqdfwcjrimtetszkzwjcfuhgwctcrhucgtzdnzgpuqriybmwzfkhmedgfnomhbvpfodqdjdxqzsjkzrlraecuxepzamhxwnbczfxwjqdvacgoobmscvejweiytakwruoodqedvzipbhxncdqhayqmlisykbwqdezkrmggxhdilrmxnghjuxecpgroesfpetnuyxqumqhxhwdwfxsclqithgcojxmunpdyvdlvygsaetufkcexebfwmhsobdsjhdymqwmjsznpygumzsalkmlojinuxoakfrkmsctseenuwdtroyrqoocpmpgsouthzzugewroaxcipvpdxmdpgpjdcpypqcdeawvhyzrahmbdjungbhpvtozzstmbweqmzshvpcbyawbtyiwfamoecfbfkfzuhuvrdxxewbmmwvpxrhtnigmoxbabdhfpkdifnjmfshrssbwxsdrtmugchxgaehhsfrhfjfqkmsvgowahrffhlsfqrskwmxgptnmvqpufippfjswvzbtnvzocndndyymyjuhfntqersfsyqfdqdlnnaytyyybseabbrrfgjltjkhakdezpelkaqycfznlnhkddyux', -337510400, 'will', NULL);
SELECT table3.col_varchar_10_latin1_key,
table1.col_varchar_1024_latin1_key,
table1.col_varchar_1024_latin1_key 
FROM view_e AS table1 
LEFT JOIN view_h AS table2 
LEFT JOIN t1 AS table3 ON table2.col_int_key = table3.pk ON table1.col_varchar_1024_latin1_key = table3.col_varchar_10_utf8_key );

SELECT found_rows();

DROP VIEW view_e,view_h;
DROP TABLE t1,E,H;
SET sql_mode = 'NO_ENGINE_SUBSTITUTION';
CREATE TABLE t(a BLOB, b INT);
INSERT INTO t VALUES('1',3);
INSERT INTO t VALUES('1',2);
SELECT DISTINCT t.a FROM t t, t t1 ORDER BY SQRT(t.b);
DROP TABLE t;
SET sql_mode = default;
CREATE TABLE C (
                pk INTEGER AUTO_INCREMENT,
                col_int_nokey INTEGER NOT NULL,
                col_int_key INTEGER NOT NULL,

                col_date_key DATE NOT NULL,
                col_date_nokey DATE NOT NULL,

                col_time_key TIME NOT NULL,
                col_time_nokey TIME NOT NULL,

                col_datetime_key DATETIME NOT NULL,
                col_datetime_nokey DATETIME NOT NULL,

                col_varchar_key VARCHAR(1) NOT NULL,
                col_varchar_nokey VARCHAR(1) NOT NULL,

                PRIMARY KEY (pk),
                KEY (col_int_key),
                KEY (col_date_key),
                KEY (col_time_key),
                KEY (col_datetime_key),
                KEY (col_varchar_key, col_int_key)
  );

INSERT /*! IGNORE */ INTO C (
                             col_int_key, col_int_nokey,
                             col_date_key, col_date_nokey,
                             col_time_key, col_time_nokey,
                             col_datetime_key, col_datetime_nokey,
                             col_varchar_key, col_varchar_nokey
                            )
VALUES (1, 3, '2009-12-01', '2009-12-01',
        '00:21:38.058143', '00:21:38.058143', '2007-05-28 00:00:00', '2007-05-28
        00:00:00', 'c', 'c'),
       (8, 5, '2004-12-17', '2004-12-17', '04:08:02.046897',
       '04:08:02.046897', '2009-07-25 09:21:20.064099', '2009-07-25
       09:21:20.064099', 'm', 'm'),
       (9, 3, '2000-03-14', '2000-03-14',
       '16:25:11.040240', '16:25:11.040240', '2002-01-16 00:00:00', '2002-01-16
       00:00:00', 'd', 'd'),
      (24, 246, '2000-10-08', '2000-10-08', '10:14:58.018534',
      '10:14:58.018534', '2006-10-12 04:32:53.031976', '2006-10-12
      04:32:53.031976', 'd', 'd'),
      (6, 2, '2006-05-25', '2006-05-25',
      '19:47:59.011283', '19:47:59.011283', '2001-02-15 03:08:38.035426',
      '2001-02-15 03:08:38.035426', 'y', 'y'),
     (1, 9, '2008-01-23', '2008-01-23',
     '11:14:24.032949', '11:14:24.032949', '2004-10-02 20:31:15.022553',
     '2004-10-02 20:31:15.022553', 't', 't'),
     (6, 3, '2007-06-18', '2007-06-18',
     NULL, NULL, '2002-08-20 22:48:00.035785', '2002-08-20 22:48:00.035785', 'd',
     'd');
SELECT DISTINCT
table2 . `col_time_key` AS field1 ,
table1 . `col_datetime_key` AS field2 ,
table1 . `col_datetime_key` AS field3
FROM ( C AS table1 STRAIGHT_JOIN ( ( C AS table2 INNER JOIN C AS table3 ON ((
table3 . `pk` != table2 . `col_int_nokey` )
AND ( table3 . `pk` = table2 . `col_int_key` ) ) ) ) ON (( table3 .`pk` >=
table2 . `col_int_key` )
AND (table3 .`pk` <> table2 . `pk` ) ) )
ORDER BY table1 . `col_datetime_key`  , field1, field2, field3;

DROP TABLE C;
CREATE TABLE C (
                pk int NOT NULL AUTO_INCREMENT,
                col_int_nokey int DEFAULT NULL,
                col_int_key int DEFAULT NULL,
                col_date_key date DEFAULT NULL,
                col_date_nokey date DEFAULT NULL,
                col_time_key time DEFAULT NULL,
                col_time_nokey time DEFAULT NULL,
                col_datetime_key datetime DEFAULT NULL,
                col_datetime_nokey datetime DEFAULT NULL,
                col_varchar_key varchar(1) DEFAULT NULL,
                col_varchar_nokey varchar(1) DEFAULT NULL,
                PRIMARY KEY (pk),
                KEY col_int_key (col_int_key),
                KEY col_date_key (col_date_key),
                KEY col_time_key (col_time_key),
                KEY col_datetime_key (col_datetime_key),
                KEY col_varchar_key (col_varchar_key,col_int_key)
               ) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

INSERT INTO C VALUES
(1,NULL,7,'2004-04-09','2004-04-09','14:03:03','14:03:03','2001-11-28 00:50:27','2001-11-28 00:50:27','c','c');
SELECT DISTINCT
alias1 . col_datetime_key AS field1 ,
alias1 . col_time_key AS field2 ,
alias1 . col_int_nokey AS field3 ,
alias1 . col_date_key AS field4 ,
alias2 . col_int_key AS field5 ,
alias2 . col_time_key AS field6 ,
alias2 . col_varchar_key AS field7 ,
alias1 . col_time_key AS field8 ,
alias1 . col_varchar_nokey AS field9 ,
alias1 . col_date_key AS field10 ,
alias1 . col_varchar_key AS field11 ,
alias1 . col_datetime_key AS field12 ,
alias1 . col_date_key AS field13 ,
alias1 . col_date_key AS field14 ,
alias1 . col_time_key AS field15 ,
alias2 . col_date_key AS field16 ,
alias2 . col_int_key AS field17 ,
alias1 . col_datetime_key AS field18 ,
alias2 . col_int_key AS field19 ,
alias1 . col_varchar_key AS field20 ,
alias1 . col_varchar_key AS field21 ,
alias1 . col_int_key AS field22 ,
alias1 . col_time_key AS field23 ,
alias1 . col_time_key AS field24 ,
alias1 . col_datetime_key AS field25 ,
alias1 . col_int_nokey AS field26 ,
alias1 . col_int_key AS field27 ,
alias1 . col_varchar_key AS field28 ,
alias2 . col_time_key AS field29 ,
alias1 . col_varchar_key AS field30 ,
alias1 . col_int_key AS field31 ,
alias1 . col_int_nokey AS field32
FROM ( C AS alias1, C AS alias2);
DROP TABLE C;
CREATE TABLE C (
                col_int_key int DEFAULT NULL,
                pk int NOT NULL AUTO_INCREMENT,
                col_varchar_16_latin1_key varchar(16) DEFAULT NULL,
                col_int int DEFAULT NULL,
                col_varchar_10_utf8_key varchar(10) CHARACTER SET utf8mb3 DEFAULT NULL,
                col_varchar_10_latin1_key varchar(10) DEFAULT NULL,
                col_varchar_10_latin1 varchar(10) DEFAULT NULL,
                col_varchar_16_latin1 varchar(16) DEFAULT NULL,
                col_varchar_16_utf8_key varchar(16) CHARACTER SET utf8mb3 DEFAULT NULL,
                col_varchar_16_utf8 varchar(16) CHARACTER SET utf8mb3 DEFAULT NULL,
                col_varchar_10_utf8 varchar(10) CHARACTER SET utf8mb3 DEFAULT NULL,
                PRIMARY KEY (pk),
                KEY col_int_key (col_int_key),
                KEY col_varchar_16_latin1_key (col_varchar_16_latin1_key),
                KEY col_varchar_10_utf8_key (col_varchar_10_utf8_key),
                KEY col_varchar_10_latin1_key (col_varchar_10_latin1_key),
                KEY col_varchar_16_utf8_key (col_varchar_16_utf8_key)
               ) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO C VALUES
(8,1,'o',6,'qlbynryfw','from','w','lby','bynry','ynryfwcfedjhz','I'),
(6,2,'nry',127008768,'q','ryfw','p','h','b','have','i'),
(7,3,'he\'s',9,'his','yfwcfedjhz','go','q','m','me','r'),
(4,4,'fwc',0,'w','t','wcfedjh','w','c','o','f');

CREATE TABLE D (
                pk int NOT NULL AUTO_INCREMENT,
                col_varchar_16_utf8 varchar(16) CHARACTER SET utf8mb3 DEFAULT NULL,
                col_varchar_10_utf8 varchar(10) CHARACTER SET utf8mb3 DEFAULT NULL,
                col_varchar_10_latin1_key varchar(10) DEFAULT NULL,
                col_varchar_10_latin1 varchar(10) DEFAULT NULL,
                col_varchar_16_utf8_key varchar(16) CHARACTER SET utf8mb3 DEFAULT NULL,
                col_int_key int DEFAULT NULL,
                col_varchar_16_latin1 varchar(16) DEFAULT NULL,
                col_varchar_16_latin1_key varchar(16) DEFAULT NULL,
                col_varchar_10_utf8_key varchar(10) CHARACTER SET utf8mb3 DEFAULT NULL,
                col_int int DEFAULT NULL,
                PRIMARY KEY (pk),
                KEY col_varchar_10_latin1_key (col_varchar_10_latin1_key),
                KEY col_varchar_16_utf8_key (col_varchar_16_utf8_key),
                KEY col_int_key (col_int_key),
                KEY col_varchar_16_latin1_key (col_varchar_16_latin1_key),
                KEY col_varchar_10_utf8_key (col_varchar_10_utf8_key)
               ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO D VALUES
(1,'l','it\'s','o','you\'re','f',0,'they','with','this',1);

SELECT
COUNT(DISTINCT alias2.`col_int_key`)
  FROM C AS alias1 , D AS alias2
  WHERE alias1.`col_int_key` = 47;

DROP TABLE C,D;
CREATE TABLE B (
                pk int NOT NULL AUTO_INCREMENT,
                col_int_nokey int NOT NULL,
                col_int_key int NOT NULL,
                col_date_key date NOT NULL,
                col_date_nokey date NOT NULL,
                col_time_key time NOT NULL,
                col_time_nokey time NOT NULL,
                col_datetime_key datetime NOT NULL,
                col_datetime_nokey datetime NOT NULL,
                col_varchar_key varchar(1) NOT NULL,
                col_varchar_nokey varchar(1) NOT NULL,
                PRIMARY KEY (pk),
                KEY col_int_key (col_int_key),
                KEY col_date_key (col_date_key),
                KEY col_time_key (col_time_key),
                KEY col_datetime_key (col_datetime_key),
                KEY col_varchar_key (col_varchar_key,col_int_key)
               );

INSERT IGNORE INTO B VALUES
(1,4,0,'0000-00-00','0000-00-00','21:22:34','21:22:34','2002-02-13
 17:30:06','2002-02-13 17:30:06','j','j'),
 (2,6,8,'2004-09-18','2004-09-18','10:50:38','10:50:38','200
 8-09-27 00:34:58','2008-09-27 00:34:58','v','v');

CREATE TABLE C (
                pk int NOT NULL AUTO_INCREMENT,
                col_int_nokey int NOT NULL,
                col_int_key int NOT NULL,
                col_date_key date NOT NULL,
                col_date_nokey date NOT NULL,
                col_time_key time NOT NULL,
                col_time_nokey time NOT NULL,
                col_datetime_key datetime NOT NULL,
                col_datetime_nokey datetime NOT NULL,
                col_varchar_key varchar(1) NOT NULL,
                col_varchar_nokey varchar(1) NOT NULL,
                PRIMARY KEY (pk),
                KEY col_int_key (col_int_key),
                KEY col_date_key (col_date_key),
                KEY col_time_key (col_time_key),
                KEY col_datetime_key (col_datetime_key),
                KEY col_varchar_key (col_varchar_key,col_int_key)
               );

INSERT INTO C VALUES
 (5,2,6,'2006-05-25','2006-05-25','19:47:59','19:47:59',
 '2001-02-15 03:08:38','2001-02-15 03:08:38','y','y'),
 (6,9,1,'2008-01-23','2008-01-23','11:14:24','11:14:24',
 '2004-10-02 20:31:15','2004-10-02 20:31:15','t','t'),
 (8,8,2,'2002-10-13','2002-10-13','00:00:00','00:00:00',
 '1900-01-01 00:00:00','1900-01-01 00:00:00','s','s');

CREATE TABLE BB (
                 pk int NOT NULL AUTO_INCREMENT,
                 col_int_nokey int NOT NULL,
                 col_int_key int NOT NULL,
                 col_date_key date NOT NULL,
                 col_date_nokey date NOT NULL,
                 col_time_key time NOT NULL,
                 col_time_nokey time NOT NULL,
                 col_datetime_key datetime NOT NULL,
                 col_datetime_nokey datetime NOT NULL,
                 col_varchar_key varchar(1) NOT NULL,
                 col_varchar_nokey varchar(1) NOT NULL,
                 PRIMARY KEY (pk),
                 KEY col_int_key (col_int_key),
                 KEY col_date_key (col_date_key),
                 KEY col_time_key (col_time_key),
                 KEY col_datetime_key (col_datetime_key),
                 KEY col_varchar_key (col_varchar_key,col_int_key)
                );

INSERT INTO BB VALUES
(10,2,6,'2003-05-14','2003-05-14','09:41:11','09:41:11','2001-11-10
 22:10:37','2001-11-10 22:10:37','k','k'),
 (11,1,7,'2007-12-24','2007-12-24','08:54:06','08:54:06','2002-09-18
 16:27:07','2002-09-18 16:27:07','g','g');

 SELECT
 OUTR . col_date_nokey AS x
 FROM C AS OUTR2 LEFT JOIN B AS OUTR ON ( OUTR2 . col_varchar_key >= OUTR .
                                          col_varchar_key )
 WHERE OUTR . col_int_key IN
 (
  SELECT  INNR . col_int_nokey AS y
  FROM BB AS INNR
  WHERE INNR . col_time_nokey BETWEEN '2007-11-26' AND '2002-11-26'
 )
 AND OUTR . col_time_nokey < '2007-09-24' XOR OUTR . col_varchar_key IS NULL
 ORDER BY OUTR . col_varchar_key , OUTR . pk;

DROP TABLE B,C,BB;
CREATE TABLE BB (
                 pk int NOT NULL AUTO_INCREMENT,
                 col_int_nokey int NOT NULL,
                 col_int_key int NOT NULL,
                 col_date_key date NOT NULL,
                 col_date_nokey date NOT NULL,
                 col_time_key time NOT NULL,
                 col_time_nokey time NOT NULL,
                 col_datetime_key datetime NOT NULL,
                 col_datetime_nokey datetime NOT NULL,
                 col_varchar_key varchar(1) NOT NULL,
                 col_varchar_nokey varchar(1) NOT NULL,
                 PRIMARY KEY (pk),
                 KEY col_int_key (col_int_key),
                 KEY col_date_key (col_date_key),
                 KEY col_time_key (col_time_key),
                 KEY col_datetime_key (col_datetime_key),
                 KEY col_varchar_key (col_varchar_key,col_int_key)
                ) ;

INSERT INTO BB VALUES (10,2,6,'2003-05-14','2003-05-14','09:41:11','09:41:11','2001-11-10 22:10:37','2001-11-10 22:10:37','k','k'),(11,1,7,'2007-12-24','2007-12-24','08:54:06','08:54:06','2002-09-18 16:27:07','2002-09-18 16:27:07','g','g');

CREATE TABLE C (
                pk int NOT NULL AUTO_INCREMENT,
                col_int_nokey int NOT NULL,
                col_int_key int NOT NULL,
                col_date_key date NOT NULL,
                col_date_nokey date NOT NULL,
                col_time_key time NOT NULL,
                col_time_nokey time NOT NULL,
                col_datetime_key datetime NOT NULL,
                col_datetime_nokey datetime NOT NULL,
                col_varchar_key varchar(1) NOT NULL,
                col_varchar_nokey varchar(1) NOT NULL,
                PRIMARY KEY (pk),
                KEY col_int_key (col_int_key),
                KEY col_date_key (col_date_key),
                KEY col_time_key (col_time_key),
                KEY col_datetime_key (col_datetime_key),
                KEY col_varchar_key (col_varchar_key,col_int_key)
               ) ;
INSERT IGNORE INTO C VALUES (3,3,9,'2000-03-14','2000-03-14','16:25:11','16:25:11','2002-01-16 00:00:00','2002-01-16 00:00:00','d','d'),(4,246,24,'2000-10-08','2000-10-08','10:14:58','10:14:58','2006-10-12 04:32:53','2006-10-12 04:32:53','d','d'),(5,2,6,'2006-05-25','2006-05-25','19:47:59','19:47:59','2001-02-15 03:08:38','2001-02-15 03:08:38','y','y'),(7,3,6,'2007-06-18','2007-06-18','00:00:00','00:00:00','2002-08-20 22:48:00','2002-08-20 22:48:00','d','d'),(9,1,4,'1900-01-01','1900-01-01','15:57:25','15:57:25','2005-08-15 00:00:00','2005-08-15 00:00:00','r','r'),(10,8,8,'0000-00-00','0000-00-00','07:05:51','07:05:51','1900-01-01 00:00:00','1900-01-01 00:00:00','m','m');

CREATE TABLE CC (
                 pk int NOT NULL AUTO_INCREMENT,
                 col_int_nokey int NOT NULL,
                 col_int_key int NOT NULL,
                 col_date_key date NOT NULL,
                 col_date_nokey date NOT NULL,
                 col_time_key time NOT NULL,
                 col_time_nokey time NOT NULL,
                 col_datetime_key datetime NOT NULL,
                 col_datetime_nokey datetime NOT NULL,
                 col_varchar_key varchar(1) NOT NULL,
                 col_varchar_nokey varchar(1) NOT NULL,
                 PRIMARY KEY (pk),
                 KEY col_int_key (col_int_key),
                 KEY col_date_key (col_date_key),
                 KEY col_time_key (col_time_key),
                 KEY col_datetime_key (col_datetime_key),
                 KEY col_varchar_key (col_varchar_key,col_int_key)
                );

INSERT INTO CC VALUES (10,0,9,'2008-04-12','2008-04-12','03:52:43','03:52:43','2003-12-04 00:00:00','2003-12-04 00:00:00','z','z');
SELECT
alias2 . `col_int_nokey` AS field1
FROM ( CC AS alias1 INNER JOIN ( ( BB AS alias2 INNER JOIN
       (  SELECT   SQ1_alias1 . * FROM C AS SQ1_alias1  ) AS alias3
         ON (alias3 . `col_int_key` = alias2 . `col_int_nokey`  ) ) )
       ON (alias3 . `col_varchar_nokey` = alias2 . `col_varchar_key`  ) )
WHERE (  ( alias2 . `pk` , alias3 . `col_int_nokey` ) IN
  ( SELECT 4 , 7  UNION  SELECT 137, 6 ) )
    AND alias1 . `pk` > 149 AND alias1 . `pk` < ( 149 + 7 )
    OR alias3 . `col_varchar_key` < 'o';

DROP TABLE CC,C,BB;
CREATE TABLE C (
                pk INTEGER AUTO_INCREMENT,
                col_int_nokey INTEGER NOT NULL,
                col_int_key INTEGER NOT NULL,

                col_date_key DATE NOT NULL,
                col_date_nokey DATE NOT NULL,

                col_time_key TIME NOT NULL,
                col_time_nokey TIME NOT NULL,

                col_datetime_key DATETIME NOT NULL,
                col_datetime_nokey DATETIME NOT NULL,

                col_varchar_key VARCHAR(1) NOT NULL,
                col_varchar_nokey VARCHAR(1) NOT NULL,

                PRIMARY KEY (pk),
                KEY (col_int_key),
                KEY (col_date_key),
                KEY (col_time_key),
                KEY (col_datetime_key),
                KEY (col_varchar_key, col_int_key)
  );

  INSERT /*! IGNORE */ INTO C (
                               col_int_key, col_int_nokey,
                               col_date_key, col_date_nokey,
                               col_time_key, col_time_nokey,
                               col_datetime_key, col_datetime_nokey,
                               col_varchar_key, col_varchar_nokey
                              ) VALUES 
(1, 3, '2009-12-01', '2009-12-01', '00:21:38.058143', '00:21:38.058143',
'2007-05-28 00:00:00', '2007-05-28 00:00:00', 'c', 'c'),
(8, 5, '2004-12-17', '2004-12-17', '04:08:02.046897',
 '04:08:02.046897', '2009-07-25 09:21:20.064099', '2009-07-25
 09:21:20.064099', 'm', 'm'),
(9, 3, '2000-03-14', '2000-03-14',
'16:25:11.040240', '16:25:11.040240', '2002-01-16 00:00:00', '2002-01-16
00:00:00', 'd', 'd');

CREATE TABLE CC (
                 pk INTEGER AUTO_INCREMENT,
                 col_int_nokey INTEGER NOT NULL,
                 col_int_key INTEGER NOT NULL,

                 col_date_key DATE NOT NULL,
                 col_date_nokey DATE NOT NULL,

                 col_time_key TIME NOT NULL,
                 col_time_nokey TIME NOT NULL,

                 col_datetime_key DATETIME NOT NULL,
                 col_datetime_nokey DATETIME NOT NULL,

                 col_varchar_key VARCHAR(1) NOT NULL,
                 col_varchar_nokey VARCHAR(1) NOT NULL,

                 PRIMARY KEY (pk),
                 KEY (col_int_key),
                 KEY (col_date_key),
                 KEY (col_time_key),
                 KEY (col_datetime_key),
                 KEY (col_varchar_key, col_int_key)
  )  AUTO_INCREMENT=10;

INSERT /*! IGNORE */ INTO CC (
                              col_int_key, col_int_nokey,
                              col_date_key, col_date_nokey,
                              col_time_key, col_time_nokey,
                              col_datetime_key, col_datetime_nokey,
                              col_varchar_key, col_varchar_nokey
                             ) VALUES
(9, 0, '2008-04-12', '2008-04-12',
 '03:52:43.035922', '03:52:43.035922', '2003-12-04 00:00:00', '2003-12-04
 00:00:00', 'z', 'z'),
(4, 7, '2005-07-14', '2005-07-14', '21:10:39.061271',
 '21:10:39.061271', '2009-05-02 22:56:45.062451', '2009-05-02
 22:56:45.062451', 'n', 'n'),
(4, 5, '2002-12-21', '2002-12-21',
 '16:29:40.051764', '16:29:40.051764', '2009-10-26 12:51:42.058226',
 '2009-10-26 12:51:42.058226', 'j', 'j'),
(2, 7, '2002-03-18', '2002-03-18',
 '10:58:18.024863', '10:58:18.024863', '2009-02-26 14:13:52.000632',
 '2009-02-26 14:13:52.000632', 'l', 'l'),
(1, 2, NULL, NULL, '16:34:52.001480',
 '16:34:52.001480', '2004-11-23 02:21:32.018522', '2004-11-23
 02:21:32.018522', 'd', 'd');
SET sql_mode = 'NO_ENGINE_SUBSTITUTION';
CREATE TABLE transforms
SELECT
alias1 . `col_time_key` AS field1 ,
alias2 . `col_time_key` AS field2 ,
alias1 . `col_int_key` AS field3 ,
alias2 . `col_int_key` AS field4 ,
alias2 . `col_varchar_key` AS field5 ,
alias1 . `col_int_key` AS field6 ,
alias2 . `col_time_key` AS field7 ,
alias1 . `pk` AS field8 ,
alias1 . `col_datetime_key` AS field9 ,
alias2 . `col_datetime_key` AS field10 ,
alias2 . `col_date_key` AS field11 ,
alias2 . `col_int_key` AS field12 ,
alias2 . `col_int_key` AS field13 ,
alias1 . `col_varchar_nokey` AS field14 ,
alias1 . `col_date_key` AS field15 ,
alias2 . `col_int_key` AS field16 ,
alias1 . `col_varchar_key` AS field17
FROM ( C AS alias1 , CC AS alias2 )
WHERE alias1 . `col_int_key` NOT IN (237)
ORDER BY field1, field2, field3, field4, field5, field6, field7, field8,
field9, field10, field11, field12, field13, field14, field15, field16,
field17, alias1 . `col_date_key` , alias2 .`pk` ASC;
SET sql_mode = default;
SELECT * FROM transforms
WHERE (`field1`, `field2`, `field3`, `field4`, `field5`, `field6`, `field7`,
`field8`, `field9`, `field10`, `field11`, `field12`, `field13`, `field14`,
`field15`, `field16`, `field17`)
NOT IN (
SELECT
alias1 . `col_time_key` AS field1 ,
alias2 . `col_time_key` AS field2 ,
alias1 . `col_int_key` AS field3 ,
alias2 . `col_int_key` AS field4 ,
alias2 . `col_varchar_key` AS field5 ,
alias1 . `col_int_key` AS field6 ,
alias2 . `col_time_key` AS field7 ,
alias1 . `pk` AS field8 ,
alias1 . `col_datetime_key` AS field9 ,
alias2 . `col_datetime_key` AS field10 ,
alias2 . `col_date_key` AS field11 ,
alias2 . `col_int_key` AS field12 ,
alias2 . `col_int_key` AS field13 ,
alias1 . `col_varchar_nokey` AS field14 ,
alias1 . `col_date_key` AS field15 ,
alias2 . `col_int_key` AS field16 ,
alias1 . `col_varchar_key` AS field17
FROM ( C AS alias1 , CC AS alias2 )
WHERE alias1 . `col_int_key` NOT IN (237)
ORDER BY field1, field2, field3, field4, field5, field6, field7, field8,
field9, field10, field11, field12, field13, field14, field15, field16,
field17, alias1 . `col_date_key` , alias2 .`pk` ASC  );

DROP TABLE C,CC,transforms;
CREATE TABLE t1 (
  col_varchar_10_latin1_key varchar(10),
  pk int NOT NULL,
  col_varchar_10_latin1 varchar(10),
  col_int_key int,
  PRIMARY KEY (pk),
  KEY col_varchar_10_latin1_key (col_varchar_10_latin1_key),
  KEY col_int_key (col_int_key)
) charset latin1 ENGINE=MyISAM;

INSERT INTO t1 VALUES
('OAYEP',1,'yeah',183566336),
('u',2,'vvgnejnnoj',-638058496),
('h',3,'LJKVO',2),
('x',4,'l',-1954938880),
('JVYHY',5,'at',9),
('b',6,'ojcnhnzfih',1995505664),
('she',7,'jcnhnzfihl',6),
('BTXLX',8,'GONBZ',162267136),
('d',9,'nhnzfihlaj',8),
('VSOED',10,'q',2),
('nzfihlajoz',11,'o',8),
('WCJYY',12,'FQNYF',-1901068288),
('r' ,13,'f',-220659712),
('u',14,'f',6),
('DFKKY',15,'ozgqcypkrh',1),
('if',16,'it',8),
('from',17,'KKFED',-1065615360),
('IBMRH',18,'back',5),
('pkrhtylkoy',19,'WELBV',2),
('b',20,'d',2131558400);

CREATE TABLE t2 (
  col_varchar_1024_utf8_key varchar(1024),
  pk int NOT NULL,
  col_varchar_1024_latin1_key varchar(1024),
  col_int_key int,
  PRIMARY KEY (pk),
  KEY col_varchar_1024_utf8_key (col_varchar_1024_utf8_key(333)),
  KEY col_varchar_1024_latin1_key (col_varchar_1024_latin1_key(1000)),
  KEY col_int_key (col_int_key)
) charset latin1 ENGINE=MyISAM;

INSERT INTO t2 VALUES
('MFDLE',1,'no',1358168064),
('v',2,'really',154664960),
(repeat('mcrxjxxfpo',100),3,repeat('mcrxjxxfpo',100),1),
('o',4,'CEJHM',3),
('j',5,'CRDLM',174915584),
('m',6,'that\'s',7),
('YVMBM',7,'is',4),
('h',8,'as',8),
('y',9,'not',686096384),
('m',10,repeat('mcrxjxxfpo',100),8),
(repeat('mcrxjxxfpo',100),11,'v',2),
('and', 12,'b',6),
('from',13,'OJSUT',9),
('you',14,repeat('mcrxjxxfpo',100),1),
('mr',15,'ZMJFI',9),
('TYZOE',16,'I\'ll',-363069440),
('HLKEJ',17,'v',-767492096),
('OINER',18,repeat('mcrxjxxfpo',100),-102170624),
(repeat('mcrxjxxfpo',100),19,'i',7),
('one',20,'CPIUQ',469303296),
(repeat('mcrxjxxfpo',100),21,'IGLXO',1140391936),
('ERRUY',22,'WKQHJ',1),
('q',23,repeat('mcrxjxxfpo',100),1694564352),
('CYGKG',24,'o',7),
('BIWWF',25,'good',-1532035072);

SELECT DISTINCT
  table1.col_varchar_1024_latin1_key AS field1,
  table1.col_varchar_1024_latin1_key AS field2
FROM
  t2 AS table1 RIGHT JOIN t1 AS table2 ON table1.pk = table2.col_int_key
WHERE
  table1.col_int_key NOT BETWEEN 7 AND ( 7 + 1000 ) OR table1.pk >= 7
  AND  table1.col_varchar_1024_utf8_key < table2.col_varchar_10_latin1_key
ORDER BY field1,field2 DESC;

DROP TABLE t1,t2;
CREATE TABLE t1(f1 INT NOT NULL);
INSERT INTO t1 VALUES (16777214), (0);
SELECT COUNT(*) FROM t1 LEFT JOIN t1 t2 ON 1 WHERE t2.f1 > 1 GROUP BY t2.f1;
DROP TABLE t1;
CREATE TABLE C (
  pk int NOT NULL AUTO_INCREMENT,
  col_varchar_key varchar(1) NOT NULL,
  col_varchar_nokey varchar(1) NOT NULL,
  PRIMARY KEY (pk),
  KEY col_varchar_key (col_varchar_key)
);
INSERT INTO C VALUES (7,'y','y');

CREATE TABLE CC (
  pk int NOT NULL AUTO_INCREMENT,
  col_varchar_key varchar(1) NOT NULL,
  col_varchar_nokey varchar(1) NOT NULL,
  PRIMARY KEY (pk),
  KEY col_varchar_key (col_varchar_key)
);
INSERT INTO CC VALUES (13,'y','y');

SELECT
DISTINCT CONCAT( table2 . col_varchar_key , table1 . col_varchar_key )
AS field1
FROM
( CC AS table1 RIGHT OUTER JOIN C AS table2 ON (table2 . col_varchar_key =
table1 . col_varchar_nokey  ) )
WHERE
(
table1 . pk = 13
)
ORDER BY field1 , field1;

DROP TABLE C,CC;
CREATE TABLE t1 (
a int DEFAULT NULL,
b int DEFAULT NULL,
c1 int DEFAULT NULL,
c2 int DEFAULT NULL,
c3 int DEFAULT NULL,
c4 int DEFAULT NULL,
c5 int DEFAULT NULL,
c6 int DEFAULT NULL,
c7 int DEFAULT NULL,
c8 int DEFAULT NULL,
c9 int DEFAULT NULL,
c10 int DEFAULT NULL,
c11 int DEFAULT NULL,
c12 int DEFAULT NULL,
c13 int DEFAULT NULL,
c14 int DEFAULT NULL,
c15 int DEFAULT NULL,
c16 int DEFAULT NULL,
c17 int DEFAULT NULL,
c18 int DEFAULT NULL,
c19 int DEFAULT NULL,
c20 int DEFAULT NULL,
c21 int DEFAULT NULL,
c22 int DEFAULT NULL,
c23 int DEFAULT NULL,
c24 int DEFAULT NULL,
c25 int DEFAULT NULL,
c26 int DEFAULT NULL,
c27 int DEFAULT NULL,
c28 int DEFAULT NULL,
c29 int DEFAULT NULL,
c30 int DEFAULT NULL,
c31 int DEFAULT NULL,
c32 int DEFAULT NULL,
c33 int DEFAULT NULL,
c34 int DEFAULT NULL,
c35 int DEFAULT NULL
);
INSERT INTO t1 (a,b) VALUES (1,4),(2,2),(2,2),(4,1),(4,1),(4,1),(4,1);
SELECT sum(b) FROM t1 GROUP BY a, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10,
c11, c12, c13, c14, c15, c16, c17, c18, c19, c20, c21, c22, c23, c24, c25,
c26, c27, c28, c29, c30, c31, c32, c33, c34, c35;
SELECT DISTINCT sum(b) FROM t1 GROUP BY a, c1, c2, c3, c4, c5, c6, c7, c8,
c9, c10, c11, c12, c13, c14, c15, c16, c17, c18, c19, c20, c21, c22, c23,
c24, c25, c26, c27, c28, c29, c30, c31, c32, c33, c34, c35;
DROP TABLE t1;

set sql_mode='';
create table t1 (a blob,b int) engine=innodb;
create table t2 (b blob) engine=innodb;
select t2.b,t1.b,t1.a
from t2 inner join t1 on 1 cross join t2 a  on 1
group by t1.b;
set sql_mode=default;
drop table t1,t2;

set names utf8mb3, sql_mode='';
create table t1(a date,b text charset utf8mb3,c linestring not null);
insert into t1 values ('2015-01-01','a',linestring(point(1,1),point(2,2)));
select distinct nullif(a,b) as c from t1 z order by z.c;
set names default, sql_mode=default;
drop table t1;
SET @old_big_tables=@@big_tables;
SET big_tables=on;
set @old_limit_optimistic_insert_debug= @@innodb_limit_optimistic_insert_debug;
set global innodb_limit_optimistic_insert_debug=2;
select 1 as a union all select 1 union all select 2 union select 1 union all
select 2;
set big_tables= @old_big_tables;
set global innodb_limit_optimistic_insert_debug=
                      @old_limit_optimistic_insert_debug;
create table t1(a blob);
insert into t1 values ('a');
select distinct least(1,count(distinct a)) from t1 group by a;
drop table t1;
set big_tables= @old_big_tables;
set optimizer_switch= @old_optimizer_switch;

CREATE TABLE test_distinct (c1 VARCHAR(1000),
                            c2 CHAR(5) DEFAULT 'xxxxx');
INSERT INTO test_distinct VALUES ('a',null),  ('a',null);

SELECT DISTINCT c1, c2 FROM test_distinct;
SELECT c1, c2 FROM test_distinct GROUP BY c1, c2;

DROP TABLE test_distinct;