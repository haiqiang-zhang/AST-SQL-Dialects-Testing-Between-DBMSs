SET default_null_order='nulls_first';;
PRAGMA enable_verification;
CREATE TABLE integers(i INTEGER);;
INSERT INTO integers VALUES (1), (2), (3), (NULL);
SELECT t.k FROM integers AS 't'('k') ORDER BY ALL;
SELECT t.k FROM integers t('k') ORDER BY ALL;