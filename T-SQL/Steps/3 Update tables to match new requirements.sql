   USE Workshop;
   GO

  /* Update tables
   * ---------------
   * Modify, alter, and add constraints
   */

   -- Roles now have a priority level
   ALTER TABLE Roles
	   ADD PriorityLevel INT CONSTRAINT CH_Allowed_Priority_Level_Values CHECK(PriorityLevel IN (1, 2, 3));
   GO

   -- Users now have an active state
   -- Update existing rows to have state = 1 and then drop default constraint
  BEGIN
	ALTER TABLE Users
	ADD IsActive BIT NOT NULL CONSTRAINT DF_Set_User_To_Active DEFAULT(1);

	ALTER TABLE Users
	DROP CONSTRAINT DF_Set_User_To_Active;
  END