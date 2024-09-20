# 1. From the following table, write a  SQL query to find out where the final match of the EURO cup 2016 was 
# played. Return venue name, city.
SELECT SV.VENUE_NAME, SC.CITY FROM SOCCER_VENUE SV
JOIN SOCCER_CITY SC ON SV.CITY_ID = SC.CITY_ID
JOIN MATCH_MAST MM ON MM.VENUE_ID = SV.VENUE_ID
AND MM.PLAY_STAGE = 'F';

# 2. From the following tables, write a  SQL query to find the number of goals scored by each team in 
# each match during normal play. Return match number, country name and goal score.
SELECT MD.MATCH_NO, SC.COUNTRY_NAME, MD.GOAL_SCORE FROM MATCH_DETAILS MD
JOIN SOCCER_COUNTRY SC ON MD.TEAM_ID = SC.COUNTRY_ID
WHERE MD.DECIDED_BY = 'N'
ORDER BY MD.MATCH_NO;

# 3. From the following table, write a  SQL query to count the number of goals scored by each player 
# within a normal play schedule. Group the result set on player name and country name and sorts the 
# result-set according to the highest to the lowest scorer. Return player name, number of goals and 
# country name.
SELECT PM.PLAYER_NAME, SC.COUNTRY_NAME, COUNT(*) AS GOAL_SCORE FROM GOAL_DETAILS GD
JOIN PLAYERS_MAST PM ON GD.PLAYER_ID = PM.PLAYER_ID
JOIN SOCCER_COUNTRY SC ON PM.TEAM_ID = SC.COUNTRY_ID
WHERE GD.GOAL_SCHEDULE = 'NT'
GROUP BY PM.PLAYER_NAME, SC.COUNTRY_NAME
ORDER BY GOAL_SCORE DESC;

# 4. From the following table, write a  SQL query to find out who scored the most goals in 
# the 2016 Euro Cup. Return player name, country name and highest individual scorer.
SELECT PM.PLAYER_NAME, SC.COUNTRY_NAME, COUNT(PM.PLAYER_NAME)
FROM GOAL_DETAILS GD
JOIN PLAYER_MAST PM ON GD.PLAYER_ID = PM.PLAYER_ID
JOIN SOCCER_COUNTRY SC ON PM.TEAM_ID = SC.COUNTRY_ID
GROUP BY SC.COUNTRY_NAME, PM.PLAYER_NAME
HAVING COUNT(PM.PLAYER_NAME) >= ALL (
    SELECT COUNT(PM.PLAYER_NAME)
    FROM GOAL_DETAILS GD
    JOIN PLAYER_MAST PM ON GD.PLAYER_ID = PM.PLAYER_ID
    JOIN SOCCER_COUNTRY SC ON PM.TEAM_ID = SC.COUNTRY_ID
    GROUP BY SC.COUNTRY_NAME, PM.PLAYER_NAME
);

# 5. From the following table, write a  SQL query to find out who scored in the final of the 2016 Euro Cup.
# Return player name, jersey number and country name.
SELECT PM.PLAYER_NAME, PM.JERSEY_NO,SC.COUNTRY_NAME FROM GOAL_DETAILS GD
JOIN PLAYERS_MAST PM ON GD.PLAYER_ID = PM.PLAYER_ID
JOIN SOCCER_COUNTRY SC ON PM.TEAM_ID = SC.COUNTRY_ID
WHERE GD.PLAY_STAGE = 'F';

# 6. From the following tables, write a  SQL query to find out which country hosted the 2016 Football 
# EURO Cup. Return country name.
SELECT DISTINCT SC.COUNTRY_NAME FROM SOCCER_COUNTRY SC
JOIN SOCCER_CITY SC1 ON SC.COUNTRY_ID = SC1.COUNTRY_ID
JOIN SOCCER_VENUE SV ON SC1.CITY_ID = SV.CITY_ID;

# 7. From the following tables, write a SQL query to find out who scored the first goal of the 2016 
# European Championship. Return player_name, jersey_no, country_name, goal_time, play_stage, goal_schedule,
# goal_half.
SELECT PM.PLAYER_NAME, PM.JERSEY_NO, SC.COUNTRY_NAME, GD.GOAL_TIME, GD.PLAY_STAGE, GD.GOAL_SCHEDULE,
GD.GOAL_HALF FROM SOCCER_COUNTRY SC
JOIN PLAYERS_MAST PM ON SC.COUNTRY_ID = PM.TEAM_ID
JOIN GOAL_DETAILS GD ON PM.PLAYER_ID = GD.PLAYER_ID
WHERE GD.GOAL_ID = 1;

# 8. From the following tables, write a  SQL query to find the referee who managed the opening match. 
# Return referee name, country name.
SELECT RM.REFEREE_NAME, SC.COUNTRY_NAME FROM SOCCER_COUNTRY SC
JOIN REFEREE_MAST RM ON SC.COUNTRY_ID = RM.COUNTRY_ID
JOIN MATCH_MAST MM ON RM.REFEREE_ID = MM.REFEREE_ID
WHERE MM.MATCH_NO = 1;

# 9. From the following tables, write a  SQL query to find the referee who managed the final match. 
# Return referee name, country name.
SELECT RM.REFEREE_NAME, SC.COUNTRY_NAME FROM SOCCER_COUNTRY SC
JOIN REFEREE_MAST RM ON SC.COUNTRY_ID = RM.COUNTRY_ID
JOIN MATCH_MAST MM ON RM.REFEREE_ID = MM.REFEREE_ID
WHERE MM.PLAY_STAGE = 'F';

# 10. From the following tables, write a  SQL query to find the referee who assisted the referee in 
# the opening match. Return associated referee name, country name.
SELECT ARM.ASS_REF_NAME, SC.COUNTRY_NAME FROM ASST_REFEREE_MAST ARM
JOIN SOCCER_COUNTRY SC ON ARM.COUNTRY_ID = SC.COUNTRY_ID
JOIN MATCH_DETAILS MD ON ARM.ASS_REF_ID = MD.ASS_REF
WHERE MD.MATCH_NO = 1;