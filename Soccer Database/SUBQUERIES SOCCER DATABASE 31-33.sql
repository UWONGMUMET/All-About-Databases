# 31. From the following table, write a  SQL query to find the venues where penalty shoot-out matches were 
# played. Return venue name.
SELECT VENUE_NAME FROM SOCCER_VENUE
WHERE VENUE_ID IN
    (SELECT VENUE_ID FROM MATCH_MAST
     WHERE MATCH_NO IN
     (SELECT DISTINCT MATCH_NO FROM PENALTY_SHOOTOUT));

# 32. From the following table, write a  SQL query to find out when the penalty shootout matches were 
# played. Return playing date.
SELECT PLAY_DATE
FROM MATCH_MAST
WHERE MATCH_NO IN (SELECT DISTINCT MATCH_NO FROM PENALTY_SHOOTOUT);

# 33. From the following table, write a  SQL query to find the fastest goal at the EURO cup 2016, 
# after 5 minutes. Return 'Quickest goal after 5 minutes'.
SELECT MIN(GOAL_TIME) AS "Most quickest goal after 5 minutes"
FROM (SELECT MATCH_NO, GOAL_TIME FROM GOAL_DETAILS
	WHERE GOAL_TIME > 5
    GROUP BY MATCH_NO, GOAL_TIME
ORDER BY GOAL_TIME) HH;

