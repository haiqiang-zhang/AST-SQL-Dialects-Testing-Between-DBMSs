PRAGMA enable_verification;
CREATE SCHEMA "SCHEMA";
CREATE TYPE E AS ENUM('ALL');
CREATE TABLE "SCHEMA"."TABLE"("COLUMN" E);
INSERT INTO "SCHEMA"."TABLE" VALUES ('ALL');
DROP TABLE "SCHEMA"."TABLE";
CREATE TABLE "SCHEMA"."TABLE"("COLUMN" ROW("SOME" ROW("IN" INTEGER)));
INSERT INTO "SCHEMA"."TABLE" VALUES ({'some': {'in': 3}});
SELECT "COLUMN" FROM "SCHEMA"."TABLE";
SELECT "TABLE"."COLUMN" FROM "SCHEMA"."TABLE";
SELECT "SCHEMA"."TABLE"."COLUMN" FROM "SCHEMA"."TABLE";
SELECT "COLUMN"."SOME"."IN" FROM "SCHEMA"."TABLE";
SELECT "TABLE"."COLUMN"."SOME"."IN" FROM "SCHEMA"."TABLE";
SELECT "SCHEMA"."TABLE"."COLUMN"."SOME"."IN" FROM "SCHEMA"."TABLE";
SELECT (("SCHEMA"."TABLE"."COLUMN")."SOME")."IN" FROM "SCHEMA"."TABLE";
SELECT "SCHEMA"."TABLE"."COLUMN"['SOME']['IN'] FROM "SCHEMA"."TABLE";
