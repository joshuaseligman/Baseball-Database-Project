-- Get the names of players, the team abbreviation, and the start 
-- and end years of their time with the team who were All-Stars for 
-- none of the years they played in Los Angeles or in New York.

CREATE OR REPLACE VIEW xQuery3 AS
SELECT  xPlayer.Player_Name, xPlaysFor.Team_Abbr, xPlaysFor.Start_Year, xPlaysFor.End_Year
FROM    xPlayer JOIN xPlaysFor ON xPlayer.Player_ID = xPlaysFor.Player_ID
WHERE   EXISTS
        (SELECT     *
         FROM       xTeam
         WHERE      ((xTeam.Team_Location = 'New York'
         OR          xTeam.Team_Location = 'Los Angeles')
         AND         xTeam.Team_Abbr = xPlaysFor.Team_Abbr)
         AND        NOT EXISTS
                    (SELECT     *
                     FROM       xAllStar
                     WHERE      xAllStar.Year BETWEEN xPlaysFor.Start_Year AND xPlaysFor.End_Year
                     AND        xPlayer.Player_ID = xAllStar.Player_ID));