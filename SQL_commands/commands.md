# Basics 
## SQL - commands 

                                                                    BASICS

SQL is a programming language designed to manipulate and manage data stored in relational databases.

    A relational database is a database that organizes information into one or more tables.
    A table is a collection of data organized into rows and columns.

A statement is a string of characters that the database recognizes as a valid command.

    CREATE TABLE creates a new table.
    INSERT INTO adds a new row to a table.
    SELECT queries data from a table.
    ALTER TABLE changes an existing table.
    UPDATE edits a row in a table.
    DELETE FROM deletes rows from a table.

Create new table:

    CREATE TABLE table_name (               
       column_1 data_type, 
       column_2 data_type, 
       column_3 data_type
    );

    Name of table-                          CREATE TABLE celebs (    
    interger is that id is whole number-    id INTEGER, 
    name as text-                           name TEXT,  
    age as whole number-                    age INTEGER 
                                            );
to adds the specified row or rows:

    INSERT INTO celebs (id, name, age)
    VALUES (1, "Justin Bieber", 29);

    INSERT INTO celebs (id, name, age)
    VALUES (2, "Beyonce Knowles", 42);

    INSERT INTO celebs (id, name, age)
    VALUES (3, "Jeremy Lin", 35);

    INSERT INTO celebs (id, name, age)
    VALUES (4, "Taylor Swift", 33);
#
                                                                MANIPULATION

Look into table:

select * means select all. or all columns.

    SELECT * FROM celebs;

We can select individual columns.

    SELECT column1, column2, column3
    FROM table_name; 


you can rename column using alias AS, columns are not renamed. aliases only appear in the results.

    SELECT name AS 'Titles'
    FROM movies;

By adding DISTINCT before the column name. it is filtering tool it filtersout all duplicates in column. would return only city name in that specific column without duplicates!

    SELECT DISTINCT city
    FROM contact_details;

to alter the table:

    ALTER TABLE celebs
    ADD COLUMN twitter_handle TEXT;
#

                                                            WHERE CLAUSE and OPERATORS with WHERE.
summarize:

    SELECT is the clause we use every time we want to query information from a database.
    AS renames a column or table.
    DISTINCT return unique values.
    WHERE is a popular command that lets you filter the results of the query based on conditions that you specify.
    LIKE and BETWEEN are special operators.
    AND and OR combines multiple conditions.
    ORDER BY sorts the result.
    LIMIT specifies the maximum number of rows that the query will return.
    CASE creates different outputs.

using WHERE to get specific information

    SELECT *
    FROM movies
    WHERE imdb_rating > 8;

usind with AND operator.

    SELECT model 
    FROM cars 
    WHERE color = 'blue' 
        AND year > 2014;

operators used with the WHERE clause are:

    = equal to
    != not equal to
    > greater than
    < less than
    >= greater than or equal to
    <= less than or equal to

using operator LIKE when you want to compare similair values. movie titles Seven and Se7en.

    SELECT * 
    FROM movies
    WHERE name LIKE 'Se_en';
    

    LIKE is a special operator used with the WHERE clause to search for a specific pattern in a column.

    name LIKE 'Se_en' is a condition evaluating the name column for a specific pattern.

    Se_en represents a pattern with a wildcard character.

The percentage sign % is another wildcard character that can be used with LIKE. sets to only include movies with names that begin with the letter ‘A’:

    SELECT * 
    FROM movies
    WHERE name LIKE 'A%';

    SELECT * 
    FROM movies 
    WHERE name LIKE '%man%';

to update:

    UPDATE celebs
    SET twitter_handle = "@taylorswift13"
    WHERE id = 4;

here will find all queries without imbd rating in column. Column values can be NULL, or have no value. These records can be matched (or not matched) using the IS NULL and IS NOT NULL operators in combination with the WHERE clause. The given query will match all addresses where the address has a value or is not NULL.

    SELECT name
    FROM movies 
    WHERE imdb_rating IS NULL;

    SELECT address
    FROM records
    WHERE address IS NOT NULL;

NULL: is a clause that lets you select which rows you want to delete. Here we want to delete all of the rows where the twitter_handle column IS NULL. to delete

    DELETE FROM celebs
    WHERE twitter_handle IS NULL;

The BETWEEN operator is used in a WHERE clause to filter the result set within a certain range. It accepts two values that are either numbers, text or dates.

    SELECT *
    FROM movies
    WHERE year BETWEEN 1990 AND 1999;

    SELECT *
    FROM movies
    WHERE name BETWEEN 'A' AND 'J';

AND operator. Sometimes we want to combine multiple conditions in a WHERE clause to make the result set more specific and useful. 

    SELECT * 
    FROM movies
    WHERE year BETWEEN 1990 AND 1999
    AND genre = 'romance';

    SELECT *
    FROM movies
    WHERE year BETWEEN 1970 AND 1979
    AND imdb_rating > 8;

Similar to AND, the OR operator can also be used to combine multiple conditions in WHERE, but there is a fundamental difference:

    AND operator displays a row if all the conditions are true.
    OR operator displays a row if any condition is true.

    SELECT *
    FROM movies
    WHERE year > 2014
    OR genre = 'action';

    SELECT *
    FROM movies
    WHERE genre = 'romance'
    OR genre = 'comedy';
#
                                                    That’s it with WHERE and its operators. Moving on!


We can sort the results using ORDER BY, either alphabetically or numerically. Note: ORDER BY always goes after WHERE (if WHERE is present).

    ORDER BY is a clause that indicates you want to sort the result set by a particular column.
    name is the specified column.

    SELECT *
    FROM movies
    ORDER BY name;   

    DESC is a keyword used in ORDER BY to sort the results in descending order (high to low or Z-A).
    ASC is a keyword used in ORDER BY to sort the results in ascending order (low to high or A-Z).

    SELECT *
    FROM movies
    WHERE imdb_rating > 8
    ORDER BY year DESC;

    SELECT name, year
    FROM movies
    ORDER BY name ASC;

using LIMIT for big data.

    SELECT *
    FROM movies
    LIMIT 10;

    SELECT *
    FROM movies
    ORDER BY imdb_rating DESC
    LIMIT 3;

A CASE statement allows us to create different outputs (usually in the SELECT statement). It is SQL’s way of handling if-then logic.

Suppose we want to condense the ratings in movies to three levels:

    If the rating is above 8, then it is Fantastic.
    If the rating is above 6, then it is Poorly Received.
    Else, Avoid at All Costs.

    SELECT name,
     CASE
      WHEN imdb_rating > 8 THEN 'Fantastic'
      WHEN imdb_rating > 6 THEN 'Poorly Received'
      ELSE 'Avoid at All Costs'
      END AS 'Review'
     END
    FROM movies;

Constraints that add information about how a column can be used are invoked after specifying the data type for a column. They can be used to tell the database to reject inserted data that does not adhere to a certain restriction. The statement below sets constraints on the celebs table.

    CREATE TABLE celebs (
       id INTEGER PRIMARY KEY, 
       name TEXT UNIQUE,
       date_of_birth TEXT NOT NULL,
       date_of_death TEXT DEFAULT 'Not Applicable'
    );