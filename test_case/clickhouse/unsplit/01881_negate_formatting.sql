EXPLAIN SYNTAX SELECT -1;
EXPLAIN SYNTAX SELECT -(1);
EXPLAIN SYNTAX SELECT -(-(1));
EXPLAIN SYNTAX SELECT -(-(-(1)));
EXPLAIN SYNTAX SELECT -(-(-1));
EXPLAIN SYNTAX SELECT -(-toUInt64(-(1)));
