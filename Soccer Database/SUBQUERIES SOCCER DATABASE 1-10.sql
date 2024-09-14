# 1. From the following table, write a  SQL query to find out which teams played the first match of the 
# 2016 Euro Cup. Return match number, country name.
SELECT MD.MATCH_NO, SC.COUNTRY_NAME FROM MATCH_DETAILS MD, SOCCER_COUNTRY SC
WHERE MD.TEAM_ID = SC.COUNTRY_ID AND MD.MATCH_NO = 1;

# 2. From the following tables, write a  SQL query to find the winner of EURO cup 2016. 
# Return country name.
SELECT COUNTRY_NAME FROM SOCCER_COUNTRY
WHERE COUNTRY_ID = 
	(SELECT TEAM_ID FROM MATCH_DETAILS
    WHERE PLAY_STAGE = 'F' AND WIN_LOSE = 'W');
    
# 3. From the following table, write a  SQL query to find the highest audience match. Return match_no, 
# play_stage, goal_score, audience.
SELECT MATCH_NO, PLAY_STAGE, GOAL_SCORE, AUDENCE FROM MATCH_MAST
WHERE AUDENCE = 
	(SELECT MAX(AUDENCE) FROM MATCH_MAST);

# 4. From the following tables, write a  SQL query to find the match number in which Germany played 
# against Poland. Group the result set on match number. Return match number.
SELECT MATCH_NO FROM MATCH_DETAILS
WHERE TEAM_ID IN 
    (SELECT COUNTRY_ID FROM SOCCER_COUNTRY
     WHERE COUNTRY_NAME IN ('Germany', 'Poland'))
GROUP BY MATCH_NO
HAVING COUNT(DISTINCT TEAM_ID) = 2;

# 5. From the following tables, write a  SQL query to find the result of the match where Portugal 
# played against Hungary. Return match_no, play_stage, play_date, results, goal_score.
SELECT MATCH_NO, PLAY_STAGE, PLAY_DATE, RESULTS, GOAL_SCORE 
FROM MATCH_MAST
WHERE MATCH_NO IN (
    SELECT MATCH_NO 
    FROM MATCH_DETAILS
    WHERE TEAM_ID = (SELECT TEAM_ID FROM SOCCER_COUNTRY WHERE COUNTRY_NAME = 'Portugal')
)
AND MATCH_NO IN (
    SELECT MATCH_NO 
    FROM MATCH_DETAILS
    WHERE TEAM_ID = (SELECT TEAM_ID FROM SOCCER_COUNTRY WHERE COUNTRY_NAME = 'Hungary')
);

# 6. From the following table, write a  SQL query to find the players who scored the most goals 
# in each match. Group the result set on match number, country name and player name. 
# Sort the result-set in ascending order by match number. 
# Return match number, country name, player name and number of matches.
SELECT MATCH_NO, COUNTRY_NAME, PLAYER_NAME, COUNT(MATCH_NO) FROM GOAL_DETAILS GD, SOCCER_COUNTRY SC,
PLAYERS_MAST PM
WHERE GD.TEAM_ID = SC.COUNTRY_ID AND GD.PLAYER_ID = PM.PLAYER_ID
GROUP BY MATCH_NO, COUNTRY_NAME, PLAYER_NAME
ORDER BY MATCH_NO;

# 7. From the following tables, write a  SQL query to find the highest audience match. 
# Return country name of the teams.
SELECT COUNTRY_NAME FROM SOCCER_COUNTRY 
WHERE COUNTRY_ID IN 
	(SELECT TEAM_ID FROM GOAL_DETAILS
    WHERE MATCH_NO = 
		(SELECT MATCH_NO FROM MATCH_MAST
        WHERE AUDENCE = 
			(SELECT MAX(AUDENCE) FROM MATCH_MAST)));

# 8. From the following tables, write a  SQL query to find the player who scored the last goal 
# for Portugal against Hungary. Return player name.
SELECT PM.PLAYER_NAME FROM PLAYERS_MAST PM 
WHERE PM.PLAYER_ID = 
	(SELECT GD.PLAYER_ID FROM GOAL_DETAILS GD 
    WHERE GD.MATCH_NO = 
		(SELECT MD.MATCH_NO FROM MATCH_DETAILS MD 
        WHERE MD.TEAM_ID = 
			(SELECT SC.COUNTRY_ID FROM SOCCER_COUNTRY SC 
            WHERE SC.COUNTRY_NAME = 'Hungary') 
		OR MD.TEAM_ID = 
			(SELECT SC.COUNTRY_ID FROM SOCCER_COUNTRY SC 
            WHERE SC.COUNTRY_NAME = 'Portugal') 
		
        GROUP BY MD.MATCH_NO 
        HAVING COUNT(DISTINCT MD.TEAM_ID) = 2) 
	AND GD.TEAM_ID = 
		(SELECT SC.COUNTRY_ID FROM SOCCER_COUNTRY SC, SOCCER_TEAM ST 
        WHERE SC.COUNTRY_ID = ST.TEAM_ID AND SC.COUNTRY_NAME = 'Portugal') 
	AND GD.GOAL_TIME = 
		(SELECT MAX(GD2.GOAL_TIME) FROM GOAL_DETAILS GD2 
        WHERE GD2.MATCH_NO = 
			(SELECT MD2.MATCH_NO FROM MATCH_DETAILS MD2 
            WHERE MD2.TEAM_ID = 
            (SELECT SC.COUNTRY_ID FROM SOCCER_COUNTRY SC 
            WHERE SC.COUNTRY_NAME = 'Hungary') 
            OR MD2.TEAM_ID = 
				(SELECT SC.COUNTRY_ID FROM SOCCER_COUNTRY SC 
                WHERE SC.COUNTRY_NAME = 'Portugal') 
		GROUP BY MD2.MATCH_NO 
        HAVING COUNT(DISTINCT MD2.TEAM_ID) = 2
    )
  )
);

# 9. From the following table, write a  SQL query to find the second-highest stoppage time in the 
# second half.
SELECT MAX(STOP2_SEC) FROM MATCH_MAST
WHERE STOP2_SEC != 
	(SELECT MAX(STOP2_SEC) FROM MATCH_MAST);

# 10. From the following table, write a  SQL query to find the teams played the match where the 
# second highest stoppage time had been added in the second half of play. Return country name 
# of the teams.
SELECT SC.COUNTRY_NAME 
FROM SOCCER_COUNTRY SC 
WHERE SC.COUNTRY_ID IN (
    SELECT MD.TEAM_ID 
    FROM MATCH_DETAILS MD 
    WHERE MD.MATCH_NO IN (
        SELECT MM.MATCH_NO 
        FROM MATCH_MAST MM 
        WHERE MM.STOP2_SEC = (
            SELECT MAX(MM2.STOP2_SEC) 
            FROM MATCH_MAST MM2 
            WHERE MM2.STOP2_SEC <> (
                SELECT MAX(MM3.STOP2_SEC) 
                FROM MATCH_MAST MM3
            )
        )
    )
);