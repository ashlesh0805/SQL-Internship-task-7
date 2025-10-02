# Task 7: Creating Views for E-Commerce Database

## Description
In this task, we created **SQL views** to simplify querying in our e-commerce database.  

- `CustomerOrders` combines **Orders, Customers, and Products** to give a full overview of each order.  
- `Hyderabad_Customers` lists customers located in **Hyderabad**.  

These views make it easier to count orders per customer, check order status, and analyze city-specific orders.

---

## Views Created

### 1. CustomerOrders
Shows all order details including customer name, city, product, category, quantity, status, and order date.
```sql
SELECT * FROM CustomerOrders;

How to Run
1. Open your SQL environment
Oracle SQL Developer, VS Code with Oracle extension, or any Oracle-compatible tool.
2. Run the Task 3 script
This creates the Products, Customers, and Orders tables and inserts the sample data.
3. Run the Task 7 script
This creates the CustomerOrders and Hyderabad_Customers views.
4. Query the views

Example:
SELECT * FROM CustomerOrders;
SELECT * FROM Hyderabad_Customers;
