-- Task 1: Top 5 Customers by Total Spend
select c.first_name, c.last_name, SUM(oi.quantity * oi.unit_price) as total_spent
from customers c
join orders o on c.id = o.customer_id
join order_items oi on o.id = oi.order_id
group by c.first_name, c.last_name
order by total_spent DESC
limit 5;

-- Task 2: Total Revenue by Product Category
select p.category, SUM(oi.quantity * oi.unit_price) as total_revenue
from products p
join order_items oi on p.id = oi.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- Task 3: Employees Earning Above Their Department Average
select e.first_name, e.last_name, e.salary, d.name as department_name
from employees e
join departments d on e.department_id = d.id
where e.salary > (
    select AVG(salary)
    from employees
    where department_id = e.department_id
)
ORDER BY d.name, e.salary DESC;

-- Task 4: Cities with the Most Loyal Customers
select c.city, count(*) as gold_customers
from customers c
where c.loyalty_level = 'Gold'
GROUP BY c.city
ORDER BY gold_customers DESC
