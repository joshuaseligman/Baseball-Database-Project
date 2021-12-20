-- Get the names of players and the league and region of divisions 
-- where the player has only played for teams in the given division.

CREATE OR REPLACE VIEW xQuery2 AS
SELECT  xPlayer.Player_Name, xDivision.League, xDivision.Region
FROM    xPlayer, xDivision
WHERE   xPlayer.Player_ID NOT IN
        (SELECT     xPlaysFor.Player_ID
         FROM       xPlaysFor
         WHERE      xPlaysFor.Team_Abbr NOT IN
                    (SELECT     xTeam.Team_Abbr
                     FROM       xTeam
                     WHERE      xTeam.League = xDivision.League
                     AND        xTeam.Region = xDivision.Region));        