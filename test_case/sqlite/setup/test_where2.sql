BEGIN;
CREATE TABLE t1(w int, x int, y int, z int);
CREATE UNIQUE INDEX i1w ON t1(w);
CREATE INDEX i1xy ON t1(x,y);
CREATE INDEX i1zyx ON t1(z,y,x);