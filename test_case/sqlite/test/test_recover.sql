PRAGMA writable_schema = on;
PRAGMA encoding = 'UTF-8';
PRAGMA page_size = '1024';
PRAGMA auto_vacuum = '0';
PRAGMA user_version = '0';
PRAGMA application_id = '0';
INSERT OR IGNORE INTO 't1'('a', 'b', 'c') VALUES (1, 4, X'1234567800');
INSERT OR IGNORE INTO 't1'('a', 'b', 'c') VALUES (2, 'test', 8.1);
INSERT OR IGNORE INTO 't1'('a', 'b', 'c') VALUES (3, replace('\n  hello\n  world\n','\n', char(10)), 8.4);
PRAGMA writable_schema = off;
DELETE FROM t1;
INSERT INTO t1 VALUES(13, 'hello
world', 13);
BEGIN;
PRAGMA writable_schema = on;
PRAGMA encoding = 'UTF-8';
PRAGMA page_size = '1024';
PRAGMA auto_vacuum = '0';
PRAGMA user_version = '0';
PRAGMA application_id = '0';
INSERT OR IGNORE INTO 't1'('a', 'b', 'c') VALUES (13, replace(replace('hello\r\nworld','\n', char(10)),'\r', char(13)), 13);
PRAGMA writable_schema = off;
CREATE TABLE t2(i INTEGER PRIMARY KEY AUTOINCREMENT, b, c);
INSERT INTO t2 VALUES(NULL, 1, 2);
INSERT INTO t2 VALUES(NULL, 3, 4);
INSERT INTO t2 VALUES(NULL, 5, 6);
CREATE TABLE t3(i INTEGER PRIMARY KEY AUTOINCREMENT, b, c);
INSERT INTO t3 VALUES(NULL, 1, 2);
INSERT INTO t3 VALUES(NULL, 3, 4);
INSERT INTO t3 VALUES(NULL, 5, 6);
DELETE FROM t2;
BEGIN;
PRAGMA writable_schema = on;
PRAGMA encoding = 'UTF-8';
PRAGMA page_size = '1024';
PRAGMA auto_vacuum = '0';
PRAGMA user_version = '0';
PRAGMA application_id = '0';
INSERT OR IGNORE INTO 't1'('a', 'b', 'c') VALUES (13, replace(replace('hello\r\nworld','\n', char(10)),'\r', char(13)), 13);
INSERT OR IGNORE INTO 't3'('i', 'b', 'c') VALUES (1, 1, 2);
INSERT OR IGNORE INTO 't3'('i', 'b', 'c') VALUES (2, 3, 4);
INSERT OR IGNORE INTO 't3'('i', 'b', 'c') VALUES (3, 5, 6);
DELETE FROM sqlite_sequence;
INSERT OR IGNORE INTO 'sqlite_sequence'(_rowid_, 'name', 'seq') VALUES (1, 't2', 3);
INSERT OR IGNORE INTO 'sqlite_sequence'(_rowid_, 'name', 'seq') VALUES (2, 't3', 3);
PRAGMA writable_schema = off;
PRAGMA auto_vacuum = 0;
INSERT INTO t1 VALUES(1, 2, 3);
INSERT INTO t1 VALUES(4, 5, 6);
INSERT INTO t1 VALUES(7, 8, 9);
BEGIN;
PRAGMA writable_schema = on;
PRAGMA encoding = 'UTF-8';
PRAGMA page_size = '1024';
PRAGMA auto_vacuum = '0';
PRAGMA user_version = '0';
PRAGMA application_id = '0';
INSERT OR IGNORE INTO 't1'('a', 'b', 'c') VALUES (1, 2, 3);
INSERT OR IGNORE INTO 't1'('a', 'b', 'c') VALUES (4, 5, 6);
INSERT OR IGNORE INTO 't1'('a', 'b', 'c') VALUES (7, 8, 9);
PRAGMA writable_schema = off;
PRAGMA writable_schema = 1;
DELETE FROM sqlite_master WHERE name='t1';
BEGIN;
PRAGMA writable_schema = on;
PRAGMA encoding = 'UTF-8';
PRAGMA page_size = '1024';
PRAGMA auto_vacuum = '0';
PRAGMA user_version = '0';
PRAGMA application_id = '0';
CREATE TABLE lost_and_found(rootpgno INTEGER, pgno INTEGER, nfield INTEGER, id INTEGER, c0, c1, c2);
INSERT INTO lost_and_found VALUES(2, 2, 3, NULL, 2, 3, 1);
INSERT INTO lost_and_found VALUES(2, 2, 3, NULL, 5, 6, 4);
INSERT INTO lost_and_found VALUES(2, 2, 3, NULL, 8, 9, 7);
PRAGMA writable_schema = off;
SELECT name FROM sqlite_master;
BEGIN;
PRAGMA writable_schema = on;
PRAGMA encoding = 'UTF-8';
PRAGMA page_size = '1024';
PRAGMA auto_vacuum = '0';
PRAGMA user_version = '0';
PRAGMA application_id = '0';
CREATE TABLE lost_and_found_0(rootpgno INTEGER, pgno INTEGER, nfield INTEGER, id INTEGER, c0, c1, c2);
INSERT INTO lost_and_found_0 VALUES(2, 2, 3, NULL, 2, 3, 1);
INSERT INTO lost_and_found_0 VALUES(2, 2, 3, NULL, 5, 6, 4);
INSERT INTO lost_and_found_0 VALUES(2, 2, 3, NULL, 8, 9, 7);
PRAGMA writable_schema = off;
SELECT name FROM sqlite_master;
BEGIN;
PRAGMA writable_schema = on;
PRAGMA encoding = 'UTF-8';
PRAGMA page_size = '1024';
PRAGMA auto_vacuum = '0';
PRAGMA user_version = '0';
PRAGMA application_id = '0';
CREATE TABLE lost_and_found_1(rootpgno INTEGER, pgno INTEGER, nfield INTEGER, id INTEGER, c0, c1, c2);
INSERT INTO lost_and_found_1 VALUES(2, 2, 3, NULL, 2, 3, 1);
INSERT INTO lost_and_found_1 VALUES(2, 2, 3, NULL, 5, 6, 4);
INSERT INTO lost_and_found_1 VALUES(2, 2, 3, NULL, 8, 9, 7);
PRAGMA writable_schema = off;
SELECT name FROM sqlite_master;
SELECT * FROM lost_and_found_1;
BEGIN;
PRAGMA writable_schema = on;
PRAGMA encoding = 'UTF-8';
PRAGMA page_size = '4096';
PRAGMA auto_vacuum = '0';
PRAGMA user_version = '0';
PRAGMA application_id = '0';
PRAGMA writable_schema = off;
PRAGMA secure_delete = 0;
PRAGMA auto_vacuum = 0;
INSERT INTO t2 VALUES(1, 2, 3);
DROP TABLE t1;
DROP TABLE t2;
BEGIN;
PRAGMA writable_schema = on;
PRAGMA encoding = 'UTF-8';
PRAGMA page_size = '1024';
PRAGMA auto_vacuum = '0';
PRAGMA user_version = '0';
PRAGMA application_id = '0';
INSERT INTO lost_and_found VALUES(3, 3, 3, 1, 1, 2, 3);
INSERT INTO lost_and_found VALUES(3, 3, 3, 2, 'a', 'b', 'c');
PRAGMA writable_schema = off;
SELECT name FROM sqlite_schema;
SELECT id, c0, c1, c2 FROM lost_and_found;
BEGIN;
PRAGMA writable_schema = on;
PRAGMA encoding = 'UTF-8';
PRAGMA page_size = '1024';
PRAGMA auto_vacuum = '0';
PRAGMA user_version = '0';
PRAGMA application_id = '0';
PRAGMA writable_schema = off;
SELECT name FROM sqlite_schema;
SELECT * FROM t3;
