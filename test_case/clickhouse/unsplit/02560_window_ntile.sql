select a, b, ntile(3) over (partition by a order by b rows between unbounded preceding and unbounded following) from(select intDiv(number,10) as a, number%10 as b from numbers(20));
select a, b, ntile(3) over (partition by a order by b) from(select intDiv(number,10) as a, number%10 as b from numbers(20));
select a, b, ntile(2) over (partition by a order by b) from(select intDiv(number,10) as a, number%10 as b from numbers(20));
select a, b, ntile(1) over (partition by a order by b) from(select intDiv(number,10) as a, number%10 as b from numbers(20));
select a, b, ntile(100) over (partition by a order by b) from(select intDiv(number,10) as a, number%10 as b from numbers(20));
select a, b, ntile(65535) over (partition by a order by b) from (select 1 as a, number as b from numbers(65535)) limit 100;