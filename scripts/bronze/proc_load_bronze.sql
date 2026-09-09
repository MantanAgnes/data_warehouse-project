/*
This store procedure loads data into the 'bronze' schema from external CSV files.
It performs the foloowing actions:
-Truncates the bronze tables before loading data.
-Uses the  'BULK INSERT' command to load data from CSV files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;

*/


CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
    BEGIN TRY
	     SET @batch_start_time = GETDATE();
		 PRINT'===============================================';
		 PRINT 'loading bronze layer ';
		 PRINT'===============================================';

		 PRINT '------------------------------------------------';
		 PRINT 'Loading CRM Tables'
		 PRINT '------------------------------------------------';

		 SET @start_time = GETDATE();
		 PRINT '>>Truncating Table: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;

		PRINT '>> Inserting data into: bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\Admin\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH
		( FIRSTROW = 2,
		  FIELDTERMINATOR = ',',
		  TABLOCK
		);
		 SET @end_time = GETDATE();
		 PRINT '>> Load duration: '+ CAST( DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + 'seconds'
		 PRINT '-------------------------------------------------------'

		 SET @start_time = GETDATE();
		 PRINT '>>Truncating Table: bronze.crm_prd_info';
		 TRUNCATE TABLE bronze.crm_prd_info;

		PRINT '>> Inserting data into: bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\Admin\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH
		( FIRSTROW = 2,
		  FIELDTERMINATOR = ',',
		  TABLOCK
		);
		SET @end_time = GETDATE();
		 PRINT '>> Load duration: '+ CAST( DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + 'seconds'
		 PRINT '-------------------------------------------------------'

		 SET @start_time = GETDATE();
	    PRINT '>>Truncating Table: bronze.crm_sales_details';
	    TRUNCATE TABLE bronze.crm_sales_details;

	    PRINT '>> Inserting data into: bronze.crm_sales_details';
	    BULK INSERT bronze.crm_sales_details
	    FROM 'C:\Users\Admin\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	    WITH
	  ( FIRSTROW = 2,
	    FIELDTERMINATOR = ',',
	    TABLOCK
	  );
	  SET @end_time = GETDATE();
		 PRINT '>> Load duration: '+ CAST( DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + 'seconds'
		 PRINT '-------------------------------------------------------'

	    PRINT '------------------------------------------------';
	    PRINT 'Loaing EPR Tables'
	    PRINT '------------------------------------------------';

		 SET @start_time = GETDATE();
		PRINT '>>Truncating Table: bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12;

		PRINT '>> Inserting data into: bronze.erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\Admin\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		WITH
		( FIRSTROW = 2,
		  FIELDTERMINATOR = ',',
		  TABLOCK
		);
		SET @end_time = GETDATE();
		 PRINT '>> Load duration: '+ CAST( DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + 'seconds'
		 PRINT '-------------------------------------------------------'

		 SET @start_time = GETDATE();
		 PRINT '>>Truncating Table: bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101;

		PRINT '>> Inserting data into: bronze.erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\Admin\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		WITH
		( FIRSTROW = 2,
		  FIELDTERMINATOR = ',',
		  TABLOCK
		);
		SET @end_time = GETDATE();
		 PRINT '>> Load duration: '+ CAST( DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + 'seconds'
		 PRINT '-------------------------------------------------------'

		  SET @start_time = GETDATE();
		 PRINT '>>Truncating Table: bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		PRINT '>> Inserting data into: bronze.erp_px_cat_g1v2';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\Admin\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		WITH
		( FIRSTROW = 2,
		  FIELDTERMINATOR = ',',
		  TABLOCK
		);
		SET @end_time = GETDATE();
		 PRINT '>> Load duration: '+ CAST( DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + 'seconds'
		 PRINT '-------------------------------------------------------'

		 SET @batch_end_time = GETDATE();
		 PRINT '============================================'
		 PRINT 'Loading Bronze layer is completed';
		 PRINT ' -Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS VARCHAR) + 'seconds';
		 PRINT '============================================'
		END TRY
		BEGIN CATCH
		PRINT'============================'
		PRINT'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT'ERROR MESSAGE' + ERROR_MESSAGE();
		PRINT'ERROR MESSAGE' + CAST(ERROR_NUMBER() AS VARCHAR);
		    PRINT'ERROR MESSAGE' + CAST(ERROR_STATE() AS VARCHAR);
		PRINT'============================'
		END CATCH
END
