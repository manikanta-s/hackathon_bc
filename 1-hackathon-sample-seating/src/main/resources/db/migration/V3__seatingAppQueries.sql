ALTER TABLE section ADD cost INTEGER;


UPDATE SECTION 
SET COST = 100
WHERE ID = 1;


UPDATE SECTION 
SET COST = 60
WHERE ID = 2;

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP DEFAULT NULL,
    enable boolean DEFAULT NULL,
    first_name VARCHAR(255) DEFAULT NULL,
    last_name VARCHAR(255) DEFAULT NULL,
    password VARCHAR(255) DEFAULT NULL,
    updated_at TIMESTAMP DEFAULT NULL,
    user_name VARCHAR(255) DEFAULT NULL,
	location VARCHAR(100) DEFAULT NULL,
	country VARCHAR(100) DEFAULT NULL
);

CREATE TABLE roles
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) DEFAULT NULL
);

CREATE TABLE users_roles
(
    user_id INTEGER REFERENCES users(id),
    role_id INTEGER REFERENCES roles(id)
);


INSERT INTO users
	VALUES ( 1, NULL, true, 'Manikanta', 'Appari', '$2a$10$ZfC1CojH8dAHeX7/o24fSOyGsjXjAGnRToOlr6kYWJ7Hnq5U6rUn2', NULL, 'manikanta.s@hcl.com','Hyderabad' , 'India');
	

INSERT INTO roles(id, name)	VALUES (1, 'USER');

INSERT INTO users_roles(	user_id, role_id)
	VALUES (1, 1);
	