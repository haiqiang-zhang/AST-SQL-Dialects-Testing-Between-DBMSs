SELECT hex(SHA256(''));
DROP TABLE IF EXISTS defaults;
CREATE TABLE defaults
(
    s FixedString(20)
)ENGINE = Memory();
INSERT INTO defaults SELECT s FROM generateRandom('s FixedString(20)', 1, 1, 1) LIMIT 20;
DROP TABLE defaults;
