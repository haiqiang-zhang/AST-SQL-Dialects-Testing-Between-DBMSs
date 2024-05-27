DROP TABLE IF EXISTS t_02809;
CREATE TABLE t_02809(a Int64, b Int64, s String)
ENGINE=MergeTree order by tuple()
AS SELECT number, number%10, toString(arrayMap(i-> cityHash64(i*number), range(50))) FROM numbers(10000);
CREATE TABLE t_02809_set(c Int64)
ENGINE=Set()
AS SELECT * FROM numbers(10);
CREATE TABLE t_02809_aux(c Int64)
ENGINE=Memory()
AS SELECT * FROM numbers(10);
SET optimize_move_to_prewhere=1;