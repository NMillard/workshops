 USE Workshop;
 GO

 /* Reading data from external files
  * ------------------------------------------
  * Load and read CSV and JSON file
  */


  -- Load JSON
  DECLARE @JSON NVARCHAR(MAX) = (SELECT *
								 FROM OPENROWSET (BULK 'C:\Users\nmillard\Desktop\workshops\T-SQL\Steps\Data/UserList.json', SINGLE_CLOB) AS J);

  -- Create temporary table
  CREATE TABLE #tempUsersFromJSON (
	Username VARCHAR(100),
	IsActive BIT
  )
  
  -- Load JSON data into temp table
  BEGIN
	  INSERT INTO #tempUsersFromJSON (Username, IsActive) -- Target 
	  SELECT *
	  FROM OPENJSON(@JSON) -- Source
	  WITH (
		Username VARCHAR(100) '$.Username',
		IsActive BIT '$.IsActive'
	  );
  END

