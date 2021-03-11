# Урок 8. Вебинар. Сложные запросы
# Переписать запросы, заданые к ДЗ урока 6, с использованием JOIN.

# 3. Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT 
	pf.gender,
	count(lk.id) AS cnt_likes
FROM 
	likes lk 
		join 
	profiles pf ON lk.user_id = pf.user_id 
GROUP BY 
	pf.gender;

/*
gender|cnt_likes|
------|---------|
M     |      518|
F     |      479|
*/

# 4. Подсчитать общее количество лайков десяти самым молодым пользователям 
# (сколько лайков получили 10 самых молодых пользователей).

SELECT 
	sum(f.cnt_likes) AS cnt_likes_top10
FROM 
	(
		SELECT 
			ct.user_id,
			pf.birthday,
			count(ct.user_id) AS cnt_likes	
		FROM 
			likes lk  
				join 
			(
				SELECT ms.id AS target_id, ms.from_user_id AS user_id, 1 AS target_type_id
				FROM messages ms
				
				UNION ALL 
				
				SELECT us.id AS target_id, us.id AS user_id, 2 AS target_type_id
				FROM users us
				
				UNION ALL 
				
				SELECT md.id AS target_id, md.user_id AS user_id, 3 AS target_type_id
				FROM media md
				
				UNION ALL 
				
				SELECT pt.id AS target_id, pt.user_id AS user_id, 4 AS target_type_id
				FROM posts pt		
			) ct ON lk.target_type_id = ct.target_type_id and lk.target_id = ct.target_id
				join 
			profiles pf ON ct.user_id = pf.user_id 
		GROUP BY 
			ct.user_id,
			pf.birthday
		ORDER BY 
			pf.birthday
		LIMIT 10
	) f;

/*
cnt_likes_top10|
---------------|
             99|
 */

# 5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети
# (критерии активности необходимо определить самостоятельно).
# Критерии активности: минимум лайков, постов, предложение дружбы и размещение медиа-файлов

SELECT 
	u.id,
	CONCAT(u.first_name, ' ', u.last_name) AS user_name,
	count(distinct l.id) +
	count(distinct p.id) +
	count(distinct f.friend_id) +
	count(distinct m.id) AS cnt_activities
FROM 
	users u 
		left join 
	likes l ON u.id = l.user_id 
		left join 
	posts p ON u.id = p.user_id 
		left join 
	friendship f ON u.id = f.user_id 
		left join 
	media m ON u.id = m.user_id
GROUP BY 
	1,2
ORDER BY 
	cnt_activities
LIMIT 10;

/*
id|user_name         |cnt_activities|
--|------------------|--------------|
40|Kole Hettinger    |            16|
26|Josh Bauch        |            16|
29|Sonny Kautzer     |            17|
91|Waino Watsica     |            17|
81|Lura Collier      |            17|
74|Damien Breitenberg|            18|
 2|Remington Larson  |            18|
98|Lesly Ernser      |            18|
27|Kallie Crooks     |            18|
31|Timothy Mitchell  |            19|
 */






   
   
   
   
   