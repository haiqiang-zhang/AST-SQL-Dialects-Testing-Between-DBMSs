EXPLAIN AST SELECT false IS NOT DISTINCT FROM true IN (true, false);
EXPLAIN AST SELECT 1 IS NOT DISTINCT FROM 1 + 1;
EXPLAIN AST SELECT true IS NOT DISTINCT FROM 'x' LIKE 'a';
EXPLAIN AST SELECT 'x' IS NOT DISTINCT FROM 'x' || 'a';
EXPLAIN AST SELECT 1 IS NOT DISTINCT FROM 1 :: integer;
EXPLAIN AST SELECT NOT 1 IS NOT DISTINCT FROM 1;
EXPLAIN AST SELECT - 1 IS NOT DISTINCT FROM 1;
EXPLAIN AST SELECT false IS NOT DISTINCT FROM true OR true;
EXPLAIN AST SELECT NULL IS NULL IS NOT DISTINCT FROM NULL;
EXPLAIN AST SELECT 1 <=> 1 == 1;
EXPLAIN AST SELECT 1 == 1 <=> 1;
