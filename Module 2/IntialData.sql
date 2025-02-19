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

INSERT INTO Answer (Description, PrayerId)
SELECT "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa." Description, pr.PrayerId
FROM Prayer pr
WHERE pr.subject = "School";

INSERT INTO Answer (Description, PrayerId)
SELECT "Nunc viverra imperdiet enim. Fusce est. Vivamus a tellus." Description, pr.PrayerId
FROM Prayer pr
WHERE pr.subject = "School";

INSERT INTO Answer (Description, PrayerId)
SELECT "Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna." Description, pr.PrayerId
FROM Prayer pr
WHERE pr.subject = "Family";

INSERT INTO Answer (Description, PrayerId)
SELECT "Mauris eget neque at sem venenatis eleifend. Ut nonummy." Description, pr.PrayerId
FROM Prayer pr
WHERE pr.subject = "Family";

INSERT INTO Answer (Description, PrayerId)
SELECT "Aenean nec lorem. In porttitor. Donec laoreet nonummy augue." Description, pr.PrayerId
FROM Prayer pr
WHERE pr.subject = "Health";

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
