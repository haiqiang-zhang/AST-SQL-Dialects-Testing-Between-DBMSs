SELECT SUBQUERY1_t1.col_varchar_key AS SUBQUERY1_field1
FROM t2 AS SUBQUERY1_t1
WHERE (SUBQUERY1_t1.pk > 5 AND
       SUBQUERY1_t1.col_varchar_key NOT IN (SELECT CHILD_SUBQUERY1_t1 .col_varchar_key AS CHILD_SUBQUERY1_field1
                                            FROM t1 AS CHILD_SUBQUERY1_t1
                                            WHERE CHILD_SUBQUERY1_t1.col_int_key = 3));
SELECT SUM(table1.pk )AS field1 , COUNT(table2.col_varchar_key ) AS field2
FROM (t1 AS table1 JOIN (t2 AS table2))
WHERE (table2.col_varchar_key <> SOME (SELECT SUBQUERY2_t1. col_varchar_key AS SUBQUERY2_field1
                   FROM t1 AS SUBQUERY2_t1
                   WHERE (SUBQUERY2_t1.pk < 4
                          AND SUBQUERY2_t1. pk IN (SELECT 2 EXCEPT SELECT 9))));
DROP TABLE t1;
DROP TABLE t2;
