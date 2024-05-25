SELECT sum(b) OVER win FROM t1
    WINDOW win AS (  ORDER BY a RANGE BETWEEN 1 PRECEDING AND 1 FOLLOWING  );
SELECT sum(b) OVER win FROM t1
    WINDOW win AS (  ORDER BY a NULLS LAST RANGE BETWEEN 1 PRECEDING AND 1 FOLLOWING  );
SELECT sum(b) OVER win FROM t1
    WINDOW win AS (  ORDER BY a DESC RANGE BETWEEN 1 PRECEDING AND 1 FOLLOWING  );
SELECT sum(b) OVER win FROM t1
    WINDOW win AS (  ORDER BY a DESC NULLS FIRST RANGE BETWEEN 1 PRECEDING AND 1 FOLLOWING  );
SELECT sum(b) OVER win FROM t1
    WINDOW win AS (  ORDER BY a      NULLS LAST  RANGE BETWEEN 1 FOLLOWING AND 2 FOLLOWING  );
SELECT sum(b) OVER win FROM t1
    WINDOW win AS (  ORDER BY a DESC NULLS FIRST RANGE BETWEEN 1 FOLLOWING AND 2 FOLLOWING  );
SELECT sum(b) OVER win FROM t1
    WINDOW win AS (  ORDER BY a      NULLS LAST  RANGE BETWEEN 2 PRECEDING AND 1 PRECEDING  );
SELECT sum(b) OVER win FROM t1
    WINDOW win AS (  ORDER BY a DESC NULLS FIRST RANGE BETWEEN 2 PRECEDING AND 1 PRECEDING  );
SELECT sum(b) OVER win FROM t1
  WINDOW win AS (
    ORDER BY a DESC NULLS FIRST RANGE BETWEEN 1 PRECEDING AND 1 FOLLOWING
  );
INSERT INTO t1 VALUES(1, NULL);
INSERT INTO t1 VALUES(2, 45);
INSERT INTO t1 VALUES(3, 66.2);
INSERT INTO t1 VALUES(4, 'hello world');
INSERT INTO t1 VALUES(5, 'hello world');
INSERT INTO t1 VALUES(6, X'1234');
INSERT INTO t1 VALUES(7, X'1234');
INSERT INTO t1 VALUES(8, NULL);
SELECT a, sum(a) OVER win FROM t1
    WINDOW win AS ( ORDER BY b RANGE BETWEEN 1 PRECEDING AND 2 PRECEDING )
    ORDER BY 1;
SELECT a, sum(a) OVER win FROM t1
    WINDOW win AS ( ORDER BY b RANGE BETWEEN 2 FOLLOWING AND 2 FOLLOWING )
    ORDER BY 1;
SELECT a, sum(a) OVER win FROM t1
    WINDOW win AS ( ORDER BY b NULLS LAST RANGE BETWEEN 1 PRECEDING AND 2 PRECEDING )
    ORDER BY 1;
SELECT a, sum(a) OVER win FROM t1
    WINDOW win AS ( ORDER BY b NULLS LAST RANGE BETWEEN 2 FOLLOWING AND 2 FOLLOWING )
    ORDER BY 1;
CREATE TABLE testjson(id INTEGER PRIMARY KEY, j TEXT, x TEXT);
INSERT INTO testjson VALUES(1, '{"a":1}', 'a');
INSERT INTO testjson VALUES(2, '{"b":2}', 'b');
INSERT INTO testjson VALUES(3, '{"c":3}', 'c');
INSERT INTO testjson VALUES(4, '{"d":4}', 'd');
SELECT json_group_array(json(j)) FROM testjson;
SELECT json_group_array(json(j)) OVER (ORDER BY id) FROM testjson;
SELECT json_group_array(json(j)) OVER (
      ORDER BY id RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
      EXCLUDE TIES
    ) FROM testjson;
SELECT json_group_array(json(j)) OVER (
      ORDER BY id ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
    ) FROM testjson;
SELECT json_group_array(json(j)) OVER (
      ORDER BY id ROWS BETWEEN 2 PRECEDING AND 1 PRECEDING
    ) FROM testjson;
UPDATE testjson SET j = replace(j,char(125),',"e":9'||char(125));
SELECT j FROM testjson;
SELECT group_concat(x,'') OVER (
      ORDER BY id ROWS BETWEEN 1 FOLLOWING AND 2 FOLLOWING
    ) FROM testjson ORDER BY id;
SELECT json_group_array(json(j)) OVER (
      ORDER BY id ROWS BETWEEN 1 FOLLOWING AND 2 FOLLOWING
    ) FROM testjson;
SELECT json_group_object(x,json(j)) OVER (
      ORDER BY id ROWS BETWEEN 1 FOLLOWING AND 2 FOLLOWING
    ) FROM testjson;
SELECT group_concat(x,'') FILTER (WHERE id!=2) OVER (
      ORDER BY id ROWS BETWEEN 2 PRECEDING AND 1 PRECEDING
    ) FROM testjson;
SELECT json_group_array(json(j)) FILTER (WHERE id!=2) OVER (
      ORDER BY id ROWS BETWEEN 2 PRECEDING AND 1 PRECEDING
    ) FROM testjson;
SELECT json_group_object(x,json(j)) FILTER (WHERE id!=2) OVER (
      ORDER BY id ROWS BETWEEN 2 PRECEDING AND 1 PRECEDING
    ) FROM testjson;
CREATE TABLE x(a);
INSERT INTO x VALUES(1);
INSERT INTO x VALUES(2);
WITH y AS (
      SELECT Row_Number() OVER (win) FROM x WINDOW win AS (PARTITION BY a)
  )
  SELECT * FROM y;
SELECT 1 WINDOW win AS (PARTITION BY fake_column);
CREATE INDEX i1 ON t1(a);
INSERT INTO t1 VALUES(0, 421);
INSERT INTO t1 VALUES(1, 844);
INSERT INTO t1 VALUES(2, 1001);
INSERT INTO t1 VALUES(NULL, 123);
INSERT INTO t1 VALUES(NULL, 111);
INSERT INTO t1 VALUES('xyz', 222);
INSERT INTO t1 VALUES('xyz', 333);
INSERT INTO t1 VALUES(7,  997);
INSERT INTO t1 VALUES(8,  997);
INSERT INTO t1 VALUES('abc', 1001);
INSERT INTO t1 VALUES(NULL, 46);
INSERT INTO t1 VALUES(NULL, 45);
INSERT INTO t1 VALUES(7,  997);
INSERT INTO t1 VALUES(7,  1000);
INSERT INTO t1 VALUES(8,  997);
INSERT INTO t1 VALUES(8,  1000);
INSERT INTO t1 VALUES('abc', 1001);
INSERT INTO t1 VALUES('abc', 1004);
INSERT INTO t1 VALUES('xyz', 3333);
BEGIN TRANSACTION;
INSERT INTO t1 VALUES('aa', 111);
INSERT INTO t1 VALUES('BB', 660);
INSERT INTO t1 VALUES('CC', 938);
INSERT INTO t1 VALUES('dd', 979);
CREATE TABLE seps(x);
INSERT INTO seps(x) VALUES ('1'), ('22'), ('333'), ('4444');
SELECT group_concat('-', x)
    OVER ( ORDER BY x ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING )
  FROM seps;
INSERT INTO t1 VALUES( 1, 'one' );
INSERT INTO t1 VALUES( 2, 'two' );
SELECT value FROM json_each('[1,2,3,4,5]');
SELECT key, value FROM json_each('[1,2,3,4,5]');
SELECT rowid, value FROM json_each('[1,2,3,4,5]');
SELECT sum(value) OVER (ORDER BY rowid) FROM json_each('[1,2,3,4,5]');
SELECT sum(value) OVER (
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) FROM json_each('[1,2,3,4,5]');
SELECT sum(value) OVER (ORDER BY rowid DESC) FROM json_each('[1,2,3,4,5]');
SELECT sum(value) OVER (ORDER BY value ASC) FROM json_each('[2,1,4,3,5]');
