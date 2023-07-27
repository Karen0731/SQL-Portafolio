/*
JOINS
*/


/*
Inner Join
*/
CREATE TABLE persons (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    age INTEGER);
    
INSERT INTO persons (name, age) VALUES ("Bobby McBobbyFace", 12);
INSERT INTO persons (name, age) VALUES ("Lucy BoBucie", 25);
INSERT INTO persons (name, age) VALUES ("Banana FoFanna", 14);
INSERT INTO persons (name, age) VALUES ("Shish Kabob", 20);
INSERT INTO persons (name, age) VALUES ("Fluffy Sparkles", 8);
INSERT INTO persons (name, age) VALUES ("John Addams", 19); 

CREATE table hobbies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    person_id INTEGER,
    name TEXT);
    
INSERT INTO hobbies (person_id, name) VALUES (1, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (1, "coding");
INSERT INTO hobbies (person_id, name) VALUES (2, "dancing");
INSERT INTO hobbies (person_id, name) VALUES (2, "coding");
INSERT INTO hobbies (person_id, name) VALUES (3, "skating");
INSERT INTO hobbies (person_id, name) VALUES (3, "rowing");
INSERT INTO hobbies (person_id, name) VALUES (3, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (4, "coding");
INSERT INTO hobbies (person_id, name) VALUES (4, "dilly-dallying");
INSERT INTO hobbies (person_id, name) VALUES (4, "meowing");
INSERT INTO hobbies (person_id, name) VALUES (6, "coding");

SELECT persons.name, hobbies.name FROM persons JOIN hobbies ON persons.id = hobbies.person_id;

SELECT persons.name, hobbies.name FROM persons JOIN hobbies ON persons.id = hobbies.person_id WHERE persons.name="Bobby McBobbyFace";

/*
Left Join
*/

CREATE TABLE customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    email TEXT);
    
INSERT INTO customers (name, email) VALUES ("Doctor Who", "doctorwho@timelords.com");
INSERT INTO customers (name, email) VALUES ("Harry Potter", "harry@potter.com");
INSERT INTO customers (name, email) VALUES ("Captain Awesome", "captain@awesome.com");

CREATE TABLE orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER,
    item TEXT,
    price REAL);

INSERT INTO orders (customer_id, item, price)
    VALUES (1, "Sonic Screwdriver", 1000.00);
INSERT INTO orders (customer_id, item, price)
    VALUES (2, "High Quality Broomstick", 40.00);
INSERT INTO orders (customer_id, item, price)
    VALUES (1, "TARDIS", 1000000.00);
    
SELECT customers.name, customers.email, orders.item, orders.price FROM customers LEFT OUTER JOIN orders WHERE customers.id = orders.customer_id;

SELECT customers.name, customers.email, SUM(orders.price) AS "Total_Amount" FROM customers LEFT OUTER JOIN orders WHERE customers.id = orders.customer_id GROUP BY customers.name ORDER BY Total_Amount DESC;

/*
Self Join
*/

CREATE TABLE movies (id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    released INTEGER,
    sequel_id INTEGER);

INSERT INTO movies 
    VALUES (1, "Harry Potter and the Philosopher's Stone", 2001, 2);
INSERT INTO movies 
    VALUES (2, "Harry Potter and the Chamber of Secrets", 2002, 3);
INSERT INTO movies 
    VALUES (3, "Harry Potter and the Prisoner of Azkaban", 2004, 4);
INSERT INTO movies 
    VALUES (4, "Harry Potter and the Goblet of Fire", 2005, 5);
INSERT INTO movies 
    VALUES (5, "Harry Potter and the Order of the Phoenix ", 2007, 6);
INSERT INTO movies 
    VALUES (6, "Harry Potter and the Half-Blood Prince", 2009, 7);
INSERT INTO movies 
    VALUES (7, "Harry Potter and the Deathly Hallows – Part 1", 2010, 8);
INSERT INTO movies 
    VALUES (8, "Harry Potter and the Deathly Hallows – Part 2", 2011, NULL);
    
SELECT movies.title, sequel.title as "Sequel_Title" FROM movies LEFT OUTER JOIN movies sequel ON movies.sequel_id = sequel.id;


/*
Multiple Joins
*/

CREATE TABLE persons (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fullname TEXT,
    age INTEGER);
    
INSERT INTO persons (fullname, age) VALUES ("Bobby McBobbyFace", "12");
INSERT INTO persons (fullname, age) VALUES ("Lucy BoBucie", "25");
INSERT INTO persons (fullname, age) VALUES ("Banana FoFanna", "14");
INSERT INTO persons (fullname, age) VALUES ("Shish Kabob", "20");
INSERT INTO persons (fullname, age) VALUES ("Fluffy Sparkles", "8");

CREATE table hobbies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    person_id INTEGER,
    name TEXT);
    
INSERT INTO hobbies (person_id, name) VALUES (1, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (1, "coding");
INSERT INTO hobbies (person_id, name) VALUES (2, "dancing");
INSERT INTO hobbies (person_id, name) VALUES (2, "coding");
INSERT INTO hobbies (person_id, name) VALUES (3, "skating");
INSERT INTO hobbies (person_id, name) VALUES (3, "rowing");
INSERT INTO hobbies (person_id, name) VALUES (3, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (4, "coding");
INSERT INTO hobbies (person_id, name) VALUES (4, "dilly-dallying");
INSERT INTO hobbies (person_id, name) VALUES (4, "meowing");

CREATE table friends (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    person1_id INTEGER,
    person2_id INTEGER);

INSERT INTO friends (person1_id, person2_id)
    VALUES (1, 4);
INSERT INTO friends (person1_id, person2_id)
    VALUES (2, 3);
    
SELECT persons.fullname, hobbies.name FROM persons JOIN hobbies ON persons.id = hobbies.person_id;

SELECT a.fullname, b.fullname FROM friends
    JOIN persons a
    ON friends.person1_id = a.id
    JOIN persons b
    ON friends.person2_id = b.id;

/*
Mini Project with several JOINS
*/

CREATE TABLE people (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    type TEXT
);

INSERT INTO people (name, type) VALUES ("Jhon Addams", "actor");
INSERT INTO people (name, type) VALUES ("Wen Stacy", "actress");
INSERT INTO people (name, type) VALUES ("Michael Simmons", "actor");
INSERT INTO people (name, type) VALUES ("Stephan Morris", "actor");
INSERT INTO people (name, type) VALUES ("Amanda Sorrow", "actress");
INSERT INTO people (name, type) VALUES ("Emilia Fox", "actress");
INSERT INTO people (name, type) VALUES ("Patric Jhonas", "actor");
INSERT INTO people (name, type) VALUES ("Alice O'Connor", "actress");
INSERT INTO people (name, type) VALUES ("Samantha Morris", "actress");
INSERT INTO people (name, type) VALUES ("Nicholas Dawn", "actor");
INSERT INTO people (name, type) VALUES ("Bill Dunlap", "critic");
INSERT INTO people (name, type) VALUES ("Naomi Newton", "critic");
INSERT INTO people (name, type) VALUES ("Freddie Prince", "critic");

CREATE TABLE movies(
id INTEGER PRIMARY KEY AUTOINCREMENT,
actor_id1 NUMERIC,
actor_id2 NUMERIC,
actor_id3 NUMERIC,
title TEXT,
year NUMERIC);

INSERT INTO movies (actor_id1, actor_id2, actor_id3, title, year) VALUES (1,2,3,"The Dawn", 1999);
INSERT INTO movies (actor_id1, actor_id2, actor_id3, title, year) VALUES (5,6,10,"Prejudice", 2005);
INSERT INTO movies (actor_id1, actor_id2, actor_id3, title, year) VALUES (4,8,NULL,"Let's GO", 2003);
INSERT INTO movies (actor_id1, actor_id2, actor_id3, title, year) VALUES (7,9,NULL,"Just us", 2008);

CREATE TABLE rating(
id INTEGER PRIMARY KEY AUTOINCREMENT,
movie_id NUMERIC,
critic_id NUMERIC,
rating REAL);

INSERT INTO rating (movie_id, critic_id, rating) VALUES (1,11,5.7);
INSERT INTO rating (movie_id, critic_id, rating) VALUES (1,12,9.8);
INSERT INTO rating (movie_id, critic_id, rating) VALUES (1,13,7.7);
INSERT INTO rating (movie_id, critic_id, rating) VALUES (2,11,4.5);
INSERT INTO rating (movie_id, critic_id, rating) VALUES (2,12,10);
INSERT INTO rating (movie_id, critic_id, rating) VALUES (3,13,7.6);
INSERT INTO rating (movie_id, critic_id, rating) VALUES (4,12,8.8);
INSERT INTO rating (movie_id, critic_id, rating) VALUES (4,13,9.6);

/*SELECT * FROM people;
SELECT * FROM movies;
SELECT * FROM rating;*/

SELECT movies.title, a.name AS "Actor 1", b.name AS "Actor 2", c.name AS "Actor 3" FROM movies LEFT OUTER JOIN people a ON movies.actor_id1 = a.id LEFT OUTER JOIN people b ON movies.actor_id2 = b.id LEFT OUTER JOIN people c ON movies.actor_id3 = c.id;

SELECT movies.title, people.name, rating.rating FROM rating JOIN movies ON rating.movie_id = movies.id JOIN people ON rating.critic_id = people.id;

SELECT movies.title, ROUND(avg(rating.rating), 2) AS "Avg_Rating" FROM rating JOIN movies ON rating.movie_id = movies.id GROUP BY movies.title ORDER BY Avg_Rating DESC;

SELECT people.name, ROUND(avg(rating.rating), 2) AS "Avg_Rating_Given" FROM rating JOIN people ON rating.critic_id = people.id GROUP BY people.name ORDER BY Avg_Rating_Given DESC;
