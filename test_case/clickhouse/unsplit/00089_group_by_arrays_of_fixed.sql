SELECT arr, count() AS c FROM (SELECT arrayMap(x -> x % 2, arraySort(groupArray(number))) AS arr FROM (SELECT number FROM system.numbers LIMIT 10000) GROUP BY number % ((number * 0xABCDEF0123456789 % 1234) + 1)) GROUP BY arr ORDER BY c DESC, arr ASC;
