SELECT * FROM bronze.crm_cust_info;

-- Check for Nulls or Duplicates in Primary KEY
-- Expectation: No Result 

SELECT cst_id , COUNT(*) FROM bronze.crm_cust_info GROUP BY cst_id  HAVING COUNT(*) > 1 OR cst_id IS NULL


-- Assigns a unique number to each row in a result set, based on a defined order
-- This ideally means for each cst_id ,sql will, take all rows belonging to that customer, sort them by cst_create_date(latest first) and assign row numbers

SELECT 
*,
ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) as flag_last 
FROM bronze.crm_cust_info
WHERE cst_id = 29466


-- check for unwanted spaces
-- Expectation: No Results 
-- if the original value is not equal to the same value after trimming, it means there are spaces! 
SELECT cst_firstname 
FROM bronze.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

SELECT cst_lastname 
FROM bronze.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname)

SELECT cst_gndr 
FROM bronze.crm_cust_info
WHERE cst_gndr != TRIM(cst_gndr)


SELECT cst_key
FROM bronze.crm_cust_info
WHERE cst_key != TRIM(cst_key)

-- Data Standardization & Consistency
SELECT DISTINCT  cst_gndr
FROM bronze.crm_cust_info