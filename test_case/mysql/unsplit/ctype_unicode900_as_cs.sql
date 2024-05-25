DROP TABLE IF EXISTS t1;
SELECT HEX(CONVERT(_utf8mb4 0xF091AB9B41 USING ucs2));
SELECT HEX(CONVERT(_utf8mb4 0xF091AB9B41 USING utf16));
SELECT HEX(CONVERT(_utf8mb4 0xF091AB9B41 USING utf32));
SELECT HEX(CONVERT(_ucs2 0xF8FF USING utf8mb4));
SELECT HEX(CONVERT(_utf16 0xF8FF USING utf8mb4));
SELECT HEX(CONVERT(_utf32 0xF8FF USING utf8mb4));
SELECT ASCII('ABC');
SELECT BIT_LENGTH('a');
SELECT BIT_LENGTH('ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ');
SELECT BIT_LENGTH('ÃÂÃÂÃÂÃÂ£ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ');
SELECT BIT_LENGTH('ÃÂÃÂÃÂÃÂ°ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ');
SELECT CHAR_LENGTH('ÃÂÃÂÃÂÃÂ°ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ£ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂa');
SELECT LENGTH('ÃÂÃÂÃÂÃÂ°ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ£ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂa');
SELECT FIELD('a', 'ÃÂÃÂÃÂÃÂ°ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ£ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂa');
SELECT HEX('ÃÂÃÂÃÂÃÂ°ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ£ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂa');
SELECT INSERT('ÃÂÃÂÃÂÃÂ°ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ£ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂa', 2, 2, 'ÃÂÃÂÃÂÃÂ£ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂb');
SELECT LOWER('ÃÂÃÂÃÂÃÂ°ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ£ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂBcd');
SELECT ORD('ÃÂÃÂÃÂÃÂ°ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ');
SELECT UPPER('ÃÂÃÂÃÂÃÂ°ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ£ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ bCD');
SELECT LOCATE(_utf8mb4 0xF091AB9B41, _utf8mb4 0xF091AB9B42F091AB9B41F091AB9B43);
SELECT HEX(REVERSE(_utf8mb4 0xF091AB9B41F091AB9B42F091AB9B43));
SELECT HEX(SUBSTRING(_utf8mb4 0xF091AB9B41F091AB9B42F091AB9B43, 1, 2));
SELECT HEX(SUBSTRING(_utf8mb4 0xF091AB9B41F091AB9B42F091AB9B43, -3, 2));
SELECT HEX(TRIM(_utf8mb4 0x2020F091AB9B4120F091AB9B4120202020));
SELECT HEX(WEIGHT_STRING('aA'));
SELECT HEX(WEIGHT_STRING(CAST(_utf32 x'337F' AS CHAR)));
SELECT HEX(WEIGHT_STRING(CAST(_utf32 x'FDFA' AS CHAR)));
SELECT 'a' = 'a ';
SELECT 'a\0' < 'a';
SELECT 'a\0' < 'a ';
SELECT 'a\t' < 'a';
SELECT 'a\t' < 'a ';
SELECT 'a' LIKE 'a';
SELECT 'A' LIKE 'a';
SELECT _utf8mb4 0xD0B0D0B1D0B2 LIKE CONCAT(_utf8mb4'%',_utf8mb4 0xD0B1,_utf8mb4 '%');
CREATE TABLE t1 (c VARCHAR(10) CHARACTER SET utf8mb4);
INSERT INTO t1 VALUES (_utf8mb4 0xF09090A7), (_utf8mb4 0xEA8B93), (_utf8mb4 0xC4BC), (_utf8mb4 0xC6AD), (_utf8mb4 0xF090918F), (_utf8mb4 0xEAAD8B);
SELECT HEX(ANY_VALUE(c)), COUNT(c) FROM t1 GROUP BY c COLLATE utf8mb4_0900_as_cs;
DROP TABLE t1;
CREATE TABLE t1 (a VARCHAR(10), b VARCHAR(10)) COLLATE utf8mb4_0900_as_cs;
INSERT INTO t1 VALUES(_utf16 0xAC00, _utf16 0x326E), (_utf16 0xAD, _utf16 0xA0),
(_utf16 0xC6, _utf16 0x41), (_utf16 0xC6, _utf16 0xAA), (_utf16 0xA73A, _utf16 0xA738);
SELECT a = b FROM t1;
DROP TABLE t1;
CREATE TABLE t1 (c1 CHAR(10) COLLATE utf8mb4_0900_as_cs);
SELECT c1, hex(weight_string(c1)) FROM t1 ORDER BY c1 COLLATE utf8mb4_0900_as_cs;
DROP TABLE t1;
CREATE TABLE t1 (a CHAR(10)) COLLATE utf8mb4_da_0900_as_cs;
INSERT INTO t1 VALUES('z'), (_utf16 0x00C50053), (_utf16 0x00C50073), (_utf16 0x00E50053), (_utf16 0x00E50073), (_utf16 0x00C10053), (_utf16 0x00C10073), (_utf16 0x00E10073), (_utf16 0x00E10053), ('aAS'), ('aAs'), ('AS'), ('As'), ('as'), ('aS'), ('aas'), ('AAS'), ('Aas'), ('AAs'), ('aaS'), ('AaS');
SELECT HEX(CONVERT(a USING utf16)), HEX(WEIGHT_STRING(a)) FROM t1 ORDER BY a, BINARY a;
DROP TABLE t1;
CREATE TABLE t1 (a VARCHAR(10), b VARCHAR(10)) COLLATE utf8mb4_da_0900_as_cs;
INSERT INTO t1 VALUES (_utf16 0x00DE, _utf16 0x0074), (_utf16 0x0162, _utf16 0x00DE), (_utf16 0x0162, _utf16 0x00FE),
(_utf16 0x0163, _utf16 0x00DE), (_utf16 0x0163, _utf16 0x00FE), (_utf16 0x0164, _utf16 0x00DE),
(_utf16 0x0164, _utf16 0x00FE), (_utf16 0x0165, _utf16 0x00DE), (_utf16 0x0165, _utf16 0x00FE),
(_utf16 0x01D5, _utf16 0x00DC), (_utf16 0x01D5, _utf16 0x00FC), (_utf16 0x01D7, _utf16 0x00DC),
(_utf16 0x01D7, _utf16 0x00FC), (_utf16 0x01D8, _utf16 0x01D5), (_utf16 0x01D9, _utf16 0x00DC),
(_utf16 0x01D9, _utf16 0x00FC), (_utf16 0x01D9, _utf16 0x01D7), (_utf16 0x01D9, _utf16 0x01D8),
(_utf16 0x01DA, _utf16 0x01D5), (_utf16 0x01DA, _utf16 0x01D8), (_utf16 0x01DB, _utf16 0x00DC),
(_utf16 0x01DB, _utf16 0x00FC), (_utf16 0x01DB, _utf16 0x01D7), (_utf16 0x01DB, _utf16 0x01D8),
(_utf16 0x01DC, _utf16 0x01D5), (_utf16 0x01DC, _utf16 0x01D8), (_utf16 0x01DC, _utf16 0x01D9),
(_utf16 0x01DE, _utf16 0x00C4), (_utf16 0x01DE, _utf16 0x00E4), (_utf16 0x01E2, _utf16 0x00C6),
(_utf16 0x01E2, _utf16 0x00E6), (_utf16 0x01FA, _utf16 0x00C5), (_utf16 0x01FA, _utf16 0x00E5),
(_utf16 0x01FC, _utf16 0x00C6), (_utf16 0x01FC, _utf16 0x00E6), (_utf16 0x01FD, _utf16 0x01E2),
(_utf16 0x01FE, _utf16 0x00D8), (_utf16 0x01FE, _utf16 0x00F8), (_utf16 0x021A, _utf16 0x00DE),
(_utf16 0x021A, _utf16 0x00FE), (_utf16 0x021B, _utf16 0x00DE), (_utf16 0x021B, _utf16 0x00FE),
(_utf16 0x022A, _utf16 0x00D6), (_utf16 0x022A, _utf16 0x00F6), (_utf16 0x02A8, _utf16 0x00DE),
(_utf16 0x02A8, _utf16 0x00FE);
SELECT a > b FROM t1;
DROP TABLE t1;
CREATE TABLE t1 (a VARCHAR(10), b VARCHAR(10), c integer) COLLATE utf8mb4_vi_0900_as_cs;
INSERT INTO t1 VALUES (_utf16 0x00C1, _utf16 0x00C0, 1),
(_utf16 0x00C3, _utf16 0x00C1, 0), (_utf16 0x00C4, _utf16 0x00C3, 1),
(_utf16 0x00C5, _utf16 0x00C3, 1), (_utf16 0x00C9, _utf16 0x00C8, 1),
(_utf16 0x00CD, _utf16 0x00CC, 1), (_utf16 0x00D3, _utf16 0x00D2, 1),
(_utf16 0x00D5, _utf16 0x00D3, 0), (_utf16 0x00D6, _utf16 0x00D5, 1),
(_utf16 0x00DA, _utf16 0x00D9, 1), (_utf16 0x00E0, _utf16 0x00C1, 0),
(_utf16 0x00E1, _utf16 0x00C0, 1), (_utf16 0x00E3, _utf16 0x00C1, 0),
(_utf16 0x00E4, _utf16 0x00C3, 1), (_utf16 0x00E5, _utf16 0x00C3, 1),
(_utf16 0x00E8, _utf16 0x00C9, 0), (_utf16 0x00E9, _utf16 0x00C8, 1),
(_utf16 0x00EC, _utf16 0x00CD, 0), (_utf16 0x00ED, _utf16 0x00CC, 1),
(_utf16 0x00F2, _utf16 0x00D3, 0), (_utf16 0x00F3, _utf16 0x00D2, 1),
(_utf16 0x00F5, _utf16 0x00D3, 0), (_utf16 0x00F6, _utf16 0x00D5, 1),
(_utf16 0x00F9, _utf16 0x00DA, 0), (_utf16 0x00FA, _utf16 0x00D9, 1),
(_utf16 0x0128, _utf16 0x00CD, 0), (_utf16 0x0129, _utf16 0x00CD, 0),
(_utf16 0x012C, _utf16 0x0128, 1), (_utf16 0x012D, _utf16 0x0128, 1),
(_utf16 0x0143, _utf16 0x00D1, 1), (_utf16 0x0144, _utf16 0x00D1, 1),
(_utf16 0x0147, _utf16 0x00D1, 1), (_utf16 0x0148, _utf16 0x00D1, 1),
(_utf16 0x014E, _utf16 0x00D5, 1), (_utf16 0x014F, _utf16 0x00D5, 1),
(_utf16 0x0150, _utf16 0x00D5, 1), (_utf16 0x0151, _utf16 0x00D5, 1),
(_utf16 0x0168, _utf16 0x00DA, 0), (_utf16 0x0169, _utf16 0x00DA, 0),
(_utf16 0x016C, _utf16 0x0168, 1), (_utf16 0x016D, _utf16 0x0168, 1),
(_utf16 0x016E, _utf16 0x0168, 1), (_utf16 0x016F, _utf16 0x0168, 1),
(_utf16 0x0170, _utf16 0x0168, 1), (_utf16 0x0171, _utf16 0x0168, 1),
(_utf16 0x01CD, _utf16 0x00C3, 1), (_utf16 0x01CE, _utf16 0x00C3, 1),
(_utf16 0x01CF, _utf16 0x0128, 1), (_utf16 0x01D0, _utf16 0x0128, 1),
(_utf16 0x01D1, _utf16 0x00D5, 1), (_utf16 0x01D2, _utf16 0x00D5, 1),
(_utf16 0x01D3, _utf16 0x0168, 1), (_utf16 0x01D4, _utf16 0x0168, 1),
(_utf16 0x01D5, _utf16 0x0168, 1), (_utf16 0x01D6, _utf16 0x0168, 1),
(_utf16 0x01D7, _utf16 0x0168, 1), (_utf16 0x01D8, _utf16 0x0168, 1),
(_utf16 0x01D9, _utf16 0x0168, 1), (_utf16 0x01DA, _utf16 0x0168, 1),
(_utf16 0x01DB, _utf16 0x0168, 1), (_utf16 0x01DC, _utf16 0x0168, 1),
(_utf16 0x01DE, _utf16 0x00C3, 1), (_utf16 0x01DF, _utf16 0x00C3, 1),
(_utf16 0x01F8, _utf16 0x0143, 0), (_utf16 0x01F9, _utf16 0x0143, 0),
(_utf16 0x01FA, _utf16 0x00C3, 1), (_utf16 0x01FB, _utf16 0x00C3, 1),
(_utf16 0x022A, _utf16 0x00D5, 1), (_utf16 0x022B, _utf16 0x00D5, 1),
(_utf16 0x022C, _utf16 0x00D3, 0), (_utf16 0x022D, _utf16 0x00D3, 0);
SELECT a, b, c FROM t1 where (a > b) <> c;
DROP TABLE t1;
SELECT CONVERT(_utf16 0x212B USING utf8mb4) = CONVERT(_utf16 0x00C5 USING
utf8mb4) COLLATE utf8mb4_da_0900_as_cs AS result;
CREATE TABLE t1(a CHAR, b CHAR, c INTEGER) COLLATE utf8mb4_vi_0900_as_cs;
INSERT INTO t1 VALUES (_utf16 0x1F8C , _utf16 0x1F02, 1),
       (_utf16 0x1F8D , _utf16 0x1F03, 1), (_utf16 0x1F9C , _utf16 0x1F22, 1),
       (_utf16 0x1F9D , _utf16 0x1F23, 1), (_utf16 0x1FAC , _utf16 0x1F62, 1),
       (_utf16 0x1FAD , _utf16 0x1F63, 1), (_utf16 0x1FCE , _utf16 0x1FCD, 1),
       (_utf16 0x1FDE , _utf16 0x1FDD, 1), (_utf16 0x1FED , _utf16 0x0385, 0),
       (_utf16 0x1FEE , _utf16 0x1FED, 1);
SELECT a, b, c FROM t1 where (a > b) <> c;
DROP TABLE t1;
CREATE TABLE t1(a CHAR, description VARCHAR(30)) COLLATE utf8mb4_ja_0900_as_cs;
INSERT INTO t1 VALUES('a', 'Latin'), ('A', 'Latin'), (_utf16 0x02AC, 'Latin'),
(_utf16 0x02AD, 'Latin'), (_utf16 0x03B1, 'Greak'), (_utf16 0x2C81, 'Coptic'),
(_utf16 0x0430, 'Cyrillic'), (_utf16 0xD7FB, 'Hangul'),
(_utf16 0x3041, 'Hiragana'), (_utf16 0x3105, 'Bopomofo'),
(_utf16 0x2F00, 'Other Han'), (_utf16 0x4E00, 'Japanese Han'),
(_utf16 0x9FFF, 'Other'), (_utf16 0xA000, 'Other'),
(_utf16 0x9FD5, 'Other Han'), (_utf16 0xFA0E, 'Other Han'),
(_utf16 0x3400, 'Other Han'), (_utf16 0x4E9C, 'Japanese Han'),
(_utf16 0x7199, 'Japanese Han'), (_utf16 0x6190, 'Japanese Han'),
(_utf16 0x30F3, 'Katakana'), (_utf16 0x306F, 'Hiragana HA'),
(_utf16 0x3070, 'Hiragana BA'), (_utf16 0x3071, 'Hiragana PA');
SELECT HEX(CONVERT(a USING utf16)), description FROM t1 ORDER BY a;
DROP TABLE t1;
CREATE TABLE t1(a CHAR, description VARCHAR(30)) COLLATE utf8mb4_ja_0900_as_cs_ks;
INSERT INTO t1 VALUES('a', 'Latin'), ('A', 'Latin'), (_utf16 0x02AC, 'Latin'),
(_utf16 0x02AD, 'Latin'), (_utf16 0x03B1, 'Greak'), (_utf16 0x2C81, 'Coptic'),
(_utf16 0x0430, 'Cyrillic'), (_utf16 0xD7FB, 'Hangul'),
(_utf16 0x3041, 'Hiragana'), (_utf16 0x3105, 'Bopomofo'),
(_utf16 0x2F00, 'Other Han'), (_utf16 0x4E00, 'Japanese Han'),
(_utf16 0x9FFF, 'Other'), (_utf16 0xA000, 'Other'),
(_utf16 0x9FD5, 'Other Han'), (_utf16 0xFA0E, 'Other Han'),
(_utf16 0x3400, 'Other Han'), (_utf16 0x4E9C, 'Japanese Han'),
(_utf16 0x7199, 'Japanese Han'), (_utf16 0x6190, 'Japanese Han'),
(_utf16 0x30F3, 'Katakana'), (_utf16 0x306F, 'Hiragana HA'),
(_utf16 0x3070, 'Hiragana BA'), (_utf16 0x3071, 'Hiragana PA');
SELECT HEX(CONVERT(a USING utf16)), description FROM t1 ORDER BY a;
DROP TABLE t1;
SELECT STRCMP(@s1 COLLATE utf8mb4_ja_0900_as_cs, @s2 COLLATE utf8mb4_ja_0900_as_cs);
SELECT STRCMP(@s2 COLLATE utf8mb4_ja_0900_as_cs, @s3 COLLATE utf8mb4_ja_0900_as_cs);
SELECT STRCMP(@s3 COLLATE utf8mb4_ja_0900_as_cs, @s4 COLLATE utf8mb4_ja_0900_as_cs);
SELECT STRCMP(@s1 COLLATE utf8mb4_ja_0900_as_cs_ks, @s2 COLLATE utf8mb4_ja_0900_as_cs_ks);
SELECT STRCMP(@s2 COLLATE utf8mb4_ja_0900_as_cs_ks, @s3 COLLATE utf8mb4_ja_0900_as_cs_ks);
SELECT STRCMP(@s3 COLLATE utf8mb4_ja_0900_as_cs_ks, @s4 COLLATE utf8mb4_ja_0900_as_cs_ks);
SELECT STRCMP(@s1 COLLATE utf8mb4_ja_0900_as_cs, @s2 COLLATE utf8mb4_ja_0900_as_cs);
SELECT STRCMP(@s1 COLLATE utf8mb4_ja_0900_as_cs_ks, @s2 COLLATE utf8mb4_ja_0900_as_cs_ks);
CREATE TABLE t1(a VARCHAR(20)) COLLATE utf8mb4_ja_0900_as_cs_ks;
INSERT INTO t1 VALUES(_utf16 0x30FC), (_utf16 0x30A230FC), (_utf16 0x304230FC),
(_utf16 0x65E5672C8A9E), (_utf16 0x30443059309E), (_utf16 0x30443059305A),
(_utf16 0x30A430B930FE), (_utf16 0x30A430B930BA),
(_utf16 0x65E5672C8A9E30CB30DB30F330B4);
SELECT HEX(CONVERT(a USING utf16)), HEX(WEIGHT_STRING(a)) FROM t1 ORDER BY a;
DROP TABLE t1;
CREATE TABLE t1(a VARCHAR(20), KEY a (a)) COLLATE utf8mb4_ja_0900_as_cs_ks
PARTITION BY KEY (a) PARTITIONS 3;
INSERT INTO t1 VALUES(_utf16 0x30FC), (_utf16 0x30A230FC), (_utf16 0x304230FC),
(_utf16 0x65E5672C8A9E), (_utf16 0x30443059309E), (_utf16 0x30443059305A),
(_utf16 0x30A430B930FE), (_utf16 0x30A430B930BA),
(_utf16 0x65E5672C8A9E30CB30DB30F330B4);
SELECT HEX(CONVERT(a USING utf16)) FROM t1 WHERE a = _utf16 0x30443059305A;
DROP TABLE t1;
CREATE TABLE t1 (a VARCHAR(10)) COLLATE utf8mb4_ru_0900_as_cs;
INSERT INTO t1 VALUES(_utf16 0x0452), (_utf16 0x0453), (_utf16 0x0403),
       (_utf16 0x0439), (_utf16 0x048B), (_utf16 0x048A), (_utf16 0x043B),
       (_utf16 0x1D2B), (_utf16 0x045B), (_utf16 0x045C), (_utf16 0x040C);
SELECT HEX(CONVERT(a USING utf16)) AS codepoint FROM t1 ORDER BY a, HEX(a);
DROP TABLE t1;
CREATE TABLE t1 (
      codepoint CHAR(1) CHARSET utf16 NOT NULL,
      glyph CHAR(2) CHARSET utf8mb4 COLLATE utf8mb4_mn_cyrl_0900_as_cs NOT NULL,
      description VARCHAR(64) NOT NULL);
SELECT HEX(codepoint), codepoint, glyph, description FROM t1 ORDER BY glyph, codepoint;
DROP TABLE t1;
CREATE TABLE t1(a VARCHAR(10)) COLLATE utf8mb4_zh_0900_as_cs;
INSERT INTO t1 VALUES(_utf16 0x2E87), (_utf16 0x2E8D), (_utf16 0x2F17),
(_utf16 0x3038), (_utf16 0x24B6), (_utf32 0x1F150), (_utf16 0x4E2D),
(_utf16 0x3197), (_utf32 0x1F22D), ('A'), ('a'), ('Z'), ('z'),
(_utf16 0x3082), (_utf16 0x30E2), (_utf16 0x2E31), (_utf16 0x33E8),
(_utf32 0x1F229), (_utf32 0x1F241), (_utf16 0xFA56);
SELECT HEX(CONVERT(a USING utf32)), HEX(WEIGHT_STRING(a)) FROM t1 ORDER BY a, HEX(a);
DROP TABLE t1;
CREATE TABLE t1(a VARCHAR(10)) COLLATE utf8mb4_zh_0900_as_cs;
INSERT INTO t1 VALUES(_utf16 0x6C88), (_utf16 0x5F1E), (_utf16 0x9633),
(_utf16 0x6C889633), (_utf16 0x5F1E9633);
SELECT HEX(CONVERT(a USING utf32)), HEX(WEIGHT_STRING(a)) FROM t1 ORDER BY a, HEX(a);
DROP TABLE t1;
CREATE TABLE t1(a VARCHAR(10), b VARCHAR(10)) COLLATE utf8mb4_zh_0900_as_cs;
INSERT INTO t1 VALUES(_utf16 0xF902, _utf16 0x2F9E), (_utf16 0xF907, _utf16 0x2FD4),
(_utf16 0xF908, _utf16 0x2FD4), (_utf16 0xF9D1, _utf16 0x3285);
SELECT HEX(CONVERT(a USING utf16)) AS a_u16, HEX(CONVERT(b USING utf16)) AS b_u16, a = b FROM t1;
DROP TABLE t1;
CREATE TABLE t1(a VARCHAR(10)) COLLATE utf8mb4_zh_0900_as_cs;
INSERT INTO t1 VALUES(_utf16 0x1EC2), (_utf16 0x1EC3), (_utf16 0x1EC5), (_utf16 0x1EC0), (_utf16 0x1EC7), (_Utf16 0x1EBF);
SELECT HEX(CONVERT(a USING utf16)) FROM t1 ORDER BY a;
DROP TABLE t1;
