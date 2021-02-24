# Практическое задание по теме «Операторы, фильтрация, сортировка и ограничение»

# 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
# Заполните их текущими датой и временем. 

UPDATE vk.users
SET created_at = now(), 
	updated_at = now()
WHERE created_at is null OR updated_at is null;

# 2. Таблица users была неудачно спроектирована. 
# Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате 20.10.2017 8:10. 
# Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.

ALTER TABLE users ADD created_at_temp DATETIME, updated_at_temp DATETIME;

UPDATE users
SET created_at_temp = STR_TO_DATE(created_at, '%d.%m.%Y %h:%i'),
    updated_at_temp = STR_TO_DATE(updated_at, '%d.%m.%Y %h:%i');
   
ALTER TABLE users 
    DROP created_at, DROP updated_at, 
    RENAME COLUMN created_at_temp TO created_at, RENAME COLUMN updated_at_temp TO updated_at;
   
# 3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 
# 0, если товар закончился и выше нуля, если на складе имеются запасы. 
# Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
# Однако нулевые запасы должны выводиться в конце, после всех 

CREATE TEMPORARY TABLE storehouses_products (name varchar(50), value INTEGER);

INSERT INTO storehouses_products (name, value)
VALUES ('Мука', 1000),
	   ('Подсолнечное масло', 500),
	   ('Крупа перловая', 100),
	   ('Кофе растворимый', 1200),
	   ('Чай зеленый', 0),
	   ('Крупа гречневая', 0),
	   ('Тулетная бумага', 0);

SELECT * 
FROM storehouses_products
ORDER BY value = 0, value;

# 4. (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
# Месяцы заданы в виде списка английских названий (may, august)

SELECT u.*, p.birthday 
FROM users u join profiles p ON u.id = p.user_id 
WHERE MONTH(p.birthday) in (5, 8);

SELECT u.*, p.birthday 
FROM users u join profiles p ON u.id = p.user_id 
WHERE MONTHNAME(p.birthday) in ('may', 'august');

# 5. (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. 
# SELECT * FROM catalogs WHERE id IN (5, 1, 2); 
# Отсортируйте записи в порядке, заданном в списке IN.

SELECT * 
FROM catalogs
WHERE id in (5, 1, 2)
ORDER BY id = 2, id = 1, id = 5;