/*ToysGroup è un’azienda che distribuisce articoli (giocattoli) in diverse aree geografiche del mondo.
I prodotti sono classificati in categorie e i mercati di riferimento dell’azienda sono classificati in regioni di vendita.
In particolare: Le entità individuabili in questo scenario sono le seguenti:
- Product - Region - Sales 
Le relazioni tra le entità possono essere descritte nel modo seguente:
❏ Product e Sales
❏ Un prodotto può essere venduto tante volte (o nessuna) per cui è contenuto in una o più transazioni di vendita.
❏ Ciascuna transazione di vendita è riferita ad uno solo prodotto

❏ Region e Sales
❏ Possono esserci molte o nessuna transazione per ciascuna regione
❏ Ciascuna transazione di vendita è riferita ad una sola regione
Fornisci schema concettuale e schema logico.

Crea e popola le tabelle utilizzando dati a tua discrezione (sono sufficienti pochi record per tabella; riporta le query utilizzate).

Effettua la consegna dell’esercizio utilizzando DUE file:
Un file che contenga il diagramma ER per la progettazione del database.
Un file .sql che contenga tutte le query necessarie a creare, popolare le tabelle e rispondere ai quesiti della slide precedente.*/


/*
Product:
-id_prodotto (PK)
-categoria
-prezzo_unitario
-nome_commerciale

Region:
-id_regione (PK)
-nome_regione

Sales:
-id_vendita (PK)
-id_prodotto (FK)
-id_regione (FK)
-transazione (somma dei prezzi ordinari)
-data_vendita
-pezzi

Stati:
-nome_stato (PK)
-id_regione (FK)
*/


CREATE DATABASE ToysGroup;

USE ToysGroup;

CREATE TABLE Product(
id_prodotto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
categoria VARCHAR (45) NOT NULL,
prezzo_unitario DECIMAL(10,2) NOT NULL,
nome_commerciale VARCHAR (45) NOT NULL
);

CREATE TABLE Region(
id_regione INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome_regione VARCHAR (45) NOT NULL
);

CREATE TABLE Sales(
id_vendita INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_prodotto INT,
id_regione INT,
data_vendita DATE,
transazione DECIMAL(10,2),
pezzi_transazione INT,
    FOREIGN KEY (id_prodotto) REFERENCES Product(id_prodotto),
    FOREIGN KEY (id_regione) REFERENCES Region(id_regione)
);

CREATE TABLE Stati(
nome_stato VARCHAR (45) NOT NULL PRIMARY KEY,
id_regione INT NOT NULL,
	FOREIGN KEY (id_regione) REFERENCES Region(id_regione)
);

INSERT INTO Product (categoria, prezzo_unitario, nome_commerciale) VALUES
('Action Figures', 19.99, 'Super Hero X'),
('Action Figures', 24.99, 'Robot Guerriero'),
('Action Figures', 29.99, 'Drago Magico'),
('Giochi Educativi', 15.99, 'Kit Scienza Base'),
('Giochi Educativi', 12.99, 'Puzzle Geografico'),
('Giochi Educativi', 18.99, 'Gioco Matematica Divertente'),
('Bambole', 25.99, 'Bambola Principessa Rosa'),
('Bambole', 22.99, 'Bambola Interattiva Lila'),
('Bambole', 27.99, 'Bambola Magica con Accessori'),
('Costruzioni', 29.99, 'Set Costruzioni Base'),
('Costruzioni', 34.99, 'Set Castello Medioevale'),
('Costruzioni', 39.99, 'Set Spaziale Avventura'),
('Veicoli Giocattolo', 14.99, 'Auto Sportiva Rossa'),
('Veicoli Giocattolo', 19.99, 'Camion dei Pompieri'),
('Veicoli Giocattolo', 22.99, 'Elicottero della Polizia'),
('Peluche', 9.99, 'Orsetto di Peluche'),
('Peluche', 14.99, 'Coniglietto Morbido'),
('Peluche', 12.99, 'Elefante di Peluche'),
('Giochi da Tavolo', 24.99, 'Gioco di Strategia Avventura'),
('Giochi da Tavolo', 19.99, 'Gioco di Carte Famigliare'),
('Giochi da Tavolo', 29.99, 'Gioco di Ruolo Fantasy');

INSERT INTO Region (nome_regione) VALUES
('Nord America'),
('Europa Occidentale'),
('Asia Orientale'),
('America del Sud'),
('Africa Settentrionale'),
('Oceania'),
('Asia Meridionale'),
('Europa Orientale'),
('Africa Subsahariana'),
('Medio Oriente');

INSERT INTO Stati (nome_stato, id_regione) VALUES
('USA', 1),
('Canada', 1),
('Messico', 1),
('Germania', 2),
('Francia', 2),
('Italia', 2),
('Cina', 3),
('Giappone', 3),
('Corea del Sud', 3),
('Brasile', 4),
('Argentina', 4),
('Cile', 4),
('Egitto', 5),
('Algeria', 5),
('Marocco', 5),
('Australia', 6),
('Nuova Zelanda', 6),
('Fiji', 6),
('India', 7),
('Pakistan', 7),
('Bangladesh', 7),
('Russia', 8),
('Polonia', 8),
('Ucraina', 8),
('Nigeria', 9),
('Sudafrica', 9),
('Kenya', 9),
('Arabia Saudita', 10),
('Israele', 10),
('Iran', 10);

INSERT INTO Sales (id_prodotto, id_regione, data_vendita, transazione, pezzi_transazione) VALUES
(1, 1, '2023-01-15', 39.98, 2),
(2, 1, '2024-01-16', 74.97, 3),
(3, 2, '2022-01-17', 59.98, 2),
(4, 3, '2024-01-18', 31.98, 2),
(5, 4, '2024-01-19', 38.97, 3),
(6, 5, '2024-01-20', 56.97, 3),
(7, 6, '2024-01-21', 77.97, 3),
(8, 7, '2024-01-22', 45.98, 2),
(9, 8, '2023-01-23', 55.98, 2),
(10, 9, '2024-01-24', 89.97, 3),
(11, 10, '2023-01-25', 69.98, 2),
(12, 1, '2022-01-26', 79.98, 2),
(13, 2, '2024-01-27', 29.98, 2),
(14, 3, '2023-01-28', 59.97, 3),
(15, 4, '2024-01-29', 68.97, 3),
(16, 5, '2022-01-30', 19.98, 2),
(17, 6, '2024-01-31', 29.98, 2),
(18, 7, '2022-02-01', 25.98, 2),
(19, 8, '2023-02-02', 49.98, 2),
(20, 9, '2022-02-03', 39.98, 2),
(21, 10, '2024-02-04', 59.98, 2),
(null, null, null, null, null),
(null, null, null, null, null),
(null, null, null, null, null);

/*Dopo la creazione e l’inserimento dei dati nelle tabelle, esegui e riporta delle query utili a:
1.Verificare che i campi definiti come PK siano univoci.*/

SELECT DISTINCT
	id_prodotto
FROM
	product;
    
SELECT
	id_prodotto
FROM
	product;
    
SELECT DISTINCT
	id_regione
FROM
	region;

SELECT
	id_regione
FROM
	region;
    
SELECT DISTINCT
	id_vendita
FROM
	sales;

SELECT
	id_vendita
FROM
	sales;
    
SELECT DISTINCT
	nome_stato
FROM
	stati;

SELECT
	nome_stato
FROM
	stati;
    
/* 2.Esporre l’elenco dei soli prodotti venduti e per ognuno di questi il fatturato totale per anno.*/

SELECT
	product.nome_commerciale AS NOME_PRODOTTO,
    sales.transazione AS FATTURATO_TOTALE,
    YEAR(sales.data_vendita) AS ANNO
FROM
	product
	JOIN
    sales ON sales.id_prodotto = product.id_prodotto
ORDER BY
	YEAR(sales.data_vendita) DESC;
    
/*3.Esporre il fatturato totale per stato per anno. Ordina il risultato per data e per fatturato decrescente.*/

SELECT
	stati.nome_stato,
    sales.transazione AS fatturato_totale,
    YEAR(sales.data_vendita) AS ANNO
FROM
	stati
    LEFT JOIN
    sales ON sales.id_regione = stati.id_regione
ORDER BY
	YEAR(sales.data_vendita),
     sales.transazione DESC;
     
/*4.Rispondere alla seguente domanda: qual è la categoria di articoli maggiormente richiesta dal mercato?
per me la categoria più richiesta è quella con più pezzi venduti*/

SELECT
    product.categoria AS categoria,
    SUM(sales.pezzi_transazione) AS totale_pezzi_venduti,
    COUNT(sales.id_vendita) AS numero_vendite
FROM
	product
    LEFT JOIN
    sales ON sales.id_prodotto = sales.id_prodotto
GROUP BY
	product.categoria
ORDER BY
	SUM(sales.pezzi_transazione)
LIMIT 1;

/* per come ho popolato le tabelle in realtà sono tutte uguali le vendite, come totale, quindi la risposta corretta
sarebbe che ogni singola categoria è la più richiesta del mercato, ma questo per come ho costruito il database;
di fatto lascerei questo script così se dovesse essere utilizzato un giorno con altri dati dovrebbe funzionare*/

/*5.Rispondere alla seguente domanda: quali sono, se ci sono, i prodotti invenduti?Proponi due approcci risolutivi differenti.*/
SELECT
	id_vendita
FROM
	sales
WHERE
	id_prodotto IS NULL;

SELECT 
    id_vendita
FROM
    sales
WHERE
    id_prodotto NOT IN (SELECT 
            id_vendita
        FROM
            sales
        WHERE
            id_prodotto IS NOT NULL);

SELECT 
    id_vendita
FROM
    sales
WHERE
    id_prodotto NOT IN (SELECT 
            id_prodotto
        FROM
            product);

/*6.Esporre l’elenco dei prodotti con la rispettiva ultima data di vendita (la data di vendita più recente).*/

SELECT
	product.nome_commerciale,
    MAX(sales.data_vendita) AS ultima_vendita
FROM
	product
    LEFT JOIN
	sales ON product.id_prodotto = sales.id_prodotto
GROUP BY
	product.nome_commerciale;