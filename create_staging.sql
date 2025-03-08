create database stg_sakila;

create table stg_sakila.stg_actor
as select * from sakila.actor;

create table stg_sakila.stg_address
as select * from sakila.address;

create table stg_sakila.stg_category
as select * from sakila.category;

create table stg_sakila.stg_city
as select * from sakila.city;

create table stg_sakila.stg_country
as select * from sakila.country;

create table stg_sakila.stg_customer
as select * from sakila.customer;

create table stg_sakila.stg_film
as select * from sakila.film;

create table stg_sakila.stg_film_actor
as select * from sakila.film_actor;

create table stg_sakila.stg_film_category
as select * from sakila.film_category;


create table stg_sakila.stg_film_text
as select * from sakila.film_text;


create table stg_sakila.stg_inventory
as select * from sakila.inventory;

create table stg_sakila.stg_language
as select * from sakila.language;


create table stg_sakila.stg_payment
as select * from sakila.payment;


create table stg_sakila.stg_rental
as select * from sakila.rental;


create table stg_sakila.stg_staff
as select * from sakila.staff;

create table stg_sakila.stg_store
as select * from sakila.store;