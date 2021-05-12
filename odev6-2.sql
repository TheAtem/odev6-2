--ALTER TABLE jobseeker DROP CONSTRAINT fk_jobseeker_jobseekervalidation;
--ALTER TABLE employer DROP CONSTRAINT fk_employer_employer_validation;
--ALTER TABLE employer DROP CONSTRAINT fk_employer_hrms_staff_validation;

DROP TABLE IF EXISTS jobseeker;
DROP TABLE IF EXISTS jobseeker_validation;
DROP TABLE IF EXISTS employer;
DROP TABLE IF EXISTS employer_validation;
DROP TABLE IF EXISTS hrms_staff_validation;
DROP TABLE IF EXISTS job_position;


CREATE TABLE jobseeker (
	id serial NOT Null,
	jobseeker_id INTEGER NOT NULL,
	first_name CHARACTER VARYING(25) NOT NULL,
	last_name CHARACTER VARYING(25) NOT NULL,
	identity_number CHARACTER VARYING(11) UNIQUE NOT NULL,
	birth_year CHARACTER VARYING(10) NOT NULL,
	email CHARACTER VARYING(50) UNIQUE NOT NULL,
	passwrd CHARACTER VARYING(20) NOT NULL,
	passwrd_recap CHARACTER VARYING(20) NOT NULL
);

CREATE TABLE jobseeker_validation (
	validation_id serial NOT NULL,
	jobseeker_id INTEGER NOT NULL,
	email BOOLEAN NOT NULL,
	identity_number BOOLEAN NOT NULL
);

CREATE TABLE employer (
	employer_id serial NOT NULL,
	company_name CHARACTER VARYING(50) UNIQUE NOT NULL,
	company_website CHARACTER VARYING(25) UNIQUE NOT NULL,
	email CHARACTER VARYING(25) UNIQUE NOT NULL,
	phone_number CHARACTER VARYING(13) UNIQUE NOT NULL,
	passwrd CHARACTER VARYING(20) NOT NULL,
	passwrd_recap CHARACTER VARYING(20) NOT NULL
);

CREATE TABLE employer_validation (
	validation_id serial NOT NULL,
	employer_id INTEGER NOT NULL,
	email BOOLEAN NOT NULL
);

CREATE TABLE hrms_staff_validation (
	validation_id serial NOT NULL,
	employer_id INTEGER NOT NULL,
	validation BOOLEAN NOT NULL
);

CREATE TABLE job_position (
	position_id serial NOT NULL,
	employer_id INTEGER NOT NULL,
	job_name CHARACTER VARYING(50) NOT NULL
);


ALTER TABLE ONLY jobseeker 
	ADD CONSTRAINT pk_jobseeker PRIMARY KEY (jobseeker_id);

ALTER TABLE ONLY jobseeker_validation
	ADD CONSTRAINT pk_jobseeker_validation PRIMARY KEY (jobseeker_id);

ALTER TABLE ONLY employer
	ADD CONSTRAINT pk_employer PRIMARY KEY (employer_id);

ALTER TABLE ONLY employer_validation
	ADD CONSTRAINT pk_employer_validation PRIMARY KEY (employer_id);

ALTER TABLE ONLY hrms_staff_validation
	ADD CONSTRAINT pf_hrms_staff_validation PRIMARY KEY (employer_id);
	


ALTER TABLE ONLY jobseeker
	ADD CONSTRAINT fk_jobseeker_jobseekervalidation FOREIGN KEY (jobseeker_id) REFERENCES jobseeker_validation(jobseeker_id);


ALTER TABLE employer
	ADD CONSTRAINT fk_employer_employer_validation FOREIGN KEY (employer_id) REFERENCES employer_validation(employer_id);
	
ALTER TABLE employer	
	ADD CONSTRAINT fk_employer_hrms_staff_validation FOREIGN KEY (employer_id) REFERENCES hrms_staff_validation(employer_id);


