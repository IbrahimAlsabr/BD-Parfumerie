-- Nom et Prenom de tous les clients qui ont un parfum préféré
SELECT nom, prenom
FROM Clients
WHERE nom_parfum_prefe != '' ;

-- Tous les noms des parfums qui sont pabriqués par 'Dior'
SELECT nom
FROM Parfums
WHERE nom_marque == 'Dior';

-- Tous les parfums qui sont fabriqué par la marque 'Dior' et qui sont stocké par le magasin '10'
SELECT DISTINCT nom_parfum
FROM Stocks
WHERE ( nom_parfum IN (
    SELECT nom
    FROM Parfums
    WHERE nom_marque == 'Dior') AND code_magasin == 10);

-- Autre méthode en utilisant "INTERSECT"
SELECT nom_parfum
FROM Stocks
WHERE code_magasin == '10'
INTERSECT
SELECT nom
FROM Parfums
WHERE nom_marque == 'Dior';

-- Tous les parfums qui sont vendu par le magasin à cette
-- adresse 'Grand Place - 38100 Grenoble' avec leur prix et leur volume
SELECT nom_parfum, prix, volume_parfum
FROM Stocks JOIN Magasins M ON Stocks.code_magasin = M.code
WHERE adresse = 'Grand Place - 38100 Grenoble';

-- Les noms, prenoms, noms parfums preférés avec ses marques des clients qui fréquantent le magasin '07'
SELECT f.nom_client, f.prenom_client, c.nom_parfum_prefe, p.nom_marque
FROM Frequentes f JOIN Clients c ON ( f.nom_client = c.nom AND f.prenom_client = c.prenom)
                  JOIN Parfums p ON ( c.nom_parfum_prefe = p.nom)
WHERE code_magasin = 07;

-- Le nombre des parfums avec un prix réduit en utiliant le code Promo 'RFGHJ'
SELECT count(code_promotion)
FROM Validites
WHERE code_promotion = 'RFGHJ';

-- Tous le code promo qui se termminent today
SELECT DISTINCT code_promotion
FROM Validites
WHERE valide_jusqua == date('now');

