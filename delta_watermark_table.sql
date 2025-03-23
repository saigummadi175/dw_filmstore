CREATE TABLE `delta_watermark` (
  `table_name` varchar(50) DEFAULT NULL,
  `lastLoaded_timestamp` datetime DEFAULT NULL,
  `currentTimestamp` datetime DEFAULT NULL
);

insert into sakila.delta_watermark(table_name, lastLoaded_timestamp, currentTimestamp)
values('actor', '2025-01-31',  '2025-01-31'),
('address', '2025-01-31',  '2025-01-31'),
('category', '2025-01-31',  '2025-01-31'),
('city', '2025-01-31',  '2025-01-31'),
('country', '2025-01-31',  '2025-01-31'),
('customer', '2025-01-31',  '2025-01-31'),
('film', '2025-01-31',  '2025-01-31'),
('film_actor', '2025-01-31',  '2025-01-31'),
('film_category', '2025-01-31',  '2025-01-31'),
('film_text', '2025-01-31',  '2025-01-31'),
('inventory', '2025-01-31',  '2025-01-31'),
('language', '2025-01-31',  '2025-01-31'),
('payment', '2025-01-31',  '2025-01-31'),
('rental', '2025-01-31',  '2025-01-31'),
('staff', '2025-01-31',  '2025-01-31'),
('store', '2025-01-31',  '2025-01-31')