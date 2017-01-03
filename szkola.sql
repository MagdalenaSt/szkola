DROP DATABASE Szkola;
CREATE DATABASE Szkola;

USE Szkola;

DROP TABLE Klasa;

CREATE TABLE Uczen (
	idUczen INT NOT NULL AUTO_INCREMENT,
    imie VARCHAR(50),
    nazwisko VARCHAR(50),
    PRIMARY KEY(idUczen)
);

CREATE TABLE Nauczyciel (
	idNauczyciel INT NOT NULL AUTO_INCREMENT,
    imie VARCHAR(50),
    nazwisko VARCHAR(50),
	PRIMARY KEY(idNauczyciel)
);

CREATE TABLE Przedmiot (
	idPrzedmiot INT NOT NULL AUTO_INCREMENT,
    nazwa VARCHAR(50),
    PRIMARY KEY(idPrzedmiot)
);

CREATE TABLE Sala (
	idSala INT NOT NULL AUTO_INCREMENT,
    pietro INT,
    liczbaMiejsc INT, 
    PRIMARY KEY(idSala)
);

CREATE TABLE GodzinaLekcyjna (
	idGodzina INT NOT NULL AUTO_INCREMENT,
    godzinaRozpoczecia DATETIME,
    godzinaZakonczenia DATETIME,
    PRIMARY KEY(idGodzina)
);

CREATE TABLE Specjalizacja (
	idNauczyciel INT REFERENCES Szkola.Nauczyciel(idNauczyciel),
    idPrzedmiot INT REFERENCES Szkola.Przedmiot(idPrzedmiot)
);

CREATE TABLE Klasa (
	idKlasa INT NOT NULL AUTO_INCREMENT,
    oddzial CHAR,
    rokRozpoczecia INT,
    idWychowawca INT REFERENCES Szkola.Nauczyciel(idNauczyciel),
    PRIMARY KEY(idKlasa)
);

CREATE TABLE UczylSie (
	idUczen INT REFERENCES Szkola.Uczen(idUczen),
    idKlasa INT REFERENCES Szkola.Klasa(idKlasa)
);

CREATE TABLE Kurs (
	idKurs  INT NOT NULL AUTO_INCREMENT,
    idNauczyciel INT REFERENCES Szkola.Nauczyciel(idNauczyciel),
    idPrzedmiot INT REFERENCES Szkola.Przedmiot(idPrzedmiot),
    idKlasa INT REFERENCES Szkola.Klasa(idKlasa),
    rokSzkolny INT,
    PRIMARY KEY(idKurs)
);

CREATE TABLE Zajecia (
	idZajecia INT NOT NULL AUTO_INCREMENT,
    idKurs INT REFERENCES Szkola.Kurs(idKurs),
	idSala INT REFERENCES Szkola.Sala(idSala),
    dzienTygodnia VARCHAR(15),
    idGodzinaLekcyjna INT REFERENCES Szkola.GodzinaLekcyjna(idGodzina),    
    PRIMARY KEY (idZajecia)
);



