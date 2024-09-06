# 11. From the following table, write a  SQL query to find the number of goals scored in every match within
# a normal play schedule. Sort the result-set on match number. Return match number, number of goal scored.
SELECT MATCH_NO, COUNT(*) FROM GOAL_DETAILS
GROUP BY MATCH_NO
ORDER BY MATCH_NO;

# 12. From the following table, write a  SQL query to find the matches in which no stoppage time was 
# added during the first half of play. Return match no, date of play, and goal scored.
SELECT MATCH_NO, PLAY_DATE, GOAL_SCORE FROM MATCH_MAST
WHERE STOP1_SEC = 0;

# 13. From the following table, write a  SQL query to count the number of matches that ended in a 
# goalless draw at the group stage. Return number of matches.
SELECT COUNT(DISTINCT MATCH_NO) FROM MATCH_DETAILS
WHERE GOAL_SCORE = 0 AND WIN_LOSE = 'D' AND PLAY_STAGE = 'G';

# 14. From the following table, write a  SQL query to calculate the number of matches that ended in a 
# single goal win, excluding matches decided by penalty shootouts. Return number of matches.
SELECT COUNT(DISTINCT MATCH_NO) FROM MATCH_DETAILS
WHERE GOAL_SCORE = 1 AND WIN_LOSE = 'W' AND DECIDED_BY != 'P';

# 15. From the following table, write a  SQL query to count the number of players replaced in the 
# tournament. Return number of players as "Player Replaced".
SELECT COUNT(*) AS "Player Replaced" FROM PLAYER_IN_OUT
WHERE IN_OUT = 'I';

# 16. From the following table, write a  SQL query to count the total number of players replaced during normal playtime. 
# Return number of players as "Player Replaced".
SELECT COUNT(*) AS "Player Replaced" FROM PLAYER_IN_OUT
WHERE IN_OUT = 'I' AND PLAY_SCHEDULE = 'NT';

# 17. From the following table, write a  SQL query to count the number of players who were replaced during the stoppage 
# time. Return number of players as "Player Replaced".
SELECT COUNT(*) AS "Player Replaced" FROM PLAYER_IN_OUT
WHERE IN_OUT = 'I' AND PLAY_SCHEDULE = 'ST';

# 18. From the following table, write a  SQL query to count the number of players who were replaced during the first half. 
# Return number of players as "Player Replaced".
SELECT COUNT(*) AS "Player Replaced" FROM PLAYER_IN_OUT
WHERE IN_OUT = 'I' AND PLAY_SCHEDULE = 'NT' AND PLAY_HALF = 1;

# 19. From the following table, write a  SQL query to count the total number of goalless draws played in the entire 
# tournament. Return number of goalless draws.
SELECT COUNT(DISTINCT MATCH_NO) FROM MATCH_DETAILS
WHERE WIN_LOSE = 'D'
AND GOAL_SCORE = 0;

# 20. From the following table, write a  SQL query to calculate the total number of players who were replaced during the 
# extra time.
SELECT COUNT(*) FROM PLAYER_IN_OUT
WHERE IN_OUT = 'I' AND PLAY_SCHEDULE = 'ET';