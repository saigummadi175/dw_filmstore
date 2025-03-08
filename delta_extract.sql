/*actor*/
begin;

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

commit;

/*address*/
begin;

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

commit;

/*category*/
begin;

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

commit;