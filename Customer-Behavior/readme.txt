
# Customer Behavior Analysis & Segmentation

An exploratory and predictive data analytics project analyzing customer demographic patterns, purchase behavior, and lifetime engagement metrics to derive actionable business insights and customer segmentation strategies.

---

## Business Problem & Objectives

Understanding customer purchasing habits and segment characteristics is critical for optimizing marketing spend, improving retention, and increasing Customer Lifetime Value (CLV). 

This project aims to:
- Identify underlying demographic and behavioral patterns driving purchasing decisions.
- Perform exploratory data analysis (EDA) to evaluate revenue concentration and purchase frequency.
- Segment customer cohorts based on behavioral metrics (e.g., RFM modeling / clustering).
- Provide data-driven recommendations for targeted marketing and retention campaigns.

---

## Tech Stack & Tools

- **Programming Language:** Python 3.10+
- **Data Manipulation & Analysis:** Pandas, NumPy
- **Data Visualization:** Matplotlib, Seaborn, Plotly
- **Statistical Modeling & Clustering:** Scikit-Learn (K-Means, PCA, StandardScaler)
- **Environment:** Jupyter Notebook / VS Code

---

## Project Workflow

```mermaid
flowchart LR
    A[Raw Customer Dataset] --> B[Data Cleaning & Preprocessing]
    B --> C[Exploratory Data Analysis]
    C --> D[Feature Engineering & Scaling]
    D --> E[Behavioral Segmentation / Modeling]
    E --> F[Business Insights & Strategy]

```

### 1. Data Cleaning & Preprocessing

* Handled missing values and standardized categorical variables.
* Detected and treated outliers in transaction amounts and frequency distributions.
* Validated data types and transformed date fields into temporal features (e.g., tenure, recency).

### 2. Exploratory Data Analysis (EDA)

* Analyzed distribution of spending habits across demographic cohorts (age, gender, location).
* Assessed correlation between promotional campaign response and repeat purchase rates.
* Evaluated purchase volume trends across seasonal and day-of-week intervals.

### 3. Customer Segmentation & Feature Engineering

* Constructed behavioral metrics: Recency (days since last purchase), Frequency (total orders), and Monetary Value (total spend).
* Scaled numerical features using `StandardScaler` to normalize variance across dimensions.
* Applied clustering algorithms to group customers into distinct behavioral segments (e.g., High-Value Loyalists, At-Risk Customers, Occasional Buyers).

---

## Key Analytical Findings

* **Revenue Concentration:** A small percentage of active customers accounts for the majority of overall revenue.
* **Retention Drivers:** Customers engaged with multi-channel promotions exhibit higher repeat purchase rates compared to single-channel buyers.
* **Churn Risk Indicators:** Extended intervals between first and second purchases serve as a strong early indicator of customer churn.

---

## Repository Structure

```text
Customer-Behavior/
├── data/
│   ├── raw/                         # Raw dataset files
│   └── processed/                   # Cleaned and engineered datasets
├── notebooks/
│   ├── 01_data_cleaning_eda.ipynb   # Exploratory analysis and visual inspection
│   └── 02_customer_segmentation.ipynb # Feature scaling and segmentation models
├── src/
│   ├── __init__.py
│   ├── data_loader.py               # Dataset ingestion utilities
│   └── utils.py                     # Plotting and metric evaluation helper functions
├── requirements.txt                 # Python package dependencies
└── README.md                        # Project documentation

```

---

## Reproduction Guide

### 1. Clone Repository & Navigate to Directory

```bash
git clone [https://github.com/ChenStormtout/data-analytics-portfolio.git](https://github.com/ChenStormtout/data-analytics-portfolio.git)
cd data-analytics-portfolio/Customer-Behavior

```

### 2. Setup Virtual Environment

```bash
python -m venv .venv

# Windows:
.venv\Scripts\activate

# Linux/macOS:
source .venv/bin/activate

```

### 3. Install Dependencies

```bash
pip install -r requirements.txt

```

### 4. Run Analysis

Launch Jupyter Notebook to inspect the end-to-end analysis:

```bash
jupyter notebook notebooks/

```

```

```
