CREATE ROLE r1;
CREATE USER u1@localhost IDENTIFIED BY 'foo';
CREATE DATABASE db1;
CREATE DATABASE db2;

CREATE TABLE db1.t1 (c1 int);
CREATE TABLE db1.t2 (c1 int);
CREATE TABLE db2.t1 (c1 int);
CREATE TABLE db2.t2 (c1 int);
CREATE PROCEDURE db1.sp1()
SQL SECURITY DEFINER
BEGIN
  SELECT * FROM db1.t1;
CREATE PROCEDURE db2.sp1()
SQL SECURITY DEFINER
BEGIN
  SELECT * FROM db2.t1;
CREATE PROCEDURE test.sp1()
SQL SECURITY DEFINER
BEGIN
  SELECT * FROM db1.t1;
CREATE PROCEDURE db1.sp2()
SQL SECURITY DEFINER
BEGIN
  SELECT * FROM db1.t2;
CREATE PROCEDURE db1.sp3()
SQL SECURITY INVOKER
BEGIN
  SELECT * FROM db1.t2;
SET ROLE r1;
SET ROLE r1;
CREATE SCHEMA world;
USE world;
CREATE PROCEDURE world.proc_empty() BEGIN END;
CREATE FUNCTION world.func_plusone(i int) RETURNS INT DETERMINISTIC RETURN i+1;
CREATE FUNCTION world.func_plustwo(i int) RETURNS INT DETERMINISTIC RETURN i+2;
CREATE ROLE r_worldrou;
CREATE USER u_worldrou@localhost IDENTIFIED BY 'xxx' DEFAULT ROLE r_worldrou;
SELECT CURRENT_ROLE();
SELECT world.func_plusone(1);
SELECT world.func_plustwo(1);
DROP SCHEMA world;
DROP ROLE r_worldrou;
DROP USER u_worldrou@localhost;
DROP DATABASE db1;
DROP DATABASE db2;
DROP USER u1@localhost;
DROP ROLE r1;
DROP PROCEDURE test.sp1;