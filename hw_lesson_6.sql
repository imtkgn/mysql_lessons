# Урок 6. Вебинар. Операторы, фильтрация, сортировка и ограничение. Агрегация данных

# 1. Данные для таблицы posts сгенерил через сервис https://www.mockaroo.com . Файл инсерта данных прилагаю.

# 2. Создать все необходимые внешние ключи и диаграмму отношений.

ALTER TABLE profiles 
  ADD CONSTRAINT profiles_users_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE communities_users 
  ADD CONSTRAINT communities_users_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE likes 
  ADD CONSTRAINT likes_users_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id);
    
ALTER TABLE friendship 
  ADD CONSTRAINT friendship_users_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT friendship_friend_id_fk 
    FOREIGN KEY (friend_id) REFERENCES users(id);
   

ALTER TABLE messages 
  ADD CONSTRAINT messages_from_user_id_fk 
    FOREIGN KEY (from_user_id) REFERENCES users(id),
  ADD CONSTRAINT messages_to_user_id_fk 
    FOREIGN KEY (to_user_id) REFERENCES users(id);
   
ALTER TABLE media 
  ADD CONSTRAINT media_users_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id);
   
ALTER TABLE posts 
  ADD CONSTRAINT posts_users_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id);
   
ALTER TABLE posts 
  ADD CONSTRAINT posts_community_id_fk 
    FOREIGN KEY (community_id) REFERENCES communities(id);
   
# остальные ключи создал через интерфейс диаграммы базы DBeawer: перетащил поле из одной таблички в другую и в открытой форме ввел все параметры.

# 3. Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT 
	(SELECT gender FROM profiles WHERE user_id = likes.user_id) as gender,
	count(user_id) AS cnt_likes
FROM 
	likes
GROUP BY 
	gender;
/*
gender|cnt_likes|
------|---------|
M     |      521|
F     |      479|
*/

# 4. Подсчитать общее количество лайков десяти самым молодым пользователям 
# (сколько лайков получили 10 самых молодых пользователей).

SELECT 
	sum(f.cnt_likes) AS top_10_likes_users
FROM 
	(
		SELECT 
			CASE 
				WHEN target_type_id = 1 
					THEN (SELECT from_user_id FROM messages WHERE id = likes.target_id)
				WHEN target_type_id = 2 
					THEN (SELECT id FROM users WHERE id = likes.target_id)
				WHEN target_type_id = 3 
					THEN (SELECT user_id FROM media WHERE id = likes.target_id)
				WHEN target_type_id = 4 
					THEN (SELECT user_id FROM posts WHERE id = likes.target_id)
			ELSE NULL 
			END AS to_like_user_id,
			(
				SELECT 
					birthday
				FROM 
					profiles 
				WHERE 
					user_id = (CASE 
								WHEN target_type_id = 1 
									THEN (SELECT from_user_id FROM messages WHERE id = likes.target_id)
								WHEN target_type_id = 2 
									THEN (SELECT id FROM users WHERE id = likes.target_id)
								WHEN target_type_id = 3 
									THEN (SELECT user_id FROM media WHERE id = likes.target_id)
								WHEN target_type_id = 4 
									THEN (SELECT user_id FROM posts WHERE id = likes.target_id)
							ELSE NULL 
							END)
			) AS birthday,
			count(user_id) AS cnt_likes
		FROM 
			likes
		GROUP BY 
			to_like_user_id, 
			birthday
		ORDER BY 
			birthday desc
		LIMIT 10
	) f;

# 5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети
# (критерии активности необходимо определить самостоятельно).
# Критерии активности: минимум лайков, постов, предложение дружбы и размещение медиа-файлов

SELECT 
	id,
	CONCAT(first_name, ' ', last_name) AS user_name 
FROM 
	users
ORDER BY 
	(
		(SELECT COUNT(id) FROM likes WHERE user_id = users.id) +
		(SELECT COUNT(id) FROM posts WHERE user_id = users.id) +
		(SELECT COUNT(user_id) FROM friendship WHERE user_id = users.id) +
		(SELECT COUNT(id) FROM media WHERE user_id = users.id)
	)
LIMIT 10;








   
   
   
   
   