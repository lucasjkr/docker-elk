CREATE DATABASE fouroneone;

CREATE USER 'fouroneone'@'%' IDENTIFIED BY 'fouroneone';
GRANT ALL PRIVILEGES ON fouroneone.* TO 'fouroneone'@'%';

CREATE DATABASE handesk;

CREATE USER 'handesk'@'%' IDENTIFIED BY 'handesk';
GRANT ALL PRIVILEGES ON handesk.* TO 'handesk'@'%'