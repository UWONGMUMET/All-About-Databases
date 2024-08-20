# 1. From the following table, write a  SQL query to find the actors who played a role in the movie 
# 'Annie Hall'. Return all the fields of actor table.
SELECT * FROM ACTOR 
WHERE ACT_ID IN 
	(SELECT ACT_ID FROM MOVIE_CAST
    WHERE MOV_ID IN 
		(SELECT MOV_ID FROM MOVIE
        WHERE MOV_TITLE = 'Annie Hall'));
        
# 2. From the following tables, write a SQL query to find the director of a film that cast a role 
# in 'Eyes Wide Shut'. Return director first name, last name.
SELECT DIR_FNAME, DIR_LNAME FROM DIRECTOR
WHERE DIR_ID IN 
	(SELECT DIR_ID FROM MOVIE_DIRECTION
    WHERE MOV_ID IN 
		(SELECT MOV_ID FROM MOVIE_CAST
        WHERE MOV_ID IN 
			(SELECT MOV_ID FROM MOVIE
            WHERE MOV_TITLE = 'Eyes Wide Shut')));

# 3. From the following table, write a SQL query to find those movies that have been released in countries other 
# than the United Kingdom. Return movie title, movie year, movie time, and date of release, releasing country.
SELECT MOV_TITLE, MOV_YEAR, MOV_TIME, MOV_DT_REL, MOV_REL_COUNTRY
FROM MOVIE
WHERE MOV_REL_COUNTRY NOT IN ('UK');

# 4. From the following tables, write a  SQL query to find for movies whose reviewer is unknown. 
# Return movie title, year, release date, director first name, last name, actor first name, last name.
SELECT A.MOV_TITLE, A.MOV_YEAR, A.MOV_DT_REL, C.DIR_FNAME, C.DIR_LNAME, F.ACT_FNAME, F.ACT_LNAME
FROM MOVIE A, MOVIE_DIRECTION B, DIRECTOR C, RATING D, REVIEWERS E, ACTOR F, MOVIE_CAST G
WHERE A.MOV_ID = B.MOV_ID AND B.DIR_ID = C.DIR_ID AND A.MOV_ID = D.MOV_ID 
AND D.REV_ID = E.REV_ID AND A.MOV_ID = G.MOV_ID AND G.ACT_ID = F.ACT_ID AND E.REV_NAME IS NULL;

# 5. From the following tables, write a SQL query to find those movies directed by the director whose first name 
# is Woddy and last name is Allen. Return movie title.
SELECT * FROM MOVIE 
WHERE MOV_ID =
	(SELECT MOV_ID FROM MOVIE_DIRECTION
    WHERE DIR_ID = 
		(SELECT DIR_ID FROM DIRECTOR
        WHERE DIR_FNAME = 'Woody' AND DIR_LNAME = 'Allen'));

# 6. From the following tables, write a SQL query to determine those years in which there was at least one movie 
# that received a rating of at least three stars. Sort the result-set in ascending order by movie year. 
# Return movie year.
SELECT DISTINCT MOV_YEAR FROM MOVIE
WHERE MOV_ID IN 
	(SELECT MOV_ID FROM RATING
    WHERE REV_STARS > 3)
ORDER BY MOV_YEAR;

# 7. From the following table, write a  SQL query to search for movies that do not have any ratings. 
# Return movie title.
SELECT DISTINCT MOV_TITLE 
FROM MOVIE 
WHERE MOV_ID IN 
	(SELECT MOV_ID FROM MOVIE 
    WHERE MOV_ID NOT IN 
		(SELECT MOV_ID FROM RATING)
);

# 8. From the following table, write a SQL query to find those reviewers who have not given a rating to certain 
# films. Return reviewer name.
SELECT DISTINCT REV_NAME FROM REVIEWERS
WHERE REV_ID IN 
	(SELECT REV_ID FROM RATING
    WHERE REV_STARS IS NULL);

# 9. From the following tables, write a SQL query to find movies that have been reviewed by a reviewer and 
# received a rating. Sort the result-set in ascending order by reviewer name, movie title, review Stars. 
# Return reviewer name, movie title, review Stars.
SELECT REV_NAME, MOV_TITLE, REV_STARS FROM REVIEWERS R, RATING R1, MOVIE M
WHERE R.REV_ID = R1.REV_ID
AND M.MOV_ID = R1.MOV_ID
AND R.REV_NAME IS NOT NULL 
AND R1.REV_STARS IS NOT NULL
ORDER BY REV_NAME, MOV_TITLE, REV_STARS;

# 10. From the following table, write a  SQL query to find movies that have been reviewed by a reviewer and 
# received a rating. Group the result set on reviewer’s name, movie title. Return reviewer’s name, movie title.
SELECT REV_NAME, MOV_TITLE 
FROM REVIEWER, MOVIE, RATING, RATING R2
WHERE RATING.MOV_ID = MOVIE.MOV_ID 
  AND REVIEWER.REV_ID = RATING.REV_ID 
  AND RATING.REV_ID = R2.REV_ID 
GROUP BY REV_NAME, MOV_TITLE 
HAVING COUNT(*) > 1;


