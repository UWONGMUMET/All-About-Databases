# 21. From the following table, write a  SQL query to count the number of substitutes during various stages 
# of the tournament. Sort the result-set in ascending order by play-half, play-schedule and number of 
# substitute happened. Return play-half, play-schedule, number of substitute happened.
SELECT PLAY_HALF, PLAY_SCHEDULE, COUNT(*) FROM PLAYER_IN_OUT 
WHERE IN_OUT = 'I'
GROUP BY PLAY_HALF, PLAY_SCHEDULE
ORDER BY PLAY_HALF, PLAY_SCHEDULE, COUNT(*) DESC;

# 22. From the following table, write a  SQL query to count the number of shots taken in penalty shootouts
# matches. Number of shots as "Number of Penalty Kicks".
SELECT COUNT(*) AS "Number of Penalty Kicks" FROM PENALTY_SHOOTOUT;

# 23. From the following table, write a SQL query to count the number of shots that were scored in penalty 
# shootouts matches. Return number of shots scored goal as "Goal Scored by Penalty Kicks".
SELECT COUNT(*) AS "Number of Penalty Kicks" FROM PENALTY_SHOOTOUT
WHERE SCORE_GOAL = 'Y';

# 24. From the following table, write a SQL query to count the number of shots missed or saved in 
# penalty shootout matches. Return number of shots missed as "Goal missed or saved by Penalty Kicks".
SELECT COUNT(*) AS "Goal missed or saved by Penalty Kicks" FROM PENALTY_SHOOTOUT
WHERE SCORE_GOAL = 'Y';

# 25. From the following table, write a  SQL query to find the players with shot numbers they took in 
# penalty shootout matches. Return match_no, Team, player_name, jersey_no, score_goal, kick_no.
SELECT C.MATCH_NO, A.COUNTRY_NAME AS "TEAM", B.PLAYER_NAME, B.JERSEY_NO, C.SCORE_GOAL, C.KICK_NO
FROM SOCCER_COUNTRY A, PENALTY_SHOOTOUT C, PLAYERS_MAST B
WHERE C.TEAM_ID = A.COUNTRY_ID AND C.PLAYER_ID = B.PLAYER_ID;

# 26. From the following table, write a  SQL query to count the number of penalty shots taken by each 
# team. Return country name, number of shots as "Number of Shots".
SELECT S.COUNTRY_NAME, COUNT(P.KICK_NO) FROM SOCCER_COUNTRY S
JOIN PENALTY_SHOOTOUT P ON P.TEAM_ID = S.COUNTRY_ID
GROUP BY S.COUNTRY_NAME;

# 27. From the following table, write a SQL query to count the number of bookings in each half of play 
# within the normal play schedule. Return play_half, play_schedule, number of booking happened.
SELECT PLAY_HALF, PLAY_SCHEDULE, COUNT(*) FROM PLAYER_BOOKED
WHERE PLAY_SCHEDULE = 'NT'
GROUP BY PLAY_HALF, PLAY_SCHEDULE;

# 28. From the following table, write a  SQL query to count the number of bookings during stoppage 
# time.
SELECT COUNT(*) FROM PLAYER_BOOKED
WHERE PLAY_SCHEDULE = 'ST';

# 29. From the following table, write a  SQL query to count the number of bookings that happened in extra 
# time.
SELECT COUNT(*) FROM PLAYER_BOOKED
WHERE PLAY_SCHEDULE = 'ET';