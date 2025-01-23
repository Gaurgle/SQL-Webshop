-- 1:
SELECT customers.first_name, customers.last_name
	FROM customers
	JOIN orders 
		ON customers.customer_id = orders.customer_id
	JOIN order_items 
		ON orders.order_id = order_items.order_id
	JOIN shoes 
		ON order_items.shoe_id = shoes.shoe_id
	JOIN models 
		ON shoes.model_id = models.model_id
	JOIN brands 
		ON models.brand_id = brands.brand_id
	JOIN shoe_categories ON shoe_categories.category_id IN
		(SELECT category_id
		FROM model_categories
		WHERE model_id = models.model_id)
	WHERE 
		shoes.color = 'Black' AND
		shoes.size = 38 AND 
		brands.brand_name = 'Ecco' AND
		shoe_categories.category_name LIKE 'Sand%';
    
-- 2:
SELECT shoe_categories.category_name, COUNT(shoes.shoe_id) AS 'number of'
	FROM shoe_categories
	JOIN model_categories 
		ON shoe_categories.category_id = model_categories.category_id
	JOIN models
		ON model_categories.model_id = models.model_id
	JOIN shoes
		ON models.model_id = shoes.model_id
	GROUP BY shoe_categories.category_name;


-- 3:
SELECT 
   	customers.first_name as 'first name', 
   	customers.last_name as 'last name',
    SUM(order_items.qty * order_items.item_price) AS total
	FROM customers
	JOIN orders 
		ON customers.customer_id = orders.customer_id
	JOIN order_items 
		ON orders.order_id = order_items.order_id
	GROUP BY customers.customer_id, customers.first_name, customers.last_name
	ORDER BY total DESC;

-- 4:
SELECT 
	customers.city AS city,
	SUM(order_items.qty * order_items.item_price) as total
	FROM orders
	JOIN customers
		ON orders.customer_id = customers.customer_id
	JOIN order_items 
		ON orders.order_id = order_items.order_id
	GROUP BY customers.city
	HAVING total > 1000
	ORDER BY total DESC;

-- 5:
SELECT
    models.model_name AS Product,
    SUM(order_items.qty) AS Total_Sold
	FROM order_items
	JOIN shoes 
		ON order_items.shoe_id = shoes.shoe_id
	JOIN models 
		ON shoes.model_id = models.model_id
	GROUP BY models.model_name
	ORDER BY Total_Sold DESC
	LIMIT 5;

-- 6:

SELECT 
    DATE_FORMAT(orders.order_date, '%M %Y') AS Month_Year, 
    SUM(order_items.qty * order_items.item_price) AS Total_Sales
FROM orders
JOIN order_items 
	ON orders.order_id = order_items.order_id
GROUP BY Month_Year
ORDER BY Total_Sales DESC
LIMIT 1;

-- 7 IDX
	-- Pingisskor:
SELECT 
    models.model_name, 
    shoes.price,
    shoes.size,
    shoes.color
FROM shoes
JOIN models 
	ON shoes.model_id = models.model_id
JOIN model_categories 
	ON models.model_id = model_categories.model_id
JOIN shoe_categories 
	ON model_categories.category_id = shoe_categories.category_id
WHERE shoe_categories.category_name = 'Table Tennis';
	
    -- Produkter sålda 2024:
SELECT * 
FROM orders 
JOIN models
	ON models.model_id = orders.order_id
WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31';

