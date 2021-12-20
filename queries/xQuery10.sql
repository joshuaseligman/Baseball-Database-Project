-- Get the names of players who have only played for teams that 
-- are at least 50 years older than the division they compete in. 
-- Also include the abbreviations of these teams.

CREATE OR REPLACE VIEW xQuery10 AS
SELECT  DISTINCT xPlayer.Player_Name, PlaysForOut.Team_Abbr
FROM    xPlayer JOIN xPlaysFor PlaysForOut ON xPlayer.Player_ID = PlaysForOut.Player_ID
WHERE   PlaysForOut.Player_ID NOT IN
        (SELECT PlaysForIn.Player_ID
         FROM xPlaysFor PlaysForIn
         WHERE PlaysForIn.Team_Abbr NOT IN
                (SELECT     xTeam.Team_Abbr
                 FROM       xTeam JOIN xDivision
                 ON         xTeam.League = xDivision.League
                 AND        xTeam.Region = xDivision.Region
                 WHERE      xTeam.Year_Founded <= xDivision.Year_Founded - 50))
ORDER   BY xPlayer.Player_Name, PlaysForOut.Team_Abbr;
