PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

INSERT INTO Prayer (Subject, Request) VALUES
('Health','Prayer for health'),
('School','Prayer for SPU'),
('Nation','Prayer for Nation'),
('Family','Prayer for family'),
('Work', 'Prayer for a new job');

INSERT INTO Thing (Type, Description) VALUES
(0,'General'),
(1,'Seattle Pacific University'),
(2,'USA'),
(3, 'Prayer for a new job');

INSERT INTO Person (FirstName, LastName) VALUES
('Emily','Vickers'),
('Wendy','Vickers');

INSERT INTO ForPerson (PersonId, PrayerId)
SELECT pe.PersonId, pr.PrayerId
FROM Prayer pr
JOIN Person pe ON pe.FirstName = 'Emily' or pe.FirstName = 'Wendy'
WHERE pr.subject = "Family";

INSERT INTO ForThing (ThingId, PrayerId)
SELECT th.ThingId, pr.PrayerId
FROM Prayer pr
JOIN Thing th ON th.Type = 1
WHERE pr.subject = "School";

INSERT INTO ForThing (ThingId, PrayerId)
SELECT th.ThingId, pr.PrayerId
FROM Prayer pr
JOIN Thing th ON th.Type = 2
WHERE pr.subject = "Nation";

INSERT INTO ForThing (ThingId, PrayerId)
SELECT th.ThingId, pr.PrayerId
FROM Prayer pr
JOIN Thing th ON th.Type = 3
WHERE pr.subject = "Work";

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
