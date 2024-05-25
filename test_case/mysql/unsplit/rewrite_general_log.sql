CREATE TABLE     t1(f1 INT, f2 INT, f3 INT, f4 INT);
CREATE PROCEDURE proc_rewrite_1() INSERT INTO test.t1 VALUES ("hocus pocus");
DROP PROCEDURE proc_rewrite_1;
DROP TABLE     t1;
CREATE TABLE test_log (argument TEXT);
SELECT argument FROM test_log WHERE argument LIKE CONCAT('%azun','dris%');
SELECT TRIM(LEADING '\t' FROM MID(argument,LOCATE('Query',argument)+5)) FROM
                test_log WHERE (argument LIKE '%BY %' OR argument LIKE '%AS %'
                OR argument LIKE '%PASSWORD %')
                AND argument NOT LIKE '%Prepare%';
DROP TABLE test_log;