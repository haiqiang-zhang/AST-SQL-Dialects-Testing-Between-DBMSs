CREATE TABLE integers(i INTEGER);
INSERT INTO integers VALUES (3), (4), (5);
INSERT INTO integers SELECT i+3 FROM integers;
CREATE TABLE integers2 AS SELECT i, i+2 AS j FROM integers;