CREATE DATABASE netflix_project;
CREATE TABLE netflix_titles_generated (
    show_id VARCHAR(10),
    type VARCHAR(20),
    title VARCHAR(255),
    director VARCHAR(255),
    cast_members TEXT,
    country VARCHAR(100),
    date_added VARCHAR(50),
    release_year INT,
    rating VARCHAR(20),
    duration VARCHAR(30),
    listed_in VARCHAR(255),
    description TEXT
);
SELECT *FROM netflix_titles_generated;
SELECT COUNT(*)FROM netflix_titles_generated;
DROP TABLE netflix_titles_generated;
SELECT COUNT(*) FROM netflix_titles_generated;
USE netflix_project;
SHOW TABLES;
SELECT DATABASE();
CREATE TABLE netflix_titles_generated (
    show_id VARCHAR(10),
    type VARCHAR(20),
    title VARCHAR(255),
    director VARCHAR(255),
    cast_members TEXT,
    country VARCHAR(100),
    date_added VARCHAR(50),
    release_year INT,
    rating VARCHAR(20),
    duration VARCHAR(30),
    listed_in VARCHAR(255),
    description TEXT
);
SHOW TABLES;
USE netflix_project;
SHOW TABLES;
DESCRIBE netflix_titles_generated;
SELECT COUNT(*)FROM netflix_titles_generated;
SELECT *FROM netflix_titles_generated;
SELECT *FROM netflix_titles_generated LIMIT 10;
SELECT type, COUNT(*) AS total FROM netflix_titles_generated GROUP BY type;
SELECT country, COUNT(*) AS total_titles FROM netflix_titles_generated GROUP BY country ORDER BY total_titles DESC;
SELECT title, type, release_year FROM netflix_titles_generated ORDER BY release_year DESC LIMIT 10;
SELECT title, release_year FROM netflix_titles_generated WHERE release_year > 2020;
SELECT title, type FROM netflix_titles_generated WHERE type = 'TV Show';
SELECT title, country FROM netflix_titles_generated WHERE country = 'India';
SELECT title, release_year FROM netflix_titles_generated WHERE release_year BETWEEN 2018 AND 2022;
SELECT title, country FROM netflix_titles_generated WHERE country <> 'India';
SELECT title, country FROM netflix_titles_generated WHERE country IN ('India', 'Japan', 'Spain');
SELECT title FROM netflix_titles_generated WHERE title LIKE '%Title 1%';
SELECT title, country, release_year FROM netflix_titles_generated WHERE country = 'India' AND release_year > 2020;
SELECT title, country FROM netflix_titles_generated WHERE country = 'India' OR country = 'Japan';
SELECT MAX(release_year) AS newest_year, MIN(release_year) AS oldest_year, AVG(release_year) AS average_year FROM netflix_titles_generated;
SELECT country, COUNT(*) AS total_titles FROM netflix_titles_generated GROUP BY country HAVING COUNT(*) > 150;
SELECT title, release_year,CASE WHEN release_year >= 2020 THEN 'New' ELSE 'Old' END AS category FROM netflix_titles_generated;
SELECT title, LENGTH(title) AS title_length FROM netflix_titles_generated;
SELECT title, UPPER(title) AS upper_title FROM netflix_titles_generated;
SELECT *FROM netflix_titles_generated WHERE director IS NULL;
SELECT DISTINCT country FROM netflix_titles_generated;
SELECT COUNT(DISTINCT country) AS total_countries FROM netflix_titles_generated;
SELECT country,MAX(release_year) AS latest_release FROM netflix_titles_generated GROUP BY country;
SELECT country,MAX(release_year) AS latest_release FROM netflix_titles_generated GROUP BY country HAVING MAX(release_year) > 2022;
SELECT title, release_year FROM netflix_titles_generated WHERE release_year = (SELECT MAX(release_year)FROM netflix_titles_generated);
CREATE TABLE ratings_info (rating VARCHAR(20),audience VARCHAR(50));
INSERT INTO ratings_info (rating, audience)VALUES('TV-14','Teen'),('TV-MA','Mature'),('PG-13','Parents Guidance'),('PG','General'),('R','Adults');
SELECT *FROM ratings_info;
SELECT n.title,n.rating,r.audience FROM netflix_titles_generated n INNER JOIN ratings_info r ON n.rating = r.rating;
SELECT r.audience,COUNT(*) AS total_titles FROM netflix_titles_generated n INNER JOIN ratings_info r ON n.rating = r.rating GROUP BY r.audience;
SELECT n.title,n.rating,r.audience FROM netflix_titles_generated n LEFT JOIN ratings_info r ON n.rating = r.rating;
SELECT rating,COUNT(*) AS total_titles FROM netflix_titles_generated GROUP BY rating HAVING COUNT(*) > 100;
WITH country_count AS (SELECT country,COUNT(*) AS total_titles FROM netflix_titles_generated GROUP BY country)SELECT * FROM country_count;
SELECT title, release_year, ROW_NUMBER() OVER(ORDER BY release_year DESC) AS row_num FROM netflix_titles_generated;
SELECT title, release_year, RANK() OVER(ORDER BY release_year DESC) AS ranking FROM netflix_titles_generated;
SELECT *FROM ( SELECT title, release_year, DENSE_RANK() OVER (ORDER BY release_year DESC) AS rnk FROM netflix_titles_generated ) AS ranked_titles WHERE rnk <= 5;
SELECT title, release_year, LAG(release_year) OVER (ORDER BY release_year) AS previous_year FROM netflix_titles_generated;
SELECT title, release_year,LEAD(release_year) OVER (ORDER BY release_year) AS next_year FROM netflix_titles_generated;
CREATE VIEW indian_titles AS SELECT title, release_year, rating FROM netflix_titles_generated WHERE country = 'India';
SELECT * FROM netflix_titles_generated WHERE country = 'India';