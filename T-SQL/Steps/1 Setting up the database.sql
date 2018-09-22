 
 /* Setting up the initial database structure
  * ------------------------------------------
  * Tables with foreign and primary keys.
  */


 USE master; -- Remember to use master
 GO


 /* Create database
  * ----------------
  */
 CREATE DATABASE Workshop
 GO


 /* Set up tables
  *---------------
  * Users <- Users in the system
  * Roles <- Roles a user can have
  * UsersRoles <- many-to-many relationship between Users and Roles
  * Products
  */

 USE Workshop;
 GO

 CREATE TABLE Users (
	Id INT IDENTITY (1, 1) NOT NULL,
	Username VARCHAR(100) NOT NULL,
	Firstname VARCHAR(100),
	Lastname VARCHAR(100),
	CONSTRAINT PK_Users_Id PRIMARY KEY(Id)
 )
 GO

 CREATE TABLE Roles (
	Id INT IDENTITY (1, 1) NOT NULL,
	[Name] VARCHAR(100),
	CONSTRAINT PK_Roles_Id PRIMARY KEY(Id)
 )
 GO

 CREATE TABLE UsersRoles (
	UserId INT NOT NULL,
	RoleId INT NOT NULL,
	CONSTRAINT FK_UsersRoles_Users_UserId FOREIGN KEY(UserId) REFERENCES Users(Id),
	CONSTRAINT FK_UsersRoles_Roles_RoleId FOREIGN KEY(RoleId) REFERENCES Roles(Id)
 )
 GO

 CREATE TABLE Products (
	Id INT IDENTITY (1, 1) NOT NULL,
	[Name] VARCHAR(200) NOT NULL,
	Price DECIMAL(19, 4) NOT NULL,
	CONSTRAINT PK_Products_Id PRIMARY KEY(Id)
 )
 GO