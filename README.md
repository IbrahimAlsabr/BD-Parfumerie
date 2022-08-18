
# BD Parfumerie
Il s'agit d'un projet de base de donnée de l'UE INF403 pour le parcours Informatiqe de déuxième année à l'université Grenoble Alpes.

## Tableau De Contenu
- [Aperçu](#aperçu)
    - [problématique](problématique)
    - [Modèle UML](#modèle-uml)
    - [Modèle Relationnel](#links)

- [Installation de l'environnement](#installation-de-l'environnement)
    - [Windows](#windows)
    - [Linux](#linux)

- [Préparation du projet](#préparation-du-projet)

- [Utilisation](#utilisation)
    - [Utilisation non-interactive](#utilisation-non-interactive)
    - [Utilisation interactive](#utilisation-interactive)
    - [Utilisation d'un IDE](#utilisation-d'un-ide)

- [Notre Travail](#notre-travail)
  - [Autour Fichiers](#autour-fichiers)
  - [Créer avec](#créer-avec)
  - [Resources et outils utiles](#resources-et-outils-utiles)

- [Author](#author)

- [Acknowledgments](#acknowledgments)


## Aperçu
### problématique
Une haute entreprise de commerce de parfums a informatisé ses données :
produits en stock, magasins, clients, promotions, etc. La base de données a été
construite sous la forme suivante :<br>

<b style="color: #15adc0">Les Magasins :</b>
Cette entreprise possède plusieurs magasins répartis sur différentes régions,
chaque magasin est connu par un code le désignant, et une adresse postale. Il
possède un certain stock de parfums et ses clients.<br>

<b style="color: #15adc0">Les Parfums :</b>
Le parfum est reconnu par un nom unique. Chaque parfum a une marque, un
volume, un prix, et un magasin où il est présent en une certaine quantité. Le
parfum peut figurer plusieurs fois, mais dans différents magasins et/ou sous
différents volumes.

<b style="color: #15adc0">Les Clients :</b>
Un client est identifié par son nom et son prénom, auquel on ajoute sa date de
naissance et son adresse. Il fréquente un ou plusieurs magasins. On note la date
de sa dernière fréquentation par magasin. Chaque client peut déclarer ou non un
parfum préféré (pour par exemple être notifié en cas de réapprovisionnement
des stocks, ou d’une nouvelle version exclusive du parfum entrant sur le
marché). Un client est enregistré dans la base de données après une première
visite dans un des magasins.

<b style="color: #15adc0">Les Promotions :</b>
Tous les magasins appliquent ou non des promotions sur ces produits (au sein
de l’entreprise entière). La promotion est identifiée par un code PROMO, un
pourcentage, le nom du produit/parfum sur lequel la promotion est applicable.
Un produit possède un code promo maximum (pourcentage et validité
modifiable) et chaque code promo présent dans la base de donnée est valide
(suppression automatique en fin de validité).

<b style="color: #15adc0">Les Marques :</b>
Les grandes marques sont reconnues à part, par leurs noms, avec leurs adresses,
leurs numéros de téléphone et les délais de livraison en jours (ce qui facilite le
placement de commandes).

### Modèle UML
- Live UML en Visual Paradigm : [here](https://online.visual-paradigm.com/app/diagrams/#diagram:proj=0&external=https://pblemraton.uk-01.visual-paradigm.com/rest/diagrams/shares/diagram/ed46cf6f-4949-4ce9-83a5-3e1dda51a10f/content&name=SQL-Parfumerie%20)

![UML](doc/img//modele-uml.jpg?raw=true")


### Modèle Relationnel
- Le fichier de Modèle Relationnel : [here](https://docs.google.com/document/d/1Cw8bvpX4cFWQaRBacey5u0Fc2OANktySvvRoH40Ka3U/edit?usp=sharing)


## Installation de l'environnement
### Windows 
Installer Python 3 avec l'installeur disponible sur le site officiel:
* 64 bits (à préférer): https://www.python.org/ftp/python/3.9.2/python-3.9.2-amd64.exe
* 32 bits (au cas où): https://www.python.org/ftp/python/3.9.2/python-3.9.2.exe

Suivre les étapes de l'installeur. S'assurer que l'option "Ajouter à la
variable d'environnement PATH" est bien cochée.

### Linux
#### Debian/Ubuntu

Dans un terminal:

    sudo apt install -y python3 libsqlite3-dev

## Préparation du projet
Une fois Python installé, il faut installer les dépendances du projet (module
Python SQLite3). Dans un terminal, une fois dans le dossier extrait de
l'archive source:

    pip install --user -r requirements.txt

## Utilisation
Il est possible d'utiliser le code de ce projet de deux façons.

### Utilisation non-interactive
Dans un terminal:

    python3 main.py

Cela va exécuter la méthode main contenue dans le script `main.py`.

### Utilisation interactive 
Dans un terminal, on peut exécuter `python3`, puis entrer le code nécessaire à
l'exécution des différentes requêtes. C'est pratique pour faire des tests
rapides:

    $ python3
    Python 3.9.2 (default, Feb 20 2021, 00:00:00)
    [GCC 10.2.1 20201125 (Red Hat 10.2.1-9)] on linux
    Type "help", "copyright", "credits" or "license" for more information.
    >>> import main
    >>> from utils import db
    >>> db_file = "data/voile.db"
    >>> conn = db.creer_connexion(db_file)
    >>> main.select_tous_les_bateaux(conn)
    (1, '2013-04-13', 'Pirate', 1005)
    (2, '2011-04-07', 'Pirate', 1006)
    (3, '2017-04-07', 'Classique', 1007)
    >>> 

### Utilisation d'un IDE 
Vous pouvez travailler avec un IDE pour rendre plus facile la prise en main et production de code.

On vous conseille PyCharm (version libre Community) : 
https://www.jetbrains.com/pycharm/ 
Pour faire la liaison entre PyCharm et Python:

Add Configuration:
![config1](https://github.com/IbrahimAlsabr/BD-Parfumerie/blob/main/doc/img/config_pycharm1.PNG?raw=true") <hr>

Add New Configuration -> Python:
![config2](https://github.com/IbrahimAlsabr/BD-Parfumerie/blob/main/doc/img/config_pycharm2.PNG?raw=true") <hr>

Pointer vers main.py:
![config3](https://github.com/IbrahimAlsabr/BD-Parfumerie/blob/main/doc/img/config_pycharm3.PNG?raw=true") <hr>

Clicker sur Play pour exécuter le programme:
![config4](https://github.com/IbrahimAlsabr/BD-Parfumerie/blob/main/doc/img/config_pycharm4.PNG?raw=true")

## Notre Travail

### Autour Fichiers 
Ici, dans ce fichier [creation_tableaux.sql](/data/creation_tableaux.sql)  on a crée la base de données en respectant les contraintes imposés dans le UML ci-dessus .


Dans ce fichier [insert_ok.sql](/data/insert_ok.sql) on a testé la base de données crées en insérant des données correctement.


Et ici dans ce fichier [insert_not_ok.sql](/data/insert_not_ok.sql), on a testé la base de données crées en insérant des données incorrectement, pour vérifier que les contraintes imopsées sont bien respectées. 

Après lier notre base de données avec Python, dans ce fichier [reqeutes.py](/reqeutes.py) on a fait des requetes en les écrivant dans des fonctions qui sont appelées dans ce fichier [main.py](/main.py).

Ici, dans ce fichier [update_donnee.py](/update_donnee.py) , on a créé des requetes dans des fonctions pour mettre la possibilité de mettre à jour les données à travers Python. 


### Créer avec
[![HTML](https://img.shields.io/badge/SQLite-07405E?style=for-the-badge&logo=sqlite&logoColor=white)](https://www.sqlite.org/index.html) 

[![forthebadge made-with-python](http://ForTheBadge.com/images/badges/made-with-python.svg)](https://www.python.org/)


### Resources et outils utiles
- [SQL.sh](https://sql.sh/) 
- [Geeks for Geeks](https://www.geeksforgeeks.org/) 
- [Visual Paradigm Online](https://online.visual-paradigm.com/fr/)


## Author
<b> Ibrahim Alsabr </b>

[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/IbrahimAlsabr) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ibrahim-alsabr-188939231/)  [![Twitter](https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/home?lang=fr) <br>

<b>Bastien Riado </b>

## Acknowledgments
* [Université Grenoble Alpes](https://www.univ-grenoble-alpes.fr/)

* [Le prof de l'UE Mr Mario Cortes Cornax](https://www.linkedin.com/in/mariocortescornax/?originalSubdomain=fr)
