--
-- File generated with SQLiteStudio v3.4.15 on Fri Feb 14 13:59:49 2025
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Answer
DROP TABLE IF EXISTS Answer;

CREATE TABLE IF NOT EXISTS Answer (
    AnswerId    INTEGER PRIMARY KEY AUTOINCREMENT,
    Description TEXT    NOT NULL,
    PrayerId    INTEGER REFERENCES Prayer (PrayerId) 
)
STRICT;


-- Table: ForPerson
DROP TABLE IF EXISTS ForPerson;

CREATE TABLE IF NOT EXISTS ForPerson (
    PersonId INTEGER REFERENCES Person (PersonId) 
                     NOT NULL,
    PrayId   INTEGER REFERENCES Prayer (PrayerId) 
                     NOT NULL,
    PRIMARY KEY (
        PersonId,
        PrayId
    )
)
STRICT;


-- Table: ForThing
DROP TABLE IF EXISTS ForThing;

CREATE TABLE IF NOT EXISTS ForThing (
    ThingId  INTEGER NOT NULL
                     REFERENCES Thing (ThingId),
    PrayerId INTEGER NOT NULL
                     REFERENCES Prayer (PrayerId),
    PRIMARY KEY (
        ThingId,
        PrayerId
    )
)
STRICT;


-- Table: Log
DROP TABLE IF EXISTS Log;

CREATE TABLE IF NOT EXISTS Log (
    LogId    INTEGER PRIMARY KEY AUTOINCREMENT,
    LogDT    TEXT    NOT NULL,
    PrayerId INTEGER REFERENCES Prayer (PrayerId) 
)
STRICT;


-- Table: Person
DROP TABLE IF EXISTS Person;

CREATE TABLE IF NOT EXISTS Person (
    PersonId  INTEGER PRIMARY KEY AUTOINCREMENT,
    FirstName TEXT    NOT NULL,
    LastName  TEXT    NOT NULL
)
STRICT;


-- Table: Prayer
DROP TABLE IF EXISTS Prayer;

CREATE TABLE IF NOT EXISTS Prayer (
    PrayerId INTEGER PRIMARY KEY AUTOINCREMENT,
    Subject  TEXT,
    Request  TEXT    NOT NULL,
    Status   INT     NOT NULL
                     DEFAULT (0) 
)
STRICT;


-- Table: Thing
DROP TABLE IF EXISTS Thing;

CREATE TABLE IF NOT EXISTS Thing (
    ThingId     INTEGER PRIMARY KEY AUTOINCREMENT,
    Type        INTEGER NOT NULL
                        DEFAULT (0),
    Description TEXT    NOT NULL
)
STRICT;


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
