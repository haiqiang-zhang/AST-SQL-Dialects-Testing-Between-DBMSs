SELECT ID FROM INFORMATION_SCHEMA.PROCESSLIST WHERE INFO LIKE "RENAME TABLE%" INTO @thread_id;
