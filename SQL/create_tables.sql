
CREATE TABLE Land (
    LandCode CHAR(2) PRIMARY KEY,
    LandNaam VARCHAR(50)
);

CREATE TABLE Begeleider (
    Naam VARCHAR(100) PRIMARY KEY,
    Adres VARCHAR(100),
    Telefoon VARCHAR(20),
    Woonplaats VARCHAR(50)
);

CREATE TABLE Student (
    Collegekaart VARCHAR(10) PRIMARY KEY,
    StudentVoornaam VARCHAR(50),
    StudentAchternaam VARCHAR(50),
    Geboortedatum DATE,
    Opleidingen VARCHAR(50)
);

CREATE TABLE Vakantie (
    VakantieCode VARCHAR(10) PRIMARY KEY,
    BegeleiderNaam VARCHAR(100),
    LandCode CHAR(2),
    Bestemming VARCHAR(100),
    Vertrekdatum DATE,
    AantalDagen INT,
    Prijs DECIMAL(8,2),
    FOREIGN KEY (BegeleiderNaam) REFERENCES Begeleider(Naam),
    FOREIGN KEY (LandCode) REFERENCES Land(LandCode)
);

CREATE TABLE Boeking (
    VakantieCode VARCHAR(10),
    Collegekaart VARCHAR(10),
    StudentKorting DECIMAL(8,2),
    PRIMARY KEY (VakantieCode, Collegekaart),
    FOREIGN KEY (VakantieCode) REFERENCES Vakantie(VakantieCode),
    FOREIGN KEY (Collegekaart) REFERENCES Student(Collegekaart)
);
