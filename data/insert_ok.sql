-- -- --*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--
-- --                                  Université Grenoble Alpes                             --
-- --                                      Projet Parfumerie                                 --
-- --                                          Fait Par                                      --
-- --                               Alsabr Ibrahim - Riado Bastien                           --
-- -- --*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--
DELETE FROM Magasins;
DELETE FROM Marques;
DELETE FROM Parfums;
DELETE FROM Clients;
DELETE FROM Promotions;
DELETE FROM Stocks;
DELETE FROM Frequentes;
DELETE FROM Validites;

-- PRAGMA FOREIGN_KEY=0;

-- --*-*-*-*-*-*-*-*-*-*- INSERNT INTO MAGASINS TABLE *-*-*-*-*-*-*-*-*-*--
INSERT INTO Magasins VALUES (01, '24 pl Halles, 67000 Strasbourg');
INSERT INTO Magasins VALUES (02, 'Grand Place - 38100 Grenoble');
INSERT INTO Magasins VALUES (03, '6 Place Victor Hugo - 38000 Grenoble');
INSERT INTO Magasins VALUES (04, 'AEROVILLE Rue des Buissons 93290 TREMBLAY-EN-FRANCE');
INSERT INTO Magasins VALUES (05, '18 Place des Laitiers 47000 AGEN');
INSERT INTO Magasins VALUES (06, 'Rue des Portes d"Albi 81000');
INSERT INTO Magasins VALUES (07, '53 Grande Rue 61000');
INSERT INTO Magasins VALUES (08, '5 Rue Docteur Serres 30100');
INSERT INTO Magasins VALUES (09, '65 Rue Carnot 74000');
INSERT INTO Magasins VALUES (10, '07 Rue Docteur Ibrahim 38400');
--
-- --*-*-*-*-*-*-*-*-*-*- INSERNT INTO MARQUES TABLE *-*-*-*-*-*-*-*-*-*--
INSERT INTO Marques VALUES ('Rochas', 'adrs-1', '0456231782', 3);
INSERT INTO Marques VALUES ('Guerlain', 'adrs-2','0556231777', 10);
INSERT INTO Marques VALUES ('Lancôme', 'adrs-3', '0956231741', 1);
INSERT INTO Marques VALUES ('Mugler', 'adrs-4', '0656231713', 4);
INSERT INTO Marques VALUES ('CK', 'adrs-4', '0756231799', 8);
INSERT INTO Marques VALUES ('Dior', 'adrs-6', '0856231741', 10);
INSERT INTO Marques VALUES ('uerlain', 'adrs-7', '0456231712',5);
INSERT INTO Marques VALUES ('Christian Dior', 'adrs-8','0956231775', 20);
INSERT INTO Marques VALUES ('Yves Saint Laurent', 'adrs-9', '06548231782', 2);
INSERT INTO Marques VALUES ('Giorgio Armani', 'adrs-10', '0756231782', 2);
--
-- --*-*-*-*-*-*-*-*-*-*- INSERNT INTO PARFUMS TABLE *-*-*-*-*-*-*-*-*-*--
INSERT INTO Parfums VALUES ('Absolu', 'Rochas');
INSERT INTO Parfums VALUES ('La Petite Robe Noire', 'Guerlain');
INSERT INTO Parfums VALUES ('La Vie est belle', 'Lancôme');
INSERT INTO Parfums VALUES ('Mon Guerlain', 'Mugler');
INSERT INTO Parfums VALUES ('Flower', 'Guerlain');
INSERT INTO Parfums VALUES ('Chloé Signatur', 'Mugler');
INSERT INTO Parfums VALUES ('Shalimar', 'uerlain');
INSERT INTO Parfums VALUES ('Tafasel', 'Christian Dior');
INSERT INTO Parfums VALUES ('Black Opium', 'Yves Saint Laurent');
INSERT INTO Parfums VALUES ('Armani', 'Giorgio Armani');
INSERT INTO Parfums VALUES ('J''adore', 'Dior');
INSERT INTO Parfums VALUES ('Joy de Dior', 'Dior');
INSERT INTO Parfums VALUES ('Poison', 'Dior');
INSERT INTO Parfums VALUES ('Les Escales de Dior', 'Dior');
INSERT INTO Parfums VALUES ('Dior Addict', 'Dior');
INSERT INTO Parfums VALUES ('Dune', 'Dior');
INSERT INTO Parfums VALUES ('Dolce Vita.', 'Dior');

--*-*-*-*-*-*-*-*-*-*- INSERNT INTO CLIENTS TABLE *-*-*-*-*-*-*-*-*-*--
INSERT INTO Clients VALUES ('Alsabr', 'Ibrahim', '01-01-1999', 'adres-1', 'Black Opium');
INSERT INTO Clients VALUES ('Riado', 'Bastien', '22-02-2001', 'adres-2', 'La Vie est belle');
INSERT INTO Clients VALUES ('Martin', 'Marie', '30-08-1987', 'adres-3', 'Flower');
INSERT INTO Clients VALUES ('Thomas', 'Julie', '12-18-2001', 'adres-4','Armani');
INSERT INTO Clients VALUES ('Durand', 'Sophie', '11-11-2010', 'adres-5', 'Flower');
INSERT INTO Clients VALUES ('Dubois', 'Louis', '10-09-1968', 'adres-6', 'La Petite Robe Noire');
INSERT INTO Clients VALUES ('Laurent', 'Hugo', '01-09-1970', 'adres-7', 'Flower');
INSERT INTO Clients VALUES ('Simon', 'Rose', '25-07-1998', 'adres-8','La Petite Robe Noire');
INSERT INTO Clients VALUES ('Leroy', 'Chloé', '19-05-1944', 'adres-9', 'Chloé Signatur');
INSERT INTO Clients VALUES ('Roux', 'Paul', '02-01-1980', 'adres-10', 'Mon Guerlain');

--*-*-*-*-*-*-*-*-*-*- INSERNT INTO PROMOTIONS TABLE *-*-*-*-*-*-*-*-*-*--
INSERT INTO Promotions VALUES ('LCDHB', 'Absolu');
INSERT INTO Promotions VALUES ('CDFES', 'La Vie est belle');
INSERT INTO Promotions VALUES ('QSDFG', 'Mon Guerlain');
INSERT INTO Promotions VALUES ('RFGHJ', 'La Petite Robe Noire');
INSERT INTO Promotions VALUES ('AQSET', 'Flower');
INSERT INTO Promotions VALUES ('POLMV', 'Chloé Signatur');
INSERT INTO Promotions VALUES ('KJIOP', 'Shalimar');
INSERT INTO Promotions VALUES ('WNKUF', 'Miss Dior');
INSERT INTO Promotions VALUES ('UIERS', 'Black Opium');
INSERT INTO Promotions VALUES ('UYREZ', 'Armani');
INSERT INTO Promotions VALUES ('MKSAE', 'Poison');

--*-*-*-*-*-*-*-*-*-*- INSERNT INTO STOCKS TABLE *-*-*-*-*-*-*-*-*-*--
INSERT INTO Stocks VALUES (01, 'Absolu', 50, 03, 49.99);
INSERT INTO Stocks VALUES (01, 'La Vie est belle',100, 200, 99.99);
INSERT INTO Stocks VALUES (02, 'Mon Guerlain',200, 10, 25.99);
INSERT INTO Stocks VALUES (10, 'La Petite Robe Noire',500, 01, 14.99);
INSERT INTO Stocks VALUES (09, 'Flower',50, 50, 129.99);
INSERT INTO Stocks VALUES (09, 'Chloé Signatur',100, 20, 59.99);
INSERT INTO Stocks VALUES (10, 'Shalimar',200, 05, 144.99);
INSERT INTO Stocks VALUES (02, 'Miss Dior',500, 02, 299.99);
INSERT INTO Stocks VALUES (03, 'Black Opium',500, 10, 114.99);
INSERT INTO Stocks VALUES (04, 'Armani',100, 09, 124.99);
-- avec répétition
INSERT INTO Stocks VALUES (01, 'Absolu', 100, 22, 111.80);
INSERT INTO Stocks VALUES (01, 'La Vie est belle',200, 23, 128.99);
INSERT INTO Stocks VALUES (02, 'Mon Guerlain',500, 14, 149.99);
INSERT INTO Stocks VALUES (10, 'La Petite Robe Noire',50, 7,25.99);
INSERT INTO Stocks VALUES (01, 'Flower',100, 08,250.99);
INSERT INTO Stocks VALUES (09, 'Chloé Signatur',200, 01, 44.99);
INSERT INTO Stocks VALUES (10, 'Shalimar',100, 12, 89.99);
INSERT INTO Stocks VALUES (02, 'Miss Dior',50, 13, 139.99);
INSERT INTO Stocks VALUES (03, 'Black Opium',200, 02,79.99);
INSERT INTO Stocks VALUES (04, 'Armani',500, 1,89.99);

INSERT INTO Stocks VALUES (10, 'Armani',50, 10, 99.9);
INSERT INTO Stocks VALUES (02, 'J''adore', 50, 1, 199.9);
INSERT INTO Stocks VALUES (02, 'Joy de Dior', 100, 12, 299.9);
INSERT INTO Stocks VALUES (05, 'Poison',500, 25, 199.9);
INSERT INTO Stocks VALUES (08, 'Les Escales de Dior', 200, 45, 99.9);
INSERT INTO Stocks VALUES (09, 'Dior Addict',100, 2, 99.9);
INSERT INTO Stocks VALUES (09,  'Dune',50, 13, 99.9);
INSERT INTO Stocks VALUES (10, 'Dolce Vita.', 500, 25, 128.99);
INSERT INTO Stocks VALUES (10, 'Armani',100, 10, 200.0);
INSERT INTO Stocks VALUES (02, 'J''adore', 500, 1, 88.99);
INSERT INTO Stocks VALUES (02, 'Joy de Dior', 200, 12, 79.99);
INSERT INTO Stocks VALUES (05, 'Poison',100, 25, 69.99);
INSERT INTO Stocks VALUES (08, 'Les Escales de Dior', 500, 45, 129.99);
INSERT INTO Stocks VALUES (09, 'Dior Addict',50, 2, 124.99);
INSERT INTO Stocks VALUES (09,  'Dune',500, 13, 124.99);
INSERT INTO Stocks VALUES (10, 'Dolce Vita.', 100, 25, 128.99);

--*-*-*-*-*-*-*-*-*-*- INSERNT INTO FREQUENTES TABLE *-*-*-*-*-*-*-*-*-*--
INSERT INTO Frequentes VALUES (01, 'Alsabr', 'Ibrahim', '03-03-2022');
INSERT INTO Frequentes VALUES (01, 'Riado', 'Bastien', '05-05-2020');
INSERT INTO Frequentes VALUES (02, 'Martin', 'Marie', '25-07-2020');
INSERT INTO Frequentes VALUES (03, 'Thomas', 'Julie', '12-18-2022');
INSERT INTO Frequentes VALUES (03, 'Durand', 'Sophie', '11-11-2022');
INSERT INTO Frequentes VALUES (10, 'Dubois', 'Louis', '25-07-2020');
INSERT INTO Frequentes VALUES (02, 'Laurent', 'Hugo', '01-09-2021');
INSERT INTO Frequentes VALUES (05, 'Simon', 'Rose', '25-07-2020');
INSERT INTO Frequentes VALUES (07, 'Leroy', 'Chloé', '25-07-2020');
INSERT INTO Frequentes VALUES (08, 'Roux', 'Paul', '02-01-2025');

--*-*-*-*-*-*-*-*-*-*- INSERNT INTO VALIDITES TABLE *-*-*-*-*-*-*-*-*-*--
INSERT INTO Validites VALUES ('Absolu', 50, 'LCDHB', 75, '02-02-2023');
INSERT INTO Validites VALUES ('La Petite Robe Noire', 100, 'WNKUF', 50, '02-02-2023');
INSERT INTO Validites VALUES ('La Vie est belle', 200, 'KJIOP', 40, '02-02-2023');
INSERT INTO Validites VALUES ('Mon Guerlain',500, 'QSDFG', 25, '02-02-2023');
INSERT INTO Validites VALUES ('Flower',100, 'RFGHJ', 25, '02-02-2023');
INSERT INTO Validites VALUES ('Chloé Signatur',200, 'RFGHJ', 80, '02-02-2023');
INSERT INTO Validites VALUES ('Shalimar',100,  'RFGHJ', 20, '02-02-2023');
INSERT INTO Validites VALUES ('Miss Dior',50 ,'UIERS', 40, '02-02-2023');
INSERT INTO Validites VALUES ('Black Opium', 100, 'UIERS', 30, '02-02-2023');
INSERT INTO Validites VALUES ('Armani', 50, 'AQSET', 20,'02-02-2023');
INSERT INTO Validites VALUES ('Poison', 50, 'MKSAE', 20,'2022-05-12');



