DROP TABLE IF EXISTS t1, t2;
CREATE TABLE t1 (
  fid INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  g GEOMETRY NOT NULL SRID 0,
  SPATIAL KEY(g)
) ENGINE=MyISAM;
SELECT count(*) FROM t1;
SELECT fid, ST_AsText(g) FROM t1 WHERE ST_Within(g, ST_GeomFromText('Polygon((140 140,160 140,160 160,140 160,140 140))'));
DROP TABLE t1;
CREATE TABLE t2 (
  fid INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  g GEOMETRY NOT NULL SRID 0
) ENGINE=MyISAM;
ALTER TABLE t2 ADD SPATIAL KEY(g);
SELECT count(*) FROM t2;
SELECT fid, ST_AsText(g) FROM t2 WHERE ST_Within(g, 
  ST_GeomFromText('Polygon((40 40,60 40,60 60,40 60,40 40))'));
DROP TABLE t2;
drop table if exists t1;
CREATE TABLE t1 (a geometry NOT NULL SRID 0, SPATIAL (a));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
INSERT INTO t1 VALUES (ST_GeomFromText("LINESTRING(100 100, 200 200, 300 300)"));
drop table t1;
CREATE TABLE t1 (
  fid INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  g GEOMETRY NOT NULL SRID 0,
  SPATIAL KEY(g)
) ENGINE=MyISAM;
INSERT INTO t1 (g) VALUES (ST_GeomFromText('LineString(1 2, 2 3)')),(ST_GeomFromText('LineString(1 2, 2 4)'));
drop table t1;
CREATE TABLE t1 (
  line LINESTRING NOT NULL SRID 0,
  kind ENUM('po', 'pp', 'rr', 'dr', 'rd', 'ts', 'cl') NOT NULL DEFAULT 'po',
  name VARCHAR(32),

  SPATIAL KEY (line)


) engine=myisam;
ALTER TABLE t1 DISABLE KEYS;
ALTER TABLE t1 ENABLE KEYS;
INSERT INTO t1 (name, kind, line) VALUES ("austria", "pp", ST_GeomFromText('LINESTRING(14.9906 48.9887,14.9946 48.9904,14.9947 48.9916)'));
drop table t1;
CREATE TABLE t1 (st varchar(100));
INSERT INTO t1 VALUES ("Fake string");
CREATE TABLE t2 (geom GEOMETRY NOT NULL SRID 0, SPATIAL KEY gk(geom));
drop table t1, t2;
CREATE TABLE t1 (`geometry` geometry NOT NULL SRID 0,SPATIAL KEY `gndx` (`geometry`)) ENGINE=MyISAM DEFAULT CHARSET=latin1;
INSERT INTO t1 (geometry) VALUES
(ST_PolygonFromText('POLYGON((-18.6086111000 -66.9327777000, -18.6055555000
-66.8158332999, -18.7186111000 -66.8102777000, -18.7211111000 -66.9269443999,
-18.6086111000 -66.9327777000))'));
INSERT INTO t1 (geometry) VALUES
(ST_PolygonFromText('POLYGON((-65.7402776999 -96.6686111000, -65.7372222000
-96.5516666000, -65.8502777000 -96.5461111000, -65.8527777000 -96.6627777000,
-65.7402776999 -96.6686111000))'));
drop table t1;
CREATE TABLE t1 (
  c1 geometry NOT NULL SRID 0,
  SPATIAL KEY i1 (c1)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
INSERT INTO t1 (c1) VALUES (
  ST_PolygonFromText('POLYGON((-18.6086111000 -66.9327777000,
                            -18.6055555000 -66.8158332999,
                            -18.7186111000 -66.8102777000,
                            -18.7211111000 -66.9269443999,
                            -18.6086111000 -66.9327777000))'));
DROP TABLE t1;
CREATE TABLE t1 (
  c1 geometry NOT NULL SRID 0,
  SPATIAL KEY i1 (c1)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
INSERT INTO t1 (c1) VALUES (
  ST_PolygonFromText('POLYGON((-18.6086111000 -66.9327777000,
                            -18.6055555000 -66.8158332999,
                            -18.7186111000 -66.8102777000,
                            -18.7211111000 -66.9269443999,
                            -18.6086111000 -66.9327777000))'));
INSERT INTO t1 (c1) VALUES (
  ST_PolygonFromText('POLYGON((-65.7402776999 -96.6686111000,
                            -65.7372222000 -96.5516666000,
                            -65.8502777000 -96.5461111000,
                            -65.8527777000 -96.6627777000,
                            -65.7402776999 -96.6686111000))'));
INSERT INTO t1 (c1) VALUES (
  ST_PolygonFromText('POLYGON((-18.6086111000 -66.9327777000,
                            -18.6055555000 -66.8158332999,
                            -18.7186111000 -66.8102777000,
                            -18.7211111000 -66.9269443999,
                            -18.6086111000 -66.9327777000))'));
DROP TABLE t1;
CREATE TABLE t1 (foo GEOMETRY NOT NULL SRID 0, SPATIAL INDEX(foo) );
INSERT INTO t1 (foo) VALUES (POINT(1,1));
INSERT INTO t1 (foo) VALUES (POINT(1,0));
INSERT INTO t1 (foo) VALUES (POINT(0,1));
INSERT INTO t1 (foo) VALUES (POINT(0,0));
SELECT 1 FROM t1 WHERE foo != POINT(0,0);
DROP TABLE t1;
CREATE TABLE t1 (id bigint(12) unsigned NOT NULL auto_increment,
  c2 varchar(15) COLLATE utf8mb3_bin default NULL,
  c1 varchar(15) COLLATE utf8mb3_bin default NULL,
  c3 varchar(10) COLLATE utf8mb3_bin default NULL,
  spatial_point point NOT NULL SRID 0,
  PRIMARY KEY(id),
  SPATIAL KEY (spatial_point)
  )ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
INSERT INTO t1 (c2, c1, c3, spatial_point) VALUES
  ('y', 's', 'j', ST_GeomFromText('POINT(167 74)')),
  ('r', 'n', 'd', ST_GeomFromText('POINT(215 118)')),
  ('g', 'n', 'e', ST_GeomFromText('POINT(203 98)')),
  ('h', 'd', 'd', ST_GeomFromText('POINT(54 193)')),
  ('r', 'x', 'y', ST_GeomFromText('POINT(47 69)')),
  ('t', 'q', 'r', ST_GeomFromText('POINT(109 42)')),
  ('a', 'z', 'd', ST_GeomFromText('POINT(0 154)')),
  ('x', 'v', 'o', ST_GeomFromText('POINT(174 131)')),
  ('b', 'r', 'a', ST_GeomFromText('POINT(114 253)')),
  ('x', 'z', 'i', ST_GeomFromText('POINT(163 21)')),
  ('w', 'p', 'i', ST_GeomFromText('POINT(42 102)')),
  ('g', 'j', 'j', ST_GeomFromText('POINT(170 133)')),
  ('m', 'g', 'n', ST_GeomFromText('POINT(28 22)')),
  ('b', 'z', 'h', ST_GeomFromText('POINT(174 28)')),
  ('q', 'k', 'f', ST_GeomFromText('POINT(233 73)')),
  ('w', 'w', 'a', ST_GeomFromText('POINT(124 200)')),
  ('t', 'j', 'w', ST_GeomFromText('POINT(252 101)')),
  ('d', 'r', 'd', ST_GeomFromText('POINT(98 18)')),
  ('w', 'o', 'y', ST_GeomFromText('POINT(165 31)')),
  ('y', 'h', 't', ST_GeomFromText('POINT(14 220)')),
  ('d', 'p', 'u', ST_GeomFromText('POINT(223 196)')),
  ('g', 'y', 'g', ST_GeomFromText('POINT(207 96)')),
  ('x', 'm', 'n', ST_GeomFromText('POINT(214 3)')),
  ('g', 'v', 'e', ST_GeomFromText('POINT(140 205)')),
  ('g', 'm', 'm', ST_GeomFromText('POINT(10 236)')),
  ('i', 'r', 'j', ST_GeomFromText('POINT(137 228)')),
  ('w', 's', 'p', ST_GeomFromText('POINT(115 6)')),
  ('o', 'n', 'k', ST_GeomFromText('POINT(158 129)')),
  ('j', 'h', 'l', ST_GeomFromText('POINT(129 72)')),
  ('f', 'x', 'l', ST_GeomFromText('POINT(139 207)')),
  ('u', 'd', 'n', ST_GeomFromText('POINT(125 109)')),
  ('b', 'a', 'z', ST_GeomFromText('POINT(30 32)')),
  ('m', 'h', 'o', ST_GeomFromText('POINT(251 251)')),
  ('f', 'r', 'd', ST_GeomFromText('POINT(243 211)')),
  ('b', 'd', 'r', ST_GeomFromText('POINT(232 80)')),
  ('g', 'k', 'v', ST_GeomFromText('POINT(15 100)')),
  ('i', 'f', 'c', ST_GeomFromText('POINT(109 66)')),
  ('r', 't', 'j', ST_GeomFromText('POINT(178 6)')),
  ('y', 'n', 'f', ST_GeomFromText('POINT(233 211)')),
  ('f', 'y', 'm', ST_GeomFromText('POINT(99 16)')),
  ('z', 'q', 'l', ST_GeomFromText('POINT(39 49)')),
  ('j', 'c', 'r', ST_GeomFromText('POINT(75 187)')),
  ('c', 'y', 'y', ST_GeomFromText('POINT(246 253)')),
  ('w', 'u', 'd', ST_GeomFromText('POINT(56 190)')),
  ('n', 'q', 'm', ST_GeomFromText('POINT(73 149)')),
  ('d', 'y', 'a', ST_GeomFromText('POINT(134 6)')),
  ('z', 's', 'w', ST_GeomFromText('POINT(216 225)')),
  ('d', 'u', 'k', ST_GeomFromText('POINT(132 70)')),
  ('f', 'v', 't', ST_GeomFromText('POINT(187 141)')),
  ('r', 'r', 'a', ST_GeomFromText('POINT(152 39)')),
  ('y', 'p', 'o', ST_GeomFromText('POINT(45 27)')),
  ('p', 'n', 'm', ST_GeomFromText('POINT(228 148)')),
  ('e', 'g', 'e', ST_GeomFromText('POINT(88 81)')),
  ('m', 'a', 'h', ST_GeomFromText('POINT(35 29)')),
  ('m', 'h', 'f', ST_GeomFromText('POINT(30 71)')),
  ('h', 'k', 'i', ST_GeomFromText('POINT(244 78)')),
  ('z', 'v', 'd', ST_GeomFromText('POINT(241 38)')),
  ('q', 'l', 'j', ST_GeomFromText('POINT(13 71)')),
  ('s', 'p', 'g', ST_GeomFromText('POINT(108 38)')),
  ('q', 's', 'j', ST_GeomFromText('POINT(92 101)')),
  ('l', 'h', 'g', ST_GeomFromText('POINT(120 78)')),
  ('w', 't', 'b', ST_GeomFromText('POINT(193 109)')),
  ('b', 's', 's', ST_GeomFromText('POINT(223 211)')),
  ('w', 'w', 'y', ST_GeomFromText('POINT(122 42)')),
  ('q', 'c', 'c', ST_GeomFromText('POINT(104 102)')),
  ('w', 'g', 'n', ST_GeomFromText('POINT(213 120)')),
  ('p', 'q', 'a', ST_GeomFromText('POINT(247 148)')),
  ('c', 'z', 'e', ST_GeomFromText('POINT(18 106)')),
  ('z', 'u', 'n', ST_GeomFromText('POINT(70 133)')),
  ('j', 'n', 'x', ST_GeomFromText('POINT(232 13)')),
  ('e', 'h', 'f', ST_GeomFromText('POINT(22 135)')),
  ('w', 'l', 'f', ST_GeomFromText('POINT(9 180)')),
  ('a', 'v', 'q', ST_GeomFromText('POINT(163 228)')),
  ('i', 'z', 'o', ST_GeomFromText('POINT(180 100)')),
  ('e', 'c', 'l', ST_GeomFromText('POINT(182 231)')),
  ('c', 'k', 'o', ST_GeomFromText('POINT(19 60)')),
  ('q', 'f', 'p', ST_GeomFromText('POINT(79 95)')),
  ('m', 'd', 'r', ST_GeomFromText('POINT(3 127)')),
  ('m', 'e', 't', ST_GeomFromText('POINT(136 154)')),
  ('w', 'w', 'w', ST_GeomFromText('POINT(102 15)')),
  ('l', 'n', 'q', ST_GeomFromText('POINT(71 196)')),
  ('p', 'k', 'c', ST_GeomFromText('POINT(47 139)')),
  ('j', 'o', 'r', ST_GeomFromText('POINT(177 128)')),
  ('j', 'q', 'a', ST_GeomFromText('POINT(170 6)')),
  ('b', 'a', 'o', ST_GeomFromText('POINT(63 211)')),
  ('g', 's', 'o', ST_GeomFromText('POINT(144 251)')),
  ('w', 'u', 'w', ST_GeomFromText('POINT(221 214)')),
  ('g', 'a', 'm', ST_GeomFromText('POINT(14 102)')),
  ('u', 'q', 'z', ST_GeomFromText('POINT(86 200)')),
  ('k', 'a', 'm', ST_GeomFromText('POINT(144 222)')),
  ('j', 'u', 'r', ST_GeomFromText('POINT(216 142)')),
  ('q', 'k', 'v', ST_GeomFromText('POINT(121 236)')),
  ('p', 'o', 'r', ST_GeomFromText('POINT(108 102)')),
  ('b', 'd', 'x', ST_GeomFromText('POINT(127 198)')),
  ('k', 's', 'a', ST_GeomFromText('POINT(2 150)')),
  ('f', 'm', 'f', ST_GeomFromText('POINT(160 191)')),
  ('q', 'y', 'x', ST_GeomFromText('POINT(98 111)')),
  ('o', 'f', 'm', ST_GeomFromText('POINT(232 218)')),
  ('c', 'w', 'j', ST_GeomFromText('POINT(156 165)')),
  ('s', 'q', 'v', ST_GeomFromText('POINT(98 161)'));
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(230 9)') where  c1 like 'y%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(95 35)') where  c1 like 'j%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(93 99)') where  c1 like 'a%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(19 81)') where  c1 like 'r%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(20 177)') where  c1 like 'h%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(221 193)') where  c1 like 'u%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(195 205)') where  c1 like 'd%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(15 213)') where  c1 like 'u%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(214 63)') where  c1 like 'n%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(243 171)') where  c1 like 'c%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(198 82)') where  c1 like 'y%';
INSERT INTO t1 (c2, c1, c3, spatial_point) VALUES
  ('f', 'y', 'p', ST_GeomFromText('POINT(109 235)')),
  ('b', 'e', 'v', ST_GeomFromText('POINT(20 48)')),
  ('i', 'u', 'f', ST_GeomFromText('POINT(15 55)')),
  ('o', 'r', 'z', ST_GeomFromText('POINT(105 64)')),
  ('a', 'p', 'a', ST_GeomFromText('POINT(142 236)')),
  ('g', 'i', 'k', ST_GeomFromText('POINT(10 49)')),
  ('x', 'z', 'x', ST_GeomFromText('POINT(192 200)')),
  ('c', 'v', 'r', ST_GeomFromText('POINT(94 168)')),
  ('y', 'z', 'e', ST_GeomFromText('POINT(141 51)')),
  ('h', 'm', 'd', ST_GeomFromText('POINT(35 251)')),
  ('v', 'm', 'q', ST_GeomFromText('POINT(44 90)')),
  ('j', 'l', 'z', ST_GeomFromText('POINT(67 237)')),
  ('i', 'v', 'a', ST_GeomFromText('POINT(75 14)')),
  ('b', 'q', 't', ST_GeomFromText('POINT(153 33)')),
  ('e', 'm', 'a', ST_GeomFromText('POINT(247 49)')),
  ('l', 'y', 'g', ST_GeomFromText('POINT(56 203)')),
  ('v', 'o', 'r', ST_GeomFromText('POINT(90 54)')),
  ('r', 'n', 'd', ST_GeomFromText('POINT(135 83)')),
  ('j', 't', 'u', ST_GeomFromText('POINT(174 239)')),
  ('u', 'n', 'g', ST_GeomFromText('POINT(104 191)')),
  ('p', 'q', 'y', ST_GeomFromText('POINT(63 171)')),
  ('o', 'q', 'p', ST_GeomFromText('POINT(192 103)')),
  ('f', 'x', 'e', ST_GeomFromText('POINT(244 30)')),
  ('n', 'x', 'c', ST_GeomFromText('POINT(92 103)')),
  ('r', 'q', 'z', ST_GeomFromText('POINT(166 20)')),
  ('s', 'a', 'j', ST_GeomFromText('POINT(137 205)')),
  ('z', 't', 't', ST_GeomFromText('POINT(99 134)')),
  ('o', 'm', 'j', ST_GeomFromText('POINT(217 3)')),
  ('n', 'h', 'j', ST_GeomFromText('POINT(211 17)')),
  ('v', 'v', 'a', ST_GeomFromText('POINT(41 137)')),
  ('q', 'o', 'j', ST_GeomFromText('POINT(5 92)')),
  ('z', 'y', 'e', ST_GeomFromText('POINT(175 212)')),
  ('j', 'z', 'h', ST_GeomFromText('POINT(224 194)')),
  ('a', 'g', 'm', ST_GeomFromText('POINT(31 119)')),
  ('p', 'c', 'f', ST_GeomFromText('POINT(17 221)')),
  ('t', 'h', 'k', ST_GeomFromText('POINT(26 203)')),
  ('u', 'w', 'p', ST_GeomFromText('POINT(47 185)')),
  ('z', 'a', 'c', ST_GeomFromText('POINT(61 133)')),
  ('u', 'k', 'a', ST_GeomFromText('POINT(210 115)')),
  ('k', 'f', 'h', ST_GeomFromText('POINT(125 113)')),
  ('t', 'v', 'y', ST_GeomFromText('POINT(12 239)')),
  ('u', 'v', 'd', ST_GeomFromText('POINT(90 24)')),
  ('m', 'y', 'w', ST_GeomFromText('POINT(25 243)')),
  ('d', 'n', 'g', ST_GeomFromText('POINT(122 92)')),
  ('z', 'm', 'f', ST_GeomFromText('POINT(235 110)')),
  ('q', 'd', 'f', ST_GeomFromText('POINT(233 217)')),
  ('a', 'v', 'u', ST_GeomFromText('POINT(69 59)')),
  ('x', 'k', 'p', ST_GeomFromText('POINT(240 14)')),
  ('i', 'v', 'r', ST_GeomFromText('POINT(154 42)')),
  ('w', 'h', 'l', ST_GeomFromText('POINT(178 156)')),
  ('d', 'h', 'n', ST_GeomFromText('POINT(65 157)')),
  ('c', 'k', 'z', ST_GeomFromText('POINT(62 33)')),
  ('e', 'l', 'w', ST_GeomFromText('POINT(162 1)')),
  ('r', 'f', 'i', ST_GeomFromText('POINT(127 71)')),
  ('q', 'm', 'c', ST_GeomFromText('POINT(63 118)')),
  ('c', 'h', 'u', ST_GeomFromText('POINT(205 203)')),
  ('d', 't', 'p', ST_GeomFromText('POINT(234 87)')),
  ('s', 'g', 'h', ST_GeomFromText('POINT(149 34)')),
  ('o', 'b', 'q', ST_GeomFromText('POINT(159 179)')),
  ('k', 'u', 'f', ST_GeomFromText('POINT(202 254)')),
  ('u', 'f', 'g', ST_GeomFromText('POINT(70 15)')),
  ('x', 's', 'b', ST_GeomFromText('POINT(25 181)')),
  ('s', 'c', 'g', ST_GeomFromText('POINT(252 17)')),
  ('a', 'c', 'f', ST_GeomFromText('POINT(89 67)')),
  ('r', 'e', 'q', ST_GeomFromText('POINT(55 54)')),
  ('f', 'i', 'k', ST_GeomFromText('POINT(178 230)')),
  ('p', 'e', 'l', ST_GeomFromText('POINT(198 28)')),
  ('w', 'o', 'd', ST_GeomFromText('POINT(204 189)')),
  ('c', 'a', 'g', ST_GeomFromText('POINT(230 178)')),
  ('r', 'o', 'e', ST_GeomFromText('POINT(61 116)')),
  ('w', 'a', 'a', ST_GeomFromText('POINT(178 237)')),
  ('v', 'd', 'e', ST_GeomFromText('POINT(70 85)')),
  ('k', 'c', 'e', ST_GeomFromText('POINT(147 118)')),
  ('d', 'q', 't', ST_GeomFromText('POINT(218 77)')),
  ('k', 'g', 'f', ST_GeomFromText('POINT(192 113)')),
  ('w', 'n', 'e', ST_GeomFromText('POINT(92 124)')),
  ('r', 'm', 'q', ST_GeomFromText('POINT(130 65)')),
  ('o', 'r', 'r', ST_GeomFromText('POINT(174 233)')),
  ('k', 'n', 't', ST_GeomFromText('POINT(175 147)')),
  ('q', 'm', 'r', ST_GeomFromText('POINT(18 208)')),
  ('l', 'd', 'i', ST_GeomFromText('POINT(13 104)')),
  ('w', 'o', 'y', ST_GeomFromText('POINT(207 39)')),
  ('p', 'u', 'o', ST_GeomFromText('POINT(114 31)')),
  ('y', 'a', 'p', ST_GeomFromText('POINT(106 59)')),
  ('a', 'x', 'z', ST_GeomFromText('POINT(17 57)')),
  ('v', 'h', 'x', ST_GeomFromText('POINT(170 13)')),
  ('t', 's', 'u', ST_GeomFromText('POINT(84 18)')),
  ('z', 'z', 'f', ST_GeomFromText('POINT(250 197)')),
  ('l', 'z', 't', ST_GeomFromText('POINT(59 80)')),
  ('j', 'g', 's', ST_GeomFromText('POINT(54 26)')),
  ('g', 'v', 'm', ST_GeomFromText('POINT(89 98)')),
  ('q', 'v', 'b', ST_GeomFromText('POINT(39 240)')),
  ('x', 'k', 'v', ST_GeomFromText('POINT(246 207)')),
  ('k', 'u', 'i', ST_GeomFromText('POINT(105 111)')),
  ('w', 'z', 's', ST_GeomFromText('POINT(235 8)')),
  ('d', 'd', 'd', ST_GeomFromText('POINT(105 4)')),
  ('c', 'z', 'q', ST_GeomFromText('POINT(13 140)')),
  ('m', 'k', 'i', ST_GeomFromText('POINT(208 120)')),
  ('g', 'a', 'g', ST_GeomFromText('POINT(9 182)')),
  ('z', 'j', 'r', ST_GeomFromText('POINT(149 153)')),
  ('h', 'f', 'g', ST_GeomFromText('POINT(81 236)')),
  ('m', 'e', 'q', ST_GeomFromText('POINT(209 215)')),
  ('c', 'h', 'y', ST_GeomFromText('POINT(235 70)')),
  ('i', 'e', 'g', ST_GeomFromText('POINT(138 26)')),
  ('m', 't', 'u', ST_GeomFromText('POINT(119 237)')),
  ('o', 'w', 's', ST_GeomFromText('POINT(193 166)')),
  ('f', 'm', 'q', ST_GeomFromText('POINT(85 96)')),
  ('x', 'l', 'x', ST_GeomFromText('POINT(58 115)')),
  ('x', 'q', 'u', ST_GeomFromText('POINT(108 210)')),
  ('b', 'h', 'i', ST_GeomFromText('POINT(250 139)')),
  ('y', 'd', 'x', ST_GeomFromText('POINT(199 135)')),
  ('w', 'h', 'p', ST_GeomFromText('POINT(247 233)')),
  ('p', 'z', 't', ST_GeomFromText('POINT(148 249)')),
  ('q', 'a', 'u', ST_GeomFromText('POINT(174 78)')),
  ('v', 't', 'm', ST_GeomFromText('POINT(70 228)')),
  ('t', 'n', 'f', ST_GeomFromText('POINT(123 2)')),
  ('x', 't', 'b', ST_GeomFromText('POINT(35 50)')),
  ('r', 'j', 'f', ST_GeomFromText('POINT(200 51)')),
  ('s', 'q', 'o', ST_GeomFromText('POINT(23 184)')),
  ('u', 'v', 'z', ST_GeomFromText('POINT(7 113)')),
  ('v', 'u', 'l', ST_GeomFromText('POINT(145 190)')),
  ('o', 'k', 'i', ST_GeomFromText('POINT(161 122)')),
  ('l', 'y', 'e', ST_GeomFromText('POINT(17 232)')),
  ('t', 'b', 'e', ST_GeomFromText('POINT(120 50)')),
  ('e', 's', 'u', ST_GeomFromText('POINT(254 1)')),
  ('d', 'd', 'u', ST_GeomFromText('POINT(167 140)')),
  ('o', 'b', 'x', ST_GeomFromText('POINT(186 237)')),
  ('m', 's', 's', ST_GeomFromText('POINT(172 149)')),
  ('t', 'y', 'a', ST_GeomFromText('POINT(149 85)')),
  ('x', 't', 'r', ST_GeomFromText('POINT(10 165)')),
  ('g', 'c', 'e', ST_GeomFromText('POINT(95 165)')),
  ('e', 'e', 'z', ST_GeomFromText('POINT(98 65)')),
  ('f', 'v', 'i', ST_GeomFromText('POINT(149 144)')),
  ('o', 'p', 'm', ST_GeomFromText('POINT(233 67)')),
  ('t', 'u', 'b', ST_GeomFromText('POINT(109 215)')),
  ('o', 'o', 'b', ST_GeomFromText('POINT(130 48)')),
  ('e', 'm', 'h', ST_GeomFromText('POINT(88 189)')),
  ('e', 'v', 'y', ST_GeomFromText('POINT(55 29)')),
  ('e', 't', 'm', ST_GeomFromText('POINT(129 55)')),
  ('p', 'p', 'i', ST_GeomFromText('POINT(126 222)')),
  ('c', 'i', 'c', ST_GeomFromText('POINT(19 158)')),
  ('c', 'b', 's', ST_GeomFromText('POINT(13 19)')),
  ('u', 'y', 'a', ST_GeomFromText('POINT(114 5)')),
  ('a', 'o', 'f', ST_GeomFromText('POINT(227 232)')),
  ('t', 'c', 'z', ST_GeomFromText('POINT(63 62)')),
  ('d', 'o', 'k', ST_GeomFromText('POINT(48 228)')),
  ('x', 'c', 'e', ST_GeomFromText('POINT(204 2)')),
  ('e', 'e', 'g', ST_GeomFromText('POINT(125 43)')),
  ('o', 'r', 'f', ST_GeomFromText('POINT(171 140)'));
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(163 157)') where  c1 like 'w%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(53 151)') where  c1 like 'd%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(96 183)') where  c1 like 'r%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(57 91)') where  c1 like 'q%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(202 110)') where  c1 like 'c%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(120 137)') where  c1 like 'w%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(207 147)') where  c1 like 'c%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(31 125)') where  c1 like 'e%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(27 36)') where  c1 like 'r%';
INSERT INTO t1 (c2, c1, c3, spatial_point) VALUES
  ('b', 'c', 'e', ST_GeomFromText('POINT(41 137)')),
  ('p', 'y', 'k', ST_GeomFromText('POINT(50 22)')),
  ('s', 'c', 'h', ST_GeomFromText('POINT(208 173)')),
  ('x', 'u', 'l', ST_GeomFromText('POINT(199 175)')),
  ('s', 'r', 'h', ST_GeomFromText('POINT(85 192)')),
  ('j', 'k', 'u', ST_GeomFromText('POINT(18 25)')),
  ('p', 'w', 'h', ST_GeomFromText('POINT(152 197)')),
  ('e', 'd', 'c', ST_GeomFromText('POINT(229 3)')),
  ('o', 'x', 'k', ST_GeomFromText('POINT(187 155)')),
  ('o', 'b', 'k', ST_GeomFromText('POINT(208 150)')),
  ('d', 'a', 'j', ST_GeomFromText('POINT(70 87)')),
  ('f', 'e', 'k', ST_GeomFromText('POINT(156 96)')),
  ('u', 'y', 'p', ST_GeomFromText('POINT(239 193)')),
  ('n', 'v', 'p', ST_GeomFromText('POINT(223 98)')),
  ('z', 'j', 'r', ST_GeomFromText('POINT(87 89)')),
  ('h', 'x', 'x', ST_GeomFromText('POINT(92 0)')),
  ('r', 'v', 'r', ST_GeomFromText('POINT(159 139)')),
  ('v', 'g', 'g', ST_GeomFromText('POINT(16 229)')),
  ('z', 'k', 'u', ST_GeomFromText('POINT(99 52)')),
  ('p', 'p', 'o', ST_GeomFromText('POINT(105 125)')),
  ('w', 'h', 'y', ST_GeomFromText('POINT(105 154)')),
  ('v', 'y', 'z', ST_GeomFromText('POINT(134 238)')),
  ('x', 'o', 'o', ST_GeomFromText('POINT(178 88)')),
  ('z', 'w', 'd', ST_GeomFromText('POINT(123 60)')),
  ('q', 'f', 'u', ST_GeomFromText('POINT(64 90)')),
  ('s', 'n', 't', ST_GeomFromText('POINT(50 138)')),
  ('v', 'p', 't', ST_GeomFromText('POINT(114 91)')),
  ('a', 'o', 'n', ST_GeomFromText('POINT(78 43)')),
  ('k', 'u', 'd', ST_GeomFromText('POINT(185 161)')),
  ('w', 'd', 'n', ST_GeomFromText('POINT(25 92)')),
  ('k', 'w', 'a', ST_GeomFromText('POINT(59 238)')),
  ('t', 'c', 'f', ST_GeomFromText('POINT(65 87)')),
  ('g', 's', 'p', ST_GeomFromText('POINT(238 126)')),
  ('d', 'n', 'y', ST_GeomFromText('POINT(107 173)')),
  ('l', 'a', 'w', ST_GeomFromText('POINT(125 152)')),
  ('m', 'd', 'j', ST_GeomFromText('POINT(146 53)')),
  ('q', 'm', 'c', ST_GeomFromText('POINT(217 187)')),
  ('i', 'r', 'r', ST_GeomFromText('POINT(6 113)')),
  ('e', 'j', 'b', ST_GeomFromText('POINT(37 83)')),
  ('w', 'w', 'h', ST_GeomFromText('POINT(83 199)')),
  ('k', 'b', 's', ST_GeomFromText('POINT(170 64)')),
  ('s', 'b', 'c', ST_GeomFromText('POINT(163 130)')),
  ('c', 'h', 'a', ST_GeomFromText('POINT(141 3)')),
  ('k', 'j', 'u', ST_GeomFromText('POINT(143 76)')),
  ('r', 'h', 'o', ST_GeomFromText('POINT(243 92)')),
  ('i', 'd', 'b', ST_GeomFromText('POINT(205 13)')),
  ('r', 'y', 'q', ST_GeomFromText('POINT(138 8)')),
  ('m', 'o', 'i', ST_GeomFromText('POINT(36 45)')),
  ('v', 'g', 'm', ST_GeomFromText('POINT(0 40)')),
  ('f', 'e', 'i', ST_GeomFromText('POINT(76 6)')),
  ('c', 'q', 'q', ST_GeomFromText('POINT(115 248)')),
  ('x', 'c', 'i', ST_GeomFromText('POINT(29 74)')),
  ('l', 's', 't', ST_GeomFromText('POINT(83 18)')),
  ('t', 't', 'a', ST_GeomFromText('POINT(26 168)')),
  ('u', 'n', 'x', ST_GeomFromText('POINT(200 110)')),
  ('j', 'b', 'd', ST_GeomFromText('POINT(216 136)')),
  ('s', 'p', 'w', ST_GeomFromText('POINT(38 156)')),
  ('f', 'b', 'v', ST_GeomFromText('POINT(29 186)')),
  ('v', 'e', 'r', ST_GeomFromText('POINT(149 40)')),
  ('v', 't', 'm', ST_GeomFromText('POINT(184 24)')),
  ('y', 'g', 'a', ST_GeomFromText('POINT(219 105)')),
  ('s', 'f', 'i', ST_GeomFromText('POINT(114 130)')),
  ('e', 'q', 'h', ST_GeomFromText('POINT(203 135)')),
  ('h', 'g', 'b', ST_GeomFromText('POINT(9 208)')),
  ('o', 'l', 'r', ST_GeomFromText('POINT(245 79)')),
  ('s', 's', 'v', ST_GeomFromText('POINT(238 198)')),
  ('w', 'w', 'z', ST_GeomFromText('POINT(209 232)')),
  ('v', 'd', 'n', ST_GeomFromText('POINT(30 193)')),
  ('q', 'w', 'k', ST_GeomFromText('POINT(133 18)')),
  ('o', 'h', 'o', ST_GeomFromText('POINT(42 140)')),
  ('f', 'f', 'h', ST_GeomFromText('POINT(145 1)')),
  ('u', 's', 'r', ST_GeomFromText('POINT(70 62)')),
  ('x', 'n', 'q', ST_GeomFromText('POINT(33 86)')),
  ('u', 'p', 'v', ST_GeomFromText('POINT(232 220)')),
  ('z', 'e', 'a', ST_GeomFromText('POINT(130 69)')),
  ('r', 'u', 'z', ST_GeomFromText('POINT(243 241)')),
  ('b', 'n', 't', ST_GeomFromText('POINT(120 12)')),
  ('u', 'f', 's', ST_GeomFromText('POINT(190 212)')),
  ('a', 'd', 'q', ST_GeomFromText('POINT(235 191)')),
  ('f', 'q', 'm', ST_GeomFromText('POINT(176 2)')),
  ('n', 'c', 's', ST_GeomFromText('POINT(218 163)')),
  ('e', 'm', 'h', ST_GeomFromText('POINT(163 108)')),
  ('c', 'f', 'l', ST_GeomFromText('POINT(220 115)')),
  ('c', 'v', 'q', ST_GeomFromText('POINT(66 45)')),
  ('w', 'v', 'x', ST_GeomFromText('POINT(251 220)')),
  ('f', 'w', 'z', ST_GeomFromText('POINT(146 149)')),
  ('h', 'n', 'h', ST_GeomFromText('POINT(148 128)')),
  ('y', 'k', 'v', ST_GeomFromText('POINT(28 110)')),
  ('c', 'x', 'q', ST_GeomFromText('POINT(13 13)')),
  ('e', 'd', 's', ST_GeomFromText('POINT(91 190)')),
  ('c', 'w', 'c', ST_GeomFromText('POINT(10 231)')),
  ('u', 'j', 'n', ST_GeomFromText('POINT(250 21)')),
  ('w', 'n', 'x', ST_GeomFromText('POINT(141 69)')),
  ('f', 'p', 'y', ST_GeomFromText('POINT(228 246)')),
  ('d', 'q', 'f', ST_GeomFromText('POINT(194 22)')),
  ('d', 'z', 'l', ST_GeomFromText('POINT(233 181)')),
  ('c', 'a', 'q', ST_GeomFromText('POINT(183 96)')),
  ('m', 'i', 'd', ST_GeomFromText('POINT(117 226)')),
  ('z', 'y', 'y', ST_GeomFromText('POINT(62 81)')),
  ('g', 'v', 'm', ST_GeomFromText('POINT(66 158)'));
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(61 203)') where  c1 like 'y%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(202 194)') where  c1 like 'f%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(228 18)') where  c1 like 'h%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(88 18)') where  c1 like 'l%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(176 94)') where  c1 like 'e%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(44 47)') where  c1 like 'g%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(95 191)') where  c1 like 'b%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(179 218)') where  c1 like 'y%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(239 40)') where  c1 like 'g%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(248 41)') where  c1 like 'q%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(167 82)') where  c1 like 't%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(13 104)') where  c1 like 'u%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(139 84)') where  c1 like 'a%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(145 108)') where  c1 like 'p%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(147 57)') where  c1 like 't%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(217 144)') where  c1 like 'n%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(160 224)') where  c1 like 'w%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(38 28)') where  c1 like 'j%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(104 114)') where  c1 like 'q%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(88 19)') where  c1 like 'c%';
INSERT INTO t1 (c2, c1, c3, spatial_point) VALUES
  ('f', 'x', 'p', ST_GeomFromText('POINT(92 181)')),
  ('s', 'i', 'c', ST_GeomFromText('POINT(49 60)')),
  ('c', 'c', 'i', ST_GeomFromText('POINT(7 57)')),
  ('n', 'g', 'k', ST_GeomFromText('POINT(252 105)')),
  ('g', 'b', 'm', ST_GeomFromText('POINT(180 11)')),
  ('u', 'l', 'r', ST_GeomFromText('POINT(32 90)')),
  ('c', 'x', 'e', ST_GeomFromText('POINT(143 24)')),
  ('x', 'u', 'a', ST_GeomFromText('POINT(123 92)')),
  ('s', 'b', 'h', ST_GeomFromText('POINT(190 108)')),
  ('c', 'x', 'b', ST_GeomFromText('POINT(104 100)')),
  ('i', 'd', 't', ST_GeomFromText('POINT(214 104)')),
  ('r', 'w', 'g', ST_GeomFromText('POINT(29 67)')),
  ('b', 'f', 'g', ST_GeomFromText('POINT(149 46)')),
  ('r', 'r', 'd', ST_GeomFromText('POINT(242 196)')),
  ('j', 'l', 'a', ST_GeomFromText('POINT(90 196)')),
  ('e', 't', 'b', ST_GeomFromText('POINT(190 64)')),
  ('l', 'x', 'w', ST_GeomFromText('POINT(250 73)')),
  ('q', 'y', 'r', ST_GeomFromText('POINT(120 182)')),
  ('s', 'j', 'a', ST_GeomFromText('POINT(180 175)')),
  ('n', 'i', 'y', ST_GeomFromText('POINT(124 136)')),
  ('s', 'x', 's', ST_GeomFromText('POINT(176 209)')),
  ('u', 'f', 's', ST_GeomFromText('POINT(215 173)')),
  ('m', 'j', 'x', ST_GeomFromText('POINT(44 140)')),
  ('v', 'g', 'x', ST_GeomFromText('POINT(177 233)')),
  ('u', 't', 'b', ST_GeomFromText('POINT(136 197)')),
  ('f', 'g', 'b', ST_GeomFromText('POINT(10 8)')),
  ('v', 'c', 'j', ST_GeomFromText('POINT(13 81)')),
  ('d', 's', 'q', ST_GeomFromText('POINT(200 100)')),
  ('a', 'p', 'j', ST_GeomFromText('POINT(33 40)')),
  ('i', 'c', 'g', ST_GeomFromText('POINT(168 204)')),
  ('k', 'h', 'i', ST_GeomFromText('POINT(93 243)')),
  ('s', 'b', 's', ST_GeomFromText('POINT(157 13)')),
  ('v', 'l', 'l', ST_GeomFromText('POINT(103 6)')),
  ('r', 'b', 'k', ST_GeomFromText('POINT(244 137)')),
  ('l', 'd', 'r', ST_GeomFromText('POINT(162 254)')),
  ('q', 'b', 'z', ST_GeomFromText('POINT(136 246)')),
  ('x', 'x', 'p', ST_GeomFromText('POINT(120 37)')),
  ('m', 'e', 'z', ST_GeomFromText('POINT(203 167)')),
  ('q', 'n', 'p', ST_GeomFromText('POINT(94 119)')),
  ('b', 'g', 'u', ST_GeomFromText('POINT(93 248)')),
  ('r', 'v', 'v', ST_GeomFromText('POINT(53 88)')),
  ('y', 'a', 'i', ST_GeomFromText('POINT(98 219)')),
  ('a', 's', 'g', ST_GeomFromText('POINT(173 138)')),
  ('c', 'a', 't', ST_GeomFromText('POINT(235 135)')),
  ('q', 'm', 'd', ST_GeomFromText('POINT(224 208)')),
  ('e', 'p', 'k', ST_GeomFromText('POINT(161 238)')),
  ('n', 'g', 'q', ST_GeomFromText('POINT(35 204)')),
  ('t', 't', 'x', ST_GeomFromText('POINT(230 178)')),
  ('w', 'f', 'a', ST_GeomFromText('POINT(150 221)')),
  ('z', 'm', 'z', ST_GeomFromText('POINT(119 42)')),
  ('l', 'j', 's', ST_GeomFromText('POINT(97 96)')),
  ('f', 'z', 'x', ST_GeomFromText('POINT(208 65)')),
  ('i', 'v', 'c', ST_GeomFromText('POINT(145 79)')),
  ('l', 'f', 'k', ST_GeomFromText('POINT(83 234)')),
  ('u', 'a', 's', ST_GeomFromText('POINT(250 49)')),
  ('o', 'k', 'p', ST_GeomFromText('POINT(46 50)')),
  ('d', 'e', 'z', ST_GeomFromText('POINT(30 198)')),
  ('r', 'r', 'l', ST_GeomFromText('POINT(78 189)')),
  ('y', 'l', 'f', ST_GeomFromText('POINT(188 132)')),
  ('d', 'q', 'm', ST_GeomFromText('POINT(247 107)')),
  ('p', 'j', 'n', ST_GeomFromText('POINT(148 227)')),
  ('b', 'o', 'i', ST_GeomFromText('POINT(172 25)')),
  ('e', 'v', 'd', ST_GeomFromText('POINT(94 248)')),
  ('q', 'd', 'f', ST_GeomFromText('POINT(15 29)')),
  ('w', 'b', 'b', ST_GeomFromText('POINT(74 111)')),
  ('g', 'q', 'f', ST_GeomFromText('POINT(107 215)')),
  ('o', 'h', 'r', ST_GeomFromText('POINT(25 168)')),
  ('u', 't', 'w', ST_GeomFromText('POINT(251 188)')),
  ('h', 's', 'w', ST_GeomFromText('POINT(254 247)')),
  ('f', 'f', 'b', ST_GeomFromText('POINT(166 103)'));
INSERT INTO t1 (c2, c1, c3, spatial_point) VALUES
  ('l', 'c', 'l', ST_GeomFromText('POINT(202 98)')),
  ('k', 'c', 'b', ST_GeomFromText('POINT(46 206)')),
  ('r', 'y', 'm', ST_GeomFromText('POINT(74 140)')),
  ('y', 'z', 'd', ST_GeomFromText('POINT(200 160)')),
  ('s', 'y', 's', ST_GeomFromText('POINT(156 205)')),
  ('u', 'v', 'p', ST_GeomFromText('POINT(86 82)')),
  ('j', 's', 's', ST_GeomFromText('POINT(91 233)')),
  ('x', 'j', 'f', ST_GeomFromText('POINT(3 14)')),
  ('l', 'z', 'v', ST_GeomFromText('POINT(123 156)')),
  ('h', 'i', 'o', ST_GeomFromText('POINT(145 229)')),
  ('o', 'r', 'd', ST_GeomFromText('POINT(15 22)')),
  ('f', 'x', 't', ST_GeomFromText('POINT(21 60)')),
  ('t', 'g', 'h', ST_GeomFromText('POINT(50 153)')),
  ('g', 'u', 'b', ST_GeomFromText('POINT(82 85)')),
  ('v', 'a', 'p', ST_GeomFromText('POINT(231 178)')),
  ('n', 'v', 'o', ST_GeomFromText('POINT(183 25)')),
  ('j', 'n', 'm', ST_GeomFromText('POINT(50 144)')),
  ('e', 'f', 'i', ST_GeomFromText('POINT(46 16)')),
  ('d', 'w', 'a', ST_GeomFromText('POINT(66 6)')),
  ('f', 'x', 'a', ST_GeomFromText('POINT(107 197)')),
  ('m', 'o', 'a', ST_GeomFromText('POINT(142 80)')),
  ('q', 'l', 'g', ST_GeomFromText('POINT(251 23)')),
  ('c', 's', 's', ST_GeomFromText('POINT(158 43)')),
  ('y', 'd', 'o', ST_GeomFromText('POINT(196 228)')),
  ('d', 'p', 'l', ST_GeomFromText('POINT(107 5)')),
  ('h', 'a', 'b', ST_GeomFromText('POINT(183 166)')),
  ('m', 'w', 'p', ST_GeomFromText('POINT(19 59)')),
  ('b', 'y', 'o', ST_GeomFromText('POINT(178 30)')),
  ('x', 'w', 'i', ST_GeomFromText('POINT(168 94)')),
  ('t', 'k', 'z', ST_GeomFromText('POINT(171 5)')),
  ('r', 'm', 'a', ST_GeomFromText('POINT(222 19)')),
  ('u', 'v', 'e', ST_GeomFromText('POINT(224 80)')),
  ('q', 'r', 'k', ST_GeomFromText('POINT(212 218)')),
  ('d', 'p', 'j', ST_GeomFromText('POINT(169 7)')),
  ('d', 'r', 'v', ST_GeomFromText('POINT(193 23)')),
  ('n', 'y', 'y', ST_GeomFromText('POINT(130 178)')),
  ('m', 'z', 'r', ST_GeomFromText('POINT(81 200)')),
  ('j', 'e', 'w', ST_GeomFromText('POINT(145 239)')),
  ('v', 'h', 'x', ST_GeomFromText('POINT(24 105)')),
  ('z', 'm', 'a', ST_GeomFromText('POINT(175 129)')),
  ('b', 'c', 'v', ST_GeomFromText('POINT(213 10)')),
  ('t', 't', 'u', ST_GeomFromText('POINT(2 129)')),
  ('r', 's', 'v', ST_GeomFromText('POINT(209 192)')),
  ('x', 'p', 'g', ST_GeomFromText('POINT(43 63)')),
  ('t', 'e', 'u', ST_GeomFromText('POINT(139 210)')),
  ('l', 'e', 't', ST_GeomFromText('POINT(245 148)')),
  ('a', 'i', 'k', ST_GeomFromText('POINT(167 195)')),
  ('m', 'o', 'h', ST_GeomFromText('POINT(206 120)')),
  ('g', 'z', 's', ST_GeomFromText('POINT(169 240)')),
  ('z', 'u', 's', ST_GeomFromText('POINT(202 120)')),
  ('i', 'b', 'a', ST_GeomFromText('POINT(216 18)')),
  ('w', 'y', 'g', ST_GeomFromText('POINT(119 236)')),
  ('h', 'y', 'p', ST_GeomFromText('POINT(161 24)'));
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(33 100)') where  c1 like 't%';
UPDATE t1 set spatial_point=ST_GeomFromText('POINT(41 46)') where  c1 like 'f%';
DROP TABLE t1;
create table t1 (a geometry not null SRID 0, spatial index(a));
insert into t1 values (POINT(1.1517219314031e+164, 131072));
insert into t1 values (POINT(9.1248812352444e+192, 2.9740338169556e+284));
insert into t1 values (POINT(4.7783097267365e-299, -0));
insert into t1 values (POINT(1.49166814624e-154, 2.0880974297595e-53));
insert into t1 values (POINT(4.0917382598702e+149, 1.2024538023802e+111));
insert into t1 values (POINT(2.0349165139404e+236, 2.9993936277913e-241));
insert into t1 values (POINT(2.5243548967072e-29, 1.2024538023802e+111));
insert into t1 values (POINT(0, 6.9835074892995e-251));
insert into t1 values (POINT(2.0880974297595e-53, 3.1050361846014e+231));
insert into t1 values (POINT(2.8728483499323e-188, 2.4600631144627e+260));
insert into t1 values (POINT(3.0517578125e-05, 2.0349165139404e+236));
insert into t1 values (POINT(1.1517219314031e+164, 1.1818212630766e-125));
insert into t1 values (POINT(2.481040258324e-265, 5.7766220027675e-275));
insert into t1 values (POINT(2.0880974297595e-53, 2.5243548967072e-29));
insert into t1 values (POINT(5.7766220027675e-275, 9.9464647281957e+86));
insert into t1 values (POINT(2.2181357552967e+130, 3.7857669957337e-270));
insert into t1 values (POINT(4.5767114681874e-246, 3.6893488147419e+19));
insert into t1 values (POINT(4.5767114681874e-246, 3.7537584144024e+255));
insert into t1 values (POINT(3.7857669957337e-270, 1.8033161362863e-130));
insert into t1 values (POINT(0, 5.8774717541114e-39));
insert into t1 values (POINT(1.1517219314031e+164, 2.2761049594727e-159));
insert into t1 values (POINT(6.243497100632e+144, 3.7857669957337e-270));
insert into t1 values (POINT(3.7857669957337e-270, 2.6355494858076e-82));
insert into t1 values (POINT(2.0349165139404e+236, 3.8518598887745e-34));
insert into t1 values (POINT(4.6566128730774e-10, 2.0880974297595e-53));
insert into t1 values (POINT(2.0880974297595e-53, 1.8827498946116e-183));
insert into t1 values (POINT(1.8033161362863e-130, 9.1248812352444e+192));
insert into t1 values (POINT(4.7783097267365e-299, 2.2761049594727e-159));
insert into t1 values (POINT(1.94906280228e+289, 1.2338789709327e-178));
drop table t1;
CREATE TABLE t1(foo GEOMETRY NOT NULL SRID 0, SPATIAL INDEX(foo) );
DROP TABLE t1;
CREATE TABLE t1 (a INT AUTO_INCREMENT, b POINT NOT NULL SRID 0, KEY (a), SPATIAL KEY (b));
INSERT INTO t1 (b) VALUES (ST_GeomFromText('POINT(1 2)'));
INSERT INTO t1 (b) SELECT b FROM t1;
INSERT INTO t1 (b) SELECT b FROM t1;
INSERT INTO t1 (b) SELECT b FROM t1;
INSERT INTO t1 (b) SELECT b FROM t1;
INSERT INTO t1 (b) SELECT b FROM t1;
DROP TABLE t1;
CREATE TABLE t1 (a INT, b GEOMETRY NOT NULL SRID 0, SPATIAL KEY b(b));
INSERT INTO t1 VALUES (1, ST_GEOMFROMTEXT('LINESTRING(1102218.456 1,2000000 2)'));
INSERT INTO t1 VALUES (2, ST_GEOMFROMTEXT('LINESTRING(1102218.456 1,2000000 2)'));
SELECT COUNT(*) FROM t1 WHERE
  MBRINTERSECTS(b, ST_GEOMFROMTEXT('LINESTRING(1 1,1102219 2)') );
SELECT COUNT(*) FROM t1 IGNORE INDEX (b) WHERE
  MBRINTERSECTS(b, ST_GEOMFROMTEXT('LINESTRING(1 1,1102219 2)') );
DROP TABLE t1;
CREATE TABLE t1(a LINESTRING NOT NULL SRID 0, SPATIAL KEY(a));
INSERT INTO t1 VALUES
  (ST_GEOMFROMTEXT('LINESTRING(-1 -1, 1 -1, -1 -1, -1 1, 1 1)')),
  (ST_GEOMFROMTEXT('LINESTRING(-1 -1, 1 -1, -1 -1, -1 1, 1 1)'));
SELECT 1 FROM t1 WHERE a = ST_GEOMFROMTEXT('LINESTRING(-1 -1, 1 -1, -1 -1, -1 1, 1 1)');
DROP TABLE t1;
CREATE TABLE t1(a GEOMETRY NOT NULL SRID 0,SPATIAL INDEX a(a));
INSERT INTO t1 VALUES (ST_GeomFromText('Polygon((40 40,60 40,60 60,40 60,40 40))'));
DROP TABLE t1;
CREATE TABLE t1(a LINESTRING NOT NULL SRID 0, b GEOMETRY NOT NULL SRID 0,
  SPATIAL KEY(a), SPATIAL KEY(b)) ENGINE=MyISAM;
SELECT ST_ASTEXT(a), ST_ASTEXT(b) FROM t1;
DROP TABLE t1;
CREATE TABLE t1(a INT NOT NULL, b GEOMETRY NOT NULL SRID 0,
  KEY(a), SPATIAL KEY(b)) ENGINE=MyISAM;
INSERT INTO t1 VALUES(0, ST_GEOMFROMTEXT("point (1 1)"));
SELECT a, ST_ASTEXT(b) FROM t1;
DROP TABLE t1;
CREATE TABLE t1 (g GEOMETRY NOT NULL SRID 0, SPATIAL KEY (g)) ENGINE=MyISAM;
DELETE FROM t1 WHERE ST_DISJOINT(g, POINT(1,1));
DROP TABLE t1;
