CREATE TABLE t1(a, b);
INSERT INTO t1 VALUES('a', 'one');
INSERT INTO t1 VALUES('b', 'two');
INSERT INTO t1 VALUES('c', 'three');
CREATE TABLE t2(a, b);
INSERT INTO t2 VALUES('a', 'I');
INSERT INTO t2 VALUES('b', 'II');
INSERT INTO t2 VALUES('c', 'III');
CREATE TABLE t3(a, c);
INSERT INTO t3 VALUES('a', 1);
INSERT INTO t3 VALUES('b', 2);
CREATE TABLE t4(a, c);
INSERT INTO t4 VALUES('a', NULL);
INSERT INTO t4 VALUES('b', 2);
SELECT count(*) FROM t1 , t2 ON (t1.a=t2.a);
SELECT count(*) FROM t1 CROSS JOIN t2 ON (t1.a=t2.a);
SELECT count(*) FROM t1 INNER JOIN t2 ON (t1.a=t2.a);
SELECT count(*) FROM t1 , t2 USING (a);
SELECT count(*) FROM t1 CROSS JOIN t2 USING (a);
SELECT count(*) FROM t1 INNER JOIN t2 USING (a);
SELECT count(*) FROM t1 , t2;
SELECT count(*) FROM t1 CROSS JOIN t2;
SELECT count(*) FROM t1 INNER JOIN t2;
SELECT 1, 2, 3;
SELECT DISTINCT 1, 2, 3;
SELECT ALL 1, 2, 3;
SELECT a, b, a||b FROM t1;
SELECT DISTINCT a, b, a||b FROM t1;
SELECT ALL a, b, a||b FROM t1;
SELECT 1, 2, 3 WHERE 1;
SELECT 1, 2, 3 WHERE 0;
SELECT 1, 2, 3 WHERE NULL;
SELECT DISTINCT 1, 2, 3 WHERE 1;
SELECT ALL 1, 2, 3 WHERE 1;
SELECT a, b, a||b FROM t1 WHERE a!='x';
SELECT a, b, a||b FROM t1 WHERE a=='x';
SELECT DISTINCT a, b, a||b FROM t1 WHERE a!='x';
SELECT ALL a, b, a||b FROM t1 WHERE a=='x';
SELECT 1, 2, 3 GROUP BY 2;
SELECT 1, 2, 3 GROUP BY 2 HAVING count(*)=1;
SELECT 1, 2, 3 GROUP BY 2 HAVING count(*)>1;
SELECT DISTINCT 1, 2, 3 GROUP BY 2;
SELECT DISTINCT 1, 2, 3 GROUP BY 2 HAVING count(*)=1;
SELECT DISTINCT 1, 2, 3 GROUP BY 2 HAVING count(*)>1;
SELECT ALL 1, 2, 3 GROUP BY 2;
SELECT ALL 1, 2, 3 GROUP BY 2 HAVING count(*)=1;
SELECT ALL 1, 2, 3 GROUP BY 2 HAVING count(*)>1;
SELECT count(*), max(a) FROM t1 GROUP BY b;
SELECT count(*), max(a) FROM t1 GROUP BY b HAVING count(*)=1;
SELECT count(*), max(a) FROM t1 GROUP BY b HAVING count(*)=2;
SELECT DISTINCT count(*), max(a) FROM t1 GROUP BY b;
SELECT DISTINCT count(*), max(a) FROM t1 
           GROUP BY b HAVING count(*)=1;
SELECT DISTINCT count(*), max(a) FROM t1 
           GROUP BY b HAVING count(*)=2;
SELECT ALL count(*), max(a) FROM t1 GROUP BY b;
SELECT ALL count(*), max(a) FROM t1 
           GROUP BY b HAVING count(*)=1;
SELECT ALL count(*), max(a) FROM t1 
           GROUP BY b HAVING count(*)=2;
SELECT 1, 2, 3 WHERE 1 GROUP BY 2;
SELECT 1, 2, 3 WHERE 0 GROUP BY 2 HAVING count(*)=1;
SELECT 1, 2, 3 WHERE 0 GROUP BY 2 HAVING count(*)>1;
SELECT DISTINCT 1, 2, 3 WHERE 0 GROUP BY 2;
SELECT DISTINCT 1, 2, 3 WHERE 1 GROUP BY 2 HAVING count(*)=1;
SELECT DISTINCT 1, 2, 3 WHERE NULL GROUP BY 2 HAVING count(*)>1;
SELECT ALL 1, 2, 3 WHERE 1 GROUP BY 2;
SELECT ALL 1, 2, 3 WHERE 0 GROUP BY 2 HAVING count(*)=1;
SELECT ALL 1, 2, 3 WHERE 'abc' GROUP BY 2 HAVING count(*)>1;
SELECT count(*), max(a) FROM t1 WHERE a='a' GROUP BY b;
SELECT count(*), max(a) FROM t1 
           WHERE a='c' GROUP BY b HAVING count(*)=1;
SELECT count(*), max(a) FROM t1 
           WHERE 0 GROUP BY b HAVING count(*)=2;
SELECT DISTINCT count(*), max(a) FROM t1 WHERE a<'c' GROUP BY b;
SELECT DISTINCT count(*), max(a) FROM t1 WHERE a>'a'
           GROUP BY b HAVING count(*)=1;
SELECT DISTINCT count(*), max(a) FROM t1 WHERE 0
           GROUP BY b HAVING count(*)=2;
SELECT ALL count(*), max(a) FROM t1 WHERE b>'one' GROUP BY b;
SELECT ALL count(*), max(a) FROM t1 WHERE a!='b'
           GROUP BY b HAVING count(*)=1;
SELECT ALL count(*), max(a) FROM t1 
           WHERE 0 GROUP BY b HAVING count(*)=2;
SELECT * FROM t1;
SELECT t1.* FROM t1;
SELECT 'x'||a||'x' FROM t1;
SELECT 'x'||a||'x' alias FROM t1;
SELECT 'x'||a||'x' AS alias FROM t1;
SELECT t1.rowid FROM t1;
SELECT t1.rowid FROM t1,t2;
SELECT t1.rowid FROM t1,t2,t3;
SELECT t1.rowid FROM t1;
SELECT t1.rowid FROM t1 JOIN t2;
SELECT t1.rowid FROM t1 JOIN t2 JOIN t3;
SELECT t1.rowid FROM t1 NATURAL JOIN t3;
SELECT t1.rowid FROM t1 NATURAL LEFT OUTER JOIN t3;
SELECT t1.rowid FROM t1 NATURAL LEFT JOIN t3;
SELECT t1.rowid FROM t1 NATURAL INNER JOIN t3;
SELECT t1.rowid FROM t1 NATURAL CROSS JOIN t3;
SELECT t1.rowid FROM t1 JOIN t3;
SELECT t1.rowid FROM t1 LEFT OUTER JOIN t3;
SELECT t1.rowid FROM t1 LEFT JOIN t3;
SELECT t1.rowid FROM t1 INNER JOIN t3;
SELECT t1.rowid FROM t1 CROSS JOIN t3;
SELECT rowid FROM t1 UNION ALL SELECT rowid+2 FROM t4;
SELECT rowid FROM t1 UNION     SELECT rowid+2 FROM t4;
SELECT rowid FROM t1 INTERSECT SELECT rowid+2 FROM t4;
SELECT rowid FROM t1 EXCEPT    SELECT rowid+2 FROM t4;
SELECT b||a FROM t1 ORDER BY b||a;
SELECT b||a FROM t1 ORDER BY (b||a) COLLATE nocase;
SELECT b||a FROM t1 ORDER BY (b||a) ASC;
SELECT b||a FROM t1 ORDER BY (b||a) DESC;
SELECT * FROM t1;
SELECT * FROM t1 ORDER BY b;
SELECT * FROM t1 ORDER BY b, a;
SELECT * FROM t1 LIMIT 10;
SELECT * FROM t1 LIMIT 10 OFFSET 5;
SELECT * FROM t1 LIMIT 10, 5;
SELECT * FROM t1 ORDER BY a LIMIT 10;
SELECT * FROM t1 ORDER BY b LIMIT 10 OFFSET 5;
SELECT * FROM t1 ORDER BY a,b LIMIT 10, 5;
SELECT * FROM t1 UNION SELECT b, a FROM t1;
SELECT * FROM t1 UNION SELECT b, a FROM t1 ORDER BY b;
SELECT * FROM t1 UNION SELECT b, a FROM t1 ORDER BY b, a;
SELECT * FROM t1 UNION SELECT b, a FROM t1 LIMIT 10;
SELECT * FROM t1 UNION SELECT b, a FROM t1 LIMIT 10 OFFSET 5;
SELECT * FROM t1 UNION SELECT b, a FROM t1 LIMIT 10, 5;
SELECT * FROM t1 UNION SELECT b, a FROM t1 ORDER BY a LIMIT 10;
SELECT * FROM t1 UNION SELECT b, a FROM t1 ORDER BY b LIMIT 10 OFFSET 5;
SELECT * FROM t1 UNION SELECT b, a FROM t1 ORDER BY a,b LIMIT 10, 5;
SELECT 'abc';
SELECT 'abc' WHERE NULL;
SELECT NULL;
SELECT count(*);
SELECT count(*) WHERE 0;
SELECT count(*) WHERE 1;
CREATE TABLE xx(x, y);
INSERT INTO xx VALUES('IiJlsIPepMuAhU', X'10B00B897A15BAA02E3F98DCE8F2');
INSERT INTO xx VALUES(NULL, -16.87);
INSERT INTO xx VALUES(-17.89, 'linguistically');
SELECT quote(x), quote(y) FROM xx;
SELECT count(*), count(x), count(y) FROM xx;
SELECT sum(x), sum(y) FROM xx;
SELECT * FROM t1, t2, t3;
CREATE TABLE x1(a, b);
CREATE TABLE x2(c, d, e);
CREATE TABLE x3(f, g, h, i);
INSERT INTO x1 VALUES(24, 'converging');
INSERT INTO x1 VALUES(NULL, X'CB71');
INSERT INTO x1 VALUES('blonds', 'proprietary');
INSERT INTO x2 VALUES(-60.06, NULL, NULL);
INSERT INTO x2 VALUES(-58, NULL, 1.21);
INSERT INTO x3 VALUES(-39.24, NULL, 'encompass', -1);
INSERT INTO x3 VALUES('presenting', 51, 'reformation', 'dignified');
INSERT INTO x3 VALUES('conducting', -87.24, 37.56, NULL);
INSERT INTO x3 VALUES('coldest', -96, 'dramatists', 82.3);
INSERT INTO x3 VALUES('alerting', NULL, -93.79, NULL);
SELECT * FROM x1 , x2 LIMIT 1;
SELECT * FROM x1 CROSS JOIN x2 LIMIT 1;
SELECT * FROM x1 INNER JOIN x2 LIMIT 1;
SELECT * FROM x2 , x1 LIMIT 1;
SELECT * FROM x2 CROSS JOIN x1 LIMIT 1;
SELECT * FROM x2 INNER JOIN x1 LIMIT 1;
SELECT * FROM x3 , x2 LIMIT 1;
SELECT * FROM x3 CROSS JOIN x2 LIMIT 1;
SELECT * FROM x3 INNER JOIN x2 LIMIT 1;
SELECT * FROM x2 , x3 LIMIT 1;
SELECT * FROM x2 CROSS JOIN x3 LIMIT 1;
SELECT * FROM x2 INNER JOIN x3 LIMIT 1;
SELECT * FROM x2 , x3 ORDER BY +c, +f;
SELECT * FROM x2 CROSS JOIN x3 ORDER BY +c, +f;
SELECT * FROM x2 INNER JOIN x3 ORDER BY +c, +f;
SELECT count(*) FROM x1 , x2;
SELECT count(*) FROM x1 CROSS JOIN x2;
SELECT count(*) FROM x1 INNER JOIN x2;
SELECT * FROM x1, x2;
SELECT count(*) FROM x2 , x3;
SELECT count(*) FROM x2 CROSS JOIN x3;
SELECT count(*) FROM x2 INNER JOIN x3;
SELECT * FROM x2 JOIN x3;
SELECT count(*) FROM x3 , x1;
SELECT count(*) FROM x3 CROSS JOIN x1;
SELECT count(*) FROM x3 INNER JOIN x1;
SELECT * FROM x3 CROSS JOIN x1;
SELECT count(*) FROM x3 , x3;
SELECT count(*) FROM x3 CROSS JOIN x3;
SELECT count(*) FROM x3 INNER JOIN x3;
SELECT * FROM x3 INNER JOIN x3 AS x4;
SELECT * FROM t1, t2;
SELECT * FROM t1 AS x, t1 AS y;
SELECT * FROM t1 CROSS JOIN t2;
SELECT * FROM t1 AS y CROSS JOIN t1 AS x;
SELECT * FROM t1 INNER JOIN t2;
SELECT * FROM t1 AS y INNER JOIN t1 AS x;
SELECT * FROM t1 , t2 ON (1);
SELECT * FROM t1 CROSS JOIN t2 ON (1);
SELECT * FROM t1 INNER JOIN t2 ON (1);
SELECT * FROM t1 , t2 ON (0);
SELECT * FROM t1 CROSS JOIN t2 ON (0);
SELECT * FROM t1 INNER JOIN t2 ON (0);
SELECT * FROM t1 , t2 ON (NULL);
SELECT * FROM t1 CROSS JOIN t2 ON (NULL);
SELECT * FROM t1 INNER JOIN t2 ON (NULL);
SELECT * FROM t1 , t2 ON ('abc');
SELECT * FROM t1 CROSS JOIN t2 ON ('abc');
SELECT * FROM t1 INNER JOIN t2 ON ('abc');
SELECT * FROM t1 , t2 ON ('1ab');
SELECT * FROM t1 CROSS JOIN t2 ON ('1ab');
SELECT * FROM t1 INNER JOIN t2 ON ('1ab');
SELECT * FROM t1 , t2 ON (0.9);
SELECT * FROM t1 CROSS JOIN t2 ON (0.9);
SELECT * FROM t1 INNER JOIN t2 ON (0.9);
SELECT * FROM t1 , t2 ON ('0.9');
SELECT * FROM t1 CROSS JOIN t2 ON ('0.9');
SELECT * FROM t1 INNER JOIN t2 ON ('0.9');
SELECT * FROM t1 , t2 ON (0.0);
SELECT * FROM t1 CROSS JOIN t2 ON (0.0);
SELECT * FROM t1 INNER JOIN t2 ON (0.0);
SELECT t1.b, t2.b FROM t1 , t2 ON (t1.a = t2.a);
SELECT t1.b, t2.b FROM t1 CROSS JOIN t2 ON (t1.a = t2.a);
SELECT t1.b, t2.b FROM t1 INNER JOIN t2 ON (t1.a = t2.a);
SELECT t1.b, t2.b FROM t1 , t2 ON (t1.a = 'a');
SELECT t1.b, t2.b FROM t1 CROSS JOIN t2 ON (t1.a = 'a');
SELECT t1.b, t2.b FROM t1 INNER JOIN t2 ON (t1.a = 'a');
SELECT t1.b, t2.b 
        FROM t1 , t2 ON (CASE WHEN t1.a = 'a' THEN NULL ELSE 1 END);
SELECT t1.b, t2.b 
        FROM t1 CROSS JOIN t2 ON (CASE WHEN t1.a = 'a' THEN NULL ELSE 1 END);
SELECT t1.b, t2.b 
        FROM t1 INNER JOIN t2 ON (CASE WHEN t1.a = 'a' THEN NULL ELSE 1 END);
SELECT * FROM t1, t3 USING (a);
SELECT * FROM t3, t4 USING (a,c);
CREATE TABLE t5(a COLLATE nocase, b COLLATE binary);
INSERT INTO t5 VALUES('AA', 'cc');
INSERT INTO t5 VALUES('BB', 'dd');
INSERT INTO t5 VALUES(NULL, NULL);
CREATE TABLE t6(a COLLATE binary, b COLLATE nocase);
INSERT INTO t6 VALUES('aa', 'cc');
INSERT INTO t6 VALUES('bb', 'DD');
INSERT INTO t6 VALUES(NULL, NULL);
SELECT * FROM t5 , t6 USING (a);
SELECT * FROM t5 CROSS JOIN t6 USING (a);
SELECT * FROM t5 INNER JOIN t6 USING (a);
SELECT * FROM t6 , t5 USING (a);
SELECT * FROM t6 CROSS JOIN t5 USING (a);
SELECT * FROM t6 INNER JOIN t5 USING (a);
SELECT * FROM (SELECT a COLLATE nocase, b FROM t6) , t5 USING (a);
SELECT * FROM (SELECT a COLLATE nocase, b FROM t6) CROSS JOIN t5 USING (a);
SELECT * FROM (SELECT a COLLATE nocase, b FROM t6) INNER JOIN t5 USING (a);
SELECT * FROM t5 , t6 USING (a,b);
SELECT * FROM t5 CROSS JOIN t6 USING (a,b);
SELECT * FROM t5 INNER JOIN t6 USING (a,b);
SELECT * FROM t6 , t5 USING (a,b);
SELECT * FROM t6 CROSS JOIN t5 USING (a,b);
SELECT * FROM t6 INNER JOIN t5 USING (a,b);
SELECT * FROM t1 , t2 USING (a);
SELECT * FROM t1 CROSS JOIN t2 USING (a);
SELECT * FROM t1 INNER JOIN t2 USING (a);
SELECT * FROM t1 , t2 ON (t1.a=t2.a);
SELECT * FROM t1 CROSS JOIN t2 ON (t1.a=t2.a);
SELECT * FROM t1 INNER JOIN t2 ON (t1.a=t2.a);
SELECT * FROM t3 , t4 USING (a);
SELECT * FROM t3 CROSS JOIN t4 USING (a);
SELECT * FROM t3 INNER JOIN t4 USING (a);
SELECT * FROM t3 , t4 ON (t3.a=t4.a);
SELECT * FROM t3 CROSS JOIN t4 ON (t3.a=t4.a);
SELECT * FROM t3 INNER JOIN t4 ON (t3.a=t4.a);
SELECT * FROM t3 , t4 USING (a,c);
SELECT * FROM t3 CROSS JOIN t4 USING (a,c);
SELECT * FROM t3 INNER JOIN t4 USING (a,c);
SELECT * FROM t3 , t4 ON (t3.a=t4.a AND t3.c=t4.c);
SELECT * FROM t3 CROSS JOIN t4 ON (t3.a=t4.a AND t3.c=t4.c);
SELECT * FROM t3 INNER JOIN t4 ON (t3.a=t4.a AND t3.c=t4.c);
SELECT * FROM (SELECT a COLLATE nocase, b FROM t6) AS x 
       , t5 USING (a);
SELECT * FROM (SELECT a COLLATE nocase, b FROM t6) AS x 
       CROSS JOIN t5 USING (a);
SELECT * FROM (SELECT a COLLATE nocase, b FROM t6) AS x 
       INNER JOIN t5 USING (a);
SELECT * FROM (SELECT a COLLATE nocase, b FROM t6) AS x
       , t5 ON (x.a=t5.a);
SELECT * FROM (SELECT a COLLATE nocase, b FROM t6) AS x
       CROSS JOIN t5 ON (x.a=t5.a);
SELECT * FROM (SELECT a COLLATE nocase, b FROM t6) AS x
       INNER JOIN t5 ON (x.a=t5.a);
CREATE TABLE t7(a, b, c);
CREATE TABLE t8(a, d, e);
INSERT INTO t7 VALUES('x', 'ex',  24);
INSERT INTO t7 VALUES('y', 'why', 25);
INSERT INTO t8 VALUES('x', 'abc', 24);
INSERT INTO t8 VALUES('z', 'ghi', 26);
SELECT count(*) FROM t7 JOIN t8 ON (t7.a=t8.a);
SELECT count(*) FROM t7 LEFT JOIN t8 ON (t7.a=t8.a);
SELECT count(*) FROM t7 JOIN t8 USING (a);
SELECT count(*) FROM t7 LEFT JOIN t8 USING (a);
SELECT * FROM t7 JOIN t8 ON (t7.a=t8.a);
SELECT * FROM t7 LEFT JOIN t8 ON (t7.a=t8.a);
SELECT * FROM t7 JOIN t8 USING (a);
SELECT * FROM t7 LEFT JOIN t8 USING (a);
SELECT * FROM t7 JOIN t8 USING (a);
SELECT * FROM t7 NATURAL JOIN t8;
SELECT * FROM t8 JOIN t7 USING (a);
SELECT * FROM t8 NATURAL JOIN t7;
SELECT * FROM t7 LEFT JOIN t8 USING (a);
SELECT * FROM t7 NATURAL LEFT JOIN t8;
SELECT * FROM t8 LEFT JOIN t7 USING (a);
SELECT * FROM t8 NATURAL LEFT JOIN t7;
SELECT * FROM t3 JOIN t4 USING (a,c);
SELECT * FROM t3 NATURAL JOIN t4;
SELECT * FROM t3 LEFT JOIN t4 USING (a,c);
SELECT * FROM t3 NATURAL LEFT JOIN t4;
CREATE TABLE t10(x, y);
INSERT INTO t10 VALUES(1, 'true');
INSERT INTO t10 VALUES(0, 'false');
SELECT a, x FROM t1 CROSS JOIN t10;
SELECT a, x FROM t1 NATURAL CROSS JOIN t10;
PRAGMA foreign_keys = OFF;
DROP table "t1";
DROP table "t2";
DROP table "t3";
DROP table "t4";
DROP table "xx";
DROP table "x1";
DROP table "x2";
DROP table "x3";
DROP table "t5";
DROP table "t6";
DROP table "t7";
DROP table "t8";
DROP table "t10";
CREATE TABLE x1(k, x, y, z);
INSERT INTO x1 VALUES(1, 'relinquished', 'aphasia', 78.43);
INSERT INTO x1 VALUES(2, X'A8E8D66F',    X'07CF',   -81);
INSERT INTO x1 VALUES(3, -22,            -27.57,    NULL);
INSERT INTO x1 VALUES(4, NULL,           'bygone',  'picky');
INSERT INTO x1 VALUES(5, NULL,           96.28,     NULL);
INSERT INTO x1 VALUES(6, 0,              1,         2);
CREATE TABLE x2(k, x, y2);
INSERT INTO x2 VALUES(1, 50, X'B82838');
INSERT INTO x2 VALUES(5, 84.79, 65.88);
INSERT INTO x2 VALUES(3, -22, X'0E1BE452A393');
INSERT INTO x2 VALUES(7, 'mistrusted', 'standardized');
SELECT k FROM x1 WHERE x;
SELECT k FROM x1 WHERE y;
SELECT k FROM x1 WHERE z;
SELECT k FROM x1 WHERE '1'||z;
SELECT k FROM x1 WHERE x IS NULL;
SELECT k FROM x1 WHERE z - 78.43;
SELECT k FROM x1 LEFT JOIN x2 USING(k);
SELECT k FROM x1 LEFT JOIN x2 USING(k) WHERE x2.k ORDER BY +k;
SELECT k FROM x1 LEFT JOIN x2 USING(k) WHERE x2.k IS NULL;
SELECT k FROM x1 NATURAL JOIN x2 WHERE x2.k;
SELECT k FROM x1 NATURAL JOIN x2 WHERE x2.k-3;
PRAGMA foreign_keys = OFF;
DROP table "x1";
DROP table "x2";
CREATE TABLE z1(a, b, c);
CREATE TABLE z2(d, e);
CREATE TABLE z3(a, b);
INSERT INTO z1 VALUES(51.65, -59.58, 'belfries');
INSERT INTO z1 VALUES(-5, NULL, 75);
INSERT INTO z1 VALUES(-2.2, -23.18, 'suiters');
INSERT INTO z1 VALUES(NULL, 67, 'quartets');
INSERT INTO z1 VALUES(-1.04, -32.3, 'aspen');
INSERT INTO z1 VALUES(63, 'born', -26);
INSERT INTO z2 VALUES(NULL, 21);
INSERT INTO z2 VALUES(36, 6);
INSERT INTO z3 VALUES('subsistence', 'gauze');
INSERT INTO z3 VALUES(49.17, -67);
SELECT * FROM z1 LIMIT 1;
SELECT * FROM z1,z2 LIMIT 1;
SELECT z1.* FROM z1,z2 LIMIT 1;
SELECT z2.* FROM z1,z2 LIMIT 1;
SELECT z2.*, z1.* FROM z1,z2 LIMIT 1;
SELECT count(*), * FROM z1;
SELECT max(a), * FROM z1;
SELECT *, min(a) FROM z1;
SELECT *,* FROM z1,z2 LIMIT 1;
SELECT z1.*,z1.* FROM z2,z1 LIMIT 1;
SELECT a, b FROM z1;
SELECT a IS NULL, b+1, * FROM z1;
SELECT 32*32, d||e FROM z2;
SELECT count(a), max(a), count(b), max(b) FROM z1;
SELECT count(*), max(1);
SELECT sum(b+1) FROM z1 NATURAL LEFT JOIN z3;
SELECT sum(b+2) FROM z1 NATURAL LEFT JOIN z3;
SELECT sum(b IS NOT NULL) FROM z1 NATURAL LEFT JOIN z3;
PRAGMA foreign_keys = OFF;
DROP table "z1";
DROP table "z2";
DROP table "z3";
CREATE TABLE a1(one PRIMARY KEY, two);
INSERT INTO a1 VALUES(1, 1);
INSERT INTO a1 VALUES(2, 3);
INSERT INTO a1 VALUES(3, 6);
INSERT INTO a1 VALUES(4, 10);
CREATE TABLE a2(one PRIMARY KEY, three);
INSERT INTO a2 VALUES(1, 1);
INSERT INTO a2 VALUES(3, 2);
INSERT INTO a2 VALUES(6, 3);
INSERT INTO a2 VALUES(10, 4);
SELECT one, two, count(*) FROM a1;
SELECT one, two, count(*) FROM a1 WHERE one<3;
SELECT one, two, count(*) FROM a1 WHERE one>3;
SELECT *, count(*) FROM a1 JOIN a2;
SELECT *, sum(three) FROM a1 NATURAL JOIN a2;
SELECT *, sum(three) FROM a1 NATURAL JOIN a2;
SELECT string_agg(three, ''), a1.* FROM a1 NATURAL JOIN a2;
SELECT one, two, count(*) FROM a1 WHERE 0;
SELECT sum(two), * FROM a1, a2 WHERE three>5;
SELECT max(one) IS NULL, one IS NULL, two IS NULL FROM a1 WHERE two=7;
PRAGMA foreign_keys = OFF;
DROP table "a1";
DROP table "a2";
CREATE TABLE b1(one PRIMARY KEY, two);
INSERT INTO b1 VALUES(1, 'o');
INSERT INTO b1 VALUES(4, 'f');
INSERT INTO b1 VALUES(3, 't');
INSERT INTO b1 VALUES(2, 't');
INSERT INTO b1 VALUES(5, 'f');
INSERT INTO b1 VALUES(7, 's');
INSERT INTO b1 VALUES(6, 's');
CREATE TABLE b2(x, y);
INSERT INTO b2 VALUES(NULL, 0);
INSERT INTO b2 VALUES(NULL, 1);
INSERT INTO b2 VALUES('xyz', 2);
INSERT INTO b2 VALUES('abc', 3);
INSERT INTO b2 VALUES('xyz', 4);
CREATE TABLE b3(a COLLATE nocase, b COLLATE binary);
INSERT INTO b3 VALUES('abc', 'abc');
INSERT INTO b3 VALUES('aBC', 'aBC');
INSERT INTO b3 VALUES('Def', 'Def');
INSERT INTO b3 VALUES('dEF', 'dEF');
SELECT group_concat(one), two FROM b1 GROUP BY two;
SELECT group_concat(one), sum(one) FROM b1 GROUP BY (one>4);
SELECT group_concat(one) FROM b1 GROUP BY (two>'o'), one%2;
SELECT group_concat(one) FROM b1 GROUP BY (one==2 OR two=='o');
SELECT group_concat(y) FROM b2 GROUP BY x;
SELECT count(*) FROM b2 GROUP BY CASE WHEN y<4 THEN NULL ELSE 0 END;
SELECT count(*) FROM b3 GROUP BY b;
SELECT count(*) FROM b3 GROUP BY a;
SELECT count(*) FROM b3 GROUP BY +b;
SELECT count(*) FROM b3 GROUP BY +a;
SELECT count(*) FROM b3 GROUP BY b||'';
SELECT count(*) FROM b3 GROUP BY a||'';
CREATE TABLE c1(up, down);
INSERT INTO c1 VALUES('x', 1);
INSERT INTO c1 VALUES('x', 2);
INSERT INTO c1 VALUES('x', 4);
INSERT INTO c1 VALUES('x', 8);
INSERT INTO c1 VALUES('y', 16);
INSERT INTO c1 VALUES('y', 32);
CREATE TABLE c2(i, j);
INSERT INTO c2 VALUES(1, 0);
INSERT INTO c2 VALUES(2, 1);
INSERT INTO c2 VALUES(3, 3);
INSERT INTO c2 VALUES(4, 6);
INSERT INTO c2 VALUES(5, 10);
INSERT INTO c2 VALUES(6, 15);
INSERT INTO c2 VALUES(7, 21);
INSERT INTO c2 VALUES(8, 28);
INSERT INTO c2 VALUES(9, 36);
CREATE TABLE c3(i PRIMARY KEY, k TEXT);
INSERT INTO c3 VALUES(1,  'hydrogen');
INSERT INTO c3 VALUES(2,  'helium');
INSERT INTO c3 VALUES(3,  'lithium');
INSERT INTO c3 VALUES(4,  'beryllium');
INSERT INTO c3 VALUES(5,  'boron');
INSERT INTO c3 VALUES(94, 'plutonium');
SELECT up FROM c1 GROUP BY up HAVING count(*)>3;
SELECT up FROM c1 GROUP BY up HAVING sum(down)>16;
SELECT up FROM c1 GROUP BY up HAVING sum(down)<16;
SELECT up||down FROM c1 GROUP BY (down<5) HAVING max(down)<10;
SELECT up FROM c1 GROUP BY up HAVING down>10;
SELECT up FROM c1 GROUP BY up HAVING up='y';
SELECT i, j FROM c2 GROUP BY i>4 HAVING j>6;
SELECT sum(down) FROM c1 GROUP BY up;
SELECT sum(j), max(j) FROM c2 GROUP BY (i%3);
SELECT sum(j), max(j) FROM c2 GROUP BY (j%2);
SELECT 1+sum(j), max(j)+1 FROM c2 GROUP BY (j%2);
SELECT count(*), round(avg(i),2) FROM c1, c2 ON (i=down) GROUP BY j%2;
SELECT i, j FROM c2 GROUP BY i%2;
SELECT i, j FROM c2 GROUP BY i%2 HAVING j<30;
SELECT i, j FROM c2 GROUP BY i%2 HAVING j>30;
SELECT i, j FROM c2 GROUP BY i%2 HAVING j>30;
SELECT count(*), i, k FROM c2 NATURAL JOIN c3 GROUP BY substr(k, 1, 1);
PRAGMA foreign_keys = OFF;
DROP table "b1";
DROP table "b2";
DROP table "b3";
DROP table "c1";
DROP table "c2";
DROP table "c3";
CREATE TABLE h1(a, b);
INSERT INTO h1 VALUES(1, 'one');
INSERT INTO h1 VALUES(1, 'I');
INSERT INTO h1 VALUES(1, 'i');
INSERT INTO h1 VALUES(4, 'four');
INSERT INTO h1 VALUES(4, 'IV');
INSERT INTO h1 VALUES(4, 'iv');
CREATE TABLE h2(x COLLATE nocase);
INSERT INTO h2 VALUES('One');
INSERT INTO h2 VALUES('Two');
INSERT INTO h2 VALUES('Three');
INSERT INTO h2 VALUES('Four');
INSERT INTO h2 VALUES('one');
INSERT INTO h2 VALUES('two');
INSERT INTO h2 VALUES('three');
INSERT INTO h2 VALUES('four');
CREATE TABLE h3(c, d);
INSERT INTO h3 VALUES(1, NULL);
INSERT INTO h3 VALUES(2, NULL);
INSERT INTO h3 VALUES(3, NULL);
INSERT INTO h3 VALUES(4, '2');
INSERT INTO h3 VALUES(5, NULL);
INSERT INTO h3 VALUES(6, '2,3');
INSERT INTO h3 VALUES(7, NULL);
INSERT INTO h3 VALUES(8, '2,4');
INSERT INTO h3 VALUES(9, '3');
SELECT ALL a FROM h1;
SELECT DISTINCT a FROM h1;
SELECT ALL x FROM h2;
SELECT ALL x FROM h1, h2 ON (x=b);
SELECT x FROM h2;
SELECT x FROM h1, h2 ON (x=b);
SELECT DISTINCT x FROM h2;
SELECT DISTINCT x FROM h1, h2 ON (x=b);
SELECT DISTINCT d FROM h3;
SELECT DISTINCT b FROM h1;
SELECT DISTINCT b COLLATE nocase FROM h1;
SELECT DISTINCT x FROM h2;
SELECT DISTINCT x COLLATE binary FROM h2;
PRAGMA foreign_keys = OFF;
DROP table "h1";
DROP table "h2";
DROP table "h3";
CREATE TABLE j1(a, b, c);
CREATE TABLE j2(e, f);
CREATE TABLE j3(g);
SELECT * FROM j1 UNION ALL SELECT * FROM j2,j3 ORDER BY a;
SELECT count(*) FROM j1 UNION ALL SELECT max(e) FROM j2 ORDER BY 1;
SELECT count(*), * FROM j1 UNION ALL SELECT *,* FROM j2 ORDER BY 1,2,3;
SELECT * FROM j1 UNION ALL SELECT * FROM j2,j3 LIMIT 10;
SELECT * FROM j1 UNION ALL SELECT * FROM j2,j3 LIMIT 10 OFFSET 5;
SELECT a FROM j1 UNION ALL SELECT g FROM j2,j3 LIMIT (SELECT 10);
SELECT * FROM j1 UNION SELECT * FROM j2,j3 ORDER BY a;
SELECT count(*) FROM j1 UNION SELECT max(e) FROM j2 ORDER BY 1;
VALUES('8b') UNION SELECT max(e) FROM j2 ORDER BY 1;
SELECT count(*), * FROM j1 UNION SELECT *,* FROM j2 ORDER BY 1,2,3;
SELECT * FROM j1 UNION SELECT * FROM j2,j3 LIMIT 10;
SELECT * FROM j1 UNION SELECT * FROM j2,j3 LIMIT 10 OFFSET 5;
SELECT a FROM j1 UNION SELECT g FROM j2,j3 LIMIT (SELECT 10);
SELECT * FROM j1 EXCEPT SELECT * FROM j2,j3 ORDER BY a;
SELECT count(*) FROM j1 EXCEPT SELECT max(e) FROM j2 ORDER BY 1;
SELECT count(*), * FROM j1 EXCEPT SELECT *,* FROM j2 ORDER BY 1,2,3;
SELECT * FROM j1 EXCEPT SELECT * FROM j2,j3 LIMIT 10;
SELECT * FROM j1 EXCEPT SELECT * FROM j2,j3 LIMIT 10 OFFSET 5;
SELECT a FROM j1 EXCEPT SELECT g FROM j2,j3 LIMIT (SELECT 10);
SELECT * FROM j1 INTERSECT SELECT * FROM j2,j3 ORDER BY a;
SELECT count(*) FROM j1 INTERSECT SELECT max(e) FROM j2 ORDER BY 1;
SELECT count(*), * FROM j1 INTERSECT SELECT *,* FROM j2 ORDER BY 1,2,3;
SELECT * FROM j1 INTERSECT SELECT * FROM j2,j3 LIMIT 10;
SELECT * FROM j1 INTERSECT SELECT * FROM j2,j3 LIMIT 10 OFFSET 5;
SELECT a FROM j1 INTERSECT SELECT g FROM j2,j3 LIMIT (SELECT 10);
PRAGMA foreign_keys = OFF;
DROP table "j1";
DROP table "j2";
DROP table "j3";
CREATE TABLE q1(a TEXT, b INTEGER, c);
CREATE TABLE q2(d NUMBER, e BLOB);
CREATE TABLE q3(f REAL, g);
INSERT INTO q1 VALUES(16, -87.66, NULL);
INSERT INTO q1 VALUES('legible', 94, -42.47);
INSERT INTO q1 VALUES('beauty', 36, NULL);
INSERT INTO q2 VALUES('legible', 1);
INSERT INTO q2 VALUES('beauty', 2);
INSERT INTO q2 VALUES(-65.91, 4);
INSERT INTO q2 VALUES('emanating', -16.56);
INSERT INTO q3 VALUES('beauty', 2);
INSERT INTO q3 VALUES('beauty', 2);
SELECT a FROM q1 UNION ALL SELECT d FROM q2;
SELECT * FROM q1 WHERE a=16 UNION ALL SELECT 'x', * FROM q2 WHERE oid=1;
SELECT count(*) FROM q1 UNION ALL SELECT min(e) FROM q2;
SELECT * FROM q2 UNION ALL SELECT * FROM q3;
SELECT a FROM q1 UNION SELECT d FROM q2;
SELECT * FROM q1 WHERE a=16 UNION SELECT 'x', * FROM q2 WHERE oid=1;
SELECT count(*) FROM q1 UNION SELECT min(e) FROM q2;
SELECT * FROM q2 UNION SELECT * FROM q3;
SELECT a FROM q1 INTERSECT SELECT d FROM q2;
SELECT * FROM q2 INTERSECT SELECT * FROM q3;
SELECT a FROM q1 EXCEPT SELECT d FROM q2;
SELECT * FROM q2 EXCEPT SELECT * FROM q3;
SELECT * FROM q3;
SELECT * FROM q3 INTERSECT SELECT * FROM q3;
SELECT * FROM q3 EXCEPT SELECT a,b FROM q1;
SELECT NULL UNION ALL SELECT NULL;
SELECT NULL UNION     SELECT NULL;
SELECT NULL INTERSECT SELECT NULL;
SELECT NULL EXCEPT    SELECT NULL;
SELECT NULL UNION ALL SELECT 'ab';
SELECT NULL UNION     SELECT 'ab';
SELECT NULL INTERSECT SELECT 'ab';
SELECT NULL EXCEPT    SELECT 'ab';
SELECT NULL UNION ALL SELECT 0;
SELECT NULL UNION     SELECT 0;
SELECT NULL INTERSECT SELECT 0;
SELECT NULL EXCEPT    SELECT 0;
SELECT c FROM q1 UNION ALL SELECT g FROM q3;
SELECT c FROM q1 UNION     SELECT g FROM q3;
SELECT c FROM q1 INTERSECT SELECT g FROM q3;
SELECT c FROM q1 EXCEPT    SELECT g FROM q3;
PRAGMA foreign_keys = OFF;
DROP table "q1";
DROP table "q2";
DROP table "q3";
CREATE TABLE y1(a COLLATE nocase, b COLLATE binary, c);
INSERT INTO y1 VALUES('Abc', 'abc', 'aBC');
SELECT 'abc'                UNION SELECT 'ABC';
SELECT 'abc' COLLATE nocase UNION SELECT 'ABC';
SELECT 'abc'                UNION SELECT 'ABC' COLLATE nocase;
SELECT 'abc' COLLATE binary UNION SELECT 'ABC' COLLATE nocase;
SELECT 'abc' COLLATE nocase UNION SELECT 'ABC' COLLATE binary;
SELECT a FROM y1 UNION SELECT b FROM y1;
SELECT b FROM y1 UNION SELECT a FROM y1;
SELECT a FROM y1 UNION SELECT c FROM y1;
SELECT a FROM y1 UNION SELECT c COLLATE binary FROM y1;
PRAGMA foreign_keys = OFF;
DROP table "y1";
CREATE TABLE w1(a TEXT, b NUMBER);
CREATE TABLE w2(a, b TEXT);
INSERT INTO w1 VALUES('1', 4.1);
INSERT INTO w2 VALUES(1, 4.1);
SELECT a FROM w1 UNION SELECT a FROM w2;
SELECT a FROM w2 UNION SELECT a FROM w1;
SELECT b FROM w1 UNION SELECT b FROM w2;
SELECT b FROM w2 UNION SELECT b FROM w1;
SELECT a FROM w1 INTERSECT SELECT a FROM w2;
SELECT a FROM w2 INTERSECT SELECT a FROM w1;
SELECT b FROM w1 INTERSECT SELECT b FROM w2;
SELECT b FROM w2 INTERSECT SELECT b FROM w1;
SELECT a FROM w1 EXCEPT SELECT a FROM w2;
SELECT a FROM w2 EXCEPT SELECT a FROM w1;
SELECT b FROM w1 EXCEPT SELECT b FROM w2;
SELECT b FROM w2 EXCEPT SELECT b FROM w1;
PRAGMA foreign_keys = OFF;
DROP table "w1";
DROP table "w2";
CREATE TABLE t1(x);
INSERT INTO t1 VALUES(1);
INSERT INTO t1 VALUES(2);
INSERT INTO t1 VALUES(3);
SELECT x FROM t1 WHERE x IN (1,2) INTERSECT SELECT x FROM t1 WHERE x IN (1)   UNION     SELECT x FROM t1 WHERE x IN (3);
SELECT x FROM t1 WHERE x IN (3)   UNION     SELECT x FROM t1 WHERE x IN (1,2) INTERSECT SELECT x FROM t1 WHERE x IN (1);
SELECT x FROM t1 WHERE x IN (1,2) UNION     SELECT x FROM t1 WHERE x IN (3)   UNION ALL SELECT x FROM t1 WHERE x IN (1);
SELECT x FROM t1 WHERE x IN (1)   UNION ALL SELECT x FROM t1 WHERE x IN (3)   UNION     SELECT x FROM t1 WHERE x IN (1,2);
SELECT x FROM t1 WHERE x IN (1,2) UNION     SELECT x FROM t1 WHERE x IN (3)   EXCEPT    SELECT x FROM t1 WHERE x IN (1);
SELECT x FROM t1 WHERE x IN (1,2) EXCEPT    SELECT x FROM t1 WHERE x IN (3)   UNION     SELECT x FROM t1 WHERE x IN (1);
SELECT x FROM t1 WHERE x IN (1,2) INTERSECT SELECT x FROM t1 WHERE x IN (1)   UNION ALL SELECT x FROM t1 WHERE x IN (3);
SELECT x FROM t1 WHERE x IN (3)   UNION     SELECT x FROM t1 WHERE x IN (1,2) INTERSECT SELECT x FROM t1 WHERE x IN (1);
SELECT x FROM t1 WHERE x IN (1,2) INTERSECT SELECT x FROM t1 WHERE x IN (2)   EXCEPT    SELECT x FROM t1 WHERE x IN (2);
SELECT x FROM t1 WHERE x IN (2,3) EXCEPT    SELECT x FROM t1 WHERE x IN (2)   INTERSECT SELECT x FROM t1 WHERE x IN (2);
SELECT x FROM t1 WHERE x IN (2)   UNION ALL SELECT x FROM t1 WHERE x IN (2)   EXCEPT    SELECT x FROM t1 WHERE x IN (2);
SELECT x FROM t1 WHERE x IN (2)   EXCEPT    SELECT x FROM t1 WHERE x IN (2)   UNION ALL SELECT x FROM t1 WHERE x IN (2);
SELECT x FROM t1 WHERE x IN (2,3) EXCEPT    SELECT x FROM t1 WHERE x IN (2)   EXCEPT    SELECT x FROM t1 WHERE x IN (3);
PRAGMA foreign_keys = OFF;
DROP table "t1";
CREATE TABLE d1(x, y, z);
INSERT INTO d1 VALUES(1, 2, 3);
INSERT INTO d1 VALUES(2, 5, -1);
INSERT INTO d1 VALUES(1, 2, 8);
INSERT INTO d1 VALUES(1, 2, 7);
INSERT INTO d1 VALUES(2, 4, 93);
INSERT INTO d1 VALUES(1, 2, -20);
INSERT INTO d1 VALUES(1, 4, 93);
INSERT INTO d1 VALUES(1, 5, -1);
CREATE TABLE d2(a, b);
INSERT INTO d2 VALUES('gently', 'failings');
INSERT INTO d2 VALUES('commercials', 'bathrobe');
INSERT INTO d2 VALUES('iterate', 'sexton');
INSERT INTO d2 VALUES('babied', 'charitableness');
INSERT INTO d2 VALUES('solemnness', 'annexed');
INSERT INTO d2 VALUES('rejoicing', 'liabilities');
INSERT INTO d2 VALUES('pragmatist', 'guarded');
INSERT INTO d2 VALUES('barked', 'interrupted');
INSERT INTO d2 VALUES('reemphasizes', 'reply');
INSERT INTO d2 VALUES('lad', 'relenting');
SELECT * FROM d1 ORDER BY x, y, z;
SELECT * FROM d1 ORDER BY x ASC, y ASC, z ASC;
SELECT * FROM d1 ORDER BY x DESC, y DESC, z DESC;
SELECT * FROM d1 ORDER BY x DESC, y ASC, z DESC;
SELECT * FROM d1 ORDER BY x DESC, y ASC, z ASC;
SELECT * FROM d1 ORDER BY x, y, z;
SELECT * FROM d1 ORDER BY x DESC, y, z DESC;
SELECT * FROM d1 ORDER BY x DESC, y, z;
SELECT * FROM d1 ORDER BY 1 ASC, 2 ASC, 3 ASC;
SELECT * FROM d1 ORDER BY 1 DESC, 2 DESC, 3 DESC;
SELECT * FROM d1 ORDER BY 1 DESC, 2 ASC, 3 DESC;
SELECT * FROM d1 ORDER BY 1 DESC, 2 ASC, 3 ASC;
SELECT * FROM d1 ORDER BY 1, 2, 3;
SELECT * FROM d1 ORDER BY 1 DESC, 2, 3 DESC;
SELECT * FROM d1 ORDER BY 1 DESC, 2, 3;
SELECT z, x FROM d1 ORDER BY 2;
SELECT z, x FROM d1 ORDER BY 1;
SELECT z+1 AS abc FROM d1 ORDER BY abc;
SELECT z+1 AS abc FROM d1 ORDER BY abc DESC;
SELECT z AS x, x AS z FROM d1 ORDER BY z;
SELECT z AS x, x AS z FROM d1 ORDER BY x;
SELECT * FROM d1 ORDER BY x+y+z;
SELECT * FROM d1 ORDER BY x*z;
SELECT * FROM d1 ORDER BY y*z;
SELECT x*z FROM d1 UNION ALL SELECT a FROM d2 ORDER BY x*z;
SELECT x, x/z FROM d1 UNION ALL SELECT a,b FROM d2 ORDER BY x, x/z;
CREATE TABLE d3(a);
INSERT INTO d3 VALUES('text');
INSERT INTO d3 VALUES(14.1);
INSERT INTO d3 VALUES(13);
INSERT INTO d3 VALUES(X'78787878');
INSERT INTO d3 VALUES(15);
INSERT INTO d3 VALUES(12.9);
INSERT INTO d3 VALUES(null);
CREATE TABLE d4(x COLLATE nocase);
INSERT INTO d4 VALUES('abc');
INSERT INTO d4 VALUES('ghi');
INSERT INTO d4 VALUES('DEF');
INSERT INTO d4 VALUES('JKL');
SELECT a FROM d3 ORDER BY a;
SELECT a FROM d3 ORDER BY a DESC;
SELECT x FROM d4 ORDER BY 1 COLLATE binary;
SELECT x COLLATE binary FROM d4 ORDER BY 1 COLLATE nocase;
SELECT x COLLATE binary FROM d4 ORDER BY 1;
SELECT x COLLATE binary FROM d4 ORDER BY x;
SELECT x COLLATE binary AS x FROM d4 ORDER BY x;
SELECT x AS y FROM d4 ORDER BY y;
SELECT x||'' FROM d4 ORDER BY x;
SELECT x FROM d4 ORDER BY x||'';
CREATE TABLE d5(a, b);
CREATE TABLE d6(c, d);
CREATE TABLE d7(e, f);
INSERT INTO d5 VALUES(1, 'f');
INSERT INTO d6 VALUES(2, 'e');
INSERT INTO d7 VALUES(3, 'd');
INSERT INTO d5 VALUES(4, 'c');
INSERT INTO d6 VALUES(5, 'b');
INSERT INTO d7 VALUES(6, 'a');
CREATE TABLE d8(x COLLATE nocase);
CREATE TABLE d9(y COLLATE nocase);
INSERT INTO d8 VALUES('a');
INSERT INTO d9 VALUES('B');
INSERT INTO d8 VALUES('c');
INSERT INTO d9 VALUES('D');
SELECT a FROM d5 UNION ALL SELECT c FROM d6 UNION ALL SELECT e FROM d7
         ORDER BY a;
SELECT a FROM d5 UNION ALL SELECT c FROM d6 UNION ALL SELECT e FROM d7
         ORDER BY c;
SELECT a FROM d5 UNION ALL SELECT c FROM d6 UNION ALL SELECT e FROM d7
         ORDER BY e;
SELECT a FROM d5 UNION ALL SELECT c FROM d6 UNION ALL SELECT e FROM d7
         ORDER BY 1;
SELECT a, b FROM d5 UNION ALL SELECT b, a FROM d5 ORDER BY b;
SELECT a, b FROM d5 UNION ALL SELECT b, a FROM d5 ORDER BY 2;
SELECT a, b FROM d5 UNION ALL SELECT b, a FROM d5 ORDER BY a;
SELECT a, b FROM d5 UNION ALL SELECT b, a FROM d5 ORDER BY 1;
SELECT a, b FROM d5 UNION ALL SELECT b, a+1 FROM d5 ORDER BY a+1;
SELECT a, b FROM d5 UNION ALL SELECT b, a+1 FROM d5 ORDER BY 2;
SELECT a+1, b FROM d5 UNION ALL SELECT b, a+1 FROM d5 ORDER BY a+1;
SELECT a+1, b FROM d5 UNION ALL SELECT b, a+1 FROM d5 ORDER BY 1;
SELECT a, b FROM d5 UNION ALL SELECT c-1, d FROM d6 ORDER BY a, d;
SELECT a, b FROM d5 UNION ALL SELECT c-1, d FROM d6 ORDER BY c-1, b;
SELECT a, b FROM d5 UNION ALL SELECT c-1, d FROM d6 ORDER BY 1, 2;
CREATE TABLE f1(a, b);
INSERT INTO f1 VALUES(26, 'z');
INSERT INTO f1 VALUES(25, 'y');
INSERT INTO f1 VALUES(24, 'x');
INSERT INTO f1 VALUES(23, 'w');
INSERT INTO f1 VALUES(22, 'v');
INSERT INTO f1 VALUES(21, 'u');
INSERT INTO f1 VALUES(20, 't');
INSERT INTO f1 VALUES(19, 's');
INSERT INTO f1 VALUES(18, 'r');
INSERT INTO f1 VALUES(17, 'q');
INSERT INTO f1 VALUES(16, 'p');
INSERT INTO f1 VALUES(15, 'o');
INSERT INTO f1 VALUES(14, 'n');
INSERT INTO f1 VALUES(13, 'm');
INSERT INTO f1 VALUES(12, 'l');
INSERT INTO f1 VALUES(11, 'k');
INSERT INTO f1 VALUES(10, 'j');
INSERT INTO f1 VALUES(9, 'i');
INSERT INTO f1 VALUES(8, 'h');
INSERT INTO f1 VALUES(7, 'g');
INSERT INTO f1 VALUES(6, 'f');
INSERT INTO f1 VALUES(5, 'e');
INSERT INTO f1 VALUES(4, 'd');
INSERT INTO f1 VALUES(3, 'c');
INSERT INTO f1 VALUES(2, 'b');
INSERT INTO f1 VALUES(1, 'a');
SELECT b FROM f1 ORDER BY a LIMIT 5;
SELECT b FROM f1 ORDER BY a LIMIT 2+3;
SELECT b FROM f1 ORDER BY a LIMIT (SELECT a FROM f1 WHERE b = 'e');
SELECT b FROM f1 ORDER BY a LIMIT 5.0;
SELECT b FROM f1 ORDER BY a LIMIT '5';
SELECT b FROM f1 ORDER BY a LIMIT -1;
SELECT b FROM f1 ORDER BY a LIMIT length('abc')-100;
SELECT b FROM f1 ORDER BY a LIMIT (SELECT count(*) FROM f1)/2 - 14;
SELECT b FROM f1 ORDER BY a LIMIT 0;
SELECT b FROM f1 ORDER BY a DESC LIMIT 4;
SELECT b FROM f1 ORDER BY a DESC LIMIT 8;
SELECT b FROM f1 ORDER BY a DESC LIMIT '12.0';
SELECT b FROM f1 WHERE a>21 ORDER BY a LIMIT 10;
SELECT count(*) FROM f1 GROUP BY a/5 ORDER BY 1 LIMIT 10;
SELECT b FROM f1 ORDER BY a LIMIT 10 OFFSET 5;
SELECT b FROM f1 ORDER BY a LIMIT 2+3 OFFSET 10;
SELECT b FROM f1 ORDER BY a 
       LIMIT  (SELECT a FROM f1 WHERE b='j') 
       OFFSET (SELECT a FROM f1 WHERE b='b');
SELECT b FROM f1 ORDER BY a LIMIT '5' OFFSET 3.0;
SELECT b FROM f1 ORDER BY a LIMIT '5' OFFSET 0;
SELECT b FROM f1 ORDER BY a LIMIT 0 OFFSET 10;
SELECT b FROM f1 ORDER BY a LIMIT 3 OFFSET '1'||'5';
SELECT b FROM f1 ORDER BY a LIMIT 10 OFFSET 20;
SELECT a FROM f1 ORDER BY a DESC LIMIT 100 OFFSET 18+4;
SELECT b FROM f1 ORDER BY a LIMIT 5 OFFSET -1;
SELECT b FROM f1 ORDER BY a LIMIT 5 OFFSET -500;
SELECT b FROM f1 ORDER BY a LIMIT 5 OFFSET 0;
SELECT b FROM f1 ORDER BY a LIMIT 5, 10;
SELECT b FROM f1 ORDER BY a LIMIT 10, 2+3;
SELECT b FROM f1 ORDER BY a 
       LIMIT (SELECT a FROM f1 WHERE b='b'), (SELECT a FROM f1 WHERE b='j');
SELECT b FROM f1 ORDER BY a LIMIT 3.0, '5';
SELECT b FROM f1 ORDER BY a LIMIT 0, '5';
SELECT b FROM f1 ORDER BY a LIMIT 10, 0;
SELECT b FROM f1 ORDER BY a LIMIT '1'||'5', 3;
SELECT b FROM f1 ORDER BY a LIMIT 20, 10;
SELECT a FROM f1 ORDER BY a DESC LIMIT 18+4, 100;
SELECT b FROM f1 ORDER BY a LIMIT -1, 5;
SELECT b FROM f1 ORDER BY a LIMIT -500, 5;
SELECT b FROM f1 ORDER BY a LIMIT 0, 5;
