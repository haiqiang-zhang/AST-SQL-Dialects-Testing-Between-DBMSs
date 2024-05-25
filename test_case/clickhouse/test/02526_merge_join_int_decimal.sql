SELECT * FROM foo_merge WHERE Val = 3 AND Id = 3;
SELECT count(), X FROM foo_merge JOIN t2 USING Val WHERE Val = 3 AND Id = 3 AND t2.X == 4 GROUP BY X;
SELECT count(), X FROM foo_merge JOIN t2 USING Val WHERE Val = 3 AND (Id = 3 AND t2.X == 4) GROUP BY X;
SELECT count(), X FROM foo_merge JOIN t2 USING Val WHERE Val = 3 AND Id = 3 GROUP BY X;
SELECT count(), X FROM (SELECT * FROM foo_merge) f JOIN t2 USING Val WHERE Val = 3 AND Id = 3 GROUP BY X;
SELECT 7, count(1000.0001), -9223372036854775807 FROM foo_merge INNER JOIN t2 USING (Val) WHERE (((NULL AND -2 AND (Val = NULL)) AND (Id = NULL) AND (Val = NULL) AND (Id = NULL)) AND (Id = NULL) AND Val AND NULL) AND ((3 AND NULL AND -2147483648 AND (Val = NULL)) AND (Id = NULL) AND (Val = NULL)) AND ((NULL AND -2 AND (Val = NULL)) AND (Id = NULL) AND (Val = NULL)) AND 2147483647 WITH TOTALS;
DROP TABLE IF EXISTS foo;
DROP TABLE IF EXISTS foo1;
DROP TABLE IF EXISTS foo_merge;
DROP TABLE IF EXISTS t2;
