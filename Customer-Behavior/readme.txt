```markdown
# Customer Behavior Analytics & Segmentation

An end-to-end data analytics project evaluating customer transaction histories, spending behavior, retention risk, and demographic drivers using an integrated workflow of Excel, Python, PostgreSQL, and Business Intelligence dashboards.

---

## Workflow Architecture

```mermaid
flowchart LR
    A[Raw CSV Dataset\nDelimiter: ';'] --> B[Phase 1: Excel\nFeature Engineering: Spender Group]
    B --> C[Phase 2: Python / Pandas\nCleaning, Scaling, Imputation, IQR]
    C --> D[(Phase 3: PostgreSQL\nEDA, Window Functions, Segmentation)]
    D --> E[Phase 4: BI Dashboard\nExecutive & Retention Reporting]

```

---

## Tech Stack

* **Data Ingestion & Feature Engineering:** Microsoft Excel
* **Data Cleaning & Preprocessing:** Python (Pandas, NumPy)
* **Analytical Querying & Modeling:** PostgreSQL (Window Functions, CTEs, Aggregations)
* **Visualization & Reporting:** Power BI / Excel Dashboard
* **Version Control:** Git, GitHub

---

## Dataset Schema

The primary dataset consists of 350 customer records across 11 core attributes:

| Column Name | Data Type | Description |
| --- | --- | --- |
| `Customer ID` | Integer | Unique identifier for each customer |
| `Age` | Integer | Customer age |
| `Gender` | String | Customer biological sex (Male, Female, Unknown) |
| `City` | String | City of residence |
| `Membership Type` | String | Loyalty tier (Bronze, Silver, Gold) |
| `Total Spend` | Float | Total lifetime expenditure |
| `Items Purchased` | Integer | Total units purchased |
| `Average Rating` | Float | Average satisfaction score |
| `Satisfaction Level` | String | Customer satisfaction status |
| `Days Since Last Purchase` | Integer | Inactivity period in days |
| `Discount Applied` | Boolean | Indicator if a promotional discount was used |

---

## Data Pipeline & Preprocessing

### 1. Excel Pre-Processing

* Created the core business variable `Spender Group` using conditional logic to categorize spending tiers (`High Spender`, `Medium Spender`, `Low Spender`).

### 2. Python Data Cleaning Pipeline

* **Duplicate Removal:** Standard deduplication across unique transaction IDs followed by business-level deduplication across composite attributes:
```python
subset_cols = ['Age', 'City', 'Items Purchased', 'Satisfaction Level', 'Membership Type', 'Average Rating']
df = df.drop_duplicates(subset=subset_cols)

```


* **Scale Normalization:** Corrected scale inconsistencies in the `Average Rating` column (repairing 1–50 reporting anomalies to a standard 10–50 base):
```python
df['Average Rating'] = df['Average Rating'].apply(lambda x: x * 10 if x < 10 else x)

```


* **Missing Value Imputation:**
* Categorical fields (`Gender`, `City`, `Membership Type`, `Satisfaction Level`): Imputed with `"Unknown"`.
* Numerical metrics (`Average Rating`): Imputed using the median score.


* **Outlier Assessment:** Applied Interquartile Range (IQR) analysis to `Total Spend`. Identified upper-boundary values were retained based on business validation for high-net-worth customers.

---

## SQL Analytics (PostgreSQL)

Analytical queries simulate core business intelligence operations:

* **Revenue Distribution:** Aggregating total revenue and transaction volume sliced by `City` and `Membership Type`.
* **Behavioral Segmentation:** Implementing `CASE WHEN` logic to map customer value bands.
* **Churn Risk Identification:** Querying inactivity thresholds (`Days Since Last Purchase > 30`) crossed with low satisfaction ratings (`Average Rating < 4`).
* **Ranking & Partitioning:** Utilizing Window Functions (`RANK()`, `DENSE_RANK()`, `PARTITION BY City`) to identify and isolate top revenue-generating customers per geographic region.

---

## Key Metrics & Analytical Findings

### Executive Summary

| Metric | Value | Business Context |
| --- | --- | --- |
| **Total Revenue** | 5.79M | Cumulative gross revenue across all cohorts |
| **Total Customer Base** | 350 | Unique active accounts analyzed |
| **Average Rating** | 4.02 / 5.0 | Overall customer satisfaction index |
| **Average Recency** | 27 Days | Mean days since previous transaction |
| **Primary Revenue Market** | Chicago (43%) | Largest single geographic revenue contributor |

### Revenue & Cohort Insights

* **Pareto Concentration:** High Spenders comprise 50% of the customer count but generate ~81% of total revenue.
* **Demographic Drivers:**
* The **Age 41+** cohort delivers the highest revenue per customer despite a smaller volume footprint.
* **Female customers** account for ~60% of total revenue.


* **Tier Upsell Opportunity:** The **Bronze Membership** segment generates the highest overall gross revenue, highlighting a prime target pool for premium tier upgrades.
* **Retention & Churn Indicators:**
* **26.6%** of customers exhibit high churn risk (inactivity > 30 days and average rating < 4.0).
* Extended inactivity intervals strongly correlate with decaying customer review scores.


* **Discount Dependency:** 62% of transactions had a discount applied, indicating high promotional reliance.

---

## Strategic Business Recommendations

1. **High Spender VIP Protection:** Prioritize dedicated account management and loyalty perks for the top 50% spending tier generating 81% of gross revenue.
2. **Promotional Margin Optimization:** Review margin erosion caused by the 62% discount utilization rate; shift toward targeted rather than blanket discounting.
3. **Bronze Tier Conversion Campaign:** Deploy automated marketing funnels to convert high-spending Bronze members into Silver/Gold subscription tiers.
4. **Automated Churn Win-Back Workflows:** Trigger re-engagement incentives for customers crossing the 30-day inactivity threshold before ratings drop further.

---

## Repository Structure

```text
.
├── data/
│   ├── raw/
│   │   └── customer_data_raw.csv
│   └── processed/
│       └── customer_data_cleaned.csv
├── notebooks/
│   └── data_cleaning_and_validation.ipynb
├── sql/
│   ├── 01_exploratory_queries.sql
│   ├── 02_segmentation_queries.sql
│   └── 03_window_ranking_queries.sql
├── dashboards/
│   └── customer_analytics_dashboard.pbix
└── README.md

```

---

## Execution Guide

### 1. Python Environment Setup

```bash
python -m venv .venv
# Windows:
.venv\Scripts\activate
# Linux/macOS:
source .venv/bin/activate

pip install pandas numpy matplotlib seaborn

```

### 2. Run Cleaning Pipeline

Execute the notebook in `notebooks/data_cleaning_and_validation.ipynb` to process raw CSV records and export the cleaned dataset.

### 3. Load & Query SQL

Import `customer_data_cleaned.csv` into your PostgreSQL instance and execute the script suite in the `sql/` directory.

```

```
