PRAGMA enable_verification;
ATTACH '__TEST_DIR__/attach_vacuum.db' AS db1;
CREATE TABLE db1.integers(i INTEGER);;
CHECKPOINT db1;
VACUUM db1.integers;