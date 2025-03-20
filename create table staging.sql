create database stage_sakila;

create table stage_sakila.stg_actor
as select * from sakila.actor;

create table stage_sakila.stg_address
as select * from sakila.address;

create table stage_sakila.stg_category
as select * from sakila.category;

create table stage_sakila.stg_city
as select * from sakila.city;

create table stage_sakila.stg_country
as select * from sakila.country;

create table stage_sakila.stg_customer
as select * from sakila.customer;

create table stage_sakila.stg_film
as select * from sakila.film;

create table stage_sakila.stg_film_actor
as select * from sakila.film_actor;

create table stage_sakila.stg_film_category
as select * from sakila.film_category;


create table stage_sakila.stg_film_text
as select * from sakila.film_text;


create table stage_sakila.stg_inventory
as select * from sakila.inventory;

create table stage_sakila.stg_language
as select * from sakila.language;


create table stage_sakila.stg_payment
as select * from sakila.payment;


create table stage_sakila.stg_rental
as select * from sakila.rental;


create table stage_sakila.stg_staff
as select * from sakila.staff;

create table stage_sakila.stg_store
as select * from sakila.store;