--Quality Check of the Silver Table
--  Filter to show  data that we only need
INSERT INTO silver.crm_cust_info(
        cst_id,
        cst_key,
        cst_firstname,
        cst_lastname,
        cst_marital_status,
        cst_gndr,
        cst_create_date)
SELECT 
 cst_id,
 cst_key,
 TRIM(cst_firstname) AS customer_firstname,
 TRIM(cst_lastname) AS customer_lastname,
CASE WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'Single'
     WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'Married'
     ELSE  'n/a'
END  AS cst_marital_status, -- Normalize marital status values to readable format
CASE WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'Female'
 WHEN  UPPER(TRIM(cst_gndr)) = 'M' THEN 'Male'
 ELSE  'n/a'
END AS cst_gndr, -- Normalize gender values to readable as format
 cst_create_date
FROM (
    SELECT 
    *,
ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) as flag_last 
FROM bronze.crm_cust_info
WHERE cst_id IS NOT NULL
) t WHERE flag_last = 1



-- Trimming : Remove Unwanted spaces to ensure data consistency and uniformity across all records
-- Data Normalization / standardization:  Maps coded values to meaningful, user-friendly descriptions
-- Handling Missing Data : Fills in the blanks by adding a default value
-- Remove Duplicates: Ensure only one record per entity by identifying and retaining the most relevant row.


-- RERUN QUALITY CHECK FOR SILVER
SELECT * FROM silver.crm_cust_info;

-- Check for Nulls or Duplicates in Primary KEY
-- Expectation: No Result
SELECT
    cst_id ,
    COUNT(*) FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL


-- Assigns a unique number to each row in a result set, based on a defined order
-- This ideally means for each cst_id ,sql will, take all rows belonging to that customer, sort them by cst_create_date(latest first) and assign row numbers

SELECT
    *,
    ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) as flag_last
FROM silver.crm_cust_info
WHERE cst_id = 29466


-- check for unwanted spaces
-- Expectation: No Results
-- if the original value is not equal to the same value after trimming, it means there are spaces!
SELECT cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

SELECT cst_lastname
FROM silver.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname)



