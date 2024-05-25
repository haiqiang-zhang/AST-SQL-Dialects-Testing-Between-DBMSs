SELECT t5.a,t5.b,t6.a,t6.b,t7.a,t7.b,t8.a,t8.b
  FROM t5 
       LEFT JOIN 
       ( 
         (t6, t7)
         LEFT JOIN 
         t8
         ON t7.b=t8.b AND t6.b < 10
       )
       ON t6.b >= 2 AND t5.b=t7.b AND
          (t8.a > 0 OR t8.c IS NULL);
SELECT t5.a,t5.b,t6.a,t6.b,t7.a,t7.b,t8.a,t8.b
  FROM t5 
       LEFT JOIN 
       ( 
         (t6, t7)
         LEFT JOIN 
         t8
         ON t7.b=t8.b AND t6.b < 10
       )
       ON t6.b >= 2 AND t5.b=t7.b AND
          (t8.a > 0 OR t8.c IS NULL);
DROP TABLE t5, t6, t7, t8;
CREATE TABLE t5 (a int, b int, c int, PRIMARY KEY(a), KEY b_i (b));
CREATE TABLE t6 (a int, b int, c int, PRIMARY KEY(a), KEY b_i (b));
CREATE TABLE t7 (a int, b int, c int, PRIMARY KEY(a), KEY b_i (b));
CREATE TABLE t8 (a int, b int, c int, PRIMARY KEY(a), KEY b_i (b));
INSERT INTO t5 VALUES (1,3,0), (3,2,0);
INSERT INTO t6 VALUES (3,3,0);
INSERT INTO t7 VALUES (1,2,0);
INSERT INTO t8 VALUES (1,1,0);
SELECT t5.a,t5.b,t6.a,t6.b,t7.a,t7.b,t8.a,t8.b
  FROM t5 LEFT JOIN                
       (t6 LEFT JOIN t7 ON t7.a=1, t8)
       ON (t5.b=t8.b);
SELECT t5.a,t5.b,t6.a,t6.b,t7.a,t7.b,t8.a,t8.b
  FROM t5 LEFT JOIN                
       (t6 LEFT JOIN t7 ON t7.a=1, t8)
       ON (t5.b=t8.b);
SELECT t5.a,t5.b,t6.a,t6.b,t7.a,t7.b,t8.a,t8.b
  FROM t5 LEFT JOIN                
       (t6 LEFT JOIN t7 ON t7.b=2, t8)
       ON (t5.b=t8.b);
SELECT t5.a,t5.b,t6.a,t6.b,t7.a,t7.b,t8.a,t8.b
  FROM t5 LEFT JOIN                
       (t6 LEFT JOIN t7 ON t7.b=2, t8)
       ON (t5.b=t8.b);
SELECT t5.a,t5.b,t6.a,t6.b,t7.a,t7.b,t8.a,t8.b
  FROM t5 LEFT JOIN                
       (t8, t6 LEFT JOIN t7 ON t7.a=1)
       ON (t5.b=t8.b);
SELECT t5.a,t5.b,t6.a,t6.b,t7.a,t7.b,t8.a,t8.b
  FROM t5 LEFT JOIN                
       (t8, t6 LEFT JOIN t7 ON t7.a=1)
       ON (t5.b=t8.b);
DROP TABLE t5,t6,t7,t8;
