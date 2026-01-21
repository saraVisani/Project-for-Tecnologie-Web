Indirizzo = [("RI","RI", 76, "Galleria", "del Mulino"),
("BA","BA", 6, "Piazzale", "Porto"),
("CO","CO", 142, "Lungomare", "Italia"),
("VR","ER", 121, "Viale", "Università"),
("TO","TO", 83, "Corso", "Università"),
("AN","AN", 79, "Calle", "dei Pini"),
("TN","AL", 60, "Piazzale", "Michelangelo Buonarroti"),
("AQ","SC", 37, "Piazzale", "Antico"),
("VE","JE", 91, "Borgo", "Roma"),
("BZ","CH", 71, "Piazza", "degli Artigiani"),
("SS","SS", 58, "Largo", "delle Vigne"),
("SS","MO", 109, "Ponte", "San Francesco"),
("KR","VE", 60, "Contrada", "Marco Polo"),
("SA","SA", 80, "Ponte", "San Michele"),
("CA","CP", 83, "Piazzale", "Vecchio")]

Luogo = [(0,115, "Campo Sportivo"),
(1,95, "Spazio Cultura"),
(2,4220, "Anfiteatro"),
(3,450, "Palazzetto Polifunzionale"),
(4,90, "Palasport"),
(5,3150, "Arena Concerti"),
(6,60, "Teatro all'Aperto"),
(7,120, "Palasport"),
(8,335, "Campo Sportivo"),
(9,44150, "Sala Consiliare"),
(10,325, "Cinema Moderno"),
(11,540, "Arena Comunale"),
(12,210, "Palazzo della Cultura"),
(13,115, "Palazzetto dello Sport"),
(14,130, "Sala Conferenze")]

codice_corrente = 0

def codice():
    global codice_corrente
    val = codice_corrente
    codice_corrente += 1
    return val

def esterno():
    for indirizzo, luogo in zip(Indirizzo, Luogo):
        provincia, citta, n_civico, tipo, nome = indirizzo
        cod_luogo, capienza, nome_luogo = luogo

        print(f'insert into Esterno values ({codice()},"{provincia}", "{citta}", {n_civico}, {cod_luogo});')

esterno()