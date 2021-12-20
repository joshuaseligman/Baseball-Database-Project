-- Get the names and positions of players who have played in 
-- every All-Star Game since 2015.

CREATE OR REPLACE VIEW xQuery1 AS
SELECT  xPlayer.Player_Name, xPlayer.Position
FROM    xPlayer
WHERE   NOT EXISTS
        (SELECT     *
         FROM       xAllStarGame
         WHERE      NOT EXISTS
                    (SELECT     *
                     FROM       xAllStar
                     WHERE      xPlayer.Player_ID = xAllStar.Player_ID
                     AND        xAllStarGame.Year = xAllStar.Year));
         