CREATE DATABASE call_list;
\c call_list
CREATE TABLE users(
	id int PRIMARY KEY,
	first_name varchar,
	email varchar,
	PRIMARY KEY (id)
);

INSERT INTO users(first_name, email) VALUES ('Carlos', 'carlitos@correo.cl'),('Laura', 'laurita@correo.cl');

CREATE TABLE calls(
	id int PRIMARY KEY,
	phone varchar,
	date varchar,
	user_id integer,
	FOREIGN KEY (user_id) REFERENCES users(id)
);

ALTER TABLE users ADD COLUMN last_name varchar;

UPDATE users SET last_name = 'Carlonso' WHERE first_name = 'Carlos';
UPDATE users SET last_name = 'Laurincia' WHERE first_name = 'Laura';

INSERT INTO calls(phone, date, user_id) VALUES ('12345', '25/06/18', 2),
('12345', '25/06/18', 2), ('12345', '25/06/18', 2),
('12345', '25/06/18', 2), ('12345', '25/06/18', 2),
('12345', '25/06/18', 2);

INSERT INTO calls(phone, date, user_id) VALUES ('12345', '25/06/18', 1),
('12345', '21/03/17', 1), ('12345', '21/04/17', 1),
('12345', '21/04/18', 1);

INSERT INTO users(first_name, email) VALUES ('Juanito', 'correo@dejuanito.cl');

SELECT first_name, COUNT(calls) FROM users FULL JOIN calls ON (users.id = user_id) GROUP BY first_name;
SELECT phone, date FROM calls INNER JOIN users ON (users.id = user_id) WHERE first_name = 'Carlos' ORDER BY date DESC;

CREATE TABLE audits(
	id int PRIMARY KEY,
	delete_reason varchar,
	call_id integer,
	user_id integer,
	FOREIGN KEY (call_id) REFERENCES calls(id),
	FOREIGN KEY (user_id) REFERENCES users(id)
);
