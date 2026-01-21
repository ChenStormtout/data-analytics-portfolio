/* ============================================================
   SECTION 01 — BASIC PREVIEW
   ============================================================ */

SELECT * 
FROM amazon_sale_report;


/* ============================================================
   SECTION 02 — BASIC PROFILING
   ============================================================ */

-- Count by ship-state
SELECT "ship-state", COUNT(*) AS total
FROM amazon_sale_report
GROUP BY "ship-state";

-- Count by status
SELECT "Status", COUNT(*) AS total
FROM amazon_sale_report
GROUP BY "Status"
ORDER BY total DESC;

-- Count by ship-city
SELECT "ship-city", COUNT(*) AS total_orders
FROM amazon_sale_report
GROUP BY "ship-city"
ORDER BY total_orders DESC;


/* ============================================================
   SECTION 03 — CREATE CLEAN COLUMN (STATUS)
   ============================================================ */

ALTER TABLE amazon_sale_report
ADD COLUMN status_clean VARCHAR(50);

UPDATE amazon_sale_report
SET status_clean = CASE
    WHEN LOWER("Status") LIKE '%shipped%'   THEN 'Shipped'
    WHEN LOWER("Status") LIKE '%cancel%'    THEN 'Cancelled'
    WHEN LOWER("Status") LIKE '%pending%'   THEN 'Pending'
    ELSE 'Other'
END;

-- Check clean status distribution
SELECT status_clean, COUNT(*)
FROM amazon_sale_report
GROUP BY status_clean
ORDER BY COUNT(*) DESC;


/* ============================================================
   SECTION 04 — CLEAN & STANDARDIZE SHIP STATE
   ============================================================ */

-- Preview mapping first
SELECT 
    CASE
        WHEN UPPER(TRIM("ship-state")) IN ('MAHARASHTRA') THEN 'MAHARASHTRA'
        WHEN UPPER(TRIM("ship-state")) IN ('KARNATAKA') THEN 'KARNATAKA'
        WHEN UPPER(TRIM("ship-state")) IN ('TAMIL NADU') THEN 'TAMIL NADU'
        WHEN UPPER(TRIM("ship-state")) IN ('TELANGANA') THEN 'TELANGANA'
        WHEN UPPER(TRIM("ship-state")) IN ('UTTAR PRADESH') THEN 'UTTAR PRADESH'
        WHEN UPPER(TRIM("ship-state")) IN ('KERALA') THEN 'KERALA'
        WHEN UPPER(TRIM("ship-state")) IN ('WEST BENGAL') THEN 'WEST BENGAL'
        WHEN UPPER(TRIM("ship-state")) IN ('ANDHRA PRADESH') THEN 'ANDHRA PRADESH'
        WHEN UPPER(TRIM("ship-state")) IN ('GUJARAT') THEN 'GUJARAT'
        WHEN UPPER(TRIM("ship-state")) IN ('HARYANA') THEN 'HARYANA'
        WHEN UPPER(TRIM("ship-state")) IN 
            ('RAJASTHAN','RAJSTHAN','RAJASHTAN','RAJSHAN','RAJSTHHAN','RAJSHTHAN','RJ')
            THEN 'RAJASTHAN'
        WHEN UPPER(TRIM("ship-state")) IN ('MADHYA PRADESH') THEN 'MADHYA PRADESH'
        WHEN UPPER(TRIM("ship-state")) IN ('ODISHA', 'ORISSA') THEN 'ODISHA'
        WHEN UPPER(TRIM("ship-state")) IN ('BIHAR') THEN 'BIHAR'
        WHEN UPPER(TRIM("ship-state")) IN ('PUNJAB','PUNJAB/MOHALI/ZIRAKPUR','PB') THEN 'PUNJAB'
        WHEN UPPER(TRIM("ship-state")) IN ('ASSAM') THEN 'ASSAM'
        WHEN UPPER(TRIM("ship-state")) IN ('UTTARAKHAND') THEN 'UTTARAKHAND'
        WHEN UPPER(TRIM("ship-state")) IN ('JHARKHAND') THEN 'JHARKHAND'
        WHEN UPPER(TRIM("ship-state")) IN ('GOA') THEN 'GOA'
        WHEN UPPER(TRIM("ship-state")) IN ('CHHATTISGARH') THEN 'CHHATTISGARH'
        WHEN UPPER(TRIM("ship-state")) IN ('HIMACHAL PRADESH') THEN 'HIMACHAL PRADESH'
        WHEN UPPER(TRIM("ship-state")) IN ('JAMMU & KASHMIR') THEN 'JAMMU & KASHMIR'
        WHEN UPPER(TRIM("ship-state")) IN ('PUDUCHERRY','PONDICHERRY') THEN 'PUDUCHERRY'
        WHEN UPPER(TRIM("ship-state")) IN ('CHANDIGARH') THEN 'CHANDIGARH'
        WHEN UPPER(TRIM("ship-state")) IN ('MANIPUR') THEN 'MANIPUR'
        WHEN UPPER(TRIM("ship-state")) IN ('ANDAMAN & NICOBAR') THEN 'ANDAMAN & NICOBAR'
        WHEN UPPER(TRIM("ship-state")) IN ('MEGHALAYA') THEN 'MEGHALAYA'
        WHEN UPPER(TRIM("ship-state")) IN ('SIKKIM') THEN 'SIKKIM'
        WHEN UPPER(TRIM("ship-state")) IN ('NAGALAND','NL') THEN 'NAGALAND'
        WHEN UPPER(TRIM("ship-state")) IN ('TRIPURA') THEN 'TRIPURA'
        WHEN UPPER(TRIM("ship-state")) IN ('ARUNACHAL PRADESH','AR') THEN 'ARUNACHAL PRADESH'
        WHEN UPPER(TRIM("ship-state")) IN ('MIZORAM') THEN 'MIZORAM'
        WHEN UPPER(TRIM("ship-state")) IN ('DADRA AND NAGAR') THEN 'DADRA AND NAGAR HAVELI'
        WHEN UPPER(TRIM("ship-state")) IN ('LADAKH') THEN 'LADAKH'
        WHEN UPPER(TRIM("ship-state")) IN ('LAKSHADWEEP') THEN 'LAKSHADWEEP'
        WHEN UPPER(TRIM("ship-state")) IN ('DELHI','NEW DELHI','DELHI NCR') THEN 'DELHI'
        WHEN TRIM("ship-state") = '' THEN 'UNKNOWN'
        ELSE UPPER(TRIM("ship-state"))
    END AS ship_state_clean,
    COUNT(*) AS jumlah
FROM amazon_sale_report
GROUP BY ship_state_clean
ORDER BY jumlah DESC;


-- Add final clean column
ALTER TABLE amazon_sale_report
ADD COLUMN ship_state_clean VARCHAR(100);

-- Apply the cleaning
UPDATE amazon_sale_report
SET ship_state_clean =
(
    CASE
        WHEN UPPER(TRIM("ship-state")) IN ('MAHARASHTRA') THEN 'MAHARASHTRA'
        WHEN UPPER(TRIM("ship-state")) IN ('KARNATAKA') THEN 'KARNATAKA'
        WHEN UPPER(TRIM("ship-state")) IN ('TAMIL NADU') THEN 'TAMIL NADU'
        WHEN UPPER(TRIM("ship-state")) IN ('TELANGANA') THEN 'TELANGANA'
        WHEN UPPER(TRIM("ship-state")) IN ('UTTAR PRADESH') THEN 'UTTAR PRADESH'
        WHEN UPPER(TRIM("ship-state")) IN ('KERALA') THEN 'KERALA'
        WHEN UPPER(TRIM("ship-state")) IN ('WEST BENGAL') THEN 'WEST BENGAL'
        WHEN UPPER(TRIM("ship-state")) IN ('ANDHRA PRADESH') THEN 'ANDHRA PRADESH'
        WHEN UPPER(TRIM("ship-state")) IN ('GUJARAT') THEN 'GUJARAT'
        WHEN UPPER(TRIM("ship-state")) IN ('HARYANA') THEN 'HARYANA'
        WHEN UPPER(TRIM("ship-state")) IN 
            ('RAJASTHAN','RAJASTHAN','RAJASHTAN','RAJSHAN','RAJSTHHAN','RAJSHTHAN','RJ')
            THEN 'RAJASTHAN'
        WHEN UPPER(TRIM("ship-state")) IN ('MADHYA PRADESH') THEN 'MADHYA PRADESH'
        WHEN UPPER(TRIM("ship-state")) IN ('ODISHA','ORISSA') THEN 'ODISHA'
        WHEN UPPER(TRIM("ship-state")) IN ('BIHAR') THEN 'BIHAR'
        WHEN UPPER(TRIM("ship-state")) IN ('PUNJAB','PUNJAB/MOHALI/ZIRAKPUR','PB') THEN 'PUNJAB'
        WHEN UPPER(TRIM("ship-state")) IN ('ASSAM') THEN 'ASSAM'
        WHEN UPPER(TRIM("ship-state")) IN ('UTTARAKHAND') THEN 'UTTARAKHAND'
        WHEN UPPER(TRIM("ship-state")) IN ('JHARKHAND') THEN 'JHARKHAND'
        WHEN UPPER(TRIM("ship-state")) IN ('GOA') THEN 'GOA'
        WHEN UPPER(TRIM("ship-state")) IN ('CHHATTISGARH') THEN 'CHHATTISGARH'
        WHEN UPPER(TRIM("ship-state")) IN ('HIMACHAL PRADESH') THEN 'HIMACHAL PRADESH'
        WHEN UPPER(TRIM("ship-state")) IN ('JAMMU & KASHMIR') THEN 'JAMMU & KASHMIR'
        WHEN UPPER(TRIM("ship-state")) IN ('PUDUCHERRY','PONDICHERRY') THEN 'PUDUCHERRY'
        WHEN UPPER(TRIM("ship-state")) IN ('CHANDIGARH') THEN 'CHANDIGARH'
        WHEN UPPER(TRIM("ship-state")) IN ('MANIPUR') THEN 'MANIPUR'
        WHEN UPPER(TRIM("ship-state")) IN ('ANDAMAN & NICOBAR') THEN 'ANDAMAN & NICOBAR'
        WHEN UPPER(TRIM("ship-state")) IN ('MEGHALAYA') THEN 'MEGHALAYA'
        WHEN UPPER(TRIM("ship-state")) IN ('SIKKIM') THEN 'SIKKIM'
        WHEN UPPER(TRIM("ship-state")) IN ('NAGALAND','NL') THEN 'NAGALAND'
        WHEN UPPER(TRIM("ship-state")) IN ('TRIPURA') THEN 'TRIPURA'
        WHEN UPPER(TRIM("ship-state")) IN ('ARUNACHAL PRADESH','AR') THEN 'ARUNACHAL PRADESH'
        WHEN UPPER(TRIM("ship-state")) IN ('MIZORAM') THEN 'MIZORAM'
        WHEN UPPER(TRIM("ship-state")) IN ('DADRA AND NAGAR') THEN 'DADRA AND NAGAR HAVELI'
        WHEN UPPER(TRIM("ship-state")) IN ('LADAKH') THEN 'LADAKH'
        WHEN UPPER(TRIM("ship-state")) IN ('LAKSHADWEEP') THEN 'LAKSHADWEEP'
        WHEN UPPER(TRIM("ship-state")) IN ('DELHI','NEW DELHI','DELHI NCR') THEN 'DELHI'
        WHEN TRIM("ship-state") = '' THEN 'UNKNOWN'
        ELSE UPPER(TRIM("ship-state"))
    END
);


-- Check clean state result
SELECT ship_state_clean, COUNT(*)
FROM amazon_sale_report
GROUP BY ship_state_clean
ORDER BY COUNT() ASC;



/* ============================================================
   SECTION 05 — CHECK STRUCTURE & FIX DATA TYPE
   ============================================================ */

SELECT 
    column_name, data_type, udt_name,
    character_maximum_length,
    numeric_precision, numeric_scale
FROM information_schema.columns
WHERE table_name = 'amazon_sale_report'
ORDER BY ordinal_position;

-- Fix postal code type
ALTER TABLE amazon_sale_report
ALTER COLUMN "ship-postal-code" TYPE TEXT;

-- Fix Amount type to numeric
ALTER TABLE amazon_sale_report
ALTER COLUMN "Amount" TYPE NUMERIC(12,2)
USING "Amount"::numeric;



/* ============================================================
   SECTION 06 — FIX DATE FORMAT
   ============================================================ */

UPDATE amazon_sale_report
SET "Date" = TO_DATE("Date", 'MM-DD-YY');

ALTER TABLE amazon_sale_report
ALTER COLUMN "Date" TYPE DATE USING "Date"::DATE;



/* ============================================================
   SECTION 07 — MISSING VALUE HANDLING
   ============================================================ */

-- Count missing values (JSON approach)
SELECT 
    key AS column_name,
    SUM(((value)::text = 'null')::int) AS missing
FROM (
    SELECT to_jsonb(t) AS js
    FROM amazon_sale_report t
) AS sub,
LATERAL jsonb_each(js)
GROUP BY key
ORDER BY key;

-- Fill missing Amount using median per Category
WITH median_table AS (
    SELECT 
        "Category",
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY "Amount") AS median_amount
    FROM amazon_sale_report
    WHERE "Amount" IS NOT NULL
    GROUP BY "Category"
)
UPDATE amazon_sale_report t
SET "Amount" = m.median_amount
FROM median_table m
WHERE t."Category" = m."Category"
  AND t."Amount" IS NULL;

-- Fill missing postal code
UPDATE amazon_sale_report
SET "ship-postal-code" = 'Unknown'
WHERE "ship-postal-code" IS NULL
   OR "ship-postal-code" = '';



/* ============================================================
   SECTION 08 — INSIGHTS & ANALYSIS
   ============================================================ */

-- Top States by Revenue
SELECT ship_state_clean, SUM("Amount") AS total_revenue
FROM amazon_sale_report
GROUP BY ship_state_clean
ORDER BY total_revenue DESC;

-- Most Profitable Category
SELECT "Category", SUM("Amount") AS revenue
FROM amazon_sale_report
GROUP BY "Category"
ORDER BY revenue DESC;

-- Monthly Revenue Trend
SELECT DATE_TRUNC('month', "Date") AS month, SUM("Amount")
FROM amazon_sale_report
GROUP BY month
ORDER BY month;

-- Month-over-Month Growth
WITH monthly_revenue AS (
    SELECT DATE_TRUNC('month', "Date") AS month,
           SUM("Amount") AS revenue
    FROM amazon_sale_report
    GROUP BY month
)
SELECT 
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS prev_month,
    ROUND(100.0 * (revenue - LAG(revenue) OVER (ORDER BY month)) 
          / LAG(revenue) OVER (ORDER BY month), 2) AS growth_pct
FROM monthly_revenue;

-- Cancellation Rate by State
SELECT 
    ship_state_clean,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN status_clean = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled,
    ROUND(100.0 * SUM(CASE WHEN status_clean = 'Cancelled' THEN 1 ELSE 0 END) 
          / COUNT(*), 2) AS cancel_rate
FROM amazon_sale_report
GROUP BY ship_state_clean
ORDER BY cancel_rate DESC;

--Revenue per Category per Month
SELECT 
    DATE_TRUNC('month', "Date") AS month,
    "Category",
    SUM("Amount") AS revenue
FROM amazon_sale_report
GROUP BY month, "Category"
ORDER BY month, revenue DESC;

-- Top 10 Cities by Revenue
SELECT 
    "ship-city",
    SUM("Amount") AS total_revenue
FROM amazon_sale_report
GROUP BY "ship-city"
ORDER BY total_revenue DESC
LIMIT 10;
