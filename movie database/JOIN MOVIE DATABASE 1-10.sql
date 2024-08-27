# 1. From the following table, write a  SQL query to find all reviewers whose ratings contain a NULL 
# value. Return reviewer name.
SELECT * FROM REVIEWER
INNER JOIN RATING USING (REV_ID)
WHERE REV_STARS IS NULL;

# 2. From the following table, write a SQL query to find out who was cast in the movie 'Annie Hall'. 
# Return actor first name, last name and role.
SELECT A.ACT_FNAME, A.ACT_LNAME, M.ROLE FROM ACTOR A
JOIN MOVIE_CAST M ON A.ACT_ID = M.ACT_ID
JOIN MOVIE M1 ON M.MOV_ID = M1.MOV_ID
WHERE M1.MOV_TITLE = 'Annie Hall';

# 3. From the following table, write a SQL query to find the director who directed a movie that 
# featured a role in 'Eyes Wide Shut'. Return director first name, last name and movie title
SELECT D.DIR_FNAME, D.DIR_LNAME, M.MOV_TITLE FROM DIRECTOR D
JOIN MOVIE_DIRECTION MD ON D.DIR_ID = MD.DIR_ID
JOIN MOVIE M ON MD.MOV_ID = M.MOV_ID
WHERE M.MOV_TITLE = 'Eyes Wide Shut';

# 4. From the following tables, write a  SQL query to find the director of a movie that cast a role
# as Sean Maguire. Return director first name, last name and movie title.
SELECT D.DIR_FNAME, D.DIR_LNAME, M.MOV_TITLE FROM DIRECTOR D
JOIN MOVIE_DIRECTION MD ON D.DIR_ID = MD.DIR_ID
JOIN MOVIE M ON MD.MOV_ID = M.MOV_ID
JOIN MOVIE_CAST MC ON M.MOV_ID = MC.MOV_ID
WHERE MC.ROLE = 'Sean Maguire';

# 5. From the following table, write a SQL query to find out which actors have not appeared in any 
# movies between 1990 and 2000 (Begin and end values are included.). Return actor first name, 
# last name, movie title and release year.
SELECT A.ACT_FNAME, A.ACT_LNAME, M.MOV_TITLE, M.MOV_YEAR FROM ACTOR A
JOIN MOVIE_CAST MC ON A.ACT_ID = MC.ACT_ID
JOIN MOVIE M ON MC.MOV_ID = M.MOV_ID
WHERE MOV_YEAR NOT BETWEEN 1990 AND 2000;

# 6. From the following table, write a SQL query to find the directors who have directed films 
# in a variety of genres. Group the result set on director first name, last name and generic title. 
# Sort the result-set in ascending order by director first name and last name. Return director 
# first name, last name and number of genres movies.
SELECT D.DIR_FNAME, D.DIR_LNAME, COUNT(G.GEN_TITLE) FROM DIRECTOR D
JOIN MOVIE_DIRECTION MD ON D.DIR_ID = MD.DIR_ID
JOIN MOVIE_GENRES MG ON MD.MOV_ID = MG.MOV_ID
JOIN GENRES G ON MG.GEN_ID = G.GEN_ID
GROUP BY D.DIR_FNAME, D.DIR_LNAME, G.GEN_TITLE
ORDER BY D.DIR_FNAME, D.DIR_LNAME;

# 7. From the following table, write a SQL query to find the movies with year and genres. 
# Return movie title, movie year and generic title.
SELECT M.MOV_TITLE, M.MOV_YEAR, G.GEN_TITLE FROM MOVIE M
JOIN MOVIE_GENRES MG ON M.MOV_ID = MG.MOV_ID
JOIN GENRES G ON MG.GEN_ID = G.GEN_ID;

# 8. From the following tables, write a  SQL query to find all the movies with year, genres, 
# and name of the director.
SELECT M.MOV_TITLE, M.MOV_YEAR, G.GEN_TITLE, D.DIR_FNAME, D.DIR_LNAME
FROM MOVIE M
JOIN MOVIE_DIRECTION MD ON M.MOV_ID = MD.MOV_ID
JOIN DIRECTOR D ON MD.DIR_ID = D.DIR_ID
JOIN MOVIE_GENRES MG ON M.MOV_ID = MG.MOV_ID
JOIN GENRES G ON MG.GEN_ID = G.GEN_ID
ORDER BY M.MOV_TITLE ASC;

# 9. From the following tables, write a SQL query to find the movies released before 1st January 
# 1989. Sort the result-set in descending order by date of release. Return movie title,
# release year, date of release, duration, and first and last name of the director.
SELECT M.MOV_TITLE, M.MOV_YEAR, M.MOV_DT_REL, M.MOV_TIME, D.DIR_FNAME, D.DIR_LNAME FROM MOVIE M
JOIN MOVIE_DIRECTION MD ON M.MOV_ID = MD.MOV_ID
JOIN DIRECTOR D ON MD.DIR_ID = D.DIR_ID
WHERE M.MOV_DT_REL < '1989-01-01'
ORDER BY M.MOV_DT_REL DESC;

# 10. From the following table, write a SQL query to calculate the average movie length and count 
# the number of movies in each genre. Return genre title, average time and number of movies for 
# each genre.
SELECT G.GEN_TITLE ,AVG(M.MOV_TIME), COUNT(G.GEN_TITLE) FROM MOVIE M
JOIN MOVIE_GENRES MG ON M.MOV_ID = MG.MOV_ID
JOIN GENRES G ON MG.GEN_ID = G.GEN_ID
GROUP BY G.GEN_TITLE;