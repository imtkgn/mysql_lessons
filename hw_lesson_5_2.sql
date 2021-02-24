# Практическое задание теме «Агрегация данных»

# 1. Подсчитайте средний возраст пользователей в таблице users.

SELECT ROUND(AVG(TIMESTAMPDIFF(YEAR, p.birthday, now())), 0) AS avg_age
FROM users u join profiles p ON u.id = p.user_id;

# 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
# Следует учесть, что необходимы дни недели текущего года, а не года рождения.

SELECT 
	DAYNAME(DATE_FORMAT(p.birthday,'2021-%m-%d')) AS day_of_week,
	count(p.user_id) AS cnt_users
FROM 
	users u 
		join 
	profiles p ON u.id = p.user_id
GROUP BY 
	1;

# 3. (по желанию) Подсчитайте произведение чисел в столбце таблицы value: 1,2,3,4,5
DROP TABLE temp;

CREATE TABLE temp (value integer);

INSERT INTO temp (value) 
VALUES (1), (2), (3), (4), (5);

SELECT 
	exp(SUM(log(value)))
FROM 
	temp;



	
