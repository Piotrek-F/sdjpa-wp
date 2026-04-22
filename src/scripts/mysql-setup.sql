DROP DATABASE IF EXISTS wp;
DROP USER IF EXISTS `wpadmin`@`%`;
DROP USER IF EXISTS `wpuser`@`%`;
CREATE DATABASE IF NOT EXISTS wp CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
/* Below line is version from the course. mysql_native_password authentication plugin is deprecated in MySQL 8.4
and removed in MySQL 9 and higher. */
-- CREATE USER IF NOT EXISTS `wpadmin`@`%` IDENTIFIED WITH mysql_native_password BY 'password';
CREATE USER IF NOT EXISTS `wpadmin`@`%` IDENTIFIED WITH caching_sha2_password BY 'password';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, REFERENCES, INDEX, ALTER, EXECUTE, CREATE VIEW, SHOW VIEW,
    CREATE ROUTINE, ALTER ROUTINE, EVENT, TRIGGER ON `wp`.* TO `wpadmin`@`%`;
/* Below line is version from the course. mysql_native_password authentication plugin is deprecated in MySQL 8.4
and removed in MySQL 9 and higher. */
-- CREATE USER IF NOT EXISTS `wpuser`@`%` IDENTIFIED WITH mysql_native_password BY 'password';
CREATE USER IF NOT EXISTS `wpuser`@`%` IDENTIFIED WITH caching_sha2_password BY 'password';
GRANT SELECT, INSERT, UPDATE, DELETE, SHOW VIEW ON `wp`.* TO `wpuser`@`%`;
FLUSH PRIVILEGES;