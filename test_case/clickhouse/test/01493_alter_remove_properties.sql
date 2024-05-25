SYSTEM STOP TTL MERGES prop_table;
INSERT INTO prop_table (column_codec, column_comment, column_ttl) VALUES ('str', toDate('2019-10-01'), 1);
SELECT column_default, column_materialized, column_alias, column_codec, column_comment, column_ttl FROM prop_table;
ALTER TABLE prop_table MODIFY COLUMN column_comment REMOVE COMMENT;
SHOW CREATE TABLE prop_table;
ALTER TABLE prop_table MODIFY COLUMN column_codec REMOVE CODEC;
SHOW CREATE TABLE prop_table;
ALTER TABLE prop_table MODIFY COLUMN column_alias REMOVE ALIAS;
SELECT column_default, column_materialized, column_alias, column_codec, column_comment, column_ttl FROM prop_table;
SHOW CREATE TABLE prop_table;
INSERT INTO prop_table (column_alias, column_codec, column_comment, column_ttl) VALUES (33, 'trs', toDate('2020-01-01'), 2);
SELECT column_default, column_materialized, column_alias, column_codec, column_comment, column_ttl FROM prop_table ORDER BY column_ttl;
ALTER TABLE prop_table MODIFY COLUMN column_materialized REMOVE MATERIALIZED;
SHOW CREATE TABLE prop_table;
INSERT INTO prop_table (column_materialized, column_alias, column_codec, column_comment, column_ttl) VALUES (11, 44, 'rts', toDate('2020-02-01'), 3);
SELECT column_default, column_materialized, column_alias, column_codec, column_comment, column_ttl FROM prop_table ORDER BY column_ttl;
ALTER TABLE prop_table MODIFY COLUMN column_default REMOVE DEFAULT;
SHOW CREATE TABLE prop_table;
INSERT INTO prop_table (column_materialized, column_alias, column_codec, column_comment, column_ttl) VALUES (22, 55, 'tsr', toDate('2020-03-01'), 4);
SELECT column_default, column_materialized, column_alias, column_codec, column_comment, column_ttl FROM prop_table ORDER BY column_ttl;
ALTER TABLE prop_table REMOVE TTL;
SHOW CREATE TABLE prop_table;
ALTER TABLE prop_table MODIFY COLUMN column_ttl REMOVE TTL;
SHOW CREATE TABLE prop_table;
SYSTEM START TTL MERGES prop_table;
OPTIMIZE TABLE prop_table FINAL;
SELECT COUNT() FROM prop_table;
DROP TABLE IF EXISTS prop_table;
