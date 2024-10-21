CREATE DATABASE IF NOT EXISTS compta;

USE compta;

DROP TABLE IF EXISTS ARTICLE;
CREATE TABLE IF NOT EXISTS ARTICLE (
    ID INT PRIMARY KEY,
    REF VARCHAR(50),
    DESIGNATION VARCHAR(50),
    PRIX DECIMAL(7.2),
    ID_FOU int
);

DROP TABLE IF EXISTS FOURNISSEUR;
CREATE TABLE IF NOT EXISTS FOURNISSEUR (
    ID INT PRIMARY KEY,
    NOM VARCHAR(50)
);

DROP TABLE IF EXISTS BON;
CREATE TABLE IF NOT EXISTS BON (
    ID INT PRIMARY KEY,
    NUMERO int,
    DATE_CMDE DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    DELAI int,
    ID_FOU int
);

DROP TABLE IF EXISTS COMPO;
CREATE TABLE IF NOT EXISTS COMPO (
    ID INT PRIMARY KEY,
    ID_ART int(11),
    ID_BON int(11),
    QTE int(11)
);

-- Mettre la foreign key de article
    ALTER TABLE ARTICLE ADD CONSTRAINT FOREIGN KEY (ID_FOU) REFERENCES FOURNISSEUR(ID);
-- Mettre la foreign key de bon
    ALTER TABLE BON ADD CONSTRAINT FOREIGN KEY (ID_FOU) REFERENCES FOURNISSEUR(ID);
-- Mettre la foreign key de compo
    ALTER TABLE COMPO ADD CONSTRAINT FOREIGN KEY (ID_ART) REFERENCES ARTICLE(ID);
-- Mettre la foreign key de compo
    ALTER TABLE COMPO ADD CONSTRAINT FOREIGN KEY (ID_BON) REFERENCES BON(ID);
