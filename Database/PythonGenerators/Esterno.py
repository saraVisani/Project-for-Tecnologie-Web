Indirizzo = [ ("CA","CA", "41", "Strada", "Centrale"),
("VE","JE", "110", "Viale", "Alto"),
("AP","AP", "45", "Vicolo", "Giacomo Leopardi"),
("TN","AL", "108", "Contrada", "Moderno"),
("TP","SN", "142", "Galleria", "Cesare Battisti"),
("AN","FO", "50", "Calle", "Università"),
("GE","ZO", "146", "Via", "della Libertà"),
("FR","CM", "131", "Largo", "San Giuseppe"),
("RC","RC", "116", "Salita", "Ferrovia"),
("BT","AN", "84", "Viale", "del Mare"),
("CA","CA", "117", "Strada", "Marco Polo"),
("MI","MI", "18", "Via", "San Francesco"),
("VE","VE", "54", "Piazzale", "della Chiesa"),
("CN","CA", "129", "Calle", "della Resistenza"),
("FR","CM", "12", "Galleria", "Centrale")]

Luogo = [("0","75", "Spazio Cultura"),
("1","100", "Anfiteatro"),
("2","1960", "Spazio Cultura"),
("3","115", "Palazzo della Cultura"),
("4","90", "Campo Sportivo"),
("5","43465", "Spazio Cultura"),
("6","605", "Teatro Goldoni"),
("7","530", "Cinema Moderno"),
("8","3080", "Spazio Cultura"),
("9","60", "Arena Comunale"),
("10","95", "Palazzetto dello Sport"),
("11","105", "Stadio Olimpico"),
("12","3265", "Stadio Municipale"),
("13","745", "Arena Estiva"),
("14","65", "Centro Sportivo")]

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

        print(f'insert into Esterno values ("{codice()}","{provincia}", "{citta}", "{n_civico}", "{cod_luogo}");')

esterno()