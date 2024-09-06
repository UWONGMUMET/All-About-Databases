# 1. From the following table, write a  SQL query to count the number of venues for EURO cup 2016. 
# Return number of venues.
SELECT COUNT(*) FROM SOCCER_VENUE;

# 2. From the following table, write a SQL query to count the number of countries that participated in the 
# 2016-EURO Cup.
SELECT COUNT(DISTINCT(TEAM_ID)) FROM PLAYERS_MAST;

# 3. From the following table, write a  SQL query to find the number of goals scored within normal play 
# during the EURO cup 2016.
SELECT * FROM GOAL_DETAILS;

# 4. From the following table, write a  SQL query to find the number of matches that ended with a result.
SELECT COUNT(*) FROM MATCH_MAST
WHERE RESULTS = 'WIN';

# 5. From the following table, write a  SQL query to find the number of matches that ended in draws.
SELECT COUNT(*) FROM MATCH_MAST
WHERE RESULTS = 'DRAW';

# 6. From the following table, write a  SQL query to find out when the Football EURO cup 2016 will begin.
SELECT PLAY_DATE FROM MATCH_MAST
WHERE MATCH_NO = '1';

# 7. From the following table, write a  SQL query to find the number of self-goals scored during 
# the 2016 European Championship.
SELECT COUNT(*) FROM GOAL_DETAILS
WHERE GOAL_TYPE = 'O';

# 8. From the following table, write a  SQL query to count the number of matches ended with a results 
# in-group stage.
SELECT COUNT(*) FROM MATCH_MAST
WHERE PLAY_STAGE = 'G' AND RESULTS = 'WIN';

# 9. From the following table, write a  SQL query to find the number of matches that resulted in a 
# penalty shootout.
SELECT COUNT(DISTINCT MATCH_NO) FROM PENALTY_SHOOTOUT;

# 10. From the following table, write a SQL query to find number of matches decided by penalties in the 
# Round 16.
SELECT COUNT(*) FROM MATCH_MAST
WHERE DECIDED_BY = 'P' AND PLAY_STAGE = 'R';