DROP TABLE customers CASCADE;
DROP TABLE films CASCADE;
DROP TABLE tickets CASCADE;

CREATE TABLE customers (
id SERIAL8 primary key,
name VARCHAR(255),
funds INT8 
);

CREATE TABLE films (
id SERIAL8 primary key,
title VARCHAR(255),
price INT8
);


CREATE TABLE tickets (
id SERIAL8 primary key,
customer_id INT8 REFERENCES customers(id) ON DELETE CASCADE, 
film_id INT8 REFERENCES films(id) ON DELETE CASCADE
);

