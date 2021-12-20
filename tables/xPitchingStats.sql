CREATE TABLE xPitchingStats (
    Player_ID       Integer,
    Year            Integer     CHECK (Year > 0),
    Wins            Integer     CHECK (Wins >= 0)               NOT NULL,
    Loses           Integer     CHECK (Loses >= 0)              NOT NULL,
    Saves           Integer     CHECK (Saves >= 0)              NOT NULL,
    Innings_Pitched Integer     CHECK (Innings_Pitched >= 0)    NOT NULL,
    Outs            Integer     CHECK (Outs BETWEEN 0 AND 2)    NOT NULL,
    Earned_Runs     Integer     CHECK (Earned_Runs >= 0)        NOT NULL,
    Strikeouts      Integer     CHECK (Strikeouts >= 0)         NOT NULL,
    Walks           Integer     CHECK (Walks >= 0)              NOT NULL,
    Hits_Allowed    Integer     CHECK (Hits_Allowed >= 0)       NOT NULL,

    PRIMARY KEY (Player_ID, Year),
    FOREIGN KEY (Player_ID) REFERENCES xPlayer
);