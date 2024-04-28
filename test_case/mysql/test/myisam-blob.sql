
SET SQL_MODE='';
--

--disable_warnings
drop table if exists t1;

-- Bug #2159 (Problem with update of blob to > 16M)

CREATE TABLE t1 (data LONGBLOB) ENGINE=myisam;
INSERT INTO t1 (data) VALUES (NULL);
UPDATE t1 set data=repeat('a',18*1024*1024);
select length(data) from t1;
delete from t1 where left(data,1)='a';
INSERT INTO t1 (data) VALUES (repeat('a',1*1024*1024));
INSERT INTO t1 (data) VALUES (repeat('b',16*1024*1024-1024));
delete from t1 where left(data,1)='b';

-- now we have two blocks in the table, first is a 1M record and second is
-- a 16M delete block.

UPDATE t1 set data=repeat('c',17*1024*1024);
delete from t1 where left(data,1)='c';

INSERT INTO t1 set data=repeat('a',18*1024*1024);
select length(data) from t1;
alter table t1 modify data blob;
select length(data) from t1;
drop table t1;

CREATE TABLE t1 (data BLOB) ENGINE=myisam;
INSERT INTO t1 (data) VALUES (NULL);
UPDATE IGNORE t1 set data=repeat('a',18*1024*1024);
select length(data) from t1;
drop table t1;

SET SQL_MODE=default;