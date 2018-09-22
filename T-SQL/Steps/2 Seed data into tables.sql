 
 /* Seeding data into tables
  * ------------------------------------------
  * 
  */

  INSERT INTO Users (Username)
  VALUES ('Tim Burry'),
		 ('Dickle Dickings'),
		 ('Tom Dunckleberry'),
		 ('Peter Jensen')
  GO

  INSERT INTO Roles ([Name])
  VALUES ('Admin'),
		 ('Employee'),
		 ('Project leader'),
		 ('Regular')
  GO

  INSERT INTO UsersRoles (RoleId, UserId)
  VALUES ((SELECT Id FROM Roles WHERE [Name] = 'Admin'), (SELECT Id FROM Users WHERE Username = 'Tim Burry')),
		 ((SELECT Id FROM Roles WHERE [Name] = 'Employee'), (SELECT Id FROM Users WHERE Username = 'Dickle Dickings')),
	     ((SELECT Id FROM Roles WHERE [Name] = 'Employee'), (SELECT Id FROM Users WHERE Username = 'Tom Dunckleberry')),
		 ((SELECT Id FROM Roles WHERE [Name] = 'Employee'), (SELECT Id FROM Users WHERE Username = 'Peter Jensen')),
		 ((SELECT Id FROM Roles WHERE [Name] = 'Project leader'), (SELECT Id FROM Users WHERE Username = 'Peter Jensen'))
  GO

  INSERT INTO Products ([Name], Price)
  VALUES ('Awesome crackers', 10.3),
		 ('Pudding', 3.1),
		 ('Ducklings', 91)
  GO

