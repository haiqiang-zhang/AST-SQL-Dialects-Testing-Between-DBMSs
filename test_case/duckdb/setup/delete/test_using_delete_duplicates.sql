create table integers as select * from generate_series(0, 9, 1);
create table integers2 as select * from generate_series(0, 9, 1);
DROP TABLE integers;
DROP TABLE integers2;
BEGIN transaction;
create table integers as select * from generate_series(0, 9, 1);
create table integers2 as select * from generate_series(0, 9, 1);
COMMIT;
DELETE FROM integers USING integers2;