DROP TABLE IF EXISTS null_00481;
DROP TABLE IF EXISTS null_view;
CREATE TABLE null_00481 (x UInt8) ENGINE = Null;
CREATE VIEW null_view AS SELECT * FROM null_00481;
INSERT INTO null_00481 VALUES (1);
SELECT * FROM null_00481;
SELECT * FROM null_view;
DROP TABLE null_00481;
DROP TABLE null_view;
