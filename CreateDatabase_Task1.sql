CREATE DATABASE Assignment1;
GO

USE Assignment1;

DROP TABLE IF EXISTS FactSurvey;
DROP TABLE IF EXISTS Survey;
DROP TABLE IF EXISTS SurveyLocation;
DROP TABLE IF EXISTS Respond;
DROP TABLE IF EXISTS Participant;


CREATE TABLE Participant (
	participant_id varchar(255) not null,
	gender varchar(255),
	age varchar(255),
	height int,
	weight int,
	bmi float,
	blood_type varchar(255),
	insurance varchar(255),
	income varchar(255),
	race varchar(255), 
	immigrant varchar(255),
	working varchar(255),
	smoking varchar(255),
	contacts_count int, 
	house_count int,
	public_transport_count int,
	PRIMARY KEY (participant_id)
);

CREATE TABLE SurveyLocation(
	location_id int NOT NULL IDENTITY(1,1),
	region varchar(255),
	country varchar(255),
	PRIMARY KEY(location_id)
);

CREATE TABLE Survey (
	survey_id varchar(255) not null,
	survey_date varchar(255),
	location_id int,
	ip_latitude float, 
	ip_longitude float,
	day int,
	month int,
	year int,
	PRIMARY KEY (survey_id),
	FOREIGN KEY(location_id) REFERENCES SurveyLocation(location_id)
);



CREATE TABLE Respond (
	response_id varchar(255) not null,
	covid19_positive int,
	covid19_symptoms int,
	covid19_contact int,
	asthma int,
	kidney_disease int,
	liver_disease int,
	compromised_immune int,
	heart_disease int,
	lung_disease int,
	diabetes int,
	hiv_positive int,
	hypertension int,
	other_chronic int,
	nursing_home int,
	health_worker int,
	PRIMARY KEY (response_id)
);

CREATE TABLE FactSurvey (
	fact_id int NOT NULL IDENTITY(1,1),
	participant_id varchar(255) not null,
	survey_id varchar(255) not null,
	response_id varchar(255) not null,
	risk_infection int,
	risk_mortality float,
	PRIMARY KEY (fact_id),
	FOREIGN KEY (participant_id) REFERENCES Participant(participant_id),
	FOREIGN KEY (survey_id) REFERENCES Survey(survey_id),
	FOREIGN KEY (response_id) REFERENCES Respond(response_id)
);