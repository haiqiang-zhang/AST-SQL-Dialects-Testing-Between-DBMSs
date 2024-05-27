PRAGMA preserve_insertion_order=false;
CREATE TABLE integers AS SELECT case when i%2=0 then null else i end AS i  FROM range(1000000) tbl(i);
CREATE TABLE integers2 AS SELECT * FROM integers;
CREATE TABLE varchars AS SELECT case when i%2=0 then null else concat('thisismyvarchar-', i//4) end AS v  FROM range(1000000) tbl(i);
CREATE TABLE varchars2 AS SELECT * FROM varchars;