-- Drop views if they exist (Oracle way)
BEGIN
   EXECUTE IMMEDIATE 'DROP VIEW CustomerOrders';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP VIEW Hyderabad_Customers';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

-- Create view: CustomerOrders
CREATE OR REPLACE VIEW CustomerOrders AS
SELECT 
    o.order_id,
    c.customer_name,
    c.city,
    p.product_name,
    p.category,
    o.quantity,
    o.status,
    o.order_date
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Products p ON o.product_id = p.product_id;

-- Create view: Hyderabad_Customers
CREATE OR REPLACE VIEW Hyderabad_Customers AS
SELECT * 
FROM Customers
WHERE city = 'Hyderabad';

-- Examples of querying the views

-- All customer orders
SELECT * FROM CustomerOrders;

-- Only orders for 'Delivered' products
SELECT * FROM CustomerOrders
WHERE status = 'Delivered';

-- Customers from Hyderabad
SELECT * FROM Hyderabad_Customers;

-- Orders placed by Hyderabad customers
SELECT co.*
FROM CustomerOrders co
JOIN Hyderabad_Customers hc ON co.customer_name = hc.customer_name;

-- Count of orders per customer (using the view)
SELECT customer_name, COUNT(order_id) AS total_orders
FROM CustomerOrders
GROUP BY customer_name
ORDER BY total_orders DESC;
