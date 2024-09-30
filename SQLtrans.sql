use retailshop;
show tables;
select* from online_retail;
-- Meta data
SELECT schema_name AS retailshop
FROM INFORMATION_SCHEMA.SCHEMATA;
show tables;
-- column count
select* from online_retail;

 SELECT COUNT(*) AS column_count
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_schema = 'retailshop'
 AND table_name = 'online_retail';
  
  -- row count
SELECT COUNT(*) AS row_count
FROM  online_retail;

-- indexes
SELECT index_name, column_name
FROM information_schema.statistics
WHERE table_name = 'online_retail'
  AND table_schema = 'retailshop';

  -- constraints
  SELECT constraint_name, constraint_type, column_name
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE table_schema = 'retailshop'
  AND table_name = 'online_retail';
  SELECT customer_id,
SUM(order_value) AS total_order_value
FROM orders
GROUP BY customer_id
ORDER BY total_order_value DESC;

SELECT customer_id, 
       COUNT(DISTINCT product_id) AS unique_products_purchased
FROM orders
GROUP BY customer_id
ORDER BY unique_products_purchased DESC;
SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) = 1;
SELECT o1.product_id AS product_1, 
       o2.product_id AS product_2, 
       COUNT(*) AS times_purchased_together
FROM orders o1
JOIN orders o2 ON o1.order_id = o2.order_id
              AND o1.product_id < o2.product_id
GROUP BY product_1, product_2
ORDER BY times_purchased_together DESC;

DESCRIBE orders;
SELECT customer_id, COUNT(order_id) AS purchase_count
FROM orders
GROUP BY customer_id
ORDER BY purchase_count DESC;



