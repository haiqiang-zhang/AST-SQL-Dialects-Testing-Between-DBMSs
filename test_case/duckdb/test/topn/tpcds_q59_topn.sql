SELECT *
FROM final
ORDER BY s_store_name1 NULLS FIRST,
         s_store_id1 NULLS FIRST,
         d_week_seq1 NULLS FIRST
LIMIT 100;