CREATE EVENT IF NOT EXISTS ev1 ON SCHEDULE EVERY 1 SECOND STARTS NOW() ENDS
NOW() + INTERVAL 1 SECOND ON COMPLETION NOT PRESERVE DO SELECT 1;
