CREATE TABLE t1(id INTEGER PRIMARY KEY, a TEXT);
INSERT INTO t1(id, a) VALUES(1, 'ÃÂÃÂ¦ÃÂÃÂÃÂÃÂ¥ÃÂÃÂ¦ÃÂÃÂÃÂÃÂ¬ÃÂÃÂ¨ÃÂÃÂªÃÂÃÂ');
SELECT a, hex(a), length(a) FROM t1;
SELECT * FROM t1 WHERE a='ÃÂÃÂ¦ÃÂÃÂÃÂÃÂ¥ÃÂÃÂ¦ÃÂÃÂÃÂÃÂ¬ÃÂÃÂ¨ÃÂÃÂªÃÂÃÂ';
SELECT * FROM t1 WHERE a LIKE 'ÃÂÃÂ¦ÃÂÃÂÃÂÃÂ¥ÃÂÃÂ¦ÃÂÃÂÃÂÃÂ¬ÃÂÃÂ¨ÃÂÃÂªÃÂÃÂ';