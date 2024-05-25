CREATE TEMP TABLE VARCHAR_TBL(f1 varchar(1));
INSERT INTO VARCHAR_TBL (f1) VALUES ('a');
INSERT INTO VARCHAR_TBL (f1) VALUES ('A');
INSERT INTO VARCHAR_TBL (f1) VALUES ('1');
INSERT INTO VARCHAR_TBL (f1) VALUES (2);
INSERT INTO VARCHAR_TBL (f1) VALUES ('3');
INSERT INTO VARCHAR_TBL (f1) VALUES ('');
INSERT INTO VARCHAR_TBL (f1) VALUES ('c     ');
SELECT * FROM VARCHAR_TBL;
SELECT c.*
   FROM VARCHAR_TBL c
   WHERE c.f1 <> 'a';
SELECT c.*
   FROM VARCHAR_TBL c
   WHERE c.f1 = 'a';
SELECT c.*
   FROM VARCHAR_TBL c
   WHERE c.f1 < 'a';
SELECT c.*
   FROM VARCHAR_TBL c
   WHERE c.f1 <= 'a';
SELECT c.*
   FROM VARCHAR_TBL c
   WHERE c.f1 > 'a';
SELECT c.*
   FROM VARCHAR_TBL c
   WHERE c.f1 >= 'a';
DROP TABLE VARCHAR_TBL;
SELECT pg_input_is_valid('abcd  ', 'varchar(4)');
SELECT pg_input_is_valid('abcde', 'varchar(4)');
SELECT * FROM pg_input_error_info('abcde', 'varchar(4)');
