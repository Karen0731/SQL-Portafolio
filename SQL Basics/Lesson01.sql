/**
Create TABLE 
**/

CREATE TABLE books (id NUMERIC, name TEXT, rating NUMERIC);

/**
Insert VALUES to Table
**/

INSERT INTO books VALUES (1, "Pride & Prejudice", 4);
INSERT INTO books VALUES (2, "Almond", 3);
INSERT INTO books VALUES (3, "The Phsycoanalyst ", 5);

/**
Querying Table
**/

CREATE TABLE movies (id INTEGER PRIMARY KEY, name TEXT, release_year INTEGER);
INSERT INTO movies VALUES (1, "Avatar", 2009);
INSERT INTO movies VALUES (2, "Titanic", 1997);
INSERT INTO movies VALUES (3, "Star Wars: Episode IV - A New Hope", 1977);
INSERT INTO movies VALUES (4, "Shrek 2", 2004);
INSERT INTO movies VALUES (5, "The Lion King", 1994);
INSERT INTO movies VALUES (6, "Disney's Up", 2009);
 
 
SELECT * FROM movies;

SELECT * FROM movies WHERE release_year >= 2000 ORDER BY release_year;


/**
Aggregating data (MAX, MIN, SUM, ...)
**/

CREATE TABLE todo_list (id INTEGER PRIMARY KEY, item TEXT, minutes INTEGER);
INSERT INTO todo_list VALUES (1, "Wash the dishes", 15);
INSERT INTO todo_list VALUES (2, "vacuuming", 20);
INSERT INTO todo_list VALUES (3, "Learn some stuff on KA", 30);

INSERT INTO todo_list VALUES (4, "Total Time", (SELECT  SUM(minutes) FROM todo_list));

SELECT SUM(minutes) FROM todo_list;

/**
Mini Project
**/

CREATE TABLE store (id NUMERIC, name TEXT, price NUMERIC, amount NUMERIC, type TEXT , description TEXT);

INSERT INTO store VALUES (1, "Pants", 10.5, 5, "Bottom", "Blue pants made of wool");
INSERT INTO store VALUES (2, "Dress", 15.65, 10,"Full", "Silk dress, pink with big ribbon on waist");
INSERT INTO store VALUES (3, "Tenis Shoes", 25.2, 3, "Shoes", "White tenis shoes, with black and white lases");
INSERT INTO store VALUES (4, "Boots", 17.87, 4,"Shoes", "Brown tall Boots from woman");
INSERT INTO store VALUES (5, "Cap", 9, 12,"Hat", "Red Hat with the Chiefs logo");
INSERT INTO store VALUES (6, "Umbrella", 25.7, 6,"Accesory", "No color umbrella");
INSERT INTO store VALUES (7, "Socks", 5.67, 18,"Underwear", "White socks for man");
INSERT INTO store VALUES (8, "Bra", 15.99, 5, "Underwear","Pink lace bra");
INSERT INTO store VALUES (9, "T-Shirt", 9.99, 16,"Top", "T-shirt with pinguin drawing");
INSERT INTO store VALUES (10, "Pijamas", 22.5, 6,"Full", "Black pijamas for man");
INSERT INTO store VALUES (11, "Purse", 35, 5,"Accesory", "Brown Purse with bandana");
INSERT INTO store VALUES (12, "Jacket", 34.6, 2,"Jacket", "Black jacket with several pockets, made of leather");
INSERT INTO store VALUES (13, "Coat", 40.8, 3, "Jacket", "Light brown coat for woman");
INSERT INTO store VALUES (14, "Jeans", 20.99, 25,"Bottom", "Blue denim jeans for woman with patches on the knees");
INSERT INTO store VALUES (15, "Blouse", 10.6, 8, "Top", "White blouse with flowers");

SELECT * FROM store;

SELECT sum(amount) FROM store;

SELECT type, sum(amount) FROM store GROUP BY type;

SELECT * from STORE ORDER BY price;


