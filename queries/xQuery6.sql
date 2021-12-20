-- Get the locations and names of rival teams and the name of either 
-- team’s home ballpark if it has a capacity greater than 42,000, if any, 
-- and list the names of the remaining home ballparks for the rival teams.

CREATE OR REPLACE VIEW xQuery6 AS
SELECT  Team1.Team_Location AS Team_1_Location, Team1.Team_Name AS Team_1_Name, 
        Team2.Team_Location AS Team_2_Location, Team2.Team_Name AS Team_2_Name, 
        xBallpark.Ballpark_Name
FROM    xTeam Team1 JOIN xRival RivalOut 
ON      Team1.Team_Abbr = RivalOut.Team_1
        JOIN xTeam Team2
ON      Team2.Team_Abbr = RivalOut.Team_2
        FULL JOIN xBallpark 
ON      (xBallpark.Team_Abbr = Team1.Team_Abbr 
OR      xBallpark.Team_Abbr = Team2.Team_Abbr)
AND     xBallpark.Capacity > 42000
WHERE   xBallpark.Ballpark_ID IS NULL
OR      xBallpark.Ballpark_ID IN
            (SELECT TeamIn.Home_Ballpark
             FROM xTeam TeamIn
             WHERE TeamIn.Team_Abbr IN
                    (SELECT RivalIn1.Team_1
                     FROM xRival RivalIn1
                     
                     UNION
                     
                     SELECT RivalIn2.Team_2
                     FROM xRival RivalIn2));