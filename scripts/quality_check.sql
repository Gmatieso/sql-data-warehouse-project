SELECT 
*,
ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) as flag_last 
FROM bronze.crm_cust_info
-- WHERE cst_id = 29466