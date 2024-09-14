# 21. From the following table, write a  SQL query to find out who was the captain of Portugal's 
# winning EURO cup 2016 team. Return the captain name.
SELECT PM.PLAYER_NAME
FROM PLAYER_MAST PM
WHERE PM.PLAYER_ID IN (
    SELECT MC.PLAYER_CAPTAIN
    FROM MATCH_CAPTAIN MC
    WHERE MC.TEAM_ID = (
        SELECT MD.TEAM_ID
        FROM MATCH_DETAILS MD
        WHERE MD.PLAY_STAGE = 'F'
          AND MD.WIN_LOSE = 'W'
    )
);
    
# 22. From the following tables, write a  SQL query to count the number of players played for 
# 'France’ in the final. Return 'Number of players shared fields'.
SELECT COUNT(*) + 11 FROM PLAYER_IN_OUT
WHERE MATCH_NO = 
	(SELECT MATCH_NO FROM MATCH_MAST
    WHERE PLAY_STAGE = 'F'
    AND IN_OUT = 'I' AND TEAM_ID = (
    SELECT COUNTRY_ID FROM SOCCER_COUNTRY
    WHERE COUNTRY_NAME = 'France'));
    
# 23. From the following table, write a  SQL query to find the Germany goalkeeper who did not 
# concede any goals in their group stage matches. Return goalkeeper name, jersey number.
SELECT PLAYER_NAME, JERSEY_NO FROM PLAYERS_MAST PM
WHERE PLAYER_ID IN 
	(SELECT PLAYER_GK FROM MATCH_DETAILS
    WHERE TEAM_ID IN 
		(SELECT COUNTRY_ID FROM SOCCER_COUNTRY
        WHERE COUNTRY_NAME = 'Germany'));

# 24. From the following tables, write a  SQL query to find the runners-up in Football EURO cup 2016.
# Return country name.
SELECT COUNTRY_NAME FROM SOCCER_COUNTRY
WHERE COUNTRY_ID IN 
	(SELECT TEAM_ID FROM MATCH_DETAILS
    WHERE PLAY_STAGE = 'F' AND WIN_LOSE = 'L');
    
# 25. From the following tables, write a  SQL query to find the maximum penalty shots taken by the teams.
# Return country name, maximum penalty shots.
SELECT SC.COUNTRY_NAME, COUNT(PS.TEAM_ID) AS SHOTS
FROM SOCCER_COUNTRY SC
JOIN PENALTY_SHOOTOUT PS ON PS.TEAM_ID = SC.COUNTRY_ID
GROUP BY SC.COUNTRY_NAME
HAVING COUNT(PS.TEAM_ID) = (
    SELECT MAX(SHOTS)
    FROM (
        SELECT COUNT(*) AS SHOTS
        FROM PENALTY_SHOOTOUT
        GROUP BY TEAM_ID
    ) AS INNER_RESULT
);

# 26. From the following tables, write a SQL query to find the maximum number of penalty 
# shots taken by the players. Return country name, player name, jersey number and number of penalty shots.
SELECT C.COUNTRY_NAME, A.PLAYER_NAME, A.JERSEY_NO, COUNT(B.PLAYER_ID) AS SHOTS
FROM PLAYERS_MAST A
JOIN PENALTY_SHOOTOUT B ON B.PLAYER_ID = A.PLAYER_ID
JOIN SOCCER_COUNTRY C ON B.TEAM_ID = C.COUNTRY_ID
GROUP BY C.COUNTRY_NAME, A.PLAYER_NAME, A.JERSEY_NO
HAVING COUNT(B.PLAYER_ID) = (
    SELECT MAX(INNER_RESULT.SHOTS)
    FROM (
        SELECT COUNT(*) AS SHOTS
        FROM PENALTY_SHOOTOUT B
        GROUP BY B.PLAYER_ID
    ) AS INNER_RESULT
);

# 27. From the following table, write a  SQL query to find the matches with the most penalty shots.
SELECT MATCH_NO,
       COUNT(*) AS SHOTS
FROM PENALTY_SHOOTOUT
GROUP BY MATCH_NO
HAVING COUNT(*) = (
    SELECT MAX(INNER_RESULT.SHOTS)
    FROM (
        SELECT COUNT(*) AS SHOTS
        FROM PENALTY_SHOOTOUT
        GROUP BY MATCH_NO
    ) AS INNER_RESULT
);

# 28. From the following table, write a SQL query to determine the match number where the most 
# penalty shots were taken. Return match number, country name.
SELECT PS.MATCH_NO,
       SC.COUNTRY_NAME
FROM PENALTY_SHOOTOUT PS
JOIN SOCCER_COUNTRY SC ON PS.TEAM_ID = SC.COUNTRY_ID
WHERE PS.MATCH_NO = (
    SELECT MATCH_NO
    FROM PENALTY_SHOOTOUT PS_SUB
    GROUP BY PS_SUB.MATCH_NO
    HAVING COUNT(*) = (
        SELECT MAX(SUBQUERY.SHOTS)
        FROM (
            SELECT COUNT(*) AS SHOTS
            FROM PENALTY_SHOOTOUT PS_INNER
            GROUP BY PS_INNER.MATCH_NO
        ) AS SUBQUERY
    )
)
GROUP BY PS.MATCH_NO, SC.COUNTRY_NAME;

# 29. From the following table, write a SQL query to find the player of ‘Portugal’ who took 
# the seventh kick against ‘Poland’. Return match number, player name and kick number.
SELECT PS.MATCH_NO,
       PM.PLAYER_NAME,
       PS.KICK_NO
FROM PENALTY_SHOOTOUT PS
JOIN PLAYER_MAST PM ON PS.PLAYER_ID = PM.PLAYER_ID
WHERE PS.KICK_NO = 7
  AND PS.MATCH_NO = (
    SELECT PS_SUB.MATCH_NO
    FROM PENALTY_SHOOTOUT PS_SUB
    WHERE PS_SUB.TEAM_ID = (
        SELECT SC.COUNTRY_ID
        FROM SOCCER_COUNTRY SC
        WHERE SC.COUNTRY_NAME = 'Portugal'
    )
    GROUP BY PS_SUB.MATCH_NO
)
GROUP BY PS.MATCH_NO,
         PM.PLAYER_NAME,
         PS.KICK_NO;

# 30. From the following table, write a SQL query to find the stage of the match where 
# penalty kick number 23 was taken. Return match number, play_stage.
SELECT MM.MATCH_NO,
       MM.PLAY_STAGE
FROM MATCH_MAST MM
WHERE MM.MATCH_NO = (
    SELECT PS.MATCH_NO
    FROM PENALTY_SHOOTOUT PS
    WHERE PS.KICK_ID = 23
);