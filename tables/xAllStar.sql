CREATE TABLE xAllStar (
    Player_ID   Integer,
    Year        Integer,
    
    PRIMARY KEY (Player_ID, Year),
    FOREIGN KEY (Player_ID) REFERENCES xPlayer,
    FOREIGN KEY (Year) REFERENCES xAllStarGame
);