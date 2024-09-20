# 11. From the following tables, write a  SQL query to find the referee who assisted the referee in the 
# final match. Return associated referee name, country name.
SELECT ARM.ASS_REF_NAME, SC.COUNTRY_NAME FROM ASST_REFEREE_MAST ARM
JOIN SOCCER_COUNTRY SC ON ARM.COUNTRY_ID = SC.COUNTRY_ID
JOIN MATCH_DETAILS MD ON ARM.ASS_REF_ID = MD.ASS_REF
WHERE MD.PLAY_STAGE = 'F';

# 12. From the following table, write a  SQL query to find the city where the opening match of EURO cup 
# 2016 took place. Return venue name, city.
SELECT SV.VENUE_NAME, SC.CITY FROM SOCCER_VENUE SV
JOIN SOCCER_CITY SC ON SV.CITY_ID = SC.CITY_ID
JOIN MATCH_MAST MM ON SV.VENUE_ID = MM.VENUE_ID
WHERE MM.MATCH_NO = 1;

# 13. From the following tables, write a  SQL query to find out which stadium hosted the final match of 
# the 2016 Euro Cup. Return venue_name, city, aud_capacity, audience.
SELECT SV.VENUE_NAME, SC.CITY, SV.AUD_CAPACITY, MM.AUDENCE FROM SOCCER_VENUE SV
JOIN SOCCER_CITY SC ON SV.CITY_ID = SC.CITY_ID
JOIN MATCH_MAST MM ON SV.VENUE_ID = MM.VENUE_ID
WHERE MM.PLAY_STAGE = 'F';

# 14. From the following tables, write a  SQL query to count the number of matches played at each venue. 
# Sort the result-set on venue name. Return Venue name, city, and number of matches.
SELECT SV.VENUE_NAME, SC.CITY, COUNT(*) FROM SOCCER_VENUE SV
JOIN SOCCER_CITY SC ON SV.CITY_ID = SC.CITY_ID
JOIN MATCH_MAST MM ON SV.VENUE_ID = MM.VENUE_ID
GROUP BY SV.VENUE_NAME, SC.CITY;

# 15. From the following tables, write a  SQL query to find the player who was the first player to be 
# sent off at the tournament EURO cup 2016. Return match Number, country name and player name.
SELECT PB.MATCH_NO, SC.COUNTRY_NAME, PM.PLAYER_NAME FROM PLAYER_BOOKED PB
JOIN PLAYERS_MAST PM ON PB.PLAYER_ID = PM.PLAYER_ID
JOIN SOCCER_COUNTRY SC ON PM.TEAM_ID = SC.COUNTRY_ID
WHERE PB.SENT_OFF = 'Y'
AND PB.MATCH_NO = 
	(SELECT MIN(MATCH_NO) FROM PLAYER_BOOKED);
    
# 16. From the following tables, write a  SQL query to find the teams that have scored one goal in the 
# tournament. Return country_name as "Team", team in the group, goal_for.
SELECT SC.COUNTRY_NAME AS "Team", ST.TEAM_GROUP, ST.GOAL_FOR FROM SOCCER_TEAM ST
JOIN SOCCER_COUNTRY SC ON ST.TEAM_ID = SC.COUNTRY_ID
WHERE ST.GOAL_FOR = 1;

# 17. From the following tables, write a  SQL query to count the number of yellow cards each country has 
# received. Return country name and number of yellow cards.
SELECT SC.COUNTRY_NAME, COUNT(SC.COUNTRY_NAME) FROM SOCCER_COUNTRY SC
JOIN PLAYER_BOOKED PB ON SC.COUNTRY_ID = PB.TEAM_ID
GROUP BY SC.COUNTRY_NAME
ORDER BY COUNT(SC.COUNTRY_NAME) DESC;

# 18. From the following tables, write a  SQL query to count the number of goals that have been seen. 
# Return venue name and number of goals.
SELECT SV.VENUE_NAME, COUNT(SV.VENUE_NAME)
FROM GOAL_DETAILS GD
JOIN SOCCER_COUNTRY SC ON GD.TEAM_ID = SC.COUNTRY_ID
JOIN MATCH_MAST MM ON GD.MATCH_NO = MM.MATCH_NO
JOIN SOCCER_VENUE SV ON MM.VENUE_ID = SV.VENUE_ID
GROUP BY SV.VENUE_NAME
ORDER BY COUNT(SV.VENUE_NAME) DESC;

# 19. From the following tables, write a  SQL query to find the match where there was no stoppage time 
# in the first half. Return match number, country name.
SELECT MD.MATCH_NO, SC.COUNTRY_NAME FROM MATCH_DETAILS MD
JOIN MATCH_MAST MM ON MD.MATCH_NO = MM.MATCH_NO
JOIN SOCCER_COUNTRY SC ON MD.TEAM_ID = SC.COUNTRY_ID
WHERE MM.STOP1_SEC = 0;

# 20. From the following tables, write a  SQL query to find the team(s) who conceded the most goals in 
# EURO cup 2016. Return country name, team group and match played.
SELECT SC.COUNTRY_NAME, ST.TEAM_GROUP, ST.MATCH_PLAYED, ST.WON, ST.LOST, ST.GOAL_FOR,
ST.GOAL_AGNST FROM SOCCER_TEAM ST
JOIN SOCCER_COUNTRY SC ON ST.TEAM_ID = SC.COUNTRY_ID
WHERE ST.GOAL_AGNST = 
	(SELECT MAX(GOAL_AGNST) FROM SOCCER_TEAM);