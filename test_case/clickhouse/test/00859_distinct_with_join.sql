select distinct a from fooL semi left join fooR using(a) order by a;
drop table fooL;
drop table fooR;
