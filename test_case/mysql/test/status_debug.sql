SELECT (SELECT val FROM t1 WHERE id = 3) - (SELECT val FROM t1 WHERE id = 2) = 1 + @binlog_handler_commit;
DROP TABLE t1;
