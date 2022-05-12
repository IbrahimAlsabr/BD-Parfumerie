-- --*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--
--                                  Université Grenoble Alpes                             --
--                                      Projet Parfumerie                                 --
--                                          Fait Par                                      --
--                               Alsabr Ibrahim - Riado Bastien                           --
-- --*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--
DROP TABLE IF EXISTS Magasins;
DROP TABLE IF EXISTS Marques;
DROP TABLE IF EXISTS Parfums;
DROP TABLE IF EXISTS Clients;
DROP TABLE IF EXISTS Promotions;
DROP TABLE IF EXISTS Stocks;
DROP TABLE IF EXISTS Frequentes;
DROP TABLE IF EXISTS Validites;

PRAGMA FOREIGN_KEY=0;
CREATE TABLE Magasins (
	code            INTEGER NOT NULL,
	adresse         TEXT NOT NULL,
	CONSTRAINT pk_magasins_k0 PRIMARY KEY (code, adresse),
	CONSTRAINT uk_magasins_u0 UNIQUE (code)
);

CREATE TABLE Marques (
	nom             TEXT NOT NULL,
	adresse         TEXT NOT NULL,
	n_tel           TEXT NOT NULL,
	delai_liv 	    INTEGER NOT NULL CHECK ( delai_liv >= 0 ),
	CONSTRAINT pk_marques_k0 PRIMARY KEY (nom)
);

CREATE TABLE Parfums (
	nom         TEXT NOT NULL,
	nom_marque  TEXT NOT NULL,
	CONSTRAINT pk_parfums_k0 PRIMARY KEY (nom),
	CONSTRAINT fk_parfums_f0 FOREIGN KEY (nom_marque) REFERENCES Marques(nom)
);

CREATE TABLE Clients (
	nom                 TEXT NOT NULL,
	prenom              TEXT NOT NULL,
	date_naissance      DATE NOT NULL,
	adresse             TEXT NOT NULL,
	nom_parfum_prefe   TEXT,
	CONSTRAINT pk_clients_k0 PRIMARY KEY (nom,prenom),
	CONSTRAINT fk_clients_f0 FOREIGN KEY (nom_parfum_prefe) REFERENCES Parfums(nom)
);

CREATE TABLE Promotions (
	code            TEXT NOT NULL,
	nom_parfum      TEXT NOT NULL,
	CONSTRAINT pk_promotions_k0 PRIMARY KEY (code)
);

CREATE TABLE Stocks (
	code_magasin    INTEGER NOT NULL,
	nom_parfum      TEXT NOT NULL,
	volume_parfum   INTEGER NOT NULL,
	quantite        INTEGER NOT NULL,
	prix            REAL NOT NULL,
	CONSTRAINT pk_stocks_k0 PRIMARY KEY (code_magasin, nom_parfum, volume_parfum),
	CONSTRAINT fk_stocks_f0 FOREIGN KEY (code_magasin) REFERENCES Magasins(code),
	CONSTRAINT fk_stocks_f1 FOREIGN KEY (nom_parfum) REFERENCES Parfums(nom),
	CONSTRAINT ck_volume_c0 CHECK (volume_parfum IN (50, 100, 200, 500)),
	CONSTRAINT ck_prix_c1 	CHECK (prix > 0)
);

CREATE TABLE Frequentes (
	code_magasin    INTEGER NOT NULL,
	nom_client      TEXT NOT NULL,
	prenom_client   TEXT NOT NULL,
	der_freq        DATE NOT NULL, --CHECK ( DATE('now') > der_freq), -- A voir
	CONSTRAINT pk_frequentes_k0 PRIMARY KEY (code_magasin, nom_client, prenom_client),
	CONSTRAINT fk_frequentes_f0 FOREIGN KEY (code_magasin) REFERENCES Magasins(code),
	CONSTRAINT fk_frequentes_f1 FOREIGN KEY (nom_client, prenom_client) REFERENCES Clients(nom, prenom)
);

CREATE TABLE Validites (
	nom_parfum        TEXT NOT NULL ,
	volume_parfum     INTEGER NOT NULL,
	code_promotion    INTEGER NOT NULL,
	pourcentage       INTEGER NOT NULL,
	valide_jusqua     DATE NOT NULL,
	CONSTRAINT pk_validites_k0 PRIMARY KEY (nom_parfum),
	CONSTRAINT fk_validites_f0 FOREIGN KEY (nom_parfum) REFERENCES Parfums(nom),
	CONSTRAINT fk_validites_f1 FOREIGN KEY (code_promotion) REFERENCES Promotions(code),
	CONSTRAINT ck_volume_c1 CHECK (volume_parfum IN (50, 100, 200, 500))
    --CONSTRAINT ck_date_c0 CHECK (DATE('now') <= valide_jusqua) --- A VOIR !!
);

INSERT INTO Magasins VALUES (01, '24 pl Halles, 67000 Strasbourg');
INSERT INTO Magasins VALUES (02, 'Grand Place - 38100 Grenoble');