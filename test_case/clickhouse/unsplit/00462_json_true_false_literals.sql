DROP TABLE IF EXISTS json;
CREATE TABLE json (x UInt8, title String) ENGINE = Memory;
SELECT * FROM json ORDER BY title;
DROP TABLE IF EXISTS json;
