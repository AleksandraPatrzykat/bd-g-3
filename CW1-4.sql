ALTER TABLE zadanie
DROP FOREIGN KEY zadanie_ibfk_1;

ALTER TABLE projekt
DROP FOREIGN KEY projekt_ibfk_1;

ALTER TABLE `infs_patrzykata`.`pracownik` 
CHANGE COLUMN `id_pracownika` `id_pracownika` INT NOT NULL ,
DROP PRIMARY KEY;

ALTER TABLE pracownik
ADD PRIMARY KEY(id_pracownika);

ALTER TABLE zadanie
ADD CONSTRAINT fk__zadanie_pracownik
FOREIGN KEY (pracownik)
REFERENCES pracownik(id_pracownika)
ON DELETE SET NULL ;

ALTER TABLE projekt
ADD CONSTRAINT fk_projekt_menadzer
FOREIGN KEY(menadzer_projektu)
REFERENCES pracownik(id_pracownika);

ALTER TABLE zadanie
ADD COLUMN godziny_szacowane INTEGER
DEFAULT 8;

UPDATE zadanie 
SET godziny_szacowane = 4
WHERE id_zadania = 3;

UPDATE zadanie 
SET godziny_szacowane = 12
WHERE id_zadania = 4;

UPDATE zadanie 
SET godziny_szacowane = 16
WHERE id_zadania = 5;

UPDATE zadanie 
SET godziny_szacowane = 20
WHERE id_zadania = 6;

ALTER TABLE zadanie 
ALTER COLUMN godziny_szacowane SET DEFAULT 6;

INSERT INTO zadanie (nazwa_zadania)
VALUES('Zadanie testowe');

SELECT * FROM zadanie;

DELETE FROM zadanie
WHERE id_zadania IN (7,8,9);

ALTER TABLE projekt
ADD COLUMN opis_kartki VARCHAR(50) NULL;

ALTER TABLE projekt
MODIFY COLUMN opis_kartki VARCHAR(200) NULL;

INSERT INTO projekt (nazwa_projektu, data_zakonczenia)
VALUES ('A','2027-01-03'),
('B','2027-03-01');

UPDATE projekt
SET opis_kartki = 'MPV'
WHERE nazwa_projektu = 'A';

UPDATE projekt
SET opis_kartki = 'Pilne wdrozenie'
WHERE nazwa_projektu = 'B';

ALTER TABLE projekt
DROP COLUMN opis_kartki;

ALTER TABLE zadanie
DROP FOREIGN KEY zadanie_ibfk_2;

ALTER TABLE zadanie
MODIFY COLUMN projekt INT NULL;


ALTER TABLE zadanie 
ADD CONSTRAINT fk_zadanie_projekt
FOREIGN KEY(projekt)
REFERENCES projekt(id_projektu)
ON DELETE SET NULL;

DELETE FROM projekt
WHERE id_projektu = 2;

SELECT id_zadania, nazwa_zadania, projekt 
FROM zadanie;






















































