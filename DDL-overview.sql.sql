
/* Data Definition Language (DDL)
 * ------------------------------
 * Setting up database structures
 * and manipulating existing
 * databases.
 */


 /* Creating a database
  * --------------------
  */
 CREATE DATABASE Workshop; -- Create a new database.
 GO -- <- Batch limiter


 /* Creating Schemas
  * -----------------
  */
 CREATE SCHEMA mySchema;
 GO

 CREATE SCHEMA analyst;
 GO


 /* Creating Tables
  * -----------------
  */

 CREATE TABLE [mySchema].[Products] (	-- Create product table.
	Id INT IDENTITY (1, 1) NOT NULL,	-- Create  the identity column.
	[Name] VARCHAR(100) NOT NULL,
	Price INT NOT NULL
		CONSTRAINT CK_MustBeGreaterThanZero CHECK(Price > 0), -- Constrain which data can go into this column.
	CONSTRAINT PK_Products_Id PRIMARY KEY (Id)				  -- Add Primary key constraint and index.
 )
 GO

 CREATE TABLE Sales (
	Id INT IDENTITY (1, 1) PRIMARY KEY NOT NULL, -- Primary key constraint/index name is auto-generated.
	ProductId INT NOT NULL,
	CONSTRAINT FK_Sales_Products_ProductId FOREIGN KEY(ProductId) REFERENCES [mySchema].[Products](Id) -- Add named foreign key constraint.
 )
 GO

 CREATE TABLE SalesPeople (
	Id INT IDENTITY (1, 1) PRIMARY KEY NOT NULL,
	Firstname VARCHAR(100) NOT NULL,
	Lastname VARCHAR(100) NOT NULL
 )


 /* Altering Tables
  * -----------------
  */

 ALTER TABLE dbo.Sales -- Alter existing table
	ADD SalesDate DATETIME2 DEFAULT CURRENT_TIMESTAMP -- Add column with default value (which is a constraint also)
 GO

 ALTER TABLE dbo.Sales -- Throws an error if there's already existing data in the table!
	 ADD SellerId INT NOT NULL,
	 CONSTRAINT FK_Sales_SalesPeople_SellerId FOREIGN KEY(SellerId) REFERENCES dbo.SalesPeople(Id)
 GO

 /* Approaches to add column with constraint
  *	to table with existing data!
  * -----------------------------------------
  * 1. Add new colum without 'NOT NULL'
  *		Issue: foreign key column will now allow nulls.
  *			   Update all existing rows and modify column
  *			   to not allow nulls.
  *
  * 2. Add new column with 'NOT NULL' and Default Constraint
  *		Issue: all existing columns will get same value <- which might not be correct.
  */
 ALTER TABLE dbo.Sales -- Option 1
	ADD SellerId INT, -- No 'NOT NULL' <- Data integrity issue.
	CONSTRAINT FK_Sales_SalesPeople_SellerId FOREIGN KEY(SellerId) REFERENCES dbo.SalesPeople(Id)
 GO

 BEGIN -- Option 2
	 ALTER TABLE dbo.Sales
		ADD SellerId INT NOT NULL CONSTRAINT DF_Sales_SellerId_Insert_Into_Exisiting DEFAULT 1, -- Make NOT NULL
		CONSTRAINT FK_Sales_SalesPeople_SellerId FOREIGN KEY(SellerId) REFERENCES dbo.SalesPeople(Id);

	ALTER TABLE dbo.Sales
		DROP CONSTRAINT DF_Sales_SellerId_Insert_Into_Exisiting; -- Drop default after not needed anymore.
 END


 /* Security Control
  * ---------------
  * Creating a LOGIN and USER
  * Using SQL Server Authentication
  */

  USE [Workshop];
  CREATE LOGIN app_name WITH PASSWORD = 'MyPassword1*';	-- First create a login for the DB.
  CREATE USER app_name FOR LOGIN app_name;				-- secondly create a user for the login.

  GRANT SELECT ON SCHEMA::mySchema TO app_name;			-- Grant permissions for the user.
  GO


  /* Control over viewable data
   * --------------------------
   * Creating Views
   */

   CREATE VIEW [analyst].[ProductOverview]
	   AS
	   SELECT [Name], Price
	   FROM mySchema.Products
   GO