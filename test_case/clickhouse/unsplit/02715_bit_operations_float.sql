SELECT bitNot(-inf) != 0, bitNot(inf) != 0, bitNot(3.40282e+38) != 0, bitNot(nan) != 0;
SELECT bitCount(-inf), bitCount(inf), bitCount(3.40282e+38), bitCount(nan);
