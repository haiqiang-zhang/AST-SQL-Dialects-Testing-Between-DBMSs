SELECT engine_full LIKE ('%replica-' || serverUUID()::String || '%') FROM system.tables WHERE database = currentDatabase() AND name = 'test';
