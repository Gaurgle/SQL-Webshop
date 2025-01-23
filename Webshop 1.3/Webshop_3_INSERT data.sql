-- Data:

-- Brands
INSERT INTO brands (brand_name) VALUES 
	('Adidas'), 
	('Asics'), 
	('Birkenstock'), 
	('Converse'),
	('Mizuno'),
	('New Balance'),
	('Nike'),
	('Puma'),
	('Rebook'),
	('Vans'),
	('Ecco');

-- Shoe Categories
INSERT INTO shoe_categories (category_name) VALUES 
	('Basketball'), 
	('Badminton'), 
	('Dress'),
	('Hiking'),
	('Running'),
	('Skate'),
	('Sneaker'),
	('Soccer'),
	('Table Tennis'),
	('Tennis'),
	('Casual'), -- 12
	('Sandal');	-- 13

-- Models
INSERT INTO models (brand_id, model_name) VALUES
	(1, 'UltraBoost'), (1, 'Superstar'), (1, 'Stan Smith'), 
	(2, 'Gel-Kayano'), (2, 'Gel-Nimbus'), (2, 'GT-2000'),
	(3, 'Arizona'), (3, 'Boston'), (3, 'Gizeh'),
	(4, 'Chuck Taylor All Star'), (4, 'One Star'), (4, 'Run Star Hike'),
	(5, 'Wave Drive 9'), (5, 'Wave Sky'), (5, 'Wave Inspire'),
	(6, '990'), (6, '574'), (6, 'Fresh Foam 1080'),
	(7, 'Air Max'), (7, 'Air Force 1'), (7, 'Pegasus'),
	(8, 'RS-X'), (8, 'Suede Classic'), (8, 'Future Rider'),
	(9, 'Classic Leather'), (9, 'Nano X'), (9, 'Club C 85'),
	(10, 'Old School'), (10, 'Sk8-Hi'), (10, 'Authentic'),
	(11, 'Offroad'), (11, 'Soft 7'), (11, 'Street Tray');

-- Shoes
INSERT INTO shoes (model_id, color, size, price, units_in_stock, sex) VALUES
	-- Adidas:
		-- UltraBoost
	(1, 'Black', 42, 1299, 12, 'Unisex'),   
		-- Superstar
    (2, 'White', 41, 999, 12, 'Male'),      
    (2, 'White', 42, 999, 7, 'Male'),
    (3, 'White & Green', 40, 899, 20, 'Male'), 
    	-- Stan smith
	(3, 'White & Blue', 42, 999, 3, 'Male'),
	-- Asics: 
		-- Gel-Kayano
	(4, 'Blue', 43, 1199, 10, 'Unisex'),   	
	(4, 'Grey', 38, 1199, 6, 'Unisex'),
	(4, 'Grey', 39, 1199, 7, 'Unisex'),
	(4, 'Grey', 40, 1199, 10, 'Unisex'),
	(4, 'Black', 41, 1199, 8, 'Unisex'),
	(4, 'Black', 42, 1199, 4, 'Unisex'),
		-- Gel-Nimbus
    (5, 'Grey', 42, 1299, 8, 'Female'),    	
    	-- GT-2000
    (6, 'Red', 39, 1099, 12, 'Male'),      	
    -- Birkenstock:
    	-- Arizona
    (7, 'Brown', 39, 799, 12, 'Female'),   	
    	-- Boston
    (8, 'Black', 38, 849, 15, 'Unisex'),   	
    	-- Gizeh
    (9, 'White', 40, 899, 9, 'Female'),    	
	 -- Converse:
	 	-- Chuck Taylor All Star
    (10, 'Red', 42, 699, 20, 'Unisex'),    	
    	-- One Star
    (11, 'Black', 41, 749, 18, 'Unisex'),  	
    	-- Run Star Hike
    (12, 'Blue', 43, 799, 14, 'Unisex'),   	
	-- Mizuno:
		-- Wave Rider
    (13, 'Red', 43, 1499, 2, 'Male'),      	
	(13, 'Blue', 44, 1499, 1, 'Male'),
		-- Wave Sky
    (14, 'Blue', 44, 1399, 1, 'Male'),     	
    	-- Wave Inspire
    (15, 'Grey', 42, 1399, 4, 'Unisex'),   	
    -- New Balance:
    	-- 990
    (16, 'Grey', 40, 1299, 5, 'Male'),     	
    (16, 'Grey', 41, 1299, 3, 'Male'),
	(16, 'Grey', 42, 1299, 5, 'Male'),
	(16, 'Grey', 43, 1299, 15, 'Male'),
		-- 574
    (17, 'White', 40, 1199, 7, 'Female'),  	
    	-- Fresh Foam 1080
    (18, 'Black', 42, 1399, 8, 'Unisex'),  	
    -- Nike:
        -- Air Max
    (19, 'Red', 41, 1599, 15, 'Unisex'),   	
    	-- Air Force 1
    (20, 'Green', 42, 1499, 12, 'Male'),   	
    (20, 'Red', 45, 1399, 3, 'Male'),
	(20, 'Green', 44, 1399, 1, 'Male'),
	(20, 'Pink', 40, 1399, 2, 'Female'),
	(20, 'White', 39, 1399, 3, 'Female'),
		-- Pegasus
    (21, 'White', 43, 1699, 10, 'Unisex'), 	
    -- Puma:
    	-- RS-X
    (22, 'Black', 40, 899, 20, 'Female'),  	
    	-- Suede Classic
    (23, 'Blue', 41, 1099, 18, 'Male'),    	
    	-- Future Rider
    (24, 'Red', 42, 1199, 14, 'Unisex'),   	
    -- Reebok:
    	-- Classic Leather
    (25, 'White', 39, 899, 15, 'Unisex'),  	
    	-- Nano X
    (26, 'Grey', 40, 999, 10, 'Male'),     	
    	-- Club C 85
    (27, 'Black', 42, 1099, 12, 'Female'), 	
 	-- Vans:
 		-- Old School
    (28, 'Black', 37, 799, 14, 'Unisex'),  	
    (28, 'Black', 38, 799, 6, 'Unisex'),
	(28, 'Black', 39, 799, 11, 'Unisex'),
	(28, 'Black', 40, 799, 16, 'Unisex'),
		-- Sk8-Hi
	(29, 'Black', 38, 799, 5, 'Unisex'),	
	(29, 'Black', 39, 799, 11, 'Unisex'),
	(29, 'Black', 40, 799, 1, 'Unisex'),
		-- Authentic
    (30, 'Black', 40, 799, 16, 'Unisex'),
    -- Ecco
    (31, 'Black', 38, 599, 3, 'Unisex'),
    (31, 'Black', 39, 599, 2, 'Unisex'),
    (31, 'Black', 40, 599, 4, 'Unisex'),
    (31, 'Brown', 39, 599, 1, 'Unisex'),
    (32, 'Black', 37, 699, 5, 'Male'),
    (33, 'Black', 40, 799, 2, 'Male');




-- Customers
INSERT INTO customers (first_name, last_name, pnr, address, city, email, phone_number) VALUES
	('Andreas', 'Roos', '19900313-1512', 'Högalidsgatan 40D', 'Stockholm', 'andreas.roos@yh.nackademin.se', '0763060692'),
	('Bob', 'Berg', '19850615-5678', 'Gatan 2', 'Göteborg', 'bob@example.com', '0735556543'),
	('Alice', 'Andersson', '19900101-1234', 'Vägen 1', 'Stockholm', 'alice@example.com', '0705554567'),
	('Adam', 'Lännerholm', '19910202-4321', 'Viken 21', 'Eksjö', 'adam@hotmail.com', '0700006352'),
	('Lina', 'Hansson', '19880612-5681', 'Eriksdalshamnen 66', 'Stockholm', 'LinaLina@gmail.com', '0735481331'),
	('Maria', 'Hazell', '19900301-4563', 'Högalidsgatan 40D', 'Stockholm', 'MysGumman420@gmail.com', '0708944278'),
	('Kristofer', 'Eriksson', '19891204-6969', 'Eriksdalshamnen 66', 'Stockholm', 'PPLossMaster@MaLong.CN', '0735670541');

-- Orders
INSERT INTO orders (customer_id, order_date) VALUES
	(1, '2024-07-16'), 	-- order_id 1
	(2, '2024-08-02'),	-- order_id 2
	(3, '2024-10-14'),	-- order_id 3
	(4, '2024-10-14'),	-- order_id 4
	(4, '2024-10-15'),	-- order_id 5
	(4, '2024-10-21'),	-- order_id 6
	(5, '2024-11-01'),	-- order_id 7
	(6, '2024-11-01'),	-- order_id 8
	(4, '2024-11-04'),	-- order_id 9
	(3, '2025-01-04'),	-- order_id 10
	(4, '2025-01-06'),	-- order_id 11
	(1, '2025-01-21'),	-- order_id 12
	(4, '2025-01-21');	-- order_id 13


-- Order Items
INSERT INTO order_items (order_id, shoe_id, qty, item_price) VALUES
	(1, 1, 1, 1299),
	(2, 3, 2, 1998),
	(3, 3, 1, 999),
	(4, 12, 1, 1299), 	-- p4 o4
	(4, 20, 2, 1499), 	-- p4 o4
	(4, 30, 2, 1599), 	-- p4 o4
	(5, 1, 1, 1299), 	-- p4 o5
	(5, 50, 1, 799),  	-- p4 o5
	(6, 14, 1, 799),	-- p4 o6
	(6, 15, 1, 849),	-- p4 o6
	(6, 16, 1, 899),	-- p4 o6
	(7, 24, 1, 1299),	-- p5 o7
	(8, 24, 1, 1299),	-- p4 o8
	(9, 29, 1, 1399),	-- p4 o9
	(10, 40, 1, 899),	-- ....
	(11, 5, 1, 999),
	(12, 18, 1, 749),
	(13, 51, 1, 599);




-- Model Categories
INSERT INTO model_categories (model_id, category_id) VALUES
	(1, 5), (1, 7), 
	(2, 5), (2, 10),
	(3, 7), (3, 10),
	(4, 7), (4, 10),
	(5, 5), 
	(6, 5),
	(7, 11), (7, 12),
	(8, 11), (8, 12),
	(9, 11), (9, 12),
	(10, 1), (10, 7), (10, 11),
	(11, 7), (11, 11),
	(12, 4), (12, 11),
	(13, 2), (13, 9),
	(14, 5),
	(15, 5),
	(16, 5), (16, 7),
	(17, 7),
	(18, 5), (18, 7), 
	(19, 7), (19, 11),
	(20, 1), (20, 7),
	(21, 5),
	(22, 7),
	(23, 7),
	(24, 7),
	(25, 7),
	(26, 7),
	(27, 5),
	(28, 5), (28, 11),
	(29, 6), (29, 7), (29, 11),
	(30, 6), (30, 11),
	(31, 12), (31, 11),
	(32, 5), (32, 7),
	(33, 5), (33, 7);


SET SQL_SAFE_UPDATES = 1;

