# --*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--* #
#                                  Université Grenoble Alpes                              #
#                                      Projet Parfumerie                                  #
#                                          Fait Par                                       #
#                               Alsabr Ibrahim - Riado Bastien                            #
# --*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--* #

from colorama import Fore
from reqeutes import *

def update_table(update, conn):
    cur = conn.cursor()
    cur.execute(update)

def update_adresse_magasin(nAdresse, AncienAdresse, connexion):
    try :
        update_table("""
                        UPDATE
                        Magasins
                        SET
                        adresse = '%s'
                        WHERE
                        adresse == '%s';
                    """%(nAdresse, AncienAdresse),connexion)
    except:
        print("Erreur !!")


def update_adresse_marque(nAdresse, AncienAdresse, connexion):
    update_table("""
                    UPDATE
                    Marques
                    SET
                    adresse = '%s'
                    WHERE
                    adresse == '%s';
                """%(nAdresse, AncienAdresse),connexion)


def update_parfum_pref_pour_client(nom, prenom, nParfumPref, connexion):
    update_table("""
                    UPDATE
                    Clients
                    SET
                    nom_parfum_prefe = '%s'
                    WHERE
                    nom == '%s' AND prenom = '%s';
                """%(nParfumPref,nom,prenom),connexion)


def update_adresse_pour_client(nom, prenom, nAdresse, connexion):
    update_table("""
                    UPDATE
                    Clients
                    SET
                    adresse = '%s'
                    WHERE
                    nom == '%s' AND prenom = '%s';
                """%(nAdresse,nom,prenom),connexion)


def modifer_prix_de_parfum(nom_parfum, volume_parfum, nPrix, conn):
    update_table("""
                    UPDATE
                    Stocks
                    SET
                    prix = %f
                    WHERE
                    nom_parfum == '%s' AND volume_parfum = %d;
                """%(nPrix,nom_parfum,volume_parfum),conn)


def ajout_parfum_pref(connexion):
    """
    Permet a un client d'ajouter manuelement son parfum prefere dans la base de donnée
    :param parfums: input du client
    :param connexion: connexion base de donnée
    :return: ajout du parfum prefere du client
    """
    print("il nous faut vos identifiants pour cela, (exemple: Durand Amelie)")
    nom = input("quel est votre nom : ")
    prenom = input("et votre prenom : ")
    parfum_pref = input("Parmis les parfums proposés, avez-vous une préférence pour l'un d'entre eux?\n")
    nb_par = update_table("SELECT COUNT(nom) FROM Parfums WHERE nom = '%s'"%parfum_pref, connexion)
    if nb_par != None:
        update_table("UPDATE Clients SET nom_parfum_prefe = '%s' WHERE nom = '%s' AND prenom = '%s'"%(parfum_pref, nom, prenom), connexion)
        print("Merci, votre avis a bien été enregistré")
    else:
        print("Nom et Prenom incorrects ou le parfum n'est pas dans la liste de nos magasins")


def modifer_les_donnee(conn):
    try:
        num = int(input(Fore.CYAN+"""
                1) Modifier l'adresse d'un magasin. 
                2) Modifier l'adresse d'une marque.
                3) Modifier le nom de parfum d'un client .
                4) Modifier l'adresse d'un client.
                5) Modifier le prix d'un parfum a un volume précis.
                6)  Quitter
                
            """))
        if num == 1 :
            toutes_les_adresses(conn)
            aAdr = str(input("Quelle est l'ancient adresse ?"))
            nAdr = str(input("Quelle est la nouveau adresse ?"))
            update_adresse_magasin(nAdr, aAdr, conn)

        elif num == 2 :
            toutes_adresse_marque(conn)
            AncienAdresse = str(input("Quelle est l'ancient adresse ?"))
            nAdresse = str(input("Quelle est la nouveau adresse ?"))
            update_adresse_marque(nAdresse, AncienAdresse, conn)

        elif num == 3:
            tous_les_parfums(conn)
            ajout_parfum_pref(conn)

        elif num == 4:
            nom = str(input("Quel le nom de client ?"))
            prenom = str(input("Quel est le prenom de client ?"))
            nAdresse = str(input("Quelle est la nouveau adresse ?"))
            update_adresse_pour_client(nom, prenom, nAdresse, conn)

        elif num == 5:
            nom_parfum = str(input("Quel est le nom de parfum ?"))
            volume_parfum = str(input("Quel es le volume ?"))
            nPrix = float(input("Entrez le nouveau prix "))
            modifer_prix_de_parfum(nom_parfum, volume_parfum, nPrix, conn)
        elif num == 6:
            print("Au revoir !!")

        else:
            print("Erreur !\n")

    except:
        print(Fore.RED + 'Il faut choisir une requette parmi les suivants !')
