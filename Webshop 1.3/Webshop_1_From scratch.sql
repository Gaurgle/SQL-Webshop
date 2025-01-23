SET SQL_SAFE_UPDATES = 0;
DROP USER IF EXISTS 'Employee'@'localhost';
DROP USER IF EXISTS 'Admin'@'localhost';
DROP DATABASE IF EXISTS sensitive_data; -- <--
USE Webshop;
DROP DATABASE IF EXISTS Webshop; -- (drop sens först)

CREATE DATABASE Webshop;
USE Webshop;
