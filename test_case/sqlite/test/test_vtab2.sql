BEGIN TRANSACTION;
CREATE TABLE t1(a INTEGER PRIMARY KEY, b, c, UNIQUE(b, c));
CREATE TABLE fkey(
      to_tbl,
      to_col
    );
INSERT INTO "fkey" VALUES('t1',NULL);
SELECT * FROM fkey;
