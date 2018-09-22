  USE Workshop;
  GO

  /* Create procedures
   * ------------------
   */


   CREATE PROCEDURE insert_new_user @Username VARCHAR(100)
   AS
   INSERT INTO Users (Username)
   VALUES (@Username)