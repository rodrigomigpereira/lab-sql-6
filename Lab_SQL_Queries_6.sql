## Lab | SQL Queries 6
## In this activity we are going to do some database maintenance. In the current database we only have information on movies for the year 2006. Now we have received the film catalog for 2020 as well. 
## For this new data we will create another table and bulk insert all the data there. Code to create a new table has been provided below.

select distinct release_year from film; ## Every film of this table has its release_year as 2006

drop table if exists films_2020;

CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6),
  `rental_rate` decimal(4,2),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;

## We have just one item for each film, and all will be placed in the new table. 
## For 2020, the rental duration will be 3 days, with an offer price of 2.99€ and a replacement cost of 8.99€ (these are all fixed values for all movies for this year).
## The catalog is in a CSV file named films_2020.csv that can be found at files_for_lab folder.

## Instructions
	## Add the new films to the database.
	## Update information on rental_duration, rental_rate, and replacement_cost.
	## Hint: You might have to use the following commands to set bulk import option to ON:
		## show variables like 'local_infile';
		## set global local_infile = 1;
		## If bulk import gives an unexpected error, you can also use the data_import_wizard to insert data into the new table.

select * from films_2020; ## As this is the new table that we created, this table is empty for now

LOAD DATA LOCAL INFILE 'C:\\doing the LABs - by Rodrigo Pereira\\films_2020.csv'
INTO TABLE films_2020
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(film_id, title, description, release_year, language_id, riginal_language_id, original_language_id, rental_duration, rental_rate, length, replacement_cost, rating);

update films_2020
	set rental_duration = '3', rental_rate = '2.99', replacement_cost = '8.99';  ## https://www.w3schools.com/sql/sql_update.asp



