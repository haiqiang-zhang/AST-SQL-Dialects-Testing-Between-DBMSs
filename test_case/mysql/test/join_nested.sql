SELECT t2.a,t2.b
  FROM t2;
SELECT t3.a,t3.b
  FROM t3;
SELECT t4.a,t4.b
  FROM t4;
SELECT t3.a,t3.b,t4.a,t4.b
  FROM t3,t4;
SELECT t2.a,t2.b,t3.a,t3.b,t4.a,t4.b
  FROM t2
       LEFT JOIN              
       (t3, t4)
       ON t2.b=t4.b;
SELECT t2.a,t2.b,t34.a3,t34.b3,t34.a4,t34.b4
  FROM t2
       LEFT JOIN t34
       ON t2.b=t34.b4;
SELECT t2.a,t2.b,t3.a,t3.b,t4.a,t4.b
  FROM t2
       LEFT JOIN              
       (t3, t4)
       ON t3.a=1 AND t2.b=t4.b;
SELECT t2.a,t2.b,t34.a3,t34.b3,t34.a4,t34.b4
  FROM t2
       LEFT JOIN t34
       ON t34.a3=1 AND t2.b=t34.b4;
SELECT t2.a,t2.b,t3.a,t3.b,t4.a,t4.b
  FROM t2
       LEFT JOIN              
       (t3, t4)
       ON t2.b=t4.b
    WHERE t3.a=1 OR t3.c IS NULL;
SELECT t2.a,t2.b,t3.a,t3.b,t4.a,t4.b
  FROM t2
       LEFT JOIN              
       (t3, t4)
       ON t2.b=t4.b
    WHERE t3.a=1 OR t3.c IS NULL;
SELECT t2.a,t2.b,t34.a3,t34.b3,t34.a4,t34.b4
  FROM t2
       LEFT JOIN t34
       ON t2.b=t34.b4
    WHERE t34.a3=1 OR t34.c3 IS NULL;
SELECT t2.a,t2.b,t3.a,t3.b,t4.a,t4.b
  FROM t2
       LEFT JOIN              
       (t3, t4)
       ON t2.b=t4.b
    WHERE t3.a>1 OR t3.c IS NULL;
SELECT t2.a,t2.b,t34.a3,t34.b3,t34.a4,t34.b4
  FROM t2
       LEFT JOIN t34
       ON t2.b=t34.b4
    WHERE t34.a3>1 OR t34.c3 IS NULL;
SELECT t5.a,t5.b
  FROM t5;
SELECT t3.a,t3.b,t4.a,t4.b,t5.a,t5.b
  FROM t3,t4,t5;
SELECT t2.a,t2.b,t3.a,t3.b,t4.a,t4.b,t5.a,t5.b
  FROM t2
       LEFT JOIN              
       (t3, t4, t5)
       ON t2.b=t4.b;
SELECT t2.a,t2.b,t345.a3,t345.b3,t345.a4,t345.b4,t345.a5,t345.b5
  FROM t2
       LEFT JOIN t345
       ON t2.b=t345.b4;
SELECT t2.a,t2.b,t3.a,t3.b,t4.a,t4.b,t5.a,t5.b
  FROM t2
       LEFT JOIN              
       (t3, t4, t5)
       ON t2.b=t4.b
    WHERE t3.a>1 OR t3.c IS NULL;
SELECT t2.a,t2.b,t3.a,t3.b,t4.a,t4.b,t5.a,t5.b
  FROM t2
       LEFT JOIN              
       (t3, t4, t5)
       ON t2.b=t4.b
    WHERE t3.a>1 OR t3.c IS NULL;
SELECT t2.a,t2.b,t345.a3,t345.b3,t345.a4,t345.b4,t345.a5,t345.b5
  FROM t2
       LEFT JOIN t345
       ON t2.b=t345.b4
    WHERE t345.a3>1 OR t345.c3 IS NULL;
SELECT t2.a,t2.b,t3.a,t3.b,t4.a,t4.b,t5.a,t5.b
  FROM t2
       LEFT JOIN              
       (t3, t4, t5)
       ON t2.b=t4.b
    WHERE (t3.a>1 OR t3.c IS NULL) AND 
          (t5.a<3 OR t5.c IS NULL);
SELECT t2.a,t2.b,t3.a,t3.b,t4.a,t4.b,t5.a,t5.b
  FROM t2
       LEFT JOIN              
       (t3, t4, t5)
       ON t2.b=t4.b
    WHERE (t3.a>1 OR t3.c IS NULL) AND 
          (t5.a<3 OR t5.c IS NULL);
SELECT t2.a,t2.b,t345.a3,t345.b3,t345.a4,t345.b4,t345.a5,t345.b5
  FROM t2
       LEFT JOIN t345
       ON t2.b=t345.b4
    WHERE (t345.a3>1 OR t345.c3 IS NULL) AND 
          (t345.a5<3 OR t345.c5 IS NULL);
SELECT t6.a,t6.b
  FROM t6;
SELECT t7.a,t7.b
  FROM t7;
SELECT t6.a,t6.b,t7.a,t7.b
  FROM t6,t7;
SELECT t8.a,t8.b
  FROM t8;
SELECT t6.a,t6.b,t7.a,t7.b,t8.a,t8.b
  FROM (t6, t7)
       LEFT JOIN 
       t8
       ON t7.b=t8.b AND t6.b < 10;
SELECT t6.a,t6.b,t7.a,t7.b,t8.a,t8.b
  FROM (t6, t7)
       LEFT JOIN 
       t8
       ON t7.b=t8.b AND t6.b < 10;
SELECT t67.a6,t67.b6,t67.a7,t67.b7,t8.a,t8.b
  FROM t67
       LEFT JOIN 
       t8
       ON t67.b7=t8.b AND t67.b6 < 10;
SELECT t5.a,t5.b
  FROM t5;
SELECT t5.a,t5.b,t6.a,t6.b,t7.a,t7.b,t8.a,t8.b
  FROM t5 
       LEFT JOIN 
       ( 
         (t6, t7)
         LEFT JOIN 
         t8
         ON t7.b=t8.b AND t6.b < 10
       )
       ON t6.b >= 2 AND t5.b=t7.b;
SELECT t5.a,t5.b,t67.a6,t67.b6,t67.a7,t67.b7,t8.a,t8.b
  FROM t5 
       LEFT JOIN 
       ( 
         t67
         LEFT JOIN 
         t8
         ON t67.b7=t8.b AND t67.b6 < 10
       )
       ON t67.b6 >= 2 AND t5.b=t67.b7;
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
          (t8.a < 1 OR t8.c IS NULL);
SELECT t5.a,t5.b,t67.a6,t67.b6,t67.a7,t67.b7,t8.a,t8.b
  FROM t5 
       LEFT JOIN 
       ( 
         t67
         LEFT JOIN 
         t8
         ON t67.b7=t8.b AND t67.b6 < 10
       )
       ON t67.b6 >= 2 AND t5.b=t67.b7 AND
          (t8.a < 1 OR t8.c IS NULL);
SELECT t2.a,t2.b,t3.a,t3.b,t4.a,t4.b
  FROM t2
       LEFT JOIN              
       (t3, t4)
       ON t3.a=1 AND t2.b=t4.b;
SELECT t2.a,t2.b,t34.a3,t34.b3,t34.a4,t34.b4
  FROM t2
       LEFT JOIN t34
       ON t34.a3=1 AND t2.b=t34.b4;
SELECT t2.a,t2.b,t3.a,t3.b,t4.a,t4.b,
       t5.a,t5.b,t6.a,t6.b,t7.a,t7.b,t8.a,t8.b
  FROM t2
       LEFT JOIN              
       (t3, t4)
       ON t3.a=1 AND t2.b=t4.b,
       t5 
       LEFT JOIN 
       ( 
         (t6, t7)
         LEFT JOIN 
         t8
         ON t7.b=t8.b AND t6.b < 10
       )
       ON t6.b >= 2 AND t5.b=t7.b;
SELECT t2.a,t2.b,t34.a3,t34.b3,t34.a4,t34.b4,
       t5.a,t5.b,t67.a6,t67.b6,t67.a7,t67.b7,t8.a,t8.b
  FROM t2
       LEFT JOIN t34
       ON t34.a3=1 AND t2.b=t34.b4
       CROSS JOIN t5 
       LEFT JOIN 
       ( 
         t67
         LEFT JOIN 
         t8
         ON t67.b7=t8.b AND t67.b6 < 10
       )
       ON t67.b6 >= 2 AND t5.b=t67.b7;
SELECT t2.a,t2.b,t3.a,t3.b,t4.a,t4.b,
       t5.a,t5.b,t6.a,t6.b,t7.a,t7.b,t8.a,t8.b
  FROM t2
       LEFT JOIN              
       (t3, t4)
       ON t3.a=1 AND t2.b=t4.b,
       t5 
       LEFT JOIN 
       ( 
         (t6, t7)
         LEFT JOIN 
         t8
         ON t7.b=t8.b AND t6.b < 10
       )
       ON t6.b >= 2 AND t5.b=t7.b
    WHERE t2.a > 3 AND
          (t6.a < 6 OR t6.c IS NULL);
SELECT t2.a,t2.b,t34.a3,t34.b3,t34.a4,t34.b4,
       t5.a,t5.b,t67.a6,t67.b6,t67.a7,t67.b7,t8.a,t8.b
  FROM t2
       LEFT JOIN t34
       ON t34.a3=1 AND t2.b=t34.b4
       CROSS JOIN t5 
       LEFT JOIN 
       ( 
         t67
         LEFT JOIN 
         t8
         ON t67.b7=t8.b AND t67.b6 < 10
       )
       ON t67.b6 >= 2 AND t5.b=t67.b7
    WHERE t2.a > 3 AND
          (t67.a6 < 6 OR t67.c6 IS NULL);
SELECT t1.a,t1.b
  FROM t1;
SELECT t1.a,t1.b,t2.a,t2.b,t3.a,t3.b,t4.a,t4.b,
       t5.a,t5.b,t6.a,t6.b,t7.a,t7.b,t8.a,t8.b
  FROM t1
       LEFT JOIN                
       ( 
         t2
         LEFT JOIN              
         (t3, t4)
         ON t3.a=1 AND t2.b=t4.b,
         t5 
         LEFT JOIN 
         ( 
           (t6, t7)
           LEFT JOIN 
           t8
           ON t7.b=t8.b AND t6.b < 10
         )
         ON t6.b >= 2 AND t5.b=t7.b 
       )
       ON (t3.b=2 OR t3.c IS NULL) AND (t6.b=2 OR t6.c IS NULL) AND
          (t1.b=t5.b OR t3.c IS NULL OR t6.c IS NULL or t8.c IS NULL) AND
          (t1.a != 2);
SELECT t1.a,t1.b,t2.a,t2.b,t34.a3,t34.b3,t34.a4,t34.b4,
       t5.a,t5.b,t67.a6,t67.b6,t67.a7,t67.b7,t8.a,t8.b
  FROM t1
       LEFT JOIN                
       ( 
         t2
         LEFT JOIN t34
         ON t34.a3=1 AND t2.b=t34.b4
         CROSS JOIN t5 
         LEFT JOIN 
         ( 
           t67
           LEFT JOIN 
           t8
           ON t67.b7=t8.b AND t67.b6 < 10
         )
         ON t67.b6 >= 2 AND t5.b=t67.b7 
       )
       ON (t34.b3=2 OR t34.c3 IS NULL) AND (t67.b6=2 OR t67.c6 IS NULL) AND
          (t1.b=t5.b OR t34.c3 IS NULL OR t67.c6 IS NULL or t8.c IS NULL) AND
          (t1.a <> 2);
SELECT t1.a,t1.b,t2.a,t2.b,t3.a,t3.b,t4.a,t4.b,
       t5.a,t5.b,t6.a,t6.b,t7.a,t7.b,t8.a,t8.b
  FROM t1
       LEFT JOIN                
       ( 
         t2
         LEFT JOIN              
         (t3, t4)
         ON t3.a=1 AND t2.b=t4.b,
         t5 
         LEFT JOIN 
         ( 
           (t6, t7)
           LEFT JOIN 
           t8
           ON t7.b=t8.b AND t6.b < 10
         )
         ON t6.b >= 2 AND t5.b=t7.b 
       )
       ON (t3.b=2 OR t3.c IS NULL) AND (t6.b=2 OR t6.c IS NULL) AND
          (t1.b=t5.b OR t3.c IS NULL OR t6.c IS NULL or t8.c IS NULL) AND
          (t1.a != 2)
    WHERE (t2.a >= 4 OR t2.c IS NULL);
SELECT t1.a,t1.b,t2.a,t2.b,t34.a3,t34.b3,t34.a4,t34.b4,
       t5.a,t5.b,t67.a6,t67.b6,t67.a7,t67.b7,t8.a,t8.b
  FROM t1
       LEFT JOIN                
       ( 
         t2
         LEFT JOIN t34
         ON t34.a3=1 AND t2.b=t34.b4
         CROSS JOIN t5 
         LEFT JOIN 
         ( 
           t67
           LEFT JOIN 
           t8
           ON t67.b7=t8.b AND t67.b6 < 10
         )
         ON t67.b6 >= 2 AND t5.b=t67.b7 
       )
       ON (t34.b3=2 OR t34.c3 IS NULL) AND (t67.b6=2 OR t67.c6 IS NULL) AND
          (t1.b=t5.b OR t34.c3 IS NULL OR t67.c6 IS NULL or t8.c IS NULL) AND
          (t1.a <> 2)
    WHERE (t2.a >= 4 OR t2.c IS NULL);
SELECT t0.a,t0.b
  FROM t0;
SELECT t0.a,t0.b,t1.a,t1.b,t2.a,t2.b,t3.a,t3.b,t4.a,t4.b,
       t5.a,t5.b,t6.a,t6.b,t7.a,t7.b,t8.a,t8.b
  FROM t0,t1
       LEFT JOIN                
       ( 
         t2
         LEFT JOIN              
         (t3, t4)
         ON t3.a=1 AND t2.b=t4.b,
         t5 
         LEFT JOIN 
         ( 
           (t6, t7)
           LEFT JOIN 
           t8
           ON t7.b=t8.b AND t6.b < 10
         )
         ON t6.b >= 2 AND t5.b=t7.b 
       )
       ON (t3.b=2 OR t3.c IS NULL) AND (t6.b=2 OR t6.c IS NULL) AND
          (t1.b=t5.b OR t3.c IS NULL OR t6.c IS NULL or t8.c IS NULL) AND
          (t1.a != 2)
    WHERE t0.a=1 AND
          t0.b=t1.b AND          
          (t2.a >= 4 OR t2.c IS NULL);
SELECT t0.a,t0.b,t1.a,t1.b,t2.a,t2.b,t3.a,t3.b,t4.a,t4.b,
       t5.a,t5.b,t6.a,t6.b,t7.a,t7.b,t8.a,t8.b
  FROM t0,t1
       LEFT JOIN                
       ( 
         t2
         LEFT JOIN              
         (t3, t4)
         ON t3.a=1 AND t2.b=t4.b,
         t5 
         LEFT JOIN 
         ( 
           (t6, t7)
           LEFT JOIN 
           t8
           ON t7.b=t8.b AND t6.b < 10
         )
         ON t6.b >= 2 AND t5.b=t7.b 
       )
       ON (t3.b=2 OR t3.c IS NULL) AND (t6.b=2 OR t6.c IS NULL) AND
          (t1.b=t5.b OR t3.c IS NULL OR t6.c IS NULL or t8.c IS NULL) AND
          (t1.a != 2)
    WHERE t0.a=1 AND
          t0.b=t1.b AND          
          (t2.a >= 4 OR t2.c IS NULL);
SELECT t0.a,t0.b,t1.a,t1.b,t2.a,t2.b,t34.a3,t34.b3,t34.a4,t34.b4,
       t5.a,t5.b,t67.a6,t67.b6,t67.a7,t67.b7,t8.a,t8.b
  FROM t0
       CROSS JOIN t1
       LEFT JOIN                
       ( 
         t2
         LEFT JOIN t34
         ON t34.a3=1 AND t2.b=t34.b4
         CROSS JOIN t5 
         LEFT JOIN 
         ( 
           t67
           LEFT JOIN 
           t8
           ON t67.b7=t8.b AND t67.b6 < 10
         )
         ON t67.b6 >= 2 AND t5.b=t67.b7 
       )
       ON (t34.b3=2 OR t34.c3 IS NULL) AND (t67.b6=2 OR t67.c6 IS NULL) AND
          (t1.b=t5.b OR t34.c3 IS NULL OR t67.c6 IS NULL or t8.c IS NULL) AND
          (t1.a <> 2)
    WHERE t0.a=1 AND
          t0.b=t1.b AND          
          (t2.a >= 4 OR t2.c IS NULL);
SELECT t0.a,t0.b,t1.a,t1.b,t2.a,t2.b,t3.a,t3.b,t4.a,t4.b,
       t5.a,t5.b,t6.a,t6.b,t7.a,t7.b,t8.a,t8.b,t9.a,t9.b
  FROM t0,t1
       LEFT JOIN                
       ( 
         t2
         LEFT JOIN              
         (t3, t4)
         ON t3.a=1 AND t2.b=t4.b,
         t5 
         LEFT JOIN 
         ( 
           (t6, t7)
           LEFT JOIN 
           t8
           ON t7.b=t8.b AND t6.b < 10
         )
         ON t6.b >= 2 AND t5.b=t7.b 
       )
       ON (t3.b=2 OR t3.c IS NULL) AND (t6.b=2 OR t6.c IS NULL) AND
          (t1.b=t5.b OR t3.c IS NULL OR t6.c IS NULL or t8.c IS NULL) AND
          (t1.a != 2),
       t9
     WHERE t0.a=1 AND
           t0.b=t1.b AND          
           (t2.a >= 4 OR t2.c IS NULL) AND
           (t3.a < 5 OR t3.c IS NULL) AND
           (t3.b=t4.b OR t3.c IS NULL OR t4.c IS NULL) AND
           (t5.a >=2 OR t5.c IS NULL) AND
           (t6.a >=4 OR t6.c IS NULL) AND
           (t7.a <= 2 OR t7.c IS NULL) AND
           (t8.a < 1 OR t8.c IS NULL) AND
           (t8.b=t9.b OR t8.c IS NULL) AND
           (t9.a=1);
SELECT t9.a,t9.b
  FROM t9;
SELECT t0.a,t0.b,t1.a,t1.b,t2.a,t2.b,t3.a,t3.b,t4.a,t4.b,
       t5.a,t5.b,t6.a,t6.b,t7.a,t7.b,t8.a,t8.b,t9.a,t9.b
  FROM t0,t1
       LEFT JOIN                
       ( 
         t2
         LEFT JOIN              
         (t3, t4)
         ON t3.a=1 AND t2.b=t4.b,
         t5 
         LEFT JOIN 
         ( 
           (t6, t7)
           LEFT JOIN 
           t8
           ON t7.b=t8.b AND t6.b < 10
         )
         ON t6.b >= 2 AND t5.b=t7.b 
       )
       ON (t3.b=2 OR t3.c IS NULL) AND (t6.b=2 OR t6.c IS NULL) AND
          (t1.b=t5.b OR t3.c IS NULL OR t6.c IS NULL or t8.c IS NULL) AND
          (t1.a != 2),
       t9
     WHERE t0.a=1 AND
           t0.b=t1.b AND          
           (t2.a >= 4 OR t2.c IS NULL) AND
           (t3.a < 5 OR t3.c IS NULL) AND
           (t3.b=t4.b OR t3.c IS NULL OR t4.c IS NULL) AND
           (t5.a >=2 OR t5.c IS NULL) AND
           (t6.a >=4 OR t6.c IS NULL) AND
           (t7.a <= 2 OR t7.c IS NULL) AND
           (t8.a < 1 OR t8.c IS NULL) AND
           (t8.b=t9.b OR t8.c IS NULL) AND
           (t9.a=1);
SELECT t0.a,t0.b,t1.a,t1.b,t2.a,t2.b,t34.a3,t34.b3,t34.a4,t34.b4,
       t5.a,t5.b,t67.a6,t67.b6,t67.a7,t67.b7,t8.a,t8.b,t9.a,t9.b
  FROM t0
       CROSS JOIN t1
       LEFT JOIN                
       ( 
         t2
         LEFT JOIN t34
         ON t34.a3=1 AND t2.b=t34.b4
         CROSS JOIN t5 
         LEFT JOIN 
         ( 
           t67
           LEFT JOIN 
           t8
           ON t67.b7=t8.b AND t67.b6 < 10
         )
         ON t67.b6 >= 2 AND t5.b=t67.b7 
       )
       ON (t34.b3=2 OR t34.c3 IS NULL) AND (t67.b6=2 OR t67.c6 IS NULL) AND
          (t1.b=t5.b OR t34.c3 IS NULL OR t67.c6 IS NULL or t8.c IS NULL) AND
          (t1.a <> 2),
       t9
     WHERE t0.a=1 AND
           t0.b=t1.b AND          
           (t2.a >= 4 OR t2.c IS NULL) AND
           (t34.a3 < 5 OR t34.c3 IS NULL) AND
           (t34.b3=t34.b4 OR t34.c3 IS NULL OR t34.c4 IS NULL) AND
           (t5.a >=2 OR t5.c IS NULL) AND
           (t67.a6 >=4 OR t67.c6 IS NULL) AND
           (t67.a7 <= 2 OR t67.c7 IS NULL) AND
           (t8.a < 1 OR t8.c IS NULL) AND
           (t8.b=t9.b OR t8.c IS NULL) AND
           (t9.a=1);
SELECT t1.a,t1.b
  FROM t1;
SELECT t2.a,t2.b
  FROM t2;
SELECT t3.a,t3.b
  FROM t3;
SELECT t2.a,t2.b,t3.a,t3.b
  FROM t2 
       LEFT JOIN              
       t3
       ON t2.b=t3.b;
SELECT t1.a,t1.b,t2.a,t2.b,t3.a,t3.b
  FROM t1, t2 
       LEFT JOIN              
       t3
       ON t2.b=t3.b
    WHERE t1.a <= 2;
SELECT t1.a,t1.b,t2.a,t2.b,t3.a,t3.b
  FROM t1
       CROSS JOIN t2
       LEFT JOIN              
       t3
       ON t2.b=t3.b
    WHERE t1.a <= 2;
SELECT t1.a,t1.b,t2.a,t2.b,t3.a,t3.b
  FROM t1, t3 
       RIGHT JOIN              
       t2
       ON t2.b=t3.b
    WHERE t1.a <= 2;
SELECT t1.a,t1.b,t2.a,t2.b,t3.a,t3.b
  FROM t1 CROSS JOIN
       (
         t3
         RIGHT JOIN              
         t2
         ON t2.b=t3.b
       )
    WHERE t1.a <= 2;
SELECT t3.a,t3.b,t4.a,t4.b
  FROM t3,t4;
SELECT t2.a,t2.b,t3.a,t3.b,t4.a,t4.b
  FROM t2 
       LEFT JOIN              
       (t3, t4)
       ON t3.a=1 AND t2.b=t4.b;
SELECT t2.a,t2.b,t3.a,t3.b,t4.a,t4.b
  FROM t2
       LEFT JOIN              
       (t3 CROSS JOIN t4)
       ON t3.a=1 AND t2.b=t4.b;
SELECT t1.a,t1.b,t2.a,t2.b,t3.a,t3.b,t4.a,t4.b
  FROM t1 CROSS JOIN
       (
         t2 
         LEFT JOIN              
         (t3, t4)
         ON t3.a=1 AND t2.b=t4.b
       )
    WHERE t1.a <= 2;
SELECT t1.a,t1.b,t2.a,t2.b,t3.a,t3.b,t4.a,t4.b
  FROM t1 CROSS JOIN
       (
         t2
         LEFT JOIN              
         (t3 CROSS JOIN t4)
         ON t3.a=1 AND t2.b=t4.b
       )
    WHERE t1.a <= 2;
SELECT t1.a,t1.b,t2.a,t2.b,t3.a,t3.b,t4.a,t4.b
  FROM t1, (t3, t4) 
       RIGHT JOIN              
       t2
       ON t3.a=1 AND t2.b=t4.b
    WHERE t1.a <= 2;
SELECT t1.a,t1.b,t2.a,t2.b,t3.a,t3.b,t4.a,t4.b
  FROM t1 CROSS JOIN
       (
         (t3 CROSS JOIN t4)
         RIGHT JOIN              
         t2
         ON t3.a=1 AND t2.b=t4.b
       )
    WHERE t1.a <= 2;
SELECT t1.a,t1.b,t2.a,t2.b,t3.a,t3.b,t4.a,t4.b
  FROM t1, (t3, t4)
       RIGHT JOIN              
       t2
       ON t3.a=1 AND t2.b=t4.b
    WHERE t1.a <= 2;
SELECT t1.a,t1.b,t2.a,t2.b,t3.a,t3.b,t4.a,t4.b
  FROM t1 CROSS JOIN
       (
         (t3 CROSS JOIN t4)
         RIGHT JOIN              
         t2
         ON t3.a=1 AND t2.b=t4.b
       )
    WHERE t1.a <= 2;
SELECT t1.a,t1.b,t2.a,t2.b,t3.a,t3.b,t4.a,t4.b
  FROM t1, (t3, t4)
       RIGHT JOIN
       t2
       ON t3.a=1 AND t2.b=t4.b
    WHERE t1.a <= 2;
CREATE INDEX idx_b ON t2(b);
SELECT t2.a,t2.b,t3.a,t3.b,t4.a,t4.b
  FROM (t3,t4)
       LEFT JOIN              
       (t1,t2)
       ON t3.a=1 AND t3.b=t2.b AND t2.b=t4.b;
SELECT t2.a,t2.b,t3.a,t3.b,t4.a,t4.b
  FROM (t3,t4)
       LEFT JOIN              
       (t1,t2)
       ON t3.a=1 AND t3.b=t2.b AND t2.b=t4.b;
SELECT t2.a,t2.b,t3.a,t3.b,t4.a,t4.b
  FROM (t3 CROSS JOIN t4)
       LEFT JOIN              
       (t1 CROSS JOIN t2)
       ON t3.a=1 AND t3.b=t2.b AND t2.b=t4.b;
SELECT t0.a,t0.b,t1.a,t1.b,t2.a,t2.b,t3.a,t3.b,t4.a,t4.b,
       t5.a,t5.b,t6.a,t6.b,t7.a,t7.b,t8.a,t8.b,t9.a,t9.b
  FROM t0,t1
       LEFT JOIN                
       ( 
         t2
         LEFT JOIN              
         (t3, t4)
         ON t3.a=1 AND t2.b=t4.b,
         t5 
         LEFT JOIN 
         ( 
           (t6, t7)
           LEFT JOIN 
           t8
           ON t7.b=t8.b AND t6.b < 10
         )
         ON t6.b >= 2 AND t5.b=t7.b 
       )
       ON (t3.b=2 OR t3.c IS NULL) AND (t6.b=2 OR t6.c IS NULL) AND
          (t1.b=t5.b OR t3.c IS NULL OR t6.c IS NULL or t8.c IS NULL) AND
          (t1.a != 2),
       t9
     WHERE t0.a=1 AND
           t0.b=t1.b AND          
           (t2.a >= 4 OR t2.c IS NULL) AND
           (t3.a < 5 OR t3.c IS NULL) AND
           (t3.b=t4.b OR t3.c IS NULL OR t4.c IS NULL) AND
           (t5.a >=2 OR t5.c IS NULL) AND
           (t6.a >=4 OR t6.c IS NULL) AND
           (t7.a <= 2 OR t7.c IS NULL) AND
           (t8.a < 1 OR t8.c IS NULL) AND
           (t8.b=t9.b OR t8.c IS NULL) AND
           (t9.a=1);
CREATE INDEX idx_b ON t4(b);
CREATE INDEX idx_b ON t5(b);
SELECT t0.a,t0.b,t1.a,t1.b,t2.a,t2.b,t3.a,t3.b,t4.a,t4.b,
       t5.a,t5.b,t6.a,t6.b,t7.a,t7.b,t8.a,t8.b,t9.a,t9.b
  FROM t0,t1
       LEFT JOIN                
       ( 
         t2
         LEFT JOIN              
         (t3, t4)
         ON t3.a=1 AND t2.b=t4.b,
         t5 
         LEFT JOIN 
         ( 
           (t6, t7)
           LEFT JOIN 
           t8
           ON t7.b=t8.b AND t6.b < 10
         )
         ON t6.b >= 2 AND t5.b=t7.b 
       )
       ON (t3.b=2 OR t3.c IS NULL) AND (t6.b=2 OR t6.c IS NULL) AND
          (t1.b=t5.b OR t3.c IS NULL OR t6.c IS NULL or t8.c IS NULL) AND
          (t1.a != 2),
       t9
     WHERE t0.a=1 AND
           t0.b=t1.b AND          
           (t2.a >= 4 OR t2.c IS NULL) AND
           (t3.a < 5 OR t3.c IS NULL) AND
           (t3.b=t4.b OR t3.c IS NULL OR t4.c IS NULL) AND
           (t5.a >=2 OR t5.c IS NULL) AND
           (t6.a >=4 OR t6.c IS NULL) AND
           (t7.a <= 2 OR t7.c IS NULL) AND
           (t8.a < 1 OR t8.c IS NULL) AND
           (t8.b=t9.b OR t8.c IS NULL) AND
           (t9.a=1);
CREATE INDEX idx_b ON t8(b);
SELECT t0.a,t0.b,t1.a,t1.b,t2.a,t2.b,t3.a,t3.b,t4.a,t4.b,
       t5.a,t5.b,t6.a,t6.b,t7.a,t7.b,t8.a,t8.b,t9.a,t9.b
  FROM t0,t1
       LEFT JOIN                
       ( 
         t2
         LEFT JOIN              
         (t3, t4)
         ON t3.a=1 AND t2.b=t4.b,
         t5 
         LEFT JOIN 
         ( 
           (t6, t7)
           LEFT JOIN 
           t8
           ON t7.b=t8.b AND t6.b < 10
         )
         ON t6.b >= 2 AND t5.b=t7.b 
       )
       ON (t3.b=2 OR t3.c IS NULL) AND (t6.b=2 OR t6.c IS NULL) AND
          (t1.b=t5.b OR t3.c IS NULL OR t6.c IS NULL or t8.c IS NULL) AND
          (t1.a != 2),
       t9
     WHERE t0.a=1 AND
           t0.b=t1.b AND          
           (t2.a >= 4 OR t2.c IS NULL) AND
           (t3.a < 5 OR t3.c IS NULL) AND
           (t3.b=t4.b OR t3.c IS NULL OR t4.c IS NULL) AND
           (t5.a >=2 OR t5.c IS NULL) AND
           (t6.a >=4 OR t6.c IS NULL) AND
           (t7.a <= 2 OR t7.c IS NULL) AND
           (t8.a < 1 OR t8.c IS NULL) AND
           (t8.b=t9.b OR t8.c IS NULL) AND
           (t9.a=1);
CREATE INDEX idx_b ON t1(b);
CREATE INDEX idx_a ON t0(a);
SELECT t0.a,t0.b,t1.a,t1.b,t2.a,t2.b,t3.a,t3.b,t4.a,t4.b,
       t5.a,t5.b,t6.a,t6.b,t7.a,t7.b,t8.a,t8.b,t9.a,t9.b
  FROM t0,t1
       LEFT JOIN                
       ( 
         t2
         LEFT JOIN              
         (t3, t4)
         ON t3.a=1 AND t2.b=t4.b,
         t5 
         LEFT JOIN 
         ( 
           (t6, t7)
           LEFT JOIN 
           t8
           ON t7.b=t8.b AND t6.b < 10
         )
         ON t6.b >= 2 AND t5.b=t7.b 
       )
       ON (t3.b=2 OR t3.c IS NULL) AND (t6.b=2 OR t6.c IS NULL) AND
          (t1.b=t5.b OR t3.c IS NULL OR t6.c IS NULL or t8.c IS NULL) AND
          (t1.a != 2),
       t9
     WHERE t0.a=1 AND
           t0.b=t1.b AND          
           (t2.a >= 4 OR t2.c IS NULL) AND
           (t3.a < 5 OR t3.c IS NULL) AND
           (t3.b=t4.b OR t3.c IS NULL OR t4.c IS NULL) AND
           (t5.a >=2 OR t5.c IS NULL) AND
           (t6.a >=4 OR t6.c IS NULL) AND
           (t7.a <= 2 OR t7.c IS NULL) AND
           (t8.a < 1 OR t8.c IS NULL) AND
           (t8.b=t9.b OR t8.c IS NULL) AND
           (t9.a=1);
SELECT t0.a,t0.b,t1.a,t1.b,t2.a,t2.b,t3.a,t3.b,t4.a,t4.b,
       t5.a,t5.b,t6.a,t6.b,t7.a,t7.b,t8.a,t8.b,t9.a,t9.b
  FROM t0,t1
       LEFT JOIN                
       ( 
         t2
         LEFT JOIN              
         (t3, t4)
         ON t3.a=1 AND t2.b=t4.b,
         t5 
         LEFT JOIN 
         ( 
           (t6, t7)
           LEFT JOIN 
           t8
           ON t7.b=t8.b AND t6.b < 10
         )
         ON t6.b >= 2 AND t5.b=t7.b 
       )
       ON (t3.b=2 OR t3.c IS NULL) AND (t6.b=2 OR t6.c IS NULL) AND
          (t1.b=t5.b OR t3.c IS NULL OR t6.c IS NULL or t8.c IS NULL) AND
          (t1.a != 2),
       t9
     WHERE t0.a=1 AND
           t0.b=t1.b AND          
           (t2.a >= 4 OR t2.c IS NULL) AND
           (t3.a < 5 OR t3.c IS NULL) AND
           (t3.b=t4.b OR t3.c IS NULL OR t4.c IS NULL) AND
           (t5.a >=2 OR t5.c IS NULL) AND
           (t6.a >=4 OR t6.c IS NULL) AND
           (t7.a <= 2 OR t7.c IS NULL) AND
           (t8.a < 1 OR t8.c IS NULL) AND
           (t8.b=t9.b OR t8.c IS NULL) AND
           (t9.a=1);
SELECT t0.a,t0.b,t1.a,t1.b,t2.a,t2.b,t34.a3,t34.b3,t34.a4,t34.b4,
       t5.a,t5.b,t67.a6,t67.b6,t67.a7,t67.b7,t8.a,t8.b,t9.a,t9.b
  FROM t0
       CROSS JOIN t1
       LEFT JOIN                
       ( 
         t2
         LEFT JOIN              
         t34
         ON t34.a3=1 AND t2.b=t34.b4
         CROSS JOIN t5 
         LEFT JOIN 
         ( 
           t67
           LEFT JOIN 
           t8
           ON t67.b7=t8.b AND t67.b6 < 10
         )
         ON t67.b6 >= 2 AND t5.b=t67.b7 
       )
       ON (t34.b3=2 OR t34.c3 IS NULL) AND (t67.b6=2 OR t67.c6 IS NULL) AND
          (t1.b=t5.b OR t34.c3 IS NULL OR t67.c6 IS NULL or t8.c IS NULL) AND
          (t1.a <> 2)
       CROSS JOIN t9
     WHERE t0.a=1 AND
           t0.b=t1.b AND          
           (t2.a >= 4 OR t2.c IS NULL) AND
           (t34.a3 < 5 OR t34.c3 IS NULL) AND
           (t34.b3=t34.b4 OR t34.c3 IS NULL OR t34.c4 IS NULL) AND
           (t5.a >=2 OR t5.c IS NULL) AND
           (t67.a6 >=4 OR t67.c6 IS NULL) AND
           (t67.a7 <= 2 OR t67.c7 IS NULL) AND
           (t8.a < 1 OR t8.c IS NULL) AND
           (t8.b=t9.b OR t8.c IS NULL) AND
           (t9.a=1);
SELECT t2.a,t2.b
  FROM t2;
SELECT t3.a,t3.b
  FROM t3;
SELECT t2.a,t2.b,t3.a,t3.b
  FROM t2 LEFT JOIN t3 ON t2.b=t3.b
    WHERE t2.a = 4 OR (t2.a > 4 AND t3.a IS NULL);
SELECT t2.a,t2.b,t3.a,t3.b
  FROM t2 LEFT JOIN (t3) ON t2.b=t3.b
    WHERE t2.a = 4 OR (t2.a > 4 AND t3.a IS NULL);
ALTER TABLE t3
  CHANGE COLUMN a a1 int,
  CHANGE COLUMN c c1 int;
SELECT t2.a,t2.b,t3.a1,t3.b
  FROM t2 LEFT JOIN t3 ON t2.b=t3.b
    WHERE t2.a = 4 OR (t2.a > 4 AND t3.a1 IS NULL);
SELECT t2.a,t2.b,t3.a1,t3.b
  FROM t2 NATURAL LEFT JOIN t3
    WHERE t2.a = 4 OR (t2.a > 4 AND t3.a1 IS NULL);
DROP TABLE t0,t1,t2,t3,t4,t5,t6,t7,t8,t9;
DROP TABLE t34, t345, t67;
CREATE TABLE t1 (a int);
CREATE TABLE t2 (a int);
CREATE TABLE t3 (a int);
INSERT INTO t1 VALUES (1);
INSERT INTO t2 VALUES (2);
INSERT INTO t3 VALUES (2);
INSERT INTO t1 VALUES (2);
SELECT * FROM t1 LEFT JOIN (t2 LEFT JOIN t3 ON t2.a=t3.a) ON t1.a=t3.a;
SELECT * FROM t1 LEFT JOIN t2 LEFT JOIN t3 ON t2.a=t3.a ON t1.a=t3.a;
DELETE FROM t1 WHERE a=2;
SELECT * FROM t1 LEFT JOIN t2 LEFT JOIN t3 ON t2.a=t3.a ON t1.a=t3.a;
DELETE FROM t2;
SELECT * FROM t1 LEFT JOIN t2 LEFT JOIN t3 ON t2.a=t3.a ON t1.a=t3.a;
DROP TABLE t1,t2,t3;
CREATE TABLE t1(a int, key (a));
CREATE TABLE t2(b int, key (b));
CREATE TABLE t3(c int, key (c));
INSERT INTO t1 VALUES (NULL), (0), (1), (2), (3), (4), (5), (6), (7), (8), (9),
(10), (11), (12), (13), (14), (15), (16), (17), (18), (19);
INSERT INTO t2 VALUES (NULL), (0), (1), (2), (3), (4), (5), (6), (7), (8), (9),
(10), (11), (12), (13), (14), (15), (16), (17), (18), (19);
INSERT INTO t3 VALUES (0), (1), (2), (3), (4), (5);
SELECT a, b, c FROM t1 LEFT JOIN (t2, t3) ON b < 3 and b = c;
DELETE FROM t3;
SELECT a, b, c FROM t1 LEFT JOIN (t2, t3) ON b < 3 and b = c;
DROP TABLE t1,t2,t3;
CREATE TABLE t1 (c11 int);
CREATE TABLE t2 (c21 int);
CREATE TABLE t3 (c31 int);
INSERT INTO t1 VALUES (4), (5);
SELECT * FROM t1 LEFT JOIN t2 ON c11=c21;
SELECT * FROM t1 LEFT JOIN (t2 LEFT JOIN t3 ON c21=c31) ON c11=c21;
DROP TABLE t1,t2,t3;
CREATE TABLE t1 (goods int(12) NOT NULL, price varchar(128) NOT NULL);
INSERT INTO t1 VALUES (23, 2340), (26, 9900);
CREATE TABLE t2 (goods int(12), name varchar(50), shop char(2));
INSERT INTO t2 VALUES (23, 'as300', 'fr'), (26, 'as600', 'fr');
create table t3 (groupid int(12) NOT NULL, goodsid int(12) NOT NULL);
INSERT INTO t3 VALUES (3,23), (6,26);
CREATE TABLE t4 (groupid int(12));
INSERT INTO t4 VALUES (1), (2), (3), (4), (5), (6);
SELECT * FROM
(SELECT DISTINCT gl.groupid, gp.price
  FROM t4 gl 
       LEFT JOIN
       (t3 g INNER JOIN t2 p ON g.goodsid = p.goods 
             INNER JOIN t1 gp ON p.goods = gp.goods)
       ON gl.groupid = g.groupid and p.shop = 'fr') t;
CREATE VIEW v1 AS
SELECT g.groupid groupid, p.goods goods,  
       p.name name, p.shop shop, 
       gp.price price
  FROM t3 g INNER JOIN t2 p ON g.goodsid = p.goods
            INNER JOIN t1 gp on p.goods = gp.goods;
CREATE VIEW v2 AS
SELECT DISTINCT g.groupid, fr.price
  FROM t4 g
       LEFT JOIN
       v1 fr on g.groupid = fr.groupid and fr.shop = 'fr';
SELECT * FROM v2;
SELECT * FROM 
(SELECT DISTINCT g.groupid, fr.price
  FROM t4 g
       LEFT JOIN
       v1 fr on g.groupid = fr.groupid and fr.shop = 'fr') t;
DROP VIEW v1,v2;
DROP TABLE t1,t2,t3,t4;
CREATE TABLE t1(a int);
CREATE TABLE t2(b int);
CREATE TABLE t3(c int, d int);
CREATE TABLE t4(d int);
CREATE TABLE t5(e int, f int);
CREATE TABLE t6(f int);
CREATE VIEW v1 AS 
  SELECT e FROM t5 JOIN t6 ON t5.e=t6.f;
CREATE VIEW v2 AS 
  SELECT e FROM t5 NATURAL JOIN t6;
SELECT t1.a FROM t1 JOIN t2 ON a=b JOIN t3 ON a=c JOIN t4 USING(d);
SELECT t1.a FROM t1 JOIN t2 ON a=b JOIN t3 ON a=c NATURAL JOIN t4;
SELECT v1.e FROM v1 JOIN t2 ON e=b JOIN t3 ON e=c JOIN t4 USING(d);
SELECT v2.e FROM v2 JOIN t2 ON e=b JOIN t3 ON e=c JOIN t4 USING(d);
DROP VIEW v1, v2;
DROP TABLE t1, t2, t3, t4, t5, t6;
create table t1 (id1 int(11) not null);
insert into t1 values (1),(2);
create table t2 (id2 int(11) not null);
insert into t2 values (1),(2),(3),(4);
create table t3 (id3 char(16) not null);
insert into t3 values ('100');
create table t4 (id2 int(11) not null, id3 char(16));
create table t5 (id1 int(11) not null, key (id1));
insert into t5 values (1),(2),(1);
create view v1 as
  select t4.id3 from t4 join t2 on t4.id2 = t2.id2;
select t1.id1 from t1 inner join (t3 left join v1 on t3.id3 = v1.id3);
drop view v1;
drop table t1, t2, t3, t4, t5;
create table t0 (a int);
insert into t0 values (0),(1),(2),(3);
create table t1(a int);
insert into t1 select A.a + 10*(B.a) from t0 A, t0 B;
create table t2 (a int, b int);
insert into t2 values (1,1), (2,2), (3,3);
create table t3(a int, b int, filler char(200), key(a));
insert into t3 select a,a,'filler' from t1;
insert into t3 select a,a,'filler' from t1;
create table t4 like t3;
insert into t4 select * from t3;
insert into t4 select * from t3;
create table t5 like t4;
insert into t5 select * from t4;
insert into t5 select * from t4;
create table t6 like t5;
insert into t6 select * from t5;
insert into t6 select * from t5;
create table t7 like t6;
insert into t7 select * from t6;
insert into t7 select * from t6;
drop table t0, t1, t2, t3, t4, t5, t6, t7;
create table t1 (a int);
insert into t1 values (0),(1),(2),(3),(4),(5),(6),(7),(8),(9);
create table t2 (a int, filler char(100), key(a));
insert into t2 select A.a + 10*B.a, '' from t1 A, t1 B;
create table t3 like t2;
insert into t3 select * from t2;
drop table t1, t2, t3;
CREATE TABLE t1 (id int NOT NULL PRIMARY KEY, type varchar(10));
CREATE TABLE t2 (pid int NOT NULL PRIMARY KEY, type varchar(10));
CREATE TABLE t3 (cid int NOT NULL PRIMARY KEY,
                 id int NOT NULL,
                 pid int NOT NULL);
INSERT INTO t1 VALUES (1, 'A'), (3, 'C');
INSERT INTO t2 VALUES (1, 'A'), (3, 'C');
INSERT INTO t3 VALUES (1, 1, 1), (3, 3, 3);
SELECT * FROM t1 p LEFT JOIN (t3 JOIN t1)
                     ON (t1.id=t3.id AND t1.type='B' AND p.id=t3.id)
                   LEFT JOIN t2 ON (t3.pid=t2.pid)
  WHERE p.id=1;
CREATE VIEW v1 AS
  SELECT t3.* FROM t3 JOIN t1 ON t1.id=t3.id AND t1.type='B';
SELECT * FROM t1 p LEFT JOIN v1 ON p.id=v1.id
                   LEFT JOIN t2 ON v1.pid=t2.pid
  WHERE p.id=1;
DROP VIEW v1;
DROP TABLE t1,t2,t3;
CREATE TABLE t1 (id1 int PRIMARY KEY, id2 int);
CREATE TABLE t2 (id1 int PRIMARY KEY, id2 int);
CREATE TABLE t3 (id1 int PRIMARY KEY, id2 int);
CREATE TABLE t4 (id1 int PRIMARY KEY, id2 int);
CREATE TABLE t5 (id1 int PRIMARY KEY, id2 int);
SELECT t1.id1 AS id, t5.id1 AS ngroupbynsa
  FROM t1 INNER JOIN t2 ON t2.id2 = t1.id1
       LEFT OUTER JOIN
       (t3 INNER JOIN t4 ON t4.id1 = t3.id2 INNER JOIN t5 ON t4.id2 = t5.id1)
       ON t3.id2 IS NOT NULL
    WHERE t1.id1=2;
PREPARE stmt FROM
"SELECT t1.id1 AS id, t5.id1 AS ngroupbynsa
  FROM t1 INNER JOIN t2 ON t2.id2 = t1.id1
       LEFT OUTER JOIN
       (t3 INNER JOIN t4 ON t4.id1 = t3.id2 INNER JOIN t5 ON t4.id2 = t5.id1)
       ON t3.id2 IS NOT NULL
    WHERE t1.id1=2";
INSERT INTO t1 VALUES (1,1), (2,1), (3,2);
INSERT INTO t2 VALUES (2,1), (3,2), (4,3);
INSERT INTO t3 VALUES (1,1), (3,2), (2,NULL);
INSERT INTO t4 VALUES (1,1), (2,1), (3,3);
INSERT INTO t5 VALUES (1,1), (2,2), (3,3), (4,3);
SELECT t1.id1 AS id, t5.id1 AS ngroupbynsa
  FROM t1 INNER JOIN t2 ON t2.id2 = t1.id1
       LEFT OUTER JOIN
       (t3 INNER JOIN t4 ON t4.id1 = t3.id2 INNER JOIN t5 ON t4.id2 = t5.id1)
       ON t3.id2 IS NOT NULL
    WHERE t1.id1=2;
DROP TABLE t1,t2,t3,t4,t5;
CREATE TABLE t1 (
  id int NOT NULL PRIMARY KEY,
  ct int DEFAULT NULL,
  pc int DEFAULT NULL,
  INDEX idx_ct (ct),
  INDEX idx_pc (pc)
);
INSERT INTO t1 VALUES  
 (1,NULL,NULL),(2,NULL,NULL),(3,NULL,NULL),(4,NULL,NULL),(5,NULL,NULL);
CREATE TABLE t2 (
  id int NOT NULL PRIMARY KEY,
  sr int NOT NULL,
  nm varchar(255) NOT NULL,
  INDEX idx_sr (sr)
);
INSERT INTO t2 VALUES
  (2441905,4308,'LesAbymes'),(2441906,4308,'Anse-Bertrand');
CREATE TABLE t3 (
  id int NOT NULL PRIMARY KEY,
  ct int NOT NULL,
  ln int NOT NULL,
  INDEX idx_ct (ct),
  INDEX idx_ln (ln)
);
CREATE TABLE t4 (
  id int NOT NULL PRIMARY KEY,
  nm varchar(255) NOT NULL
);
INSERT INTO t4 VALUES (4308,'Guadeloupe'),(4309,'Martinique');
SELECT t1.*
  FROM t1 LEFT JOIN
       (t2 LEFT JOIN t3 ON t3.ct=t2.id AND t3.ln='5') ON t1.ct=t2.id
    WHERE t1.id='5';
SELECT t1.*, t4.nm
  FROM t1 LEFT JOIN
      (t2 LEFT JOIN t3 ON t3.ct=t2.id AND t3.ln='5') ON t1.ct=t2.id
          LEFT JOIN t4 ON t2.sr=t4.id
    WHERE t1.id='5';
DROP TABLE t1,t2,t3,t4;
CREATE TABLE t1 (a INT, b INT);
CREATE TABLE t2 (a INT);
CREATE TABLE t3 (a INT, c INT);
CREATE TABLE t4 (a INT, c INT);
CREATE TABLE t5 (a INT, c INT);
SELECT b FROM t1 JOIN (t2 LEFT JOIN t3 USING (a) LEFT JOIN t4 USING (a)
LEFT JOIN t5 USING (a)) USING (a);
SELECT b FROM t1 JOIN (t2 JOIN t3 USING (a) JOIN t4 USING (a)
JOIN t5 USING (a)) USING (a);
DROP TABLE t1,t2,t3,t4,t5;
CREATE TABLE t1 (a INT, b INT);
CREATE TABLE t2 (a INT, b INT);
CREATE TABLE t3 (a INT, b INT);
INSERT INTO t1 VALUES (1,1);
INSERT INTO t2 VALUES (1,1);
INSERT INTO t3 VALUES (1,1);
DROP TABLE t1,t2,t3;
CREATE TABLE t1 (
  carrier char(2) default NULL,
  id int NOT NULL auto_increment PRIMARY KEY
) CHARSET utf8mb4;
INSERT INTO t1 VALUES
  ('CO',235371754),('CO',235376554),('CO',235376884),('CO',235377874),
  ('CO',231060394),('CO',231059224),('CO',231059314),('CO',231060484),
  ('CO',231060274),('CO',231060124),('CO',231060244),('CO',231058594),
  ('CO',231058924),('CO',231058504),('CO',231059344),('CO',231060424),
  ('CO',231059554),('CO',231060304),('CO',231059644),('CO',231059464),
  ('CO',231059764),('CO',231058294),('CO',231058624),('CO',231058864),
  ('CO',231059374),('CO',231059584),('CO',231059734),('CO',231059014),
  ('CO',231059854),('CO',231059494),('CO',231059794),('CO',231058534),
  ('CO',231058324),('CO',231058684),('CO',231059524),('CO',231059974);
CREATE TABLE t2 (
  scan_date date default NULL,
  package_id int default NULL,
  INDEX scan_date(scan_date),
  INDEX package_id(package_id)
);
INSERT INTO t2 VALUES
  ('2008-12-29',231062944),('2008-12-29',231065764),('2008-12-29',231066124),
  ('2008-12-29',231060094),('2008-12-29',231061054),('2008-12-29',231065644),
  ('2008-12-29',231064384),('2008-12-29',231064444),('2008-12-29',231073774),
  ('2008-12-29',231058594),('2008-12-29',231059374),('2008-12-29',231066004),
  ('2008-12-29',231068494),('2008-12-29',231070174),('2008-12-29',231071884),
  ('2008-12-29',231063274),('2008-12-29',231063754),('2008-12-29',231064144),
  ('2008-12-29',231069424),('2008-12-29',231073714),('2008-12-29',231058414),
  ('2008-12-29',231060994),('2008-12-29',231069154),('2008-12-29',231068614),
  ('2008-12-29',231071464),('2008-12-29',231074014),('2008-12-29',231059614),
  ('2008-12-29',231059074),('2008-12-29',231059464),('2008-12-29',231069094),
  ('2008-12-29',231067294),('2008-12-29',231070144),('2008-12-29',231073804),
  ('2008-12-29',231072634),('2008-12-29',231058294),('2008-12-29',231065344),
  ('2008-12-29',231066094),('2008-12-29',231069034),('2008-12-29',231058594),
  ('2008-12-29',231059854),('2008-12-29',231059884),('2008-12-29',231059914),
  ('2008-12-29',231063664),('2008-12-29',231063814),('2008-12-29',231063904);
CREATE TABLE t3 (
  package_id int default NULL,
  INDEX package_id(package_id)
);
INSERT INTO t3 VALUES
  (231058294),(231058324),(231058354),(231058384),(231058414),(231058444),
  (231058474),(231058504),(231058534),(231058564),(231058594),(231058624),
  (231058684),(231058744),(231058804),(231058864),(231058924),(231058954),
  (231059014),(231059074),(231059104),(231059134),(231059164),(231059194),
  (231059224),(231059254),(231059284),(231059314),(231059344),(231059374),
  (231059404),(231059434),(231059464),(231059494),(231059524),(231059554),
  (231059584),(231059614),(231059644),(231059674),(231059704),(231059734),
  (231059764),(231059794),(231059824),(231059854),(231059884),(231059914),
  (231059944),(231059974),(231060004),(231060034),(231060064),(231060094),
  (231060124),(231060154),(231060184),(231060214),(231060244),(231060274),
  (231060304),(231060334),(231060364),(231060394),(231060424),(231060454),
  (231060484),(231060514),(231060544),(231060574),(231060604),(231060634),
  (231060664),(231060694),(231060724),(231060754),(231060784),(231060814),
  (231060844),(231060874),(231060904),(231060934),(231060964),(231060994),
  (231061024),(231061054),(231061084),(231061144),(231061174),(231061204),
  (231061234),(231061294),(231061354),(231061384),(231061414),(231061474),
  (231061564),(231061594),(231061624),(231061684),(231061714),(231061774),
  (231061804),(231061894),(231061984),(231062074),(231062134),(231062224),
  (231062254),(231062314),(231062374),(231062434),(231062494),(231062554),
  (231062584),(231062614),(231062644),(231062704),(231062734),(231062794),
  (231062854),(231062884),(231062944),(231063004),(231063034),(231063064),
  (231063124),(231063154),(231063184),(231063214),(231063274),(231063334),
  (231063394),(231063424),(231063454),(231063514),(231063574),(231063664);
CREATE TABLE t4 (
  carrier char(2) NOT NULL default '' PRIMARY KEY,
  id int(11) default NULL,
  INDEX id(id)
) CHARSET utf8mb4;
INSERT INTO t4 VALUES
  ('99',6),('SK',456),('UA',486),('AI',1081),('OS',1111),('VS',1510);
CREATE TABLE t5 (
  carrier_id int default NULL,
  INDEX carrier_id(carrier_id)
);
INSERT INTO t5 VALUES
  (6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),
  (6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),
  (6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),
  (6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),
  (6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),
  (6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(6),(456),(456),(456),
  (456),(456),(456),(456),(456),(456),(456),(456),(456),(456),(456),(456),
  (456),(486),(1081),(1111),(1111),(1111),(1111),(1510);
SELECT COUNT(*) 
  FROM((t2 JOIN t1 ON t2.package_id = t1.id) 
        JOIN t3 ON t3.package_id = t1.id);
SELECT COUNT(*) 
  FROM ((t2 JOIN t1 ON t2.package_id = t1.id) 
         JOIN t3 ON t3.package_id = t1.id)
       LEFT JOIN 
       (t5 JOIN t4 ON t5.carrier_id = t4.id)
       ON t4.carrier = t1.carrier;
SELECT COUNT(*) 
  FROM ((t2 JOIN t1 ON t2.package_id = t1.id) 
        JOIN t3 ON t3.package_id = t1.id)
       LEFT JOIN 
       (t5 JOIN t4 ON t5.carrier_id = t4.id)
       ON t4.carrier = t1.carrier;
DROP TABLE t1,t2,t3,t4,t5;
CREATE TABLE t (
  a INT,
  b CHAR(255),
  c CHAR(255),
  d INT,
  e INT,
  PRIMARY KEY (e),
  KEY (d)
) ENGINE=InnoDB;
INSERT INTO t VALUES
(1, '14effca2', 'cffa3819', 98927, 8767),
(1, '2f7cbd33', '421aff88', 87613, 70956),
(1, '5c44507d', '05fd27d3', 36002, 5146),
(1, '6542ee43', 'c09ee30f', 3673, 91467),
(1, '786737dd', '6ac95ccb', 46890, 62953),
(1, '8929d195', '64102e63', 50531, 9712),
(1, '8cc0c106', '17283316', 16399, 26119),
(1, '8f3063de', 'ce5d0f35', 21769, 76667),
(1, 'c32c9202', 'c9525fe8', 12704, 43998),
(1, 'c5567e1c', 'bc2e97e6', 85805, 84174),
(1, 'c7acb4d4', '6d67fea7', 58347, 51235),
(1, 'dbd66341', '03b59a03', 46577, 52495),
(1, 'f8e0354e', '41a6e523', 36055, 32646),
(1, 'fb66b513', '10f3de43', 41297, 74334),
(1, 'ffec6d1b', '2fca4073', 12896, 95807),
(1, 'aa3fcff8', 'f4981ed8', 99211, 18778);
SELECT a.c AS c FROM (
  SELECT a.c AS c FROM (
    SELECT a.a AS c FROM t AS a
    INNER JOIN t AS b ON a.b > b.b
  ) AS a
  INNER JOIN t AS b ON a.c >= b.a
) AS a
INNER JOIN t AS b ON a.c >= b.d;
DROP TABLE t;
