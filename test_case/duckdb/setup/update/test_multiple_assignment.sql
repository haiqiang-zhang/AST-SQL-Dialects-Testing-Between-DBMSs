CREATE TABLE tbl (key INT, fruit VARCHAR, cost INT);
INSERT INTO tbl VALUES (1, 'apple', 2), (2, 'orange', 3);
UPDATE tbl SET (key, fruit, cost) = (1, 'pear', 2);
UPDATE tbl SET (key, fruit, cost) = (2, 'apple', 3);
UPDATE tbl SET (key, fruit, cost) = 3;
UPDATE tbl SET (key, fruit, cost) = ADD(key, cost);