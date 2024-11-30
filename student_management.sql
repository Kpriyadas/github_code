DROP SCHEMA IF EXISTS student_management;
CREATE SCHEMA IF NOT EXISTS student_management;
DROP TABLE IF EXISTS student_management.user_login;

CREATE TABLE IF NOT EXISTS student_management.user_login (
    user_id VARCHAR(255) PRIMARY KEY,    
    user_password VARCHAR(255),           
    first_name VARCHAR(100),             
    last_name VARCHAR(100),               
    sign_up_on DATE,                      
    email_id VARCHAR(255)                
);
DROP TABLE IF EXISTS student_management.parent_details;

CREATE TABLE IF NOT EXISTS student_management.parent_details (
    parent_id VARCHAR(255) PRIMARY KEY,
    father_first_name VARCHAR(100),
    father_last_name VARCHAR(100),
    father_email_id VARCHAR(255),
    father_mobile VARCHAR(20),
    father_occupation VARCHAR(100),
    mother_first_name VARCHAR(100),
    mother_last_name VARCHAR(100),
    mother_email_id VARCHAR(255),
    mother_mobile VARCHAR(20),
    mother_occupation VARCHAR(100)
);

DROP TABLE IF EXISTS student_management.teachers;

CREATE TABLE IF NOT EXISTS student_management.teachers (
    teacher_id VARCHAR(255) PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    date_of_birth DATE,
    email_id VARCHAR(255),
    contact VARCHAR(20),
    registration_date DATE,
    registration_id VARCHAR(255) UNIQUE
);

DROP TABLE IF EXISTS student_management.class_details;

CREATE TABLE IF NOT EXISTS student_management.class_details (
    class_id VARCHAR(255) PRIMARY KEY,
    class_teacher VARCHAR(255),
    class_year VARCHAR(20),
    FOREIGN KEY (class_teacher) REFERENCES student_management.teachers (teacher_id)
);
DROP TABLE IF EXISTS student_management.student_details;

CREATE TABLE IF NOT EXISTS student_management.student_details (
    student_id VARCHAR(255) PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    date_of_birth DATE,
    class_id VARCHAR(255),
    roll_no VARCHAR(20),
    email_id VARCHAR(255),
    parent_id VARCHAR(255),
    registration_date DATE,
    registration_id VARCHAR(255) UNIQUE,
    FOREIGN KEY (class_id) REFERENCES student_management.class_details (class_id),
    FOREIGN KEY (parent_id) REFERENCES student_management.parent_details (parent_id)
);

DROP TABLE IF EXISTS student_management.subject;

CREATE TABLE IF NOT EXISTS student_management.subject (
    subject_id VARCHAR(255) PRIMARY KEY,
    subject_name VARCHAR(255),
    class_year VARCHAR(20),
    subject_head VARCHAR(255),
    FOREIGN KEY (subject_head) REFERENCES student_management.teachers (teacher_id)
);

DROP TABLE IF EXISTS student_management.subject_tutors;

CREATE TABLE IF NOT EXISTS student_management.subject_tutors (
	row_id SERIAL PRIMARY KEY,
    subject_id TEXT REFERENCES student_management.subject (subject_id),
	teacher_id TEXT REFERENCES student_management.teachers (teacher_id),
	class_id TEXT REFERENCES student_management.class_details (class_id)
);
