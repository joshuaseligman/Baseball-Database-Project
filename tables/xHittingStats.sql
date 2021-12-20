CREATE TABLE xHittingStats (
    Player_ID       Integer,
    Year            Integer     CHECK (Year > 0),
    At_Bats         Integer     CHECK (At_Bats > 0)          NOT NULL,
    Singles         Integer     CHECK (Singles >= 0)         NOT NULL,
    Doubles         Integer     CHECK (Doubles >= 0)         NOT NULL,
    Triples         Integer     CHECK (Triples >= 0)         NOT NULL,
    Home_Runs       Integer     CHECK (Home_Runs >= 0)       NOT NULL,
    Strikeouts      Integer     CHECK (Strikeouts >= 0)      NOT NULL,
    Walks           Integer     CHECK (Walks >= 0)           NOT NULL,
    Runs_Batted_In  Integer     CHECK (Runs_Batted_In >= 0)  NOT NULL,
    
    PRIMARY KEY (Player_ID, Year),
    FOREIGN KEY (Player_ID) REFERENCES xPlayer
);