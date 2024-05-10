DROP TABLE IF EXISTS t1, gis_point, gis_line, gis_polygon, gis_multi_point, gis_multi_line, gis_multi_polygon, gis_geometrycollection, gis_geometry;
CREATE TABLE gis_point (fid INTEGER NOT NULL PRIMARY KEY, g POINT);
CREATE TABLE gis_line  (fid INTEGER NOT NULL PRIMARY KEY, g LINESTRING);
CREATE TABLE gis_polygon   (fid INTEGER NOT NULL PRIMARY KEY, g POLYGON);
CREATE TABLE gis_multi_point (fid INTEGER NOT NULL PRIMARY KEY, g MULTIPOINT);
CREATE TABLE gis_multi_line (fid INTEGER NOT NULL PRIMARY KEY, g MULTILINESTRING);
CREATE TABLE gis_multi_polygon  (fid INTEGER NOT NULL PRIMARY KEY, g MULTIPOLYGON);
CREATE TABLE gis_geometrycollection  (fid INTEGER NOT NULL PRIMARY KEY, g GEOMETRYCOLLECTION);
CREATE TABLE gis_geometry (fid INTEGER NOT NULL PRIMARY KEY, g GEOMETRY);
INSERT INTO gis_point VALUES 
(101, ST_PointFromText('POINT(10 10)')),
(102, ST_PointFromText('POINT(20 10)')),
(103, ST_PointFromText('POINT(20 20)')),
(104, ST_PointFromWKB(ST_AsWKB(ST_PointFromText('POINT(10 20)'))));
INSERT INTO gis_line VALUES
(105, ST_LineFromText('LINESTRING(0 0,0 10,10 0)')),
(106, ST_LineStringFromText('LINESTRING(10 10,20 10,20 20,10 20,10 10)')),
(107, ST_LineStringFromWKB(ST_AsWKB(LineString(Point(10, 10), Point(40, 10)))));
INSERT INTO gis_polygon VALUES
(108, ST_PolygonFromText('POLYGON((10 10,20 10,20 20,10 20,10 10))')),
(109, ST_PolyFromText('POLYGON((0 0,50 0,50 50,0 50,0 0), (10 10,20 10,20 20,10 20,10 10))')),
(110, ST_PolyFromWKB(ST_AsWKB(Polygon(LineString(Point(0, 0), Point(30, 0), Point(30, 30), Point(0, 0))))));
INSERT INTO gis_multi_point VALUES
(111, ST_MultiPointFromText('MULTIPOINT(0 0,10 10,10 20,20 20)')),
(112, ST_MPointFromText('MULTIPOINT(1 1,11 11,11 21,21 21)')),
(113, ST_MPointFromWKB(ST_AsWKB(MultiPoint(Point(3, 6), Point(4, 10)))));
INSERT INTO gis_multi_line VALUES
(114, ST_MultiLineStringFromText('MULTILINESTRING((10 48,10 21,10 0),(16 0,16 23,16 48))')),
(115, ST_MLineFromText('MULTILINESTRING((10 48,10 21,10 0))')),
(116, ST_MLineFromWKB(ST_AsWKB(MultiLineString(LineString(Point(1, 2), Point(3, 5)), LineString(Point(2, 5), Point(5, 8), Point(21, 7))))));
INSERT INTO gis_multi_polygon VALUES
(117, ST_MultiPolygonFromText('MULTIPOLYGON(((28 26,28 0,84 0,84 42,28 26),(52 18,66 23,73 9,48 6,52 18)),((59 18,67 18,67 13,59 13,59 18)))')),
(118, ST_MPolyFromText('MULTIPOLYGON(((28 26,28 0,84 0,84 42,28 26),(52 18,66 23,73 9,48 6,52 18)),((59 18,67 18,67 13,59 13,59 18)))')),
(119, ST_MPolyFromWKB(ST_AsWKB(MultiPolygon(Polygon(LineString(Point(0, 3), Point(3, 3), Point(3, 0), Point(0, 3)))))));
INSERT INTO gis_geometrycollection VALUES
(120, ST_GeomCollFromText('GEOMETRYCOLLECTION(POINT(0 0), LINESTRING(0 0,10 10))')),
(121, ST_GeometryFromWKB(ST_AsWKB(GeometryCollection(Point(44, 6), LineString(Point(3, 6), Point(7, 9))))));
INSERT into gis_geometry SELECT * FROM gis_point;
INSERT into gis_geometry SELECT * FROM gis_line;
INSERT into gis_geometry SELECT * FROM gis_polygon;
INSERT into gis_geometry SELECT * FROM gis_multi_point;
INSERT into gis_geometry SELECT * FROM gis_multi_line;
INSERT into gis_geometry SELECT * FROM gis_multi_polygon;
INSERT into gis_geometry SELECT * FROM gis_geometrycollection;
SELECT fid, ST_AsText(g) FROM gis_point;
SELECT fid, ST_AsText(g) FROM gis_line;
SELECT fid, ST_AsText(g) FROM gis_polygon;
SELECT fid, ST_AsText(g) FROM gis_multi_point;
SELECT fid, ST_AsText(g) FROM gis_multi_line;
SELECT fid, ST_AsText(g) FROM gis_multi_polygon;
SELECT fid, ST_AsText(g) FROM gis_geometrycollection;
SELECT fid, ST_AsText(g) FROM gis_geometry;
SELECT fid, ST_Dimension(g) FROM gis_geometry;
SELECT fid, ST_GeometryType(g) FROM gis_geometry;
SELECT fid, ST_IsEmpty(g) FROM gis_geometry;
SELECT fid, ST_AsText(ST_Envelope(g)) FROM gis_geometry;
SELECT fid, ST_X(g) FROM gis_point;
SELECT fid, ST_Y(g) FROM gis_point;
SELECT fid, ST_AsText(ST_StartPoint(g)) FROM gis_line;
SELECT fid, ST_AsText(ST_EndPoint(g)) FROM gis_line;
SELECT fid, ST_Length(g) FROM gis_line;
SELECT fid, ST_NumPoints(g) FROM gis_line;
SELECT fid, ST_AsText(ST_PointN(g, 2)) FROM gis_line;
SELECT fid, ST_IsClosed(g) FROM gis_line;
SELECT fid, ST_AsText(ST_Centroid(g)) FROM gis_polygon;
SELECT fid, ST_Area(g) FROM gis_polygon;
SELECT fid, ST_AsText(ST_ExteriorRing(g)) FROM gis_polygon;
SELECT fid, ST_NumInteriorRings(g) FROM gis_polygon;
SELECT fid, ST_AsText(ST_InteriorRingN(g, 1)) FROM gis_polygon;
SELECT fid, ST_IsClosed(g) FROM gis_multi_line;
SELECT fid, ST_AsText(ST_Centroid(g)) FROM gis_multi_polygon;
SELECT fid, ST_Area(g) FROM gis_multi_polygon;
SELECT fid, ST_NumGeometries(g) from gis_multi_point;
SELECT fid, ST_NumGeometries(g) from gis_multi_line;
SELECT fid, ST_NumGeometries(g) from gis_multi_polygon;
SELECT fid, ST_NumGeometries(g) from gis_geometrycollection;
SELECT fid, ST_AsText(ST_GeometryN(g, 2)) from gis_multi_point;
SELECT fid, ST_AsText(ST_GeometryN(g, 2)) from gis_multi_line;
SELECT fid, ST_AsText(ST_GeometryN(g, 2)) from gis_multi_polygon;
SELECT fid, ST_AsText(ST_GeometryN(g, 2)) from gis_geometrycollection;
SELECT fid, ST_AsText(ST_GeometryN(g, 1)) from gis_geometrycollection;
SELECT g1.fid as first, g2.fid as second,
MBRWithin(g1.g, g2.g) as w, MBRContains(g1.g, g2.g) as c, MBROverlaps(g1.g, g2.g) as o,
MBREquals(g1.g, g2.g) as e, MBRDisjoint(g1.g, g2.g) as d, ST_Touches(g1.g, g2.g) as t,
MBRIntersects(g1.g, g2.g) as i, ST_Crosses(g1.g, g2.g) as r
FROM gis_geometrycollection g1, gis_geometrycollection g2 ORDER BY first, second;
DROP TABLE gis_point, gis_line, gis_polygon, gis_multi_point, gis_multi_line, gis_multi_polygon, gis_geometrycollection, gis_geometry;
CREATE TABLE t1 (
  gp  point,
  ln  linestring,
  pg  polygon,
  mp  multipoint,
  mln multilinestring,
  mpg multipolygon,
  gc  geometrycollection,
  gm  geometry
);
ALTER TABLE t1 ADD fid INT NOT NULL;
DROP TABLE t1;
SELECT ST_AsText(ST_GeometryFromWKB(ST_AsWKB(ST_GeometryFromText('POINT(1 4)'))));
SELECT ST_SRID(ST_GeomFromText('LineString(1 1,2 2)'));
create table t1 (a geometry not null SRID 0);
insert into t1 values (ST_GeomFromText('Point(1 2)'));
alter table t1 add spatial index(a);
drop table t1;
create table t1(a geometry not null SRID 0, spatial index(a));
insert into t1 values
(ST_GeomFromText('POINT(1 1)')), (ST_GeomFromText('POINT(3 3)')), 
(ST_GeomFromText('POINT(4 4)')), (ST_GeomFromText('POINT(6 6)'));
select ST_AsText(a) from t1 where
  MBRContains(ST_GeomFromText('Polygon((0 0, 0 2, 2 2, 2 0, 0 0))'), a)
  or
  MBRContains(ST_GeomFromText('Polygon((2 2, 2 5, 5 5, 5 2, 2 2))'), a);
select ST_AsText(a) from t1 where
  MBRContains(ST_GeomFromText('Polygon((0 0, 0 2, 2 2, 2 0, 0 0))'), a)
  and
  MBRContains(ST_GeomFromText('Polygon((0 0, 0 7, 7 7, 7 0, 0 0))'), a);
drop table t1;
CREATE TABLE t1 (Coordinates POINT NOT NULL SRID 0, SPATIAL INDEX(Coordinates));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(383293632 1754448)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(564952612 157516260)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(903994614 180726515)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(98128178 141127631)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(862547902 799334546)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(341989013 850270906)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(803302376 93039099)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(857439153 817431356)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(319757546 343162742)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(826341972 717484432)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(305066789 201736238)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(626068992 616241497)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(55789424 755830108)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(802874458 312435220)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(153795660 551723671)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(242207428 537089292)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(553478119 807160039)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(694605552 457472733)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(987886554 792733729)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(598600363 850434457)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(592068275 940589376)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(700705362 395370650)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(33628474 558144514)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(212802006 353386020)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(901307256 39143977)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(70870451 206374045)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(240880214 696939443)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(822615542 296669638)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(452769551 625489999)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(609104858 606565210)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(177213669 851312285)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(143654501 730691787)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(658472325 838260052)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(188164520 646358878)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(630993781 786764883)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(496793334 223062055)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(727354258 197498696)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(618432704 760982731)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(755643210 831234710)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(114368751 656950466)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(870378686 185239202)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(863324511 111258900)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(882178645 685940052)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(407928538 334948195)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(311430051 17033395)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(941513405 488643719)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(868345680 85167906)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(219335507 526818004)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(923427958 407500026)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(173176882 554421738)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(194264908 669970217)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(777483793 921619165)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(867468912 395916497)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(682601897 623112122)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(227151206 796970647)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(280062588 97529892)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(982209849 143387099)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(208788792 864388493)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(829327151 616717329)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(199336688 140757201)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(633750724 140850093)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(629400920 502096404)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(226017998 848736426)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(28914408 149445955)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(256236452 202091290)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(703867693 450501360)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(872061506 481351486)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(372120524 739530418)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(877267982 54722420)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(362642540 104419188)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(851693067 642705127)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(201949080 833902916)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(786092225 410737872)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(698291409 615419376)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(27455201 897628096)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(756176576 661205925)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(38478189 385577496)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(163302328 264496186)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(234313922 192216735)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(413942141 490550373)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(394308025 117809834)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(941051732 266369530)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(599161319 313172256)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(5899948 476429301)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(367894677 368542487)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(580848489 219587743)'));
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(11247614 782797569)'));
drop table t1;
create table t1 select ST_GeomFromWKB(St_AsWKB(POINT(1,3)));
drop table t1;
CREATE TABLE `t1` (`object_id` bigint(20) unsigned NOT NULL default '0', `geo`
geometry NOT NULL) ENGINE=MyISAM;
insert into t1 values ('85984',ST_GeomFromText('MULTIPOLYGON(((-115.006363
36.305435,-114.992394 36.305202,-114.991219 36.305975,-114.991163
36.306845,-114.989432 36.309452,-114.978275 36.312642,-114.977363
36.311978,-114.975327 36.312344,-114.96502 36.31597,-114.963364
36.313629,-114.961723 36.313721,-114.956398 36.316057,-114.951882
36.320979,-114.947073 36.323475,-114.945207 36.326451,-114.945207
36.326451,-114.944132 36.326061,-114.94003 36.326588,-114.924017
36.334484,-114.923281 36.334146,-114.92564 36.331504,-114.94072
36.319282,-114.945348 36.314812,-114.948091 36.314762,-114.951755
36.316211,-114.952446 36.313883,-114.952644 36.309488,-114.944725
36.313083,-114.93706 36.32043,-114.932478 36.323497,-114.924556
36.327708,-114.922608 36.329715,-114.92009 36.328695,-114.912105
36.323566,-114.901647 36.317952,-114.897436 36.313968,-114.895344
36.309573,-114.891699 36.304398,-114.890569 36.303551,-114.886356
36.302702,-114.885141 36.301351,-114.885709 36.297391,-114.892499
36.290893,-114.902142 36.288974,-114.904941 36.288838,-114.905308
36.289845,-114.906325 36.290395,-114.909916 36.289549,-114.914527
36.287535,-114.918797 36.284423,-114.922982 36.279731,-114.924113
36.277282,-114.924057 36.275817,-114.927733 36.27053,-114.929354
36.269029,-114.929354 36.269029,-114.950856 36.268715,-114.950768
36.264324,-114.960206 36.264293,-114.960301 36.268943,-115.006662
36.268929,-115.008583 36.265619,-115.00665 36.264247,-115.006659
36.246873,-115.006659 36.246873,-115.006838 36.247697,-115.010764
36.247774,-115.015609 36.25113,-115.015765 36.254505,-115.029517
36.254619,-115.038573 36.249317,-115.038573 36.249317,-115.023403
36.25841,-115.023873 36.258994,-115.031845 36.259829,-115.03183
36.261053,-115.025561 36.261095,-115.036417 36.274632,-115.033729
36.276041,-115.032217 36.274851,-115.029845 36.273959,-115.029934
36.274966,-115.025763 36.274896,-115.025406 36.281044,-115.028731
36.284471,-115.036497 36.290377,-115.042071 36.291039,-115.026759
36.298478,-115.008995 36.301966,-115.006363 36.305435),(-115.079835
36.244369,-115.079735 36.260186,-115.076435 36.262369,-115.069758
36.265,-115.070235 36.268757,-115.064542 36.268655,-115.061843
36.269857,-115.062676 36.270693,-115.06305 36.272344,-115.059051
36.281023,-115.05918 36.283008,-115.060591 36.285246,-115.061913
36.290022,-115.062499 36.306353,-115.062499 36.306353,-115.060918
36.30642,-115.06112 36.289779,-115.05713 36.2825,-115.057314
36.279446,-115.060779 36.274659,-115.061366 36.27209,-115.057858
36.26557,-115.055805 36.262883,-115.054688 36.262874,-115.047335
36.25037,-115.044234 36.24637,-115.052434 36.24047,-115.061734
36.23507,-115.061934 36.22677,-115.061934 36.22677,-115.061491
36.225267,-115.062024 36.218194,-115.060134 36.218278,-115.060133
36.210771,-115.057833 36.210771,-115.057433 36.196271,-115.062233
36.196271,-115.062233 36.190371,-115.062233 36.190371,-115.065533
36.190371,-115.071333 36.188571,-115.098331 36.188275,-115.098331
36.188275,-115.098435 36.237569,-115.097535 36.240369,-115.097535
36.240369,-115.093235 36.240369,-115.089135 36.240469,-115.083135
36.240569,-115.083135 36.240569,-115.079835
36.244369)))')),('85998',ST_GeomFromText('MULTIPOLYGON(((-115.333107
36.264587,-115.333168 36.280638,-115.333168 36.280638,-115.32226
36.280643,-115.322538 36.274311,-115.327222 36.274258,-115.32733
36.263026,-115.330675 36.262984,-115.332132 36.264673,-115.333107
36.264587),(-115.247239 36.247066,-115.247438 36.218267,-115.247438
36.218267,-115.278525 36.219263,-115.278525 36.219263,-115.301545
36.219559,-115.332748 36.219197,-115.332757 36.220041,-115.332757
36.220041,-115.332895 36.233514,-115.349023 36.233479,-115.351489
36.234475,-115.353681 36.237021,-115.357106 36.239789,-115.36519
36.243331,-115.368156 36.243487,-115.367389 36.244902,-115.364553
36.246014,-115.359219 36.24616,-115.356186 36.248025,-115.353347
36.248004,-115.350813 36.249507,-115.339673 36.25387,-115.333069
36.255018,-115.333069 36.255018,-115.333042 36.247767,-115.279039
36.248666,-115.263639 36.247466,-115.263839 36.252766,-115.261439
36.252666,-115.261439 36.247366,-115.247239 36.247066)))'));
select object_id, ST_geometrytype(geo), ST_ISSIMPLE(GEO), ST_ASTEXT(ST_centroid(geo)) from
t1 where object_id=85998;
select object_id, ST_geometrytype(geo), ST_ISSIMPLE(GEO), ST_ASTEXT(ST_centroid(geo)) from
t1 where object_id=85984;
drop table t1;
create table t1 (fl geometry not null);
drop table t1;
select (ST_asWKT(ST_geomfromwkb((0x000000000140240000000000004024000000000000))));
select (ST_asWKT(ST_geomfromwkb((0x010100000000000000000024400000000000002440))));
create table t1 (g GEOMETRY);
select * from t1;
select ST_asbinary(g) from t1;
drop table t1;
create table t1 (a TEXT, b GEOMETRY NOT NULL SRID 0, SPATIAL KEY(b));
alter table t1 disable keys;
alter table t1 enable keys;
drop table t1;
create table t1 (a int, b blob);
insert into t1 values (1, ''), (2, NULL), (3, '1');
select * from t1;
drop table t1;
CREATE TABLE t1(a POINT) ENGINE=MyISAM;
INSERT INTO t1 VALUES (NULL);
SELECT * FROM t1;
DROP TABLE t1;
CREATE TABLE `t1` ( `col9` set('a'), `col89` date);
select ST_geomfromtext(col9,col89) as a from t1;
DROP TABLE t1;
CREATE TABLE t1 (
  geomdata polygon NOT NULL SRID 0,
  SPATIAL KEY index_geom (geomdata)
) ENGINE=MyISAM DEFAULT CHARSET=latin2 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;
CREATE TABLE t2 (
  geomdata polygon NOT NULL SRID 0,
  SPATIAL KEY index_geom (geomdata)
) ENGINE=MyISAM DEFAULT CHARSET=latin2 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;
CREATE TABLE t3
select 
    ST_aswkb(ws.geomdata) AS geomdatawkb 
  from 
    t1 ws
union 
  select 
    ST_aswkb(ws.geomdata) AS geomdatawkb 
  from 
    t2 ws;
drop table t1;
drop table t2;
drop table t3;
create table t1(col1 geometry default null,col15 geometrycollection not
null SRID 0,spatial index(col15))engine=myisam;
drop table t1;
create table t1 (s1 geometry not null,s2 char(100));
drop table t1;
drop procedure if exists fn3;
create table t1(pt POINT);
drop table t1;
create table t1(pt GEOMETRY);
drop table t1;
create table t1 select ST_GeomFromText('point(1 1)');
drop table t1;
create table t1 (g geometry not null);
drop table t1;
CREATE TABLE t1 (a GEOMETRY);
CREATE VIEW v1 AS SELECT ST_GeomFromwkb(ST_ASBINARY(a)) FROM t1;
CREATE VIEW v2 AS SELECT a FROM t1;
DROP VIEW v1,v2;
DROP TABLE t1;
create table t1 (name VARCHAR(100), square GEOMETRY);
INSERT INTO t1 VALUES("center", ST_GeomFromText('POLYGON (( 0 0, 0 2, 2 2, 2 0, 0 0))'));
INSERT INTO t1 VALUES("small",  ST_GeomFromText('POLYGON (( 0 0, 0 1, 1 1, 1 0, 0 0))'));
INSERT INTO t1 VALUES("big",    ST_GeomFromText('POLYGON (( 0 0, 0 3, 3 3, 3 0, 0 0))'));
INSERT INTO t1 VALUES("up",     ST_GeomFromText('POLYGON (( 0 1, 0 3, 2 3, 2 1, 0 1))'));
INSERT INTO t1 VALUES("up2",    ST_GeomFromText('POLYGON (( 0 2, 0 4, 2 4, 2 2, 0 2))'));
INSERT INTO t1 VALUES("up3",    ST_GeomFromText('POLYGON (( 0 3, 0 5, 2 5, 2 3, 0 3))'));
INSERT INTO t1 VALUES("down",   ST_GeomFromText('POLYGON (( 0 -1, 0  1, 2  1, 2 -1, 0 -1))'));
INSERT INTO t1 VALUES("down2",  ST_GeomFromText('POLYGON (( 0 -2, 0  0, 2  0, 2 -2, 0 -2))'));
INSERT INTO t1 VALUES("down3",  ST_GeomFromText('POLYGON (( 0 -3, 0 -1, 2 -1, 2 -3, 0 -3))'));
INSERT INTO t1 VALUES("right",  ST_GeomFromText('POLYGON (( 1 0, 1 2, 3 2, 3 0, 1 0))'));
INSERT INTO t1 VALUES("right2", ST_GeomFromText('POLYGON (( 2 0, 2 2, 4 2, 4 0, 2 0))'));
INSERT INTO t1 VALUES("right3", ST_GeomFromText('POLYGON (( 3 0, 3 2, 5 2, 5 0, 3 0))'));
INSERT INTO t1 VALUES("left",   ST_GeomFromText('POLYGON (( -1 0, -1 2,  1 2,  1 0, -1 0))'));
INSERT INTO t1 VALUES("left2",  ST_GeomFromText('POLYGON (( -2 0, -2 2,  0 2,  0 0, -2 0))'));
INSERT INTO t1 VALUES("left3",  ST_GeomFromText('POLYGON (( -3 0, -3 2, -1 2, -1 0, -3 0))'));
SELECT GROUP_CONCAT(a2.name ORDER BY a2.name) AS mbrcontains  FROM t1 a1 JOIN t1 a2 ON MBRContains(   a1.square, a2.square) WHERE a1.name = "center" GROUP BY a1.name;
SELECT GROUP_CONCAT(a2.name ORDER BY a2.name) AS mbrdisjoint  FROM t1 a1 JOIN t1 a2 ON MBRDisjoint(   a1.square, a2.square) WHERE a1.name = "center" GROUP BY a1.name;
SELECT GROUP_CONCAT(a2.name ORDER BY a2.name) AS mbrequals     FROM t1 a1 JOIN t1 a2 ON MBREquals(      a1.square, a2.square) WHERE a1.name = "center" GROUP BY a1.name;
SELECT GROUP_CONCAT(a2.name ORDER BY a2.name) AS mbrintersect FROM t1 a1 JOIN t1 a2 ON MBRIntersects( a1.square, a2.square) WHERE a1.name = "center" GROUP BY a1.name;
SELECT GROUP_CONCAT(a2.name ORDER BY a2.name) AS mbroverlaps  FROM t1 a1 JOIN t1 a2 ON MBROverlaps(   a1.square, a2.square) WHERE a1.name = "center" GROUP BY a1.name;
SELECT GROUP_CONCAT(a2.name ORDER BY a2.name) AS mbrtouches   FROM t1 a1 JOIN t1 a2 ON MBRTouches(    a1.square, a2.square) WHERE a1.name = "center" GROUP BY a1.name;
SELECT GROUP_CONCAT(a2.name ORDER BY a2.name) AS mbrwithin    FROM t1 a1 JOIN t1 a2 ON MBRWithin(     a1.square, a2.square) WHERE a1.name = "center" GROUP BY a1.name;
SELECT GROUP_CONCAT(a2.name ORDER BY a2.name) AS MBRcontains     FROM t1 a1 JOIN t1 a2 ON MBRContains(      a1.square, a2.square) WHERE a1.name = "center" GROUP BY a1.name;
SELECT GROUP_CONCAT(a2.name ORDER BY a2.name) AS MBRdisjoint     FROM t1 a1 JOIN t1 a2 ON MBRDisjoint(      a1.square, a2.square) WHERE a1.name = "center" GROUP BY a1.name;
SELECT GROUP_CONCAT(a2.name ORDER BY a2.name) AS MBRequals       FROM t1 a1 JOIN t1 a2 ON MBREquals(        a1.square, a2.square) WHERE a1.name = "center" GROUP BY a1.name;
SELECT GROUP_CONCAT(a2.name ORDER BY a2.name) AS `intersect`    FROM t1 a1 JOIN t1 a2 ON MBRIntersects(    a1.square, a2.square) WHERE a1.name = "center" GROUP BY a1.name;
SELECT GROUP_CONCAT(a2.name ORDER BY a2.name) AS MBRoverlaps     FROM t1 a1 JOIN t1 a2 ON MBROverlaps(      a1.square, a2.square) WHERE a1.name = "center" GROUP BY a1.name;
SELECT GROUP_CONCAT(a2.name ORDER BY a2.name) AS ST_touches      FROM t1 a1 JOIN t1 a2 ON ST_Touches(       a1.square, a2.square) WHERE a1.name = "center" GROUP BY a1.name;
SELECT GROUP_CONCAT(a2.name ORDER BY a2.name) AS MBRwithin       FROM t1 a1 JOIN t1 a2 ON MBRWithin(        a1.square, a2.square) WHERE a1.name = "center" GROUP BY a1.name;
SELECT GROUP_CONCAT(a1.name ORDER BY a1.name) AS MBRoverlaps FROM t1 a1 WHERE MBROverlaps(a1.square, @vert1) GROUP BY a1.name;
SELECT GROUP_CONCAT(a1.name ORDER BY a1.name) AS MBRoverlaps FROM t1 a1 WHERE MBROverlaps(a1.square, @horiz1) GROUP BY a1.name;
SELECT MBROverlaps(@horiz1, @vert1) FROM DUAL;
SELECT MBROverlaps(@horiz1, @horiz2) FROM DUAL;
SELECT MBROverlaps(@horiz1, @horiz3) FROM DUAL;
SELECT MBROverlaps(@horiz1, @point1) FROM DUAL;
SELECT MBROverlaps(@horiz1, @point2) FROM DUAL;
DROP TABLE t1;
create table t1(f1 geometry, f2 point, f3 linestring);
select f1 from t1 union select f1 from t1;
insert into t1 (f2,f3) values (ST_GeomFromText('POINT(1 1)'),
  ST_GeomFromText('LINESTRING(0 0,1 1,2 2)'));
select ST_AsText(f2),ST_AsText(f3) from t1;
select ST_AsText(a) from (select f2 as a from t1 union select f3 from t1) t;
create table t2 as select f2 as a from t1 union select f3 from t1;
select ST_AsText(a) from t2;
drop table t1, t2;
SELECT ST_AsText(ST_GeometryFromText(CONCAT(
  'MULTIPOLYGON(((',
  REPEAT ('-0.00000000001234567890123456789012 -0.123456789012345678,', 1000),
  '-0.00000000001234567890123456789012 -0.123456789012345678',
  ')))'
))) AS a;
SELECT 1;
create table `t1` (`col002` point)engine=myisam;
insert into t1 values (),(),();
drop table t1;
CREATE TABLE t1(a INT, b MULTIPOLYGON);
INSERT INTO t1 VALUES 
  (0,
   ST_GEOMFROMTEXT(
    'multipolygon(((1 2,3 4,5 6,7 8,9 8, 1 2),(7 6,5 4,3 2,1 2,3 4, 7 6)))'));
SELECT 1 FROM t1 WHERE a <> (SELECT ST_GEOMETRYCOLLECTIONFROMWKB(St_AsWKB(b)) FROM t1);
DROP TABLE t1;
CREATE TABLE t2(col1 MULTIPOLYGON NOT NULL);
DROP TABLE t2;
create table t1 (f1 tinyint(1), f2 char(1), f3 varchar(1), f4 geometry, f5 datetime);
create view v1 as select * from t1;
drop view v1;
drop table t1;
create table t1(a polygon NOT NULL)engine=myisam;
select * from (select polygon(t1.a) as p from t1 order by t1.a) d;
drop table t1;
create table t1(a char(32) not null) engine=myisam;
drop table t1;
CREATE TABLE t0 (a BINARY(32) NOT NULL);
INSERT INTO t0 VALUES (1);
CREATE TABLE t1 (
  col0 BINARY NOT NULL,
  col2 TIMESTAMP
) ENGINE=MyISAM;
CREATE TABLE t2 (
  col0 INTEGER NOT NULL,
  col1 POINT,
  col2 POINT
);
DROP TABLE t0, t1, t2;
CREATE TABLE g1
(a geometry NOT NULL) engine=myisam;
INSERT INTO g1 VALUES (ST_geomfromtext('point(1 1)'));
INSERT INTO g1 VALUES (ST_geomfromtext('point(1 2)'));
SELECT 1 FROM g1 WHERE a = date_sub(now(), interval 2808.4 year_month);
DROP TABLE g1;
CREATE TABLE g1(a TEXT NOT NULL, KEY(a(255))) charset latin1;
INSERT INTO g1 VALUES ('a'),('a');
DROP TABLE g1;
DROP DATABASE IF EXISTS gis_ogs;
CREATE DATABASE gis_ogs;
CREATE TABLE lakes ( 
  fid INTEGER NOT NULL PRIMARY KEY, 
  name CHARACTER VARYING(64), 
  shore POLYGON);
CREATE TABLE road_segments ( 
  fid INTEGER NOT NULL PRIMARY KEY, 
  name CHARACTER VARYING(64), 
  aliases CHARACTER VARYING(64), 
  num_lanes INTEGER, 
  centerline LINESTRING);
CREATE TABLE divided_routes ( 
  fid INTEGER NOT NULL PRIMARY KEY, 
  name CHARACTER VARYING(64), 
  num_lanes INTEGER, 
  centerlines MULTILINESTRING);
CREATE TABLE forests ( 
  fid INTEGER NOT NULL PRIMARY KEY, 
  name CHARACTER VARYING(64), 
  boundary MULTIPOLYGON);
CREATE TABLE bridges ( 
  fid INTEGER NOT NULL PRIMARY KEY, 
  name CHARACTER VARYING(64), 
  position POINT);
CREATE TABLE streams ( 
  fid INTEGER NOT NULL PRIMARY KEY, 
  name CHARACTER VARYING(64), 
  centerline LINESTRING);
CREATE TABLE buildings ( 
  fid INTEGER NOT NULL PRIMARY KEY, 
  address CHARACTER VARYING(64), 
  position POINT, 
  footprint POLYGON);
CREATE TABLE ponds ( 
  fid INTEGER NOT NULL PRIMARY KEY, 
  name CHARACTER VARYING(64), 
  type CHARACTER VARYING(64), 
  shores MULTIPOLYGON);
CREATE TABLE named_places ( 
  fid INTEGER NOT NULL PRIMARY KEY, 
  name CHARACTER VARYING(64), 
  boundary POLYGON);
CREATE TABLE map_neatlines ( 
  fid INTEGER NOT NULL PRIMARY KEY, 
  neatline POLYGON);
INSERT INTO lakes VALUES ( 
101, 'BLUE LAKE', 
ST_PolyFromText( 
'POLYGON( 
(52 18,66 23,73 9,48 6,52 18), 
(59 18,67 18,67 13,59 13,59 18) 
)', 
0));
INSERT INTO road_segments VALUES(102, 'Route 5', NULL, 2, 
ST_LineFromText( 
'LINESTRING( 0 18, 10 21, 16 23, 28 26, 44 31 )' ,0));
INSERT INTO road_segments VALUES(103, 'Route 5', 'Main Street', 4, 
ST_LineFromText( 
'LINESTRING( 44 31, 56 34, 70 38 )' ,0));
INSERT INTO road_segments VALUES(104, 'Route 5', NULL, 2, 
ST_LineFromText( 
'LINESTRING( 70 38, 72 48 )' ,0));
INSERT INTO road_segments VALUES(105, 'Main Street', NULL, 4, 
ST_LineFromText( 
'LINESTRING( 70 38, 84 42 )' ,0));
INSERT INTO road_segments VALUES(106, 'Dirt Road by Green Forest', NULL, 
1, 
ST_LineFromText( 
'LINESTRING( 28 26, 28 0 )',0));
INSERT INTO divided_routes VALUES(119, 'Route 75', 4, 
ST_MLineFromText( 
'MULTILINESTRING((10 48,10 21,10 0), 
(16 0,16 23,16 48))', 0));
INSERT INTO forests VALUES(109, 'Green Forest', 
ST_MPolyFromText( 
'MULTIPOLYGON(((28 26,28 0,84 0,84 42,28 26), 
(52 18,66 23,73 9,48 6,52 18)),((59 18,67 18,67 13,59 13,59 18)))', 
0));
INSERT INTO bridges VALUES(110, 'Cam Bridge', ST_PointFromText( 
'POINT( 44 31 )', 0));
INSERT INTO streams VALUES(111, 'Cam Stream', 
ST_LineFromText( 
'LINESTRING( 38 48, 44 41, 41 36, 44 31, 52 18 )', 0));
INSERT INTO streams VALUES(112, NULL, 
ST_LineFromText( 
'LINESTRING( 76 0, 78 4, 73 9 )', 0));
INSERT INTO buildings VALUES(113, '123 Main Street', 
ST_PointFromText( 
'POINT( 52 30 )', 0), 
ST_PolyFromText( 
'POLYGON( ( 50 31, 54 31, 54 29, 50 29, 50 31) )', 0));
INSERT INTO buildings VALUES(114, '215 Main Street', 
ST_PointFromText( 
'POINT( 64 33 )', 0), 
ST_PolyFromText( 
'POLYGON( ( 66 34, 62 34, 62 32, 66 32, 66 34) )', 0));
INSERT INTO ponds VALUES(120, NULL, 'Stock Pond', 
ST_MPolyFromText( 
'MULTIPOLYGON( ( ( 24 44, 22 42, 24 40, 24 44) ), 
( ( 26 44, 26 40, 28 42, 26 44) ) )', 0));
INSERT INTO named_places VALUES(117, 'Ashton', 
ST_PolyFromText( 
'POLYGON( ( 62 48, 84 48, 84 30, 56 30, 56 34, 62 48) )', 0));
INSERT INTO named_places VALUES(118, 'Goose Island', 
ST_PolyFromText( 
'POLYGON( ( 67 13, 67 18, 59 18, 59 13, 67 13) )', 0));
INSERT INTO map_neatlines VALUES(115, 
ST_PolyFromText( 
'POLYGON( ( 0 0, 0 48, 84 48, 84 0, 0 0 ) )', 0));
SELECT ST_Dimension(shore) 
FROM lakes 
WHERE name = 'Blue Lake';
SELECT ST_GeometryType(centerlines) 
FROM divided_routes
WHERE name = 'Route 75';
SELECT ST_AsText(boundary) 
FROM named_places 
WHERE name = 'Goose Island';
SELECT ST_AsText(ST_PolyFromWKB(ST_AsBinary(boundary),0)) 
FROM named_places 
WHERE name = 'Goose Island';
SELECT ST_SRID(boundary) 
FROM named_places 
WHERE name = 'Goose Island';
SELECT ST_IsEmpty(centerline) 
FROM road_segments 
WHERE name = 'Route 5' 
AND aliases = 'Main Street';
SELECT ST_AsText(ST_Envelope(boundary)) 
FROM named_places 
WHERE name = 'Goose Island';
SELECT ST_X(position) 
FROM bridges 
WHERE name = 'Cam Bridge';
SELECT ST_Y(position) 
FROM bridges 
WHERE name = 'Cam Bridge';
SELECT ST_AsText(ST_StartPoint(centerline)) 
FROM road_segments 
WHERE fid = 102;
SELECT ST_AsText(ST_EndPoint(centerline)) 
FROM road_segments 
WHERE fid = 102;
SELECT ST_Length(centerline) 
FROM road_segments 
WHERE fid = 106;
SELECT ST_NumPoints(centerline) 
FROM road_segments 
WHERE fid = 102;
SELECT ST_AsText(ST_PointN(centerline, 1)) 
FROM road_segments 
WHERE fid = 102;
SELECT ST_AsText(ST_Centroid(boundary)) 
FROM named_places 
WHERE name = 'Goose Island';
SELECT ST_Area(boundary) 
FROM named_places 
WHERE name = 'Goose Island';
SELECT ST_AsText(ST_ExteriorRing(shore)) 
FROM lakes 
WHERE name = 'Blue Lake';
SELECT ST_NumInteriorRings(shore) 
FROM lakes 
WHERE name = 'Blue Lake';
SELECT ST_AsText(ST_InteriorRingN(shore, 1)) 
FROM lakes 
WHERE name = 'Blue Lake';
SELECT ST_NumGeometries(centerlines) 
FROM divided_routes 
WHERE name = 'Route 75';
SELECT ST_AsText(ST_GeometryN(centerlines, 2)) 
FROM divided_routes 
WHERE name = 'Route 75';
SELECT ST_IsClosed(centerlines) 
FROM divided_routes 
WHERE name = 'Route 75';
SELECT ST_Length(centerlines) 
FROM divided_routes 
WHERE name = 'Route 75';
SELECT ST_AsText(ST_Centroid(shores)) 
FROM ponds 
WHERE fid = 120;
SELECT ST_Area(shores) 
FROM ponds 
WHERE fid = 120;
SELECT ST_Equals(boundary,
ST_PolyFromText('POLYGON( ( 67 13, 67 18, 59 18, 59 13, 67 13) )',0))
FROM named_places
WHERE name = 'Goose Island';
SELECT ST_Disjoint(centerlines, boundary) 
FROM divided_routes, named_places 
WHERE divided_routes.name = 'Route 75' 
AND named_places.name = 'Ashton';
SELECT ST_Touches(centerline, shore) 
FROM streams, lakes 
WHERE streams.name = 'Cam Stream' 
AND lakes.name = 'Blue Lake';
SELECT ST_Crosses(road_segments.centerline, divided_routes.centerlines)
FROM road_segments, divided_routes 
WHERE road_segments.fid = 102 
AND divided_routes.name = 'Route 75';
SELECT ST_Intersects(road_segments.centerline, divided_routes.centerlines) 
FROM road_segments, divided_routes 
WHERE road_segments.fid = 102 
AND divided_routes.name = 'Route 75';
SELECT ST_Contains(forests.boundary, named_places.boundary) 
FROM forests, named_places 
WHERE forests.name = 'Green Forest' 
AND named_places.name = 'Ashton';
SELECT ST_Distance(position, boundary) 
FROM bridges, named_places 
WHERE bridges.name = 'Cam Bridge' 
AND named_places.name = 'Ashton';
SELECT ST_AsText(ST_Difference(named_places.boundary, forests.boundary)) 
FROM named_places, forests 
WHERE named_places.name = 'Ashton' 
AND forests.name = 'Green Forest';
SELECT ST_AsText(ST_Union(shore, boundary)) 
FROM lakes, named_places 
WHERE lakes.name = 'Blue Lake' 
AND named_places.name = 'Goose Island';
SELECT ST_AsText(ST_SymDifference(shore, boundary)) 
FROM lakes, named_places 
WHERE lakes.name = 'Blue Lake' 
AND named_places.name = 'Ashton';
SELECT count(*) 
FROM buildings, bridges 
WHERE ST_Contains(ST_Buffer(bridges.position, 15.0), buildings.footprint) = 1;
DROP DATABASE gis_ogs;
CREATE TABLE t1(a POINT NOT NULL SRID 0, SPATIAL KEY(a)) engine=myisam;
DROP TABLE t1;
SELECT HEX(Point(-1*0e0, -1*0e0));
CREATE TABLE t1 (pk INTEGER AUTO_INCREMENT PRIMARY KEY, g GEOMETRY);
INSERT INTO t1(g) VALUES (Point(0.0, 0.0));
INSERT INTO t1(g) VALUES (Point(-1*0e0, -1*0e0));
INSERT INTO t1(g) VALUES (ST_GeomFromText('POINT(-0 -0.0)'));
INSERT INTO t1(g) VALUES
  (UNHEX('00000000010100000000000000000000800000000000000080'));
SELECT pk, ST_AsText(g) AS wkt, HEX(g) AS hex FROM t1 ORDER BY pk;
INSERT INTO t1(g) SELECT ST_GeomFromText(ST_AsText(g)) FROM t1 ORDER BY pk;
SELECT pk, ST_AsText(g) AS wkt, HEX(g) AS hex FROM t1 ORDER BY pk;
INSERT INTO t1(g) SELECT ST_GeomFromWKB(ST_AsBinary(g)) FROM t1 ORDER BY pk;
SELECT pk, ST_AsText(g) AS wkt, HEX(g) AS hex FROM t1 ORDER BY pk;
DROP TABLE t1;
CREATE TABLE t1(g GEOMETRY);
INSERT INTO t1 VALUES (Point(-1*0e0, -1*0e0)), (Point(0, 0));
SELECT ST_AsGeoJSON(g) AS GeoJSON, HEX(ST_AsBinary(g)) AS WKB FROM t1;
SELECT ST_AsGeoJSON(g, 30) AS GeoJSON, HEX(ST_AsBinary(g)) AS WKB FROM t1;
DROP TABLE t1;
SELECT HEX(ST_GeomFromGeoJSON('{"type":"Point","coordinates":[-0,-0.0]}')) AS g;
SELECT HEX(
  ST_GeomFromGeoJSON('{"type":"Point","coordinates":[-0.0,-0.0]}')) AS g;
CREATE TABLE t1(g GEOMETRY);
INSERT INTO t1 VALUES (ST_GeomFromWKB(
  UNHEX('000000000100000000000000000000000000000000')));
SELECT ST_AsText(g) FROM t1;
INSERT INTO t1 VALUES (POLYGON(LINESTRING(POINT(0,0),POINT(1,0),POINT(1,1), POINT(0,0))));
INSERT INTO t1 VALUES (UNHEX('00000000010700000000000000'));
SELECT ST_AsText(g) FROM t1;
DROP TABLE t1;
CREATE TABLE t1 (p POINT);
INSERT INTO t1 VALUES (POINT(0,0));
DROP TABLE t1;
CREATE TABLE t1 (l LINESTRING);
INSERT INTO t1 VALUES (LINESTRING(POINT(0,0),POINT(1,1)));
DROP TABLE t1;
CREATE TABLE t1 (p POLYGON);
INSERT INTO t1 VALUES (
  POLYGON(LINESTRING(POINT(0,0),POINT(1,0),POINT(1,1),POINT(0,1),POINT(0,0))));
DROP TABLE t1;
CREATE TABLE t1 (m MULTIPOINT);
INSERT INTO t1 VALUES (MULTIPOINT(POINT(0,0),POINT(1,1)));
DROP TABLE t1;
CREATE TABLE t1 (m MULTILINESTRING);
INSERT INTO t1 VALUES (MULTILINESTRING(LINESTRING(POINT(0,0),POINT(1,1))));
DROP TABLE t1;
CREATE TABLE t1 (m MULTIPOLYGON);
INSERT INTO t1 VALUES (MULTIPOLYGON(POLYGON(LINESTRING(POINT(0,0),POINT(1,0),
  POINT(1,1),POINT(0,1), POINT(0,0)))));
DROP TABLE t1;
CREATE TABLE t1 (g GEOMETRYCOLLECTION);
INSERT INTO t1 VALUES (MULTIPOINT(POINT(0,0),POINT(1,1)));
INSERT INTO t1 VALUES (MULTILINESTRING(LINESTRING(POINT(0,0),POINT(1,1))));
INSERT INTO t1 VALUES (MULTIPOLYGON(POLYGON(LINESTRING(POINT(0,0),POINT(1,0),
  POINT(1,1),POINT(0,1),POINT(0,0)))));
INSERT INTO t1 VALUES (GEOMETRYCOLLECTION(POINT(0,0)));
DROP TABLE t1;
CREATE TABLE t1 (g GEOMETRY);
INSERT INTO t1 VALUES(ST_GeomFromText('GEOMETRYCOLLECTION()'));
DROP TABLE t1;
CREATE TABLE t1 (
                   a INT NOT NULL,
                   p POINT NOT NULL SRID 0,
                   l LINESTRING NOT NULL SRID 0,
                   g GEOMETRY NOT NULL SRID 0,
                   SPATIAL KEY idx2 (p),
                   SPATIAL KEY idx3 (l),
                   SPATIAL KEY idx4 (g)
                ) ENGINE=InnoDB;
INSERT INTO t1 VALUES(
                      1, ST_GeomFromText('POINT(10 10)'),
                      ST_GeomFromText('LINESTRING(1 1, 5 5, 10 10)'),
                      ST_GeomFromText('POLYGON((30 30, 40 40, 50 50, 30 50, 30 40, 30 30))'));
INSERT INTO t1 VALUES(
                      2, ST_GeomFromText('POINT(30 30)'),
                      ST_GeomFromText('LINESTRING(2 3, 7 8, 9 10, 15 16)'),
                      ST_GeomFromText('POLYGON((10 30, 30 40, 40 50, 40 30, 30 20, 10 30))'));
SELECT ST_AsText(p) FROM t1 WHERE ST_Within(p, @poly1);
SELECT ST_AsText(p) FROM t1 WHERE ST_Equals(p, ST_PointFromText('POINT(20 20)'));
DROP TABLE t1;
CREATE TABLE t1 (
                   a INT NOT NULL,
                   p POINT NOT NULL SRID 0,
                   l LINESTRING NOT NULL SRID 0,
                   g GEOMETRY NOT NULL SRID 0,
                   SPATIAL KEY idx2 (p),
                   SPATIAL KEY idx3 (l),
                   SPATIAL KEY idx4 (g)
                ) ENGINE=MyISAM;
INSERT INTO t1 VALUES(
                      1, ST_GeomFromText('POINT(10 10)'),
                      ST_GeomFromText('LINESTRING(1 1, 5 5, 10 10)'),
                      ST_GeomFromText('POLYGON((30 30, 40 40, 50 50, 30 50, 30 40, 30 30))'));
INSERT INTO t1 VALUES(
                      2, ST_GeomFromText('POINT(30 30)'),
                      ST_GeomFromText('LINESTRING(2 3, 7 8, 9 10, 15 16)'),
                      ST_GeomFromText('POLYGON((10 30, 30 40, 40 50, 40 30, 30 20, 10 30))'));
SELECT ST_AsText(p) FROM t1 WHERE ST_Within(p, @poly1);
SELECT ST_AsText(p) FROM t1 WHERE ST_Equals(p, ST_PointFromText('POINT(20 20)'));
DROP TABLE t1;
CREATE TABLE t1 (p POINT NOT NULL) ENGINE=InnoDB;
INSERT INTO t1 VALUES (ST_GEOMFROMTEXT('POINT(1 1)'));
SELECT ST_ASTEXT(p) FROM t1
WHERE MBRCOVEREDBY
(
  p,
  ST_GEOMFROMTEXT('POLYGON((1 1, 1 2, 2 2, 2 1, 1 1))')
);
DROP TABLE t1;
CREATE TABLE t1 (p POINT NOT NULL) ENGINE=MyISAM;
INSERT INTO t1 VALUES (ST_GEOMFROMTEXT('POINT(1 1)'));
SELECT ST_ASTEXT(p) FROM t1
WHERE MBRCOVEREDBY
(
  p,
  ST_GEOMFROMTEXT('POLYGON((1 1, 1 2, 2 2, 2 1, 1 1))')
);
DROP TABLE t1;
SELECT ST_NUMINTERIORRING(ST_GEOMFROMTEXT('POLYGON((0 0, 1 0, 1 1, 0 0))'));
SELECT ST_NUMINTERIORRING(
  ST_GEOMFROMTEXT(
    'POLYGON((0 0, 1 0, 1 1, 0 0),(0.1 0.1, 0.9 0.8, 0.9 0.1, 0.1 0.1))'
  )
);
SELECT ST_ASTEXT(ST_CONVEXHULL(ST_GEOMFROMTEXT('LINESTRING(0 0, 5 5)'))) as result;
CREATE VIEW v1 AS SELECT
ST_ASTEXT(ST_CONVEXHULL(ST_GEOMFROMTEXT('LINESTRING(0 0, 5 5)')));
CREATE VIEW v2 AS SELECT
ST_SRID(ST_CONVEXHULL(ST_GEOMFROMTEXT('LINESTRING(0 0, 5 5)')));
SELECT * FROM v1;
SELECT * FROM v2;
DROP VIEW v1;
DROP VIEW v2;
CREATE TABLE t1 (g GEOMETRY);
INSERT INTO t1 (g) VALUES (ST_GeomFromText("MULTIPOLYGON(((0 7,-3 -14,9 -11,0 7)))"));
SELECT ST_AsText(ST_Buffer(g, 2)), ST_AsText(ST_Buffer(g, 2)) FROM t1;
SELECT ST_AsText(ST_Buffer(g, 2)), ST_AsText(ST_Difference(g, g)) FROM t1;
DROP TABLE t1;
CREATE TABLE t1(id INT PRIMARY KEY AUTO_INCREMENT, g GEOMETRY NOT NULL SRID 0,
                SPATIAL INDEX(g));
INSERT INTO t1(g) VALUES
(ST_GEOMFROMTEXT('MULTIPOLYGON(((0 7,-3 -14,9 -11,0 7)))'));
CREATE TABLE t2 SELECT ST_ASTEXT(ST_BUFFER(g, 54706,
ST_BUFFER_STRATEGY('join_miter', 183))) AS result FROM t1 WHERE id = 1;
UPDATE t2 SET result = (SELECT ST_ASTEXT(ST_BUFFER(g, 54706,
ST_BUFFER_STRATEGY('join_miter', 183))) AS result FROM t1 WHERE id = 1) + 9999
WHERE result NOT IN
(SELECT ST_ASTEXT(ST_BUFFER(g, 54706, ST_BUFFER_STRATEGY('join_miter', 183)))
 AS result FROM t1 WHERE id = 1);
DROP TABLE t1;
DROP TABLE t2;
CREATE TABLE t1(id INT PRIMARY KEY AUTO_INCREMENT, g GEOMETRY);
INSERT INTO t1(g) VALUES
(ST_GEOMFROMTEXT('MULTIPOLYGON(((4 1,0 -18,6 -18,17 -18,19 8,4 1)))'));
INSERT INTO t1(g) VALUES (ST_GEOMFROMTEXT('LINESTRING(-10 20,0 -1)'));
CREATE TABLE t2 SELECT ST_ASTEXT(ST_DIFFERENCE(a.g, b.g)) AS result
FROM t1 AS a, t1 AS b WHERE a.id = 1 AND b.id = 2;
SELECT * FROM t2 WHERE result NOT IN
(SELECT ST_ASTEXT(ST_DIFFERENCE(a.g, b.g)) AS result
 FROM t1 AS a, t1 AS b WHERE a.id = 1 AND b.id = 2);
DROP TABLE t1;
DROP TABLE t2;
SELECT ST_ISVALID(ST_UNION(ST_GEOMFROMTEXT('POLYGON((0 6,-11 -6,6 0,0
6),(3 1,5 0,-2 0,3 1))'), ST_GEOMFROMTEXT('POLYGON((5 4,6 0,9 12,-7 -12,5
-19,5 4))')));
SELECT ST_ISVALID(ST_UNION(ST_GEOMFROMTEXT('POLYGON((0 0,10 10,20 0,0 0))'),
ST_GEOMFROMTEXT('POLYGON((10 5,20 7,10 10,30 10,20 0,20 5,10 5))')));
SELECT ST_ISVALID(ST_UNION(ST_GEOMFROMTEXT('POLYGON((0 0,0 40,40 40,40
0,0 0),(10 10,30 10,30 30,10 30,10 10))'), ST_GEOMFROMTEXT('POLYGON((5
15,5 30,30 15,5 15))')));
SELECT ST_ISVALID(ST_UNION(ST_GEOMFROMTEXT('MULTIPOLYGON(((0 0,0 40,40
40,40 0,0 0),(10 10,30 10,30 30,10 30,10 10)))'),
ST_GEOMFROMTEXT('MULTIPOLYGON(((10 10,10 20,20 10,10 10)),((20 10,30
20,30 10,20 10)),((10 20,10 30,20 20,10 20)),((20 20,30 30,30 20,20 20)))')));
SELECT ST_ISVALID(ST_UNION(ST_GEOMFROMTEXT('MULTIPOLYGON(((0 0,0 40,40
40,40 0,0 0),(10 10,30 10,30 30,10 30,10 10)))'),
ST_GEOMFROMTEXT('MULTIPOLYGON(((15 10,10 15,10 17,15 10)),((15 10,10
20,10 22,15 10)),((15 10,10 25,10 27,15 10)),((25 10,30 17,30 15,25
10)),((25 10,30 22,30 20,25 10)),((25 10,30 27,30 25,25 10)),((18
10,20 30,19 10,18 10)),((21 10,20 30,22 10,21 10)))')));
CREATE TABLE t(a BLOB NOT NULL, b DATE NOT NULL) ENGINE=Innodb;
SELECT NOT EXISTS
( SELECT 1 FROM t WHERE (SELECT a FROM t)
    IN (SELECT b FROM t)
    ) AS rescol FROM t;
SELECT NOT EXISTS
( SELECT 1 FROM t WHERE (SELECT ST_GeomFromWKB(a) FROM t)
    IN (SELECT b FROM t)
    ) AS rescol FROM t;
SELECT NOT EXISTS
( SELECT 1 FROM t WHERE (SELECT st_AsWKB(a) FROM t)
    IN (SELECT b FROM t)
    )AS rescol  FROM t;
SELECT ST_GeomFromText('POINT(0 0)') IN (SELECT b FROM t) AS result;
SELECT ST_AsWKB(ST_GeomFromText('POINT(0 0)')) IN (SELECT b FROM t) AS result;
INSERT INTO t VALUES(ST_GeomFromText('POINT(0 0)'), CURDATE());
SELECT ST_GeomFromText('POINT(0 0)') IN (SELECT b FROM t) AS result;
SELECT ST_AsWKB(ST_GeomFromText('POINT(0 0)')) IN (SELECT b FROM t) AS result;
DROP TABLE t;
CREATE TABLE t1(a BLOB NOT NULL, b INT NOT NULL) ENGINE=Innodb;
SELECT NOT EXISTS
( SELECT 1 FROM t1 WHERE (SELECT a FROM t1)
    IN (SELECT b FROM t1)
    ) AS rescol FROM t1;
SELECT NOT EXISTS
( SELECT 1 FROM t1 WHERE (SELECT ST_GeomFromWKB(a) FROM t1)
    IN (SELECT b FROM t1)
    ) AS rescol FROM t1;
SELECT NOT EXISTS
( SELECT 1 FROM t1 WHERE (SELECT st_AsWKB(a) FROM t1)
    IN (SELECT b FROM t1)
    )AS rescol  FROM t1;
SELECT ST_GeomFromText('POINT(0 0)') IN (SELECT b FROM t1) AS result;
SELECT ST_AsWKB(ST_GeomFromText('POINT(0 0)')) IN (SELECT b FROM t1) AS result;
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(0 0)'), 1);
SELECT ST_GeomFromText('POINT(0 0)') IN (SELECT b FROM t1) AS result;
SELECT ST_AsWKB(ST_GeomFromText('POINT(0 0)')) IN (SELECT b FROM t1) AS result;
SELECT ST_AsWKB(ST_GeomFromText('POINT(0 0)')) > (SELECT b FROM t1) AS result;
DROP TABLE t1;
CREATE TABLE t1 (
  i INT NOT NULL
) ENGINE=InnoDB;
ALTER TABLE t1 ADD COLUMN g GEOMETRY NOT NULL, ALGORITHM=INPLACE;
ALTER TABLE t1 ADD COLUMN g2 GEOMETRY NOT NULL, ALGORITHM=COPY;
ALTER TABLE t1 ADD COLUMN g3 GEOMETRY;
ALTER TABLE t1 MODIFY COLUMN g3 GEOMETRY NOT NULL;
ALTER TABLE t1 ADD COLUMN g4 GEOMETRY NOT NULL, ALGORITHM=DEFAULT;
ALTER TABLE t1 ADD COLUMN g5 GEOMETRY NOT NULL;
DROP TABLE t1;
CREATE TABLE t1 (
  i INT NOT NULL
) ENGINE=InnoDB;
INSERT INTO t1 VALUES (0);
ALTER TABLE t1 ADD COLUMN g GEOMETRY;
SELECT i, g FROM t1;
UPDATE t1 SET g=POINT(0,0) WHERE g IS NULL;
ALTER TABLE t1 MODIFY COLUMN g GEOMETRY NOT NULL;
SELECT i, ST_ASTEXT(g) FROM t1;
DROP TABLE t1;
CREATE TABLE t1 (
  i INT NOT NULL
) ENGINE=InnoDB;
ALTER TABLE t1 ADD COLUMN g INT;
ALTER TABLE t1 MODIFY COLUMN g GEOMETRY;
ALTER TABLE t1 MODIFY COLUMN g GEOMETRY NOT NULL;
DROP TABLE t1;
CREATE TABLE t1 (
  i INT NOT NULL
) ENGINE=InnoDB;
ALTER TABLE t1 ADD COLUMN g INT;
ALTER TABLE t1 ADD COLUMN g2 INT;
ALTER TABLE t1 MODIFY COLUMN g GEOMETRY NOT NULL;
ALTER TABLE t1 CHANGE COLUMN g h GEOMETRY NOT NULL;
ALTER TABLE t1 MODIFY COLUMN g2 GEOMETRY NOT NULL;
ALTER TABLE t1 CHANGE COLUMN g2 h2 GEOMETRY NOT NULL;
DROP TABLE t1;
CREATE TABLE t1 (
  i INT NOT NULL
) ENGINE=InnoDB;
INSERT INTO t1 VALUES (0);
ALTER TABLE t1 ADD COLUMN g INT;
SELECT i, g FROM t1;
ALTER TABLE t1 MODIFY COLUMN g GEOMETRY;
SELECT i, g FROM t1;
SELECT i, g FROM t1;
DROP TABLE t1;
CREATE TABLE t1 (
  i INT NOT NULL
) ENGINE=InnoDB;
INSERT INTO t1 VALUES (0);
ALTER TABLE t1 ADD COLUMN g INT;
SELECT i, g FROM t1;
SELECT i, g FROM t1;
DROP TABLE t1;
CREATE TABLE t1 (
  i INT NOT NULL
) ENGINE=InnoDB;
INSERT INTO t1 VALUES (0);
ALTER TABLE t1 ADD COLUMN g INT DEFAULT 1;
SELECT i, g FROM t1;
SELECT i, g FROM t1;
DROP TABLE t1;
CREATE TABLE t1 (
  i INT NOT NULL
) ENGINE=InnoDB;
INSERT INTO t1 VALUES (0);
ALTER TABLE t1 ADD COLUMN g INT DEFAULT 1;
SELECT * FROM t1;
DROP TABLE t1;
CREATE TABLE t1 (
  i INT NOT NULL
) ENGINE=InnoDB;
INSERT INTO t1 VALUES (0);
ALTER TABLE t1 ADD COLUMN g VARCHAR(20) NOT NULL;
SELECT i, g FROM t1;
SELECT i, g FROM t1;
DROP TABLE t1;
CREATE TABLE t1 (
  i INT NOT NULL
) ENGINE=InnoDB;
INSERT INTO t1 VALUES (0);
ALTER TABLE t1 ADD COLUMN g VARCHAR(20) NOT NULL;
SELECT i, g FROM t1;
SELECT i, g FROM t1;
DROP TABLE t1;
CREATE TABLE t1 (b BLOB);
INSERT INTO t1 VALUES(POINT(0,0));
ALTER TABLE t1 MODIFY COLUMN b BLOB;
ALTER TABLE t1 ALGORITHM=COPY, MODIFY COLUMN b GEOMETRY NOT NULL;
ALTER TABLE t1 MODIFY COLUMN b BLOB;
INSERT INTO t1 VALUES(NULL);
SELECT HEX(b) FROM t1;
DROP TABLE t1;
CREATE TABLE t1 (
  p1 POINT,
  p2 POINT,
  p3 POINT,
  p4 POINT
) ENGINE=InnoDB;
ALTER TABLE t1 MODIFY COLUMN p1 POLYGON;
ALTER TABLE t1 CHANGE COLUMN p2 q2 POLYGON;
ALTER TABLE t1 MODIFY COLUMN p3 POLYGON NOT NULL;
ALTER TABLE t1 CHANGE COLUMN p4 q4 POLYGON NOT NULL;
SELECT * FROM t1;
DROP TABLE t1;
CREATE TABLE t1 (
  p POINT
) ENGINE=InnoDB;
INSERT INTO t1 VALUES(POINT(0,0));
SELECT ST_AsText(p) FROM t1;
SELECT ST_AsText(p) FROM t1;
SELECT ST_AsText(p) FROM t1;
DROP TABLE t1;
CREATE TABLE t1 (
  mp MULTIPOINT NOT NULL
) ENGINE=InnoDB;
INSERT INTO t1 VALUES(MULTIPOINT(POINT(1,1)));
SELECT ST_AsText(mp) FROM t1;
ALTER TABLE t1 MODIFY COLUMN mp GEOMETRYCOLLECTION NOT NULL;
ALTER TABLE t1 MODIFY COLUMN mp GEOMETRY NOT NULL;
ALTER TABLE t1 MODIFY COLUMN mp GEOMETRYCOLLECTION NOT NULL;
ALTER TABLE t1 MODIFY COLUMN mp MULTIPOINT NOT NULL;
SELECT ST_AsText(mp) FROM t1;
DROP TABLE t1;
CREATE TABLE t1 (g GEOMETRY) ENGINE=InnoDB;
ALTER TABLE t1 MODIFY COLUMN g GEOMETRY NOT NULL;
DROP TABLE t1;
CREATE TABLE t1 (g GEOMETRY) ENGINE=MyISAM;
ALTER TABLE t1 MODIFY COLUMN g GEOMETRY NOT NULL;
DROP TABLE t1;
CREATE TABLE t1 (g GEOMETRY) ENGINE=InnoDB;
INSERT INTO t1 VALUES (POINT(0,0));
ALTER TABLE t1 MODIFY COLUMN g GEOMETRY NOT NULL;
SELECT ST_ASTEXT(g) FROM t1;
DROP TABLE t1;
CREATE TABLE t1 (g GEOMETRY) ENGINE=MyISAM;
INSERT INTO t1 VALUES (POINT(0,0));
ALTER TABLE t1 MODIFY COLUMN g GEOMETRY NOT NULL;
SELECT ST_ASTEXT(g) FROM t1;
DROP TABLE t1;
CREATE TABLE t1 (g GEOMETRY) ENGINE=InnoDB;
INSERT INTO t1 VALUES (NULL);
DROP TABLE t1;
CREATE TABLE t1 (g GEOMETRY) ENGINE=MyISAM;
INSERT INTO t1 VALUES (NULL);
SELECT g FROM t1;
SELECT g FROM t1;
DROP TABLE t1;
SELECT ST_ISVALID(ST_UNION(ST_GEOMFROMTEXT('LINESTRING(12 6,9 4,-9
1,-4 -6,12 -9,-9 -17,17 -11,-16 17,19 -19,0 -16,6 -5,15 3,14 -5,18 13,-9
10,-11 8)'), ST_GEOMFROMTEXT('GEOMETRYCOLLECTION(MULTILINESTRING((-18 2,1
7),(-19 -3,-16 -12),(10 0,3 8,12 19,8 -15)),MULTILINESTRING((8 16,-8 -3),(18
3,8 12),(-19 4,20 14)),POLYGON((2 3,-9 -7,12 -13,2 3)),MULTILINESTRING((16
-7,-2 2,11 -10,-1 8),(6 0,-15 0,16 0,-6 -14)))')));
SELECT ST_ISVALID(
  ST_UNION(
    ST_GEOMFROMTEXT('
      LINESTRING(-9 -17,17 -11)
    '),
    ST_GEOMFROMTEXT('
      GEOMETRYCOLLECTION(
        LINESTRING(8 16,-8 -3),
        POLYGON((2 3,-9 -7,12 -13,2 3)),
        MULTILINESTRING((-2 2,11 -10),(6 0,-15 0,16 0))
      )
    ')
  )
) AS valid;
SELECT ST_ISVALID(
ST_DIFFERENCE(
ST_GEOMFROMTEXT('MULTILINESTRING((8 16,-8 -3),(-2 2,-0.561069
0.671756),(8.93182 -8.09091,11 -10),(6 0,3.875 0),(-1.3 0,-15 0,-1.3
0),(3.875 0,16 0))'),
ST_GEOMFROMTEXT('POLYGON((2 3,-9 -7,12 -13,2 3))'))) as valid0;
SELECT ST_ISVALID(ST_INTERSECTION(ST_GEOMFROMTEXT('POLYGON((0 5,-6
-17,12 17,0 5),(4 6,5 5,0 1,4 6))'), ST_GEOMFROMTEXT('POLYGON((3 9,-15 -5,13
-11,3 9))')));
SELECT ST_ISVALID(ST_INTERSECTION(ST_GEOMFROMTEXT('POLYGON((5 6,-15
-13,1 -8,5 6))'), ST_GEOMFROMTEXT('POLYGON((0 8,-19 6,18 -17,20 8,11 17,0
8),(3 2,3 -1,1 0,3 2),(1 3,4 4,0 -1,1 3))')));
SELECT point(1,1) IN ('1',1,'1') AS res;
SELECT st_centroid(point(1,1)) IN ('1',1,'1') AS res;
SELECT ST_AsText(ST_GeomFromText('POINT(0 0)', NULL));
SELECT ST_SRID(ST_GeomFromText('POINT(0 0)', NULL));
SELECT ST_ISVALID(ST_BUFFER(ST_GEOMFROMTEXT('MULTILINESTRING((-5 15,7
15,19 -10,-11 -2),(2 13,2 -9))'), 1));
CREATE TABLE t1 (g GEOMETRY);
INSERT INTO t1 VALUES (ST_GeomFromText('LINESTRING(-3 11,-10 15,-16 -13)'));
CREATE TABLE t2 (g GEOMETRY);
INSERT INTO t2 VALUES
(ST_GeomFromText('POINT(-10 15)')),
(ST_GeomFromText('GEOMETRYCOLLECTION(LINESTRING(-13 9,0 -13))'));
CREATE PROCEDURE proc () LANGUAGE SQL
SELECT 1 AS result
FROM (t1 RIGHT OUTER JOIN t2 ON ST_CONTAINS(t2.g, t1.g))
WHERE t1.g NOT IN (SELECT g FROM t2);
DROP PROCEDURE proc;
DROP TABLE t1, t2;
SELECT ST_ISVALID(ST_INTERSECTION(ST_GEOMFROMTEXT('POLYGON((6 7,18
14,-8 1,0 0,18 -8,6 7),(6 0,-4 3,5 3,6 0))'),
ST_GEOMFROMTEXT('MULTIPOLYGON(((2 3,-3 5,-10 -1,2 3)))')));
SELECT ST_ISVALID(ST_SYMDIFFERENCE(ST_GEOMFROMTEXT('POLYGON((6 7,18
14,-8 1,0 0,18 -8,6 7),(6 0,-4 3,5 3,6 0))'), ST_GEOMFROMTEXT('POLYGON((0
7,-5 6,11 -13,0 7))')));
SELECT ST_ISVALID(ST_UNION(ST_GEOMFROMTEXT('POLYGON((4 5,12 11,-12
-3,4 5))'), ST_GEOMFROMTEXT('MULTIPOLYGON(((5 4,-14 0,1 0,5 4)),((1 6,13 0,10
12,1 6)))')));
SELECT ST_ISVALID(ST_DIFFERENCE(ST_GEOMFROMTEXT('POLYGON((8 6,5 7,-1
4,-8 -7,0 -17,8 6),(3 6,5 5,0 -2,3 6))'), ST_GEOMFROMTEXT('POLYGON((3 5,-17
11,-8 -3,3 5))'))) AS result;
CREATE TABLE d (id INT, r_id INT, i INT);
INSERT INTO d VALUES (1, 1, 1);
CREATE TABLE dp (id INT, d_id INT);
INSERT INTO dp VALUES (1, 1);
CREATE TABLE r (id INT, p POINT);
INSERT INTO r VALUES (1, ST_GEOMFROMTEXT('POINT(1 1)'));
DROP TABLE d, dp, r;
SELECT '2010-10-10 10:10:10' + INTERVAL
  ST_GeometryType(ST_GeomFromText('POINT(1 1)')) HOUR_SECOND;
SELECT ST_SRID(ST_GEOMCOLLFROMTEXT(@wkt_gc, -1));
SELECT ST_SRID(ST_GEOMCOLLFROMTXT(@wkt_gc, -1));
SELECT ST_SRID(ST_GEOMETRYCOLLECTIONFROMTEXT(@wkt_gc, -1));
SELECT ST_SRID(ST_GEOMETRYFROMTEXT(@wkt_pt, -1));
SELECT ST_SRID(ST_GEOMFROMTEXT(@wkt_pt, -1));
SELECT ST_SRID(ST_LINEFROMTEXT(@wkt_ls, -1));
SELECT ST_SRID(ST_LINESTRINGFROMTEXT(@wkt_ls, -1));
SELECT ST_SRID(ST_MLINEFROMTEXT(@wkt_mls, -1));
SELECT ST_SRID(ST_MPOINTFROMTEXT(@wkt_mpt, -1));
SELECT ST_SRID(ST_MPOLYFROMTEXT(@wkt_mpy, -1));
SELECT ST_SRID(ST_MULTILINESTRINGFROMTEXT(@wkt_mls, -1));
SELECT ST_SRID(ST_MULTIPOINTFROMTEXT(@wkt_mpt, -1));
SELECT ST_SRID(ST_MULTIPOLYGONFROMTEXT(@wkt_mpy, -1));
SELECT ST_SRID(ST_POINTFROMTEXT(@wkt_pt, -1));
SELECT ST_SRID(ST_POLYFROMTEXT(@wkt_py, -1));
SELECT ST_SRID(ST_POLYGONFROMTEXT(@wkt_py, -1));
SELECT ST_SRID(ST_GEOMCOLLFROMTEXT(@wkt_gc, 0));
SELECT ST_SRID(ST_GEOMCOLLFROMTXT(@wkt_gc, 0));
SELECT ST_SRID(ST_GEOMETRYCOLLECTIONFROMTEXT(@wkt_gc, 0));
SELECT ST_SRID(ST_GEOMETRYFROMTEXT(@wkt_pt, 0));
SELECT ST_SRID(ST_GEOMFROMTEXT(@wkt_pt, 0));
SELECT ST_SRID(ST_LINEFROMTEXT(@wkt_ls, 0));
SELECT ST_SRID(ST_LINESTRINGFROMTEXT(@wkt_ls, 0));
SELECT ST_SRID(ST_MLINEFROMTEXT(@wkt_mls, 0));
SELECT ST_SRID(ST_MPOINTFROMTEXT(@wkt_mpt, 0));
SELECT ST_SRID(ST_MPOLYFROMTEXT(@wkt_mpy, 0));
SELECT ST_SRID(ST_MULTILINESTRINGFROMTEXT(@wkt_mls, 0));
SELECT ST_SRID(ST_MULTIPOINTFROMTEXT(@wkt_mpt, 0));
SELECT ST_SRID(ST_MULTIPOLYGONFROMTEXT(@wkt_mpy, 0));
SELECT ST_SRID(ST_POINTFROMTEXT(@wkt_pt, 0));
SELECT ST_SRID(ST_POLYFROMTEXT(@wkt_py, 0));
SELECT ST_SRID(ST_POLYGONFROMTEXT(@wkt_py, 0));
SELECT ST_SRID(ST_GEOMCOLLFROMTEXT(@wkt_gc, 4294967296));
SELECT ST_SRID(ST_GEOMCOLLFROMTXT(@wkt_gc, 4294967296));
SELECT ST_SRID(ST_GEOMETRYCOLLECTIONFROMTEXT(@wkt_gc, 4294967296));
SELECT ST_SRID(ST_GEOMETRYFROMTEXT(@wkt_pt, 4294967296));
SELECT ST_SRID(ST_GEOMFROMTEXT(@wkt_pt, 4294967296));
SELECT ST_SRID(ST_LINEFROMTEXT(@wkt_ls, 4294967296));
SELECT ST_SRID(ST_LINESTRINGFROMTEXT(@wkt_ls, 4294967296));
SELECT ST_SRID(ST_MLINEFROMTEXT(@wkt_mls, 4294967296));
SELECT ST_SRID(ST_MPOINTFROMTEXT(@wkt_mpt, 4294967296));
SELECT ST_SRID(ST_MPOLYFROMTEXT(@wkt_mpy, 4294967296));
SELECT ST_SRID(ST_MULTILINESTRINGFROMTEXT(@wkt_mls, 4294967296));
SELECT ST_SRID(ST_MULTIPOINTFROMTEXT(@wkt_mpt, 4294967296));
SELECT ST_SRID(ST_MULTIPOLYGONFROMTEXT(@wkt_mpy, 4294967296));
SELECT ST_SRID(ST_POINTFROMTEXT(@wkt_pt, 4294967296));
SELECT ST_SRID(ST_POLYFROMTEXT(@wkt_py, 4294967296));
SELECT ST_SRID(ST_POLYGONFROMTEXT(@wkt_py, 4294967296));
CREATE TABLE t1 (a DECIMAL(54,20));
INSERT INTO t1 VALUES (0);
DROP TABLE t1;
CREATE TABLE t1(g GEOMETRY NOT NULL) ENGINE=ARCHIVE;
ALTER TABLE t1 FORCE;
DROP TABLE t1;
CREATE TABLE t1(g GEOMETRY NOT NULL) ENGINE=ARCHIVE;
ALTER TABLE t1 FORCE;
DROP TABLE t1;
CREATE TABLE t(a INT);
INSERT INTO t VALUES(1),(2),(3),(4);
DROP TABLE t;
CREATE TABLE t1 (
  g POLYGON SRID 4326 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE SPATIAL INDEX g_idx ON t1(g);
INSERT INTO t1 VALUES (
  ST_GeomFromText(
    'POLYGON((-165 -46,161 -70,-108 72,-165 -46))',
    4326,
    'axis-order=long-lat'
  )
);
SELECT COUNT(*)
FROM t1 IGNORE INDEX (g_idx)
WHERE MBRContains(
  ST_GeomFromText(
    'LINESTRING(-111 -85,-136 -53,116 -20,-80 47,111 0)',
    4326,
    'axis-order=long-lat'
  ),
  g
);
SELECT COUNT(*)
FROM t1 FORCE INDEX (g_idx)
WHERE MBRContains(
  ST_GeomFromText(
    'LINESTRING(-111 -85,-136 -53,116 -20,-80 47,111 0)',
    4326,
    'axis-order=long-lat'),
  g
);
DROP TABLE t1;
CREATE TABLE t1 (
  g POLYGON SRID 4326 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
ALTER TABLE t1 ADD SPATIAL INDEX g_idx (g);
INSERT INTO t1 VALUES (
  ST_GeomFromText(
    'POLYGON((-165 -46,161 -70,-108 72,-165 -46))',
    4326,
    'axis-order=long-lat'
  )
);
SELECT COUNT(*)
FROM t1 IGNORE INDEX (g_idx)
WHERE MBRContains(
  ST_GeomFromText(
    'LINESTRING(-111 -85,-136 -53,116 -20,-80 47,111 0)',
    4326,
    'axis-order=long-lat'
  ),
  g
);
SELECT COUNT(*)
FROM t1 FORCE INDEX (g_idx)
WHERE MBRContains(
  ST_GeomFromText(
    'LINESTRING(-111 -85,-136 -53,116 -20,-80 47,111 0)',
    4326,
    'axis-order=long-lat'),
  g
);
DROP TABLE t1;
CREATE TABLE t1 (
  g POLYGON SRID 4326 NOT NULL,
  SPATIAL INDEX g_idx (g)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO t1 VALUES (
  ST_GeomFromText(
    'POLYGON((-165 -46,161 -70,-108 72,-165 -46))',
    4326,
    'axis-order=long-lat'
  )
);
SELECT COUNT(*)
FROM t1 IGNORE INDEX (g_idx)
WHERE MBRContains(
  ST_GeomFromText(
    'LINESTRING(-111 -85,-136 -53,116 -20,-80 47,111 0)',
    4326,
    'axis-order=long-lat'
  ),
  g
);
SELECT COUNT(*)
FROM t1 FORCE INDEX (g_idx)
WHERE MBRContains(
  ST_GeomFromText(
    'LINESTRING(-111 -85,-136 -53,116 -20,-80 47,111 0)',
    4326,
    'axis-order=long-lat'),
  g
);
DROP TABLE t1;
CREATE TABLE t1(g GEOMETRY NOT NULL);
UPDATE t1 SET g=NULL;
UPDATE IGNORE t1 SET g=NULL;
INSERT INTO t1 VALUES (POINT(0, 0));
DROP TABLE t1;
CREATE TABLE t1(g GEOMETRY NOT NULL);
DROP TABLE t1;
CREATE TABLE t1(x VARCHAR(10), g GEOMETRY NOT NULL);
DROP TABLE t1;
CREATE TABLE t1 (id INT, g GEOMETRY NOT NULL);
CREATE VIEW v1 AS SELECT * FROM t1;
DROP VIEW v1;
DROP TABLE t1;
CREATE TABLE t1 (g GEOMCOLLECTION);
INSERT INTO t1 VALUES (GEOMCOLLECTION(POINT(0, 0)));
SELECT TABLE_NAME, COLUMN_NAME, GEOMETRY_TYPE_NAME
FROM INFORMATION_SCHEMA.ST_GEOMETRY_COLUMNS;
DROP TABLE t1;
CREATE TABLE t1 (g GEOMETRYCOLLECTION);
INSERT INTO t1 VALUES (GEOMETRYCOLLECTION(POINT(0, 0)));
SELECT TABLE_NAME, COLUMN_NAME, GEOMETRY_TYPE_NAME
FROM INFORMATION_SCHEMA.ST_GEOMETRY_COLUMNS;
DROP TABLE t1;
SELECT ST_GEOMETRYTYPE(GEOMETRYCOLLECTION(POINT(0, 0)));
CREATE TABLE t1(c1 POINT);
INSERT INTO t1 VALUES (POINT(0,0));
CREATE TABLE t2(c1 LINESTRING);
INSERT INTO t2 VALUES (LINESTRING(POINT(0,0),POINT(1,1)));
CREATE TABLE t3 SELECT * FROM t1;
SELECT ST_AsText(c1) FROM t3;
DROP TABLE t1, t2, t3;
CREATE TABLE t1 (
  point_col POINT SRID 4326
, multipoint_col MULTIPOINT SRID 4326
, linestring_col LINESTRING SRID 4326
, multilinestring_col MULTILINESTRING SRID 4326
, polygon_col POLYGON SRID 4326
, multipolygon_col MULTIPOLYGON SRID 4326
, geometrycollection_col GEOMETRYCOLLECTION SRID 4326
, geometry_col GEOMETRY SRID 4326) ENGINE = InnoDB;
CREATE TABLE t2 LIKE t1;
INSERT INTO t1 VALUES (
  ST_GeomFromText('POINT(1 1)', 4326)
, ST_GeomFromText('MULTIPOINT((1 1))', 4326)
, ST_GeomFromText('LINESTRING(1 1, 2 2)', 4326)
, ST_GeomFromText('MULTILINESTRING((1 1, 2 2))', 4326)
, ST_GeomFromText('POLYGON((1 1, 1 2, 2 2, 2 1, 1 1))', 4326)
, ST_GeomFromText('MULTIPOLYGON(((1 1, 1 2, 2 2, 2 1, 1 1)))', 4326)
, ST_GeomFromText('GEOMETRYCOLLECTION(POINT(1 1), LINESTRING(3 3, 4 4))', 4326)
, ST_GeomFromText('POINT(1 1)', 4326));
INSERT INTO t2 (point_col) SELECT point_col FROM t1;
INSERT INTO t2 (geometry_col) SELECT point_col FROM t1;
INSERT INTO t2 (multipoint_col) SELECT multipoint_col FROM t1;
INSERT INTO t2 (geometrycollection_col) SELECT multipoint_col FROM t1;
INSERT INTO t2 (geometry_col) SELECT multipoint_col FROM t1;
INSERT INTO t2 (linestring_col) SELECT linestring_col FROM t1;
INSERT INTO t2 (geometry_col) SELECT linestring_col FROM t1;
INSERT INTO t2 (multilinestring_col) SELECT multilinestring_col FROM t1;
INSERT INTO t2 (geometrycollection_col) SELECT multilinestring_col FROM t1;
INSERT INTO t2 (geometry_col) SELECT multilinestring_col FROM t1;
INSERT INTO t2 (polygon_col) SELECT polygon_col FROM t1;
INSERT INTO t2 (geometry_col) SELECT polygon_col FROM t1;
INSERT INTO t2 (multipolygon_col) SELECT multipolygon_col FROM t1;
INSERT INTO t2 (geometrycollection_col) SELECT multipolygon_col FROM t1;
INSERT INTO t2 (geometry_col) SELECT multipolygon_col FROM t1;
INSERT INTO t2 (geometrycollection_col) SELECT geometrycollection_col FROM t1;
INSERT INTO t2 (geometry_col) SELECT geometrycollection_col FROM t1;
SELECT
  ST_AsText(point_col) AS point_col
, ST_AsText(multipoint_col) AS multipoint_col
, ST_AsText(linestring_col) AS linestring_col
, ST_AsText(multilinestring_col) AS multilinestring_col
, ST_AsText(polygon_col) AS polygon_col
, ST_AsText(multipolygon_col) AS multipolygon_col
, ST_AsText(geometrycollection_col) AS geometrycollection_col
, ST_AsText(geometry_col) AS geometry_col
FROM t2;
DROP TABLE t1, t2;
CREATE TABLE t(a INT PRIMARY KEY) ENGINE=INNODB
PARTITION BY KEY(a) PARTITIONS 10;
DROP TABLE t;
CREATE TABLE t (
  c1 VARCHAR(8) NOT NULL,
  c2 VARCHAR(16) NOT NULL,
  geom POINT NOT NULL SRID 0,
  PRIMARY KEY (c2,c1),
  SPATIAL KEY coord (geom)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb3;
INSERT INTO t VALUES (1, 2, POINT(1, 2));
DROP TABLE t;
CREATE TABLE t1 (geom POINT SRID 0 NOT NULL);
INSERT INTO t1 VALUES(ST_GeomFromText('POINT(0 0)', 0));
DROP TABLE t1;
