

SELECT '-- Negative tests';
SELECT '-- Regular cases';
SELECT '2001:4860:4860::8888' AS idna, idnaEncode(idna) AS ascii, tryIdnaEncode(idna) AS ascii_try, idnaDecode(ascii) AS original, idnaDecode(ascii_try) AS original_try;
SELECT 'AMAZON' AS idna, idnaEncode(idna) AS ascii, tryIdnaEncode(idna) AS ascii_try, idnaDecode(ascii) AS original, idnaDecode(ascii_try) AS original_try;
SELECT 'aa--' AS idna, idnaEncode(idna) AS ascii, tryIdnaEncode(idna) AS ascii_try, idnaDecode(ascii) AS original, idnaDecode(ascii_try) AS original_try;
SELECT 'ab--c' AS idna, idnaEncode(idna) AS ascii, tryIdnaEncode(idna) AS ascii_try, idnaDecode(ascii) AS original, idnaDecode(ascii_try) AS original_try;
SELECT '-x.xn--zca' AS idna, idnaEncode(idna) AS ascii, tryIdnaEncode(idna) AS ascii_try, idnaDecode(ascii) AS original, idnaDecode(ascii_try) AS original_try;
SELECT 'x-.xn--zca' AS idna, idnaEncode(idna) AS ascii, tryIdnaEncode(idna) AS ascii_try, idnaDecode(ascii) AS original, idnaDecode(ascii_try) AS original_try;
SELECT '128.0,0.1' AS idna, idnaEncode(idna) AS ascii, tryIdnaEncode(idna) AS ascii_try, idnaDecode(ascii) AS original, idnaDecode(ascii_try) AS original_try;
SELECT 'xn--zca.xn--zca' AS idna, idnaEncode(idna) AS ascii, tryIdnaEncode(idna) AS ascii_try, idnaDecode(ascii) AS original, idnaDecode(ascii_try) AS original_try;
SELECT 'x01234567890123456789012345678901234567890123456789012345678901x' AS idna, idnaEncode(idna) AS ascii, tryIdnaEncode(idna) AS ascii_try, idnaDecode(ascii) AS original, idnaDecode(ascii_try) AS original_try;
SELECT 'x01234567890123456789012345678901234567890123456789012345678901x.xn--zca' AS idna, idnaEncode(idna) AS ascii, tryIdnaEncode(idna) AS ascii_try, idnaDecode(ascii) AS original, idnaDecode(ascii_try) AS original_try;
SELECT '01234567890123456789012345678901234567890123456789.01234567890123456789012345678901234567890123456789.01234567890123456789012345678901234567890123456789.01234567890123456789012345678901234567890123456789.0123456789012345678901234567890123456789012345678.x' AS idna, idnaEncode(idna) AS ascii, tryIdnaEncode(idna) AS ascii_try, idnaDecode(ascii) AS original, idnaDecode(ascii_try) AS original_try;
SELECT 'aa--' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'ab--c' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT '-x' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT '' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'xn--1ch' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'xn--dqd20apc' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'xn--gdh' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'xn--80aaa0ahbbeh4c' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'xn--3bs854c' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'xn--mgb9awbf' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'xn--mgbaam7a8h' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'xn--mgbbh1a71e' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'xn--s7y.com' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'xn--55qx5d.xn--tckwe' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'xn--4dbrk0ce' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'xn--zckzah' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'xn--p1ai.com' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'xn--mxahbxey0c.gr' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'xn--h2brj9c' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'xn--d1acpjx3f.xn--p1ai' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'xn--q9jyb4c' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'xn--sterreich-z7a.at' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'xn--h2breg3eve.xn--h2brj9c' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'ejemplo.xn--q9jyb4c' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'xn--9t4b11yi5a.com' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'xn--gk3at1e.com' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'xn--42c2d9a' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT '1xn--' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'xn--bih.com' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'xn--4gbrim.xn----rmckbbajlc6dj7bxne2c.xn--wgbh1c' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'xn--mgbb9fbpob' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT 'xn--55qw42g.xn--55qw42g' AS ascii, idnaDecode(ascii) AS unicode, idnaEncode(unicode) AS original, tryIdnaEncode(unicode) AS original_try;
SELECT '-- Special cases';
SELECT '---- Empty input';
SELECT idnaEncode('');
SELECT tryIdnaEncode('');
SELECT idnaDecode('');
SELECT '---- NULL input';
SELECT idnaEncode(NULL);
SELECT tryIdnaEncode(NULL);
SELECT idnaDecode(NULL);
SELECT '---- Garbage inputs for idnaEncode';
SELECT tryIdnaEncode('xn--');
SELECT tryIdnaEncode('ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¯ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ»ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ±a');
SELECT tryIdnaEncode('xn--a-yoc');
SELECT tryIdnaEncode('xn--teÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¡la');
SELECT '---- Long input';
SELECT '---- Non-const input';
DROP TABLE IF EXISTS tab;
CREATE TABLE tab (idna String) ENGINE=MergeTree ORDER BY idna;
INSERT INTO tab VALUES ('straÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂe.mÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¼nchen.de') ('') ('mÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¼nchen');
DROP TABLE tab;
SELECT '---- Non-const input with invalid values sprinkled in';
DROP TABLE IF EXISTS tab;
CREATE TABLE tab (idna String) ENGINE=MergeTree ORDER BY idna;
INSERT INTO tab VALUES ('xn--') ('london.co.uk') ('ytraÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂe.mÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¼nchen.de') ('xn--teÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¡la') ('microsoft.com') ('xn--');
SELECT idna, tryIdnaEncode(idna) AS ascii, idnaDecode(ascii) AS original FROM tab;
DROP TABLE tab;
