DROP TABLE IF EXISTS users_03094;
CREATE TABLE users_03094 (name String, age Int16) ENGINE=Memory;
INSERT INTO users_03094 VALUES ('John', 33);
INSERT INTO users_03094 VALUES ('Ksenia', 48);
INSERT INTO users_03094 VALUES ('Alice', 50);
SET allow_experimental_analyzer=1;