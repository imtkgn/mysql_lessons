-- Создаем представление Сотрудники
CREATE VIEW v_workers AS 
SELECT 
	u.id, 
	CONCAT(u.last_name, ' ', u.first_name, ' ',  u.last_name) AS fio,
	u.login,
	up.birthday,
	u.phone,
	u.email,
	d.name AS department,
	p.name AS `position`,
	up.gender,
	if(u.is_active = 1, 'Работает', 'Уволен') AS status,
	up.last_login
FROM 
	fake_jira.users u 
		left join 
	fake_jira.users_profiles up ON u.id = up.user_id
		left join 
	fake_jira.departments d ON up.department_id = d.id 
		left join
	fake_jira.positions p ON up.position_id = p.id; 

-- Создаем представление для подсчета кол-ва задач в различных статусах по проектам
-- Исключаем задачи с типом Epic и Subtask
CREATE VIEW v_count_tasks_statuses AS
SELECT 
	p.name,
	sum(if(t.status_id = 1, 1, 0)) AS 'TO DO',
	sum(if(t.status_id = 2, 1, 0)) AS 'IN PROGRESS',
	sum(if(t.status_id = 3, 1, 0)) AS 'HOLD',
	sum(if(t.status_id = 4, 1, 0)) AS 'TEST',
	sum(if(t.status_id = 5, 1, 0)) AS 'REWIEV',
	sum(if(t.status_id = 6, 1, 0)) AS 'READY FOR RELEASE',
	sum(if(t.status_id = 7, 1, 0)) AS 'DONE'
FROM 
	fake_jira.tasks t
		join 
	fake_jira.projects p ON t.project_id = p.id 
		join 
	fake_jira.task_statuses ts ON t.status_id = ts.id 
WHERE 
	t.task_type_id in (2,3,4,5)
GROUP BY 
	p.name;
