PRAGMA auto_vacuum = OFF;
PRAGMA page_size = 1024;
CREATE TABLE abc(a,b);
PRAGMA temp_store = memory;
PRAGMA cache_size = 10;
BEGIN;
INSERT INTO abc VALUES('hello', 'world');
INSERT INTO abc SELECT * FROM abc;
INSERT INTO abc SELECT * FROM abc;
INSERT INTO abc SELECT * FROM abc;
INSERT INTO abc SELECT * FROM abc;
INSERT INTO abc SELECT * FROM abc;
INSERT INTO abc SELECT * FROM abc;
INSERT INTO abc SELECT * FROM abc;
INSERT INTO abc SELECT * FROM abc;
INSERT INTO abc SELECT * FROM abc;
INSERT INTO abc SELECT * FROM abc;
INSERT INTO abc SELECT * FROM abc;
DELETE FROM abc;
INSERT INTO abc VALUES('a', 'b');
BEGIN;
INSERT INTO abc VALUES('c', 'd');
INSERT INTO abc SELECT * FROM abc;
INSERT INTO abc SELECT * FROM abc;
INSERT INTO abc SELECT * FROM abc;
INSERT INTO abc SELECT * FROM abc;
INSERT INTO abc SELECT * FROM abc;
INSERT INTO abc SELECT * FROM abc;
INSERT INTO abc SELECT * FROM abc;
INSERT INTO abc SELECT * FROM abc;
INSERT INTO abc SELECT * FROM abc;
INSERT INTO abc SELECT * FROM abc;
INSERT INTO abc SELECT * FROM abc;
PRAGMA synchronous = full;
PRAGMA cache_size = 10;
PRAGMA synchronous;
BEGIN;
UPDATE abc SET a = 'x';
PRAGMA cache_size = 2000;
PRAGMA mmap_size = 0;
PRAGMA integrity_check;
BEGIN;
PRAGMA integrity_check;
PRAGMA cache_size = 2000;
PRAGMA mmap_size = 0;
PRAGMA integrity_check;
BEGIN;
PRAGMA integrity_check;