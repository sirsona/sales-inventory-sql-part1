-- SALES AND INVENTORY SQL ASSIGNMENT

-- ====================
-- QUESTIONS AND ANSWERS
-- ====================
-- 1. Write a query to select all data from the 'customers' table.
SELECT
    *
FROM
    customers;

-- 2. Write a query to select the total number of products from the 'products' table.
SELECT
    count(*) AS total_products
FROM
    products;

-- 3. Write a query to select the product name and its price from the 'products' table whre the price is greater than 500.
SELECT
    p.product_name,
    p.price
FROM
    products p
WHERE
    p.price > 500;

-- 4. Write a query to find the average price of all products from the 'product' table
SELECT
    round(AVG(p.price), 2)
FROM
    products p;

-- 5. Write a query to find the total sales amount from the `Sales` table.
SELECT
    sum(s.total_amount) AS total_amount
FROM
    sales s;

-- 6. Write a query to select distinct membership statuses from the `Customers` table.
SELECT DISTINCT
    c.membership_status
FROM
    customers c;

-- 7. Write a query to concatenate first and last names of all customers and show the result as `full_name`.
SELECT
    c.first_name || ' ' || c.last_name AS full_name
FROM
    customers c
    -- 8. Write a query to find all products in the `Products` table where the category is 'Electronics'.
    SELECT
        *
    FROM
        products;

SELECT
    p.product_name,
    p.category
FROM
    products p
WHERE
    p.category = 'Electronics';

-- 9. Write a query to find the highest price from the `Products` table.
SELECT
    max(price) AS highest_price
FROM
    products p
    -- 10. Write a query to count the number of sales for each product from the `Sales` table.
    SELECT
        s.product_id,
        count(*) AS total_sales
FROM
    sales s
GROUP BY
    product_id;

-- 11. Write a query to find the total quantity sold for each product from the `Sales` table.
SELECT
    s.product_id,
    SUM(s.quantity_sold) AS total_quantity_sold
FROM
    sales s
GROUP BY
    s.product_id;

-- 12. Write a query to find the lowest price of products in the `Products` table.
SELECT
    MIN(p.price) AS lowest_price
FROM
    products p
    -- 13. Write a query to find customers who have purchased products with a price greater than 1000.
    SELECT DISTINCT
        c.customer_id,
        c.first_name || ' ' || c.last_name AS full_name,
        price
    FROM
        customers c
        JOIN sales s ON c.customer_id = s.customer_id
        JOIN products p ON s.product_id = p.product_id
    WHERE
        p.price > 1000;

-- 14. Write a query to join the `Sales` and `Products` tables on product_id, and select the product name and total sales amount.
SELECT
    p.product_name,
    SUM(s.quantity_sold * p.price) AS total_sales
FROM
    sales s
    JOIN products p ON s.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name;

-- 15. Write a query to join the `Customers` and `Sales` tables and find the total amount spent by each customer.
SELECT
    c.customer_id,
    c.first_name,
    SUM(s.total_amount) AS total_amount_spent
FROM
    customers c
    JOIN sales s ON c.customer_id = s.customer_id
GROUP BY
    c.customer_id,
    c.first_name;

-- 16. Write a query to join the `Customers`, `Sales`, and `Products` tables, and show each customer's first and last name, product name, and quantity sold.
SELECT
    c.first_name,
    c.last_name,
    p.product_name,
    s.quantity_sold
FROM
    customers c
    JOIN sales s ON c.customer_id = s.customer_id
    JOIN products p ON s.product_id = p.product_id
    -- 17. Write a query to perform a self-join on the `Customers` table and find all pairs of customers who have the same membership status.
    SELECT
        c.first_name || ' ' || c.last_name AS customer1,
        c2.first_name || ' ' || c2.last_name AS customer2,
        c.membership_status
    FROM
        customers c
        JOIN customers c2 ON c.membership_status = c2.membership_status
    WHERE
        c.customer_id < c2.customer_id;

-- 18. Write a query to join the `Sales` and `Products` tables, and calculate the total number of sales for each product.
SELECT
    s.product_id,
    sum(s.quantity_sold) AS total_sales
FROM
    sales s
    JOIN products p ON s.product_id = p.product_id
GROUP BY
    s.product_id;

-- 19. Write a query to find the products in the `Products` table where the stock quantity is less than 10.
SELECT
    p.product_id,
    p.product_name,
    p.stock_quantity
FROM
    products p
WHERE
    p.stock_quantity < 10;

-- 20. Write a query to join the `Sales` table and the `Products` table, and find products with sales greater than 5.
SELECT
    sub.product_id,
    sub.product_name,
    sub.sum_sales
FROM (
    SELECT
        s.product_id,
        p.product_name,
        SUM(s.quantity_sold) AS sum_sales
    FROM
        sales s
        JOIN products p ON s.product_id = p.product_id
    GROUP BY
        s.product_id,
        p.product_name) AS sub
WHERE
    sub.sum_sales > 5;

-- 21. Write a query to select customers who have purchased products that are either in the 'Electronics' or 'Appliances' category.
SELECT
    p.product_name,
    p.category
FROM
    products p
WHERE
    p.category IN ('Electronics', 'Appliances');

-- 22. Write a query to calculate the total sales amount per product and group the result by product name.
SELECT
    p.product_name,
    SUM(s.total_amount) AS total_sales_amount
FROM
    sales s
    JOIN products p ON s.product_id = p.product_id
GROUP BY
    p.product_name;

-- 23. Write a query to join the `Sales` table with the `Customers` table and select customers who made a purchase in the year 2023.
SELECT
    c.customer_id,
    c.first_name,
    s.sale_date
FROM
    sales s
    JOIN customers c ON s.customer_id = c.customer_id
WHERE
    EXTRACT(YEAR FROM s.sale_date) = '2023';

-- 24. Write a query to find the customers with the highest total sales in 2023.
SELECT
    s.customer_id,
    sum(s.total_amount) AS total_sales
FROM
    sales s
WHERE
    EXTRACT(YEAR FROM s.sale_date) = 2023
GROUP BY
    s.customer_id
ORDER BY
    total_sales DESC
LIMIT 1;

-- 25. Write a query to join the `Products` and `Sales` tables and select the most expensive product sold.
SELECT
    p.product_id,
    p.product_name,
    p.price
FROM
    products p
    JOIN sales s ON p.product_id = s.product_id
ORDER BY
    p.price DESC
LIMIT 1;

-- 26. Write a query to find the total number of customers who have purchased products worth more than 500.
SELECT
    count(DISTINCT customer_id) AS total_customers
FROM
    sales s
WHERE
    total_amount > 500;

-- 27. Write a query to join the `Products`, `Sales`, and `Customers` tables and find the total number of sales made by customers who are in the 'Gold' membership tier.
SELECT
    c.customer_id,
    count(s.sale_id) AS total_sales
FROM
    products p
    JOIN sales s ON p.product_id = s.product_id
    JOIN customers c ON c.customer_id = s.customer_id
WHERE
    c.membership_status = 'Gold'
GROUP BY
    c.customer_id;

-- 28. Write a query to join the `Products` and `Inventory` tables and find all products that have low stock (less than 10).
SELECT
    p.product_id,
    p.product_name,
    i.stock_quantity
FROM
    products p
    JOIN inventory i ON p.product_id = i.product_id
WHERE
    p.stock_quantity < 10;

-- 29. Write a query to find customers who have purchased more than 5 products and show the total quantity of products they have bought.
SELECT
    s.customer_id,
    sum(s.quantity_sold) AS total_product
FROM
    sales s
GROUP BY
    s.customer_id
HAVING
    SUM(s.quantity_sold) > 5;

-- 30. Write a query to find the average quantity sold per product.
SELECT
    s.product_id,
    round(avg(s.quantity_sold), 2) avg_quantity_sold
FROM
    sales s
GROUP BY
    s.product_id;

-- 31. Write a query to find the number of sales made in the month of December 2023.
SELECT
    s.customer_id,
    count(*) AS sales_month_dec_2023
FROM
    sales s
WHERE
    s.sale_date BETWEEN '2023-12-01' AND '2023-12-31'
GROUP BY
    s.customer_id;

-- 32. Write a query to find the total amount spent by each customer in 2023 and list the customers in descending order.
SELECT
    s.customer_id,
    SUM(s.total_amount) AS total_spent
FROM
    sales s
WHERE
    s.sale_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY
    s.customer_id
ORDER BY
    total_spent DESC;

-- 33. Write a query to find all products that have been sold but have less than 5 units left in stock.
SELECT
    *
FROM
    inventory i;

SELECT
    *
FROM
    products p;

SELECT
    p.product_id,
    p.product_name,
    p.stock_quantity,
    (p.stock_quantity - SUM(s.quantity_sold)) AS remaining_stock
FROM
    products p
    JOIN sales s ON p.product_id = s.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.stock_quantity
HAVING (p.stock_quantity - SUM(s.quantity_sold)) < 5;

-- 34. Write a query to find the total sales for each product and order the result by the highest sales.
SELECT
    p.product_id,
    p.product_name,
    SUM(s.total_amount) AS total_sales
FROM
    sales s
    JOIN products p ON s.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY
    total_sales DESC;

-- 35. Write a query to find all customers who bought products within 7 days of their registration date.
SELECT
    c.customer_id,
    c.registration_date,
    s.sale_date
FROM
    customers c
    JOIN sales s ON c.customer_id = s.customer_id
WHERE
    s.sale_date - c.registration_date BETWEEN 0 AND 7;

-- 36. Write a query to join the `Sales` table with the `Products` table and filter the results by products priced between 100 and 500.
SELECT
    p.product_name,
    p.price
FROM
    sales s
    JOIN products p ON s.product_id = p.product_id
WHERE
    p.price BETWEEN 100 AND 500;

-- 37. Write a query to find the most frequent customer who made purchases from the `Sales` table.
SELECT
    s.customer_id,
    count(*) AS purchase_count
FROM
    sales s
GROUP BY
    s.customer_id
ORDER BY
    purchase_count DESC
LIMIT 1;

-- 38. Write a query to find the total quantity of products sold per customer.
SELECT
    s.customer_id,
    SUM(s.quantity_sold) AS total_quantity_sold
FROM
    sales s
GROUP BY
    s.customer_id;

-- 39. Write a query to find the products with the highest stock and lowest stock, and display them together in a single result set.
SELECT
    'highest_stock' AS category,
    p.product_name,
    p.product_id,
    p.stock_quantity
FROM
    products p
WHERE
    p.stock_quantity = (
        SELECT
            MAX(stock_quantity)
        FROM
            products)
UNION ALL
SELECT
    'lowest_stock' AS category,
    p.product_name,
    p.product_id,
    p.stock_quantity
FROM
    products p
WHERE
    p.stock_quantity = (
        SELECT
            MIN(stock_quantity)
        FROM
            products);

-- 40. Write a query to find products whose names contain the word 'Phone' and their total sales.
SELECT
    p.product_name,
    p.product_id,
    SUM(s.quantity_sold) AS total_quantity_sold,
    SUM(s.total_amount) AS total_amount
FROM
    products p
    JOIN sales s ON p.product_id = s.product_id
WHERE
    p.product_name LIKE ('%phone%')
GROUP BY
    p.product_name,
    p.product_id;

-- 41. Write a query to perform an `INNER JOIN` between `Customers` and `Sales`, then display the total sales amount and the product names for customers in the 'Gold' membership status.
SELECT
    p.product_id,
    p.product_name,
    SUM(s.total_amount) AS total_sale_amount
FROM
    customers c
    JOIN sales s ON c.customer_id = s.customer_id
    JOIN products p ON s.product_id = p.product_id
WHERE
    c.membership_status = 'Gold'
GROUP BY
    p.product_id,
    p.product_name;

-- 42. Write a query to find the total sales of products by category.
SELECT
    p.category,
    SUM(s.total_amount) AS total_sales
FROM
    sales s
    JOIN products p ON s.product_id = p.product_id
GROUP BY
    p.category;

-- 43. Write a query to join the `Products` table with the `Sales` table, and calculate the total sales for each product, grouped by month and year.
SELECT
    p.product_id,
    EXTRACT(month FROM s.sale_date) AS sale_month,
    EXTRACT(YEAR FROM s.sale_date) AS sale_year,
    SUM(s.total_amount) AS total_sales
FROM
    products p
    JOIN sales s ON p.product_id = s.product_id
GROUP BY
    p.product_id,
    sale_month,
    sale_year
ORDER BY
    p.product_id,
    sale_year,
    sale_month;

-- 44. Write a query to join the `Sales` and `Inventory` tables and find products that have been sold but still have stock remaining.
SELECT
    s.product_id,
    SUM(s.quantity_sold) AS total_sold,
    i.stock_quantity,
    (i.stock_quantity - sum(s.quantity_sold)) AS remaining_stock
FROM
    sales s
    JOIN inventory i ON s.product_id = i.product_id
GROUP BY
    s.product_id,
    i.stock_quantity
HAVING
    i.stock_quantity > SUM(s.quantity_sold);

-- 45. Write a query to find the top 5 customers who have made the highest purchases.
SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS full_name,
    SUM(s.total_amount) AS total_purchases
FROM
    customers c
    JOIN sales s ON c.customer_id = s.customer_id
GROUP BY
    c.customer_id,
    full_name
ORDER BY
    total_purchases DESC
LIMIT 5;

-- 46. Write a query to calculate the total number of unique products sold in 2023.
SELECT
    count(DISTINCT p.product_id) AS unique_product_sold_2023
FROM
    products p
    JOIN sales s ON p.product_id = s.product_id
WHERE
    extract(YEAR FROM s.sale_date) = 2023
    -- 47. Write a query to find the products that have not been sold in the last 6 months.
    SELECT
        p.product_id,
        p.product_name
    FROM
        products p
    WHERE
        p.product_id NOT IN (
            SELECT
                s.product_id
            FROM
                sales s
            WHERE
                s.sale_date >= (
                    SELECT
                        MAX(sale_date)
                    FROM
                        sales s2) - INTERVAL '6 months');

-- 48. Write a query to select the products with a price range between $200 and $800, and find the total quantity sold for each.
SELECT
    p.product_id,
    p.product_name,
    p.price,
    sum(s.quantity_sold) AS total_sold
FROM
    products p
    JOIN sales s ON p.product_id = s.product_id
WHERE
    p.price BETWEEN 200 AND 800
GROUP BY
    p.product_id,
    p.product_name,
    p.price;

-- 49. Write a query to find the customers who spent the most money in the year 2023.
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(s.total_amount) AS total_purchase
FROM
    customers c
    JOIN sales s ON c.customer_id = s.customer_id
WHERE
    EXTRACT(YEAR FROM s.sale_date) = 2023
GROUP BY
    c.customer_id,
    c.last_name
ORDER BY
    total_purchase DESC
LIMIT 1;

-- 50. Write a query to select the products that have been sold more than 100 times and have a price greater than 200.
SELECT
    p.product_id,
    p.product_name,
    sum(s.quantity_sold)
FROM
    products p
    JOIN sales s ON p.product_id = s.product_id
WHERE
    p.price > 200
GROUP BY
    p.product_id,
    p.product_name
HAVING
    SUM(s.quantity_sold) > 100;

