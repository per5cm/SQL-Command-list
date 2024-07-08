CREATE TABLE celebs (
   id INTEGER, 
   name TEXT, 
   age INTEGER
);

INSERT INTO celebs (id, name, age)
VALUES (1, "Justin Bieber", 29);

INSERT INTO celebs (id, name, age)
VALUES (2, "Beyonce Knowles", 42);

INSERT INTO celebs (id, name, age)
VALUES (3, "Jeremy Lin", 35);

INSERT INTO celebs (id, name, age)
VALUES (4, "Taylor Swift", 33);

ALTER TABLE celebs
ADD twitter_handle TEXT;

UPDATE celebs
SET twitter_handle = "@taylorswift13"
WHERE id = 4;

CREATE TABLE celebs (
   id INTEGER PRIMARY KEY, 
   name TEXT UNIQUE,
   date_of_birth TEXT NOT NULL,
   date_of_death TEXT DEFAULT 'Not Applicable'
);

SELECT name AS 'Titles'
FROM movies;

SELECT * 
FROM movies 
WHERE year >2014;

SELECT * 
FROM movies
WHERE name LIKE 'Se_en';

SELECT * 
FROM movies
WHERE name LIKE 'The %';

SELECT name
FROM movies 
WHERE imdb_rating IS NOT NULL;

SELECT *
FROM movies
WHERE name BETWEEN 'A' AND 'J';

SELECT * 
FROM movies
WHERE year BETWEEN 1990 AND 1999
   AND genre = 'romance';

SELECT * 
FROM movies
WHERE year < 1985
   AND genre = 'horror';

SELECT *
FROM movies
WHERE genre = 'romance'
   OR genre = 'comedy';

SELECT name,
 CASE
  WHEN imdb_rating > 8 THEN 'Fantastic'
  WHEN imdb_rating > 6 THEN 'Poorly Received'
  ELSE 'Avoid at All Costs'
 END
FROM movies;