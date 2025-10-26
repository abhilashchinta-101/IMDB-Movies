select * from movies;
select  * from directors;

---  Distribution of all data about movies
SELECT 
    id,
    title,
    budget,
    popularity,
    revenue,
    vote_count,
    release_date,
    director_id,
    vote_average
FROM movies;

---- Distribution of all data about directors
SELECT 
    id,
    name,
    gender,
    uid,
    department
FROM directors;

--- total movies in imdb
SELECT COUNT(*) AS total_movies
FROM movies
WHERE original_title = 'The Avengers';

SELECT COUNT(*) AS total_movies
FROM movies;

--- Distribution of 3 directors: James Cameron ; Luc Besson ; John Woo
SELECT *
FROM directors
WHERE name IN ('James Cameron', 'Luc Besson', 'John Woo');

---  all directors with name starting with S.
SELECT *
FROM directors
WHERE name LIKE 'S%';

--- Count female directors
SELECT COUNT(*) AS female_directors
FROM directors
WHERE gender = 'Female';

--- Distribution of the 10th first women directors
SELECT name
FROM directors
WHERE gender = 'Female'
ORDER BY name
LIMIT 10;

--- top three most popular movies
SELECT title, popularity
FROM movies
ORDER BY popularity DESC
LIMIT 3;

--- top three bankable movies
SELECT title, revenue
FROM movies
ORDER BY revenue DESC
LIMIT 3;

--- the movie, most awarded average vote since the January 1st, 2000
SELECT title, vote_average, vote_count
FROM movies
WHERE release_date >= '2000-01-01'
ORDER BY vote_average DESC
LIMIT 1;

--- movie(s) were directed by Brenda Chapman
select title from movies 
join directors on director_id = director_id
where name = 'Brenda chapman';

--- Which director made the most movies
select d.name, COUNT(m.id) AS total_movies
FROM directors d
JOIN movies m 
    ON d.id = m.director_id
GROUP BY d.name
ORDER BY total_movies DESC
LIMIT 1;

--- Which director is the most bankable
SELECT d.name, SUM(m.revenue) AS total_box_office
FROM directors d
JOIN movies m
    ON d.id = m.director_id
GROUP BY d.name
ORDER BY total_box_office DESC
LIMIT 1;








