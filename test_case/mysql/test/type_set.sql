create table t1 (a set (' ','a','b') not null);
drop table t1;
create table t1 (a set (' ','a','b ') not null default 'b ');
drop table t1;
create table t1 (s set ('a','A') character set latin1 collate latin1_bin);
insert into t1 values ('a'),('a,A'),('A,a'),('A');
select s from t1 order by s;
select s from t1 order by concat(s);
drop table t1;
CREATE TABLE t1 (c set('ae','oe','ue','ss') collate latin1_german2_ci);
INSERT INTO t1 VALUES ('ae'),('oe'),('ue'),('ss');
INSERT INTO t1 VALUES ('ae,oe,ue,ss');
SELECT c FROM t1 ORDER BY c;
SELECT c FROM t1 ORDER BY concat(c);
DROP TABLE t1;
CREATE TABLE t1 (
        set_unique_utf8 set ('a','b','c','d','e','f','g','h','i','j','k','l',
                             'm','n','o','p','q','r','s','t','u','v','w','x',
                             'y','z') CHARACTER SET utf8mb3,
        unique (set_unique_utf8)
);
INSERT INTO t1 ( set_unique_utf8 ) VALUES ( '' );
DROP TABLE t1;
CREATE TABLE bar(id
set('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16',
'17','18','19','20','21','22','23','24','25','26','27','28','29','30','31',
'32','33','34','35','36','37','38','39','40','41','42','43','44','45','46',
'47','48','49','50','51','52','53','54','55','56','57','58','59','60','61',
'62','63','64'));
INSERT INTO bar VALUES ("100");
SELECT * FROM bar;
DROP TABLE bar;
CREATE TABLE t_double (a double not null);
INSERT INTO t_double (a) VALUES
(-20000000000000000000000000000.0001), (20000000000000000000000000000.0001);
CREATE TABLE t_set (
  b set('up', 'down')
);
INSERT IGNORE INTO t_set (b) SELECT a from t_double;
SELECT b FROM t_set;
DROP TABLE t_double, t_set;
