/*
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
*/ 

CREATE TABLE Zadanie ( 
    id_zadania INT PRIMARY KEY AUTO_INCREMENT,
    nazwa_zadania VARCHAR (150) NOT NULL,
    priorytet ENUM('normalny', 'wysoki', 'niski'), 
    opis TEXT NULL, 
    CONSTRAINT fk_zadania_pracownicy
    FOREIGN KEY(id_pracownika)
		REFERENCES pracownik(id_pracownika)
        ON DELETE SET NULL
);
    
