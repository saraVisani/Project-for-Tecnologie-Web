import random

def capienza():
    fascia = random.choices(
        population=["piccola", "media", "grande", "stadio"],
        weights=[35, 35, 20, 10],  # più luoghi piccoli che stadi
        k=1
    )[0]

    if fascia == "piccola":
        base = random.randint(12, 30) * 5      # 60–150
    elif fascia == "media":
        base = random.randint(40, 160) * 5     # 200–800
    elif fascia == "grande":
        base = random.randint(200, 1000) * 5   # 1.000–5.000
    else:  # stadio
        base = random.randint(2000, 12000) * 5 # 10.000–60.000

    return base

codice_corrente = 0

def codice():
    global codice_corrente
    val = codice_corrente
    codice_corrente += 1
    return val

NOMI = [
    "Teatro Comunale",
    "Auditorium Civico",
    "Sala Polivalente",
    "Centro Congressi",
    "Palazzo della Cultura",
    "Teatro Verdi",
    "Teatro Goldoni",
    "Teatro Romano",
    "Cinema Centrale",
    "Cinema Moderno",
    "Arena Comunale",
    "Arena Estiva",
    "Palazzetto dello Sport",
    "Palasport",
    "Palazzetto Polifunzionale",
    "Stadio Comunale",
    "Stadio Olimpico",
    "Stadio Municipale",
    "Campo Sportivo",
    "Centro Sportivo",
    "Sala Conferenze",
    "Sala Consiliare",
    "Centro Eventi",
    "Spazio Giovani",
    "Spazio Cultura",
    "Teatro all'Aperto",
    "Anfiteatro",
    "Arena Concerti"
]

def luoghi():
    nome = random.choice(NOMI)
    print(f'insert into Luogo values ({codice()},{capienza()}, "{nome}");')

for _ in range(15):
    luoghi()