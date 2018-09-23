 USE Workshop;
 GO

 /* Changing existing data
  * ------------------------------------------
  * Remember WHERE clauses. Without WHERE, all rows
  * will get updated/deleted
  */

  -- Update specific User's username
  BEGIN TRANSACTION
	  UPDATE dbo.Users
	  SET Username = 'Tim Burry'
	  WHERE Username = 'Jimmy Dudeso';

	  IF @@ROWCOUNT != 1
		PRINT 'No row updated.'
  COMMIT

  -- Delete user
  BEGIN TRANSACTION
	DECLARE @UserToDeleteById INT;

	-- 1. Get user ID of the user that needs to be deleted
	SET @UserToDeleteById = (SELECT Id
							 FROM Users
							 WHERE Username = 'Tom Dunckleberry');

	-- 2. Delete the user from users-roles table
	DELETE FROM UsersRoles
	WHERE UserId = @UserToDeleteById;
	
	-- 3. then delete user from users table
	DELETE FROM Users
	WHERE Id = @UserToDeleteById;

	-- SELECT * FROM dbo.Users; -- Uncomment to see result of transaction before rollback is called
  ROLLBACK;