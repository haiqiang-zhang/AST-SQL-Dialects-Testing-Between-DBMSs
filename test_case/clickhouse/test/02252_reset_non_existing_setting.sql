DROP TABLE IF EXISTS most_ordinary_mt;
CREATE TABLE most_ordinary_mt
(
   Key UInt64
)
ENGINE = MergeTree()
ORDER BY tuple();
ALTER TABLE most_ordinary_mt RESET SETTING ttl;
DROP TABLE IF EXISTS most_ordinary_mt;