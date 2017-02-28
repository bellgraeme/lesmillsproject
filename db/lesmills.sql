DROP TABLE payments;
DROP TABLE register;
DROP TABLE clients;
DROP TABLE bank;
DROP TABLE classes;
DROP TABLE venues;
DROP TABLE students;

CREATE TABLE venues(
id SERIAL4 PRIMARY KEY,
name VARCHAR(255),
location VARCHAR(255)
);

CREATE TABLE students(
id SERIAL4 PRIMARY KEY,
first_name VARCHAR(255),
last_name VARCHAR(255),
age INT4,
gender VARCHAR(8)
);

CREATE  TABLE classes(
id SERIAL4 PRIMARY KEY,
type VARCHAR(255),
time TIME,
venue_id INT4 references venues(id) ON DELETE CASCADE
);

CREATE  TABLE register(
id SERIAL4 PRIMARY KEY,
class_id INT4 references classes(id) ON DELETE CASCADE,
student_id INT4 references students(id) ON DELETE CASCADE
);

CREATE TABLE clients(
id SERIAL4 PRIMARY KEY,
name VARCHAR(255),
balance INT4
);

CREATE TABLE bank(
id SERIAL4 PRIMARY KEY,
balance INT4,
type VARCHAR(255),
holder VARCHAR(255)
);

CREATE TABLE payments(
id SERIAL4 PRIMARY KEY,
bank_id INT4 references bank(id),
client_id INT4 references clients(id),
amount INT4,
time TIME
);


