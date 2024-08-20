# 11. From the following tables, write a SQL query to find those movies, which have received highest 
# number of stars. Group the result set on movie title and sorts the result-set in ascending order 
# by movie title. Return movie title and maximum number of review stars.
SELECT MOV_TITLE, MAX(REV_STARS) FROM MOVIE, RATING 
WHERE MOVIE.MOV_ID = RATING.MOV_ID 
AND RATING.REV_STARS IS NOT NULL
GROUP BY MOV_TITLE
ORDER BY MOV_TITLE;

# 12. From the following tables, write a SQL query to find all reviewers who rated the movie 
# 'American Beauty'. Return reviewer name.
SELECT R.REV_NAME FROM REVIEWERS R, RATING R1, MOVIE M
WHERE R.REV_ID = R1.REV_ID
AND R1.MOV_ID = M.MOV_ID
AND M.MOV_TITLE = 'American Beauty';

# 13. From the following table, write a  SQL query to find the movies that have not been reviewed by 
# any reviewer body other than 'Paul Monks'. Return movie title.
SELECT MOV_TITLE FROM MOVIE
WHERE MOV_ID IN 
	(SELECT MOV_ID FROM RATING
    WHERE REV_ID NOT IN 
		(SELECT REV_ID FROM REVIEWERS
        WHERE REV_NAME = 'Paul Monks'));

# 14. From the following table, write a SQL query to find the movies with the lowest ratings. 
# Return reviewer name, movie title, and number of stars for those movies.
SELECT R.REV_NAME, M.MOV_TITLE, R1.REV_STARS 
FROM REVIEWERS R, MOVIE M, RATING R1
WHERE R1.REV_STARS = 
    (SELECT MIN(REV_STARS) FROM RATING)
AND R1.REV_ID = R.REV_ID
AND R1.MOV_ID = M.MOV_ID;

# 15. From the following tables, write a SQL query to find the movies directed by 
# 'James Cameron'. Return movie title.
SELECT MOV_TITLE FROM MOVIE
WHERE MOV_ID IN 
	(SELECT MOV_ID FROM MOVIE_DIRECTION
    WHERE DIR_ID IN 
		(SELECT DIR_ID FROM DIRECTOR
        WHERE DIR_FNAME ='James' AND DIR_LNAME = 'Cameron'));
	
# 16. Write a query in  SQL to find the movies in which one or more actors appeared in more 
# than one film.
SELECT DISTINCT M.MOV_TITLE FROM MOVIE M
WHERE M.MOV_ID IN 
	(SELECT MC.MOV_ID FROM MOVIE_CAST MC
    WHERE MC.ACT_ID IN 
		(SELECT ACT_ID FROM MOVIE_CAST
        GROUP BY ACT_ID
        HAVING COUNT(DISTINCT MOV_ID) > 1)
);


