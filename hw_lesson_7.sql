# 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

SELECT 
	u.id
FROM 
	users u 
		join 
	orders o ON u.id = o.user_id
GROUP BY 
	u.id;
	
# 2. Выведите список товаров products и разделов catalogs, который соответствует товару.

SELECT 
	c.name AS `catalog`, p.name AS product
FROM 
	products p 
		join 
	catalogs c ON p.catalog_id = c.id;

# 3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
# Поля from, to и label содержат английские названия городов, поле name — русское. 
# Выведите список рейсов flights с русскими названиями городов.

CREATE TABLE flights (
	id SERIAL PRIMARY KEY,
	`from` varchar(255),
	`to` varchar(255)
	) COMMENT = 'Рейсы';

INSERT INTO flights (`from`, `to`) 
VALUES ('moscow', 'omsk'),
		('novgorod', 'kazan'),
		('irkutsk', 'moscow'),
		('omsk', 'irkutsk'),
		('moscow', 'kazan');

CREATE TABLE cities (
	id SERIAL PRIMARY KEY,
	label varchar(255),
	name varchar(255)
	);

INSERT INTO cities (label, name) 
VALUES ('moscow', 'Москва'),
		('irkutsk', 'Иркутск'),
		('novgorod', 'Новгород'),
		('kazan', 'Казань'),
		('omsk', 'Омск');
	
SELECT * FROM flights;

SELECT 
	f.id, 
	cf.name AS c_from, 
	ct.name AS c_to
FROM 
	flights f 
		join 
	cities cf ON f.`from` = cf.label 
		join 
	cities ct ON f.`to` = ct.label
ORDER BY 
	f.id;