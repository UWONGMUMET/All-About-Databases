# 11. From the following table, write a  SQL query to find movies with the shortest duration. 
# Return movie title, movie year, director first name, last name, actor first name, last name and role.
SELECT M.MOV_TITLE, M.MOV_YEAR, D.DIR_FNAME, D.DIR_LNAME, A.ACT_FNAME, A.ACT_LNAME, MC.ROLE 
FROM MOVIE M
JOIN MOVIE_DIRECTION MD ON M.MOV_ID = MD.MOV_ID
JOIN DIRECTOR D ON MD.DIR_ID = D.DIR_ID
JOIN MOVIE_CAST MC ON M.MOV_ID = MC.MOV_ID
JOIN ACTOR A ON MC.ACT_ID = A.ACT_ID
WHERE M.MOV_TIME = (SELECT MIN(MOV_TIME) FROM MOVIE)
ORDER BY M.MOV_TITLE ASC;

# 12. From the following table, write a SQL query to find the years in which a movie received a 
# rating of 3 or 4. Sort the result in increasing order on movie year.
SELECT DISTINCT M.MOV_YEAR FROM MOVIE M, RATING R
WHERE M.MOV_ID = R.MOV_ID AND R.REV_STARS IN (3,4)
ORDER BY M.MOV_YEAR;

# 13. From the following tables, write a SQL query to get the reviewer name, movie title, and stars 
# in an order that reviewer name will come first, then by movie title, and lastly by number of stars.
SELECT R.REV_NAME, M.MOV_TITLE, RT.REV_STARS
FROM MOVIE M
INNER JOIN RATING RT ON M.MOV_ID = RT.MOV_ID
INNER JOIN REVIEWER R ON R.REV_ID = RT.REV_ID
WHERE R.REV_NAME IS NOT NULL
ORDER BY R.REV_NAME, M.MOV_TITLE, RT.REV_STARS;

# 14. From the following table, write a  SQL query to find those movies that have at least one 
# rating and received the most stars. Sort the result-set on movie title. Return movie title 
# and maximum review stars.
SELECT M.MOV_TITLE, MAX(R.REV_STARS) FROM MOVIE M
JOIN RATING R ON M.MOV_ID = R.MOV_ID
GROUP BY M.MOV_TITLE
HAVING MAX(R.REV_STARS) > 0
ORDER BY M.MOV_TITLE;

# 15. From the following table, write a SQL query to find out which movies have received ratings. 
# Return movie title, director first name, director last name and review stars.
SELECT MOV_TITLE, DIR_FNAME, DIR_LNAME, REV_STARS FROM MOVIE
JOIN MOVIE_DIRECTION USING(MOV_ID)
JOIN DIRECTOR USING(DIR_ID)
LEFT JOIN RATING USING(MOV_ID)
WHERE REV_STARS IS NOT NULL;

# 16. From the following table, write a SQL query to find movies in which one or more actors have 
# acted in more than one film. Return movie title, actor first and last name, and the role.
SELECT M.MOV_TITLE, A.ACT_FNAME, A.ACT_LNAME, MC.ROLE FROM MOVIE M
JOIN MOVIE_CAST MC ON MC.MOV_ID = M.MOV_ID
JOIN ACTOR A ON MC.ACT_ID = A.ACT_ID
WHERE A.ACT_ID IN (
    SELECT ACT_ID FROM MOVIE_CAST 
    GROUP BY ACT_ID 
    HAVING COUNT(*) >= 2
);

# 17. From the following tables, write a  SQL query to find the actor whose first name is 
# 'Claire' and last name is 'Danes'. Return director first name, last name, movie title, actor 
# first name and last name, role.
SELECT D.DIR_FNAME, D.DIR_LNAME, M.MOV_TITLE, A.ACT_FNAME, A.ACT_LNAME, MC.ROLE FROM ACTOR A
JOIN MOVIE_CAST MC ON A.ACT_ID = MC.ACT_ID
JOIN MOVIE_DIRECTION MD ON MC.MOV_ID = MD.MOV_ID
JOIN DIRECTOR D ON MD.DIR_ID = D.DIR_ID
JOIN MOVIE M ON M.MOV_ID = MD.MOV_ID
WHERE A.ACT_FNAME = 'Claire' AND A.ACT_LNAME = 'Danes';

# 18. From the following table, write a SQL query to find for actors whose films have been directed 
# by them. Return actor first name, last name, movie title and role.
SELECT D.DIR_FNAME, D.DIR_LNAME, M.MOV_TITLE, A.ACT_FNAME, A.ACT_LNAME, MC.ROLE FROM ACTOR A
JOIN MOVIE_CAST MC ON A.ACT_ID = MC.ACT_ID
JOIN MOVIE_DIRECTION MD ON MC.MOV_ID = MD.MOV_ID
JOIN DIRECTOR D ON MD.DIR_ID = D.DIR_ID
JOIN MOVIE M ON M.MOV_ID = MD.MOV_ID
WHERE A.ACT_FNAME = D.DIR_FNAME AND A.ACT_LNAME = D.DIR_LNAME;

# 19. From the following tables, write a SQL query to find the cast list of the movie ‘Chinatown’. 
# Return first name, last name.
SELECT A.ACT_FNAME, A.ACT_LNAME FROM MOVIE M
JOIN MOVIE_CAST MC ON M.MOV_ID = MC.MOV_ID
JOIN ACTOR A ON MC.ACT_ID = A.ACT_ID
WHERE M.MOV_TITLE = 'Chinatown';

# 20. From the following tables, write a  SQL query to find those movies where actor’s first name 
# is 'Harrison' and last name is 'Ford'. Return movie title.
SELECT M.MOV_TITLE FROM MOVIE M
JOIN MOVIE_CAST MC ON M.MOV_ID = MC.MOV_ID
JOIN ACTOR A ON MC.ACT_ID = A.ACT_ID
WHERE A.ACT_FNAME = 'Harrison' AND A.ACT_LNAME = 'Ford';