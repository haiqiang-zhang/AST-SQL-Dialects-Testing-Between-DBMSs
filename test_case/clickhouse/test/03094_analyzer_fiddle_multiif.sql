SET allow_experimental_analyzer=1;
SELECT
    multiIf((age > 30) or (true), '1', '2') AS a,
    max(name)
FROM users_03094
GROUP BY a;
DROP TABLE IF EXISTS users_03094;
