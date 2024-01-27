-- Creation tables 
PRAGMA foreign_keys = OFF;
drop table if exists Student;
drop table if exists Persona;
drop table if exists PersonaAttribute;
drop table if exists GlobalYearlyTemp;
drop table if exists CityTemp;
drop table if exists StateTemp;
drop table if exists CountryTemp;
drop table if exists LandOceanTemp;
PRAGMA foreign_keys = ON;

CREATE TABLE GlobalYearlyTemp (
  Year INT UNSIGNED PRIMARY KEY,
  AvgTemp FLOAT,
  MinTemp FLOAT,
  MaxTemp FLOAT
);


CREATE TABLE Persona (
  Name VARCHAR(255) PRIMARY KEY,
  ImgFilePath VARCHAR(255),
  Description TEXT
);

CREATE TABLE PersonaAttribute (
  Persona VARCHAR(255) NOT NULL,
  AttributeType VARCHAR(255) NOT NULL,
  Value VARCHAR(255),
  PRIMARY KEY (Persona, AttributeType),
  FOREIGN KEY (Persona) REFERENCES Persona(Name)
);

CREATE TABLE Student (
  SID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Email VARCHAR(255) UNIQUE
);

CREATE TABLE CityTemp (
  CityName VARCHAR(255) PRIMARY KEY,
  Year INT UNSIGNED NOT NULL,
  AvgTemp FLOAT,
  MinTemp FLOAT,
  MaxTemp FLOAT,
  FOREIGN KEY (Year) REFERENCES GlobalYearlyTemp(Year)
);

CREATE TABLE StateTemp (
  StateName VARCHAR(255) PRIMARY KEY,
  Year INT UNSIGNED NOT NULL,
  AvgTemp FLOAT,
  MinTemp FLOAT,
  MaxTemp FLOAT,
  FOREIGN KEY (Year) REFERENCES GlobalYearlyTemp(Year)
);

CREATE TABLE CountryTemp (
  CountryName VARCHAR(255) PRIMARY KEY,
  Year INT UNSIGNED NOT NULL,
  AvgTemp FLOAT,
  MinTemp FLOAT,
  MaxTemp FLOAT,
  FOREIGN KEY (Year) REFERENCES GlobalYearlyTemp(Year)
);

CREATE TABLE LandOceanTemp (
  DN VARCHAR(255) PRIMARY KEY,
  Year INT UNSIGNED NOT NULL,
  Type ENUM('Land', 'Ocean'),
  AvgTemp FLOAT,
  MinTemp FLOAT,
  MaxTemp FLOAT,
  FOREIGN KEY (Year) REFERENCES GlobalYearlyTemp(Year)
);


