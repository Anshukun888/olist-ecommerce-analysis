create database olist_db;
USE olist_db;
SET GLOBAL local_infile = 1;
SET FOREIGN_KEY_CHECKS = 0;
SET SESSION sql_mode = '';
USE olist_db;

CREATE TABLE customers (
    customer_id VARCHAR(50),
    customer_unique_id VARCHAR(50),
    customer_zip_code VARCHAR(10),
    customer_city VARCHAR(100),
    customer_state CHAR(2)
);

CREATE TABLE sellers (
    seller_id VARCHAR(50),
    seller_zip_code VARCHAR(10),
    seller_city VARCHAR(100),
    seller_state CHAR(2)
);

CREATE TABLE products (
    product_id VARCHAR(50),
    product_category_name VARCHAR(100),
    product_name_length INT,
    product_description_length INT,
    product_photos_qty INT,
    product_weight_g FLOAT,
    product_length_cm FLOAT,
    product_height_cm FLOAT,
    product_width_cm FLOAT
);

CREATE TABLE category_translation (
    product_category_name VARCHAR(100),
    product_category_name_english VARCHAR(100)
);

CREATE TABLE orders (
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    order_status VARCHAR(30),
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME
);

CREATE TABLE order_items (
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date DATETIME,
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2)
);

CREATE TABLE order_payments (
    order_id VARCHAR(50),
    payment_sequential INT,
    payment_type VARCHAR(30),
    payment_installments INT,
    payment_value DECIMAL(10,2)
);

CREATE TABLE order_reviews (
    review_id VARCHAR(50),
    order_id VARCHAR(50),
    review_score INT,
    review_creation_date DATETIME,
    review_answer_timestamp DATETIME
);

USE olist_db;

LOAD DATA LOCAL INFILE 'C:/Users/anshu/OneDrive/Documents/Data Analyst/Data Analyst Project/Olist E-commerce Analysis/data_clean/customers_clean.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/anshu/OneDrive/Documents/Data Analyst/Data Analyst Project/Olist E-commerce Analysis/data_clean/sellers_clean.csv'
INTO TABLE sellers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/anshu/OneDrive/Documents/Data Analyst/Data Analyst Project/Olist E-commerce Analysis/data_clean/products_clean.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/anshu/OneDrive/Documents/Data Analyst/Data Analyst Project/Olist E-commerce Analysis/data_clean/product_category_translation_clean.csv'
INTO TABLE category_translation
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/anshu/OneDrive/Documents/Data Analyst/Data Analyst Project/Olist E-commerce Analysis/data_clean/orders_clean.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, customer_id, order_status,
@purchase, @approved, @carrier, @customer, @estimated)
SET
order_purchase_timestamp = NULLIF(@purchase,''),
order_approved_at = NULLIF(@approved,''),
order_delivered_carrier_date = NULLIF(@carrier,''),
order_delivered_customer_date = NULLIF(@customer,''),
order_estimated_delivery_date = NULLIF(@estimated,'');

LOAD DATA LOCAL INFILE 'C:/Users/anshu/OneDrive/Documents/Data Analyst/Data Analyst Project/Olist E-commerce Analysis/data_clean/order_items_clean.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, order_item_id, product_id, seller_id,
@ship_date, price, freight_value)
SET
shipping_limit_date = NULLIF(@ship_date,'');

LOAD DATA LOCAL INFILE 'C:/Users/anshu/OneDrive/Documents/Data Analyst/Data Analyst Project/Olist E-commerce Analysis/data_clean/order_payments_clean.csv'
INTO TABLE order_payments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/anshu/OneDrive/Documents/Data Analyst/Data Analyst Project/Olist E-commerce Analysis/data_clean/order_reviews_clean.csv'
INTO TABLE order_reviews
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(review_id, order_id, review_score,
@skip1, @skip2,
@creation, @answer)
SET
review_creation_date = NULLIF(@creation,''),
review_answer_timestamp = NULLIF(@answer,'');

USE olist_db;

SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL
SELECT 'sellers', COUNT(*) FROM sellers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'category_translation', COUNT(*) FROM category_translation
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'order_payments', COUNT(*) FROM order_payments
UNION ALL
SELECT 'order_reviews', COUNT(*) FROM order_reviews;
