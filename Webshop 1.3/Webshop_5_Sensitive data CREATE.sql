
CREATE DATABASE IF NOT EXISTS sensitive_data;

USE sensitive_data;

CREATE TABLE IF NOT EXISTS credentials (
    credential_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    password VARCHAR(255) NOT NULL, 
    credit_card_encrypted VARBINARY(255), -- encrypted credentials
    FOREIGN KEY (customer_id) REFERENCES Webshop.customers(customer_id)
        ON DELETE CASCADE
);

-- Create employee user
CREATE USER IF NOT EXISTS 'Employee'@'localhost' IDENTIFIED BY 'plebbPassword';

-- Grants R/W for employee's, exc. sensitive_information
GRANT SELECT, INSERT, UPDATE, DELETE ON webshop.customers TO 'Employee'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON webshop.orders TO 'Employee'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON webshop.brands TO 'Employee'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON webshop.models TO 'Employee'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON webshop.order_items TO 'Employee'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON webshop.orders TO 'Employee'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON webshop.shoe_categories TO 'Employee'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON webshop.shoes TO 'Employee'@'localhost';

-- Create admin user
CREATE USER IF NOT EXISTS 'Admin'@'localhost' IDENTIFIED BY 'bossPassword';

-- Granted R/W for all files
GRANT ALL PRIVILEGES ON webshop.* TO 'Admin'@'localhost';
GRANT ALL PRIVILEGES ON sensitive_data.* TO 'Admin'@'localhost';


INSERT INTO credentials (customer_id, password, credit_card_encrypted)
VALUES 
    (1, 'AndreasCool', AES_ENCRYPT('1234-5678-9012-3456', LEFT(SHA2('MaLong', 256), 16))),
    (2, 'b0b0b0b', AES_ENCRYPT('5551-9090-1010-4123', LEFT(SHA2('Bobby', 256), 16))),
    (3, 'AlizeAlize', AES_ENCRYPT('1234-5678-1312-6341', LEFT(SHA2('SaknarDigPonta', 256), 16))),
    (4, 'RockaBasen', AES_ENCRYPT('9495-4719-5882-3190', LEFT(SHA2('BluesPenta', 256), 16))),
    (5, 'LinisFiniz', AES_ENCRYPT('6891-4812-2322-0091', LEFT(SHA2('Lina', 256), 16))),
    (6, 'MaryHaze', AES_ENCRYPT('4241-1232-5467-1212', LEFT(SHA2('Marran123123', 256), 16))),
    (7, '123123', AES_ENCRYPT('8482-2426-3414-6563', LEFT(SHA2('KlårMalongVarjeDag', 256), 16)));
    
USE Webshop;


DELIMITER //

-- Create trigger after customer insert
CREATE TRIGGER after_customer_insert
AFTER INSERT ON customers
FOR EACH ROW
BEGIN
    -- Check if credentials already exist for the new customer
    IF NOT EXISTS (
        SELECT 1
        FROM credentials
        WHERE customer_id = NEW.customer_id
    ) THEN
        -- Insert default credentials
        INSERT INTO credentials (customer_id, password, credit_card_encrypted)
        VALUES (NEW.customer_id, 'defaultPassword', NULL);
    END IF;
END//

DELIMITER ;
