begin;

/*actor*/

update stg_sakila.stg_actor sa
join stg_sakila.int_actor ia on sa.actor_id= ia.actor_id
set sa.first_name = ia.first_name,
sa.last_name = ia.last_name,
sa.last_update = current_timestamp();
;	

insert into stg_sakila.stg_actor 
select * from stg_sakila.int_actor ia
where not exists (select actor_id
                   from stg_sakila.stg_actor  sa
                   where ia.actor_id=sa.actor_id);

/*address*/

update stg_sakila.stg_address sa
join stg_sakila.int_address ia on sa.address_id= ia.address_id
set sa.address = ia.address,
sa.address2 = ia.address2,
sa.district = ia.district,
sa.city_id = ia.city_id,
sa.postal_code = ia.postal_code,
sa.phone = ia.phone,
sa.location = ia.location,
sa.last_update = current_timestamp();
;	

insert into stg_sakila.stg_address 
select * from stg_sakila.int_address ia
where not exists (select 1
                   from stg_sakila.stg_address  sa
                   where ia.address_id=sa.address_id);


/*category*/

update stg_sakila.stg_category sc
join stg_sakila.int_category ic on sc.category_id= ic.category_id
set sc.name = ic.name,
sc.last_update = current_timestamp();
;	

insert into stg_sakila.stg_category
select * from stg_sakila.int_category ic
where not exists (select 1
                   from stg_sakila.stg_category  sc
                   where ic.category_id=sc.category_id);

/*city*/

update stg_sakila.stg_city sct
join stg_sakila.int_city ict on sct.city_id= ict.city_id
set 
sct.city = ict.city,
sct.country_id = ict.country_id,
sct.last_update = current_timestamp()
;	

insert into stg_sakila.stg_city
select * from stg_sakila.int_city ict
where not exists (select 1
                   from stg_sakila.stg_city  sct
                   where ict.city_id=sct.city_id);


/* country */

update stg_sakila.stg_country scy
join stg_sakila.int_country icy on scy.country_id= icy.country_id
set 
scy.country = icy.country,
scy.last_update = current_timestamp()
;	

insert into stg_sakila.stg_country
select * from stg_sakila.int_country icy
where not exists (select 1
                   from stg_sakila.stg_country  scy
                   where icy.country_id=scy.country_id);

/* customer */

update stg_sakila.stg_customer scm
join stg_sakila.int_customer icm on scm.customer_id= icm.customer_id
set 
scm.store_id = icm.store_id,
scm.first_name = icm.first_name,
scm.last_name = icm.last_name,
scm.email = icm.email,
scm.address_id = icm.address_id,
scm.active = icm.active,
scm.create_date = icm.create_date,
scm.last_update = current_timestamp()
;	

insert into stg_sakila.stg_customer
select * from stg_sakila.int_customer icm
where not exists (select 1
                   from stg_sakila.stg_customer scm
                   where icm.customer_id=scm.customer_id);

/* film */

update stg_sakila.stg_film sf
join stg_sakila.int_film ifl on sf.film_id= ifl.film_id
set 
sf.title = ifl.title,
sf.description = ifl.description,
sf.release_year = ifl.release_year,
sf.language_id = ifl.language_id,
sf.original_language_id = ifl.original_language_id,
sf.rental_duration = ifl.rental_duration,
sf.rental_rate = ifl.rental_rate,
sf.length = ifl.length,
sf.replacement_cost = ifl.replacement_cost,
sf.rating = ifl.rating,
sf.special_features = ifl.special_features,
sf.last_update = current_timestamp()
;	

insert into stg_sakila.stg_film
select * from stg_sakila.int_film ifl
where not exists (select 1
                   from stg_sakila.stg_film sf
                   where sf.film_id= ifl.film_id);


/* film_actor */ 

update stg_sakila.stg_film_actor sfa
join stg_sakila.int_film_actor ifa on sfa.actor_id= ifa.actor_id
set 
sfa.film_id = ifa.film_id,
sfa.last_update = current_timestamp()
;	

insert into stg_sakila.stg_film_actor
select * from stg_sakila.int_film_actor ifa
where not exists (select 1
                   from stg_sakila.stg_film_actor sfa
                   where sfa.actor_id= ifa.actor_id);


/* film_category*/

update stg_sakila.stg_film_category sfc
join stg_sakila.int_film_category ifc on sfc.category_id= ifc.category_id
set 
sfc.film_id = ifc.film_id,
sfc.last_update = current_timestamp()
;	

insert into stg_sakila.stg_film_category
select * from stg_sakila.int_film_category ifc
where not exists (select 1
                   from stg_sakila.stg_film_category sfc
                   where sfc.category_id= ifc.category_id);


/* inventory */

update stg_sakila.stg_inventory si
join stg_sakila.int_inventory ii on si.inventory_id= ii.inventory_id
set 
si.film_id = ii.film_id,
si.store_id = ii.store_id,
si.last_update = current_timestamp()
;	

insert into stg_sakila.stg_inventory
select * from stg_sakila.int_inventory ii
where not exists (select 1
                   from stg_sakila.stg_inventory si
                   where si.inventory_id= ii.inventory_id);


/* language*/

update stg_sakila.stg_language sl
join stg_sakila.int_language il on sl.language_id= il.language_id
set 
sl.name = il.name,
sl.last_update = current_timestamp()
;	

insert into stg_sakila.stg_language
select * from stg_sakila.int_language il
where not exists (select 1
                   from stg_sakila.stg_language sl
                   where sl.language_id= il.language_id);

/* payment */

update stg_sakila.stg_payment sp
join stg_sakila.int_payment ip on sp.payment_id= ip.payment_id
set 
sp.customer_id = ip.customer_id,
sp.staff_id = ip.staff_id,
sp.rental_id = ip.rental_id,
sp.amount = ip.amount,
sp.payment_date = ip.payment_date,
sp.last_update = current_timestamp()
;	

insert into stg_sakila.stg_payment
select * from stg_sakila.int_payment ip
where not exists (select 1
                   from stg_sakila.stg_payment sp
                   where sp.payment_id= ip.payment_id);

/* rental */

update stg_sakila.stg_rental sr
join stg_sakila.int_rental ir on sr.rental_id= ir.rental_id
set 
sr.rental_date = ir.rental_date,
sr.inventory_id = ir.inventory_id,
sr.staff_id = ir.staff_id,
sr.customer_id = ir.customer_id,
sr.return_date = ir.return_date,
sr.last_update = current_timestamp()
;	

insert into stg_sakila.stg_rental
select * from stg_sakila.int_rental ir
where not exists (select 1
                   from stg_sakila.stg_rental sr
                   where sr.rental_id= ir.rental_id);

/* staff */

update stg_sakila.stg_staff ssf
join stg_sakila.int_staff isf on ssf.staff_id= isf.staff_id
set
ssf.first_name = isf.first_name,
ssf.last_name = isf.last_name,
ssf.address_id = isf.address_id,
ssf.picture = isf.picture,
ssf.email = isf.email,
ssf.store_id = isf.store_id,
ssf.active = isf.active,
ssf.username = isf.username,
ssf.password = isf.password,
ssf.last_update = current_timestamp()
;	

insert into stg_sakila.stg_staff
select * from stg_sakila.int_staff isf
where not exists (select 1
                   from stg_sakila.stg_staff ssf
                   where ssf.staff_id= isf.staff_id);

/* store */

update stg_sakila.stg_store sst
join stg_sakila.int_store ist on sst.store_id= ist.store_id
set 
sst.manager_staff_id = ist.manager_staff_id,
sst.address_id = ist.address_id,
sst.last_update = current_timestamp()
;	

insert into stg_sakila.stg_store
select * from stg_sakila.int_store ist
where not exists (select 1
                   from stg_sakila.stg_store sst
                   where sst.store_id= ist.store_id);

commit;
