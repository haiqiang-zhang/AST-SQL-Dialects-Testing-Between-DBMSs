DROP TABLE IF EXISTS 02581_trips;
CREATE TABLE 02581_trips(id UInt32, description String, id2 UInt32, PRIMARY KEY id) ENGINE=MergeTree ORDER BY id;
INSERT INTO 02581_trips SELECT number, '', number FROM numbers(10000);
INSERT INTO 02581_trips SELECT number+10000000, '', number FROM numbers(10000);
INSERT INTO 02581_trips SELECT number+20000000, '', number FROM numbers(10000);
INSERT INTO 02581_trips SELECT number+30000000, '', number FROM numbers(10000);
SELECT count() from 02581_trips WHERE description = '';
SELECT name FROM system.parts WHERE database=currentDatabase() AND table = '02581_trips' AND active ORDER BY name;
SELECT count() from 02581_trips WHERE description = '';
SELECT count() from 02581_trips WHERE description = '';
SELECT count() from 02581_trips WHERE description = '';
SELECT count() from 02581_trips WHERE description = '';
SELECT count() from 02581_trips WHERE description = '';
SELECT count() from 02581_trips WHERE description = '';
SELECT count() from 02581_trips WHERE description = '';
DROP TABLE 02581_trips;
