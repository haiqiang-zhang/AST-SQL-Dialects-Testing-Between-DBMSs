SELECT a, b, quote(d), group_concat(b,'') OVER w1 FROM t1
  WINDOW w1 AS 
     (ORDER BY d DESC NULLS LAST
      RANGE BETWEEN 2.50 PRECEDING AND 2.25 FOLLOWING)
  ORDER BY +d DESC NULLS LAST, +a;
SELECT a, b, quote(d), group_concat(b,'') OVER w1 FROM t1
  WINDOW w1 AS 
     (ORDER BY d DESC NULLS FIRST
      RANGE BETWEEN 2.50 PRECEDING AND 2.25 FOLLOWING)
  ORDER BY +d DESC NULLS FIRST, +a;
SELECT a, b, quote(d), group_concat(b,'') OVER w1 FROM t1
  WINDOW w1 AS 
     (ORDER BY d DESC NULLS LAST
      RANGE BETWEEN 2.50 PRECEDING AND UNBOUNDED FOLLOWING)
  ORDER BY +d DESC NULLS LAST, +a;
SELECT a, b, quote(d), group_concat(b,'') OVER w1 FROM t1
  WINDOW w1 AS 
     (ORDER BY d DESC NULLS FIRST
      RANGE BETWEEN 2.50 PRECEDING AND UNBOUNDED FOLLOWING)
  ORDER BY +d DESC NULLS FIRST, +a;
SELECT a, b, quote(d), group_concat(b,'') OVER w1 FROM t1
  WINDOW w1 AS 
     (ORDER BY d DESC NULLS LAST
      RANGE BETWEEN 2.50 PRECEDING AND CURRENT ROW)
  ORDER BY +d DESC NULLS LAST, +a;
SELECT a, b, quote(d), group_concat(b,'') OVER w1 FROM t1
  WINDOW w1 AS 
     (ORDER BY d DESC NULLS FIRST
      RANGE BETWEEN 2.50 PRECEDING AND CURRENT ROW)
  ORDER BY +d DESC NULLS FIRST, +a;
SELECT a, b, quote(d), group_concat(b,'') OVER w1 FROM t1
  WINDOW w1 AS 
     (ORDER BY d DESC NULLS LAST
      RANGE BETWEEN UNBOUNDED PRECEDING AND 2.25 FOLLOWING)
  ORDER BY +d DESC NULLS LAST, +a;
SELECT a, b, quote(d), group_concat(b,'') OVER w1 FROM t1
  WINDOW w1 AS 
     (ORDER BY d DESC NULLS FIRST
      RANGE BETWEEN UNBOUNDED PRECEDING AND 2.25 FOLLOWING)
  ORDER BY +d DESC NULLS FIRST, +a;
SELECT a, b, quote(d), group_concat(b,'') OVER w1 FROM t1
  WINDOW w1 AS 
     (ORDER BY d DESC NULLS LAST
      RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
  ORDER BY +d DESC NULLS LAST, +a;
SELECT a, b, quote(d), group_concat(b,'') OVER w1 FROM t1
  WINDOW w1 AS 
     (ORDER BY d DESC NULLS FIRST
      RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
  ORDER BY +d DESC NULLS FIRST, +a;
SELECT a, b, quote(d), group_concat(b,'') OVER w1 FROM t1
  WINDOW w1 AS 
     (ORDER BY d DESC NULLS LAST
      RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  ORDER BY +d DESC NULLS LAST, +a;
SELECT a, b, quote(d), group_concat(b,'') OVER w1 FROM t1
  WINDOW w1 AS 
     (ORDER BY d DESC NULLS FIRST
      RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
  ORDER BY +d DESC NULLS FIRST, +a;
SELECT a, b, quote(d), group_concat(b,'') OVER w1 FROM t1
  WINDOW w1 AS 
     (ORDER BY d DESC NULLS LAST
      RANGE BETWEEN CURRENT ROW AND 2.25 FOLLOWING)
  ORDER BY +d DESC NULLS LAST, +a;
SELECT a, b, quote(d), group_concat(b,'') OVER w1 FROM t1
  WINDOW w1 AS 
     (ORDER BY d DESC NULLS FIRST
      RANGE BETWEEN CURRENT ROW AND 2.25 FOLLOWING)
  ORDER BY +d DESC NULLS FIRST, +a;
SELECT a, b, quote(d), group_concat(b,'') OVER w1 FROM t1
  WINDOW w1 AS 
     (ORDER BY d DESC NULLS LAST
      RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING)
  ORDER BY +d DESC NULLS LAST, +a;
SELECT a, b, quote(d), group_concat(b,'') OVER w1 FROM t1
  WINDOW w1 AS 
     (ORDER BY d DESC NULLS FIRST
      RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING)
  ORDER BY +d DESC NULLS FIRST, +a;
SELECT a, b, quote(d), group_concat(b,'') OVER w1 FROM t1
  WINDOW w1 AS 
     (ORDER BY d DESC NULLS FIRST
      RANGE BETWEEN 2.50 PRECEDING AND 0.5 PRECEDING)
  ORDER BY +d DESC NULLS FIRST, +a;