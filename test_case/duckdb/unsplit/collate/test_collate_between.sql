CREATE TABLE collate_test(s VARCHAR, t VARCHAR);
INSERT INTO collate_test VALUES ('mark', 'muhleisen');
PRAGMA default_collation='NOACCENT';
SELECT COUNT(*) FROM collate_test WHERE 'mÃÂÃÂÃÂÃÂ³rritz' BETWEEN s AND t;
SELECT COUNT(*) FROM collate_test WHERE 'mÃÂÃÂÃÂÃÂ³rritz' COLLATE NOACCENT BETWEEN s AND t;
SELECT COUNT(*) FROM collate_test WHERE 'mÃÂÃÂÃÂÃÂ³rritz' BETWEEN (s COLLATE NOACCENT) AND t;
SELECT COUNT(*) FROM collate_test WHERE 'mÃÂÃÂÃÂÃÂ³rritz' BETWEEN s AND (t COLLATE NOACCENT);
SELECT COUNT(*) FROM collate_test WHERE 'mÃÂÃÂÃÂÃÂ³rritz' BETWEEN s AND t;
