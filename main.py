from utils import db


def main():

    # Nom de la BD `a cr´eer
    db_file = "data/BD_Parfumerie.db"
    
    # Cr´eer une connexion a la BD
    conn = db.creer_connexion(db_file)
    
    # Remplir la BD
    print("1. On cree la bd et on l'initialise avec des premieres valeurs.")
    db.mise_a_jour_bd(conn, "data/BD_Parfumerie_creation.sql")
    db.mise_a_jour_bd(conn, "data/BD_Parfumerie_inserts_ok.sql")
    
    # Lire la BD
    print("2. Nom parfums Guerlains")
    nom_parfums_guerlain(conn)

def creer_connexion(db_file):
    try:
        conn = sqlite3.connect(db_file)

        # On active les foreign keys
        conn.execute("PRAGMA foreign_keys = 1")

        return conn
        
    except sqlite3.Error as e:
        print(e)
    return None

def mise_a_jour_bd(conn: sqlite3.Connection, file: str):

    # Lecture du fichier et placement des requ^etes dans un tableau
    sqlQueries = []
    
    with open(file, 'r') as f:
        createSql = f.read()
        sqlQueries = createSql.split(";")

    # Execution de toutes les requ^etes du tableau
    cursor = conn.cursor()

    for query in sqlQueries:
        cursor.execute(query)

    # Validation des modifications
    conn.commit()

def nom_parfums_guerlain(conn):
    cur = conn.cursor()
    cur.execute("SELECT nom FROM Parfums WHERE nom_marque == 'Guerlain'")
    rows = cur.fetchall()
    for row in rows:
        print(row)

