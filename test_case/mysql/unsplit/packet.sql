SELECT length("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") as len;
select repeat('a',2000);
select @@net_buffer_length, @@max_allowed_packet;
SELECT length("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") as len;
SELECT length("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") as len;
select length(repeat('a',2000));
CREATE TABLE t1 (c11 INT NOT NULL, c12 LONGTEXT,
                 PRIMARY KEY (c11)) charset latin1;
CREATE TABLE t2 (c21 INT NOT NULL, c22 LONGTEXT,
                 PRIMARY KEY (c21)) charset latin1;
INSERT INTO t1 VALUES(100,'abcd');
INSERT INTO t2 VALUES(100,'xyz');
UPDATE t1
SET c12= REPEAT('ab', @max_allowed_packet);
UPDATE IGNORE t1
SET c12= REPEAT('ab', @max_allowed_packet);
UPDATE t1, t2
SET c12= REPEAT('ab', @max_allowed_packet),
    c22= 'ab';
UPDATE IGNORE t1, t2
SET c12= REPEAT('ab', @max_allowed_packet),
    c22= 'ab';
INSERT INTO t1
VALUES (101, REPEAT('ab', @max_allowed_packet));
INSERT IGNORE INTO t1
SELECT 101, REPEAT('ab', @max_allowed_packet);
SELECT 102, REPEAT('ab', @max_allowed_packet);
DELETE FROM t1
WHERE c12 <=> REPEAT('ab', @max_allowed_packet);
DELETE FROM t1, t2
USING t1 INNER JOIN t2
WHERE t1.c11 = t2.c21 AND
      t2.c22 <=> REPEAT('ab', @max_allowed_packet);
DELETE IGNORE FROM t1, t2
USING t1 INNER JOIN t2
WHERE t1.c11 = t2.c21 AND
      t2.c22 <=> REPEAT('ab', @max_allowed_packet);
DELETE FROM t1;
DELETE FROM t2;
INSERT INTO t1 VALUES(100,'abcd');
INSERT INTO t2 VALUES(100,'xyz');
SELECT @@sql_mode;
UPDATE t1
SET c12= REPEAT('ab', @max_allowed_packet);
SELECT c11, LENGTH(c12) FROM t1;
INSERT INTO t1
VALUES (101, REPEAT('ab', @max_allowed_packet));
SELECT c11, LENGTH(c12) FROM t1;
INSERT INTO t1
SELECT 102, REPEAT('ab', @max_allowed_packet);
SELECT c11, LENGTH(c12) FROM t1;
DELETE FROM t1
WHERE c12 <=> REPEAT('ab', @max_allowed_packet);
SELECT c11, LENGTH(c12) FROM t1;
DROP TABLE t1, t2;