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


MANIPULATION

Look into table:
```
    SELECT * FROM celebs;
```
OR:
```
    SELECT column1, column2
    FROM table_name; 
```
Create new table:

    CREATE TABLE table_name (               
       column_1 data_type, 
       column_2 data_type, 
       column_3 data_type
    );


CREATE TABLE celebs (   <--- Name of table
   id INTEGER,          <--- interger is that id is whole number 
   name TEXT,           <--- name as text
   age INTEGER          <--- age as text
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


to alter the table:

    ALTER TABLE celebs
    ADD COLUMN twitter_handle TEXT;

to update:

    UPDATE celebs
    SET twitter_handle = "@taylorswift13"
    WHERE id = 4;


DELETE FROM celebs
WHERE twitter_handle IS NULL;       <---is a clause that lets you select which rows you want to delete. Here we want to delete                                  all of the rows where the twitter_handle column IS NULL.


Constraints that add information about how a column can be used are invoked after specifying the data type for a column. They can be used to tell the database to reject inserted data that does not adhere to a certain restriction. The statement below sets constraints on the celebs table.

    CREATE TABLE celebs (
       id INTEGER PRIMARY KEY, 
       name TEXT UNIQUE,
       date_of_birth TEXT NOT NULL,
       date_of_death TEXT DEFAULT 'Not Applicable'
    );