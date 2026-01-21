# Amazon India Sales Analysis

## Overview
This project analyzes Amazon India sales transaction data containing approximately **120,000+ rows**.
The dataset represents real-world e-commerce transactions and includes significant **data quality challenges**, particularly in geographic fields.

The main objective of this project is to clean, transform, and analyze the data to generate meaningful business insights using business intelligence and analytics tools.

---

## Dataset Characteristics
- ~120,000 transaction records
- Sales data from India
- Multiple product categories and order statuses
- High data noise:
  - Thousands of city name typos
  - Inconsistent city and state naming formats
  - Mixed casing and spelling variations

This dataset closely reflects real-world messy data commonly encountered in business environments.

---

## Data Cleaning & Preparation
Data cleaning and transformation were primarily performed using **Power Query**, with a focus on practical and repeatable transformations suitable for BI workflows.

Key cleaning steps:
- Standardizing city and state names
- Handling thousands of city name typos through normalization and grouping
- Cleaning inconsistent text formats (case, spacing, spelling)
- Creating cleaned columns for analysis
- Preparing structured data for analysis and visualization

The goal of the cleaning process was not perfect normalization, but **usable and reliable analytical data**.

---

## Tools Used
- **Power BI** – Data modeling, dashboards, and KPI analysis
- **Power Query** – Data cleaning and transformation
- **SQL** – Exploratory analysis and aggregations
- **Python (Pandas, NumPy)** – Additional data inspection and preprocessing
- **Excel** – Initial data inspection and validation

---

## Key Analysis Topics
- Sales performance by state and city
- Regional order distribution
- Product category performance
- Promotion-related sales patterns
- Size-level and category-level sales insights

---

## Output
- Interactive Power BI dashboard
- Cleaned and transformed dataset
- Reusable data cleaning pipeline using Power Query

---

## Notes
This project focuses on **realistic data challenges** and practical data cleaning approaches commonly used in business intelligence workflows.
