-- Get the year in addition to the name and batting side of 
-- the player who has the highest batting average throughout baseball. 
-- Batting average is computed by adding up a player’s singles, doubles, 
-- triples, and home runs and dividing the sum by their at-bats. To be 
-- qualified for this award, players must have at least 200 plate 
-- appearances (at-bats plus walks).

CREATE OR REPLACE VIEW xQuery8 AS
SELECT  StatsOut.Year, xPlayer.Player_Name, xPlayer.Bats
FROM    xPlayer JOIN xHittingStats StatsOut ON xPlayer.Player_ID = StatsOut.Player_ID
WHERE   (StatsOut.Singles + StatsOut.Doubles +
        StatsOut.Triples + StatsOut.Home_Runs) / StatsOut.At_Bats IN
            (SELECT     MAX((StatsIn.Singles + StatsIn.Doubles +
                        StatsIn.Triples + StatsIn.Home_Runs) / StatsIn.At_Bats)
                        AS MAX_AVG
             FROM       xHittingStats StatsIn
             WHERE      StatsIn.At_Bats + StatsIn.Walks >= 200
             AND        StatsOut.Year = StatsIn.Year)
ORDER   BY StatsOut.Year;