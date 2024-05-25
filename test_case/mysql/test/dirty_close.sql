SELECT * FROM t1;
DROP TABLE t1;
SELECT GET_LOCK("dangling", 0);
SELECT COUNT(*) = 1 FROM INFORMATION_SCHEMA.PROCESSLIST WHERE STATE = "User lock"
  AND INFO = "SELECT GET_LOCK('dangling', 3600)";
SELECT COUNT(*) = 0 FROM INFORMATION_SCHEMA.PROCESSLIST WHERE STATE = "User lock"
  AND INFO = "SELECT GET_LOCK('dangling', 3600)";
SELECT COUNT(*) = 1 FROM INFORMATION_SCHEMA.PROCESSLIST WHERE STATE = "User lock"
  AND INFO = "SELECT GET_LOCK('dangling', 3600)";
SELECT RELEASE_LOCK('dangling');
