PRAGMA enable_verification;
CREATE TABLE student(id INTEGER, name VARCHAR, PRIMARY KEY(id));
INSERT INTO student SELECT i, 'creator' FROM RANGE(260001) tbl(i);
UPDATE student SET name = 'updator0' WHERE id = 122879;
UPDATE student SET name = 'updator1' WHERE id = 122881;
UPDATE student SET name = 'updator2' WHERE id = 245780;
UPDATE student SET name = 'updator3' WHERE id = 150881;
update student set name = 'updator' where id = 122881;