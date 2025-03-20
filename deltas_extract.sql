
/*actor*/

begin;

update sakila.audit_table
set currenttimestamp = current_timestamp()
where tablename = 'actor';

insert into stage_sakila.int_actor
select * from sakila.actor a
where a.last_update >= (select lastloaded_timestamp from sakila.audit_table where tablename = 'actor')
and a.last_update < (select currenttimestamp from sakila.audit_table where tablename = 'actor') ;

update sakila.audit_table
set lastloaded_timestamp = currenttimestamp
where tablename = 'actor';

commit;

/*address*/

begin;

update sakila.audit_table
set currenttimestamp = current_timestamp()
where tablename = 'address';


insert into stage_sakila.int_address
select * from sakila.address ad
where ad.last_update >= (select lastloaded_timestamp from sakila.audit_table where tablename = 'address')
and ad.last_update < (select currenttimestamp from sakila.audit_table where tablename = 'address')
 ;

update sakila.audit_table
set lastloaded_timestamp = currenttimestamp
where tablename = 'address';

commit;


/*category*/


begin;

update sakila.audit_table
set currenttimestamp = current_timestamp()
where tablename = 'category';


insert into stage_sakila.int_category
select * from sakila.category c
where c.last_update >= (select lastloaded_timestamp from sakila.audit_table where tablename = 'category')
and c.last_update < (select currenttimestamp from sakila.audit_table where tablename = 'category')
 ;

update sakila.audit_table
set lastloaded_timestamp = currenttimestamp
where tablename = 'category';

commit;

/*city*/

begin;

update sakila.audit_table
set currenttimestamp = current_timestamp()
where tablename = 'city';


insert into stage_sakila.int_city
select * from sakila.city ct
where ct.last_update >= (select lastloaded_timestamp from sakila.audit_table where tablename = 'city')
and ct.last_update < (select currenttimestamp from sakila.audit_table where tablename = 'city')
 ;

update sakila.audit_table
set lastloaded_timestamp = currenttimestamp
where tablename = 'city';

commit;

/*country*/


begin;

update sakila.audit_table
set currenttimestamp = current_timestamp()
where tablename = 'country';


insert into stage_sakila.int_country
select * from sakila.country ctry
where ctry.last_update >= (select lastloaded_timestamp from sakila.audit_table where tablename = 'country')
and ctry.last_update < (select currenttimestamp from sakila.audit_table where tablename = 'country')
 ;

update sakila.audit_table
set lastloaded_timestamp = currenttimestamp
where tablename = 'country';

commit;


/* customer */

begin;

update sakila.audit_table
set currenttimestamp = current_timestamp()
where tablename = 'customer';


insert into stage_sakila.int_customer
select * from sakila.customer ctmr
where ctmr.last_update >= (select lastloaded_timestamp from sakila.audit_table where tablename = 'customer')
and ctmr.last_update < (select currenttimestamp from sakila.audit_table where tablename = 'customer')
 ;

update sakila.audit_table
set lastloaded_timestamp = currenttimestamp
where tablename = 'customer';

commit;

/* film */


begin;

update sakila.audit_table
set currenttimestamp = current_timestamp()
where tablename = 'film';


insert into stage_sakila.int_film
select * from sakila.film f
where f.last_update >= (select lastloaded_timestamp from sakila.audit_table where tablename = 'film')
and f.last_update < (select currenttimestamp from sakila.audit_table where tablename = 'film')
 ;

update sakila.audit_table
set lastloaded_timestamp = currenttimestamp
where tablename = 'film';

commit;

/* film_actor*/

begin;

update sakila.audit_table
set currenttimestamp = current_timestamp()
where tablename = 'film_actor';


insert into stage_sakila.int_film_actor
select * from sakila.film_actor fa
where fa.last_update >= (select lastloaded_timestamp from sakila.audit_table where tablename = 'film_actor')
and fa.last_update < (select currenttimestamp from sakila.audit_table where tablename = 'film_actor')
 ;

update sakila.audit_table
set lastloaded_timestamp = currenttimestamp
where tablename = 'film_actor';

commit;


/* film_category */


begin;

update sakila.audit_table
set currenttimestamp = current_timestamp()
where tablename = 'film_category';


insert into stage_sakila.int_film_category
select * from sakila.film_category fc
where fc.last_update >= (select lastloaded_timestamp from sakila.audit_table where tablename = 'film_category')
and fc.last_update < (select currenttimestamp from sakila.audit_table where tablename = 'film_category')
 ;

update sakila.audit_table
set lastloaded_timestamp = currenttimestamp
where tablename = 'film_category';

commit;

/* inventory*/

begin;

update sakila.audit_table
set currenttimestamp = current_timestamp()
where tablename = 'inventory';


insert into stage_sakila.int_inventory
select * from sakila.inventory i
where i.last_update >= (select lastloaded_timestamp from sakila.audit_table where tablename = 'inventory')
and i.last_update < (select currenttimestamp from sakila.audit_table where tablename = 'inventory')
 ;

update sakila.audit_table
set lastloaded_timestamp = currenttimestamp
where tablename = 'inventory';

commit;


/* language */

begin;

update sakila.audit_table
set currenttimestamp = current_timestamp()
where tablename = 'language';


insert into stage_sakila.int_language
select * from sakila.language l
where l.last_update >= (select lastloaded_timestamp from sakila.audit_table where tablename = 'language')
and l.last_update < (select currenttimestamp from sakila.audit_table where tablename = 'language')
 ;

update sakila.audit_table
set lastloaded_timestamp = currenttimestamp
where tablename = 'language';

commit;


/* payment */

begin;

update sakila.audit_table
set currenttimestamp = current_timestamp()
where tablename = 'payment';


insert into stage_sakila.int_payment
select * from sakila.payment p
where p.last_update >= (select lastloaded_timestamp from sakila.audit_table where tablename = 'payment')
and p.last_update < (select currenttimestamp from sakila.audit_table where tablename = 'payment')
 ;

update sakila.audit_table
set lastloaded_timestamp = currenttimestamp
where tablename = 'payment';

commit;

/* rental */

begin;

update sakila.audit_table
set currenttimestamp = current_timestamp()
where tablename = 'rental';


insert into stage_sakila.int_rental
select * from sakila.rental r
where r.last_update >= (select lastloaded_timestamp from sakila.audit_table where tablename = 'rental')
and r.last_update < (select currenttimestamp from sakila.audit_table where tablename = 'rental')
 ;

update sakila.audit_table
set lastloaded_timestamp = currenttimestamp
where tablename = 'rental';

commit;



/* staff */

begin;

update sakila.audit_table
set currenttimestamp = current_timestamp()
where tablename = 'staff';


insert into stage_sakila.int_staff
select * from sakila.staff s
where s.last_update >= (select lastloaded_timestamp from sakila.audit_table where tablename = 'staff')
and s.last_update < (select currenttimestamp from sakila.audit_table where tablename = 'staff')
 ;

update sakila.audit_table
set lastloaded_timestamp = currenttimestamp
where tablename = 'staff';

commit;

/* store */

begin;

update sakila.audit_table
set currenttimestamp = current_timestamp()
where tablename = 'store';


insert into stage_sakila.int_store
select * from sakila.store st
where st.last_update >= (select lastloaded_timestamp from sakila.audit_table where tablename = 'store')
and st.last_update < (select currenttimestamp from sakila.audit_table where tablename = 'store')
 ;

update sakila.audit_table
set lastloaded_timestamp = currenttimestamp
where tablename = 'store';

commit;











