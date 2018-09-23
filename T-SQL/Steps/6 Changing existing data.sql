 USE Workshop;
 GO

 /* Changing existing data
  * ------------------------------------------
  * 
  */

  UPDATE Users
  SET Username = 'Jimmy Dudeson'
  WHERE Username = 'Tim Burry'