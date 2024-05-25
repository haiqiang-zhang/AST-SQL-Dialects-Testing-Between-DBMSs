DROP TABLE IF EXISTS t;
CREATE TABLE t
(
  tid UInt64,
  processed_at DateTime,
  created_at DateTime,
  amount Int64
)
ENGINE = ReplacingMergeTree
PARTITION BY toStartOfQuarter(created_at)
PRIMARY KEY (toStartOfDay(created_at), toStartOfDay(processed_at))
ORDER BY (toStartOfDay(created_at), toStartOfDay(processed_at), tid)
SETTINGS index_granularity = 1;
INSERT INTO t VALUES (5879429,'2023-07-01 03:50:35','2023-07-01 03:50:35',-278) (5881397,'2023-07-01 06:22:26','2023-07-01 06:22:27',2807) (5925060,'2023-07-04 00:24:03','2023-07-04 00:24:02',-12) (5936591,'2023-07-04 07:37:19','2023-07-04 07:37:18',-12) (5940709,'2023-07-04 09:13:35','2023-07-04 09:13:35',2820) (5942342,'2023-07-04 09:58:00','2023-07-04 09:57:59',-12) (5952231,'2023-07-04 22:33:24','2023-07-04 22:33:24',1692) (5959449,'2023-07-05 04:32:55','2023-07-05 04:32:54',-12) (5963240,'2023-07-05 06:37:08','2023-07-05 06:37:09',1709) (5965742,'2023-07-05 07:27:01','2023-07-05 07:27:02',1709) (5969948,'2023-07-05 08:44:36','2023-07-05 08:44:37',2278) (5971673,'2023-07-05 09:14:09','2023-07-05 09:14:09',5695) (6012987,'2023-07-06 20:52:28','2023-07-06 20:52:27',-536);
SELECT tid, processed_at, created_at, amount FROM t FINAL ORDER BY tid;
SELECT sum(amount) FROM t FINAL WHERE (processed_at >= '2023-09-19 00:00:00') AND (processed_at <= '2023-09-20 01:00:00');
INSERT INTO t VALUES (5879429,'2023-07-01 03:50:35','2023-07-01 03:50:35',-278) (5881397,'2023-07-01 06:22:26','2023-07-01 06:22:27',2807) (5925060,'2023-07-04 00:24:03','2023-07-04 00:24:02',-12) (5936591,'2023-07-04 07:37:19','2023-07-04 07:37:18',-12) (5940709,'2023-07-04 09:13:35','2023-07-04 09:13:35',2820) (5942342,'2023-07-04 09:58:00','2023-07-04 09:57:59',-12) (5952231,'2023-07-04 22:33:24','2023-07-04 22:33:24',1692) (5959449,'2023-07-05 04:32:55','2023-07-05 04:32:54',-12) (5963240,'2023-07-05 06:37:08','2023-07-05 06:37:09',1709) (5965742,'2023-07-05 07:27:01','2023-07-05 07:27:02',1709) (5969948,'2023-07-05 08:44:36','2023-07-05 08:44:37',2278) (5971673,'2023-07-05 09:14:09','2023-07-05 09:14:09',5695) (6012987,'2023-07-06 20:52:28','2023-07-06 20:52:27',-536);
SELECT tid, processed_at, created_at, amount FROM t FINAL ORDER BY tid;
SELECT sum(amount) FROM t FINAL WHERE (processed_at >= '2023-09-19 00:00:00') AND (processed_at <= '2023-09-20 01:00:00');
DROP TABLE t;
