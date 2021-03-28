-- CREATE INDEX messages_from_user_id_to_user_id_idx ON messages (from_user_id, to_user_id);

CREATE INDEX projects_name_idx ON projects (name);

CREATE INDEX tasks_project_id_performer_id_idx ON tasks (project_id, performer_id);

CREATE INDEX tasks_project_id_customer_id_idx ON tasks (project_id, customer_id);

CREATE INDEX tasks_project_id_author_id_idx ON tasks (project_id, author_id);

CREATE INDEX tasks_change_history_task_id_user_id_idx ON tasks_change_history (task_id, user_id);

CREATE INDEX tasks_comments_task_id_user_id_idx ON tasks_comments (task_id, user_id);

CREATE INDEX tasks_subordination_parent_task_id_child_task_id_idx ON tasks_subordination (parent_task_id, child_task_id);

CREATE UNIQUE INDEX users_login_uq ON users (login);

CREATE UNIQUE INDEX users_email_uq ON users (email);

CREATE UNIQUE INDEX users_phone_uq ON users (phone);

CREATE INDEX users_profiles_birthday ON users_profiles (birthday);

