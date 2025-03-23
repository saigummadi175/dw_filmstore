/* actor*/
insert into dw_filmstore.d_actor
select * from sakila.actor;
 
/* customer */ 
insert into dw_filmstore.d_customer 
select c.customer_id, c.first_name, c.last_name, c.email, 
a.address, a.address2, ct.city, a.district, ctry.country, a.location, a.phone, a.postal_code, c.create_date
from sakila.customer c
join sakila.address a on c.address_id = a.address_id
join sakila.city ct on a.city_id = ct.city_id
join sakila.country ctry on ct.country_id = ctry.country_id
order by customer_id
; 

/* sales */
insert into dw_filmstore.f_sales
select p.customer_id, p.staff_id, i.film_id, p.payment_date, p.amount
from sakila.payment p
left join sakila.rental r
on p.rental_id = r.rental_id
left join sakila.inventory i 
on r.inventory_id = i.inventory_id;

/* film */
insert into dw_filmstore.d_film 
select f.film_id, f.title, f.description, f.release_year,
		c.name as category, l.name as language, ol.name as original_language, 
		f.rental_duration, f.rental_rate, f.length, f.replacement_cost, 
		f.rating, f.special_features, f.last_update
from sakila.film f
left join sakila.film_category fc
on f.film_id = fc.film_id
left join sakila.category c 
on fc.category_id = c.category_id
left join sakila.language l 
on l.language_id = f.language_id
left join sakila.language ol
on l.language_id = f.original_language_id;

/* film_actor */
insert into dw_filmstore.d_film_actor 
select * from sakila.film_actor;

/* payment */
insert into dw_filmstore.f_payment 
select * from sakila.payment;
 
 /* rental */
insert into dw_filmstore.f_rental  
select * from sakila.rental;
 
 /* store_staff */ 
insert into dw_filmstore.d_store_staff 
select s.store_id, a1.address as store_address , a1.district as store_district , a1.postal_code as store_postal_code,
		a1.phone as store_phone, a1.location as store_location, 
		c1.city as store_city, ct1.country as store_country, st.staff_id, st.first_name, st.last_name, st.email,
		st.active, st.username, st.password, 
		s.address_id, s.last_update, a.address , a.district , a.postal_code, a.phone, a.location, c.city, ct.country
from sakila.store s
left join sakila.staff st on st.staff_id = s.manager_staff_id
left join sakila.address a on a.address_id = st.address_id
left join sakila.address a1 on a1.address_id = s.address_id
left join sakila.city c on a.city_id = c.city_id
left join sakila.city c1 on a1.city_id = c1.city_id
left join sakila.country ct on c.country_id = ct.country_id
left join sakila.country ct1 on c1.country_id = ct1.country_id;


