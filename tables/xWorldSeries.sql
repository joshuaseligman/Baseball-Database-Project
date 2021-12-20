CREATE TABLE xWorldSeries (
    Year            Integer         CHECK (Year > 0),
    Winning_Team    Nvarchar2(3)    NOT NULL,
    Losing_Team     Nvarchar2(3)    NOT NULL,
    MVP             Integer         NOT NULL,
    
    PRIMARY KEY (Year),
    FOREIGN KEY (Winning_Team) REFERENCES xTeam (Team_Abbr),
    FOREIGN KEY (Losing_Team) REFERENCES xTeam (Team_Abbr),
    FOREIGN KEY (MVP) REFERENCES xPlayer (Player_ID)
);