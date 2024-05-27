DROP TABLE IF EXISTS alter_attach;
CREATE TABLE alter_attach (x UInt64, p UInt8) ENGINE = MergeTree ORDER BY tuple() PARTITION BY p;
INSERT INTO alter_attach VALUES (1, 1), (2, 1), (3, 1);
ALTER TABLE alter_attach DETACH PARTITION 1;
ALTER TABLE alter_attach ADD COLUMN s String;
INSERT INTO alter_attach VALUES (4, 2, 'Hello'), (5, 2, 'World');
ALTER TABLE alter_attach ATTACH PARTITION 1;