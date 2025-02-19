PRAGMA foreign_keys = off;
BEGIN TRANSACTION;DELETE FROM Prayer;

DELETE FROM sqlite_sequence WHERE name = 'Prayer';
DELETE FROM Person;
DELETE FROM sqlite_sequence WHERE name = 'Person';
DELETE FROM Thing;
DELETE FROM sqlite_sequence WHERE name = 'Thing';
DELETE FROM ForPerson;
DELETE FROM ForThing;
DELETE FROM Answer;
DELETE FROM sqlite_sequence WHERE name = 'Answer';

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;