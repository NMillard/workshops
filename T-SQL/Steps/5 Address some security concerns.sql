  USE Workshop;
  GO

  /* Address some security concerns
   * -------------------------------
   * schemas, logins, users, views, and
   * move stored procedure to new schema
   */

   -- Create new schema
   CREATE SCHEMA secure;
   GO

   -- Move stored procedure from 'dbo' to 'secure' schema
   ALTER SCHEMA secure TRANSFER dbo.insert_new_user;
   GO

   CREATE LOGIN MyNewLogin WITH PASSWORD = 'MyPassword1*'; -- Access to SERVER
   CREATE USER MyNewUser FOR LOGIN MyNewLogin; -- Access to DATABASE
   GO

   -- Create view on 'secure' schema
   CREATE VIEW secure.user_overview
   AS
	   SELECT Username, Firstname, Lastname
	   FROM dbo.Users;
   GO

   -- Grant SELECT permission on everything on the 'secure' schema
   GRANT SELECT ON SCHEMA::secure TO MyNewUser;

   -- Grant EXECUTE permission on stored procedure
   GRANT EXECUTE ON OBJECT::secure.insert_new_user TO MyNewUser;
   GO


   