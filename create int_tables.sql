

CREATE TABLE stage_sakila.int_actor (
  `actor_id` smallint ,
  `first_name` varchar(45) ,
  `last_name` varchar(45) ,
  `last_update`TIMESTAMP
) ;


CREATE TABLE stage_sakila.int_address (
  `address_id`int,
  `address` varchar(50),
  `address2` varchar(50),
  `district` varchar(20),
  `city_id`int,
  `postal_code` varchar(10) ,
  `phone` varchar(20) ,
  `location` geometry NOT NULL /*!80003 SRID 0 */,
  `last_update` timestamp )
  ;

CREATE TABLE stage_sakila.int_category (
  `category_id` tinyint ,
  `name` varchar(25) ,
  `last_update` timestamp 
) ;


CREATE TABLE stage_sakila.int_city (
  `city_id` smallint ,
  `city` varchar(50) ,
  `country_id` smallint ,
  `last_update` timestamp 
);


CREATE TABLE stage_sakila.int_country (
  `country_id` smallint ,
  `country` varchar(50) ,
  `last_update` timestamp 
) ;


CREATE TABLE stage_sakila.int_customer (
  `customer_id` smallint ,
  `store_id` tinyint ,
  `first_name` varchar(45) ,
  `last_name` varchar(45) ,
  `email` varchar(50) ,
  `address_id` smallint ,
  `active` tinyint(1) ,
  `create_date` datetime ,
  `last_update` timestamp 
) ;

CREATE TABLE stage_sakila.int_film (
  `film_id` smallint ,
  `title` varchar(128) ,
  `description` text,
  `release_year` year ,
  `language_id` tinyint ,
  `original_language_id` tinyint ,
  `rental_duration` tinyint ,
  `rental_rate` decimal(4,2) ,
  `length` smallint ,
  `replacement_cost` decimal(5,2) ,
  `rating` enum('G','PG','PG-13','R','NC-17') ,
  `special_features` set('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') ,
  `last_update` timestamp 
) ;


CREATE TABLE stage_sakila.int_film_actor (
  `actor_id` smallint ,
  `film_id` smallint ,
  `last_update` timestamp
) ;


CREATE TABLE stage_sakila.int_film_category (
  `film_id` smallint ,
  `category_id` tinyint,
  `last_update` timestamp
) ;

CREATE TABLE stage_sakila.int_film_text (
  `film_id` smallint NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text);

CREATE TABLE stage_sakila.int_inventory (
  `inventory_id` mediumint ,
  `film_id` smallint ,
  `store_id` tinyint ,
  `last_update` timestamp 
) ;

CREATE TABLE stage_sakila.int_language (
  `language_id` tinyint ,
  `name` char(20) ,
  `last_update` timestamp 
) ;


CREATE TABLE stage_sakila.int_payment (
  `payment_id` smallint ,
  `customer_id` smallint ,
  `staff_id` tinyint ,
  `rental_id` int ,
  `amount` decimal(5,2) ,
  `payment_date` datetime ,
  `last_update` timestamp 
) ;


CREATE TABLE stage_sakila.int_rental (
  `rental_id` int ,
  `rental_date` datetime ,
  `inventory_id` mediumint ,
  `customer_id` smallint ,
  `return_date` datetime ,
  `staff_id` tinyint ,
  `last_update` timestamp 
);

CREATE TABLE stage_sakila.int_staff (
  `staff_id` tinyint ,
  `first_name` varchar(45) ,
  `last_name` varchar(45) ,
  `address_id` smallint ,
  `picture` blob,
  `email` varchar(50) ,
  `store_id` tinyint ,
  `active` tinyint(1) ,
  `username` varchar(16) ,
  `password` varchar(40) ,
  `last_update` timestamp 
 ) ;

CREATE TABLE stage_sakila.int_store (
  `store_id` tinyint ,
  `manager_staff_id` tinyint ,
  `address_id` smallint ,
  `last_update` timestamp
) ;










