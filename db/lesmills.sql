DROP TABLE register;
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
venue_id INT4 references venues(id)
);

CREATE  TABLE register(
id SERIAL4 PRIMARY KEY,
class_id INT4 references classes(id),
student_id INT4 references students(id)
);