CREATE DATABASE fake_jira;

-- Создаем таблицу отделом компании
CREATE TABLE departments (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор отдела",
	name VARCHAR(100) NOT NULL COMMENT "Наименование отдела",
	description VARCHAR(255) COMMENT "Описание отдела",
	head_id INT UNSIGNED COMMENT "Ссылка на руководителя отдела",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
 	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Отделы компании";

-- Создаем таблицу должностей в компании
CREATE TABLE positions (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор должности",
	name VARCHAR(100) NOT NULL UNIQUE COMMENT "Наименование должности",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
 	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Должности";

-- Создаем таблицу пользователей
CREATE TABLE users (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор пользователя",
	login VARCHAR(50) NOT NULL UNIQUE COMMENT "Уникальный логин пользователя",
	first_name VARCHAR(50) NOT NULL COMMENT "Имя пользователя",
	last_name VARCHAR(50) NOT NULL COMMENT "Фамилия пользователя",
	middle_name VARCHAR(50) COMMENT "Отчество пользователя",
	email VARCHAR(50) NOT NULL UNIQUE COMMENT "email пользователя",
	phone VARCHAR(50) NOT NULL UNIQUE COMMENT "Номер телефона пользователя",
	photo_id INT UNSIGNED NULL UNIQUE COMMENT "Ссылка на фото пользователя",
	is_active TINYINT(1) NOT NULL DEFAULT 1 COMMENT "Признак активности (0 - удален)",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
 	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Пользователи";

-- Создаем таблицу фотографий пользователей
CREATE TABLE users_photo (
	user_id INT UNSIGNED NOT NULL UNIQUE COMMENT "Ссылка на пользователя",
	file_directory VARCHAR(255) NOT NULL UNIQUE COMMENT "Уникальный путь к файлу",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
 	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Фото пользователей";

-- Создаем таблицу профилей пользователей
CREATE TABLE users_profiles (
	user_id INT UNSIGNED NOT NULL UNIQUE COMMENT "Ссылка на пользователя",
	gender char(1) NOT NULL COMMENT "Пол",
	birthday DATE NOT NULL COMMENT "Дата рождения",
	department_id INT UNSIGNED NOT NULL COMMENT "Ссылка на отдел",
	position_id INT UNSIGNED NOT NULL COMMENT "Ссылка на должность",
	last_login DATETIME COMMENT "Последний вход в систему",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
 	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Профили пользователей";

-- Создаем таблицу проектов
CREATE TABLE projects (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор проекта",
	name VARCHAR(100) NOT NULL COMMENT "Имя проекта",
	description VARCHAR(255) COMMENT "Краткое описание проекта",
	owner_id INT NOT NULL COMMENT "Ссылка на руководителя проекта",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
 	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Проекты";

-- Создаем таблицу ролей в проектах
CREATE TABLE roles (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор роли",
	name VARCHAR(100) NOT NULL UNIQUE COMMENT "Уникальное имя роли",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
 	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Роли в проектах";

-- Создаем таблицу ролей пользователей в проектах
CREATE TABLE users_roles_projects (
	project_id INT UNSIGNED NOT NULL COMMENT "Ссылка на проект",
	user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
	role_id INT UNSIGNED NOT NULL COMMENT "Ссылка на роль",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
 	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
	PRIMARY KEY (project_id, user_id) COMMENT "Составной первичный ключ"
) COMMENT "Роли пользователей в проектах";

-- Создаем таблицу типов задач
CREATE TABLE task_types (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор типа задачи",
	name VARCHAR(25) NOT NULL UNIQUE COMMENT "Уникальное имя типа задачи",
	sublevel INT UNSIGNED NOT NULL COMMENT "Уровень вложенности типа задачи",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
 	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Типы задач";

-- Создаем таблицу статусов задач
CREATE TABLE task_statuses (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор статуса",
	name VARCHAR(25) NOT NULL UNIQUE COMMENT "Уникальное имя статуса",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
 	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Статусы задач";

-- Создаем таблицу приоритетов задач
CREATE TABLE task_priorities (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор приоритета",
	name VARCHAR(25) NOT NULL UNIQUE COMMENT "Уникальное имя приоритета",
	sort_position INT UNSIGNED NOT NULL COMMENT "Позиция в сортировке",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
 	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Приоритеты задач";

-- Создаем таблицу связянности (подчиненности) задач
CREATE TABLE tasks_subordination (
	parent_task_id INT UNSIGNED NOT NULL COMMENT "Ссылка на родительскую задачу",
	child_task_id INT UNSIGNED NOT NULL COMMENT "Ссылка на дочернюю задачу",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
	PRIMARY KEY (parent_task_id, child_task_id) COMMENT "Составной первичный ключ"
) COMMENT "Связанность задач";

-- Создаем таблицу задач
CREATE TABLE tasks (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор задачи",
	title VARCHAR(100) NOT NULL COMMENT "Заголовок задачи",
	description TEXT COMMENT "Описание задачи",
	project_id INT UNSIGNED NOT NULL COMMENT "Ссылка на проект", 
	task_type_id INT UNSIGNED NOT NULL COMMENT "Ссылка на тип задачи",
	status_id INT UNSIGNED NOT NULL DEFAULT 1 COMMENT "Ссылка на статус задачи",
	priority_type_id INT UNSIGNED NOT NULL DEFAULT 1 COMMENT "Ссылка на приоритет задачи",
	performer_id INT UNSIGNED NOT NULL COMMENT "Ссылка на исполнителя",
	customer_id INT UNSIGNED NOT NULL COMMENT "Ссылка на заказчика",
	author_id INT UNSIGNED NOT NULL COMMENT "Ссылка на автора",
	deadline DATETIME COMMENT "Срок выполнения",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
 	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Задачи";

-- Создаем таблицу истории изменений задач
-- Для полей before_value и after_value тип данных TEXT скорее дорогое решение, 
-- но в проекте хочу логировать все изменения по задаче, включая описание. 
CREATE TABLE tasks_change_history (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор записи",
	task_id INT UNSIGNED NOT NULL COMMENT "Ссылка на задачу",
	user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
	task_field VARCHAR(50) NOT NULL COMMENT "Имя поля",
	before_value TEXT COMMENT "Значение до",
	after_value TEXT COMMENT "Значение после",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки"
) COMMENT "История изменений задач";

-- Создаем таблицу комментариев к задачам
CREATE TABLE tasks_comments (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор комментария",
	task_id INT UNSIGNED NOT NULL COMMENT "Ссылка на задачу",
	user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
	comment TEXT NOT NULL COMMENT "Текст комментария",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
 	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Комментарии к задачам";