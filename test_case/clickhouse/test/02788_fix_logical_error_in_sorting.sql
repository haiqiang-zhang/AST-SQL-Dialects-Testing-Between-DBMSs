DROP TABLE IF EXISTS session_events;
DROP TABLE IF EXISTS event_types;
CREATE TABLE session_events
(
    clientId UInt64,
    sessionId String,
    pageId UInt64,
    eventNumber UInt64,
    timestamp UInt64,
    type LowCardinality(String),
    data String
)
ENGINE = MergeTree
PARTITION BY toYYYYMM(toDate(pageId / 1000))
ORDER BY (clientId, sessionId, pageId, timestamp);
CREATE TABLE event_types
(
    type String,
    active Int16
)
ENGINE = MergeTree
PARTITION BY substring(type, 1, 1)
ORDER BY (type, active);
SYSTEM STOP MERGES session_events;
SYSTEM STOP MERGES event_types;
INSERT INTO session_events SELECT
    141,
    '693de636-6d9b-47b7-b52a-33bd303b6255',
    1686053240314,
    number,
    number,
    toString(number % 10),
    ''
FROM numbers_mt(100000);
INSERT INTO session_events SELECT
    141,
    '693de636-6d9b-47b7-b52a-33bd303b6255',
    1686053240314,
    number,
    number,
    toString(number % 10),
    ''
FROM numbers_mt(100000);
INSERT INTO event_types SELECT
    toString(number % 10),
    number % 2
FROM numbers(20);
SET optimize_sorting_by_input_stream_properties = 1;
DROP TABLE session_events;
DROP TABLE event_types;