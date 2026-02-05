# 📊 Customer Behavior Analysis Portfolio

## 📌 Project Overview

This project focuses on **Customer Behavior Analysis** to understand customer spending patterns, segmentation, satisfaction, and retention risks.

The analysis is conducted end-to-end using **Excel, Python, SQL, and dashboard visualization**, following a workflow that closely mirrors real-world **Data Analyst** practices.

---

## 🧩 Tools & Technologies

* **Excel** → Initial data preparation and creation of the *Spender Group* column using IF logic
* **Python (Pandas, NumPy)** → Data cleaning, missing value handling, rating normalization, and outlier validation
* **SQL (PostgreSQL)** → Exploratory Data Analysis (EDA), customer segmentation, aggregation, and ranking
* **Dashboard (Power BI / Excel Dashboard)** → Executive-level visual insights

---

## 📂 Dataset Overview

The dataset contains customer-level information, including:

* Customer ID
* Age
* Gender
* City
* Membership Type
* Total Spend
* Items Purchased
* Average Rating
* Satisfaction Level
* Days Since Last Purchase
* Discount Applied

The raw dataset is loaded from a CSV file using `;` as the delimiter.

---

## 🛠️ Data Preparation & Cleaning

### 1️⃣ Spender Group Creation (Excel)

Before processing the data in Python, a new column **Spender Group** was created in Excel using IF formulas to classify customers into:

* High Spender
* Medium Spender
* Low Spender

This segmentation serves as a core variable for subsequent Python, SQL, and dashboard analyses.

---

### 2️⃣ Data Cleaning with Python

Data cleaning was performed using **Pandas**, with the following key steps:

* **Duplicate Handling**
  Removed duplicate rows to ensure data integrity.

* **Rating Normalization**
  The `Average Rating` column contained scale inconsistencies (single-digit values in a 1–50 scale).
  Values below 10 were assumed to be missing a trailing zero and were normalized using:

  ```python
  lambda x: x * 10 if x < 10 else x
  ```

* **Missing Value Handling**

  * Gender, City, Membership Type, Satisfaction Level → filled with `"Unknown"`
  * Average Rating → filled using the median value

* **Outlier Analysis (IQR Method)**
  Outliers in `Total Spend` were identified statistically but **not removed**, as they remain valid under business context.

* **Business-driven Deduplication**
  Additional duplicate checks were performed using a business-relevant subset of columns:
  `Age, City, Items Purchased, Satisfaction Level, Membership Type, Average Rating`

The final cleaned dataset was exported for SQL analysis and dashboard visualization.

---

## 🔍 SQL Analysis

SQL queries were designed to simulate common analytical tasks performed by Data Analysts, including:

* Basic EDA (`SELECT`, `WHERE`)
* Aggregations (`SUM`, `AVG`, `MIN`, `MAX`)
* Customer distribution by membership type
* Revenue contribution by city and membership
* Customer segmentation using `CASE WHEN`
* Churn candidate identification using **Days Since Last Purchase**
* Customer ranking with **WINDOW FUNCTIONS** (`RANK`, `DENSE_RANK`)
* Identifying top spenders per city using `PARTITION BY`

---

## 📊 Dashboard & Visualization

Dashboards were built to translate analytical results into clear, actionable insights for stakeholders.

### Executive Overview

* Total Revenue: **5.79M**
* Total Customers: **350**
* High Spenders: **50% of customers generate ~81% of total revenue**
* Average Rating: **4.02 / 5**
* Top revenue-contributing city: **Chicago (43%)**

### Customer Analytics & Segmentation

* High Spenders dominate total revenue contribution
* **Age 41+** segment generates the highest revenue despite smaller customer count
* Female customers contribute ~60% of total revenue
* Bronze membership generates the highest revenue → indicating a potential **upgrade opportunity**

### Satisfaction & Retention

* Average days since last purchase: **27 days**
* **26.6% of customers are at churn risk** (inactive >30 days and rating < 4)
* Clear trend: longer inactivity correlates with lower customer ratings

---

## 💡 Key Business Insights

* Retention of **High Spenders** should be the top priority due to high revenue impact
* High dependency on discounted transactions (62%) → margin impact should be evaluated
* Age 36–40 segment underperforms → opportunity for targeted product or marketing strategies
* A **win-back campaign** is recommended for customers inactive for more than 30 days

---

## 🎯 Conclusion

This project demonstrates a complete, business-oriented analytics workflow:

* Data cleaning driven by **business logic**, not purely statistical assumptions
* Integrated use of **Excel, Python, and SQL**
* Strong focus on **insights and decision-making**, rather than visualization alone

This portfolio reflects the practical skill set of a **Data Analyst** working with real-world customer data.

---

📌 *Feel free to explore the code, SQL queries, and dashboards included in this repository.*
