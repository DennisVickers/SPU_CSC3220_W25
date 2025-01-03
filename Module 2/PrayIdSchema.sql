--
-- File generated with SQLiteStudio v3.4.4 on Wed May 1 15:59:13 2024
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Answer
CREATE TABLE Answer (
    AnswerId    INTEGER PRIMARY KEY AUTOINCREMENT,
    Description TEXT    NOT NULL,
    PrayerId    INTEGER REFERENCES Prayer (PrayerId) 
)
STRICT;


-- Table: Connection
CREATE TABLE Connection (
    CType INTEGER UNIQUE
                  NOT NULL
                  PRIMARY KEY,
    CDesc TEXT    NOT NULL
)
STRICT;


-- Table: ForPerson
CREATE TABLE ForPerson (
    PersonId INTEGER NOT NULL
                     REFERENCES Person (PersonId),
    PrayerId INTEGER NOT NULL
                     REFERENCES Prayer (PrayerId),
    PRIMARY KEY (
        PersonId,
        PrayerId
    )
);


-- Table: ForThing
CREATE TABLE ForThing (
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
CREATE TABLE Log (
    LogId    INTEGER PRIMARY KEY AUTOINCREMENT,
    LogDT    TEXT    NOT NULL,
    PrayerId INTEGER REFERENCES Prayer (PrayerId) 
                     NOT NULL
)
STRICT;


-- Table: Meditation
CREATE TABLE Meditation (
    MedId       INTEGER PRIMARY KEY AUTOINCREMENT,
    Description TEXT,
    Reference   TEXT,
    RefType     INTEGER,
    PrayerId    INTEGER REFERENCES Prayer (PrayerId) 
)
STRICT;


-- Table: Person
CREATE TABLE Person (
    PersonId  INTEGER PRIMARY KEY AUTOINCREMENT,
    FirstName TEXT    NOT NULL,
    LastName  TEXT    NOT NULL,
    CType     INTEGER REFERENCES Connection (CType) 
)
STRICT;


-- Table: Prayer
CREATE TABLE Prayer (
    PrayerId INTEGER PRIMARY KEY AUTOINCREMENT,
    Subject  TEXT,
    Request  TEXT    NOT NULL,
    Status   ANY     NOT NULL
                     AS (0) 
)
STRICT;


-- Table: Tags
CREATE TABLE Tags (
    TagId INTEGER PRIMARY KEY AUTOINCREMENT,
    TName TEXT    NOT NULL
                  UNIQUE
)
STRICT;


-- Table: TagXref
CREATE TABLE TagXref (
    TagId    INTEGER NOT NULL
                     REFERENCES Tags (TagId),
    PrayerId INTEGER REFERENCES Prayer (PrayerId) 
                     NOT NULL,
    PRIMARY KEY (
        TagId,
        PrayerId
    )
)
STRICT;


-- Table: Thing
CREATE TABLE Thing (
    ThingId     INTEGER PRIMARY KEY AUTOINCREMENT,
    Type        INTEGER NOT NULL
                        AS (0),
    Description TEXT    NOT NULL
)
STRICT;


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
