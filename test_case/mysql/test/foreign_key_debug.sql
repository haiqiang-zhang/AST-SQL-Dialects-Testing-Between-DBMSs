CREATE TABLE t1(a INT PRIMARY KEY);
CREATE TABLE t2(a INT PRIMARY KEY);
CREATE TABLE t3(a INT PRIMARY KEY, b INT, c INT);
ALTER TABLE t3 ADD FOREIGN KEY (b) REFERENCES t1(a);
ALTER TABLE t3 ADD FOREIGN KEY (c) REFERENCES t1(a);
ALTER TABLE t3 ADD FOREIGN KEY (b) REFERENCES t1(a);
ALTER TABLE t3 DROP FOREIGN KEY t3_ibfk_1;
ALTER TABLE t3 ADD FOREIGN KEY (b) REFERENCES t1(a);
DROP TABLE t3, t2, t1;
CREATE TABLE t1(a INT PRIMARY KEY);
CREATE TABLE name567890123456789012345678901234567890123456789012345678901234(a INT PRIMARY KEY, b INT);
DROP TABLE name567890123456789012345678901234567890123456789012345678901234, t1;
CREATE TABLE parent(pk INTEGER PRIMARY KEY, j INTEGER,
  UNIQUE KEY my_key (j));
CREATE TABLE child(pk INTEGER PRIMARY KEY, fk INTEGER,
  FOREIGN KEY (fk) REFERENCES parent(j));
DROP TABLES child, parent;
CREATE TABLE parent(pk INTEGER PRIMARY KEY, j INTEGER,
  UNIQUE KEY my_key (j));
CREATE TABLE child(pk INTEGER PRIMARY KEY, fk INTEGER,
  FOREIGN KEY (fk) REFERENCES parent(j));
CREATE TABLE child_copy LIKE child;
DROP TABLES child, child_copy, parent;
CREATE TABLE parent_base(pk INTEGER PRIMARY KEY, j INTEGER,
  UNIQUE KEY my_key (j));
CREATE TABLE parent LIKE parent_base;
CREATE TABLE source(pk INTEGER PRIMARY KEY, j INTEGER);
INSERT INTO source VALUES (1, 1);
INSERT INTO parent VALUES (2, 1);
CREATE TABLE child(pk INTEGER PRIMARY KEY, fk INTEGER,
  FOREIGN KEY (fk) REFERENCES parent(j));
SELECT * FROM child;
DROP TABLES source, child, parent;
CREATE TABLE parent(pk INTEGER PRIMARY KEY, j INTEGER,
  UNIQUE KEY parent_key(j));
CREATE TABLE child(pk INTEGER PRIMARY KEY, k INTEGER, fk INTEGER,
  FOREIGN KEY (fk) REFERENCES parent(j), UNIQUE KEY child_key(k));
CREATE TABLE grandchild(pk INTEGER PRIMARY KEY, fk INTEGER,
  FOREIGN KEY (fk) REFERENCES child(k));
DROP TABLE grandchild;
LOCK TABLES parent WRITE;
UNLOCK TABLES;
DROP TABLE child;
DROP TABLE parent;
CREATE TABLE parent(pk INTEGER PRIMARY KEY, j INTEGER,
  UNIQUE KEY parent_key(j));
CREATE TABLE child(pk INTEGER PRIMARY KEY, fk INTEGER,
  FOREIGN KEY (fk) REFERENCES parent(j) ON DELETE CASCADE);
PREPARE stmt FROM 'DELETE FROM parent WHERE pk = ?';
ALTER TABLE child ADD COLUMN (j INTEGER);
DROP TABLE child;
DROP TABLE parent;
CREATE TABLE parent(pk INTEGER PRIMARY KEY, i INTEGER, j INTEGER,
  UNIQUE KEY parent_i_key(i), UNIQUE KEY parent_j_key(j));
CREATE TABLE child(pk INTEGER PRIMARY KEY, fk_i INTEGER, fk_j INTEGER,
  FOREIGN KEY (fk_i) REFERENCES parent(i),
  FOREIGN KEY (fk_j) REFERENCES parent(j));
ALTER TABLE child RENAME TO siebling;
DROP TABLES siebling, parent;
CREATE TABLE parent(pk INTEGER PRIMARY KEY, i INTEGER,
  UNIQUE KEY parent_key(i));
CREATE TABLE child(pk INTEGER PRIMARY KEY, fk_i INTEGER,
  FOREIGN KEY (fk_i) REFERENCES parent(i));
DROP TABLES child, parent;
CREATE TABLE parent(pk INTEGER PRIMARY KEY, i INTEGER,
  UNIQUE KEY parent_key(i));
CREATE TABLE self (pk INT PRIMARY KEY, fk INT, FOREIGN KEY(fk) REFERENCES self(pk));
ALTER TABLE self RENAME TO self2;
ALTER TABLE self2 RENAME TO self3, ADD COLUMN i INT;
DROP TABLE self3;
CREATE SCHEMA s1;
DROP SCHEMA s1;
CREATE SCHEMA s1;
CREATE TABLE s1.child(pk INTEGER PRIMARY KEY, i INTEGER,
  UNIQUE KEY child_i_key(i));
DROP SCHEMA s1;
CREATE SCHEMA s1;
CREATE TABLE s1.child(pk INTEGER PRIMARY KEY, fk_i INTEGER);
DROP SCHEMA s1;
DROP TABLE parent;
CREATE TABLE parent(pk INTEGER PRIMARY KEY, i INTEGER,
  UNIQUE KEY parent_key(i));
CREATE TABLE child(pk INTEGER PRIMARY KEY, fk_i INTEGER,
  FOREIGN KEY (fk_i) REFERENCES parent(i));
ALTER TABLE child RENAME TO siebling;
DROP TABLE siebling, parent;
CREATE TABLE parent (i INT, j INT, PRIMARY KEY (i), UNIQUE u(i,j));
CREATE TABLE child (i INT, j INT, FOREIGN KEY (i, j) REFERENCES parent (i, j));
ALTER TABLE parent RENAME KEY u TO u1;
DROP TABLE child, parent;
CREATE TABLE parent (i INT, j INT, k INT, PRIMARY KEY (i), UNIQUE u(j), UNIQUE u1(i,j), UNIQUE u2(i,j,k));
CREATE TABLE child (i INT, j INT, k INT, FOREIGN KEY (i, j, k) REFERENCES parent (i, j, k));
ALTER TABLE parent RENAME KEY u2 TO u3;
DROP TABLE child, parent;
CREATE TABLE parent (i INT, j INT,
                     d INT GENERATED ALWAYS AS (i) VIRTUAL,
                     e INT GENERATED ALWAYS AS (j) VIRTUAL,
                     PRIMARY KEY (i), UNIQUE u(i,d), UNIQUE u1(i,j,e));
CREATE TABLE child (i INT, j INT, FOREIGN KEY (i, j) REFERENCES parent (i, j));
ALTER TABLE parent RENAME KEY u1 TO u2;
DROP TABLE child, parent;
CREATE TABLE parent (i INT, a VARCHAR(10), b VARCHAR(10),
                     PRIMARY KEY (i), UNIQUE u(i,a(5)), UNIQUE u1(i,a,b(5)));
CREATE TABLE child (i INT, a VARCHAR(10), FOREIGN KEY (i, a) REFERENCES parent (i, a));
ALTER TABLE parent RENAME KEY u1 TO u2;
DROP TABLE child, parent;
CREATE TABLE self (i INT, j INT, i2 INT, j2 INT, PRIMARY KEY (i), UNIQUE u(i,j),
                   FOREIGN KEY (i2, j2) REFERENCES self (i, j));
ALTER TABLE self RENAME KEY u TO u1;
DROP TABLE self;
CREATE TABLE self (i INT, j INT, k INT, i2 INT, j2 INT, k2 INT,
                   PRIMARY KEY (i), UNIQUE u(j), UNIQUE u1(i,j), UNIQUE u2(i,j,k),
                   FOREIGN KEY (i2, j2, k2) REFERENCES self (i, j, k));
ALTER TABLE self RENAME KEY u2 TO u3;
DROP TABLE self;
CREATE TABLE self (i INT, j INT, i2 INT, j2 INT,
                   d INT GENERATED ALWAYS AS (i) VIRTUAL,
                   e INT GENERATED ALWAYS AS (j) VIRTUAL,
                     PRIMARY KEY (i), UNIQUE u(i,d), UNIQUE u1(i,j,e),
                     FOREIGN KEY (i2, j2) REFERENCES self (i, j));
ALTER TABLE self RENAME KEY u1 TO u2;
DROP TABLE self;
CREATE TABLE self (i INT, a VARCHAR(10), b VARCHAR(10), i2 INT, a2 VARCHAR(10),
                   PRIMARY KEY (i), UNIQUE u(i,a(5)), UNIQUE u1(i,a,b(5)),
                   FOREIGN KEY (i2, a2) REFERENCES self (i, a));
ALTER TABLE self RENAME KEY u1 TO u2;
DROP TABLE self;
CREATE TABLE parent (pk INT PRIMARY KEY);
CREATE TABLE child (fk INT);
INSERT INTO parent VALUES (1);
ALTER TABLE parent ADD COLUMN a INT;
SELECT * FROM parent;
DELETE FROM parent;
DROP TABLES child, parent;
