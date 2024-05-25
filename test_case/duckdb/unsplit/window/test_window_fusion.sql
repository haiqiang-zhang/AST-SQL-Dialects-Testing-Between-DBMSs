PRAGMA enable_verification;
create table lineitem (
    l_extendedprice decimal(15,2),
    l_partkey integer,
    l_orderkey integer
);
insert into lineitem (values 
	(29733.00, 1, 2883),
	(1802.00, 1, 5121),
	(4505.00, 1, 6179),
	(29733.00, 1, 6273),
	(30634.00, 1, 8645),
	(41446.00, 1, 12005),
	(36040.00, 1, 16135),
	(29733.00, 1, 16198),
	(26129.00, 1, 20199),
	(24327.00, 1, 22117),
	(19822.00, 1, 24866),
	(24327.00, 1, 26756),
	(9010.00, 1, 27558),
	(45050.00, 1, 29859),
	(2703.00, 1, 34692),
	(11713.00, 1, 36611),
	(18020.00, 1, 38051),
	(21624.00, 1, 42465),
	(36040.00, 1, 42758),
	(39644.00, 1, 47620),
	(28832.00, 1, 50498),
	(12614.00, 1, 51970),
	(2703.00, 1, 53189),
	(22525.00, 1, 53825),
	(21624.00, 1, 54592),
	(36941.00, 1, 59202),
	(18942.00, 2, 548),
	(17138.00, 2, 807),
	(24354.00, 2, 2117),
	(9020.00, 2, 2528),
	(28864.00, 2, 4102),
	(42394.00, 2, 4452),
	(11726.00, 2, 7458),
	(39688.00, 2, 27969),
	(37884.00, 2, 28900),
	(9922.00, 2, 30278),
	(12628.00, 2, 30597),
	(7216.00, 2, 33058),
	(41492.00, 2, 37026),
	(40590.00, 2, 37123),
	(36982.00, 2, 39809),
	(36080.00, 2, 41415),
	(18942.00, 2, 42147),
	(24354.00, 2, 42533),
	(41492.00, 2, 43650),
	(45100.00, 2, 44103),
	(17138.00, 2, 46913),
	(31570.00, 2, 50499),
	(37884.00, 2, 54086),
	(26158.00, 2, 54436),
	(4510.00, 2, 54436),
	(3608.00, 2, 54630),
	(41492.00, 2, 55136),
);
select 
	l_extendedprice, 
	l_partkey, 
	l_orderkey, 
	sum(l_extendedprice) over(), 
from lineitem 
order by l_partkey, l_orderkey;
select 
	l_extendedprice, 
	l_partkey, 
	l_orderkey, 
	sum(l_extendedprice) over(order by l_partkey), 
from lineitem 
order by l_partkey, l_orderkey;
select 
	l_extendedprice, 
	l_partkey, 
	l_orderkey, 
	sum(l_extendedprice) over(order by l_partkey, l_orderkey), 
from lineitem 
order by l_partkey, l_orderkey;
select 
	l_extendedprice, 
	l_partkey, 
	l_orderkey, 
	sum(l_extendedprice) over(order by l_partkey, l_orderkey desc), 
from lineitem 
order by l_partkey, l_orderkey;
select 
	l_extendedprice, 
	l_partkey, 
	l_orderkey, 
	sum(l_extendedprice) over(), 
	sum(l_extendedprice) over(order by l_partkey), 
	sum(l_extendedprice) over(order by l_partkey, l_orderkey), 
	sum(l_extendedprice) over(order by l_partkey, l_orderkey desc), 
from lineitem 
order by l_partkey, l_orderkey;
select 
	l_extendedprice, 
	l_partkey, 
	l_orderkey, 
	sum(l_extendedprice) over(partition by l_partkey),
from lineitem 
order by l_partkey, l_orderkey;
select 
	l_extendedprice, 
	l_partkey, 
	l_orderkey, 
	sum(l_extendedprice) over(partition by l_partkey order by l_orderkey),
from lineitem 
order by l_partkey, l_orderkey;
select 
	l_extendedprice, 
	l_partkey, 
	l_orderkey, 
	sum(l_extendedprice) over(partition by l_partkey order by l_orderkey desc),
from lineitem 
order by l_partkey, l_orderkey, l_extendedprice desc;
select 
	l_extendedprice, 
	l_partkey, 
	l_orderkey, 
	sum(l_extendedprice) over(partition by l_partkey),
	sum(l_extendedprice) over(partition by l_partkey order by l_orderkey),
	sum(l_extendedprice) over(partition by l_partkey order by l_orderkey desc),
from lineitem 
order by l_partkey, l_orderkey, l_extendedprice desc;
select 
	l_extendedprice, 
	l_partkey, 
	l_orderkey, 
	sum(l_extendedprice) over(),
	sum(l_extendedprice) over(order by l_partkey),
	sum(l_extendedprice) over(order by l_partkey, l_orderkey),
	sum(l_extendedprice) over(partition by l_partkey order by l_orderkey desc),
from lineitem 
order by l_partkey, l_orderkey, l_extendedprice desc;
