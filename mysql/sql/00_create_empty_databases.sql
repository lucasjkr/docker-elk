CREATE DATABASE fouroneone;

CREATE USER 'fouroneone'@'%' IDENTIFIED BY 'fouroneone';
GRANT ALL PRIVILEGES ON fouroneone.* TO 'fouroneone'@'%';

CREATE DATABASE handesk;

CREATE USER 'handesk'@'%' IDENTIFIED BY 'handesk';
GRANT ALL PRIVILEGES ON handesk.* TO 'handesk'@'%'

-- # create databases
-- CREATE DATABASE IF NOT EXISTS `fouroneone`;
-- CREATE DATABASE IF NOT EXISTS `osticket`;
--
-- #CREATE USER IF NOT EXISTS 'fouroneone'@'%' IDENTIFIED BY 'fouroneone';
-- #GRANT ALL PRIVILEGES ON 'fouroneone'.* TO 'fouroneone'@'%';
-- #FLUSH PRIVILEGES;
--
-- # create root user and grant rights
-- #CREATE USER 'root'@'localhost' IDENTIFIED BY 'local';
-- #GRANT ALL ON *.* TO 'root'@'%';