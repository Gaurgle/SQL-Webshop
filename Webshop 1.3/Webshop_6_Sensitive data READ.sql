USE sensitive_data;

SHOW GRANTS FOR 'Admin'@'localhost';

GRANT ALL PRIVILEGES ON sensitive_data.* TO 'Admin'@'localhost';
FLUSH PRIVILEGES;


-- as BLOB, not decrypted
SELECT 
    password, 
    AES_DECRYPT(credit_card_encrypted, LEFT(SHA2('enter_password', 256), 16)) AS decrypted_cc
FROM sensitive_data.credentials
WHERE customer_id = 1;

-- decrypted:
SELECT 
    password, 
    CAST(AES_DECRYPT(credit_card_encrypted, LEFT(SHA2('MaLong', 256), 16)) AS CHAR) AS decrypted_cc
FROM sensitive_data.credentials
WHERE customer_id = 1;

SELECT 
    password, 
    CAST(AES_DECRYPT(credit_card_encrypted, LEFT(SHA2('SaknarDigPonta', 256), 16)) AS CHAR) AS decrypted_cc
FROM sensitive_data.credentials
WHERE customer_id = 3;

-- all customers credentials (BLOB):
SELECT 
	webshop.customers.first_name as first_name, 
	customers.last_name as last_name, 
    sensitive_data.credentials.password as password, 
    sensitive_data.credentials.credit_card_encrypted
FROM webshop.customers
JOIN sensitive_data.credentials
	ON sensitive_data.credentials.credential_id = webshop.customers.customer_id;
    
    
-- all customers credentials decrypted:
SELECT 
webshop.customers.first_name AS first_name, 
webshop.customers.last_name AS last_name, 
sensitive_data.credentials.password AS password, 
CASE 
	WHEN webshop.customers.customer_id = 1 THEN CAST(AES_DECRYPT(credit_card_encrypted, LEFT(SHA2('MaLong', 256), 16)) AS CHAR)
	WHEN webshop.customers.customer_id = 2 THEN CAST(AES_DECRYPT(credit_card_encrypted, LEFT(SHA2('Bobby', 256), 16)) AS CHAR)
	WHEN webshop.customers.customer_id = 3 THEN CAST(AES_DECRYPT(credit_card_encrypted, LEFT(SHA2('SaknarDigPonta', 256), 16)) AS CHAR)
	WHEN webshop.customers.customer_id = 4 THEN CAST(AES_DECRYPT(credit_card_encrypted, LEFT(SHA2('BluesPenta', 256), 16)) AS CHAR)
	WHEN webshop.customers.customer_id = 5 THEN CAST(AES_DECRYPT(credit_card_encrypted, LEFT(SHA2('Lina', 256), 16)) AS CHAR)
	WHEN webshop.customers.customer_id = 6 THEN CAST(AES_DECRYPT(credit_card_encrypted, LEFT(SHA2('Marran123123', 256), 16)) AS CHAR)
	WHEN webshop.customers.customer_id = 7 THEN CAST(AES_DECRYPT(credit_card_encrypted, LEFT(SHA2('KlårMalongVarjeDag', 256), 16)) AS CHAR)
	ELSE NULL
END AS decrypted_credit_card
FROM 
webshop.customers
JOIN 
sensitive_data.credentials
ON 
sensitive_data.credentials.customer_id = webshop.customers.customer_id;




