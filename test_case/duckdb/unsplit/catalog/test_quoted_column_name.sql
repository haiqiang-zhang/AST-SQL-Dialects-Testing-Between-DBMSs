CREATE TABLE integers("42" INTEGER);
INSERT INTO integers VALUES (33);
CREATE TABLE "table ""." ( "col ""." TEXT);
INSERT INTO "table ""." ("col "".") VALUES ('quote_escaped_quote_''');
SELECT "42" FROM integers;
SELECT "table ""."."col "".", "col ""." FROM "table "".";