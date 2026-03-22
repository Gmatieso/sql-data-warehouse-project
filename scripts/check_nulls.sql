SELECT * FROM bronze.crm_cust_info;

-- Check for Nulls or Duplicates in Primary KEY
-- Expectation: No Result 

SELECT cst_id , COUNT(*) FROM bronze.crm_cust_info GROUP BY cst_id  HAVING COUNT(*) > 1 OR cst_id IS NULL

