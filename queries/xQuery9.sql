-- Get the locations and names of teams and the league they are in 
-- that have hosted an All-Star Game, whose league won the All-Star Game, 
-- and had their own player win All-Star MVP in that same year.

CREATE OR REPLACE VIEW xQuery9 AS
SELECT  xTeam.Team_Location, xTeam.Team_Name, xTeam.League
FROM    xTeam
WHERE   EXISTS
        (SELECT     *
         FROM       xAllStarGame
         WHERE      xTeam.Home_Ballpark = xAllStarGame.Played_In
         AND        xAllStarGame.Winning_Team = xTeam.League
         AND        EXISTS
                    (SELECT     *
                     FROM       xPlaysFor
                     WHERE      xAllStarGame.MVP = xPlaysFor.Player_ID
                     AND        xTeam.Team_Abbr = xPlaysFor.Team_Abbr
                     AND        xAllStarGame.Year BETWEEN xPlaysFor.Start_Year AND xPlaysFor.End_Year));