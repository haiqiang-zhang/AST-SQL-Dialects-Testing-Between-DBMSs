PRAGMA enable_verification;
PREPARE v1 AS SELECT $1::INT, $1::BIGINT;
PREPARE v2 AS SELECT $1::BIGINT, $1::INT;
PREPARE v3 AS SELECT $1::BIGINT, $1::UBIGINT;
PREPARE v4 AS SELECT $1::VARCHAR, $1::DATE;
PREPARE v5 AS SELECT $1::INT, $1::BIGINT, $1::TINYINT, $1::HUGEINT, $1::SMALLINT;
PREPARE v6 AS SELECT $1::INT, $1::BIGINT, $1::TINYINT, $1::UBIGINT, $1::SMALLINT, $1::UHUGEINT;
PREPARE v7 AS SELECT CONCAT($1::TINYINT, $1);
PREPARE v8 AS SELECT * FROM (values ('body')) t(field) WHERE CASE WHEN $1 IS NULL THEN 1 ELSE field IN (SELECT * FROM (SELECT UNNEST(string_split($1, ','))) AS fsq) END;
EXECUTE v8('body');
PREPARE v9 AS SELECT UNNEST($1) UNION ALL SELECT * FROM range(1) WHERE $1::INT[]=[1];
EXECUTE v9([1]);
EXECUTE v1(42);
EXECUTE v2(42);
EXECUTE v3(42);
EXECUTE v4('1992-01-01');
EXECUTE v5(42);
EXECUTE v6(42);
EXECUTE v7(42);
