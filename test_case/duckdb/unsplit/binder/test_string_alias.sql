PRAGMA enable_verification;
CREATE TABLE integers(i INTEGER);
SELECT i AS 'hello world' FROM integers;
SELECT i "hello world" FROM integers;
SELECT i AS "hello world" FROM integers;
SELECT "hello world".i FROM integers AS 'hello world';