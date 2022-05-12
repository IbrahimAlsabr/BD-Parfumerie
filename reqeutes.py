
def requete(req, conn):
    cur = conn.cursor()
    cur.execute(req)
    rows = cur.fetchall()

    for row in rows:
        print(row)


def select_tous_les_Magasins(connexion):
    """
    Affiche la liste de tous les Magasins.
    :param connexion: Connexion à la base de données
    """
    print("Voci la liste de tous les Magasins\n")

    requete("SELECT * FROM Magasins", connexion)


def parfums_de_Marque(marque, connexion):
    """
     Afficher la liste de tous les parfums qui sont fabriqué par une marque
    :param marque: Marque choisie
    """
    print("Voici tous les parfums qui sont fabriqué par %s\n" %(marque))
    requete(""" SELECT nom
                FROM Parfums
                WHERE nom_marque == '%s';"""%(marque), connexion)


def parfum_de_maqrue_dans_magasin_precis(marque, magasin, connexion):
    """
    Afficher la liste de tous les parfaums fabriqué par une marque
    et qui sont stockés dans le magasin (code magasin)
    :param marque: Marque de parfum
    :param magasin: code de magasin
    """
    print("Voici tous les parfums qui sont fabriqué par '%s' dans le magasin '%s'\n" %(marque, magasin))
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
        Afficher tous les parfums d'un magasin à une
        adresse précise (adresse) avec leur prix et leur volumes
    """
    print("Voici tous les parfums avec leur volume et prix dans le magasin à cette adresse là '%s'\n" %(adresse))
    requete("""
                SELECT nom_parfum, prix, volume_parfum
                FROM Stocks JOIN Magasins M ON Stocks.code_magasin = M.code
                WHERE adresse = '%s';
            """%(adresse), connexion)

def nom_prenom_nomParPref_de_client_frequante_magasin(codeMagasin, connexion):
    """
    
    :param magasin: Code de Magasin
    :param connexion: Connexion au base de donnée
    :return: nom, prenom, nomParfumPreféré, marque
    
    Afficher Les noms, prenoms, noms parfums preférés 
    avec ses marques des clients qui fréquantent le magasin '?'
    """
    print("Voive le nom, prenom, et parfum préféré des cliens qui fréquante le magasin '%s'\n"%(codeMagasin))
    requete("""
                SELECT f.nom_client, f.prenom_client, c.nom_parfum_prefe, p.nom_marque
                FROM Frequentes f JOIN Clients c ON ( f.nom_client = c.nom AND f.prenom_client = c.prenom)
                JOIN Parfums p ON ( c.nom_parfum_prefe = p.nom)
                WHERE code_magasin = %s;
            """%(codeMagasin), connexion)



def nombre_de_parfum_reduit_avec_code(codePromo, connexion):
    """
    Le nombre des parfums avec un prix réduit en utiliant le code Promo '?'

    :param codePromo: Code Promotion
    :param conneion: connexion base de donnée
    :return: nombre des parfums en promo
    """
    try:
        print("Voici le nombre des parfums réduits avec le codePromo '%s'\n"%(codePromo))
        requete("""
                SELECT count(code_promotion)
                FROM Validites
                WHERE code_promotion = '%s';
                """%(codePromo), connexion)
    except:
        print("codePromo inconnu !")

def tous_codePromo_seTerminent_a_date(date, connexion):
    """
    Afficher tous le code promo qui se termminent à une date précise
    :param date: date
    :param connexion: connexion base de donnée
    """
    print("Voice tous les codePromo qui se terminet a cette date '%s'\n"%(date))
    requete("""
            SELECT DISTINCT code_promotion
            FROM Validites
            WHERE valide_jusqua == '%s';
            """%(date), connexion)


def affichage(connexion):
    while True :
        num = input("""
                1) Affiche la liste de tous les Magasins.
                2) Afficher la liste de tous les parfums qui sont fabriqué par une marque précise.
                3) Afficher la liste de tous les parfaums fabriqué par une marque précise
                   et qui sont stockés dans un magasin précis .
                4) Afficher tous les parfums d'un magasin à une adresse précise avec leur prix et leur volumes .
                5) Afficher Les noms, prenoms, noms parfums preférés avec ses marques des clients qui fréquantent le magasin précis.
                6) Afficher Le nombre des parfums avec un prix réduit en utiliant un code promo précis .
                7) Afficher tous le code promo qui se termminent à une date précise
                8)  Quitter
              """)
        if num == 1 :
            select_tous_les_Magasins(connexion)

        elif num == 2 :
            marque = str(input("Quel est le nom de la marque ?"))
            parfums_de_Marque(marque, connexion)

        elif num == 3:
            marque = str(input("Quel est le nom de la marque ?"))
            magasin = str(input("Quel est le code du magasin ?"))
            parfum_de_maqrue_dans_magasin_precis(marque, magasin, connexion)

        elif num == 4:
            adresse = str(input("Quelle est l'adresse ?"))
            tous_les_parfums_de_magasin(adresse, connexion)

        elif num == 5:
            codeMagasin = int(input("Quel est le code du magasin ?"))
            nom_prenom_nomParPref_de_client_frequante_magasin(codeMagasin, connexion)

        elif num == 6:
            codePromo = str(input("Quel est le codePromo ?"))
            nombre_de_parfum_reduit_avec_code(codePromo, connexion)

        elif num == 7:
            date = str(input("Quelle est la date ?"))
            tous_codePromo_seTerminent_a_date(date, connexion)

        elif num == 8:
            print("Au revoir !!\n")
            break

        elif num == "":
            print("Il faut choisir une requette parmi les suivants !")

        else:
            print("Erreur !\n")



