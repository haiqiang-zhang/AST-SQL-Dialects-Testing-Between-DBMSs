CREATE TEMPORARY TABLE test (`id` String, `products` Nested (`ÃÂÃÂÃÂÃÂ¤ÃÂÃÂÃÂÃÂºÃÂÃÂÃÂÃÂ§ÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ` Array(String), `ÃÂÃÂÃÂÃÂ©ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ©ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ` Array(Int32)));
DESCRIBE test;
DESCRIBE (SELECT * FROM test);
DESCRIBE (SELECT * FROM test ARRAY JOIN products);
DESCRIBE (SELECT p.`ÃÂÃÂÃÂÃÂ¤ÃÂÃÂÃÂÃÂºÃÂÃÂÃÂÃÂ§ÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ`, p.`ÃÂÃÂÃÂÃÂ©ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ©ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ` FROM test ARRAY JOIN products AS p);
SELECT * FROM test ARRAY JOIN products;
SELECT count() FROM (SELECT * FROM test ARRAY JOIN products);