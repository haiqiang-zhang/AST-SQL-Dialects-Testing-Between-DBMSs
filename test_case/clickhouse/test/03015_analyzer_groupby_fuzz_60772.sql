SELECT toFixedString(toFixedString(toFixedString(toFixedString(toFixedString(toFixedString('%W', 2), 2), 2),toLowCardinality(toLowCardinality(toNullable(2)))), 2), 2),
       toFixedString(toFixedString('2018-01-02 22:33:44', 19), 19),
       hasSubsequence(toNullable(materialize(toLowCardinality('garbage'))), 'gr')
GROUP BY
    '2018-01-02 22:33:44',
    toFixedString(toFixedString('2018-01-02 22:33:44', 19), 19),
    'gr',
    '2018-01-02 22:33:44'
SETTINGS allow_experimental_analyzer = 1;
SELECT
    toFixedString(toFixedString(toFixedString(toFixedString(toFixedString(toFixedString('%W', 2), 2), 2), toLowCardinality(toLowCardinality(toNullable(2)))), 2), 2),
    toFixedString(toFixedString('2018-01-02 22:33:44', 19), 19),
    hasSubsequence(toNullable(materialize(toLowCardinality('garbage'))), 'gr')
GROUP BY
    '2018-01-02 22:33:44',
    toFixedString(toFixedString('2018-01-02 22:33:44', 19), 19),
    'gr',
    '2018-01-02 22:33:44'
WITH CUBE
SETTINGS allow_experimental_analyzer = 1;