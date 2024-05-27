DROP TABLE IF EXISTS nested;
CREATE TABLE nested (x UInt8, n Nested(a UInt64, b String)) ENGINE = TinyLog;
INSERT INTO nested VALUES (1, [2, 3], ['Hello', 'World']);
INSERT INTO nested VALUES (4, [5], ['Goodbye']);