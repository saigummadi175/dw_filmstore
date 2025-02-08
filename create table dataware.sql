CREATE TABLE `d_actor` (
  `actor_id` smallint unsigned NOT NULL DEFAULT '0',
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `d_customer` (
  `customer_id` smallint unsigned NOT NULL DEFAULT '0',
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `district` varchar(20) NOT NULL,
  `country` varchar(50) NOT NULL,
  `location` geometry NOT NULL /*!80003 SRID 0 */,
  `phone` varchar(20) NOT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `create_date` datetime NOT NULL
);

CREATE TABLE `d_film` (
  `film_id` smallint unsigned NOT NULL DEFAULT '0',
  `title` varchar(128) NOT NULL,
  `description` text,
  `release_year` year DEFAULT NULL,
  `language_id` tinyint unsigned NOT NULL
);

CREATE TABLE `d_filmactor` (
  `actor_id` smallint unsigned NOT NULL,
  `film_id` smallint unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `d_store_staff` (
  `store_id` tinyint unsigned NOT NULL DEFAULT '0',
  `store_address` varchar(50),
  `store_district` varchar(20),
  `store_postal_code` varchar(10) DEFAULT NULL,
  `store_phone` varchar(20),
  `store_location` geometry /*!80003 SRID 0 */,
  `store_city` varchar(50),
  `store_country` varchar(50),
  `staff_id` tinyint unsigned DEFAULT '0',
  `first_name` varchar(45),
  `last_name` varchar(45),
  `email` varchar(50) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `username` varchar(16),
  `password` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `address_id` smallint unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `address` varchar(50),
  `district` varchar(20),
  `postal_code` varchar(10) DEFAULT NULL,
  `phone` varchar(20),
  `location` geometry /*!80003 SRID 0 */,
  `city` varchar(50),
  `country` varchar(50)
);

CREATE TABLE `f_payment` (
  `payment_id` smallint unsigned NOT NULL DEFAULT '0',
  `customer_id` smallint unsigned NOT NULL,
  `staff_id` tinyint unsigned NOT NULL,
  `rental_id` int DEFAULT NULL,
  `amount` decimal(5,2) NOT NULL,
  `payment_date` datetime NOT NULL,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `f_rental` (
  `rental_id` int NOT NULL DEFAULT '0',
  `rental_date` datetime NOT NULL,
  `inventory_id` mediumint unsigned NOT NULL,
  `customer_id` smallint unsigned NOT NULL,
  `return_date` datetime DEFAULT NULL,
  `staff_id` tinyint unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `f_sales` (
  `customer_id` int DEFAULT NULL,
  `store_staff_id` int DEFAULT NULL,
  `film_id` int DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `amount` decimal(5,2) DEFAULT NULL
);
