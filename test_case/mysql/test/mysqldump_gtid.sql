
CREATE TABLE t1 (a INT);
INSERT INTO t1 VALUES(1);
INSERT INTO t1 VALUES(2);
INSERT INTO t1 VALUES(3);

-- let $MASTER_UUID = `SELECT @@SERVER_UUID;

DROP TABLE t1;