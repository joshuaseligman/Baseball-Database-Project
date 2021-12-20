-- Get the locations and names of teams and the years in which 
-- they had multiple players in the All-Star Game, if any.

CREATE OR REPLACE VIEW xQuery5 AS
SELECT  DISTINCT AllStarOut.Year, xTeam.Team_Location, xTeam.Team_Name
FROM    xAllStar AllStarOut JOIN xPlaysFor PlaysForOut
ON      AllStarOut.Player_ID = PlaysForOut.Player_ID
        RIGHT JOIN xTeam
ON      PlaysForOut.Team_Abbr = xTeam.Team_Abbr
AND     1 <
            (SELECT     COUNT(*)
             FROM       xAllStar AllStarIn JOIN xPlaysFor PlaysForIn
             ON         AllStarIn.Player_ID = PlaysForIn.Player_ID
             WHERE      AllStarOut.Year = AllStarIn.Year
             AND        AllStarIn.Year BETWEEN PlaysForIn.Start_Year AND PlaysForIn.End_Year
             AND        PlaysForIn.Team_Abbr = xTeam.Team_Abbr)
ORDER   BY xTeam.Team_Location, xTeam.Team_Name, AllStarOut.Year;