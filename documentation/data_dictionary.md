# Data Dictionary

Dataset: Olist Brazilian E-commerce Dataset  
Source: Kaggle  
Scale: ~100,000+ orders  
Tools Used: Excel, MySQL  

## Orders Table
| Column | Type | Description |
|--------|------|-------------|
| order_id | String | Unique order identifier |
| customer_id | String | Customer reference ID |
| order_status | String | Status of order |
| order_purchase_timestamp | Datetime | Order placement time |
| order_delivered_customer_date | Datetime | Delivery date |
| order_estimated_delivery_date | Datetime | Estimated delivery date |

## Customers Table
| Column | Type | Description |
|--------|------|-------------|
| customer_id | String | Customer ID |
| customer_unique_id | String | Unique customer reference |
| customer_city | String | Customer city |
| customer_state | String | Customer state |

## Order Items Table
| Column | Type | Description |
|--------|------|-------------|
| order_id | String | Order ID |
| product_id | String | Product ID |
| seller_id | String | Seller ID |
| price | Decimal | Product price |
| freight_value | Decimal | Shipping cost |

## Payments Table
| Column | Type | Description |
|--------|------|-------------|
| order_id | String | Order ID |
| payment_type | String | Payment method |
| payment_value | Decimal | Payment amount |
| payment_installments | Integer | Installments used |

## Products Table
| Column | Type | Description |
|--------|------|-------------|
| product_id | String | Product ID |
| product_category_name | String | Product category |
| product_weight_g | Integer | Weight |

## Sellers Table
| Column | Type | Description |
|--------|------|-------------|
| seller_id | String | Seller ID |
| seller_city | String | City |
| seller_state | String | State |

## Reviews Table
| Column | Type | Description |
|--------|------|-------------|
| review_id | String | Review ID |
| order_id | String | Order reference |
| review_score | Integer | Rating (1–5) |
| review_comment_message | Text | Customer feedback |