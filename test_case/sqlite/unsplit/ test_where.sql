CREATE TABLE t1(w int, x int, y int);
CREATE TABLE t2(p int, q int, r int, s int);
INSERT INTO t1 VALUES(1,0,4);
INSERT INTO t1 VALUES(2,1,9);
INSERT INTO t1 VALUES(3,1,16);
INSERT INTO t1 VALUES(4,2,25);
INSERT INTO t1 VALUES(5,2,36);
INSERT INTO t1 VALUES(6,2,49);
INSERT INTO t1 VALUES(7,2,64);
INSERT INTO t1 VALUES(8,3,81);
INSERT INTO t1 VALUES(9,3,100);
INSERT INTO t1 VALUES(10,3,121);
INSERT INTO t1 VALUES(11,3,144);
INSERT INTO t1 VALUES(12,3,169);
INSERT INTO t1 VALUES(13,3,196);
INSERT INTO t1 VALUES(14,3,225);
INSERT INTO t1 VALUES(15,3,256);
INSERT INTO t1 VALUES(16,4,289);
INSERT INTO t1 VALUES(17,4,324);
INSERT INTO t1 VALUES(18,4,361);
INSERT INTO t1 VALUES(19,4,400);
INSERT INTO t1 VALUES(20,4,441);
INSERT INTO t1 VALUES(21,4,484);
INSERT INTO t1 VALUES(22,4,529);
INSERT INTO t1 VALUES(23,4,576);
INSERT INTO t1 VALUES(24,4,625);
INSERT INTO t1 VALUES(25,4,676);
INSERT INTO t1 VALUES(26,4,729);
INSERT INTO t1 VALUES(27,4,784);
INSERT INTO t1 VALUES(28,4,841);
INSERT INTO t1 VALUES(29,4,900);
INSERT INTO t1 VALUES(30,4,961);
INSERT INTO t1 VALUES(31,4,1024);
INSERT INTO t1 VALUES(32,5,1089);
INSERT INTO t1 VALUES(33,5,1156);
INSERT INTO t1 VALUES(34,5,1225);
INSERT INTO t1 VALUES(35,5,1296);
INSERT INTO t1 VALUES(36,5,1369);
INSERT INTO t1 VALUES(37,5,1444);
INSERT INTO t1 VALUES(38,5,1521);
INSERT INTO t1 VALUES(39,5,1600);
INSERT INTO t1 VALUES(40,5,1681);
INSERT INTO t1 VALUES(41,5,1764);
INSERT INTO t1 VALUES(42,5,1849);
INSERT INTO t1 VALUES(43,5,1936);
INSERT INTO t1 VALUES(44,5,2025);
INSERT INTO t1 VALUES(45,5,2116);
INSERT INTO t1 VALUES(46,5,2209);
INSERT INTO t1 VALUES(47,5,2304);
INSERT INTO t1 VALUES(48,5,2401);
INSERT INTO t1 VALUES(49,5,2500);
INSERT INTO t1 VALUES(50,5,2601);
INSERT INTO t1 VALUES(51,5,2704);
INSERT INTO t1 VALUES(52,5,2809);
INSERT INTO t1 VALUES(53,5,2916);
INSERT INTO t1 VALUES(54,5,3025);
INSERT INTO t1 VALUES(55,5,3136);
INSERT INTO t1 VALUES(56,5,3249);
INSERT INTO t1 VALUES(57,5,3364);
INSERT INTO t1 VALUES(58,5,3481);
INSERT INTO t1 VALUES(59,5,3600);
INSERT INTO t1 VALUES(60,5,3721);
INSERT INTO t1 VALUES(61,5,3844);
INSERT INTO t1 VALUES(62,5,3969);
INSERT INTO t1 VALUES(63,5,4096);
INSERT INTO t1 VALUES(64,6,4225);
INSERT INTO t1 VALUES(65,6,4356);
INSERT INTO t1 VALUES(66,6,4489);
INSERT INTO t1 VALUES(67,6,4624);
INSERT INTO t1 VALUES(68,6,4761);
INSERT INTO t1 VALUES(69,6,4900);
INSERT INTO t1 VALUES(70,6,5041);
INSERT INTO t1 VALUES(71,6,5184);
INSERT INTO t1 VALUES(72,6,5329);
INSERT INTO t1 VALUES(73,6,5476);
INSERT INTO t1 VALUES(74,6,5625);
INSERT INTO t1 VALUES(75,6,5776);
INSERT INTO t1 VALUES(76,6,5929);
INSERT INTO t1 VALUES(77,6,6084);
INSERT INTO t1 VALUES(78,6,6241);
INSERT INTO t1 VALUES(79,6,6400);
INSERT INTO t1 VALUES(80,6,6561);
INSERT INTO t1 VALUES(81,6,6724);
INSERT INTO t1 VALUES(82,6,6889);
INSERT INTO t1 VALUES(83,6,7056);
INSERT INTO t1 VALUES(84,6,7225);
INSERT INTO t1 VALUES(85,6,7396);
INSERT INTO t1 VALUES(86,6,7569);
INSERT INTO t1 VALUES(87,6,7744);
INSERT INTO t1 VALUES(88,6,7921);
INSERT INTO t1 VALUES(89,6,8100);
INSERT INTO t1 VALUES(90,6,8281);
INSERT INTO t1 VALUES(91,6,8464);
INSERT INTO t1 VALUES(92,6,8649);
INSERT INTO t1 VALUES(93,6,8836);
INSERT INTO t1 VALUES(94,6,9025);
INSERT INTO t1 VALUES(95,6,9216);
INSERT INTO t1 VALUES(96,6,9409);
INSERT INTO t1 VALUES(97,6,9604);
INSERT INTO t1 VALUES(98,6,9801);
INSERT INTO t1 VALUES(99,6,10000);
INSERT INTO t1 VALUES(100,6,10201);
INSERT INTO t2 SELECT 101-w, x, (SELECT max(y) FROM t1)+1-y, y FROM t1;
CREATE INDEX i1w ON t1("w");
CREATE INDEX i1xy ON t1(`x`,'y' ASC);
CREATE INDEX i2p ON t2(p);
CREATE INDEX i2r ON t2(r);
CREATE INDEX i2qs ON t2(q, s);
SELECT x, y, w FROM t1 WHERE w=10;
SELECT x, y, w FROM t1 WHERE w IS 10;
EXPLAIN QUERY PLAN 
  SELECT x, y, w FROM t1 WHERE w=10;
EXPLAIN QUERY PLAN 
  SELECT x, y, w FROM t1 WHERE w IS 10;
EXPLAIN QUERY PLAN 
  SELECT x, y, w FROM t1 WHERE +w=10;
SELECT x, y, w AS abc FROM t1 WHERE abc=10;
EXPLAIN QUERY PLAN 
  SELECT x, y, w AS abc FROM t1 WHERE abc=10;
SELECT x, y, w FROM t1 WHERE w=11;
SELECT x, y, w AS abc FROM t1 WHERE abc=11;
SELECT x, y, w AS abc FROM t1 WHERE 11=w;
SELECT x, y, w AS abc FROM t1 WHERE 11=abc;
SELECT x, y, w AS abc FROM t1 WHERE 11 IS abc;
SELECT w, x, y FROM t1 WHERE 11=w AND x>2;
SELECT w, x, y FROM t1 WHERE 11 IS w AND x>2;
EXPLAIN QUERY PLAN 
  SELECT w, x, y FROM t1 WHERE 11=w AND x>2;
EXPLAIN QUERY PLAN 
  SELECT w, x, y FROM t1 WHERE 11 IS w AND x>2;
SELECT w AS a, x AS b, y FROM t1 WHERE 11=a AND b>2;
EXPLAIN QUERY PLAN 
  SELECT w AS a, x AS b, y FROM t1 WHERE 11=a AND b>2;
SELECT x, y FROM t1 WHERE y<200 AND w=11 AND x>2;
EXPLAIN QUERY PLAN 
  SELECT x, y FROM t1 WHERE y<200 AND w=11 AND x>2;
SELECT x, y FROM t1 WHERE y<200 AND x>2 AND w=11;
SELECT x, y FROM t1 WHERE w=11 AND y<200 AND x>2;
SELECT x, y FROM t1 WHERE w>10 AND y=144 AND x=3;
EXPLAIN QUERY PLAN 
  SELECT x, y FROM t1 WHERE w>10 AND y=144 AND x=3;
EXPLAIN QUERY PLAN 
  SELECT x, y FROM t1 WHERE y=144 AND x=3;
SELECT x, y FROM t1 WHERE y=144 AND w>10 AND x=3;
SELECT x, y FROM t1 WHERE x=3 AND w>=10 AND y=121;
SELECT x, y FROM t1 WHERE x=3 AND y=100 AND w<10;
SELECT x, y FROM t1 WHERE x IS 3 AND y IS 100 AND w<10;
SELECT w FROM t1 WHERE x=3 AND y<100;
SELECT w FROM t1 WHERE x IS 3 AND y<100;
SELECT w FROM t1 WHERE x=3 AND 100>y;
SELECT w FROM t1 WHERE 3=x AND y<100;
SELECT w FROM t1 WHERE 3 IS x AND y<100;
SELECT w FROM t1 WHERE 3=x AND 100>y;
SELECT w FROM t1 WHERE x=3 AND y<=100;
SELECT w FROM t1 WHERE x=3 AND 100>=y;
SELECT w FROM t1 WHERE x=3 AND y>225;
SELECT w FROM t1 WHERE x IS 3 AND y>225;
SELECT w FROM t1 WHERE x=3 AND 225<y;
SELECT w FROM t1 WHERE x=3 AND y>=225;
SELECT w FROM t1 WHERE x=3 AND 225<=y;
SELECT w FROM t1 WHERE x=3 AND y>121 AND y<196;
SELECT w FROM t1 WHERE x IS 3 AND y>121 AND y<196;
SELECT w FROM t1 WHERE x=3 AND y>=121 AND y<=196;
SELECT w FROM t1 WHERE x=3 AND 121<y AND 196>y;
SELECT w FROM t1 WHERE x=3 AND 121<=y AND 196>=y;
SELECT w FROM t1 WHERE x=3 AND y+1==122;
SELECT w FROM t1 WHERE x+1=4 AND y+1==122;
SELECT w FROM t1 WHERE y==121;
SELECT w FROM t1 WHERE w>97;
SELECT w FROM t1 WHERE w>=97;
SELECT w FROM t1 WHERE w==97;
SELECT w FROM t1 WHERE w<=97 AND w==97;
SELECT w FROM t1 WHERE w<98 AND w==97;
SELECT w FROM t1 WHERE w>=97 AND w==97;
SELECT w FROM t1 WHERE w>96 AND w==97;
SELECT w FROM t1 WHERE w==97 AND w==97;
SELECT w FROM t1 WHERE w+1==98;
SELECT w FROM t1 WHERE w<3;
SELECT w FROM t1 WHERE w<=3;
SELECT w FROM t1 WHERE w+1<=4 ORDER BY w;
SELECT (w) FROM t1 WHERE (w)>(97);
SELECT (w) FROM t1 WHERE (w)>=(97);
SELECT (w) FROM t1 WHERE (w)==(97);
SELECT (w) FROM t1 WHERE ((w)+(1))==(98);
SELECT w, p FROM t2, t1
    WHERE x=q AND y=s AND r=8977;
SELECT w, p FROM t2, t1
    WHERE x=q AND s=y AND r=8977;
SELECT w, p FROM t2, t1
    WHERE x=q AND s=y AND r=8977 AND w>10;
SELECT w, p FROM t2, t1
    WHERE p<80 AND x=q AND s=y AND r=8977 AND w>10;
SELECT w, p FROM t2, t1
    WHERE p<80 AND x=q AND 8977=r AND s=y AND w>10;
SELECT w, p FROM t2, t1
    WHERE x=q AND p=77 AND s=y AND w>5;
SELECT w, p FROM t1, t2
    WHERE x=q AND p>77 AND s=y AND w=5;
SELECT A.w, B.p, C.w FROM t1 as A, t2 as B, t1 as C
    WHERE C.w=101-B.p AND B.r=10202-A.y AND A.w=11;
SELECT A.w, B.p, C.w FROM t1 as A, t2 as B, t1 as C
    WHERE C.w=101-B.p AND B.r=10202-A.y AND A.w=12;
SELECT A.w, B.p, C.w FROM t1 as A, t2 as B, t1 as C
    WHERE A.w=15 AND B.p=C.w AND B.r=10202-A.y;
SELECT * FROM t1 WHERE 0;
SELECT * FROM t1 WHERE 1 LIMIT 1;
SELECT 99 WHERE 0;
SELECT 99 WHERE 1;
SELECT 99 WHERE 0.1;
SELECT 99 WHERE 0.0;
SELECT count(*) FROM t1 WHERE t1.w;
SELECT * FROM t1 WHERE rowid IN (1,2,3,1234) order by 1;
SELECT * FROM t1 WHERE rowid+0 IN (1,2,3,1234) order by 1;
SELECT * FROM t1 WHERE w IN (-1,1,2,3) order by 1;
SELECT * FROM t1 WHERE w IN (3,-1,1,2) order by 1;
SELECT * FROM t1 WHERE w IN (3,2,-1,1,2) order by 1;
SELECT * FROM t1 WHERE w IN (-1,1,2,3) order by 1 DESC;
SELECT * FROM t1 WHERE w+0 IN (-1,1,2,3) order by 1;
SELECT * FROM t1 WHERE rowid IN 
         (select rowid from t1 where rowid IN (-1,2,4))
      ORDER BY 1;
SELECT * FROM t1 WHERE rowid+0 IN 
         (select rowid from t1 where rowid IN (-1,2,4))
      ORDER BY 1;
SELECT * FROM t1 WHERE w IN 
         (select rowid from t1 where rowid IN (-1,2,4))
      ORDER BY 1;
SELECT * FROM t1 WHERE w+0 IN 
         (select rowid from t1 where rowid IN (-1,2,4))
      ORDER BY 1;
SELECT * FROM t1 WHERE x IN (1,7) ORDER BY 1;
SELECT * FROM t1 WHERE x+0 IN (1,7) ORDER BY 1;
SELECT * FROM t1 WHERE y IN (6400,8100) ORDER BY 1;
SELECT * FROM t1 WHERE x=6 AND y IN (6400,8100) ORDER BY 1;
SELECT * FROM t1 WHERE x IN (1,7) AND y NOT IN (6400,8100) ORDER BY 1;
SELECT * FROM t1 WHERE x IN (1,7) AND y IN (9,10) ORDER BY 1;
SELECT * FROM t1 WHERE x IN (1,7) AND y IN (9,16) ORDER BY 1;
CREATE TABLE t3(a,b,c);
CREATE INDEX t3a ON t3(a);
CREATE INDEX t3bc ON t3(b,c);
CREATE INDEX t3acb ON t3(a,c,b);
INSERT INTO t3 SELECT w, 101-w, y FROM t1;
SELECT count(*), sum(a), sum(b), sum(c) FROM t3;
ANALYZE;
SELECT * FROM t3 ORDER BY a LIMIT 3;
SELECT * FROM t3 ORDER BY a+1 LIMIT 3;
SELECT * FROM t3 WHERE a<10 ORDER BY a LIMIT 3;
SELECT * FROM t3 WHERE a>0 AND a<10 ORDER BY a LIMIT 3;
SELECT * FROM t3 WHERE a>0 ORDER BY a LIMIT 3;
SELECT * FROM t3 WHERE b>0 ORDER BY a LIMIT 10;
SELECT * FROM t3 WHERE b>0 ORDER BY a LIMIT 1;
SELECT * FROM t3 WHERE a IN (3,5,7,1,9,4,2) ORDER BY a LIMIT 3;
SELECT * FROM t3 WHERE a IN (3,5,7,1,9,4,2) ORDER BY a DESC LIMIT 3;
SELECT * FROM t3 WHERE a=1 AND c>0 ORDER BY a LIMIT 3;
SELECT * FROM t3 WHERE a>=1 AND a=1 AND c>0 ORDER BY a LIMIT 3;
SELECT * FROM t3 WHERE a<2 AND a=1 AND c>0 ORDER BY a LIMIT 3;
SELECT * FROM t3 WHERE a=1 AND c>0 ORDER BY a,c LIMIT 3;
SELECT * FROM t3 WHERE a=1 AND c>0 ORDER BY c LIMIT 3;
SELECT * FROM t3 WHERE a=1 AND c>0 ORDER BY a DESC LIMIT 3;
SELECT * FROM t3 WHERE a=1 AND c>0 ORDER BY a DESC, c DESC LIMIT 3;
SELECT * FROM t3 WHERE a=1 AND c>0 ORDER BY c DESC LIMIT 3;
SELECT * FROM t3 WHERE a=1 AND c>0 ORDER BY c,a LIMIT 3;
SELECT * FROM t3 WHERE a=1 AND c>0 ORDER BY a DESC, c ASC LIMIT 3;
SELECT * FROM t3 WHERE a=1 AND c>0 ORDER BY a ASC, c DESC LIMIT 3;
SELECT * FROM t3 WHERE a=1 AND c>0 ORDER BY a LIMIT 3;
SELECT * FROM t3 WHERE a=1 AND c>0 ORDER BY a,c LIMIT 3;
SELECT * FROM t3 WHERE a=1 AND c>0 ORDER BY a,c,b LIMIT 3;
SELECT * FROM t3 WHERE a>0 ORDER BY a DESC LIMIT 3;
SELECT * FROM t3 WHERE a>0 ORDER BY -a LIMIT 3;
SELECT * FROM t3 ORDER BY b LIMIT 3;
SELECT t3.a, t1.x FROM t3, t1 WHERE t3.a=t1.w ORDER BY t3.a LIMIT 3;
SELECT t3.a, t1.x FROM t3, t1 WHERE t3.a=t1.w ORDER BY t1.x, t3.a LIMIT 3;
SELECT y FROM t1 ORDER BY w LIMIT 3;
SELECT y FROM t1 ORDER BY rowid LIMIT 3;
SELECT y FROM t1 ORDER BY rowid, y LIMIT 3;
SELECT y FROM t1 ORDER BY rowid, y DESC LIMIT 3;
SELECT y FROM t1 WHERE y>4 ORDER BY rowid, w, x LIMIT 3;
SELECT y FROM t1 WHERE y>=9 ORDER BY rowid, x DESC, w LIMIT 3;
SELECT y FROM t1 WHERE y>4 AND y<25 ORDER BY rowid;
SELECT y FROM t1 WHERE y>=4 AND y<=25 ORDER BY oid;
SELECT y FROM t1 WHERE y<=25 ORDER BY _rowid_, w+y;
SELECT w FROM t1 WHERE x=3 ORDER BY y;
SELECT w FROM t1 WHERE x=3 ORDER BY y DESC;
SELECT w FROM t1 WHERE x=3 AND y>100 ORDER BY y LIMIT 3;
SELECT w FROM t1 WHERE x=3 AND y>100 ORDER BY y DESC LIMIT 3;
SELECT w FROM t1 WHERE x=3 AND y>121 ORDER BY y DESC;
SELECT w FROM t1 WHERE x=3 AND y>=121 ORDER BY y DESC;
SELECT w FROM t1 WHERE x=3 AND y>=121 AND y<196 ORDER BY y DESC;
SELECT w FROM t1 WHERE x=3 AND y>=121 AND y<=196 ORDER BY y DESC;
SELECT w FROM t1 WHERE x=3 AND y>121 AND y<=196 ORDER BY y DESC;
SELECT w FROM t1 WHERE x=3 AND y>100 AND y<196 ORDER BY y DESC;
SELECT w FROM t1 WHERE x=3 AND y>=121 AND y<196 ORDER BY y;
SELECT w FROM t1 WHERE x=3 AND y>=121 AND y<=196 ORDER BY y;
SELECT w FROM t1 WHERE x=3 AND y>121 AND y<=196 ORDER BY y;
SELECT w FROM t1 WHERE x=3 AND y>100 AND y<196 ORDER BY y;
SELECT w FROM t1 WHERE x=3 AND y<81 ORDER BY y;
SELECT w FROM t1 WHERE x=3 AND y<=81 ORDER BY y;
SELECT w FROM t1 WHERE x=3 AND y>256 ORDER BY y;
SELECT w FROM t1 WHERE x=3 AND y>=256 ORDER BY y;
SELECT w FROM t1 WHERE x=3 AND y<81 ORDER BY y DESC;
SELECT w FROM t1 WHERE x=3 AND y<=81 ORDER BY y DESC;
SELECT w FROM t1 WHERE x=3 AND y>256 ORDER BY y DESC;
SELECT w FROM t1 WHERE x=3 AND y>=256 ORDER BY y DESC;
SELECT w FROM t1 WHERE x=0 AND y<4 ORDER BY y;
SELECT w FROM t1 WHERE x=0 AND y<=4 ORDER BY y;
SELECT w FROM t1 WHERE x=6 AND y>10201 ORDER BY y;
SELECT w FROM t1 WHERE x=6 AND y>=10201 ORDER BY y;
SELECT w FROM t1 WHERE x=0 AND y<4 ORDER BY y DESC;
SELECT w FROM t1 WHERE x=0 AND y<=4 ORDER BY y DESC;
SELECT w FROM t1 WHERE x=6 AND y>10201 ORDER BY y DESC;
SELECT w FROM t1 WHERE x=6 AND y>=10201 ORDER BY y DESC;
SELECT y FROM t1 ORDER BY rowid DESC LIMIT 3;
SELECT y FROM t1 WHERE y<25 ORDER BY rowid DESC;
SELECT y FROM t1 WHERE y<=25 ORDER BY rowid DESC;
SELECT y FROM t1 WHERE y<25 AND y>4 ORDER BY rowid DESC, y DESC;
SELECT y FROM t1 WHERE y<25 AND y>=4 ORDER BY rowid DESC;
CREATE TABLE t4 AS SELECT * FROM t1;
CREATE INDEX i4xy ON t4(x,y);
SELECT w FROM t4 WHERE x=4 and y<1000 ORDER BY y DESC limit 3;
DELETE FROM t4;
SELECT w FROM t4 WHERE x=4 and y<1000 ORDER BY y DESC limit 3;
CREATE TABLE t5(x PRIMARY KEY);
SELECT * FROM t5 WHERE x<10;
SELECT * FROM t5 WHERE x<10 ORDER BY x DESC;
SELECT * FROM t5 WHERE x=10;
CREATE TABLE t99(Dte INT, X INT);
DELETE FROM t99 WHERE (Dte = 2451337) OR (Dte = 2451339) OR
     (Dte BETWEEN 2451345 AND 2451347) OR (Dte = 2451351) OR 
     (Dte BETWEEN 2451355 AND 2451356) OR (Dte = 2451358) OR
     (Dte = 2451362) OR (Dte = 2451365) OR (Dte = 2451367) OR
     (Dte BETWEEN 2451372 AND 2451376) OR (Dte BETWEEN 2451382 AND 2451384) OR
     (Dte = 2451387) OR (Dte BETWEEN 2451389 AND 2451391) OR 
     (Dte BETWEEN 2451393 AND 2451395) OR (Dte = 2451400) OR 
     (Dte = 2451402) OR (Dte = 2451404) OR (Dte BETWEEN 2451416 AND 2451418) OR 
     (Dte = 2451422) OR (Dte = 2451426) OR (Dte BETWEEN 2451445 AND 2451446) OR
     (Dte = 2451456) OR (Dte = 2451458) OR (Dte BETWEEN 2451465 AND 2451467) OR
     (Dte BETWEEN 2451469 AND 2451471) OR (Dte = 2451474) OR
     (Dte BETWEEN 2451477 AND 2451501) OR (Dte BETWEEN 2451503 AND 2451509) OR
     (Dte BETWEEN 2451511 AND 2451514) OR (Dte BETWEEN 2451518 AND 2451521) OR
     (Dte BETWEEN 2451523 AND 2451531) OR (Dte BETWEEN 2451533 AND 2451537) OR
     (Dte BETWEEN 2451539 AND 2451544) OR (Dte BETWEEN 2451546 AND 2451551) OR
     (Dte BETWEEN 2451553 AND 2451555) OR (Dte = 2451557) OR
     (Dte BETWEEN 2451559 AND 2451561) OR (Dte = 2451563) OR
     (Dte BETWEEN 2451565 AND 2451566) OR (Dte BETWEEN 2451569 AND 2451571) OR 
     (Dte = 2451573) OR (Dte = 2451575) OR (Dte = 2451577) OR (Dte = 2451581) OR
     (Dte BETWEEN 2451583 AND 2451586) OR (Dte BETWEEN 2451588 AND 2451592) OR 
     (Dte BETWEEN 2451596 AND 2451598) OR (Dte = 2451600) OR
     (Dte BETWEEN 2451602 AND 2451603) OR (Dte = 2451606) OR (Dte = 2451611);
CREATE TABLE t6(a INTEGER PRIMARY KEY, b TEXT);
INSERT INTO t6 VALUES(1,'one');
INSERT INTO t6 VALUES(4,'four');
CREATE INDEX t6i1 ON t6(b);
SELECT * FROM t6 ORDER BY b;
SELECT * FROM t6 ORDER BY b, a;
SELECT * FROM t6 ORDER BY a;
SELECT * FROM t6 ORDER BY a, b;
SELECT * FROM t6 ORDER BY b DESC;
SELECT * FROM t6 ORDER BY b DESC, a DESC;
SELECT * FROM t6 ORDER BY b DESC, a ASC;
SELECT * FROM t6 ORDER BY b ASC, a DESC;
SELECT * FROM t6 ORDER BY a DESC;
SELECT * FROM t6 ORDER BY a DESC, b DESC;
SELECT * FROM t6 ORDER BY a DESC, b ASC;
SELECT * FROM t6 ORDER BY a ASC, b DESC;
CREATE TABLE t7(a INTEGER PRIMARY KEY, b TEXT);
INSERT INTO t7 VALUES(1,'one');
INSERT INTO t7 VALUES(4,'four');
CREATE INDEX t7i1 ON t7(b);
SELECT * FROM t7 ORDER BY b;
SELECT * FROM t7 ORDER BY b, a;
SELECT * FROM t7 ORDER BY a;
SELECT * FROM t7 ORDER BY a, b;
SELECT * FROM t7 ORDER BY b DESC;
SELECT * FROM t7 ORDER BY b DESC, a DESC;
SELECT * FROM t7 ORDER BY b DESC, a ASC;
SELECT * FROM t7 ORDER BY b ASC, a DESC;
SELECT * FROM t7 ORDER BY a DESC;
SELECT * FROM t7 ORDER BY a DESC, b DESC;
SELECT * FROM t7 ORDER BY a DESC, b ASC;
SELECT * FROM t7 ORDER BY a ASC, b DESC;
CREATE TABLE t8(a INTEGER PRIMARY KEY, b TEXT UNIQUE, c CHAR(100));
INSERT INTO t8(a,b) VALUES(1,'one');
INSERT INTO t8(a,b) VALUES(4,'four');
SELECT x.a || '/' || y.a FROM t8 x, t8 y ORDER BY x.a, y.b;
SELECT x.a || '/' || y.a FROM t8 x, t8 y ORDER BY x.a, y.b DESC;
SELECT x.a || '/' || y.a FROM t8 x, t8 y ORDER BY x.a, x.b;
SELECT x.a || '/' || y.a FROM t8 x, t8 y ORDER BY x.a, x.b DESC;
SELECT x.a || '/' || y.a FROM t8 x, t8 y ORDER BY x.b, x.a||x.b;
SELECT x.a || '/' || y.a FROM t8 x, t8 y ORDER BY x.b, x.a||x.b DESC;
SELECT x.a || '/' || y.a FROM t8 x, t8 y ORDER BY x.b, y.a||y.b;
SELECT x.a || '/' || y.a FROM t8 x, t8 y ORDER BY x.b, x.a, y.a||y.b;
SELECT x.a || '/' || y.a FROM t8 x, t8 y ORDER BY x.b, x.a, x.a||x.b;
SELECT x.a || '/' || y.a FROM t8 x, t8 y ORDER BY x.b, y.a||y.b DESC;
SELECT x.a || '/' || y.a FROM t8 x, t8 y ORDER BY x.b, x.a||y.b;
SELECT x.a || '/' || y.a FROM t8 x, t8 y ORDER BY x.b, x.a||y.b DESC;
SELECT x.a || '/' || y.a FROM t8 x, t8 y ORDER BY x.b, y.a||x.b;
SELECT x.a || '/' || y.a FROM t8 x, t8 y ORDER BY x.b, y.a||x.b DESC;
CREATE TEMP TABLE t1 (a, b, c, d, e);
CREATE TEMP TABLE t2 (f);
SELECT t1.e AS alias FROM t2, t1 WHERE alias = 1;
CREATE TABLE a1(id INTEGER PRIMARY KEY, v);
CREATE TABLE a2(id INTEGER PRIMARY KEY, v);
INSERT INTO a1 VALUES(1, 'one');
INSERT INTO a1 VALUES(2, 'two');
INSERT INTO a2 VALUES(1, 'one');
INSERT INTO a2 VALUES(2, 'two');
SELECT * FROM a2 CROSS JOIN a1 WHERE a1.id=1 AND a1.v='one';
CREATE TEMP TABLE foo(idx INTEGER);
INSERT INTO foo VALUES(1);
INSERT INTO foo VALUES(1);
INSERT INTO foo VALUES(1);
INSERT INTO foo VALUES(2);
INSERT INTO foo VALUES(2);
CREATE TEMP TABLE bar(stuff INTEGER);
INSERT INTO bar VALUES(100);
INSERT INTO bar VALUES(200);
INSERT INTO bar VALUES(300);
SELECT bar.RowID id FROM foo, bar WHERE foo.idx = bar.RowID AND id = 2;
PRAGMA integrity_check;
CREATE TABLE tbooking (
      id INTEGER PRIMARY KEY,
      eventtype INTEGER NOT NULL
    );
INSERT INTO tbooking VALUES(42, 3);
INSERT INTO tbooking VALUES(43, 4);
SELECT a.id
    FROM tbooking AS a
    WHERE a.eventtype=3;
SELECT a.id, (SELECT b.id FROM tbooking AS b WHERE b.id>a.id)
    FROM tbooking AS a
    WHERE a.eventtype=3;
SELECT a.id, (SELECT b.id FROM tbooking AS b WHERE b.id>a.id)
    FROM (SELECT 1.5 AS id) AS a;
CREATE TABLE tother(a, b);
INSERT INTO tother VALUES(1, 3.7);
SELECT id, a FROM tbooking, tother WHERE id>a;
CREATE TABLE t181(a);
CREATE TABLE t182(b,c);
INSERT INTO t181 VALUES(1);
SELECT DISTINCT a FROM t181 LEFT JOIN t182 ON a=b ORDER BY c IS NULL;
SELECT DISTINCT a FROM t182 RIGHT JOIN t181 ON a=b ORDER BY c IS NULL;
SELECT DISTINCT a FROM t181 LEFT JOIN t182 ON a=b ORDER BY +c;
SELECT DISTINCT a FROM t181 LEFT JOIN t182 ON a=b ORDER BY c;
SELECT DISTINCT a FROM t182 RIGHT JOIN t181 ON a=b ORDER BY c;
INSERT INTO t181 VALUES(1),(1),(1),(1);
SELECT DISTINCT a FROM t181 LEFT JOIN t182 ON a=b ORDER BY +c;
SELECT DISTINCT a FROM t182 RIGHT JOIN t181 ON a=b ORDER BY +c;
INSERT INTO t181 VALUES(2);
SELECT DISTINCT a FROM t181 LEFT JOIN t182 ON a=b ORDER BY c IS NULL, +a;
INSERT INTO t181 VALUES(2);
SELECT DISTINCT a FROM t181 LEFT JOIN t182 ON a=b ORDER BY +a, +c IS NULL;
CREATE TABLE t191(a INT UNIQUE NOT NULL, b INT UNIQUE NOT NULL,c,d);
CREATE INDEX t191a ON t1(a);
CREATE INDEX t191b ON t1(b);
CREATE TABLE t192(x INTEGER PRIMARY KEY,y INT, z INT);
CREATE TABLE t201(x);
CREATE TABLE t202(y, z);
INSERT INTO t201 VALUES('key');
INSERT INTO t202 VALUES('key', -1);
CREATE INDEX t202i ON t202(y, ifnull(z, 0));
SELECT count(*) FROM t201 LEFT JOIN t202 ON (x=y) WHERE ifnull(z, 0) >=0;
CREATE TABLE t12(a, b, c);
CREATE TABLE t13(x);
CREATE INDEX t12ab ON t12(b, a);
CREATE INDEX t12ac ON t12(c, a);
INSERT INTO t12 VALUES(4, 0, 1);
INSERT INTO t12 VALUES(4, 1, 0);
INSERT INTO t12 VALUES(5, 0, 1);
INSERT INTO t12 VALUES(5, 1, 0);
INSERT INTO t13 VALUES(1), (2), (3), (4);
SELECT * FROM t12 WHERE 
  a = (SELECT * FROM (SELECT count(*) FROM t13 LIMIT 5) ORDER BY 1 LIMIT 10) 
  AND (b=1 OR c=1);
CREATE INDEX t1a ON t1(a);
INSERT INTO t1(a) VALUES(NULL),(NULL),(42),(NULL),(NULL);
SELECT count(*) FROM t1 LEFT JOIN t2 ON a IS NOT NULL;
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
BEGIN;
DELETE FROM t1;
BEGIN;
DELETE FROM t1;
BEGIN;
DELETE FROM t1;
BEGIN;
DELETE FROM t1;
BEGIN;
DELETE FROM t1;
BEGIN;
DELETE FROM t1;
BEGIN;
DELETE FROM t1;
BEGIN;
DELETE FROM t1;
BEGIN;
DELETE FROM t1;
BEGIN;
DELETE FROM t1;
INSERT INTO t1 VALUES(1, 'one', 'i');
INSERT INTO t1 VALUES(2, 'two', 'ii');
PRAGMA writable_schema = 1;
UPDATE sqlite_schema SET rootpage = (
    SELECT rootpage FROM sqlite_schema WHERE name = 'i2'
  ) WHERE name = 'i1';
INSERT INTO t1 VALUES(1, 'one', 'i');
INSERT INTO t1 VALUES(2, 'two', 'ii');
PRAGMA writable_schema = 1;
UPDATE sqlite_schema SET rootpage = (
    SELECT rootpage FROM sqlite_schema WHERE name = 'i2'
  ) WHERE name = 'i1';
CREATE TABLE t0(c0 INTEGER PRIMARY KEY, c1 TEXT);
INSERT INTO t0(c0, c1) VALUES (1, 'a');
SELECT * FROM t0 WHERE '-1' BETWEEN 0 AND t0.c0;
SELECT * FROM t0 WHERE '-1'>=0 AND '-1'<=t0.c0;
SELECT '-1' BETWEEN 0 AND t0.c0 FROM t0;
SELECT '-1'>=0 AND '-1'<=t0.c0 FROM t0;
SELECT * FROM t1;
SELECT DISTINCT 'xyz' FROM pragma_cache_size
      WHERE rowid OR abs(0)
      ORDER BY
      1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1;
