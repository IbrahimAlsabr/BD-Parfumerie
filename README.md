Position du problème :

Une haute entreprise de commerce de parfums a informatisé ses données : produits en stock, magasins, clients, promotions, etc. La base de données a été construite sous la forme suivante :

  Les Magasins :
  Cette entreprise possède plusieurs magasins répartis sur différentes régions, chaque magasin est connu par un code le désignant, et une adresse postale. Il possède un certain stock de parfums et ses clients. 
  Les Parfums :
Le parfum est reconnu par un nom unique. Chaque parfum a une marque, un volume, un prix, et un magasin où il est présent en une certaine quantité. Le parfum peut figurer plusieurs fois, mais dans différents magasins et/ou sous différents volumes. 
  Les Clients :
Un client est identifié par son nom et son prénom, auquel on ajoute sa date de naissance et son adresse. Il fréquente un ou plusieurs magasins. On note la date de sa dernière fréquentation par magasin. Chaque client peut déclarer ou non un parfum préféré (pour par exemple être notifié en cas de réapprovisionnement des stocks, ou d’une nouvelle version exclusive du parfum entrant sur le marché). Un client est enregistré dans la base de données après une première visite dans un des magasins.
  Les Promotions :
Tous les magasins appliquent ou non des promotions sur ces produits (au sein de l’entreprise entière). La promotion est identifiée par un code PROMO, un pourcentage, le nom du produit/parfum sur lequel la promotion est applicable. Un produit possède un code promo maximum (pourcentage et validité modifiable) et chaque code promo présent dans la base de donnée est valide (suppression automatique en fin de validité).
  Les Marques :
Les grandes marques sont reconnues à part, par leurs noms, avec leurs adresses, leurs numéros de téléphone et les délais de livraison en jours (ce qui facilite le placement de commandes).
