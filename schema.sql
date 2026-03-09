-- CREATE schema assignment
CREATE SCHEMA assignments;

-- CREATE Customers table in the assignment schema
CREATE TABLE assignments.Customers (
    customer_id int PRIMARY KEY,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(100),
    phone_number varchar(50),
    registration_date date,
    membership_status varchar(10)
);

-- CREATE Products table in the assigment schema
CREATE TABLE Products (
    product_id int PRIMARY KEY,
    product_name varchar(100),
    category varchar(50),
    price decimal(10, 2),
    supplier varchar(100),
    stock_quantity int
);

-- CREATE Sales table in the assignment schema
CREATE TABLE assignments.Sales (
    sale_id int PRIMARY KEY,
    customer_id int,
    product_id int,
    quantity_sold int,
    sale_date date,
    total_amount decimal(10, 2),
    FOREIGN KEY (customer_id) REFERENCES assignments.customers (customer_id),
    FOREIGN KEY (product_id) REFERENCES assignments.products (product_id)
);

-- CREATE Inventory table in the assignment schema
CREATE TABLE assignments.inventory (
    product_id int PRIMARY KEY,
    stock_quantity int,
    FOREIGN KEY (product_id) REFERENCES assignments.Products (product_id)
);


