PRAGMA enable_verification;
RESET disabled_filesystems;
RESET disabled_filesystems;
SET disabled_filesystems='';
SET disabled_filesystems='LocalFileSystem';
SELECT current_setting('disabled_filesystems');
