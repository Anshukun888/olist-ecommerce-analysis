# 🛒 Olist Brazilian E-commerce Sales Analysis

![Excel](https://img.shields.io/badge/Excel-Data%20Cleaning%20%26%20Transformation-217346?style=flat&logo=microsoftexcel&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-Database%20Management-4479A1?style=flat&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Data%20Analysis-CC2927?style=flat&logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?style=flat&logo=powerbi&logoColor=black)
![Data Source](https://img.shields.io/badge/Data%20Source-Kaggle-20BEFF?style=flat&logo=kaggle&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-1D9E75?style=flat)

An end-to-end data analytics project analyzing Brazilian e-commerce operations using the Olist dataset. The project follows a complete BI workflow including data cleaning in Excel Power Query, relational database modeling in MySQL, SQL-based business analysis, and interactive Power BI dashboard development.

---

## 📊 Dashboard Preview

### Executive Overview
![Executive Overview](visuals/Executive%20Overview.png)

### Revenue & Product Performance
![Revenue & Product Performance](visuals/Revenue%20%26%20Product%20Performance.png)

### Customer Behavior
![Customer Behavior](visuals/Customer%20Behavior.png)

### Delivery & Operations
![Delivery & Operations](visuals/Delivery%20%26%20Operations.png)

---

## 🎯 Business Context

Olist management wants to understand overall sales performance, customer purchasing behavior, delivery efficiency, payment preferences, and product category performance to improve operational efficiency and customer satisfaction.

**Role:** Data Analyst  
**Tools:** Microsoft Excel · MySQL · SQL · Power BI · DAX

---

## 💡 Key Findings

| # | Insight | Finding |
|---|---------|---------|
| 1 | Revenue Growth Trend | Sales performance showed strong seasonal spikes during major shopping periods |
| 2 | Delivery Performance | Late delivery rates increased significantly in certain regions and product categories |
| 3 | Top Product Categories | Bed Bath Table, Health Beauty, and Sports Leisure generated the highest order volumes |
| 4 | Customer Purchasing Behavior | Most customers were one-time buyers, highlighting retention opportunities |
| 5 | Payment Preferences | Credit card transactions dominated overall payment usage across Brazil |

---

## 🔄 Project Workflow

1. Collected Olist e-commerce dataset from Kaggle  
2. Cleaned and transformed raw data using Excel Power Query  
3. Structured cleaned datasets into relational tables in MySQL  
4. Performed SQL analysis for KPIs and business questions  
5. Built interactive Power BI dashboards with DAX measures and slicers  
6. Generated insights and recommendations for business decision-making  

---

## 📁 Project Structure

```bash
Olist-Ecommerce-Analysis/
│
├── README.md
│
├── data/
│   ├── raw/
│   │   ├── olist_geolocation_dataset.csv
│   │   ├── olist_order_items_dataset.csv
│   │   ├── olist_order_payments_dataset.csv
│   │   ├── olist_order_reviews_dataset.csv
│   │   ├── olist_orders_dataset.csv
│   │   ├── olist_products_dataset.csv
│   │   ├── olist_sellers_dataset.csv
│   │   ├── product_category_name_translation.csv
│   │   └── olist_customers_dataset.csv
│   │
│   └── cleaned/
│       ├── customers_clean.csv
│       ├── order_items_clean.csv
│       ├── order_payments_clean.csv
│       ├── order_reviews_clean.csv
│       ├── orders_clean.csv
│       ├── products_clean.csv
│       ├── sellers_clean.csv
│       └── product_category_translation_clean.csv
│
├── documentation/
│   ├── project_summary.md
│   ├── business_questions.md
│   ├── data_dictionary.md
│   ├── data_model.md
│   └── insights_report.md
│
├── Excel_data_clean/
│   ├── customers_clean.csv
│   ├── order_items_clean.csv
│   ├── order_payments_clean.csv
│   ├── order_reviews_clean.csv
│   ├── orders_clean.csv
│   ├── products_clean.csv
│   ├── sellers_clean.csv
│   └── product_category_translation_clean.csv
│
├── powerbi_dashboard/
│   └── olist_dashboard.pbix
│
├── sql/
│   ├── schema.sql
│   └── analysis_queries.sql
│
├── visuals/
│   ├── Executive Overview.png
│   ├── Revenue & Product Performance.png
│   ├── Customer Behavior.png
│   └── Delivery & Operations.png
│
└── README.md
```

---

## 📑 SQL Analysis Coverage

The SQL analysis answered multiple business questions including:

- Total revenue and order trends
- Top-performing product categories
- Average delivery time analysis
- Late delivery rate calculation
- Customer purchase frequency
- Seller performance analysis
- Payment method distribution
- Regional sales performance

---

## 📈 Power BI Dashboard — Page Guide

### Page 1 — Executive Overview
- KPI Cards:
  - Total Revenue
  - Total Orders
  - Average Order Value (AOV)
  - Late Delivery Rate
- Monthly Revenue Trend
- Revenue by Product Category
- Orders by Payment Type
- Regional Sales Distribution
- Interactive slicers for Year, Category, and State

---

### Page 2 — Revenue & Product Performance
- Top Product Categories by Revenue
- Revenue Contribution Analysis
- Product Category Performance Matrix
- Average Product Price by Category
- Revenue Trend by Month
- Product Sales Comparison

---

### Page 3 — Customer Behavior
- Customer Purchase Frequency
- Repeat vs One-Time Customers
- Customer Distribution by State
- Average Customer Review Score
- Customer Order Trend Analysis

---

### Page 4 — Delivery & Operations
- Average Delivery Days
- Late Delivery Rate by Category
- Delivery Performance by State
- Order Status Distribution
- Operational Efficiency Insights

---

## 📌 Skills Demonstrated

- Data Cleaning & Transformation
- Relational Data Modeling
- SQL Query Writing
- KPI Development
- DAX Calculations
- Dashboard Design
- Business Analysis
- Data Storytelling

---

## 🚀 Project Outcome

This project demonstrates the complete workflow of a real-world data analytics project — from raw data preparation to business intelligence reporting and insight generation. It highlights practical skills used by Data Analysts in e-commerce and business operations environments.
