/*actor*/

begin;

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


delete from stg_sakila.int_actor;

commit;

/*address*/
begin;

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


delete from stg_sakila.int_address;

commit;

/*


/*category*/
begin;

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


delete from stg_sakila.int_category;

commit;

/*
