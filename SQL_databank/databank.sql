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