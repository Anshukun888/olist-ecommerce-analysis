use olist_db;

-- Revenue & Orders by Month
-- Total Revenue and Total Orders by Month.
SELECT 
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    ROUND(SUM(op.payment_value), 2) AS total_revenue,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
JOIN order_payments op
    ON o.order_id = op.order_id
WHERE o.order_status = 'delivered'
GROUP BY month
ORDER BY month;


--  Average Order Value by Month
SELECT  
    DATE_FORMAT(o.order_purchase_timestamp,'%Y-%m') AS month,
    ROUND(
        SUM(op.payment_value) /
        COUNT(DISTINCT o.order_id), 2
    ) AS average_order_value
FROM order_payments op
JOIN orders o
    ON op.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY month
ORDER BY month;
 
 -- Total Revenue by Customer State
 SELECT 
	ROUND(
    SUM(op.payment_value),2
    ) AS total_revenue,
    c.customer_state
FROM orders o
JOIN order_payments AS op
	ON o.order_id=op.order_id
JOIN customers c
	ON o.customer_id=c.customer_id
WHERE o.order_status= 'delivered'
GROUP BY c.customer_state
ORDER BY total_revenue DESC;

-- Month over Month Revenue Growth Rate
WITH monthly_revenue AS (
    SELECT
        DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
        ROUND(SUM(op.payment_value), 2) AS total_revenue
    FROM  orders o
    JOIN order_payments op
		ON o.order_id=op.order_id
    WHERE o.order_status= 'delivered'
    GROUP BY month
)
SELECT
    month,
    total_revenue,
    LAG(total_revenue) OVER (ORDER BY month) AS last_month_revenue,
    ROUND(
        (total_revenue - LAG(total_revenue) OVER (ORDER BY month)) 
        / LAG(total_revenue) OVER (ORDER BY month) * 100
    , 2) AS mom_growth_rate
FROM monthly_revenue
ORDER BY month;



-- Product Category Performance

-- Revenue and Orders by Category
WITH clean_payments AS (
    SELECT order_id, SUM(payment_value) AS total_paid
    FROM order_payments
    GROUP BY order_id
),
clean_orders AS (
    SELECT DISTINCT oi.order_id, ct.product_category_name_english
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    JOIN category_translation ct ON p.product_category_name = ct.product_category_name
)
SELECT 
    co.product_category_name_english,
    ROUND(SUM(cp.total_paid), 2) AS total_revenue,
    COUNT(DISTINCT co.order_id) AS total_orders
FROM clean_orders co
JOIN orders o ON co.order_id = o.order_id
JOIN clean_payments cp ON co.order_id = cp.order_id
WHERE o.order_status = 'delivered'
GROUP BY co.product_category_name_english
ORDER BY total_revenue DESC;

-- OR
SELECT 
	ct.product_category_name_english,
	ROUND(
	SUM(op.payment_value),2
	) as total_revenue,
	COUNT(DISTINCT o.order_id) as total_orders
FROM orders o
JOIN order_items oi
	ON o.order_id=oi.order_id
JOIN products p
	ON oi.product_id=p.product_id
JOIN  category_translation ct
	ON p.product_category_name=ct.product_category_name
JOIN (
	SELECT 
		order_id,
		payment_value
    FROM order_payments) AS op
	ON o.order_id=op.order_id
WHERE o.order_status= 'delivered'
GROUP BY ct.product_category_name_english
ORDER BY total_revenue DESC;


-- Average Review Score by Category
WITH clean_orders AS (
    SELECT DISTINCT oi.order_id, ct.product_category_name_english
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    JOIN category_translation ct ON p.product_category_name = ct.product_category_name
),
clean_reviews AS (
    SELECT order_id, AVG(review_score) AS review_score
    FROM order_reviews
    GROUP BY order_id
)
SELECT 
    co.product_category_name_english,
    COUNT(DISTINCT co.order_id) AS total_orders,
    ROUND(AVG(cr.review_score), 2) AS avg_review_score
FROM clean_orders co
JOIN orders o ON co.order_id = o.order_id
JOIN clean_reviews cr ON co.order_id = cr.order_id
WHERE o.order_status = 'delivered'
GROUP BY co.product_category_name_english
ORDER BY avg_review_score DESC;
    	
-- OR
SELECT
	ct.product_category_name_english,
	COUNT(DISTINCT o.order_id) as total_orders,
    ROUND(AVG(orv.review_score), 2) AS avg_review_score
FROM orders o
JOIN order_items oi
	ON o.order_id=oi.order_id
JOIN products p
	ON oi.product_id=p.product_id
JOIN category_translation ct
		ON p.product_category_name=ct.product_category_name
JOIN (
    -- Step: ensure 1 review per order (removes duplication bias)
    SELECT
        order_id,
        review_score
    FROM order_reviews
) orv
	ON o.order_id = orv.order_id
WHERE o.order_status= 'delivered'
GROUP BY ct.product_category_name_english
ORDER BY avg_review_score DESC;
    
	
    
-- Top 10 Categories by Revenue
WITH clean_payments AS (
    SELECT order_id, SUM(payment_value) AS total_paid
    FROM order_payments
    GROUP BY order_id
),
clean_orders AS (
    SELECT DISTINCT oi.order_id, ct.product_category_name_english
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    JOIN category_translation ct ON p.product_category_name = ct.product_category_name
)
SELECT 
    co.product_category_name_english,
    ROUND(SUM(cp.total_paid), 2) AS total_revenue,
    COUNT(DISTINCT co.order_id) AS total_orders
FROM clean_orders co
JOIN orders o ON co.order_id = o.order_id
JOIN clean_payments cp ON co.order_id = cp.order_id
WHERE o.order_status = 'delivered'
GROUP BY co.product_category_name_english
ORDER BY total_revenue DESC
LIMIT 10;

-- Delivery & Logistics Issues

-- Late delivery flag per order, then overall late delivery rate
SELECT 
	order_id,
    CASE
		WHEN order_delivered_customer_date <= order_estimated_delivery_date
			THEN 'on-time'
        ELSE 'late'
	END AS delivery_status
FROM orders
WHERE order_delivered_customer_date IS NOT NULL AND order_status= 'delivered';

SELECT 
    ROUND(100.0* SUM(
		    CASE
			WHEN order_delivered_customer_date > order_estimated_delivery_date
				THEN 1
			ELSE 0
		END
		) / count(*) ,2)late_delivery_rate_percent
FROM orders
WHERE order_delivered_customer_date IS NOT NULL AND order_status= 'delivered';


-- Average delivery time by state
SELECT 
	c.customer_state AS state,
    ROUND(
		AVG(
            DATEDIFF(
                o.order_delivered_customer_date,
                o.order_purchase_timestamp
            )
        ),2) AS avg_delivery_days
FROM customers c
JOIN orders o
	ON c.customer_id=o.customer_id
WHERE o.order_delivered_customer_date IS NOT NULL AND o.order_status= 'delivered'
GROUP BY  c.customer_state
ORDER BY avg_delivery_days DESC;
    
    
-- Review score vs delivery status (late vs on time)
SELECT 
	ROUND(AVG(orv.review_score),2) as avg_review_score,
    CASE
		WHEN order_delivered_customer_date <= order_estimated_delivery_date
        THEN 'on-time'
        ELSE 'late'
	END AS delivery_status
FROM orders o
JOIN order_reviews as orv
	ON o.order_id=orv.order_id
WHERE o.order_delivered_customer_date IS NOT NULL AND o.order_status= 'delivered'
GROUP BY delivery_status
ORDER BY avg_review_score DESC;
    


--  Delivery delay vs satisfaction at state level

-- Late delivery rate by state, ordered worst to best
SELECT 
	c.customer_state as state,
    ROUND(100.0* SUM(
		    CASE
			WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date
				THEN 1
			ELSE 0
		END
		) / count(*) ,2)late_delivery_rate_percent
FROM orders o
JOIN customers c
	ON o.customer_id=c.customer_id
WHERE order_delivered_customer_date IS NOT NULL AND order_status= 'delivered'
GROUP BY c.customer_state
ORDER BY late_delivery_rate_percent DESC;

-- Average review score by state, ordered worst to best		
with each_state AS(
	SELECT 
		o.order_id,
		o.order_delivered_customer_date,
		c.customer_state as state
	FROM customers c
    JOIN orders o
		ON c.customer_id=o.customer_id
	WHERE o.order_delivered_customer_date IS NOT NULL AND o.order_status= 'delivered'
        )
SELECT 
	ec.state,
	ROUND(AVG(orv.review_score),2) as avg_review_score
FROM each_state ec
JOIN order_reviews as orv
	ON ec.order_id=orv.order_id
GROUP BY state
ORDER BY avg_review_score ASC;
    


-- Customer Retention & Churn

-- Repeat Purchase Rate
WITH customer_orders AS (
    SELECT 
        c.customer_unique_id,
        COUNT(o.order_id) AS total_orders
    FROM orders o
    JOIN customers c 
        ON o.customer_id = c.customer_id
    GROUP BY c.customer_unique_id
)
SELECT 
    ROUND(
        100.0 * SUM(CASE WHEN total_orders > 1 THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS repeat_purchase_rate
FROM customer_orders;

-- Customer Retention Rate
WITH yearly_activity AS (
    SELECT 
        c.customer_unique_id,
        YEAR(o.order_purchase_timestamp) AS order_year
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    GROUP BY 
        c.customer_unique_id,
        YEAR(o.order_purchase_timestamp)
),

customer_flags AS (
    SELECT 
        customer_unique_id,

        MAX(CASE WHEN order_year = 2017 THEN 1 ELSE 0 END) AS bought_2017,
        MAX(CASE WHEN order_year = 2018 THEN 1 ELSE 0 END) AS bought_2018

    FROM yearly_activity
    GROUP BY customer_unique_id
)

SELECT 
    COUNT(CASE WHEN bought_2017 = 1 THEN 1 END) AS customers_2017,
    COUNT(CASE WHEN bought_2017 = 1 AND bought_2018 = 1 THEN 1 END) AS retained_customers,

    ROUND(
        100.0 * COUNT(CASE WHEN bought_2017 = 1 AND bought_2018 = 1 THEN 1 END)
        / COUNT(CASE WHEN bought_2017 = 1 THEN 1 END),
        2
    ) AS retention_rate_2017_to_2018
FROM customer_flags; 

-- Churn Classification
WITH customer_orders AS (
    SELECT 
        customer_id,
        COUNT(order_id) AS total_orders
    FROM orders
    GROUP BY customer_id
)

SELECT 
    CASE 
        WHEN total_orders = 1 THEN 'Churned'
        ELSE 'Retained'
    END AS customer_status,
    COUNT(*) AS customer_count
FROM customer_orders
GROUP BY customer_status;

-- Avg Orders per Customer
SELECT 
    ROUND(
        COUNT(o.order_id) * 1.0 
        / COUNT(DISTINCT c.customer_unique_id),
        2
    ) AS avg_orders_per_customer
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id;
    
    

