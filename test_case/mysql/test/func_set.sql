select interval(55,10,20,30,40,50,60,70,80,90,100),interval(3,1,1+1,1+1+1+1),field("IBM","NCA","ICL","SUN","IBM","DIGITAL"),field("A","B","C"),elt(2,"ONE","TWO","THREE"),interval(0,1,2,3,4),elt(1,1,2,3)|0,elt(1,1.1,1.2,1.3)+0;
SELECT INTERVAL(13, 7, 14, 21, 28, 35, 42, 49, 56);
SELECT INTERVAL(13, 7, 14, 21, 28, 35, 42, 49, 56, 77);
select find_in_set("b","a,b,c"),find_in_set("c","a,b,c"),find_in_set("dd","a,bbb,dd"),find_in_set("bbb","a,bbb,dd");
select find_in_set("d","a,b,c"),find_in_set("dd","a,bbb,d"),find_in_set("bb","a,bbb,dd");
select make_set(0,'a','b','c'),make_set(-1,'a','b','c'),make_set(1,'a','b','c'),make_set(2,'a','b','c'),make_set(1+2,concat('a','b'),'c');
select make_set(NULL,'a','b','c'),make_set(1|4,'a',NULL,'c'),make_set(1+2,'a',NULL,'c');
select export_set(9,"Y","N","-",5),export_set(9,"Y","N"),export_set(9,"Y","N","");
select elt(2,1),field(NULL,"a","b","c");
select field("b","a",NULL),field(1,0,NULL)+0,field(1.0,0.0,NULL)+0.0,field(1.0e1,0.0e1,NULL)+0.0e1;
select field(NULL,"a",NULL),field(NULL,0,NULL)+0,field(NULL,0.0,NULL)+0.0,field(NULL,0.0e1,NULL)+0.0e1;
select find_in_set("","a,b,c"),find_in_set("","a,b,c,"),find_in_set("",",a,b,c");
select find_in_set("abc","abc"),find_in_set("ab","abc"),find_in_set("abcd","abc");
select interval(null, 1, 10, 100);
drop table if exists t1,t2;
create  table t1 (id int(10) not null unique);
create  table t2 (id int(10) not null primary key, val int(10) not null);
insert into t1 values (1),(2),(4);
insert into t2 values (1,1),(2,1),(3,1),(4,2);
select one.id, elt(two.val,'one','two') from t1 one, t2 two where two.id=one.id;
select one.id, elt(two.val,'one','two') from t1 one, t2 two where two.id=one.id order by one.id;
drop table t1,t2;
select find_in_set(binary 'a',binary 'A,B,C');
select find_in_set('a',binary 'A,B,C');
select find_in_set(binary 'a', 'A,B,C');
select find_in_set('1','3,1,');
SELECT INTERVAL(0.0, NULL);
SELECT INTERVAL(0.0, CAST(NULL AS DECIMAL));
SELECT INTERVAL(0.0, CAST(DATE(NULL) AS DECIMAL));
SELECT INTERVAL(0.0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
SELECT INTERVAL(0.0, CAST(NULL AS DECIMAL), CAST(NULL AS DECIMAL), 
  CAST(NULL AS DECIMAL), CAST(NULL AS DECIMAL), CAST(NULL AS DECIMAL), 
  CAST(NULL AS DECIMAL), CAST(NULL AS DECIMAL), CAST(NULL AS DECIMAL));
SELECT INTERVAL(0.0, CAST(DATE(NULL) AS DECIMAL), CAST(DATE(NULL) AS DECIMAL),
  CAST(DATE(NULL) AS DECIMAL), CAST(DATE(NULL) AS DECIMAL),
  CAST(DATE(NULL) AS DECIMAL), CAST(DATE(NULL) AS DECIMAL),
  CAST(DATE(NULL) AS DECIMAL), CAST(DATE(NULL) AS DECIMAL));
drop table if exists t1;
create table t1 (f1 set('test1','test2','test3') character set utf8mb3 default null)
default charset=latin1;
insert into t1 values (''),(null),(null),(''),(''),('');
select find_in_set(f1,f1) as a from t1,(select find_in_set(f1,f1) as b from t1) a;
drop table t1;
CREATE TABLE t1( a SET('a', 'b', 'c') );
CREATE TABLE t2( a SET('a', 'b', 'c') );
INSERT IGNORE INTO t1 VALUES ('d');
INSERT INTO t2 VALUES ('');
SELECT CONVERT( a USING latin1 ) FROM t1;
SELECT CONVERT( a USING latin1 ) FROM t2;
DROP TABLE t1, t2;
CREATE TABLE t1(days set('1','2','3','4','5','6','7'));
INSERT INTO t1 VALUES('1,2,3,4,5,6,7'), (NULL), ('1,2,3,4,5,6,7');
SELECT * FROM t1 WHERE FIND_IN_SET(DAYOFWEEK(CURRENT_DATE()), days);
SELECT * FROM t1 WHERE FIND_IN_SET(DAYOFWEEK(CURRENT_DATE()), days) IS UNKNOWN;
SELECT * FROM t1 WHERE FIND_IN_SET(DAYOFWEEK(CURRENT_DATE()), NULL);
SELECT * FROM t1 WHERE FIND_IN_SET(DAYOFWEEK(CURRENT_DATE()), NULL) IS UNKNOWN;
SELECT * FROM t1 WHERE FIND_IN_SET(7, days);
SELECT * FROM t1 WHERE FIND_IN_SET(8, days);
SELECT * FROM t1 WHERE FIND_IN_SET(NULL, days);
SELECT * FROM t1 WHERE FIND_IN_SET(NULL, days) IS UNKNOWN;
SELECT * FROM t1 WHERE FIND_IN_SET(NULL, NULL);
SELECT * FROM t1 WHERE FIND_IN_SET(NULL, NULL) IS UNKNOWN;
DROP TABLE t1;
CREATE TABLE t1 (a INT, b CHAR NOT NULL);
INSERT INTO t1 VALUES (NULL,'1'),(NULL,'1');
SELECT COUNT(*) FROM t1 GROUP BY MAKE_SET(a,b);
DROP TABLE t1;
CREATE TABLE t(a INTEGER) engine=innodb;
SELECT 1 IN (SELECT MAKE_SET(-1, 1, (SELECT 1 FROM t)) FROM t);
DROP TABLE t;
select find_in_set(json_unquote(json_set('{}','$','')),1);
CREATE TABLE t1 (
    c varchar(40),
    z varchar(40),
    s set('alpha','bravo','charlie','delta','echo','foxtrot','golf')
);
INSERT INTO t1 VALUES
  ('foxtrot', 'zulu', 'bravo,delta,foxtrot'),
  ('foxtrot', 'zulu', 'foxtrot'),
  ('foxtrot', 'zulu', 'alpha');
SELECT 'using string   ' as param, FIND_IN_SET('foxtrot', s) as f, s FROM t1
UNION
SELECT 'using variable', FIND_IN_SET(@a, s), s FROM t1
UNION
SELECT 'using column  ', FIND_IN_SET(c, s), s FROM t1;
SELECT 'invalid string   ' as param, FIND_IN_SET('zulu', s) as f, s FROM t1
UNION
SELECT 'invalid variable', FIND_IN_SET(@z, s), s FROM t1
UNION
SELECT 'invalid column  ', FIND_IN_SET(z, s), s FROM t1;
DROP TABLE t1;
