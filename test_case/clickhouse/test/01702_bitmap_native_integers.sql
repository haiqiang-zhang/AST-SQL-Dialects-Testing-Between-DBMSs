select * apply bitmapMin, * apply bitmapMax from (select * apply groupBitmapState from t);
drop table t;
