CREATE TABLE xAllStarGame (
    Year            Integer     CHECK (Year > 0),
    Winning_Team    Char(2)     Check (Winning_Team IN ('AL', 'NL'))    NOT NULL,
    Played_In       Integer     NOT NULL,
    MVP             Integer     NOT NULL,
    
    PRIMARY KEY (Year),
    FOREIGN KEY (Played_In) REFERENCES xBallpark (Ballpark_ID),
    FOREIGN KEY (MVP) REFERENCES xPlayer (Player_ID)
);