import random

import string
from datetime import datetime
import unicodedata

SESSO_NOME = {
    # =====================
    # MASCHILI
    # =====================
    "Marco": "M", "Luca": "M", "Giovanni": "M", "Francesco": "M",
    "Paolo": "M", "Matteo": "M", "Stefano": "M", "Alessandro": "M",
    "Davide": "M", "Simone": "M", "Gabriele": "M", "Riccardo": "M",
    "Federico": "M", "Antonio": "M", "Michele": "M", "Filippo": "M",
    "Emanuele": "M", "Nicola": "M", "Roberto": "M", "Fabio": "M",
    "Massimo": "M", "Salvatore": "M", "Vincenzo": "M", "Luigi": "M",
    "Pietro": "M", "Daniele": "M", "Cristian": "M", "Christian": "M",
    "Leonardo": "M", "Tommaso": "M", "Enrico": "M", "Giorgio": "M",
    "Andrea": "A",  # ambiguo
    "Claudio": "M", "Domenico": "M", "Alberto": "M", "Giuseppe": "M",
    "Raffaele": "M", "Carlo": "M", "Cesare": "M", "Diego": "M",
    "Ivan": "M", "Jacopo": "M", "Kevin": "M", "Lorenzo": "M",
    "Manuel": "M", "Mirko": "M", "Nicolò": "M", "Omar": "M",
    "Sergio": "M", "Valerio": "M", "Walter": "M",

    # =====================
    # FEMMINILI
    # =====================
    "Maria": "F", "Giulia": "F", "Francesca": "F", "Anna": "F",
    "Elena": "F", "Laura": "F", "Sara": "F", "Chiara": "F",
    "Valentina": "F", "Martina": "F", "Alice": "F", "Roberta": "F",
    "Silvia": "F", "Claudia": "F", "Alessandra": "F", "Elisa": "F",
    "Marta": "F", "Ilaria": "F", "Federica": "F", "Veronica": "F",
    "Monica": "F", "Cristina": "F", "Beatrice": "F", "Sofia": "F",
    "Camilla": "F", "Arianna": "F", "Noemi": "F", "Irene": "F",
    "Serena": "F", "Paola": "F", "Daniela": "F", "Angela": "F",
    "Lucia": "F", "Patrizia": "F", "Rita": "F", "Teresa": "F",
    "Giovanna": "F", "Antonella": "F", "Debora": "F", "Eleonora": "F",
    "Giorgia": "F", "Linda": "F", "Vanessa": "F", "Nicole": "F",
    "Rebecca": "F", "Benedetta": "F",

    # =====================
    # AMBIGUI (50%)
    # =====================
    "Andrea": "A",
    "Gabriele": "M",  # in Italia maschile
    "Simone": "M",    # in Italia maschile
    "Nicola": "M",    # in Italia maschile
    "Celeste": "A",
    "Denis": "A",
    "Sasha": "A",
    "Alex": "A",
    "Chris": "A",
    "Gabriel": "A"
}

COGNOMI = {
    "A": [
        "Abate", "Acquaviva", "Alberti", "Amato", "Angelini",
        "Antonelli", "Arena", "Argento", "Armani"
    ],
    "B": [
        "Baldini", "Barbieri", "Basile", "Basso", "Bellini",
        "Bernardi", "Bianchi", "Bianco", "Bonaventura",
        "Bordoni", "Brambilla", "Bruno"
    ],
    "C": [
        "Cairo", "Calabrese", "Caputo", "Carbone", "Caruso",
        "Castelli", "Cattaneo", "Cavaliere", "Colombo",
        "Conti", "Costa", "Crespi", "Coppola"
    ],
    "D": [
        "D'Amico", "De Angelis", "De Luca", "De Santis",
        "Di Benedetto", "Di Stefano", "Donati"
    ],
    "E": [
        "Esposito", "Ferrari"
    ],
    "F": [
        "Fabbri", "Fazio", "Ferrari", "Ferretti",
        "Fontana", "Franco", "Fusco"
    ],
    "G": [
        "Gallo", "Gentile", "Giacomini", "Giordano",
        "Graziani", "Greco", "Grassi", "Guerra"
    ],
    "I": [
        "Iacono", "Innocenti"
    ],
    "L": [
        "Lombardi", "Longo", "Lorusso", "Lucchesi"
    ],
    "M": [
        "Mancini", "Marchetti", "Marino", "Martini",
        "Mazza", "Messina", "Moretti", "Moroni", "Monti"
    ],
    "N": [
        "Napolitano", "Neri"
    ],
    "P": [
        "Pellegrini", "Piras", "Puglisi"
    ],
    "R": [
        "Rinaldi", "Romano", "Rossi", "Russo"
    ],
    "S": [
        "Sala", "Santoro", "Serra", "Silvestri", "Sorrentino"
    ],
    "T": [
        "Testa", "Toscano"
    ],
    "V": [
        "Valentini", "Ventura", "Verdi", "Villa", "Vitale"
    ],
    "Z": [
        "Zanetti", "Zuccaro"
    ]
}

COMUNE_CF = {
    "Aosta": "A271",
    "Donnas": "D948",
    "Torino": "L219",
    "Front": "D760",
    "Asti": "A372",
    "Corsione": "D230",
    "Cuneo": "C933",
    "Carrù": "C118",
    "Milano": "F205",
    "Rho": "H196",
    "Como": "C792",
    "Stazzona": "I309",
    "Mantova": "F205",
    "Castel Goffredo": "C365",
    "Cremona": "D276",
    "San Bassano": "I123",
    "Bolzano": "A794",
    "Chiusa": "C520",
    "Trento": "L378",
    "Ala": "A310",
    "Venezia": "L736",
    "Jesolo": "D914",
    "Padova": "G224",
    "Piove di Sacco": "G930",
    "Verona": "L781",
    "Erbe": "D027",
    "Gorizia": "D949",
    "Mossa": "F172",
    "Udine": "L219",
    "Tricesino": "F875",
    "Trieste": "L424",
    "Muggia": "F776",
    "Genova": "D969",
    "Zoagli": "L602",
    "La Spezia": "D969",
    "Beverino": "A913",
    "Savona": "I143",
    "Borghetto Santo Spirito": "B858",
    "Bologna": "A944",
    "Imola": "E376",
    "Forlì": "D704",
    "Cesena": "C724",
    "Ravenna": "H266",
    "Castel Bolognese": "C986",
    "Arezzo": "A390",
    "Poppi": "G715",
    "Pisa": "G702",
    "San Giuliano Terme": "I134",
    "Firenze": "D612",
    "Firenzuola": "D433",
    "Pesaro": "G484",
    "Ascoli Piceno": "A189",
    "Carassai": "B207",
    "Ancona": "A271",
    "Force": "D491",
    "Roma": "H501",
    "Montegallo": "F232",
    "Frosinone": "D525",
    "Cupra Marittima": "D842",
    "Rieti": "H223",
    "Belmonte in Sabina": "A587",
    "L’Aquila": "A769",
    "Scoppito": "I239",
    "Chieti": "C839",
    "Archi": "A286",
    "Perugia": "G859",
    "Terni": "L424",
    "Baschi": "A037",
    "Napoli": "F839",
    "Massa di Somma": "F753",
    "Benevento": "A997",
    "Montefiore dell'Aso": "F883",
    "Salerno": "H703",
    "Corbara": "D394",
    "Campobasso": "B861",
    "Toro": "L045",
    "Bari": "A662",
    "Turi": "B882",
    "Barletta": "A643",
    "Andria": "A348",
    "Matera": "F572",
    "Scanzano Jonico": "G915",
    "Potenza": "G715",
    "Carbone": "B440",
    "Reggio Calabria": "H224",
    "Plati": "G908",
    "Crotone": "D111",
    "Verzino": "L402",
    "Palermo": "G273",
    "Gratteri": "D832",
    "Catania": "C351",
    "Milo": "C887",
    "Trapani": "L390",
    "Santa Ninfa": "I386",
    "Cagliari": "B354",
    "Capoterra": "B889",
    "Sassari": "F205",
    "Mores": "F548"
}

DOMINI_GENERICI = ["gmail.com", "libero.it", "hotmail.com", "yahoo.it"]

MESI = {
    1: "A", 2: "B", 3: "C", 4: "D",
    5: "E", 6: "H", 7: "L", 8: "M",
    9: "P", 10: "R", 11: "S", 12: "T"
}

DISPARI = {
    **dict.fromkeys("0123456789", 0),
    **{
        "0": 1, "1": 0, "2": 5, "3": 7, "4": 9,
        "5": 13, "6": 15, "7": 17, "8": 19, "9": 21,
        "A": 1, "B": 0, "C": 5, "D": 7, "E": 9,
        "F": 13, "G": 15, "H": 17, "I": 19, "J": 21,
        "K": 2, "L": 4, "M": 18, "N": 20, "O": 11,
        "P": 3, "Q": 6, "R": 8, "S": 12, "T": 14,
        "U": 16, "V": 10, "W": 22, "X": 25,
        "Y": 24, "Z": 23
    }
}

PARI = {c: i for i, c in enumerate("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ")}
CONTROLLO = string.ascii_uppercase


def estrai_consonanti(s):
    return [c for c in s.upper() if c.isalpha() and c not in "AEIOU"]


def estrai_vocali(s):
    return [c for c in s.upper() if c in "AEIOU"]


def codice_nome(nome):
    cons = estrai_consonanti(nome)
    voc = estrai_vocali(nome)
    if len(cons) >= 4:
        return cons[0] + cons[2] + cons[3]
    return (cons + voc + ["X", "X", "X"])[:3]


def codice_cognome(cognome):
    cons = estrai_consonanti(cognome)
    voc = estrai_vocali(cognome)
    return (cons + voc + ["X", "X", "X"])[:3]

def rimuovi_accents(s):
    # trasforma le lettere accentate in lettere normali
    return ''.join(
        c for c in unicodedata.normalize('NFD', s)
        if unicodedata.category(c) != 'Mn'
    )

def calcola_controllo(cf15):
    somma = 0
    for i, c in enumerate(cf15):
        if i % 2 == 0:
            somma += DISPARI[c]
        else:
            somma += PARI[c]
    return CONTROLLO[somma % 26]


def genera_codice_fiscale(nome, cognome, data_nascita, sesso, codice_comune):
    data = datetime.strptime(data_nascita, "%Y-%m-%d")

    nome = rimuovi_accents(nome.upper())
    cognome = rimuovi_accents(cognome.upper())

    cf = (
        ''.join(codice_cognome(cognome)) +
        ''.join(codice_nome(nome)) +
        str(data.year)[-2:] +
        MESI[data.month] +
        f"{data.day + (40 if sesso.upper() == 'F' else 0):02d}" +
        codice_comune.upper()
    )

    return cf + calcola_controllo(cf)

def sesso_da_nome(nome):
    sesso = SESSO_NOME.get(nome.capitalize(), "A")
    if sesso == "A":
        return random.choice(["M", "F"])
    return sesso

def nome_random():
    """Restituisce un nome casuale da SESSO_NOME."""
    return random.choice(list(SESSO_NOME.keys()))

def cognome_random():
    lettera = random.choice(list(COGNOMI.keys()))
    return random.choice(COGNOMI[lettera])

def codice_comune_random():
    """Restituisce un codice comune casuale (4 caratteri) per il CF."""
    return random.choice(list(COMUNE_CF.values()))

def data_nascita_random(min_eta=18, max_eta=70):
    """Restituisce una data di nascita casuale per un'età tra min_eta e max_eta"""
    oggi = datetime.today()
    anno_min = oggi.year - max_eta
    anno_max = oggi.year - min_eta

    # genera anno casuale
    anno = random.randint(anno_min, anno_max)

    # genera mese e giorno casuali, attenzione ai giorni validi
    mese = random.randint(1, 12)
    # giorno valido per il mese scelto
    if mese == 2:
        giorno = random.randint(1, 28)
    elif mese in [4, 6, 9, 11]:
        giorno = random.randint(1, 30)
    else:
        giorno = random.randint(1, 31)

    return datetime(anno, mese, giorno)

def genera_email_unibo(nome, cognome):
    """
    Genera una email universitaria @studio.unibo.it
    - nome.cognome
    - opzionale numero 1-2 cifre
    """
    aggiunta_numero = ""
    if random.random() < 0.5:  # metà volte aggiunge un numero
        aggiunta_numero = str(random.randint(0, 99))

    email = f"{nome.lower()}.{cognome.lower()}{aggiunta_numero}@studio.unibo.it"
    return email


def genera_email_normale(nome, cognome):
    """
    Genera una email normale con dominio casuale
    - nome.cognome + numero opzionale
    - dominio casuale
    """
    aggiunta_numero = str(random.randint(0, 99))
    dominio = random.choice(DOMINI_GENERICI)
    email = f"{nome.lower()}.{cognome.lower()}{aggiunta_numero}@{dominio}"
    return email

def genera_popolazione(num_persone=50):
    persone = []
    universitari = []
    professori = []
    studenti = []
    segreteria = []

    matricola_counter = -1  # parte da -1 perché incrementiamo subito

    for _ in range(num_persone):
        nome = nome_random()
        cognome = cognome_random()
        sesso = sesso_da_nome(nome)
        data_nascita = data_nascita_random(min_eta=18, max_eta=70)
        codice_comune = codice_comune_random()
        email = genera_email_normale(nome, cognome)
        cf = genera_codice_fiscale(nome, cognome, data_nascita.strftime("%Y-%m-%d"), sesso, codice_comune)

        # Email normale o unibo
        if random.random() < 0.8:  # 80% Unibo
            livello = 1  # di default studente universitario
            is_universitario = True
        else:
            livello = 0
            is_universitario = False

        persona = {
            "CF": cf,
            "Nome": nome,
            "Cognome": cognome,
            "Data_Nascita": data_nascita.strftime("%Y-%m-%d"),
            "Email": email,
            "Livello_Permesso": livello
        }
        persone.append(persona)

        # Se è universitario, genera matricola e dividi tra categorie
        if is_universitario:
            matricola_counter += 1  # parte da 0
            email_uni = genera_email_unibo(nome, cognome)
            password = ''.join(random.choices("abcdefghijklmnopqrstuvwxyz0123456789", k=10))

            universitario = {
                "Matricola": matricola_counter,
                "Email_Uni": email_uni,
                "Password": password,
                "CF": cf
            }
            universitari.append(universitario)

            # divisione tra prof, studente, segreteria
            scelta = random.random()
            if scelta < 0.2:  # 20% prof
                livello = 3
                professori.append({"Matricola": matricola_counter})
            elif scelta < 0.9:  # 70% studenti
                # alcuni studenti diventano rappresentanti
                if random.random() < 0.1:
                    livello = 2
                else:
                    livello = 1
                studenti.append({"Matricola": matricola_counter})
            else:  # 10% segreteria
                livello = 4
                segreteria.append({"Matricola": matricola_counter, "Codice_Uni": random.randint(1, 10)})

            # aggiorna il livello nella persona
            persona["Livello_Permesso"] = livello

    # stampa dati
    print("\n-- PERSONE --")
    for p in persone:
        print(f'insert into Persona values ("{p["CF"]}","{p["Nome"]}","{p["Cognome"]}","{p["Data_Nascita"]}","{p["Email"]}",{p["Livello_Permesso"]});')

    print("\n-- SISTEMA UNIVERSITARIO --")
    for u in universitari:
        print(f'insert into Sistema_Universitario values ({u["Matricola"]},"{u["Email_Uni"]}","{u["Password"]}","{u["CF"]}");')

    print("\n-- PROFESSORI --")
    for p in professori:
        print(f'insert into Professore values ({p["Matricola"]});')

    print("\n-- STUDENTI --")
    for s in studenti:
        print(f'insert into Studente values ({s["Matricola"]});')

    print("\n-- SEGRETERIA --")
    for s in segreteria:
        print(f'insert into Segreteria values ({s["Matricola"]},{s["Codice_Uni"]});')

# genera_popolazione(num_persone=100)

def genera_prof_Seg(numero):
    persone = []
    universitari = []
    professori = []
    segreteria = []

    matricola_counter = 74  # parte da -1 perché incrementiamo subito

    for _ in range(numero):
        nome = nome_random()
        cognome = cognome_random()
        sesso = sesso_da_nome(nome)
        data_nascita = data_nascita_random(min_eta=18, max_eta=70)
        codice_comune = codice_comune_random()
        email = genera_email_normale(nome, cognome)
        cf = genera_codice_fiscale(nome, cognome, data_nascita.strftime("%Y-%m-%d"), sesso, codice_comune)

        # Email normale o unibo

        livello = 1  # di default studente universitario
        is_universitario = True

        persona = {
            "CF": cf,
            "Nome": nome,
            "Cognome": cognome,
            "Data_Nascita": data_nascita.strftime("%Y-%m-%d"),
            "Email": email,
            "Livello_Permesso": livello
        }
        persone.append(persona)

        # Se è universitario, genera matricola e dividi tra categorie
        if is_universitario:
            matricola_counter += 1  # parte da 0
            email_uni = genera_email_unibo(nome, cognome)
            password = ''.join(random.choices("abcdefghijklmnopqrstuvwxyz0123456789", k=10))

            universitario = {
                "Matricola": matricola_counter,
                "Email_Uni": email_uni,
                "Password": password,
                "CF": cf
            }
            universitari.append(universitario)

            # divisione tra prof, studente, segreteria
            scelta = random.random()
            if scelta < 0.6:
                livello = 3
                professori.append({"Matricola": matricola_counter})
            else:
                livello = 4
                segreteria.append({"Matricola": matricola_counter, "Codice_Uni": random.randint(1, 10)})

            # aggiorna il livello nella persona
            persona["Livello_Permesso"] = livello

    # stampa dati
    print("\n-- PERSONE --")
    for p in persone:
        print(f'insert into Persona values ("{p["CF"]}","{p["Nome"]}","{p["Cognome"]}","{p["Data_Nascita"]}","{p["Email"]}",{p["Livello_Permesso"]});')

    print("\n-- SISTEMA UNIVERSITARIO --")
    for u in universitari:
        print(f'insert into Sistema_Universitario values ({u["Matricola"]},"{u["Email_Uni"]}","{u["Password"]}","{u["CF"]}");')

    print("\n-- PROFESSORI --")
    for p in professori:
        print(f'insert into Professore values ({p["Matricola"]});')

    print("\n-- SEGRETERIA --")
    for s in segreteria:
        print(f'insert into Segreteria values ({s["Matricola"]},{s["Codice_Uni"]});')

genera_prof_Seg(50)
