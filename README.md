# Olist Brazilian E-commerce Analysis

![Excel](https://img.shields.io/badge/Excel-Data%20Cleaning%20%26%20Transformation-217346?style=flat&logo=microsoftexcel&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-Database%20Management-4479A1?style=flat&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Data%20Analysis-CC2927?style=flat&logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?style=flat&logo=powerbi&logoColor=black)
![Data Source](https://img.shields.io/badge/Data%20Source-Kaggle-20BEFF?style=flat&logo=kaggle&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-1D9E75?style=flat)

An end-to-end data analytics project analyzing two years of Brazilian e-commerce operations using the Olist dataset (2016 to 2018). The project follows a complete business intelligence workflow: data cleaning in Excel Power Query, relational database modeling in MySQL, SQL-based KPI analysis, and a 4-page interactive Power BI dashboard.

---

## Dashboard Preview

### Page 1: Executive Overview
![Executive Overview](visuals/Executive%20Overview.png)

### Page 2: Revenue & Product Performance
![Revenue & Product Performance](visuals/Revenue%20%26%20Product%20Performance.png)

### Page 3: Customer Behavior
![Customer Behavior](visuals/Customer%20Behavior.png)

### Page 4: Delivery & Operations
![Delivery & Operations](visuals/Delivery%20%26%20Operations.png)

---

## Business Scenario

Olist is a Brazilian e-commerce marketplace connecting small and medium sellers to customers across all 27 states. Heading into late 2018, leadership raised concerns about slowing growth, rising delivery delays in certain regions, low customer return rates, and inconsistent product quality signals.

As the Data Analyst on the BI team, the task was to analyze two years of transaction data and surface findings to guide Olist's 2019 growth strategy.

**Role:** Data Analyst
**Tools:** Microsoft Excel, MySQL, SQL, Power BI, DAX
**Dataset:** Olist Brazilian E-commerce (Kaggle), 96,000+ delivered orders across 8 relational tables

---

## Key Findings

| Area | Finding |
|---|---|
| Revenue & Growth | Total revenue reached 15.42M BRL with 212% YoY order growth. SP state alone contributed over 40% of platform revenue. Revenue showed strong growth through mid-2018 before plateauing. |
| Product Performance | Health beauty led all categories at 1.42M BRL despite not having the highest order volume. Bed bath table had the most orders (9,272) but the lowest review score (4.00) among top 5 categories, signaling a delivery quality risk. |
| Customer Retention | 96.88% of customers never returned after their first purchase. Only 3K out of 96K customers made a repeat purchase. Repeat purchase rate of 3.12% indicates a critical retention problem despite healthy revenue numbers. |
| Delivery & Logistics | Average delivery time was 12.41 days with an 8.11% late delivery rate nationally. Alagoas had the highest late delivery rate at over 20%, nearly double the national average. Northern and northeastern states consistently underperformed on delivery. |
| Satisfaction | States with higher average delivery days showed lower review scores, confirming a direct link between logistics performance and customer satisfaction. |

---

## Recommendations

1. **Retention strategy:** Introduce post-purchase re-engagement campaigns targeting first-time buyers. A loyalty discount on second purchases could directly address the 96.88% churn rate.
2. **Regional logistics:** Prioritize carrier partnerships and fulfillment infrastructure in Alagoas, Maranhao, and Piaui. Even a 20% improvement in on-time delivery in those states would lift review scores and repeat purchase probability.
3. **Category quality:** Bed bath table generates high volume but has the lowest satisfaction score among top categories. Investigate seller quality and delivery handling for this category specifically.
4. **Revenue diversification:** SP state driving 40%+ of revenue represents a concentration risk. Targeted seller recruitment and buyer promotions in MG, RJ, and RS could reduce this dependency.

---

## Project Workflow

1. Downloaded Olist dataset from Kaggle (8 CSV files, 100K+ rows)
2. Cleaned and transformed all 8 tables using Excel Power Query (handled nulls, standardized date formats, removed duplicates)
3. Designed relational schema and loaded cleaned data into MySQL using LOAD DATA LOCAL INFILE
4. Wrote 16 SQL queries covering revenue trends, category performance, delivery analysis, and customer retention (including CTEs, window functions, and DATEDIFF calculations)
5. Connected Power BI to MySQL via ODBC driver, built data model with 7 relationships and a DateTable
6. Created 20+ DAX measures and a 4-page interactive dashboard with slicers, conditional formatting, and insight text boxes
7. Documented findings and recommendations

---

## SQL Analysis Highlights

| Query | Technique Used |
|---|---|
| Monthly revenue trend | DATE_FORMAT, SUM, GROUP BY |
| Month over month growth rate | CTE, LAG window function |
| Top 10 categories by revenue | DENSE_RANK, GROUP BY |
| Late delivery flag and rate | CASE WHEN, DATEDIFF |
| Late delivery rate by state | JOIN, GROUP BY, CASE WHEN |
| Review score vs delivery status | JOIN, AVG, GROUP BY |
| Repeat purchase rate | CTE, COUNT DISTINCT, HAVING |
| Year over year retention rate | CTE, MAX CASE WHEN, DIVIDE |

Full queries available in `sql/analysis_queries.sql`

---

## DAX Measures

Key measures built in Power BI:

- Total Revenue, Total Orders, AOV
- Late Delivery Rate, On-Time Delivery Rate, Avg Delivery Days
- Churn Rate, Repeat Purchase Rate, Repeat Customers
- MoM Revenue Growth, YoY Revenue Growth
- Customer Lifetime Value, Revenue Per Customer
- Category Revenue Share, Cancellation Rate

Full measures available in the .pbix file.

---

## Dashboard Pages

**Page 1: Executive Overview**
KPI cards with vs prior year comparisons, monthly revenue trend, orders trend, top 5 states by revenue, filled map of revenue by state, year slicer.

**Page 2: Revenue & Product Performance**
Top 10 categories by revenue, top 10 seller cities by revenue, performance matrix table with conditional formatting showing revenue, review score, delivery days and late delivery rate per category.

**Page 3: Customer Behavior**
Churn rate, repeat customers, repeat purchase rate, cancellation rate cards. Churned vs returning customers donut chart, review score distribution, avg delivery days vs avg review score scatter plot by state.

**Page 4: Delivery & Operations**
Avg delivery days, on-time delivery rate, late delivery rate cards. Late delivery rate by state bar chart, avg delivery days trend by month, filled map of avg delivery days by state.

---

## Project Structure

```
Olist-Ecommerce-Analysis/
│
├── README.md
│
├── data/
│   ├── raw/                          # Original Kaggle CSV files
│   └── cleaned/                      # Excel Power Query cleaned files
│
├── sql/
│   ├── schema.sql                    # Database creation and data loading
│   └── analysis_queries.sql          # All 16 analysis queries
│
├── powerbi_dashboard/
│   └── olist_dashboard.pbix          # Full Power BI dashboard file
│
├── visuals/
│   ├── Executive Overview.png
│   ├── Revenue & Product Performance.png
│   ├── Customer Behavior.png
│   └── Delivery & Operations.png
│
└── documentation/
    ├── business_questions.md
    ├── data_dictionary.md
    └── insights_report.md
```

---

## Skills Demonstrated

Data cleaning and transformation, relational data modeling, SQL query writing (joins, CTEs, window functions, aggregations), KPI development, DAX calculations, Power BI dashboard design, business analysis, data storytelling.

---

## About

**Anshu Kunwar**
[GitHub](https://github.com/Anshukun888) · [LinkedIn](https://linkedin.com/in/anshu-kunwar02) · anshukun777@gmail.com
