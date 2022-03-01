DROP TABLE IF EXISTS "Characteristic";
CREATE TABLE Characteristic (
    cid                 INTEGER PRIMARY KEY,
    characteristic_name TEXT NOT NULL,
    category            TEXT
);

DROP TABLE IF EXISTS "CompilerBug";
CREATE TABLE CompilerBug (
    bid                 INTEGER PRIMARY KEY,
    bug_id              TEXT NOT NULL,
    language            TEXT NOT NULL,
    compiler            TEXT NOT NULL,
    title               TEXT NOT NULL,
    issue_tracker_link  TEXT NOT NULL,
    fix_link            TEXT NOT NULL,
    mutator             TEXT NOT NULL,
    severity            TEXT,
    status              TEXT,
    resolution          TEXT,
    report_date         TEXT,
    resolution_date     TEXT,
    symptom             TEXT,
    resolved_in         INTEGER,
    test                TEXT,
    error_msg           TEXT
);

DROP TABLE IF EXISTS "CompilerBugCharacteristics"
CREATE TABLE CompilerBugCharacteristics (
    bcid                INTEGER PRIMARY KEY,
    cid                 INTEGER NOT NULL,
    bid                 INTEGER NOT NULL,
    FOREIGN KEY (cid) REFERENCES Characteristic (cid),
    FOREIGN KEY (bid) REFERENCES CompilerBug (bid),
);
