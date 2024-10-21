DROP DATABASE IF EXISTS tutu;
CREATE DATABASE IF NOT EXISTS tutu;

USE tutu;

DROP TABLE IF EXISTS Persons;
CREATE TABLE IF NOT EXISTS Persons (
    ID int,
    LastName VARCHAR(50),
    FirstName VARCHAR(50),
    Address VARCHAR(255),
    City VARCHAR(50)
);

INSERT INTO Persons(LastName, FirstName) VALUES("BENELGHARIB", "Zakary")

CREATE TABLE IF NOT EXISTS Address (
    id int NOT NULL,
    address VARCHAR(255),
    complement VARCHAR(255)
    id_person INT NOT NULL
);

CREATE TABLE Persons (
    ID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NOM VARCHAR(255),

)
