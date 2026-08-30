```markdown
# Amazon India E-Commerce Sales & Logistics Analytics

An analytics case study focusing on end-to-end data cleaning, geographic normalization, and business intelligence reporting on 120,000+ transaction records from Amazon India.

---

## 1. Project Background & Data Challenge

Real-world transaction datasets frequently suffer from operational logging inconsistencies. This project addresses severe data quality issues in high-volume e-commerce sales records, with an emphasis on building an automated cleansing pipeline and an executive dashboard.

### Core Data Quality Challenges
- **Geographic Fragmentation:** Over 2,000+ distinct spelling errors, casing variations, and localized naming conventions across Indian states and cities (e.g., `BENGALURU` vs. `BANGALORE`, `NEW DELHI` vs. `DELHI NCR`).
- **Mixed Lifecycle Records:** Transaction values populated for completed orders but inconsistent across cancelled, returned, or lost shipments.
- **Dimensional Granularity:** High cardinality across SKUs, product styles, and sizing variants.

---

## 2. Data Cleaning & Transformation Matrix

The cleaning pipeline was implemented in **Power Query (M Scripting)** and validated using **Python (Pandas)**:

| Field | Raw State Issue | Transformation Logic Applied | Final Normalized State |
| :--- | :--- | :--- | :--- |
| `ship-city` | Mixed casing, whitespace, typos (`BOM`, `BOMBAY`, `mumbai`) | Regular expression trimming, uppercase conversion, dictionary mapping | Standard City Name (`MUMBAI`) |
| `ship-state` | Inconsistent abbreviations (`PB`, `PUNJAB`, `Punjab state`) | Conditional grouping and state code standardization | Unified State Name (`PUNJAB`) |
| `Amount` | Null entries on cancelled/returned orders | Conditional imputation based on `Status` flag | `0.00` (Cancelled) / Valid Float |
| `Date` | Non-standard string formats | ISO 8601 standard parsing | `YYYY-MM-DD` (Date type) |
| `Promotion-IDs` | Unnested composite promotion strings | Delimiter splitting and binary promotion tagging | `Is_Promoted` (Boolean Flag) |

---

## 3. Data Model Architecture (Star Schema)

To ensure low-latency analytical queries in Power BI, flat transaction logs were transformed into a dimensional Star Schema:

- **Fact Table:**
  - `fct_sales_transactions`: Order ID, SKU Key, Date Key, Geography Key, Fulfillment Key, Quantity, Gross Amount, Promotion Applied.
- **Dimension Tables:**
  - `dim_geography`: State, Tier 1 / Tier 2 Classification, Standardized City.
  - `dim_product`: SKU, Category (Kurta, Set, Top, Dress), Size, Style ID.
  - `dim_fulfillment`: Fulfillment Channel (`FBA` vs `Merchant`), Service Level, Order Status.
  - `dim_date`: Calendar Date, Month, Quarter, Fiscal Period.

---

## 4. Analytical Findings & Business Performance

### Geographic & Revenue Distribution
- **Key Markets:** Maharashtra, Karnataka, and Tamil Nadu constitute the primary demand hubs, generating over 45% of total gross merchandise value (GMV).
- **Metro Concentration:** Tier 1 metro areas demonstrate higher average order value (AOV) compared to Tier 2/3 cities, but exhibit higher return rates.

### Product & Inventory Performance
- **Fast-Moving Sizes:** Sizes **M** and **L** make up the highest volume proportion across all apparel categories (~54% of apparel unit sales).
- **Category Leaders:** Kurta Sets and Tops drive the majority of top-line revenue; seasonal demand peaks correlate strongly with promotional discount cycles.

### Logistics & Fulfillment Efficiency
- **FBA vs. MFN Performance:** Fulfilled by Amazon (FBA) orders achieve a 96.8% completion rate, whereas Merchant-Fulfilled (MFN) shipments record significantly higher pre-dispatch cancellation rates.

---

## 5. Power BI Dashboard Structure

The accompanying Power BI report is divided into three functional reporting views:

1. **Executive Overview:** High-level GMV, total volume, average order value (AOV), and regional heatmaps.
2. **Product & Inventory Analysis:** Category breakdown, size velocity, and promotion efficiency metrics.
3. **Logistics & Fulfillment Monitoring:** Order status tracking (Delivered, Cancelled, Returned) filtered by fulfillment method.

![Dashboard Preview](assets/dashboard_preview.png)

---

## 6. Repository Structure

```text
.
├── datasets/
│   └── dataset_source.md            # Dataset reference and Google Drive access link
├── power_query/
│   └── transformation_scripts.m     # Reusable Power Query M code for data cleaning
├── python/
│   └── data_audit_and_cleaning.py   # Python alternative script for data validation
├── sql/
│   └── analytical_queries.sql       # SQL queries for exploratory data analysis
├── bi_reports/
│   └── amazon_sales_dashboard.pbix  # Power BI interactive report file
├── assets/
│   └── dashboard_preview.png        # Dashboard preview image
└── README.md                        # Documentation

```

---

## 7. Setup & Reproduction

### Dataset Access

The raw and cleaned datasets are accessible via the Google Drive repository:

[Download Amazon India Sales Dataset](https://drive.google.com/drive/folders/1RPrlzuw_B6GERsiu7S8qXeaNV7jxXwc4?usp=drive_link)

### Running the Project

1. **Power BI:** Open `bi_reports/amazon_sales_dashboard.pbix` in Power BI Desktop and repoint data source parameters to your local dataset path.
2. **Python Environment (Optional Validation):**
```bash
pip install pandas numpy
python python/data_audit_and_cleaning.py

```



```

```
