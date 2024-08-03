-- 3
SELECT *
FROM products
         JOIN categories ON products.category_id = categories.id
         JOIN order_details ON order_details.product_id = products.id
         JOIN orders ON order_details.order_id = orders.id
         JOIN customers ON orders.customer_id = customers.id
         JOIN employees ON orders.employee_id = employees.employee_id
         JOIN shippers ON orders.shipper_id = shippers.id
         JOIN suppliers ON products.supplier_id = suppliers.id;

-- 4.1
SELECT count(*) -- 518
FROM products
         JOIN categories ON products.category_id = categories.id
         JOIN order_details ON order_details.product_id = products.id
         JOIN orders ON order_details.order_id = orders.id
         JOIN customers ON orders.customer_id = customers.id
         JOIN employees ON orders.employee_id = employees.employee_id
         JOIN shippers ON orders.shipper_id = shippers.id
         JOIN suppliers ON products.supplier_id = suppliers.id;

-- 4.2
SELECT count(*) -- 535 rows - more rows because of null values
FROM products
         LEFT JOIN categories ON products.category_id = categories.id
         LEFT JOIN order_details ON order_details.product_id = products.id
         RIGHT JOIN orders ON order_details.order_id = orders.id
         RIGHT JOIN customers ON orders.customer_id = customers.id
         LEFT JOIN employees ON orders.employee_id = employees.employee_id
         LEFT JOIN shippers ON orders.shipper_id = shippers.id
         LEFT JOIN suppliers ON products.supplier_id = suppliers.id;

-- 4.3
SELECT count(*)
FROM products
         JOIN categories ON products.category_id = categories.id
         JOIN order_details ON order_details.product_id = products.id
         JOIN orders ON order_details.order_id = orders.id
         JOIN customers ON orders.customer_id = customers.id
         JOIN employees ON orders.employee_id = employees.employee_id
         JOIN shippers ON orders.shipper_id = shippers.id
         JOIN suppliers ON products.supplier_id = suppliers.id
WHERE employees.employee_id > 3
  AND employees.employee_id <= 10;

-- 4.4
SELECT categories.name, COUNT(categories.name) as cat_count, AVG(order_details.quantity) as avg_orders_qty
FROM products
         JOIN categories ON products.category_id = categories.id
         JOIN order_details ON order_details.product_id = products.id
         JOIN orders ON order_details.order_id = orders.id
         JOIN customers ON orders.customer_id = customers.id
         JOIN employees ON orders.employee_id = employees.employee_id
         JOIN shippers ON orders.shipper_id = shippers.id
         JOIN suppliers ON products.supplier_id = suppliers.id
GROUP BY categories.name
ORDER BY avg_orders_qty desc;

-- 4.5
SELECT categories.name, COUNT(categories.name) as cat_count, AVG(order_details.quantity) as avg_orders_qty
FROM products
         JOIN categories ON products.category_id = categories.id
         JOIN order_details ON order_details.product_id = products.id
         JOIN orders ON order_details.order_id = orders.id
         JOIN customers ON orders.customer_id = customers.id
         JOIN employees ON orders.employee_id = employees.employee_id
         JOIN shippers ON orders.shipper_id = shippers.id
         JOIN suppliers ON products.supplier_id = suppliers.id
GROUP BY categories.name
HAVING avg_orders_qty > 21
ORDER BY avg_orders_qty desc;

-- 4.6
SELECT categories.name, COUNT(categories.name) as cat_count, AVG(order_details.quantity) as avg_orders_qty
FROM products
         JOIN categories ON products.category_id = categories.id
         JOIN order_details ON order_details.product_id = products.id
         JOIN orders ON order_details.order_id = orders.id
         JOIN customers ON orders.customer_id = customers.id
         JOIN employees ON orders.employee_id = employees.employee_id
         JOIN shippers ON orders.shipper_id = shippers.id
         JOIN suppliers ON products.supplier_id = suppliers.id
GROUP BY categories.name
HAVING avg_orders_qty > 21
ORDER BY cat_count desc;

-- 4.7
SELECT categories.name, COUNT(categories.name) as cat_count, AVG(order_details.quantity) as avg_orders_qty
FROM products
         JOIN categories ON products.category_id = categories.id
         JOIN order_details ON order_details.product_id = products.id
         JOIN orders ON order_details.order_id = orders.id
         JOIN customers ON orders.customer_id = customers.id
         JOIN employees ON orders.employee_id = employees.employee_id
         JOIN shippers ON orders.shipper_id = shippers.id
         JOIN suppliers ON products.supplier_id = suppliers.id
GROUP BY categories.name
HAVING avg_orders_qty > 21
ORDER BY cat_count desc
LIMIT 4 OFFSET 1;
