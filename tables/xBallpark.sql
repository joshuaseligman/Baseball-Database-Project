CREATE TABLE xBallpark (
    Ballpark_ID     Integer,
    Ballpark_Name   Nvarchar2(30)   NOT NULL    UNIQUE,
    Capacity        INTEGER         CHECK (Capacity > 0)    NOT NULL,
    Year_Built      Integer         CHECK (Year_Built > 0)  NOT NULL,
    Team_Abbr       Nvarchar2(3)    NOT NULL    UNIQUE,
    
    PRIMARY KEY (Ballpark_ID)
);

-- Add this constraint after all data has been loaded
ALTER TABLE xBallpark
ADD FOREIGN KEY (Team_Abbr) REFERENCES xTeam;