/*
This script creates a database called 'warehouse' and then sets up thre schemas within the database: 'bronze', 'silver', and 'gold'.
*/
USE MASTER;
CREATE DATABASE Warehouse;



USE Warehouse;

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
