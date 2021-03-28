-- Добавляем должности в компании
INSERT INTO positions (name) 
	VALUES ('Head of department'),
		   ('Product manager'),
		   ('Project manager'),
		   ('Tech lead'),
		   ('Backend-разработчик'),
		   ('Frontend-разработчик'),
		   ('QA');

-- Добавляем роли в проектах
-- Следовало добавить табличку с правами доступа на проект, т.к. прописать какая роль и что может делать в проекте,
-- например: создавать и редактировать задачи, удалять задачи, добавлять новых участников и т.д.
-- Не стал усложнять курсовой, ограничился просто перечислением ролей.
INSERT INTO roles (name)
	VALUES ('Administrator'),
		   ('Member'),
		   ('Viewer');

-- Добавляем приоритеты задач
INSERT INTO task_priorities (name, sort_position) 
	VALUES ('Highest', 0),
		   ('High', 1),
		   ('Middle', 2),
		   ('Low', 3);

-- Добавляем статусы задач
-- Тут понял, что не хватает порядковый номер статуса для сортировки статусов на фронте
ALTER TABLE task_statuses ADD sort_position INT UNSIGNED NOT NULL COMMENT "Порядковый номер статуса" AFTER name;

INSERT INTO task_statuses (name, sort_position) 
	VALUES ('TO DO', 0),
		   ('IN PROGRESS', 1),
		   ('HOLD', 2),
		   ('TEST', 3),
		   ('REWIEV',4),
		   ('READY FOR RELEASE', 5),
		   ('DONE', 6);

-- Добавляем типы задач
-- У каждого типа проставляю уровень. 
-- Это значит, что тип с наименьшим уровнем, может включать в себя вложенные задачи с равным или наибольшим,
-- например: History может включать тип Research и не может Epic. Research может включать Subtask
-- На фронте так: при добавлении подзадачи проверяет уровень родительской задачи 
-- и в списке предлагает типы равные уровню родительской или выше.
INSERT INTO task_types (name, sublevel) 
	VALUES ('Epic', 0),
		   ('History', 1),
		   ('Task', 1),
		   ('Bug', 1),
		   ('Research', 1),
		   ('Subtask', 2);

-- Добавляем пользователей 
INSERT INTO users (login, first_name, last_name, middle_name, email, phone, is_active)
	VALUES ('i.ivanov', 'Иван', 'Иванов', 'Иванович', 'i.ivanov@test_company.com', '79121001111', 1),
		   ('p.petrov', 'Петр', 'Петров', 'Петрович', 'p.petrov@test_company.com', '79121002222', 1),
		   ('n.sidorov', 'Николай', 'Сидоров', 'Александрович', 'n.sidorov@test_company.com', '79121003333', 1),
		   ('s.pavlov', 'Сергей', 'Павлов', 'Семенович', 's.pavlov@test_company.com', '79121004444', 1),
		   ('g.strunin', 'Геннадий', 'Струнин', 'Алексеевич', 'g.strunin@test_company.com', '79121005555', 1),
		   ('m.zolotova', 'Мария', 'Золотова', 'Егоровна', 'm.zolotova@test_company.com', '79122001020', 1),
		   ('d.veselova', 'Дарья', 'Веселова', 'Игоревна', 'd.veselova@test_company.com', '79122002030', 1),
		   ('i.stroinaya', 'Ирина', 'Стройная', 'Олеговна', 'i.stroinaya@test_company.com', '79122003040', 1),
		   ('e.zaharova', 'Екатерина', 'Захарова', 'Георгиевна', 'e.zaharova@test_company.com', '79122004050', 1),
		   ('a.krasova', 'Анастасия', 'Красова', 'Николаевна', 'a.krasova@test_company.com', '79122005060', 1);

-- Добавляем ссылки на фото пользователей
INSERT INTO users_photo (user_id, file_directory)
	VALUES (1, 'users_photo/i.ivanov.png'),
		   (2, 'users_photo/p.petrov.png'),
		   (3, 'users_photo/n.sidorov.png'),
		   (4, 'users_photo/s.pavlov.png'),
		   (5, 'users_photo/g.strunin.png'),
		   (6, 'users_photo/m.zolotova.png'),
		   (7, 'users_photo/d.veselova.png'),
		   (8, 'users_photo/i.stroinaya.png'),
		   (9, 'users_photo/e.zaharova.png'),
		   (10, 'users_photo/a.krasova.png');

-- Добавляем отделы компании
-- Для курсового проекта достаточно 5 отделов ))
INSERT INTO departments (name, description, head_id) 
	VALUES ('Отдел маркетинга', 'Отдел маркетинга', 6),
		   ('Отдел продаж', 'Отдел продаж', 7),
		   ('Отдел управления проектами', 'Отдел управления проектами', 4),
		   ('Отдел аналитики', 'Отдел аналитики', 10),
		   ('Отдел разработки', 'Отдел разработки', 1);
		  
-- Заполняем профили пользователей
INSERT INTO users_profiles (user_id, gender, birthday, department_id, position_id) 
	VALUES (1, 'M', '1985-08-11', 5, 1),
		   (2, 'M', '1978-03-25', 5, 4),
		   (3, 'M', '1991-07-05', 5, 5),
		   (4, 'M', '1982-11-17', 3, 1),
		   (5, 'M', '1997-04-29', 5, 6),
		   (6, 'W', '1979-09-03', 6, 1),
		   (7, 'W', '1989-02-28', 2, 1),
		   (8, 'W', '1982-07-15', 2, 2),
		   (9, 'W', '1999-01-30', 3, 3),
		   (10, 'W', '1981-05-10', 4, 1);

-- Добавляем проекты
INSERT INTO projects (name, description, owner_id) 
	VALUES ('Система учета рабочего времени', 'Продукт для компании "Контакт+"', 4);
			

-- Добавляем роли пользователей в проекте
INSERT INTO users_roles_projects (project_id, user_id, role_id) 
	VALUES (1, 1, 1),
		   (1, 2, 2),
		   (1, 3, 2),
		   (1, 4, 1),
		   (1, 5, 2),
		   (1, 6, 2),
		   (1, 7, 2),
		   (1, 8, 2),
		   (1, 9, 3),
		   (1, 10, 2);
		  












		  







