# 1. From the following table, write a  SQL query to find the name and year of the movies. 
# Return movie title, movie release year.
SELECT MOV_TITLE, MOV_YEAR FROM MOVIE;

# 2. From the following table, write a SQL query to find when the movie 'American Beauty' released. 
# Return movie release year.
SELECT MOV_YEAR FROM MOVIE
WHERE MOV_TITLE = 'American Beauty';

# 3. From the following table, write a SQL query to find the movie that was released in 1999. 
# Return movie title.
SELECT MOV_TITLE FROM MOVIE
WHERE MOV_YEAR = 1999;

# 4. From the following table, write a SQL query to find those movies, which were released before 
# 1998. Return movie title.
SELECT MOV_TITLE FROM MOVIE
WHERE MOV_YEAR < 1998;

# 5. From the following tables, write a  SQL query to find the name of all reviewers and movies 
# together in a single list.
SELECT R.REV_NAME FROM REVIEWERS R
UNION
SELECT M.MOV_TITLE FROM MOVIE M;

# 6. From the following table, write a SQL query to find all reviewers who have rated seven or 
# more stars to their rating. Return reviewer name.
SELECT R.REV_NAME FROM REVIEWERS R, RATING R1
WHERE R1.REV_ID = R.REV_ID
AND R1.REV_STARS >= 7 
AND R.REV_NAME IS NOT NULL;

# 7. From the following tables, write a SQL query to find the movies without any rating. 
# Return movie title.
SELECT MOV_TITLE FROM MOVIE
WHERE MOV_ID NOT IN 
	(SELECT MOV_ID FROM RATING);
    
# 8. From the following table, write a SQL query to find the movies with ID 905 or 907 or 917. 
# Return movie title.
SELECT MOV_TITLE FROM MOVIE
WHERE MOV_ID IN (905, 907, 917);

# 9. From the following table, write a  SQL query to find the movie titles that contain the word 
# 'Boogie Nights'. Sort the result-set in ascending order by movie year. Return movie ID, 
# movie title and movie release year.
SELECT MOV_ID, MOV_TITLE, MOV_YEAR FROM MOVIE
WHERE MOV_TITLE LIKE '%Boogie%Nights'
ORDER BY MOV_YEAR ASC;

# 10. From the following table, write a SQL query to find those actors with the first name 'Woody' 
# and the last name 'Allen'. Return actor ID.
SELECT ACT_ID FROM ACTOR
WHERE ACT_FNAME = 'Woody' and ACT_LNAME = 'Allen';