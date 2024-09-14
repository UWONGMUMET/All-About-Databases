# 11. From the following table, write a  SQL query to find the teams played the match where second 
# highest stoppage time had been added in second half of play. Return match_no, play_date, stop2_sec.
SELECT MATCH_NO, PLAY_DATE, STOP2_SEC 
FROM MATCH_MAST
WHERE STOP2_SEC IN 
	(SELECT MAX(STOP2_SEC) FROM MATCH_MAST
    WHERE STOP2_SEC < 
		(SELECT MAX(STOP2_SEC) FROM MATCH_MAST));

# 12. From the following tables, write a  SQL query to find the team, which was defeated by 
# Portugal in EURO cup 2016 final. Return the country name of the team.
SELECT COUNTRY_NAME FROM SOCCER_COUNTRY
WHERE COUNTRY_ID IN 
	(SELECT TEAM_ID FROM MATCH_DETAILS
    WHERE PLAY_STAGE = 'F' AND WIN_LOSE = 'L');

# 13. From the following table, write a  SQL query to find the club, which supplied the most 
# number of players to the 2016-EURO cup. Return club name, number of players.
SELECT PLAYING_CLUB, COUNT(PLAYING_CLUB) 
FROM PLAYERS_MAST  
GROUP BY PLAYING_CLUB 
HAVING COUNT(PLAYING_CLUB) = ( 
    SELECT MAX(MYCOUNT) 
    FROM ( 
        SELECT PLAYING_CLUB, COUNT(PLAYING_CLUB) AS MYCOUNT 
        FROM PLAYERS_MAST 
        GROUP BY PLAYING_CLUB
    ) PM
);

# 14. From the following tables, write a  SQL query to find the player 
# who scored the first penalty of the tournament. Return player name and Jersey number.
SELECT PLAYER_NAME, JERSEY_NO FROM PLAYERS_MAST
WHERE PLAYER_ID IN 
	(SELECT PLAYER_ID FROM GOAL_DETAILS
    WHERE GOAL_TYPE = 'P'
    AND MATCH_NO = 
		(SELECT MIN(MATCH_NO) FROM GOAL_DETAILS));

# 15. From the following tables, write a  SQL query to find the player who scored the first 
# penalty in the tournament. Return player name, Jersey number and country name.
SELECT DISTINCT PM.PLAYER_NAME, PM.JERSEY_NO, SC.COUNTRY_NAME 
FROM PLAYERS_MAST PM, GOAL_DETAILS GD, SOCCER_COUNTRY SC
WHERE PM.PLAYER_ID = GD.PLAYER_ID AND GD.TEAM_ID = SC.COUNTRY_ID
AND PM.PLAYER_ID = 
	(SELECT GD.PLAYER_ID FROM GOAL_DETAILS GD
    WHERE GD.GOAL_TYPE = 'P'
    AND GD.MATCH_NO = 
		(SELECT MIN(MATCH_NO) FROM GOAL_DETAILS GD));
        
# 16. From the following tables, write a  SQL query to find the goalkeeper for Italy in 
# penalty shootout against Germany in Football EURO cup 2016. Return goalkeeper name.
SELECT PLAYER_NAME FROM PLAYER_MAST 
WHERE PLAYER_ID = 
	(SELECT PLAYER_GK FROM PENALTY_GK 
    WHERE MATCH_NO = 
		(SELECT MATCH_NO FROM PENALTY_GK 
        WHERE TEAM_ID = 
			(SELECT COUNTRY_ID FROM SOCCER_COUNTRY 
            WHERE COUNTRY_NAME = 'Italy') 
        OR TEAM_ID = (
            SELECT COUNTRY_ID 
            FROM SOCCER_COUNTRY 
            WHERE COUNTRY_NAME = 'Germany'
        ) 
        GROUP BY MATCH_NO 
        HAVING COUNT(DISTINCT TEAM_ID) = 2
    ) 
    AND TEAM_ID = (
        SELECT COUNTRY_ID 
        FROM SOCCER_COUNTRY 
        WHERE COUNTRY_NAME = 'Italy'
    )
);

# 17. From the following tables, write a  SQL query to find the number of
# goals Germany scored at the tournament.
SELECT COUNT(GOAL_ID) FROM GOAL_DETAILS 
WHERE TEAM_ID IN 
	(SELECT COUNTRY_ID FROM SOCCER_COUNTRY
    WHERE COUNTRY_NAME = 'Germany');

# 18. From the following table, write a  SQL query to find the players who were the 
# goalkeepers of the England team that played in the 2016-EURO. Return player name, 
# jersey number, club name
SELECT PLAYER_NAME, JERSEY_NO, PLAYING_CLUB FROM PLAYERS_MAST
WHERE POSI_TO_PLAY = 'GK' AND TEAM_ID = 
	(SELECT COUNTRY_ID FROM SOCCER_COUNTRY
    WHERE COUNTRY_NAME = 'England');

# 19. From the following table, write a  SQL query to find the Liverpool players who were part of 
# England's squad at the 2016 Euro Cup. Return player name, jersey number, and position to play, age.
SELECT PLAYER_NAME, JERSEY_NO, PLAYING_CLUB FROM PLAYERS_MAST
WHERE PLAYING_CLUB = 'Liverpool' AND TEAM_ID = 
	(SELECT COUNTRY_ID FROM SOCCER_COUNTRY
    WHERE COUNTRY_NAME = 'England');
    
# 20. From the following table, write a  SQL query to find the players who scored 
# the last goal in the second semi-final, i.e., the 50th match of the 2016-EURO Cup. 
# Return player name, goal time, goal half, country name.
SELECT PM.PLAYER_NAME, GD.GOAL_TIME, GD.GOAL_HALF, SC.COUNTRY_NAME
FROM PLAYER_MAST PM, GOAL_DETAILS GD, SOCCER_COUNTRY SC
WHERE PM.PLAYER_ID = GD.PLAYER_ID
AND GD.TEAM_ID = SC.COUNTRY_ID
AND GD.MATCH_NO = 50
AND GD.GOAL_TIME = (
    SELECT MAX(GOAL_TIME)
    FROM GOAL_DETAILS
    WHERE MATCH_NO = 50
);