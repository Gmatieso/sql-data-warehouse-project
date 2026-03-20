CREATE OR ALTER PROCEDURE bronze.load_bronze AS 
BEGIN
    BEGIN TRY
        PRINT '========================================================================';
        PRINT 'Loading Bronze Layer';
        PRINT '========================================================================';

        PRINT '------------------------------------------------------------------------';
        PRINT 'Loading CRM Tables';
        PRINT '------------------------------------------------------------------------';

        PRINT '>> Truncating Table: bronze.crm_cust_info';
        -- Quickly delete all rows from table, resetting it into an empty state 
        TRUNCATE TABLE bronze.crm_cust_info;

        PRINT '>> INSERT DATA INTO: bronze.crm_cust_info';
        BULK INSERT bronze.crm_cust_info
        FROM '/datasets/source_crm/cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK,
            ROWTERMINATOR = '\n'
        );

        -- SELECT * FROM bronze.crm_cust_info;

        -- SELECT COUNT(*) FROM bronze.crm_cust_info;

        PRINT '>> Truncating Table: bronze.crm_prd_info';
        -- Quickly delete all rows from table, resetting it into an empty state 
        TRUNCATE TABLE bronze.crm_prd_info;

        PRINT '>> INSERT DATA INTO: bronze.prd_info';
        BULK INSERT bronze.crm_prd_info
        FROM '/datasets/source_crm/prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK,
            ROWTERMINATOR = '\n'
        );

        -- SELECT * FROM bronze.crm_prd_info;

        -- SELECT COUNT(*) FROM bronze.crm_prd_info;

        PRINT '>> Truncating Table: bronze.crm_sales_details';
        -- Quickly delete all rows from table, resetting it into an empty state 
        TRUNCATE TABLE bronze.crm_sales_details;

        PRINT '>> INSERT DATA INTO: bronze.sales_details';
        BULK INSERT bronze.crm_sales_details
        FROM '/datasets/source_crm/sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK,
            ROWTERMINATOR = '\n'
        );

        -- SELECT * FROM bronze.crm_sales_details;

        -- SELECT COUNT(*) FROM bronze.crm_sales_details;

        PRINT '------------------------------------------------------------------------';
        PRINT 'Loading ERP Tables';
        PRINT '------------------------------------------------------------------------';

        PRINT '>> Truncating Table: bronze.erp_loc_a101';
        -- Quickly delete all rows from table, resetting it into an empty state 
        TRUNCATE TABLE bronze.erp_loc_a101;

        PRINT '>> INSERT DATA INTO: bronze.erp_loc_a101';
        BULK INSERT bronze.erp_loc_a101
        FROM '/datasets/source_erp/LOC_A101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK,
            ROWTERMINATOR = '\n'
        );

        -- SELECT * FROM bronze.erp_loc_a101;

        -- SELECT COUNT(*) FROM bronze.erp_loc_a101;


        PRINT '>> Truncating Table: bronze.erp_cust_az12'
        -- Quickly delete all rows from table, resetting it into an empty state 
        TRUNCATE TABLE bronze.erp_cust_az12;

        PRINT '>> INSERT DATA INTO: bronze.cust_az12';
        BULK INSERT bronze.erp_cust_az12
        FROM '/datasets/source_erp/CUST_AZ12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK,
            ROWTERMINATOR = '\n'
        );

        -- SELECT * FROM bronze.erp_cust_az12;

        -- SELECT COUNT(*) FROM bronze.erp_cust_az12;


        PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';
        -- Quickly delete all rows from table, resetting it into an empty state 
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        PRINT '>> INSERT DATA INTO: bronze.erp_px_cat_g1v2';
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM '/datasets/source_erp/PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK,
            ROWTERMINATOR = '\n'
        );

        -- SELECT * FROM bronze.erp_px_cat_g1v2;

        -- SELECT COUNT(*) FROM bronze.erp_px_cat_g1v2;
    END TRY
    BEGIN CATCH
        PRINT '===================================================================';
        PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
        PRINT 'Error Message' + ERROR_MESSAGE();
        PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
        PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
        PRINT '===================================================================';
    END CATCH
END

