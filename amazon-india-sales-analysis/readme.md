# Amazon India E-Commerce Sales Analytics & Geo-Data Cleansing

[![Power BI](https://img.shields.io/badge/Power_BI-Dashboard-F2C811?style=flat-square&logo=powerbi&logoColor=black)](https://powerbi.microsoft.com/)
[![Power Query](https://img.shields.io/badge/Power_Query-M_Engine-217346?style=flat-square&logo=microsoftexcel&logoColor=white)](https://learn.microsoft.com/en-us/power-query/)
[![SQL](https://img.shields.io/badge/SQL-Analytics-4169E1?style=flat-square&logo=postgresql&logoColor=white)](https://en.wikipedia.org/wiki/SQL)
[![Python](https://img.shields.io/badge/Python-3.10+-3776AB?style=flat-square&logo=python&logoColor=white)](https://www.python.org/)

An end-to-end business intelligence and data quality engineering project analyzing 120,000+ real-world Amazon India sales transactions. The project focuses on resolving severe geographic data noise (thousands of city/state typos and casing variations) via Power Query and Python, building a relational star-schema data model, and delivering an interactive Power BI dashboard for executive revenue and fulfillment tracking.

---

## Executive Dashboard Preview

![Amazon India Sales Dashboard Preview](assets/dashboard_preview.png)

---

## Pipeline & Modeling Architecture

```mermaid
flowchart LR
    A[Raw CSV Dataset\n120,000+ Records] --> B[Data Cleansing & Geo-Normalization\nPower Query & Python Pandas]
    B --> C[(Relational Data Model\nStar Schema: Facts & Dimensions)]
    C --> D[SQL Exploratory Analytics\nCohort & Fulfillment Queries]
    D --> E[Power BI Interactive Dashboard\nDAX Measures & Geo Analysis]
