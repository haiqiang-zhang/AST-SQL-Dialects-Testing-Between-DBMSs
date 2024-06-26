PRAGMA enable_verification;
create table a as select case when range%2==0 then interval '1 year' else interval '2 years' end j, range::integer AS i from range(1, 5, 1);
select j, i, sum(i) over () from a order by 1,2;
select j, i, sum(i) over (partition by j) from a order by 1,2;
select j, i, sum(i) over (partition by j order by i) from a order by 1,2;
