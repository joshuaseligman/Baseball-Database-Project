CREATE TABLE xRival (
    Team_1      Nvarchar2(3),
    Team_2      Nvarchar2(3),
    
    PRIMARY KEY (Team_1, Team_2),
    FOREIGN KEY (Team_1) REFERENCES xTeam (Team_Abbr),
    FOREIGN KEY (Team_2) REFERENCES xTeam (Team_Abbr)
);