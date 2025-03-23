begin;

delete from stg_sakila.int_actor;
delete from stg_sakila.int_address;
delete from stg_sakila.int_category;
delete from stg_sakila.int_city;
delete from stg_sakila.int_country;
delete from stg_sakila.int_customer;
delete from stg_sakila.int_film;
delete from stg_sakila.int_film_actor;
delete from stg_sakila.int_film_category;
delete from stg_sakila.int_inventory;
delete from stg_sakila.int_language;
delete from stg_sakila.int_payment;
delete from stg_sakila.int_rental;
delete from stg_sakila.int_staff;
delete from stg_sakila.int_store;

/*actor*/

update sakila.delta_watermark
set currentTimestamp = current_timestamp() 
where table_name='actor';

insert into stg_sakila.int_actor
select * from sakila.actor a
where a.last_update < (	select currentTimestamp 
                        from sakila.delta_watermark
						where table_name = 'actor')
and a.last_update >= (	select lastLoaded_timestamp 
                        from sakila.delta_watermark
						where table_name = 'actor');
                        
update sakila.delta_watermark w
set w.lastLoaded_timestamp = w.currentTimestamp
where table_name='actor';


/*address*/

update sakila.delta_watermark
set currentTimestamp = current_timestamp() 
where table_name='address';

insert into stg_sakila.int_address
select * from sakila.address a
where a.last_update < (	select currentTimestamp 
                        from sakila.delta_watermark
						where table_name = 'address') 
and a.last_update >= (	select lastLoaded_timestamp 
                        from sakila.delta_watermark
						where table_name = 'address');
                        
update sakila.delta_watermark w
set w.lastLoaded_timestamp = w.currentTimestamp
where table_name='address';


/*category*/

update sakila.delta_watermark
set currentTimestamp = current_timestamp() 
where table_name='category';

insert into stg_sakila.int_category
select * from sakila.category c
where c.last_update < (	select currentTimestamp 
                        from sakila.delta_watermark
						where table_name = 'category') 
and c.last_update >= (	select lastLoaded_timestamp 
                        from sakila.delta_watermark
						where table_name = 'category');
                        
update sakila.delta_watermark w
set w.lastLoaded_timestamp = w.currentTimestamp
where table_name='category';


/*city*/

update sakila.delta_watermark
set currentTimestamp = current_timestamp()
where table_name = 'city';


insert into stg_sakila.int_city
select * from sakila.city ct
where ct.last_update >= (select lastloaded_timestamp from sakila.delta_watermark where table_name = 'city')
and ct.last_update < (select currentTimestamp from sakila.delta_watermark where table_name = 'city')
 ;

update sakila.delta_watermark
set lastloaded_timestamp = currentTimestamp
where table_name = 'city';


/*country*/

update sakila.delta_watermark
set currentTimestamp = current_timestamp()
where table_name = 'country';


insert into stg_sakila.int_country
select * from sakila.country ctry
where ctry.last_update >= (select lastloaded_timestamp from sakila.delta_watermark where table_name = 'country')
and ctry.last_update < (select currentTimestamp from sakila.delta_watermark where table_name = 'country')
 ;

update sakila.delta_watermark
set lastloaded_timestamp = currentTimestamp
where table_name = 'country';


/* customer */

update sakila.delta_watermark
set currentTimestamp = current_timestamp()
where table_name = 'customer';


insert into stg_sakila.int_customer
select * from sakila.customer ctmr
where ctmr.last_update >= (select lastloaded_timestamp from sakila.delta_watermark where table_name = 'customer')
and ctmr.last_update < (select currentTimestamp from sakila.delta_watermark where table_name = 'customer')
 ;

update sakila.delta_watermark
set lastloaded_timestamp = currentTimestamp
where table_name = 'customer';


/* film */

update sakila.delta_watermark
set currentTimestamp = current_timestamp()
where table_name = 'film';


insert into stg_sakila.int_film
select * from sakila.film f
where f.last_update >= (select lastloaded_timestamp from sakila.delta_watermark where table_name = 'film')
and f.last_update < (select currentTimestamp from sakila.delta_watermark where table_name = 'film')
 ;

update sakila.delta_watermark
set lastloaded_timestamp = currentTimestamp
where table_name = 'film';


/* film_actor*/

update sakila.delta_watermark
set currentTimestamp = current_timestamp()
where table_name = 'film_actor';


insert into stg_sakila.int_film_actor
select * from sakila.film_actor fa
where fa.last_update >= (select lastloaded_timestamp from sakila.delta_watermark where table_name = 'film_actor')
and fa.last_update < (select currentTimestamp from sakila.delta_watermark where table_name = 'film_actor')
 ;

update sakila.delta_watermark
set lastloaded_timestamp = currentTimestamp
where table_name = 'film_actor';


/* film_category */

update sakila.delta_watermark
set currentTimestamp = current_timestamp()
where table_name = 'film_category';


insert into stg_sakila.int_film_category
select * from sakila.film_category fc
where fc.last_update >= (select lastloaded_timestamp from sakila.delta_watermark where table_name = 'film_category')
and fc.last_update < (select currentTimestamp from sakila.delta_watermark where table_name = 'film_category')
 ;

update sakila.delta_watermark
set lastloaded_timestamp = currentTimestamp
where table_name = 'film_category';

/* inventory*/

update sakila.delta_watermark
set currentTimestamp = current_timestamp()
where table_name = 'inventory';


insert into stg_sakila.int_inventory
select * from sakila.inventory i
where i.last_update >= (select lastloaded_timestamp from sakila.delta_watermark where table_name = 'inventory')
and i.last_update < (select currentTimestamp from sakila.delta_watermark where table_name = 'inventory')
 ;

update sakila.delta_watermark
set lastloaded_timestamp = currentTimestamp
where table_name = 'inventory';


/* language */

update sakila.delta_watermark
set currentTimestamp = current_timestamp()
where table_name = 'language';


insert into stg_sakila.int_language
select * from sakila.language l
where l.last_update >= (select lastloaded_timestamp from sakila.delta_watermark where table_name = 'language')
and l.last_update < (select currentTimestamp from sakila.delta_watermark where table_name = 'language')
 ;

update sakila.delta_watermark
set lastloaded_timestamp = currentTimestamp
where table_name = 'language';


/* payment */

update sakila.delta_watermark
set currentTimestamp = current_timestamp()
where table_name = 'payment';


insert into stg_sakila.int_payment
select * from sakila.payment p
where p.last_update >= (select lastloaded_timestamp from sakila.delta_watermark where table_name = 'payment')
and p.last_update < (select currentTimestamp from sakila.delta_watermark where table_name = 'payment')
 ;

update sakila.delta_watermark
set lastloaded_timestamp = currentTimestamp
where table_name = 'payment';


/* rental */

update sakila.delta_watermark
set currentTimestamp = current_timestamp()
where table_name = 'rental';


insert into stg_sakila.int_rental
select * from sakila.rental r
where r.last_update >= (select lastloaded_timestamp from sakila.delta_watermark where table_name = 'rental')
and r.last_update < (select currentTimestamp from sakila.delta_watermark where table_name = 'rental')
 ;

update sakila.delta_watermark
set lastloaded_timestamp = currentTimestamp
where table_name = 'rental';


/* staff */

update sakila.delta_watermark
set currentTimestamp = current_timestamp()
where table_name = 'staff';


insert into stg_sakila.int_staff
select * from sakila.staff s
where s.last_update >= (select lastloaded_timestamp from sakila.delta_watermark where table_name = 'staff')
and s.last_update < (select currentTimestamp from sakila.delta_watermark where table_name = 'staff')
 ;

update sakila.delta_watermark
set lastloaded_timestamp = currentTimestamp
where table_name = 'staff';


/* store */

update sakila.delta_watermark
set currentTimestamp = current_timestamp()
where table_name = 'store';


insert into stg_sakila.int_store
select * from sakila.store st
where st.last_update >= (select lastloaded_timestamp from sakila.delta_watermark where table_name = 'store')
and st.last_update < (select currentTimestamp from sakila.delta_watermark where table_name = 'store')
 ;

update sakila.delta_watermark
set lastloaded_timestamp = currentTimestamp
where table_name = 'store';


commit;
