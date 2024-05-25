PRAGMA enable_verification;
CREATE TABLE src("Name" VARCHAR, CreatedAt TIMESTAMP, userID VARCHAR, "Version" VARCHAR, Clients BIGINT, HasDocumentation BOOLEAN, HasCustomAddress BOOLEAN, HasHostname BOOLEAN, RunningContainers BIGINT, HasActions BOOLEAN);
CREATE VIEW model AS SELECT DISTINCT on(userID,  date_trunc('day', CreatedAt))  date_trunc('day', CreatedAt) AS CreatedAt, "Version", Clients, HasCustomAddress, HasHostname, RunningContainers, HasDocumentation, HasActions  FROM src WHERE name = 'events' ORDER BY userID, CreatedAt DESC;
SELECT HasCustomAddress,count(*) AS total_records FROM model WHERE     1 = 1     AND CreatedAt >= '2023-12-01'     AND CreatedAt < '2023-12-13' GROUP BY     HasCustomAddress ORDER BY     true,     total_records DESC NULLS LAST LIMIT 250 OFFSET 0;
