SELECT a FROM lower_test WHERE lower(b) IN ('a','b') order by a;
DROP TABLE lower_test;
