CREATE TABLE collate_test(s VARCHAR);
INSERT INTO collate_test VALUES ('hEllO'), ('WÃÂÃÂÃÂÃÂ¶RlD'), ('wozld');
SELECT * FROM collate_test WHERE s='hello';
SELECT 'hÃÂÃÂÃÂÃÂ«llo' COLLATE NOACCENT='hello';
SELECT 'hÃÂÃÂÃÂÃÂ«llo' COLLATE POSIX='hello';
SELECT 'hÃÂÃÂÃÂÃÂ«llo' COLLATE C='hello';
SELECT * FROM collate_test WHERE s='hello' COLLATE NOCASE;
SELECT * FROM collate_test WHERE s COLLATE NOCASE='hello';
SELECT * FROM collate_test ORDER BY s COLLATE NOCASE;
SELECT * FROM collate_test ORDER BY s COLLATE NOCASE.NOACCENT;
