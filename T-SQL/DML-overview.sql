/* Data Manipulation Language (DML)
 * --------------------------------
 * How to extract data from databases
 * 
 * SQL SELECT statement is written as
 *	SELECT
 *	FROM
 *	WHERE
 *	GROUP BY
 *	ORDER BY
 *	LIMIT
 * 
 * SQL Logical Execution order is
 *	FROM
 *	WHERE
 *	GROUP BY
 *	SELECT
 *	ORDER BY
 *	LIMIT
 */

 USE Workshop;


 /* Inserting Data
  * --------------
  * One and multiple
  * rows.
  */
 INSERT INTO [mySchema].[Products] ([Name], [Price]) -- Simple Insert statement
 VALUES ('Product1', 10);
 GO

 INSERT INTO [mySchema].[Products] ([Name], [Price]) -- Inserting multiple rows at once
 VALUES
	('Product2', 15),
	('Product3', 20)
GO

INSERT INTO [dbo].[SalesPeople] (Firstname, Lastname)
VALUES
	('Jim', 'Henricks'),
	('Bob', 'Fatmann')

INSERT INTO [dbo].[Sales] (ProductId)
VALUES 
	(1),
	(2)
GO

-- Insert using Sub-query
INSERT INTO [dbo].[Sales] (ProductId)
VALUES
	((SELECT Id FROM [mySchema].[Products] WHERE [Name] = 'Product1')),
	((SELECT Id FROM [mySchema].[Products] WHERE [Name] = 'Product2'))
GO

 /* Selecting Data
  * --------------
  * Simple selects
  * and joins.
  */

  -- Select ALL columns in table
 SELECT *
 FROM [mySchema].[Products]
 GO

 -- Select specific column by name
 SELECT [Name]
 FROM [mySchema].[Products]
 GO

 -- Select with data transformation
 SELECT Id,
		ProductId,
		FORMAT (SalesDate, 'dd-MM-yyy') AS SalesDate
 FROM [dbo].[Sales]


 -- Join two tables
 SELECT *
 FROM dbo.Sales AS S
 INNER JOIN [mySchema].[Products] AS P ON P.Id = S.ProductId -- Data appended to rows from 'FROM' table.


 /* Using Transactions
  * -------------------
  * Transaction, Commit, Rollback.
  */

  BEGIN TRANSACTION transaction_name
	INSERT INTO [mySchema].[Products] ([Name], Price)
	VALUES ('MyUniqueProductName', 100)
	GO

	DECLARE @InsertedID INT = SCOPE_IDENTITY(); -- Get ID of latest insert statement.

	INSERT INTO dbo.Sales (ProductId, SellerId)
	VALUES (@InsertedID, 1)
	GO

	SELECT *
	FROM dbo.Sales AS S
	INNER JOIN [mySchema].[Products] AS P ON P.Id = S.ProductId

  ROLLBACK;

  -- Check if anything was updated.
  SELECT *
	FROM dbo.Sales AS S
	INNER JOIN [mySchema].[Products] AS P ON P.Id = S.ProductId


	