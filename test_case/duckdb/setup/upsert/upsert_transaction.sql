BEGIN TRANSACTION;
CREATE TABLE tbl (a SHORT PRIMARY KEY, b SHORT);
INSERT INTO tbl VALUES (1, 2) ON CONFLICT (a) DO UPDATE SET b = excluded.b;
INSERT INTO tbl VALUES (1, 3) ON CONFLICT (a) DO UPDATE SET b = excluded.b;
COMMIT;
BEGIN TRANSACTION;
INSERT INTO tbl VALUES
	(2, 1),
	(3, 1),
	(4, 1);
INSERT INTO tbl VALUES
	(2, 1),
	(3, 1),
	(4, 1) ON CONFLICT (a) DO NOTHING;
COMMIT;
BEGIN TRANSACTION;
INSERT INTO tbl VALUES
	(5, 0);
COMMIT;
BEGIN TRANSACTION;
INSERT INTO tbl VALUES (6,0);
COMMIT;
BEGIN TRANSACTION;
CREATE OR REPLACE TABLE tbl (a SHORT PRIMARY KEY, b SHORT);
INSERT INTO tbl (select i, 0 from range(2500) tbl(i));
INSERT INTO tbl (select i, i from range(2500) tbl(i)) ON CONFLICT (a) DO UPDATE SET b = excluded.b;
COMMIT;