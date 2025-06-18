
-- Reizen die langer dan 10 dagen duren
SELECT VakantieCode, Bestemming, AantalDagen, Prijs
FROM Vakantie
WHERE AantalDagen > 10;

-- Studenten ouder dan 18 binnen opleiding Economie
SELECT StudentVoornaam, StudentAchternaam, Collegekaart, Geboortedatum
FROM Student
WHERE Opleidingen = 'Economie'
  AND TIMESTAMPDIFF(YEAR, Geboortedatum, CURDATE()) > 18;

-- Studenten gesorteerd op opleiding en leeftijd
SELECT *
FROM Student
ORDER BY Opleidingen, Geboortedatum;

-- Prijs per dag
SELECT VakantieCode, Bestemming, ROUND(Prijs / AantalDagen, 2) AS PrijsPerDag
FROM Vakantie;

-- Gemiddelde reissom
SELECT AVG(Prijs) AS GemiddeldeReisPrijs
FROM Vakantie;

-- Boeking details met korting en landcode
SELECT s.StudentVoornaam, s.StudentAchternaam, b.StudentKorting, v.LandCode
FROM Student s
JOIN Boeking b ON b.Collegekaart = s.Collegekaart
JOIN Vakantie v ON v.VakantieCode = b.VakantieCode;

-- Reizen met maximaal drie deelnemers
SELECT v.VakantieCode, v.Bestemming, COUNT(b.Collegekaart) AS AantalStudenten
FROM Vakantie v
LEFT JOIN Boeking b ON b.VakantieCode = v.VakantieCode
GROUP BY v.VakantieCode, v.Bestemming
HAVING COUNT(b.Collegekaart) <= 3;
