#!/usr/bin/python3

from utils import db
from reqeutes import *

def main():
    # Nom de la BD à créer
    db_file = "data/Parfumerie.db"

    # Créer une connexion a la BD
    conn = db.creer_connexion(db_file)

    # Remplir la BD
    print("1. On crée la bd et on l'initialise avec des premières valeurs.")

    db.mise_a_jour_bd(conn, 'data/creation_tables.sql')

    db.mise_a_jour_bd(conn, "data/insert_ok.sql")

    affichage(conn)

if __name__ == "__main__":
    main()
