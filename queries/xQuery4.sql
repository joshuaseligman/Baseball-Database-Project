-- Name all players, the years in which they hit at least 30 home runs, 
-- if any, and their final home run total for those years only.

CREATE OR REPLACE VIEW xQuery4 AS
SELECT  xPlayer.Player_Name, xHittingStats.Year, xHittingStats.Home_Runs
FROM    xPlayer LEFT JOIN xHittingStats
ON      xPlayer.Player_ID = xHittingStats.Player_ID
AND     xHittingStats.Home_Runs >= 30;