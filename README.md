# 🛒 Olist E-commerce Sales Analysis (Brazil)
An end-to-end data analytics project analyzing Brazilian e-commerce transactions from the Olist dataset. The project follows a full BI workflow: data cleaning in Excel, data modeling in MySQL, SQL-based analysis, and Power BI dashboard development.

---

## 📊 Dashboard Preview


---

## 🎯 Business Context

The objective of this project is to analyze e-commerce operations to understand:
- Sales performance trends
- Customer purchasing behavior
- Delivery efficiency
- Product category performance
- Payment method usage

---

## 🛠️ Tools & Technologies Used

- Microsoft Excel (Power Query) – Data Cleaning & Transformation  
- MySQL – Database Management & Data Modeling  
- SQL – Data Analysis & KPI Extraction  
- Power BI – Dashboard Development  
- DAX – KPI Calculations  

---

## 🔄 Project Workflow

1. Collected dataset from Kaggle  
2. Cleaned and transformed data using Excel Power Query  
3. Structured data into relational format in MySQL  
4. Performed SQL analysis on sales, customers, and delivery  
5. Built interactive Power BI dashboard with KPIs and insights  

---



---

## 📁 Project Structure
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
│       ├── customers_clean.csv
│       ├── order_items_clean.csv
│       ├── order_payments_clean.csv
│       ├── order_reviews_clean.csv
│       ├── orders_clean.csv
│       ├── products_clean.csv
│       ├── sellers_clean.csv
│       └── product_category_translation_clean.csv
│   
├── powerbi_dashboard/
│   └── olist_dashboard.pbix
│
├── sql/
│   ├── schema.sql
│   └── analysis_queries.sql
│
└── visuals/
    ├── overview.png
    ├── category_analysis.png
    ├── revenue_analysis.png
    ├── delivery_analysis.png
    └── customer_analysis.png
