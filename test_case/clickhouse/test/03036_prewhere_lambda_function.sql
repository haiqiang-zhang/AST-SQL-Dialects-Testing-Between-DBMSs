SELECT * FROM t PREWHERE arrayExists(x -> x = 5, A);
DROP TABLE t;
