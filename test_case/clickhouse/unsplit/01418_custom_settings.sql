DROP SETTINGS PROFILE IF EXISTS s1_01418, s2_01418;
SELECT '--- assigning ---';
SELECT name, value FROM system.settings WHERE name LIKE 'custom_%' ORDER BY name;
SELECT '--- modifying ---';
SELECT name, value FROM system.settings WHERE name LIKE 'custom_%' ORDER BY name;
SELECT '--- undefined setting ---';
SELECT '--- wrong prefix ---';
SELECT '--- using query context ---';
SELECT name, value FROM system.settings WHERE name = 'custom_e';
SELECT COUNT() FROM system.settings WHERE name = 'custom_f';
SELECT '--- compound identifier ---';
SELECT name, value FROM system.settings WHERE name = 'custom_compound.identifier.v1';
SELECT '--- null type ---';
SELECT name, value FROM system.settings WHERE name = 'custom_null';
