-- 1. Brands
CREATE TABLE brands (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_name VARCHAR(50) NOT NULL
);

-- 2. Shoe Categories
CREATE TABLE shoe_categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

-- 3. Models
CREATE TABLE models (
    model_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_id INT NOT NULL,
    model_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (brand_id) REFERENCES brands(brand_id)
        ON DELETE CASCADE
);
        
-- 4. Shoes
CREATE TABLE shoes (
    shoe_id INT AUTO_INCREMENT PRIMARY KEY,
    model_id INT NOT NULL,
    color VARCHAR(30) NOT NULL,
    size DECIMAL(4,1) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    units_in_stock INT NOT NULL,
    sex ENUM('Male', 'Female', 'Unisex') NOT NULL,
    FOREIGN KEY (model_id) REFERENCES models(model_id)
        ON DELETE CASCADE
);

-- 5. Customers
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    pnr CHAR(12) NOT NULL UNIQUE,
    address VARCHAR(255), -- man kanske är hemlös
    city VARCHAR(100),
    email VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15) NOT NULL
);

-- 5.2 Update customers pnr
ALTER TABLE customers
MODIFY COLUMN pnr VARCHAR(13) NOT NULL;

-- 6. Orders
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
        ON DELETE RESTRICT -- Tar inte bort
);

-- 7. Order Items
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    shoe_id INT NOT NULL,
    qty INT NOT NULL,
    item_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
        ON DELETE CASCADE,
    FOREIGN KEY (shoe_id) REFERENCES shoes(shoe_id)
        ON DELETE CASCADE
);

-- 8. Model Categories (Mapping Table)
CREATE TABLE model_categories (
    model_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (model_id, category_id),
    FOREIGN KEY (model_id) REFERENCES models(model_id)
        ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES shoe_categories(category_id)
        ON DELETE CASCADE
);

-- Index över pingisskor
CREATE INDEX idx_table_tennis ON shoe_categories(category_name);

-- Index över produkter sålda 2024
CREATE INDEX idx_orders_order_date ON orders(order_date);

