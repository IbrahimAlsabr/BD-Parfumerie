# --*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--* #
#                                  Université Grenoble Alpes                              #
#                                      Projet Parfumerie                                  #
#                                          Fait Par                                       #
#                               Alsabr Ibrahim - Riado Bastien                            #
# --*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--* #

from colorama import Fore

def requete(req, conn):
    cur = conn.cursor()
    cur.execute(req)
    rows = cur.fetchall()
    for row in rows:
        print(row)


def select_tout_from_table(table, connexion):
    requete("SELECT * FROM '%s'"%(table), connexion)

def select_tous_les_Magasins(connexion):
    """
    Affiche la liste de tous les Magasins.
    :param connexion: Connexion a la base de donnees
    """
    print("Voci la liste de tous les Magasins\n")
    requete("SELECT * FROM Magasins", connexion)


def parfums_de_Marque(marque, connexion):
    """
     Afficher la liste de tous les parfums qui sont fabrique par une marque
    :param marque: Marque choisie
    """
    print("Voici tous les parfums qui sont fabrique par %s\n" %(marque))
    requete(""" SELECT nom
                FROM Parfums
                WHERE nom_marque == '%s';"""%(marque), connexion)


def parfum_de_maqrue_dans_magasin_precis(marque, magasin, connexion):
    """
    Afficher la liste de tous les parfaums fabrique par une marque
    et qui sont stockes dans le magasin (code magasin)
    :param marque: Marque de parfum
    :param magasin: code de magasin
    """
    print("Voici tous les parfums qui sont fabrique par '%s' dans le magasin '%s'\n" %(marque, magasin))
    requete("""
            SELECT nom_parfum
            FROM Stocks
            WHERE code_magasin == %d
            INTERSECT
            SELECT nom
            FROM Parfums
            WHERE nom_marque == '%s';            
            """%(magasin,marque), connexion)


def tous_les_parfums_de_magasin(adresse, connexion):
    """
        Afficher tous les parfums d'un magasin a une
        adresse precise (adresse) avec leur prix et leur volumes
    """
    print("Voici tous les parfums avec leur volume et prix dans le magasin a cette adresse la '%s'\n" %(adresse))
    requete("""
                SELECT nom_parfum, prix, volume_parfum
                FROM Stocks JOIN Magasins M ON Stocks.code_magasin = M.code
                WHERE adresse = '%s';
            """%(adresse), connexion)


def nom_prenom_nomParPref_de_client_frequante_magasin(codeMagasin, connexion):
    """
    :param magasin: Code de Magasin
    :param connexion: Connexion au base de donnee
    :return: nom, prenom, nomParfumPrefere, marque
    
    Afficher Les noms, prenoms, noms parfums preferes 
    avec ses marques des clients qui frequantent le magasin '?'
    """
    print("Voive le nom, prenom, et parfum prefere des cliens qui frequante le magasin '%s'\n"%(codeMagasin))
    requete("""
                SELECT f.nom_client, f.prenom_client, c.nom_parfum_prefe
                FROM Frequentes f JOIN Clients c ON ( f.nom_client = c.nom AND f.prenom_client = c.prenom)
                JOIN Parfums p ON ( c.nom_parfum_prefe = p.nom)
                WHERE code_magasin = %s;
            """%(codeMagasin), connexion)


def nombre_de_parfum_reduit_avec_code(codePromo, connexion):
    """
    Le nombre des parfums avec un prix reduit en utiliant le code Promo '?'

    :param codePromo: Code Promotion
    :param conneion: connexion base de donnee
    :return: nombre des parfums en promo
    """
    try:
        print("Voici le nombre des parfums reduits avec le codePromo '%s'\n"%(codePromo))
        requete("""
                SELECT count(code_promotion)
                FROM Validites
                WHERE code_promotion = '%s';
                """%(codePromo), connexion)
    except:
        print("codePromo inconnu !")

def tous_codePromo_seTerminent_a_date(date, connexion):
    """
    Afficher tous le code promo qui se termminent a une date precise
    :param date: date
    :param connexion: connexion base de donnee
    """
    print("Voice tous les codePromo qui se terminet a cette date '%s'\n"%(date))
    requete("""
            SELECT DISTINCT code_promotion
            FROM Validites
            WHERE valide_jusqua == '%s';
            """%(date), connexion)


def code_promo_en_cours(connexion):
    """
    Afficher tous les codes promo actuellement valide sur le marché
    :param connexion: connexion base de donnée
    :return: codes valides
    """
    print("voici la liste des codes valide à l'heure actuel:\n")
    requete("SELECT code_promotion FROM Validites",connexion)


def toutes_les_marques(connexion):
    """
    Afficher toutes les marques répertoriées dans la base de donnée
    :param connexion: connexion base de donnée
    :return: marques
    """
    print("voici toutes les marques qui proposent un service:\n")
    requete("SELECT nom FROM Marques",connexion)
    

def tous_les_parfums(connexion):
    """
    Affiche tous les parfums proposés par l'entreprise
    :param: connexion: connexion base de données
    """
    print("voici tous les parfums disponibles, tous magasins confondus:\n")
    requete("SELECT nom FROM Parfums", connexion)

def toutes_adresse_marque(conn):
    requete("""
                SELECT adresse FROM Marques;
            """, conn)

def toutes_les_adresses(connexion):
    """
    Afficher toutes les adresse des magasins répertoriées dans la base de donnée
    :param connexion: connexion base de donnée
    :return: adresse
    """
    print("Voici toutes les adresses des magasins :\n")
    requete("SELECT adresse FROM Magasins",connexion)

def affichage(connexion):
    while True :
        try:
            num = int(input(Fore.CYAN+"""
                    1) Afficher tous les donnée d'un table précis .
                    2) Afficher la liste de tous les parfums qui sont fabrique par une marque precise.
                    3) Afficher la liste de tous les parfaums fabrique par une marque precise
                       et qui sont stockes dans un magasin precis .
                    4) Afficher tous les parfums d'un magasin a une adresse precise avec leur prix et leur volumes .
                    5) Afficher Les noms, prenoms, noms parfums preferes avec 
                       ses marques des clients qui frequantent le magasin precis.
                    6) Afficher Le nombre des parfums avec un prix reduit en utiliant un code promo precis .
                    7) Afficher tous le code promo qui se termminent a une date precise
                    8)  Afficher tous parfums .
                    9) Afficher tous les marques .
                    10) Quitter 
                """))

            if num == 1 :
                tabel = str(input("Entrer le nom de table."))
                select_tout_from_table(tabel,connexion)

            elif num == 2 :
                toutes_les_marques(connexion)
                marque = str(input("Quel est le nom de la marque ?"))
                parfums_de_Marque(marque, connexion)

            elif num == 3:
                toutes_les_marques(connexion)
                marque = str(input("Quel est le nom de la marque ?"))
                magasin = int(input("Quel est le code du magasin ?"))
                parfum_de_maqrue_dans_magasin_precis(marque, magasin, connexion)

            elif num == 4:
                toutes_les_adresses(connexion)
                adresse = str(input("Quelle est l'adresse ?"))
                tous_les_parfums_de_magasin(adresse, connexion)

            elif num == 5:
                codeMagasin = int(input("Quel est le code du magasin ? (entre 1 et 10)"))
                nom_prenom_nomParPref_de_client_frequante_magasin(codeMagasin, connexion)

            elif num == 6:
                code_promo_en_cours(connexion)
                codePromo = str(input("Lequel choisissez vous ?"))
                nombre_de_parfum_reduit_avec_code(codePromo, connexion)

            elif num == 7:
                date = str(input("Quelle est la date ?"))
                tous_codePromo_seTerminent_a_date(date, connexion)

            elif num == 8 :
                tous_les_parfums(connexion)

            elif num == 9:
                toutes_les_marques(connexion)

            elif num == 10:
                print("Au revoir !!\n")
                break

            else:
                print("Erreur !\n")
        except:
                print(Fore.RED + 'Il faut choisir une requette parmi les suivants !')
