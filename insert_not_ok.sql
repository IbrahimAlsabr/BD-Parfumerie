-- --*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--
--                                  Université Grenoble Alpes                             --
--                                      Projet Parfumerie                                 --
--                                          Fait Par                                      --
--                               Alsabr Ibrahim - Riado Bastien                           --
-- --*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--

--*-*-*-*-*-*-*-*-*-*- INSERNT NOT OK FOR MAGASINS TABLE *-*-*-*-*-*-*-*-*-*--
-- Erreur : code Magasin déjà existant
INSERT INTO Magasins VALUES (01, 'Grand Place - 38100 Grenoble');

-- Erreur : Adresse déjà existant
INSERT INTO Magasins VALUES (04, 'AEROVILLE Rue des Buissons 93290 TREMBLAY-EN-FRANCE');

-- Erreur : Magasins sans code
INSERT INTO Magasins VALUES (NULL, 'adres');

-- Erreur : Magasins sans adresse
INSERT INTO Magasins VALUES (01, NULL);

--*-*-*-*-*-*-*-*-*-*- INSERNT NOT OK FOR MARQUES TABLE *-*-*-*-*-*-*-*-*-*--
-- Erreur :  Marque avec nom existant
INSERT INTO Marques VALUES ('Rochas', 'adrs-1', '0456231782', 3);

-- Erreur :  Marque sans nom
INSERT INTO Marques VALUES (NULL, 'adrs-1', '0456231782', 3);

-- Erreur : marque sans numéro de telephone
INSERT INTO Marques VALUES ('Guerlain', 'adrs-2', NULL, 10);

-- Erreur : Marque sans delai_liv
INSERT INTO Marques VALUES ('Lancôme', 'adrs-3', '0956231741', NULL);

-- Erreur : Marque avec delai_liv négative
INSERT INTO Marques VALUES ('Lancôme', 'adrs-3', '0956231741', -1);

--*-*-*-*-*-*-*-*-*-*- INSERNT NOT OK FOR PARFUMS TABLE *-*-*-*-*-*-*-*-*-*--
-- Erreur :  Manque des valuers
INSERT INTO Parfums VALUES ('Absolu');

-- Erreur : parfum déjà existant
INSERT INTO Parfums VALUES ('La Petite Robe Noire', 'Guerlain', 149.99);

-- Erreur : parfum sans nom
INSERT INTO Parfums VALUES (NULL, 'Guerlain', 149.99);

-- Erreur : parfum sans nom marque
INSERT INTO Parfums VALUES ('La Petite Robe Noire', NULL, 149.99);

-- Erreur : parfum sans prix
INSERT INTO Parfums VALUES ('La Petite Robe Noire', 'Guerlain', NULL);

-- Erreur :  prix moins ou égale à 0
INSERT INTO Parfums VALUES ('La Vie est belle', 'Lancôme',-2);
INSERT INTO Parfums VALUES ('La Vie est belle', 'Lancôme', 0);

-- Erreur : marque inconnu (mal reference)
INSERT INTO Parfums VALUES ('Mon Guerlain', 'Awod', 99.99);

--*-*-*-*-*-*-*-*-*-*- INSERNT NOT OK FOR CLIENTS TABLE *-*-*-*-*-*-*-*-*-*--
-- Manques de valeurs
INSERT INTO Clients VALUES ('Alsabr', 'Ibrahim', '01-01-1999');

-- Erreur : client sans adresse
INSERT INTO Clients VALUES ('Riado', 'Bastien', '22-02-2001', NULL, 'Glossier You');

-- Erreur : nom et prenon (PRIMARY KEY) déjà existants
INSERT INTO Clients VALUES ('Alsabr', 'Ibrahim', '30-08-1987', 'adres-3', 'Daisy Eau de Toilette');

-- Erreur : nom parfum pref n'est pas dans la table "Parfums"
INSERT INTO Clients VALUES ('Alsabr', 'Sami', '12-18-2001', 'adres-4', 'yyyy'); -- A VOIR

--*-*-*-*-*-*-*-*-*-*- INSERNT NOT OK FOR PROMOTIONS TABLE *-*-*-*-*-*-*-*-*-*--
-- Erreur : Promotions sans code promo
INSERT INTO Promotions VALUES (NULL, 'Absolu');

-- Erreur : Promotions sans nom de parfum
INSERT INTO Promotions VALUES ('CDFES', NULL);

-- Erruer :  Promotions avec code promo déjà existé
INSERT INTO Promotions VALUES ('QSDFG', 'Mon Guerlain');

--*-*-*-*-*-*-*-*-*-*- INSERNT NOT OK FOR STOCKS TABLE *-*-*-*-*-*-*-*-*-*--
-- Erreur : Stocks sans code magasin
INSERT INTO Stocks VALUES (null, 'Absolu', 50, 03);

-- Erreur : code magasin (primary key) existant
INSERT INTO Stocks VALUES (01, 'La Vie est belle',100, 200);

-- Erreur : nom parfum null
INSERT INTO Stocks VALUES (02, null,200, 10);

-- Erreur : nom parfum (primary key) existant
INSERT INTO Stocks VALUES (10, 'La Petite Robe Noire',500, 01);

-- Erreur : volume null
INSERT INTO Stocks VALUES (09, 'Flower',null, 50);

-- Erreur : volume (primary key) existant
INSERT INTO Stocks VALUES (09, 'Chloé Signatur',100, 20);

-- Erreur : volume n'est pas dans ENUM TypeVolume {50,100,200,500}
INSERT INTO Stocks VALUES (09, 'Chloé Signatur',888, 20);

-- Erreur : code magasin inconnu (mal reference)
INSERT INTO Stocks VALUES (99, 'Shalimar',200, 999); -- A VOR

-- Erreur : parfumn inconnu (mal reference)
INSERT INTO Stocks VALUES (02, 'for test',500, 02); -- A VOIR

--*-*-*-*-*-*-*-*-*-*- INSERNT NOT OK FOR FREQUENTES TABLE *-*-*-*-*-*-*-*-*-*--
-- Erreur : code Magasin OU nom client OU prenom client (primary key) sont nulls
INSERT INTO Frequentes VALUES (NULL, 'Alsabr', 'Ibrahim', '2022-03-03');
INSERT INTO Frequentes VALUES (01, NULL, 'Bastien', '2020-05-05');
INSERT INTO Frequentes VALUES (02, 'Martin', NULL, '25-07-2020');

-- Erreur : code Magasin, nom client, prenom client (primary key) sont déjà existants
INSERT INTO Frequentes VALUES (03, 'Thomas', 'Julie', '12-18-2022');
INSERT INTO Frequentes VALUES (03, 'Durand', 'Sophie','11-11-2022');
INSERT INTO Frequentes VALUES (10, 'Dubois', 'Louis', '25-07-2020');

-- Erreur : code magasin inconnu (Mal Reference)
INSERT INTO Frequentes VALUES (99, 'Simon', 'Rose', '25-07-2020');

-- Erreur : nom client inconnu (Mal Reference)
INSERT INTO Frequentes VALUES (01, 'nom_1', 'Julie', '01-09-2021');

-- Erreur : prenom client inconnu (Mal Reference)
INSERT INTO Frequentes VALUES (07, 'Leroy', 'prenom_1', '25-07-2020');

--*-*-*-*-*-*-*-*-*-*- INSERNT NOT OK FOR VALIDITES TABLE *-*-*-*-*-*-*-*-*-*--
-- Erreur : nom parfum (primary key) null
INSERT INTO Validites VALUES (null, 50, 'LCDHB', 75, '02-02-2023');

-- Erreur : nom parfum (primary key) déjà existant
INSERT INTO Validites VALUES ('La Petite Robe Noire', 100, 'WNKUF', 50, '02-02-2023'  );

-- Errueur : volume hors enum TypeVolume {50,100,200,500}
INSERT INTO Validites VALUES ('La Vie est belle', 444, 'KJIOP', 40, '02-02-2023');

-- Erreur : code promo OU pourcentage OU valideJusqua nulls
INSERT INTO Validites VALUES ('Mon Guerlain',500, NULL, 25, '02-02-2023');
INSERT INTO Validites VALUES ('Flower',100, 'RFGHJ', NULL, '02-02-2023');
INSERT INTO Validites VALUES ('Chloé Signatur',200, 'RFGHJ', 80, NULL);

-- Erreur :  nom parfum inconnu (Mal Reference)
INSERT INTO Validites VALUES ('parfum_1',100,  'RFGHJ', 20, '02-02-2023');

-- Erreur : code promo inconnu (Mal Reference)
INSERT INTO Validites VALUES ('parfum',50 ,'TEST', 40, '02-02-2023');


