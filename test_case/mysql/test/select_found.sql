select SQL_CALC_FOUND_ROWS * from t1;
select found_rows();
select SQL_CALC_FOUND_ROWS * from t1 limit 1;
select found_rows();
select SQL_BUFFER_RESULT SQL_CALC_FOUND_ROWS * from t1 limit 1;
select found_rows();
select SQL_CALC_FOUND_ROWS * from t1 order by b desc limit 1;
select found_rows();
select SQL_CALC_FOUND_ROWS distinct b from t1 limit 1;
select found_rows();
select SQL_CALC_FOUND_ROWS b,count(*) as c from t1 group by b order by c desc limit 1;
select found_rows();
select SQL_CALC_FOUND_ROWS * from t1 left join t1 as t2 on (t1.b=t2.a) limit 2,1;
select found_rows();
select SQL_CALC_FOUND_ROWS * from t1 limit 10 offset 100;
select found_rows();
drop table t1;
create table t1 (a int not null primary key);
insert into t1 values (1),(2),(3),(4),(5);
select sql_calc_found_rows a from t1 where a in (1,2,3) order by a desc limit 0,2;
select FOUND_ROWS();
select sql_calc_found_rows a from t1 where a in (1,2,3) order by a+2 desc limit 0,2;
select FOUND_ROWS();
drop table t1;
CREATE TABLE t1 (
`id` smallint(5) unsigned NOT NULL auto_increment,
`kid` smallint(5) unsigned NOT NULL default '0',
PRIMARY KEY (`id`),
KEY `kid` (`kid`)
) charset utf8mb4;
CREATE TABLE t2 (
  id smallint(5) unsigned NOT NULL auto_increment,
  name varchar(50) NOT NULL default '',
  email varchar(50) NOT NULL default '',
  PRIMARY KEY  (id),
  UNIQUE KEY e_n (email,name)
) charset utf8mb4;
SELECT FOUND_ROWS();
SELECT SQL_CALC_FOUND_ROWS DISTINCT email FROM t2 LEFT JOIN t1  ON kid = t2.id WHERE t1.id IS NULL order by email LIMIT 10;
SELECT FOUND_ROWS();
SELECT DISTINCT email FROM t2 LEFT JOIN t1  ON kid = t2.id WHERE t1.id IS NULL LIMIT 10;
SELECT DISTINCT email FROM t2 LEFT JOIN t1  ON kid = t2.id WHERE t1.id IS NULL ORDER BY email LIMIT 10;
INSERT INTO `t1` (`id`, `kid`) VALUES ('0', '150');
SELECT SQL_CALC_FOUND_ROWS DISTINCT email FROM t2 LEFT JOIN t1  ON kid = t2.id WHERE t1.id IS NULL LIMIT 10;
SELECT FOUND_ROWS();
drop table t1,t2;
CREATE TABLE `t1` (
  `titre` char(80) NOT NULL default '',
  `numeropost` mediumint(8) unsigned NOT NULL auto_increment,
  `maxnumrep` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`numeropost`),
  KEY `maxnumrep` (`maxnumrep`)
) ENGINE=MyISAM ROW_FORMAT=FIXED;
INSERT INTO t1 (titre,maxnumrep) VALUES
('test1','1'),('test2','2'),('test3','3');
SELECT SQL_CALC_FOUND_ROWS titre,numeropost,maxnumrep FROM t1 WHERE numeropost IN (1,2) ORDER BY maxnumrep DESC LIMIT 0, 1;
SELECT FOUND_ROWS();
SELECT SQL_CALC_FOUND_ROWS 1 FROM (SELECT 1) as a LIMIT 0;
SELECT FOUND_ROWS();
SELECT SQL_CALC_FOUND_ROWS * FROM t1 WHERE numeropost > 1  LIMIT 0;
SELECT FOUND_ROWS();
SELECT SQL_CALC_FOUND_ROWS * FROM t1 LIMIT 0;
SELECT FOUND_ROWS();
SELECT SQL_CALC_FOUND_ROWS * FROM t1 ORDER BY numeropost  LIMIT 0;
SELECT FOUND_ROWS();
drop table t1;
create table t1 (id int, primary key (id));
insert into t1 values (1), (2), (3), (4), (5);
select SQL_CALC_FOUND_ROWS * from t1 where id > 3 limit 0, 1;
select FOUND_ROWS();
select SQL_CALC_FOUND_ROWS * from t1 where id > 3 AND 1=2 limit 0, 1;
select FOUND_ROWS();
select SQL_CALC_FOUND_ROWS * from t1 where id > 6 limit 0, 1;
select FOUND_ROWS();
drop table t1;
CREATE TABLE t1 ( a int not null, b int not null, KEY ab(a,b) );
INSERT INTO t1 VALUES ( 47,    1  );
INSERT INTO t1 VALUES ( 70,    1  );
SELECT * FROM t1
WHERE
(
 ( b =1 AND a BETWEEN 14 AND 21 ) OR
 ( b =2 AND a BETWEEN 16 AND 18 ) OR
 ( b =3 AND a BETWEEN 15 AND 19 )
);
DROP TABLE t1;
CREATE TABLE t1 ( a integer, u varchar(15), r integer, key uao_idx( r, a, u));
DELETE  FROM t1
WHERE (  r = 1 AND a IN ( 1, 2    ) AND ( u = 'w'   OR u LIKE 'w/%'   ) )
   OR (  r = 1 AND a IN (       3 ) AND ( u = 'w/U' OR u LIKE 'w/U/%' ) )
   OR (  r = 1 AND a IN ( 1, 2, 3 ) AND ( u = 'w'                     ) );
drop table t1;
CREATE TABLE t1 (a VARCHAR(16), UNIQUE(a));
INSERT INTO t1 VALUES ('1'), ('2'), ('3');
SELECT SQL_CALC_FOUND_ROWS * FROM t1 WHERE a = '2' LIMIT 0, 1;
SELECT FOUND_ROWS();
DROP TABLE t1;
CREATE TABLE t1 (a INT);
INSERT INTO t1 VALUES (0), (0), (1), (2);
SELECT SQL_CALC_FOUND_ROWS * FROM t1 WHERE a = 0 GROUP BY a HAVING a > 10;
SELECT FOUND_ROWS();
DROP TABLE t1;
SELECT 'foo';
SELECT FOUND_ROWS();
SELECT SQL_CALC_FOUND_ROWS 'foo';
SELECT FOUND_ROWS();
SELECT SQL_CALC_FOUND_ROWS 'foo' limit 0;
SELECT FOUND_ROWS();
SELECT FOUND_ROWS();
SELECT SQL_CALC_FOUND_ROWS 'foo' UNION SELECT 'bar' LIMIT 0;
SELECT FOUND_ROWS();
CREATE TABLE t1 (a int, b int);
INSERT INTO t1 VALUES (1,2), (1,3), (1,4), (1,5);
SELECT SQL_CALC_FOUND_ROWS DISTINCT 'a' FROM t1 GROUP BY b LIMIT 2;
SELECT FOUND_ROWS();
DROP TABLE t1;
CREATE TABLE t1 (i INT);
INSERT INTO t1 VALUES (1), (2), (3), (4), (5);
SELECT FOUND_ROWS();
DROP TABLE t1;
CREATE TABLE t1 (c1 int);
INSERT INTO t1 VALUES (1), (2), (3), (4);
SELECT FOUND_ROWS();
DROP TABLE t1;
