--
-- ONE-TO-MANY SELECT
--
SELECT p.Request,
       a.Description
 FROM Prayer p
 INNER JOIN Answer a ON p.PrayerId = a.PrayerId
 WHERE p.Subject="School";
 
SELECT p.Request,
       a.Description
 FROM Answer a
 INNER JOIN Prayer p ON p.PrayerId = a.PrayerId
 WHERE p.Subject="Family";
 

 
 