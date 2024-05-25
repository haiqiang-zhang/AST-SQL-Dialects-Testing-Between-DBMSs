drop view if exists v1;
drop table if exists t1,t4;
create table t4 (
  pk_col int auto_increment primary key, a1 char(64), a2 char(64), b char(16), c char(16) not null, d char(16), dummy char(64) default ' '
) engine=innodb;
insert into t4 (a1, a2, b, c, d) values
('a','a','a','a111','xy1'),('a','a','a','b111','xy2'),('a','a','a','c111','xy3'),('a','a','a','d111','xy4'),
('a','a','b','e112','xy1'),('a','a','b','f112','xy2'),('a','a','b','g112','xy3'),('a','a','b','h112','xy4'),
('a','b','a','i121','xy1'),('a','b','a','j121','xy2'),('a','b','a','k121','xy3'),('a','b','a','l121','xy4'),
('a','b','b','m122','xy1'),('a','b','b','n122','xy2'),('a','b','b','o122','xy3'),('a','b','b','p122','xy4'),
('b','a','a','a211','xy1'),('b','a','a','b211','xy2'),('b','a','a','c211','xy3'),('b','a','a','d211','xy4'),
('b','a','b','e212','xy1'),('b','a','b','f212','xy2'),('b','a','b','g212','xy3'),('b','a','b','h212','xy4'),
('b','b','a','i221','xy1'),('b','b','a','j221','xy2'),('b','b','a','k221','xy3'),('b','b','a','l221','xy4'),
('b','b','b','m222','xy1'),('b','b','b','n222','xy2'),('b','b','b','o222','xy3'),('b','b','b','p222','xy4'),
('c','a','a','a311','xy1'),('c','a','a','b311','xy2'),('c','a','a','c311','xy3'),('c','a','a','d311','xy4'),
('c','a','b','e312','xy1'),('c','a','b','f312','xy2'),('c','a','b','g312','xy3'),('c','a','b','h312','xy4'),
('c','b','a','i321','xy1'),('c','b','a','j321','xy2'),('c','b','a','k321','xy3'),('c','b','a','l321','xy4'),
('c','b','b','m322','xy1'),('c','b','b','n322','xy2'),('c','b','b','o322','xy3'),('c','b','b','p322','xy4'),
('d','a','a','a411','xy1'),('d','a','a','b411','xy2'),('d','a','a','c411','xy3'),('d','a','a','d411','xy4'),
('d','a','b','e412','xy1'),('d','a','b','f412','xy2'),('d','a','b','g412','xy3'),('d','a','b','h412','xy4'),
('d','b','a','i421','xy1'),('d','b','a','j421','xy2'),('d','b','a','k421','xy3'),('d','b','a','l421','xy4'),
('d','b','b','m422','xy1'),('d','b','b','n422','xy2'),('d','b','b','o422','xy3'),('d','b','b','p422','xy4'),
('a','a','a','a111','xy1'),('a','a','a','b111','xy2'),('a','a','a','c111','xy3'),('a','a','a','d111','xy4'),
('a','a','b','e112','xy1'),('a','a','b','f112','xy2'),('a','a','b','g112','xy3'),('a','a','b','h112','xy4'),
('a','b','a','i121','xy1'),('a','b','a','j121','xy2'),('a','b','a','k121','xy3'),('a','b','a','l121','xy4'),
('a','b','b','m122','xy1'),('a','b','b','n122','xy2'),('a','b','b','o122','xy3'),('a','b','b','p122','xy4'),
('b','a','a','a211','xy1'),('b','a','a','b211','xy2'),('b','a','a','c211','xy3'),('b','a','a','d211','xy4'),
('b','a','b','e212','xy1'),('b','a','b','f212','xy2'),('b','a','b','g212','xy3'),('b','a','b','h212','xy4'),
('b','b','a','i221','xy1'),('b','b','a','j221','xy2'),('b','b','a','k221','xy3'),('b','b','a','l221','xy4'),
('b','b','b','m222','xy1'),('b','b','b','n222','xy2'),('b','b','b','o222','xy3'),('b','b','b','p222','xy4'),
('c','a','a','a311','xy1'),('c','a','a','b311','xy2'),('c','a','a','c311','xy3'),('c','a','a','d311','xy4'),
('c','a','b','e312','xy1'),('c','a','b','f312','xy2'),('c','a','b','g312','xy3'),('c','a','b','h312','xy4'),
('c','b','a','i321','xy1'),('c','b','a','j321','xy2'),('c','b','a','k321','xy3'),('c','b','a','l321','xy4'),
('c','b','b','m322','xy1'),('c','b','b','n322','xy2'),('c','b','b','o322','xy3'),('c','b','b','p322','xy4'),
('d','a','a','a411','xy1'),('d','a','a','b411','xy2'),('d','a','a','c411','xy3'),('d','a','a','d411','xy4'),
('d','a','b','e412','xy1'),('d','a','b','f412','xy2'),('d','a','b','g412','xy3'),('d','a','b','h412','xy4'),
('d','b','a','i421','xy1'),('d','b','a','j421','xy2'),('d','b','a','k421','xy3'),('d','b','a','l421','xy4'),
('d','b','b','m422','xy1'),('d','b','b','n422','xy2'),('d','b','b','o422','xy3'),('d','b','b','p422','xy4');
create index idx12672_0 on t4 (a1);
create index idx12672_1 on t4 (a1,a2,b,c);
create index idx12672_2 on t4 (a1,a2,b);
select distinct a1 from t4 where pk_col not in (1,2,3,4);
drop table t4;
create table t1 (
  a varchar(30), b varchar(30), primary key(a), key(b)
) engine=innodb;
select distinct a from t1;
drop table t1;
create table t1(a int, key(a)) engine=innodb;
insert into t1 values(1);
select a, count(a) from t1 group by a with rollup;
drop table t1;
create table t1 (f1 int, f2 char(1), primary key(f1,f2)) charset utf8mb4 engine=innodb
stats_persistent=0;
insert into t1 values ( 1,"e"),(2,"a"),( 3,"c"),(4,"d");
alter table t1 drop primary key, add primary key (f2, f1);
drop table t1;
create table t1(pk int primary key) engine=innodb;
create view v1 as select pk from t1 where pk < 20;
insert into t1 values (1), (2), (3), (4);
select distinct pk from v1;
insert into t1 values (5), (6), (7);
select distinct pk from v1;
drop view v1;
drop table t1;
CREATE TABLE t1 (a CHAR(1), b CHAR(1), PRIMARY KEY (a,b))
charset utf8mb4 ENGINE=InnoDB;
INSERT INTO t1 VALUES ('a', 'b'), ('c', 'd');
SELECT COUNT(DISTINCT a) FROM t1 WHERE b = 'b';
DROP TABLE t1;
CREATE TABLE t1 (a CHAR(1) NOT NULL, b CHAR(1) NOT NULL, UNIQUE KEY (a,b))
charset utf8mb4 ENGINE=InnoDB;
INSERT INTO t1 VALUES ('a', 'b'), ('c', 'd');
SELECT COUNT(DISTINCT a) FROM t1 WHERE b = 'b';
DROP TABLE t1;
CREATE TABLE t0 (
  i1 INTEGER NOT NULL
);
INSERT INTO t0 VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),
                      (11),(12),(13),(14),(15),(16),(17),(18),(19),(20),
                      (21),(22),(23),(24),(25),(26),(27),(28),(29),(30);
CREATE TABLE t1 (
  c1 CHAR(1) NOT NULL,
  i1 INTEGER NOT NULL,
  i2 INTEGER NOT NULL,
  UNIQUE KEY k1 (c1,i2)
) charset utf8mb4 ENGINE=InnoDB;
INSERT INTO t1 SELECT 'A',i1,i1 FROM t0;
INSERT INTO t1 SELECT 'B',i1,i1 FROM t0;
INSERT INTO t1 SELECT 'C',i1,i1 FROM t0;
INSERT INTO t1 SELECT 'D',i1,i1 FROM t0;
INSERT INTO t1 SELECT 'E',i1,i1 FROM t0;
INSERT INTO t1 SELECT 'F',i1,i1 FROM t0;
CREATE TABLE t2 (
  c1 CHAR(1) NOT NULL,
  i1 INTEGER NOT NULL,
  i2 INTEGER NOT NULL,
  UNIQUE KEY k2 (c1,i1,i2)
) charset utf8mb4 ENGINE=InnoDB;
INSERT INTO t2 SELECT 'A',i1,i1 FROM t0;
INSERT INTO t2 SELECT 'B',i1,i1 FROM t0;
INSERT INTO t2 SELECT 'C',i1,i1 FROM t0;
INSERT INTO t2 SELECT 'D',i1,i1 FROM t0;
INSERT INTO t2 SELECT 'E',i1,i1 FROM t0;
INSERT INTO t2 SELECT 'F',i1,i1 FROM t0;
SELECT TRACE RLIKE 'minmax_keypart_in_disjunctive_query'
AS OK FROM INFORMATION_SCHEMA.OPTIMIZER_TRACE;
SELECT c1, max(i2) FROM t1 WHERE (c1 = 'C' AND i2 = 17) OR ( c1 = 'F')
GROUP BY c1;
SELECT c1, max(i2) FROM t1 WHERE (c1 = 'C' OR ( c1 = 'F' AND i2 = 17))
GROUP BY c1;
SELECT c1, max(i2) FROM t1 WHERE (c1 = 'C' OR c1 = 'F' ) AND ( i2 = 17 )
GROUP BY c1;
SELECT c1, max(i2) FROM t1 
WHERE ((c1 = 'C' AND (i2 = 40 OR i2 = 30)) OR ( c1 = 'F' AND (i2 = 40 )))
GROUP BY c1;
SELECT c1, i1, max(i2) FROM t2
WHERE (c1 = 'C' OR ( c1 = 'F' AND i1 < 35)) AND ( i2 = 17 )
GROUP BY c1,i1;
SELECT c1, i1, max(i2) FROM t2 
WHERE (((c1 = 'C' AND i1 < 40) OR ( c1 = 'F' AND i1 < 35)) AND ( i2 = 17 ))
GROUP BY c1,i1;
SELECT c1, i1, max(i2) FROM t2 
WHERE ((c1 = 'C' AND i1 < 40) OR ( c1 = 'F' AND i1 < 35) OR ( i2 = 17 ))
GROUP BY c1,i1;
DROP TABLE t0,t1,t2;
CREATE TABLE t1 (
  pk_col INT AUTO_INCREMENT PRIMARY KEY,
  a1 CHAR(64),
  KEY a1_idx (a1)
) charset utf8mb4 ENGINE=INNODB;
INSERT INTO t1 (a1) VALUES ('a'),('a'),('a'),('a'), ('a');
CREATE TABLE t2 (
  pk_col1 INT NOT NULL,
  pk_col2 INT NOT NULL,
  a1 CHAR(64),
  a2 CHAR(64),
  PRIMARY KEY(pk_col1, pk_col2),
  KEY a1_idx (a1),
  KEY a1_a2_idx (a1, a2)
) charset utf8mb4 ENGINE=INNODB;
INSERT INTO t2 (pk_col1, pk_col2, a1, a2) VALUES (1,1,'a','b'),(1,2,'a','b'),
                                                 (1,3,'a','c'),(1,4,'a','c'),
                                                 (2,1,'a','d');
SELECT DISTINCT a1
FROM t1
WHERE (pk_col = 2 OR pk_col = 22) AND a1 = 'a';
SELECT COUNT(DISTINCT a1)
FROM t1
GROUP BY a1,pk_col;
SELECT COUNT(DISTINCT a1)
FROM t2
GROUP BY a1,pk_col1;
SELECT COUNT(DISTINCT a1)
FROM t2
GROUP BY a1,a2;
DROP TABLE t1, t2;
CREATE TABLE t1 (
id int NOT NULL,
c1 int NOT NULL,
c2 int,
PRIMARY KEY(id),
INDEX c1_c2_idx(c1, c2));
INSERT INTO t1 (id, c1, c2) VALUES (1,1,1), (2,2,2), (10,10,1), (11,10,8),
                                   (12,10,1), (13,10,2);
SELECT DISTINCT c1
FROM t1
WHERE EXISTS (SELECT *
              FROM DUAL
              WHERE (c2 = 2));
SELECT DISTINCT c1
FROM t1
WHERE 1 IN (2,
            (SELECT 1
            FROM DUAL
            WHERE (c2 = 2)),
            3);
SELECT DISTINCT c1
FROM t1
WHERE c2 = 2;
SELECT DISTINCT c1
FROM t1 IGNORE INDEX (c1_c2_idx)
WHERE EXISTS (SELECT *
              FROM DUAL
              WHERE (c2 = 2));
SELECT DISTINCT c1
FROM t1 IGNORE INDEX (c1_c2_idx)
WHERE 1 IN (2,
            (SELECT 1
            FROM DUAL
            WHERE (c2 = 2)),
            3);
SELECT TRACE INTO @trace FROM INFORMATION_SCHEMA.OPTIMIZER_TRACE;
DROP TABLE t1;
CREATE TABLE t1(
  pk INT NOT NULL,
  c1 CHAR(2),
  c2 INT,
  PRIMARY KEY(pk),
  UNIQUE KEY ukey(c1, c2)
);
INSERT INTO t1(pk, c1, c2) VALUES (1,1,1),(2,2,2),(3,3,3),(4,5,4);
INSERT IGNORE INTo t1(pk, c1, c2)
  SELECT (@a:=@a+1),@a,@a FROM t1, t1 t2,t1 t3, t1 t4;
SELECT * FROM t1 WHERE pk = 1 OR pk = 231;
SELECT DISTINCT c1
FROM t1 FORCE INDEX(ukey)
WHERE pk IN (1,231) and c1 IS NOT NULL;
SELECT DISTINCT c1
FROM t1 IGNORE INDEX(ukey)
WHERE pk IN (1,231) and c1 IS NOT NULL;
DROP TABLE t1;
CREATE TABLE t1 (
  pk INT NOT NULL AUTO_INCREMENT,
  c1 varchar(100) DEFAULT NULL,
  c2 INT NOT NULL,
  PRIMARY KEY (pk),
  UNIQUE KEY ukey (c2,c1)
);
INSERT INTO t1(pk, c2) VALUES (100, 0), (101, 0), (102, 0), (103, 0);
DROP TABLE t1;