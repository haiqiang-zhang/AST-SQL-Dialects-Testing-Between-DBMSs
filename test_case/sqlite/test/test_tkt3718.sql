BEGIN;
INSERT INTO t2 SELECT a, b FROM t1;
SELECT a FROM t2;
DELETE FROM t2 WHERE a > 5;
PRAGMA count_changes = 1;
BEGIN;
SELECT a FROM t2;
pragma count_changes=0;
DELETE FROM t2 WHERE a = 6;
DELETE FROM t2 WHERE a = 7;
DELETE FROM t2 WHERE a = 8;
DELETE FROM t2 WHERE a = 9;
DELETE FROM t2 WHERE a = 10;
SELECT a from t2;
DELETE FROM t2 WHERE a > 5;
BEGIN;
SELECT a FROM t2;
DELETE FROM t2 WHERE a > 5;
BEGIN;
INSERT INTO t2 SELECT a+10, b FROM t1;
SELECT a FROM t2 ORDER BY a+0;
PRAGMA integrity_check;
DELETE FROM t2;
INSERT INTO t2 SELECT a+5, b FROM t1;
INSERT INTO t2 SELECT a+15, b FROM t1;
BEGIN;
INSERT INTO t2 SELECT a+10, b FROM t1;
SELECT a FROM t2 ORDER BY a+0;
PRAGMA integrity_check;
DELETE FROM t2;
INSERT INTO t2 SELECT a+5, b FROM t1;
INSERT INTO t2 SELECT a+15, b FROM t1;
BEGIN;
INSERT INTO t2 SELECT a+10, b FROM t1;
SELECT a FROM t2 ORDER BY a+0;
PRAGMA integrity_check;
DELETE FROM t2;
INSERT INTO t2 SELECT a+5, b FROM t1;
INSERT INTO t2 SELECT a+15, b FROM t1;
BEGIN;
SELECT a FROM t2 ORDER BY a+0;
PRAGMA integrity_check;
DELETE FROM t2;
INSERT INTO t2 SELECT a+5, b FROM t1;
INSERT INTO t2 SELECT a+15, b FROM t1;
BEGIN;
SELECT a FROM t2 ORDER BY a+0;
PRAGMA integrity_check;
DELETE FROM t2;
INSERT INTO t2 SELECT a+5, b FROM t1;
INSERT INTO t2 SELECT a+15, b FROM t1;
INSERT INTO t2 SELECT a+25, b FROM t1;
BEGIN;
INSERT INTO t2 SELECT a+20, b FROM t1;
SELECT a FROM t2 WHERE (a%5)==0 ORDER BY a+0;
SELECT 
        (SELECT sum(a) FROM t2)==(SELECT sum(a*5-10) FROM t2 WHERE (a%5)==0);
PRAGMA integrity_check;
DELETE FROM t2;
INSERT INTO t2 SELECT a+5, b FROM t1;
INSERT INTO t2 SELECT a+15, b FROM t1;
INSERT INTO t2 SELECT a+25, b FROM t1;
BEGIN;
SELECT a FROM t2 WHERE (a%5)==0 ORDER BY a+0;
SELECT 
        (SELECT sum(a) FROM t2)==(SELECT sum(a*5-10) FROM t2 WHERE (a%5)==0);
PRAGMA integrity_check;
DELETE FROM t2;
INSERT INTO t2 SELECT a+5, b FROM t1;
INSERT INTO t2 SELECT a+15, b FROM t1;
INSERT INTO t2 SELECT a+25, b FROM t1;
BEGIN;
INSERT INTO t2 SELECT a+20, b FROM t1;
SELECT a FROM t2 WHERE (a%5)==0 ORDER BY a+0;
SELECT 
        (SELECT sum(a) FROM t2)==(SELECT sum(a*5-10) FROM t2 WHERE (a%5)==0);
PRAGMA integrity_check;
DELETE FROM t2;
INSERT INTO t2 SELECT a+5, b FROM t1;
INSERT INTO t2 SELECT a+15, b FROM t1;
INSERT INTO t2 SELECT a+25, b FROM t1;
BEGIN;
SELECT a FROM t2 WHERE (a%5)==0 ORDER BY a+0;
SELECT 
        (SELECT sum(a) FROM t2)==(SELECT sum(a*5-10) FROM t2 WHERE (a%5)==0);
PRAGMA integrity_check;
DELETE FROM t2;
INSERT INTO t2 SELECT a+5, b FROM t1;
INSERT INTO t2 SELECT a+15, b FROM t1;
INSERT INTO t2 SELECT a+25, b FROM t1;
BEGIN;
INSERT INTO t2 SELECT a+20, b FROM t1;
SELECT a FROM t2 WHERE (a%5)==0 ORDER BY a+0;
SELECT 
        (SELECT sum(a) FROM t2)==(SELECT sum(a*5-10) FROM t2 WHERE (a%5)==0);
PRAGMA integrity_check;
DELETE FROM t2;
INSERT INTO t2 SELECT a+5, b FROM t1;
INSERT INTO t2 SELECT a+15, b FROM t1;
INSERT INTO t2 SELECT a+25, b FROM t1;
BEGIN;
SELECT a FROM t2 WHERE (a%5)==0 ORDER BY a+0;
SELECT 
        (SELECT sum(a) FROM t2)==(SELECT sum(a*5-10) FROM t2 WHERE (a%5)==0);
PRAGMA integrity_check;
DELETE FROM t2;
INSERT INTO t2 SELECT a+5, b FROM t1;
INSERT INTO t2 SELECT a+15, b FROM t1;
INSERT INTO t2 SELECT a+25, b FROM t1;
BEGIN;
INSERT INTO t2 SELECT a+20, b FROM t1;
SELECT a FROM t2 WHERE (a%5)==0 ORDER BY a+0;
SELECT 
        (SELECT sum(a) FROM t2)==(SELECT sum(a*5-10) FROM t2 WHERE (a%5)==0);
PRAGMA integrity_check;
DELETE FROM t2;
INSERT INTO t2 SELECT a+5, b FROM t1;
INSERT INTO t2 SELECT a+15, b FROM t1;
INSERT INTO t2 SELECT a+25, b FROM t1;
BEGIN;
SELECT a FROM t2 WHERE (a%5)==0 ORDER BY a+0;
SELECT 
        (SELECT sum(a) FROM t2)==(SELECT sum(a*5-10) FROM t2 WHERE (a%5)==0);
PRAGMA integrity_check;