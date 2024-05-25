CREATE INDEX i1 ON t1(a);
CREATE INDEX i2 ON t1(b);
CREATE TABLE t2(a INT, b INT, ex TEXT);
CREATE TABLE t3(a INT, b INT, ex TEXT);
PRAGMA foreign_keys = OFF;
DROP table "t1";
DROP table "t2";
DROP table "t3";
CREATE TABLE t1(x INT, y INT, ex TEXT);
CREATE TABLE t2(x INT, y INT, ex TEXT);
CREATE INDEX t2i1 ON t2(x);
PRAGMA foreign_keys = OFF;
DROP table "t1";
DROP table "t2";
CREATE TABLE t1(a INT, b INT, ex CHAR(100));
CREATE TABLE t2(a INT, b INT, ex CHAR(100));
CREATE INDEX i1 ON t2(a);
INSERT INTO t1(a,b) VALUES(1, 2);
INSERT INTO t1(a,b) VALUES(3, 4);
INSERT INTO t2(a,b) VALUES(1, 2);
INSERT INTO t2(a,b) VALUES(3, 4);
INSERT INTO t2(a,b) VALUES(5, 6);
ANALYZE;
PRAGMA foreign_keys = OFF;
DROP table "t1";
DROP table "t2";
CREATE TABLE t1(a, b, c, PRIMARY KEY(b, c)) WITHOUT ROWID;
CREATE TABLE t2(a, b, c);
-- Schema from Fossil 2018-08-16
  CREATE TABLE forumpost(
    fpid INTEGER PRIMARY KEY,
    froot INT,
    fprev INT,
    firt INT,
    fmtime REAL
  );
CREATE INDEX forumthread ON forumpost(froot,fmtime);
CREATE TABLE blob(
    rid INTEGER PRIMARY KEY,
    rcvid INTEGER,
    size INTEGER,
    uuid TEXT UNIQUE NOT NULL,
    content BLOB,
    CHECK( length(uuid)>=40 AND rid>0 )
  );
CREATE TABLE event(
    type TEXT,
    mtime DATETIME,
    objid INTEGER PRIMARY KEY,
    tagid INTEGER,
    uid INTEGER REFERENCES user,
    bgcolor TEXT,
    euser TEXT,
    user TEXT,
    ecomment TEXT,
    comment TEXT,
    brief TEXT,
    omtime DATETIME
  );
CREATE INDEX event_i1 ON event(mtime);
CREATE TABLE private(rid INTEGER PRIMARY KEY);
