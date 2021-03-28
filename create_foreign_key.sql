ALTER TABLE users_profiles 
	ADD CONSTRAINT users_profiles_user_id_fk 
		FOREIGN KEY (user_id) REFERENCES users(id);
	
ALTER TABLE users_photo 
	ADD CONSTRAINT users_photo_user_id_fk 
		FOREIGN KEY (user_id) REFERENCES users(id);
	
ALTER TABLE users_roles_projects 
	ADD CONSTRAINT users_roles_projects_user_id_fk 
		FOREIGN KEY (user_id) REFERENCES users(id);
	
ALTER TABLE tasks_comments 
	ADD CONSTRAINT tasks_comments_user_id_fk 
		FOREIGN KEY (user_id) REFERENCES users(id);
	
ALTER TABLE projects 
	ADD CONSTRAINT projects_owner_id_fk 
		FOREIGN KEY (owner_id) REFERENCES users(id);
	
-- Остальные ключи добавил через редактор диаграммы DBeaver
