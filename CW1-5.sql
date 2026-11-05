USE infs_patrzykata
CREATE TABLE pracownik (
      id_pracownika INT PRIMARY KEY AUTO_INCREMENT,
      imię VARCHAR(40) NOT NULL,
	  nazwisko VARCHAR (60) NOT NULL,
	  data_urodzenia DATE NOT NULL
);

INSERT INTO pracownik (imię, nazwisko, data_urodzenia) VALUES 
	  ("Jan", "Kowalski", "1970-10-29"),
	  ("Michał", "Nowak", "1980-12-24"),
	  ("Marek", "Piotrowski", "2002-02-08");

UPDATE pracownik SET data_urodzenia = "1970-10-16" WHERE id_pracownika = 1;

SELECT * FROM pracownik; 

CREATE TABLE zadanie (
id_zadania INT AUTO_INCREMENT PRIMARY KEY,
nazwa_zadania VARCHAR(150) NOT NULL,
priorytet ENUM('normalny','wysoki','niski'),
opis TEXT NULL,
pracownik INT,
FOREIGN KEY (pracownik)
    REFERENCES pracownik(id_pracownika)
    ON DELETE SET NULL
); 

ALTER TABLE zadanie
MODIFY COLUMN priorytet
ENUM ('normalny','wysoki','niski')
DEFAULT 'normalny';

INSERT INTO zadanie (nazwa_zadania, pracownik)
SELECT 'Wykonane zadania', id_pracownika
FROM pracownik;

CREATE TABLE projekt (
id_projektu INT AUTO_INCREMENT PRIMARY KEY,
nazwa_projektu VARCHAR(150) NOT NULL,
data_rozpoczecia DATE,
data_zakonczenia DATE NOT NULL
);

ALTER TABLE projekt 
ADD menadzer_projektu INT,
ADD FOREIGN KEY (menadzer_projektu)
		REFERENCES pracownik(id_pracownika);
        
INSERT INTO projekt (nazwa_projektu, data_rozpoczecia, data_zakonczenia)
VALUES
('Projekt A','2026-11-05','2027-12-06'),
('Projekt B','2025-12-24','2031-01-17');

ALTER TABLE zadanie 
ADD projekt INT,
ADD FOREIGN KEY (projekt)
REFERENCES projekt(id_projektu)
ON DELETE CASCADE;
SELECT * FROM projekt;
SELECT* FROM zadanie;

 UPDATE zadanie
 SET projekt = 1
 WHERE id_zadania IN (1, 2);
 
 UPDATE zadanie
 SET projekt = 2
 WHERE id_zadania = 3;
 
 SELECT * FROM zadanie;
 
 CREATE TABLE sprint (
 id_sprintu INT AUTO_INCREMENT PRIMARY KEY,
 numer_sprintu INT unSIGNED,
 data_rozpoczecia DATE,
 data_zakonczenia DATE
 );
 
 INSERT INTO sprint (numer_sprintu, data_rozpoczecia, data_zakonczenia)
 VALUES (1, '2026-11-05', '2026-12-06');
 
 UPDATE zadanie
 SET sprint = 1
 WHERE id_zadania IN (1, 2);
 
 SELECT * FROM sprint
 SELECT * FROM zadanie
 
 CREATE TABLE status (
 id_statusu INT AUTO_INCREMENT PRIMARY KEY,
 nazwa_statusu VARCHAR(20)
 );
 
 INSERT INTO status (nazwa_statusu)
 VALUES
 ('Do zrobienia'),
 ('W trakcie'),
 ('Zakonczone');
 
 CREATE TABLE zadanie_has_status (
 id_zdarzenia INT AUTO_INCREMENT PRIMARY KEY,
 id_zadania INT,
 id_statusu INT,
 data_zdarzenia DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_zadania)
      REFERENCES zadanie(id_zadania),
    FOREIGN KEY (id_statusu)
       REFERENCES status(id_statusu)
  );
 
 INSERT INTO zadanie_has_status(id_zadania,id_statusu)
 VALUES 
 (1,1),
 (2,2),
 (3,3);
 
 SELECT * FROM zadanie_has_status
 
 DELETE FROM zadanie_has_status
 WHERE id_zadania IN (1,2);
 
 DELETE FROM projekt
 WHERE id_projektu = 1;
 
 SELECT * FROM zadanie;
 
 SHOW CREATE TABLE zadanie;
 
 ALTER TABLE zadanie
 DROP FOREIGN KEY zadanie_ibfk_3;
 
DROP TABLE sprint; 

SHOW TABLES;