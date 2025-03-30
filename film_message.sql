
create table stg_sakila.film_message(
	film_id smallint,
    create_date datetime,
    last_update timestamp
);

insert into stg_sakila.film_message
select film_id, current_timestamp(), current_timestamp()
from stg_sakila.int_film f
union
select sf.film_id, current_timestamp(), current_timestamp()
from stg_sakila.int_category ic
left join stg_sakila.stg_film_category sfc
on ic.category_id = sfc.category_id
left join stg_sakila.stg_film sf
on sfc.film_id = sf.film_id; 

UPDATE dw_filmstore.d_film df
join stg_sakila.film_message fm on df.film_id = fm.film_id
left join stg_sakila.int_film fi on fm.film_id = fi.film_id
left join stg_sakila.int_film_category ifm on fi.film_id = ifm.film_id
left join stg_sakila.int_category ic on ic.category_id = ifm.category_id
left join stg_sakila.int_language il on fi.film_id = il.film_id
left join stg_sakila.int_language il1 on fi.original_film_id = il1.original_film_id
SET 
	df.title = coalesce(fi.title, df.title),
    df.description = coalesce(fi.description, df.description),
    df.release_year = coalesce(fi.release_year, df.release_year),
    df.category = coalesce(ic.name, df.category),
    df.language = coalesce(il.name, df.language),
    df.original_language = coalesce(il1.name, df.original_language),
    df.rental_duration = coalesce(fi.rental_duration, df.rental_duration),
    df.rental_rate = coalesce(fi.rental_rate, df.rental_rate),
    df.length = coalesce(fi.length, df.length),
    df.replacement_cost = coalesce(fi.replacement_cost, df.replacement_cost),
    df.rating = coalesce(fi.rating, df.rating),
    df.special_features = coalesce(fi.special_features, df.special_features),
    df.last_update = current_timestamp()
;

insert into dw_filmstore.d_film 
select f.film_id, f.title, f.description, f.release_year,
		c.name as category, l.name as language, ol.name as original_language, 
		f.rental_duration, f.rental_rate, f.length, f.replacement_cost, 
		f.rating, f.special_features, current_timestamp()
from stg_sakila.stg_film f
join stg_sakila.film_message fm on f.film_id = fm.film_id
left join stg_sakila.stg_film_category ifm on f.film_id = ifm.film_id
left join stg_sakila.stg_category c on c.category_id = ifm.category_id
left join stg_sakila.stg_language l on f.film_id = l.film_id
left join stg_sakila.stg_language ol on f.original_film_id = ol.original_film_id
where not exists (select film_id
                   from dw_filmstore.d_film df
                   where f.film_id = df.film_id) ;
                   
insert into stg_sakila.archive_film_message
select * from stg_sakila.film_message;
