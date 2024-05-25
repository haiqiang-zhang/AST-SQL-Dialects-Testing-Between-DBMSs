PRAGMA enable_verification;
CREATE TABLE "user" (name string);
PREPARE s2965 AS
WITH temp_first AS (
    SELECT * FROM "user"
    WHERE "name" = ?
), temp_second AS (
    SELECT * FROM "user"
    WHERE "name" = ?
)
SELECT * FROM temp_second;
EXECUTE s2965('val1', 'val2');
DEALLOCATE s2965;
