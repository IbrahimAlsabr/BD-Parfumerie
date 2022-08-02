# --*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--* #
#                                  Université Grenoble Alpes                              #
#                                      Projet Parfumerie                                  #
#                                          Fait Par                                       #
#                               Alsabr Ibrahim - Riado Bastien                            #
# --*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--* #

#!/usr/bin/python3
from colorama import Fore
from utils import db
from reqeutes import *
from update_donnee import modifer_les_donnee

def main():
    # Nom de la BD à créer
    db_file = "data/Parfumerie.db"

    # Créer une connexion a la BD
    conn = db.creer_connexion(db_file)

    # Remplir la BD
    # print("1. On crée la bd et on l'initialise avec des premières valeurs.")

    db.mise_a_jour_bd(conn, 'data/creation_tables.sql')

    db.mise_a_jour_bd(conn, "data/insert_ok.sql")

    while True :
        chois = str(input(Fore.GREEN+""" Pour faire des requettes : tapez r OU R 
                     et pour mettre à jour la base de donnée Tapez M OU m  
                    """))
        try :
            if chois == 'r' or chois == 'R':
                affichage(conn)
            elif chois == 'M' or chois == 'm':
                modifer_les_donnee(conn)
            else :
                print(Fore.Red+"Erreur !!")
        except:
            print(Fore.RED+"Il faut choisir une choix parmi les deux suivant !")

if __name__ == "__main__":
    main()
