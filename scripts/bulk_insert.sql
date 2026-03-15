-- Quickly delete all rows from table, resetting it into an empty state 
TRUNCATE TABLE bronze.crm_cust_info;

BULK INSERT bronze.crm_cust_info
FROM '/datasets/source_crm/cust_info.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK,
    ROWTERMINATOR = '\n'
);

SELECT * FROM bronze.crm_cust_info;

SELECT COUNT(*) FROM bronze.crm_cust_info;


-- Quickly delete all rows from table, resetting it into an empty state 
TRUNCATE TABLE bronze.crm_prd_info;

BULK INSERT bronze.crm_prd_info
FROM '/datasets/source_crm/prd_info.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK,
    ROWTERMINATOR = '\n'
);

SELECT * FROM bronze.crm_prd_info;

SELECT COUNT(*) FROM bronze.crm_prd_info;


-- Quickly delete all rows from table, resetting it into an empty state 
TRUNCATE TABLE bronze.crm_sales_details;

BULK INSERT bronze.crm_sales_details
FROM '/datasets/source_crm/sales_details.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK,
    ROWTERMINATOR = '\n'
);

SELECT * FROM bronze.crm_sales_details;

SELECT COUNT(*) FROM bronze.crm_sales_details;
