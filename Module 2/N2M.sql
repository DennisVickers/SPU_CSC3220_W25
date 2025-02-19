--
-- MANY-TO-MANY SELECT
--
SELECT pr.Request,
       pe.FirstName,
       pe.LastName
 FROM ForPerson fp
 INNER JOIN Prayer pr ON fp.PrayerId = pr.PrayerId
 INNER JOIN Person pe ON fp.PersonId = pe.PersonId
 WHERE pr.Status = 0;
 
SELECT pr.Request,
       pr.Subject,
       th.Description
 FROM ForThing ft
 INNER JOIN Prayer pr ON ft.PrayerId = pr.PrayerId
 INNER JOIN Thing th ON ft.ThingId = th.ThingId;
 
 