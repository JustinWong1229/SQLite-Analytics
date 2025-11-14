-- Task 1: Top 5 Customers by Total Spend
select c.first_name, c.last_name, SUM(oi.quantity * oi.unit_price) as total_spent
from customers c
join order_items oi on c.id = oi.id
GROUP BY c.first_name, c.last_name
ORDER BY total_spent DESC
Limit 5;

-- Task 2: Total Revenue by Product Category
select p.category, SUM(oi.quantity * oi.unit_price) as total_revenue
from products p
join order_items oi on p.id = oi.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

