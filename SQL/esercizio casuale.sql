/*ESERCIZIO 
Il bioparco di Roma vuole informatizzare la gestione delle informazioni relative agli animali che vivono al suo interno. In particolare, si vuole memorizzare le informazioni relative al nome, alla data di nascita,
al colore predominante che lo caratterizza e alla specie a cui appartengono. Riguardo la specie si vuole salvare nel DB anche una descrizione della specie ed il cibo preferito.
Per il giardino zoologico è importante capire in quale settore dello zoo si trova ciascun animale. Inoltre, per ciascun settore si vuole conoscere la posizione del settore ed il suo nome.
Nota Bene: Un animale non può appartenere a più di una specie.
(Suggerimento: Ragiona su come memorizzare la posizione del settore)*/

CREATE DATABASE bio_parco;

/*
tabelle

ANIMALI
- Nome animale
- Data
- Colore
- nome specie (FK)
- id animale (PK)
- id settore (FK)

SPECIE
- nome specie
- descrizione
- cibo preferito

SETTORE
- posizione (VARCHAR)
- id settore (INT) PK
*/

CREATE TABLE animali (
Nome_animale VARCHAR (15) NOT NULL,
Data DATE NOT NULL,
Colore VARCHAR (15) NOT NULL,
nome_specie VARCHAR(30) NOT NULL,
id_animale VARCHAR(30) NOT NULL PRIMARY KEY,
id_settore INT NOT NULL
);

CREATE TABLE specie (
nome_specie VARCHAR(30) NOT NULL PRIMARY KEY,
descrizione VARCHAR(200) NOT NULL,
cibo_preferito VARCHAR(45) NOT NULL
);

CREATE TABLE settore (
posizione VARCHAR(15),
id_settore INT PRIMARY KEY NOT NULL
);

ALTER TABLE `bio_parco`.`animali` 
DROP FOREIGN KEY `Nomespecie`;
ALTER TABLE `bio_parco`.`animali` 
ADD INDEX `animali_specie_idx` (`nome_specie` ASC) VISIBLE,
ADD INDEX `animali_ settore_idx` (`id_settore` ASC) VISIBLE,
DROP INDEX `Nomespecie_idx` ;
;
ALTER TABLE `bio_parco`.`animali` 
ADD CONSTRAINT `animali_specie`
  FOREIGN KEY (`nome_specie`)
  REFERENCES `bio_parco`.`specie` (`nome_specie`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `animali_ settore`
  FOREIGN KEY (`id_settore`)
  REFERENCES `bio_parco`.`settore` (`id_settore`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;



INSERT INTO specie (nome_specie, descrizione, cibo_preferito) VALUES
('Leone', 'Grande felino africano', 'Carne'),
('Elefante', 'Mammifero terrestre più grande', 'Erba'),
('Tigre', 'Grande felino asiatico', 'Carne'),
('Orso Polare', 'Grande orso bianco dell\'Artico', 'Pesce'),
('Scimmia', 'Primati intelligenti', 'Frutta'),
('Lupo', 'Predatore sociale', 'Carne'),
('Canguro', 'Marsupiale saltatore', 'Erba'),
('Pappagallo', 'Uccello colorato e parlante', 'Semi'),
('Volpe', 'Piccolo carnivoro astuto', 'Carne'),
('Delfino', 'Mammifero marino intelligente', 'Pesce');

/*INSERT INTO settore (posizione, id_settore) VALUES
('Nord', 101),
('Sud', 102),
('Est', 103),
('Ovest', 104),
('Centrale', 105),
('Nord-Est', 106),
('Nord-Ovest', 107),
('Sud-Est', 108),
('Sud-Ovest', 109),
('Acquario', 110);*/

INSERT INTO animali (nome_animale, data, colore, nome_specie, id_animale, id_settore) VALUES
('Leo', '2023-05-20', 'Giallo', 'Leone', 1, 101),
('Zippy', '2023-05-21', 'Grigio', 'Elefante', 2, 102),
('Stripe', '2023-05-22', 'Nero', 'Tigre', 3, 103),
('Snowy', '2023-05-23', 'Bianco', 'Orso Polare', 4,  104),
('Chewy', '2023-05-24', 'Marrone', 'Scimmia', 5,  105),
('Rocky', '2023-05-25', 'Grigio', 'Lupo', 6, 101),
('Bella', '2023-05-26', 'Marrone', 'Canguro', 7, 102),
('Tango', '2023-05-27', 'Verde', 'Pappagallo', 8, 103),
('Flash', '2023-05-28', 'Arancione', 'Volpe', 9, 104),
('Bubbles', '2023-05-29', 'Blu', 'Delfino', 10, 110);

/*per ogni specie quanti animali ci sono?*/
SELECT
	animali.nome_specie,
    COUNT(animali.id_animale)
FROM
	specie
    LEFT JOIN
    animali ON specie.nome_specie = animali.nome_specie
GROUP BY
	specie.nome_specie;

/* nome della SPECIE CHE HA PIù ANIMALI*/

SELECT
	animali.nome_specie,
    COUNT(animali.id_animale)
FROM
	specie
    LEFT JOIN
    animali ON specie.nome_specie = animali.nome_specie
GROUP BY
	specie.nome_specie
ORDER BY COUNT(animali.id_animali) DESC
LIMIT 1;

SELECT 
    nome_specie, 
    COUNT(*) AS numero_animali
FROM 
    ANIMALI
GROUP BY 
    nome_specie
ORDER BY 
    numero_animali DESC
LIMIT 1;
