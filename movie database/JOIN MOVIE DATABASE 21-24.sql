# 21. From the following tables, write a SQL query to find the highest-rated movies. 
# Return movie title, movie year, review stars and releasing country.
SELECT M.MOV_TITLE, M.MOV_YEAR, R.REV_STARS, M.MOV_REL_COUNTRY FROM MOVIE M
JOIN RATING R ON M.MOV_ID = R.MOV_ID
ORDER BY R.REV_STARS DESC
LIMIT 1;

# 22. From the following tables, write a SQL query to find the highest-rated ‘Mystery Movies’. 
# Return the title, year, and rating.
SELECT M.MOV_TITLE, M.MOV_YEAR, R.REV_STARS
FROM MOVIE M
JOIN MOVIE_GENRES MG ON M.MOV_ID = MG.MOV_ID
JOIN GENRES G ON MG.GEN_ID = G.GEN_ID
JOIN RATING R ON M.MOV_ID = R.MOV_ID
WHERE G.GEN_TITLE = 'Mystery'
ORDER BY R.REV_STARS DESC
LIMIT 1;

# 23. From the following tables, write a SQL query to find the years when most of the ‘Mystery 
# Movies’ produced. Count the number of generic title and compute their average rating. Group 
# the result set on movie release year, generic title. Return movie year, generic title, number 
# of generic title and average rating.
SELECT M.MOV_YEAR, G.GEN_TITLE, 
       COUNT(M.MOV_ID) AS COUNT, 
       AVG(R.REV_STARS) AS AVG
FROM MOVIE M
JOIN MOVIE_GENRES MG ON M.MOV_ID = MG.MOV_ID
JOIN GENRES G ON MG.GEN_ID = G.GEN_ID
JOIN RATING R ON M.MOV_ID = R.MOV_ID
WHERE G.GEN_TITLE = 'MYSTERY'
GROUP BY M.MOV_YEAR, G.GEN_TITLE
ORDER BY COUNT DESC, M.MOV_YEAR;

# 24. From the following tables, write a query in  SQL to generate a report, which contain the 
# fields movie title, name of the female actor, year of the movie, role, movie genres, the 
# director, date of release, and rating of that movie.
SELECT M.MOV_TITLE, A.ACT_FNAME, A.ACT_LNAME, M.MOV_YEAR, MC.ROLE, G.GEN_TITLE, D.DIR_FNAME, 
D.DIR_LNAME, M.MOV_DT_REL, R.REV_STARS
FROM MOVIE M
JOIN MOVIE_CAST MC ON M.MOV_ID = MC.MOV_ID
JOIN ACTOR A ON MC.ACT_ID = A.ACT_ID
JOIN MOVIE_DIRECTION MD ON M.MOV_ID = MD.MOV_ID
JOIN DIRECTOR D ON MD.DIR_ID = D.DIR_ID
JOIN RATING R ON M.MOV_ID = R.MOV_ID
JOIN MOVIE_GENRES MG ON M.MOV_ID = MG.MOV_ID
JOIN GENRES G ON MG.GEN_ID = G.GEN_ID
WHERE A.ACT_GENDER = 'F'
ORDER BY M.MOV_TITLE, A.ACT_LNAME, A.ACT_FNAME;


