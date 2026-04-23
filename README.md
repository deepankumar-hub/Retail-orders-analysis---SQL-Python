# Retail-orders-analysis---SQL-Python

##  Project Overview

This project focuses on building an end-to-end ETL (Extract, Transform, Load) pipeline for analyzing retail orders data. The dataset was extracted from Kaggle using the Kaggle API, cleaned and transformed using Python (Pandas), and then loaded into MySQL for structured storage and SQL-based business analysis.

The objective of this project is to derive actionable insights related to sales performance, product demand, regional trends, and monthly business growth using data analytics techniques.

## Tech Stack

Python
Pandas
SQLAlchemy
MySQL
SQL
Jupyter Notebook

## Project Workflow
### 1. Extract (E)
Connected to Kaggle API to download the retail orders dataset.
Extracted compressed dataset files.
Loaded raw CSV data into Pandas DataFrame for processing.
### 2. Transform (T)
Performed data cleaning and preprocessing tasks such as:

Handled missing values and inconsistent entries.
Standardized column names for SQL compatibility.
Converted date columns into proper datetime format.
Removed unnecessary columns.
Created derived business metrics:
Discount Amount
Sale Price
Profit
Ensured dataset readiness for SQL loading.
### 3. Load (L)
Established connection between Python and MySQL using SQLAlchemy.
Loaded transformed dataset into MySQL database table for querying and analytics.
SQL Analysis Performed

## Sales & Product Insights
Top 10 highest revenue generating products.
Top selling products by region.
Category-wise and sub-category-wise sales performance.
## Regional Insights
Sales comparison across East, West, South, and Central regions.
Identification of best-performing regions.
## Time Series Insights
Monthly sales trends.
Year-over-Year (YoY) growth analysis.
Highest sales month for each category.
## Profitability Insights
Profit contribution by category.
Impact of discounts on profitability.
