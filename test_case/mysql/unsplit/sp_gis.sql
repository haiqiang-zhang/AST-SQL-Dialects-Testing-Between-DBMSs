drop function if exists a;
drop function if exists st_x;
drop function if exists st_y;
select st_x(ST_PointFromText("POINT(10 20)")), st_y(ST_PointFromText("POINT(10 20)"));