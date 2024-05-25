SET default_table_engine='MergeTree';
CREATE TABLE pk_test1 (a String PRIMARY KEY, b String, c String);
CREATE TABLE pk_test2 (a String PRIMARY KEY, b String PRIMARY KEY, c String);
CREATE TABLE pk_test3 (a String PRIMARY KEY, b String PRIMARY KEY, c String PRIMARY KEY);
CREATE TABLE pk_test4 (a String, b String PRIMARY KEY, c String PRIMARY KEY);
CREATE TABLE pk_test5 (a String, b String PRIMARY KEY, c String);
CREATE TABLE pk_test6 (a String, b String, c String PRIMARY KEY);
CREATE TABLE pk_test18 (a String PRIMARY KEY, b String, c String) ORDER BY (a,b,c);
CREATE TABLE pk_test19 (a String PRIMARY KEY, b String PRIMARY KEY, c String) ORDER BY (a,b,c);
CREATE TABLE pk_test20 (a String PRIMARY KEY, b String PRIMARY KEY, c String PRIMARY KEY) ORDER BY (a,b,c);
DROP TABLE IF EXISTS pk_test1;
DROP TABLE IF EXISTS pk_test2;
DROP TABLE IF EXISTS pk_test3;
DROP TABLE IF EXISTS pk_test4;
DROP TABLE IF EXISTS pk_test5;
DROP TABLE IF EXISTS pk_test6;
DROP TABLE IF EXISTS pk_test7;
DROP TABLE IF EXISTS pk_test8;
DROP TABLE IF EXISTS pk_test9;
DROP TABLE IF EXISTS pk_test10;
DROP TABLE IF EXISTS pk_test11;
DROP TABLE IF EXISTS pk_test12;
DROP TABLE IF EXISTS pk_test12;
DROP TABLE IF EXISTS pk_test13;
DROP TABLE IF EXISTS pk_test14;
DROP TABLE IF EXISTS pk_test15;
DROP TABLE IF EXISTS pk_test16;
DROP TABLE IF EXISTS pk_test17;
DROP TABLE IF EXISTS pk_test18;
DROP TABLE IF EXISTS pk_test19;
DROP TABLE IF EXISTS pk_test20;
DROP TABLE IF EXISTS pk_test21;
DROP TABLE IF EXISTS pk_test22;
DROP TABLE IF EXISTS pk_test23;
