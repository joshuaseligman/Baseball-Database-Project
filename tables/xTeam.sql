CREATE TABLE xTeam (
    Team_Abbr       Nvarchar2(3),
    Team_Location   Nvarchar2(20)   NOT NULL,
    Team_Name       Nvarchar2(20)   NOT NULL    UNIQUE,
    Year_Founded    Integer         CHECK (Year_Founded > 0)    NOT NULL,
    League          Char(2)         NOT NULL,
    Region          Nvarchar2(7)    NOT NULL,
    Home_Ballpark   Integer         NOT NULL    UNIQUE,
    
    PRIMARY KEY (Team_Abbr),
    FOREIGN KEY (League, Region) REFERENCES xDivision
);

-- Add this constraint after all data has been loaded
ALTER TABLE xTeam
ADD FOREIGN KEY (Home_Ballpark) REFERENCES xBallpark (Ballpark_ID);