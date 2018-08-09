#!/usr/bin/env bash
mysql -uroot -pexample <<EOFMYSQL
CREATE DATABASE fir;
CREATE USER 'fir'@'localhost' IDENTIFIED BY 'THIS_IS_A_PASSWORD_CHANGE_ME_PLZ';
GRANT USAGE ON fir.* TO 'fir'@'localhost';
GRANT ALL PRIVILEGES ON `fir`.* TO 'fir'@'localhost';
FLUSH PRIVILEGES;
EOFMYSQL
