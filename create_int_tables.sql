create table stg_sakila.int_actor
as select * from sakila.actor where 1=0;

create table stg_sakila.int_address
as select * from sakila.address where 1=0;

create table stg_sakila.int_category
as select * from sakila.category where 1=0;

create table stg_sakila.int_city
as select * from sakila.city where 1=0;

create table stg_sakila.int_country
as select * from sakila.country where 1=0;

create table stg_sakila.int_customer
as select * from sakila.customer where 1=0;

create table stg_sakila.int_film
as select * from sakila.film where 1=0;

create table stg_sakila.int_film_actor
as select * from sakila.film_actor where 1=0;

create table stg_sakila.int_film_category
as select * from sakila.film_category where 1=0;


create table stg_sakila.int_film_text
as select * from sakila.film_text where 1=0;


create table stg_sakila.int_inventory
as select * from sakila.inventory where 1=0;

create table stg_sakila.int_language
as select * from sakila.language where 1=0;


create table stg_sakila.int_payment
as select * from sakila.payment where 1=0;


create table stg_sakila.int_rental
as select * from sakila.rental where 1=0;


create table stg_sakila.int_staff
as select * from sakila.staff where 1=0;

create table stg_sakila.int_store
as select * from sakila.store where 1=0;