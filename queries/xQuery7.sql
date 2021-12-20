-- Get the names and positions of players and the locations and names 
-- of the teams they were on that won a World Series in the same year 
-- that the player either hit at least 30 home runs or struck 
-- out at least 200 batters.

CREATE OR REPLACE VIEW xQuery7 AS
SELECT  xPlayer.Player_Name, xPlayer.Position, xTeam.Team_Location, xTeam.Team_Name
FROM    xPlayer JOIN xPlaysFor PlaysForOut ON xPlayer.Player_ID = PlaysForOut.Player_ID
        JOIN xTeam ON PlaysForOut.Team_Abbr = xTeam.Team_Abbr
WHERE   EXISTS
        (SELECT     *
         FROM       xWorldSeries
         WHERE      xTeam.Team_Abbr = xWorldSeries.Winning_Team
         AND        PlaysForOut.Stint_ID = 
                        (SELECT     MAX(PlaysForIn.Stint_ID)
                         FROM       xPlaysFor PlaysForIn
                         WHERE      xWorldSeries.Year BETWEEN PlaysForIn.Start_Year AND PlaysForIn.End_Year
                         AND        xPlayer.Player_ID = PlaysForIn.Player_ID)
         AND        (EXISTS
                    (SELECT     *
                     FROM       xHittingStats
                     WHERE      xHittingStats.Year = xWorldSeries.Year
                     AND        xHittingStats.Player_ID = xPlayer.Player_ID
                     AND        xHittingStats.Home_Runs >= 30)
        OR          EXISTS
                    (SELECT     *
                     FROM       xPitchingStats
                     WHERE      xPitchingStats.Year = xWorldSeries.Year
                     AND        xPitchingStats.Player_ID = xPlayer.Player_ID
                     AND        xPitchingStats.Strikeouts >= 200)))
ORDER   BY xPlayer.Player_Name;