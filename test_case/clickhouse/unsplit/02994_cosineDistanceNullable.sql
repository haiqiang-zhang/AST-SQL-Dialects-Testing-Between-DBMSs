SELECT cosineDistance((1, 1), (toNullable(0.5), 0.1));
SELECT cosineDistance((1, 1), (toNullable(0.5), 0.1)) from numbers(10);
