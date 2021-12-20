CREATE TABLE xPlaysFor (
    Stint_ID    Integer,
    Player_ID   Integer         NOT NULL,
    Team_Abbr   Nvarchar2(3)    NOT NULL,
    Start_Year  Integer         CHECK (Start_Year > 0)  NOT NULL,
    End_Year    Integer         CHECK (End_Year > 0)    NOT NULL,
    
    PRIMARY KEY (Stint_ID),
    FOREIGN KEY (Player_ID) REFERENCES xPlayer,
    FOREIGN KEY (Team_Abbr) REFERENCES xTeam,
    CONSTRAINT Valid_Time CHECK (Start_Year <= End_Year)
);