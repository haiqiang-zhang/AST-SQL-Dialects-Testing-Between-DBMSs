SELECT range(1025, 1048576 + 9223372036854775807, 9223372036854775807);
SELECT range(1025, 1048576 + (9223372036854775807 AS i), i);
SELECT range(number, 1048576 + 9223372036854775807, 9223372036854775807) FROM system.numbers LIMIT 1 OFFSET 1025;
SELECT range(1025, number + 9223372036854775807, 9223372036854775807) FROM system.numbers LIMIT 1 OFFSET 1048576;
SELECT range(1025, 1048576 + 9223372036854775807, number + 9223372036854775807) FROM system.numbers LIMIT 1;
