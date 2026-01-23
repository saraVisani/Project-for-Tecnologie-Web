import random

codice_corrente = 15

def codice():
    global codice_corrente
    val = codice_corrente
    codice_corrente += 1
    return val

def capienza():
    fascia = random.choices(
        ["ufficio", "classe", "giardino", "poli"],
        weights=[0.4, 0.4, 0.1, 0.1],
        k=1
    )[0]

    if fascia == "ufficio":
        return random.randint(3, 10), fascia
    elif fascia == "classe":
        return random.randint(40, 120), fascia
    elif fascia == "giardino":
        return random.randint(100, 300), fascia
    else:
        return random.randint(200, 1500), fascia

def calcola_Nome(fascia):
    if fascia == "ufficio":
        nomi = [
            "Ufficio Amministrativo",
            "Ufficio Didattico",
            "Ufficio Relazioni Internazionali",
            "Ufficio Orientamento",
            "Ufficio Segreteria Studenti",
            "Ufficio Risorse Umane",
            "Ufficio Contabilità",
            "Ufficio Ricerca e Sviluppo",
            "Ufficio Erasmus",
            "Ufficio Tirocini",
            "Ufficio Placement",
            "Ufficio Protocollo",
            "Ufficio Comunicazione",
            "Ufficio Qualità",
            "Ufficio Affari Generali",
            "Ufficio Pianificazione",
            "Ufficio Servizi Informatici",
            "Ufficio Tecnico",
            "Ufficio Logistica",
            "Ufficio Supporto Docenti"
        ]

    elif fascia == "classe":
        nomi = [
            "Aula Magna",
            "Aula Studio A",
            "Aula Studio B",
            "Aula Studio C",
            "Aula Informatica 1",
            "Aula Informatica 2",
            "Aula Informatica 3",
            "Aula Informatica Avanzata",
            "Aula Multimediale",
            "Aula Conferenze",
            "Aula Seminari",
            "Aula Progetti",
            "Aula Didattica 101",
            "Aula Didattica 102",
            "Aula Didattica 201",
            "Aula Didattica 202",
            "Aula Laboratorio Fisica",
            "Aula Laboratorio Chimica",
            "Aula Laboratorio Biologia",
            "Aula Laboratorio Matematica"
        ]

    elif fascia == "giardino":
        nomi = [
            "Giardino Botanico",
            "Parco Universitario",
            "Giardino delle Scienze",
            "Giardino della Cultura",
            "Giardino delle Idee",
            "Giardino della Ricerca",
            "Giardino dei Saperi",
            "Giardino degli Studenti",
            "Giardino della Conoscenza",
            "Giardino della Pace",
            "Parco della Didattica",
            "Parco delle Innovazioni"
        ]

    else:  # poli
        nomi = [
            "Polo Didattico Ingegneria",
            "Polo Didattico Economia",
            "Polo Didattico Scienze",
            "Polo Didattico Lettere",
            "Polo Didattico Medicina",
            "Polo Didattico Informatica",
            "Polo Didattico Architettura",
            "Polo Didattico Giurisprudenza",
            "Polo Didattico Psicologia",
            "Polo Didattico Biotecnologie",
            "Polo Didattico Fisica",
            "Polo Didattico Chimica",
            "Polo Didattico Matematica",
            "Polo Didattico Scienze Politiche",
            "Polo Didattico Comunicazione"
        ]

    return random.choice(nomi)

sedi = [(0, "BO", "BO", 33, "Palazzo Poggi"),
(1, "BO", "BO", 38, "Palazzo Riario"),
(2, "BO", "BO", 2, "San Giovanni in Monte"),
(3, "BO", "BO", 20, "Collegio dei Fiamminghi"),
(4, "BO", "BO", 45, "Palazzo Hercolani"),
(5, "BO", "BO", 28, "Complesso Terracini"),
(6, "BO", "BO", 9, "Policlinico Sant'Orsola-Malpighi"),
(7, "FC", "CE", 50, "Campus universitario di Cesena"),
(8, "FC", "FO", 1, "Polo universitario di Forlì"),
(9, "RA", "RA", 27, "Direzione e servizi studenti"),
(10, "RA", "RA", 1, "Dipartimento Beni Culturali"),
(11, "RA", "RA", 6, "Palazzo Corradini"),
(12, "RA", "RA", 23, "Palazzo Verdi"),
(13, "RA", "RA", 163, "Laboratori Scientifici"),
(14, "RA", "RA", 55, "Ingegneria e Architettura"),
(15, "RA", "RA", 5, "Ospedale S.Maria delle Croci"),
(16, "RN", "RN", 22, "Complesso Valgimigli")]

professori = [3,5,8,9,20,22,28,35,38,41,44,46,58,60,62,65,67,73]

luoghi = []
universitari = []
uffici = []
classi = []

def codice_stanza():
    sezione = random.randint(1, 5)
    stanza = random.randint(1, 9)
    return float(f"{sezione}.{stanza}")

def lab_si_no():
    return random.choices(
        [0, 1],
        weights=[0.55, 0.45],
        k=1
    )[0]

def genera_luoghi(n):
    for _ in range(n):
        cap, fascia = capienza()
        luoghi.append({
            "Codice": codice(),
            "Capienza": cap,
            "Nome": calcola_Nome(fascia),
            "Fascia": fascia
        })


def genera_stanze_per_sedi():
    prof_index = 0

    for sede in sedi:
        codice_uni = sede[0]
        codici_usati = set()

        for _ in range(10):  # 10 stanze per sede
            # evita duplicati Codice_Stanza
            cs = codice_stanza()
            while cs in codici_usati:
                cs = codice_stanza()
            codici_usati.add(cs)

            luogo = luoghi.pop(0)

            universitari.append(
                (codice_uni, cs, luogo["Codice"])
            )

            if luogo["Fascia"] == "ufficio":
                matricola = professori[prof_index % len(professori)]
                prof_index += 1

                uffici.append(
                    (codice_uni, cs, matricola)
                )

            elif luogo["Fascia"] == "classe":
                classi.append(
                    (codice_uni, cs, lab_si_no())
                )
    for u in universitari:
        print(f"insert into Universitario values ({u[0]}, {u[1]}, {u[2]});")
    for u in uffici:
        print(f"insert into Ufficio values ({u[0]}, {u[1]}, {u[2]});")
    for c in classi:
        print(f"insert into Classe values ({c[0]}, {c[1]}, {c[2]});")


def stampa_luoghi():
    for l in luoghi:
        print(f"insert into Luogo values ({l['Codice']}, {l['Capienza']}, '{l['Nome']}');")

genera_luoghi(170)
stampa_luoghi()
genera_stanze_per_sedi()



# print(f"insert into Luogo values ({codice()}, {capienza_val}, '{nome}');")


#n = numero sedi * 10