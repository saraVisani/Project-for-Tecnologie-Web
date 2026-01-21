-- *********************************************
-- * Standard SQL generation
-- *--------------------------------------------
-- * DB-MAIN version: 11.0.2
-- * Generator date: Sep 14 2021
-- * Generation date: Mon Jan 19 14:37:15 2026
-- * LUN file: C:\Users\pc\Tecnologie-Web\Progetto Web\Uniflow.lun
-- * Schema: Uniflow/SQL
-- *********************************************


-- Database Section
-- ________________

drop database if exists Uniflow;

create database if not exists Uniflow;

use Uniflow;


-- DBSpace Section
-- _______________


-- Tables Section
-- _____________

create table Agg_Collaboratore (
     Codice_Richiesta numeric(10) not null,
     CF varchar(16) not null,
     constraint ID_Agg_Collaboratore_ID primary key (Codice_Richiesta, CF));

create table Agg_Promotore (
     Codice_Promotore numeric(10) not null,
     Codice_Richiesta numeric(10) not null,
     constraint ID_Agg_Promotore_ID primary key (Codice_Promotore, Codice_Richiesta));

create table Ambito (
     Nome varchar(30) not null,
     Colore varchar(10) not null,
     constraint ID_Ambito_ID primary key (Nome));

create table Cambiare_Orario (
     Codice_Orario numeric(10) not null,
     Codice_Ric numeric(10) not null,
     Nuovo_Inizio datetime,
     Nuovo_Fine datetime,
     Codice_Luogo numeric(10),
     constraint ID_Cambiare_Orario_ID primary key (Codice_Orario, Codice_Ric));

create table Canale (
     Cod_Forum numeric(1) not null,
     Codice numeric(10) not null,
     Nome varchar(30) not null,
     Grado numeric(1) not null,
     Visualizzare TINYINT(1) not null,
     Visualizzare_Tutti TINYINT(1) not null,
     constraint ID_Canale_ID primary key (Cod_Forum, Codice));

create table Citta (
     Codice_Prov varchar(5) not null,
     Codice varchar(5) not null,
     Nome varchar(30) not null,
     constraint ID_Citta_ID primary key (Codice_Prov, Codice));

create table Classe (
     Codice_Uni numeric(10) not null,
     Codice_Stanza numeric(4,3) not null,
     Lab TINYINT(1) not null,
     constraint ID_Class_Unive_ID primary key (Codice_Uni, Codice_Stanza));

create table Collaboratore (
     Codice_Evento numeric(10) not null,
     CF varchar(16) not null,
     constraint ID_Collaboratore_ID primary key (Codice_Evento, CF));

create table Composto_Da (
     Codice_PianoDid numeric(10) not null,
     Cod_Mat_Anno numeric(10) not null,
     Superato TINYINT(1) not null,
     constraint ID_Composto_Da_ID primary key (Cod_Mat_Anno, Codice_PianoDid));

create table Corso (
     Codice numeric(10) not null,
     Nome varchar(30) not null,
     Descrizione varchar(510) not null,
     Colore varchar(10),
     Ambito varchar(30) not null,
     constraint ID_Corso_ID primary key (Codice));

create table Elemento (
     Codice numeric(10) not null,
     Nome varchar(20) not null,
     Voto numeric(10) not null,
     Cod_Unico_Thread numeric(60),
     Cod_Unico_Messaggio numeric(60),
     constraint ID_Elemento_ID primary key (Codice));

create table Elim_Collaboratore (
     Codice_Richiesta numeric(10) not null,
     CF varchar(16) not null,
     constraint ID_Elim_Collaboratore_ID primary key (Codice_Richiesta, CF));

create table Elim_Promotore (
     Codice_Promotore numeric(10) not null,
     Codice_Richiesta numeric(10) not null,
     constraint ID_Elim_Promotore_ID primary key (Codice_Promotore, Codice_Richiesta));

create table Esterno (
     Codice numeric(10) not null,
     Codice_Prov varchar(5) not null,
     Codice_Citta varchar(5) not null,
     N_Civico numeric(6) not null,
     Cod_Luogo numeric(10) not null,
     constraint SID_Ester_Indir_ID unique (Codice_Prov, Codice_Citta, N_Civico),
     constraint ID_Esterno_ID primary key (Codice),
     constraint SID_Ester_Luogo_ID unique (Cod_Luogo));

create table Evento (
     Codice numeric(10) not null,
     Nome varchar(30) not null,
     Inizio datetime not null,
     Fine datetime not null,
     Posti numeric(6) not null,
     Descrizione varchar(510) not null,
     CF varchar(16) not null,
     constraint ID_Evento_ID primary key (Codice));

create table Formato_Da (
     Codice_Mat numeric(10) not null,
     Codice_Corso numeric(10) not null,
     Obbligatorio TINYINT(1) not null,
     Grado numeric(1) not null,
     Periodo numeric(1) not null,
     CFU numeric(2) not null,
     constraint ID_Formato_Da_ID primary key (Codice_Mat, Codice_Corso));

create table Forum (
     Codice numeric(1) not null,
     Nome varchar(30) not null,
     constraint ID_Forum_ID primary key (Codice));

create table Immagine (
     `Path` varchar(255) not null,
     Descrizione varchar(510),
     constraint ID_Immagine_ID primary key (`Path`));

create table Indirizzo (
     Codice_Prov varchar(5) not null,
     Codice_Citta varchar(5) not null,
     N_Civico numeric(6) not null,
     Via varchar(30) not null,
     Nome varchar(30) not null,
     constraint ID_Indirizzo_ID primary key (Codice_Prov, Codice_Citta, N_Civico));

create table Inoltrare_Messaggio (
     Cod_Unico numeric(60) not null,
     `Path` varchar(255) not null,
     constraint ID_Inoltrare_Messaggio_ID primary key (`Path`, Cod_Unico));

create table Inoltrare_Thread (
     Cod_Unico numeric(60) not null,
     `Path` varchar(255) not null,
     constraint ID_Inoltrare_Thread_ID primary key (Cod_Unico, `Path`));

create table Insegna (
     Cod_Mat_Anno numeric(10) not null,
     Matricola numeric(10) not null,
     constraint ID_Insegna_ID primary key (Cod_Mat_Anno, Matricola));

create table Luogo (
     Codice numeric(10) not null,
     Capienza numeric(6) not null,
     Nome varchar(30) not null,
     constraint ID_Luogo_ID primary key (Codice));

create table Materia (
     Codice numeric(10) not null,
     Nome varchar(30) not null,
     Codice_Uni numeric(10) not null,
     constraint ID_Materia_ID primary key (Codice));

create table Materia_Anno (
     Cod_Mat_Anno numeric(10) not null,
     Codice_Mat numeric(10) not null,
     Anno year not null,
     constraint SID_Materia_Anno_ID unique (Codice_Mat, Anno),
     constraint ID_Materia_Anno_ID primary key (Cod_Mat_Anno));

create table Messaggio (
     Cod_Unico numeric(60) not null,
     Codice numeric(10) not null,
     Cod_Unico_Thread numeric(60) not null,
     Testo varchar(60000) not null,
     Data datetime not null,
     Likes numeric(10) not null,
     Dislike numeric(10) not null,
     Pin TINYINT(1) not null,
     Pin_Speciale TINYINT(1) not null,
     Messaggio_Puntato numeric(60),
     Matricola numeric(60) not null,
     constraint ID_Messaggio_ID primary key (Cod_Unico),
     constraint SID_Messaggio_ID unique (Cod_Unico_Thread, Codice));

create table Modulo (
     Cod_Mat_Anno numeric(10) not null,
     Codice numeric(10) not null,
     Inizio_Modulo datetime not null,
     Fine_Modulo datetime not null,
     Descrizione varchar(510) not null,
     Matricola_Tit numeric(10) not null,
     constraint ID_Modulo_ID primary key (Cod_Mat_Anno, Codice));

create table Notifica (
     Codice numeric(10) not null,
     Descizione varchar(510) not null,
     Chiusa TINYINT(1) not null,
     Matricola numeric(10) not null,
     constraint ID_Notifica_ID primary key (Codice));

create table Orario (
     Codice numeric(10) not null,
     Cod_Mat_Anno numeric(10) not null,
     Codice_Modulo numeric(10) not null,
     Orario_inizio datetime not null,
     Codice_Uni numeric(10) not null,
     Codice_Stanza numeric(4,3) not null,
     Orario_fine datetime not null,
     constraint SID_Orario_1_ID unique (Cod_Mat_Anno, Codice_Modulo, Orario_inizio),
     constraint SID_Orario_ID unique (Codice_Uni, Codice_Stanza, Orario_inizio),
     constraint ID_Orario_ID primary key (Codice));

create table Orario_Evento (
     Codice numeric(10) not null,
     Codice_Evento numeric(10) not null,
     Inizio datetime not null,
     Cod_Luogo numeric(10) not null,
     Fine datetime not null,
     constraint SID_Orario_Evento_1_ID unique (Codice_Evento, Inizio),
     constraint SID_Orario_Evento_ID unique (Cod_Luogo, Inizio),
     constraint ID_Orario_Evento_ID primary key (Codice));

create table Persona (
     CF varchar(16) not null,
     Nome varchar(30) not null,
     Cognome varchar(30) not null,
     Data_Nascita date not null,
     Email varchar(40) not null,
     Livello_Permesso numeric(1) not null,
     constraint ID_Persona_ID primary key (CF),
     constraint SID_Persona_ID unique (Email));

create table Piano_Didattico (
     Codice_PianoDid numeric(10) not null,
     Anno year not null,
     Codice_Corso numeric(10) not null,
     Matricola numeric(10) not null,
     constraint ID_Piano_Didattico_ID primary key (Codice_PianoDid),
     constraint SID_Piano_Didattico_ID unique (Anno, Codice_Corso),
     constraint SID_Piano_Stude_ID unique (Matricola));

create table Professore (
     Matricola numeric(10) not null,
     constraint ID_Profe_Siste_ID primary key (Matricola));

create table Promotore (
     Codice numeric(10) not null,
     Nome varchar(30) not null,
     Email varchar(40) not null,
     constraint ID_Promotore_ID primary key (Codice),
     constraint SID_Promotore_ID unique (Email));

create table Propongono (
     Codice_Evento numeric(10) not null,
     Codice numeric(10) not null,
     constraint ID_Propongono_ID primary key (Codice_Evento, Codice));

create table Provincia (
     Codice varchar(5) not null,
     Nome varchar(30) not null,
     constraint ID_Provincia_ID primary key (Codice));

create table Rappresentano (
     Codice_Promotore numeric(10) not null,
     CF varchar(16) not null,
     constraint ID_Rappresentano_ID primary key (Codice_Promotore, CF));

create table Ricevimento (
     Codice numeric(10) not null,
     `Online` TINYINT(1) not null,
     Data_Inizio datetime not null,
     Data_Fine datetime not null,
     N_Slot numeric(3) not null,
     Codice_Uni numeric(10),
     Codice_Stanza numeric(4,3),
     Matricola numeric(10) not null,
     constraint ID_Ricevimento_ID primary key (Codice));

create table Richiesta_Evento (
     Codice numeric(10) not null,
     Tipo varchar(20) not null,
     Nome varchar(30),
     Posti numeric(6),
     Descrizione varchar(510),
     Codice_Evento numeric(10),
     Rappresentante varchar(16),
     Richiedente varchar(16),
     Richiedente_Inserimento numeric(10),
     constraint ID_Richiesta_Evento_ID primary key (Codice));

create table Richiesta_Orario (
     Codice numeric(10) not null,
     Tipo varchar(20) not null,
     Data_Inizio datetime,
     Data_Fine datetime,
     Codice_Orario numeric(10),
     Cod_Mat_Anno numeric(10),
     Codice_Modulo numeric(10),
     Codice_Uni numeric(10),
     Codice_Stanza numeric(4,3),
     Matricola numeric(10) not null,
     constraint ID_Richiesta_Orario_ID primary key (Codice));

create table Richiesta_Ricevimento (
     Codice numeric(10) not null,
     Inserimento TINYINT(1) not null,
     Matricola numeric(10) not null,
     Codice_Ric numeric(10),
     N_Slot numeric(3),
     Ricevimento numeric(10) not null,
     constraint ID_Richiesta_Ricevimento_ID primary key (Codice));

create table Sede (
     Codice numeric(10) not null,
     Codice_Prov varchar(5) not null,
     Codice_Citta varchar(5) not null,
     N_Civico numeric(6) not null,
     Nome varchar(30) not null,
     constraint SID_Sede_Indir_ID unique (Codice_Prov, Codice_Citta, N_Civico),
     constraint ID_Sede_ID primary key (Codice));

create table Segna (
     Codice_Evento numeric(10) not null,
     CF varchar(16) not null,
     constraint ID_Segna_ID primary key (Codice_Evento, CF));

create table Segreteria (
     Matricola numeric(10) not null,
     Codice_Uni numeric(10) not null,
     constraint ID_Segre_Siste_ID primary key (Matricola));

create table Seguito_In (
     Codice_Corso numeric(10) not null,
     Codice_Uni numeric(10) not null,
     constraint ID_Seguito_In_ID primary key (Codice_Uni, Codice_Corso));

create table Sistema_Universitario (
     Matricola numeric(10) not null,
     Email_Uni varchar(30) not null,
     Password varchar(20) not null,
     CF varchar(16) not null,
     constraint ID_Sistema_Universitario_ID primary key (Matricola),
     constraint SID_Sistema_Universitario_ID unique (Email_Uni));

create table Slot (
     Codice_Ric numeric(10) not null,
     N_Slot numeric(3) not null,
     Matricola numeric(10) not null,
     constraint ID_Slot_ID primary key (Codice_Ric, N_Slot));

create table Studente (
     Matricola numeric(10) not null,
     constraint ID_Stude_Siste_ID primary key (Matricola));

create table Thread (
     Cod_Unico numeric(60) not null,
     Cod_Forum numeric(1) not null,
     Cod_Canale numeric(10) not null,
     Codice numeric(10) not null,
     Titolo varchar(20) not null,
     Testo varchar(60000) not null,
     Data datetime not null,
     Likes numeric(10) not null,
     Dislike numeric(10) not null,
     Pin TINYINT(1) not null,
     Chiuso TINYINT(1) not null,
     No_Reply TINYINT(1) not null,
     Thread_Puntato numeric(60),
     Matricola numeric(10) not null,
     constraint SID_Thread_ID unique (Cod_Forum, Cod_Canale, Codice),
     constraint ID_Thread_ID primary key (Cod_Unico));

create table Tutor (
     Cod_Mat_Anno numeric(10) not null,
     Matricola numeric(10) not null,
     constraint ID_Tutor_ID primary key (Cod_Mat_Anno, Matricola));

create table Ufficio (
     Codice_Uni numeric(10) not null,
     Codice_Stanza numeric(4,3) not null,
     Matricola numeric(10) not null,
     constraint ID_Uffic_Unive_ID primary key (Codice_Uni, Codice_Stanza));

create table Universitario (
     Codice_Uni numeric(10) not null,
     Codice numeric(4,3) not null,
     Cod_Luogo numeric(10) not null,
     constraint ID_Universitario_ID primary key (Codice_Uni, Codice),
     constraint SID_Unive_Luogo_ID unique (Cod_Luogo));

# ---------------------------------------------------------------------- #
# Add info into "Canale"                                                 #
# ---------------------------------------------------------------------- #

truncate table Canale;

insert into Canale values (0, 0, "Comunicazioni Interne Docenti", 3, false, false);
insert into Canale values (0, 1, "Coordinamento Docenti–Rappresentanti", 2, false, false);
insert into Canale values (0, 2, "Avvisi Docenti e Rappresentanti", 2, true, true);
insert into Canale values (0, 3, "Avvisi Ufficiali ai Rappresentanti e Studenti", 3, true, true);

insert into Canale values (1, 0, "Chat Rappresentanti Studenti", 2, false, false);
insert into Canale values (1, 1, "Comunicazioni dei Rappresentanti", 2, true, true);
insert into Canale values (1, 2, "Discussioni Studentesche", 1, false, false);

insert into Canale values (2, 0, "Comunicazioni Interne Segreteria", 4, false, false);
insert into Canale values (2, 1, "Avvisi Segreteria ai Docenti", 4, true, false);
insert into Canale values (2, 2, "Coordinamento Segreteria–Docenti", 3, true, false);
insert into Canale values (2, 3, "Comunicazioni Ufficiali Generali", 3, true, true);

# ---------------------------------------------------------------------- #
# Add info into "Forum"                                                  #
# ---------------------------------------------------------------------- #

truncate table Forum;

insert into Forum values (0, "Forum Professori");
insert into Forum values (1, "Forum Studenti");
insert into Forum values (2, "Forum Generale");

# ---------------------------------------------------------------------- #
# Add info into "Esterno"                                                #
# ---------------------------------------------------------------------- #

truncate table Esterno;

insert into Esterno values (0,"RI", "RI", 76, 0);
insert into Esterno values (1,"BA", "BA", 6, 1);
insert into Esterno values (2,"CO", "CO", 142, 2);
insert into Esterno values (3,"VR", "ER", 121, 3);
insert into Esterno values (4,"TO", "TO", 83, 4);
insert into Esterno values (5,"AN", "AN", 79, 5);
insert into Esterno values (6,"TN", "AL", 60, 6);
insert into Esterno values (7,"AQ", "SC", 37, 7);
insert into Esterno values (8,"VE", "JE", 91, 8);
insert into Esterno values (9,"BZ", "CH", 71, 9);
insert into Esterno values (10,"SS", "SS", 58, 10);
insert into Esterno values (11,"SS", "MO", 109, 11);
insert into Esterno values (12,"KR", "VE", 60, 12);
insert into Esterno values (13,"SA", "SA", 80, 13);
insert into Esterno values (14,"CA", "CP", 83, 14);

# ---------------------------------------------------------------------- #
# Add info into "Indirizzo"                                              #
# ---------------------------------------------------------------------- #

truncate table indirizzo;

insert into Indirizzo values ("RI","RI", 76, "Galleria", "del Mulino");
insert into Indirizzo values ("BA","BA", 6, "Piazzale", "Porto");
insert into Indirizzo values ("CO","CO", 142, "Lungomare", "Italia");
insert into Indirizzo values ("VR","ER", 121, "Viale", "Università");
insert into Indirizzo values ("TO","TO", 83, "Corso", "Università");
insert into Indirizzo values ("AN","AN", 79, "Calle", "dei Pini");
insert into Indirizzo values ("TN","AL", 60, "Piazzale", "Michelangelo Buonarroti");
insert into Indirizzo values ("AQ","SC", 37, "Piazzale", "Antico");
insert into Indirizzo values ("VE","JE", 91, "Borgo", "Roma");
insert into Indirizzo values ("BZ","CH", 71, "Piazza", "degli Artigiani");
insert into Indirizzo values ("SS","SS", 58, "Largo", "delle Vigne");
insert into Indirizzo values ("SS","MO", 109, "Ponte", "San Francesco");
insert into Indirizzo values ("KR","VE", 60, "Contrada", "Marco Polo");
insert into Indirizzo values ("SA","SA", 80, "Ponte", "San Michele");
insert into Indirizzo values ("CA","CP", 83, "Piazzale", "Vecchio");

# ---------------------------------------------------------------------- #
# Add info into "Citta"                                                  #
# ---------------------------------------------------------------------- #

truncate table Citta;

insert into Citta values ("AO","AO","Aosta");
insert into Citta values ("AO","DO","Donnas");
insert into Citta values ("TO","TO","Torino");
insert into Citta values ("TO","FR","Front");
insert into Citta values ("AT","AT","Asti");
insert into Citta values ("AT","CO","Corsione");
insert into Citta values ("CN","CN","Cuneo");
insert into Citta values ("CN","CA","Carrù");
insert into Citta values ("MI","MI","Milano");
insert into Citta values ("MI","RH","Rho");
insert into Citta values ("CO","CO","Como");
insert into Citta values ("CO","ST","Stazzona");
insert into Citta values ("MN","MN","Mantova");
insert into Citta values ("MN","CG","Castel Goffredo");
insert into Citta values ("CR","CR","Cremona");
insert into Citta values ("CR","SB","San Bassano");
insert into Citta values ("BZ","BZ","Bolzano");
insert into Citta values ("BZ","CH","Chiusa");
insert into Citta values ("TN","TN","Trento");
insert into Citta values ("TN","AL","Ala");
insert into Citta values ("VE","VE","Venezia");
insert into Citta values ("VE","JE","Jesolo");
insert into Citta values ("PD","PD","Padova");
insert into Citta values ("PD","PS","Piove di Sacco");
insert into Citta values ("VR","VR","Verona");
insert into Citta values ("VR","ER","Erbe");
insert into Citta values ("GO","GO","Gorizia");
insert into Citta values ("GO","MO","Mossa");
insert into Citta values ("UD","UD","Udine");
insert into Citta values ("UD","TR","Tricesino");
insert into Citta values ("TS","TS","Trieste");
insert into Citta values ("TS","MU","Muggia");
insert into Citta values ("GE","GE","Genova");
insert into Citta values ("GE","ZO","Zoagli");
insert into Citta values ("SP","SP","La Spezia");
insert into Citta values ("SP","BE","Beverino");
insert into Citta values ("SV","SV","Savona");
insert into Citta values ("SV","SS","Borghetto Santo Spirito");
insert into Citta values ("BO","BO","Bologna");
insert into Citta values ("BO","IM","Imola");
insert into Citta values ("FC","FO","Forlì");
insert into Citta values ("FC","CE","Cesena");
insert into Citta values ("RA","RA","Ravenna");
insert into Citta values ("RA","CB","Castel Bolognese");
insert into Citta values ("AR","AR","Arezzo");
insert into Citta values ("AR","PO","Poppi");
insert into Citta values ("PI","PI","Pisa");
insert into Citta values ("PI","GT","San Giuliano Terme");
insert into Citta values ("FI","FI","Firenze");
insert into Citta values ("FI","FR","Firenzuola");
insert into Citta values ("PU","PE","Pesaro");
insert into Citta values ("PU","UD","Udine");
insert into Citta values ("AP","AP","Ascoli Piceno");
insert into Citta values ("AP","CA","Carassai");
insert into Citta values ("AN","AN","Ancona");
insert into Citta values ("AN","FO","Force");
insert into Citta values ("RM","RM","Roma");
insert into Citta values ("RM","MO","Montegallo");
insert into Citta values ("FR","FR","Frosinone");
insert into Citta values ("FR","CM","Cupra Marittima");
insert into Citta values ("RI","RI","Rieti");
insert into Citta values ("RI","BS","Belmonte in Sabina");
insert into Citta values ("AQ","AQ","L’Aquila");
insert into Citta values ("AQ","SC","Scoppito");
insert into Citta values ("CH","CH","Chieti");
insert into Citta values ("CH","AR","Archi");
insert into Citta values ("PG","PG","Perugia");
insert into Citta values ("PG","FO","Force");
insert into Citta values ("TR","TR","Terni");
insert into Citta values ("TR","BA","Baschi");
insert into Citta values ("NA","NA","Napoli");
insert into Citta values ("NA","MS","Massa di Somma");
insert into Citta values ("BN","BN","Benevento");
insert into Citta values ("BN","MA","Montefiore dell'Aso");
insert into Citta values ("SA","SA","Salerno");
insert into Citta values ("SA","CO","Corbara");
insert into Citta values ("CB","CB","Campobasso");
insert into Citta values ("CB","TO","Toro");
insert into Citta values ("BA","BA","Bari");
insert into Citta values ("BA","TU","Turi");
insert into Citta values ("BT","BA","Barletta");
insert into Citta values ("BT","AN","Andria");
insert into Citta values ("MT","MT","Matera");
insert into Citta values ("MT","SJ","Scanzano Jonico");
insert into Citta values ("PZ","PZ","Potenza");
insert into Citta values ("PZ","CA","Carbone");
insert into Citta values ("RC","RC","Reggio Calabria");
insert into Citta values ("RC","PL","Plati");
insert into Citta values ("KR","KR","Crotone");
insert into Citta values ("KR","VE","Verzino");
insert into Citta values ("PA","PA","Palermo");
insert into Citta values ("PA","GR","Gratteri");
insert into Citta values ("CT","CT","Catania");
insert into Citta values ("CT","MI","Milo");
insert into Citta values ("TP","TP","Trapani");
insert into Citta values ("TP","SN","Santa Ninfa");
insert into Citta values ("CA","CA","Cagliari");
insert into Citta values ("CA","CP","Capoterra");
insert into Citta values ("SS","SS","Sassari");
insert into Citta values ("SS","MO","Mores");

# ---------------------------------------------------------------------- #
# Add info into "Luogo"                                                  #
# ---------------------------------------------------------------------- #

truncate table Luogo;

insert into Luogo values (0,115, "Campo Sportivo");
insert into Luogo values (1,95, "Spazio Cultura");
insert into Luogo values (2,4220, "Anfiteatro");
insert into Luogo values (3,450, "Palazzetto Polifunzionale");
insert into Luogo values (4,90, "Palasport");
insert into Luogo values (5,3150, "Arena Concerti");
insert into Luogo values (6,60, "Teatro all'Aperto");
insert into Luogo values (7,120, "Palasport");
insert into Luogo values (8,335, "Campo Sportivo");
insert into Luogo values (9,44150, "Sala Consiliare");
insert into Luogo values (10,325, "Cinema Moderno");
insert into Luogo values (11,540, "Arena Comunale");
insert into Luogo values (12,210, "Palazzo della Cultura");
insert into Luogo values (13,115, "Palazzetto dello Sport");
insert into Luogo values (14,130, "Sala Conferenze");

# ---------------------------------------------------------------------- #
# Add info into "Persona"                                                #
# ---------------------------------------------------------------------- #

insert into Persona values ("DMCSRN57B50F875R","Serena","D'Amico","1957-02-10","serena.d'amico36@yahoo.it",1);
insert into Persona values ("PRSGNN08R52D491D","Giovanna","Piras","2008-10-12","giovanna.piras42@gmail.com",4);
insert into Persona values ("CNITMS99C09H703L","Tommaso","Iacono","1999-03-09","tommaso.iacono94@libero.it",1);
insert into Persona values ("CNIFNC83E19D394D","Francesco","Iacono","1983-05-19","francesco.iacono36@gmail.com",3);
insert into Persona values ("CLMCSR80B23H224A","Cesare","Colombo","1980-02-23","cesare.colombo77@yahoo.it",0);
insert into Persona values ("VTLMRC92H28D491V","Marco","Vitale","1992-06-28","marco.vitale4@yahoo.it",0);
insert into Persona values ("PLLNRC56S08I134V","Enrico","Pellegrini","1956-11-08","enrico.pellegrini75@yahoo.it",1);
insert into Persona values ("SLANCL68P11G484W","Nicolò","Sala","1968-09-11","nicolò.sala70@hotmail.com",0);
insert into Persona values ("LMBMSM92P04B861X","Massimo","Lombardi","1992-09-04","massimo.lombardi5@yahoo.it",3);
insert into Persona values ("ZNTNCL93P13G273X","Nicolò","Zanetti","1993-09-13","nicolò.zanetti43@gmail.com",1);
insert into Persona values ("NPLFNC59M04H703E","Francesco","Napolitano","1959-08-04","francesco.napolitano88@hotmail.com",4);
insert into Persona values ("VNTGLI96C70C724J","Giulia","Ventura","1996-03-30","giulia.ventura66@gmail.com",3);
insert into Persona values ("NPLFPP91C21G915Q","Filippo","Napolitano","1991-03-21","filippo.napolitano13@gmail.com",3);
insert into Persona values ("SRRLSN74H26L219Y","Alessandro","Sorrentino","1974-06-26","alessandro.sorrentino64@hotmail.com",4);
insert into Persona values ("CNTMRC71D08B207F","Marco","Conti","1971-04-08","marco.conti13@libero.it",1);
insert into Persona values ("SPSNCL77L10G224E","Nicola","Esposito","1977-07-10","nicola.esposito18@gmail.com",1);
insert into Persona values ("PRSSSH07M28G484G","Sasha","Piras","2007-08-28","sasha.piras55@libero.it",4);
insert into Persona values ("CNISMN85T28L424I","Simone","Iacono","1985-12-28","simone.iacono62@yahoo.it",1);
insert into Persona values ("NRENNA64B49F776Z","Anna","Neri","1964-02-09","anna.neri98@hotmail.com",1);
insert into Persona values ("ZCCCLL58B61F205H","Camilla","Zuccaro","1958-02-21","camilla.zuccaro25@gmail.com",1);
insert into Persona values ("CNICRL85T10I239T","Carlo","Iacono","1985-12-10","carlo.iacono28@yahoo.it",0);
insert into Persona values ("FZADNC77B24D949G","Domenico","Fazio","1977-02-24","domenico.fazio0@yahoo.it",0);
insert into Persona values ("MRNGRG71M12E376I","Giorgio","Moroni","1971-08-12","giorgio.moroni87@libero.it",1);
insert into Persona values ("CRSDGI57H28A913F","Diego","Crespi","1957-06-28","diego.crespi18@gmail.com",1);
insert into Persona values ("CNIMNL04B27F205L","Emanuele","Iacono","2004-02-27","emanuele.iacono97@gmail.com",1);
insert into Persona values ("FRRCST02E13H223W","Celeste","Ferretti","2002-05-13","celeste.ferretti20@hotmail.com",3);
insert into Persona values ("DMCLCU91S70F205J","Lucia","D'Amico","1991-11-30","lucia.d'amico99@hotmail.com",0);
insert into Persona values ("VLNDVD69E21A310L","Davide","Valentini","1969-05-21","davide.valentini77@yahoo.it",1);
insert into Persona values ("VRDGRL07R29A662I","Gabriele","Verdi","2007-10-29","gabriele.verdi90@gmail.com",3);
insert into Persona values ("BRMDVD84P02A587E","Davide","Brambilla","1984-09-02","davide.brambilla26@libero.it",0);
insert into Persona values ("GRSLND08C59C724G","Linda","Grassi","2008-03-19","linda.grassi10@yahoo.it",2);
insert into Persona values ("NRECRL80D05D949N","Carlo","Neri","1980-04-05","carlo.neri55@hotmail.com",1);
insert into Persona values ("NREDNL98P01A913Z","Daniele","Neri","1998-09-01","daniele.neri54@libero.it",0);
insert into Persona values ("VRDLRA89B52A037W","Laura","Verdi","1989-02-12","laura.verdi25@yahoo.it",4);
insert into Persona values ("NNCPRZ61M68H266K","Patrizia","Innocenti","1961-08-28","patrizia.innocenti47@libero.it",0);
insert into Persona values ("RMNFPP01R05F572A","Filippo","Armani","2001-10-05","filippo.armani36@hotmail.com",0);
insert into Persona values ("LCCGRL98H12G930D","Gabriel","Lucchesi","1998-06-12","gabriel.lucchesi59@hotmail.com",1);
insert into Persona values ("ZCCNTN64M06A662G","Antonio","Zuccaro","1964-08-06","antonio.zuccaro70@yahoo.it",1);
insert into Persona values ("TSTCLD63L54D491W","Claudia","Testa","1963-07-14","claudia.testa44@libero.it",0);
insert into Persona values ("VNTWTR86L13I134F","Walter","Ventura","1986-07-13","walter.ventura89@yahoo.it",3);
insert into Persona values ("GLLLCU94E63L424C","Lucia","Gallo","1994-05-23","lucia.gallo5@gmail.com",0);
insert into Persona values ("ZCCRNI79S64G715X","Irene","Zuccaro","1979-11-24","irene.zuccaro85@libero.it",1);
insert into Persona values ("DNTSLV76H58I309J","Silvia","Donati","1976-06-18","silvia.donati62@gmail.com",1);
insert into Persona values ("SPSGNN04S61C724P","Giovanna","Esposito","2004-11-21","giovanna.esposito6@libero.it",2);
insert into Persona values ("MNTGLI00H45G915X","Giulia","Monti","2000-06-05","giulia.monti76@gmail.com",1);
insert into Persona values ("CNIDNS80M17D433N","Denis","Iacono","1980-08-17","denis.iacono91@gmail.com",0);
insert into Persona values ("CRSLCU67P42A587A","Lucia","Caruso","1967-09-02","lucia.caruso52@hotmail.com",0);
insert into Persona values ("CPTGLI63R70A794F","Giulia","Caputo","1963-10-30","giulia.caputo69@hotmail.com",1);
insert into Persona values ("FRRRRT95E07G715D","Roberto","Ferretti","1995-05-07","roberto.ferretti58@yahoo.it",0);
insert into Persona values ("MRCPTR72S20D969D","Pietro","Marchetti","1972-11-20","pietro.marchetti0@libero.it",1);
insert into Persona values ("FRRNGL56T42H266K","Angela","Ferrari","1956-12-02","angela.ferrari0@libero.it",3);
insert into Persona values ("NREMTT85L17C792C","Matteo","Neri","1985-07-17","matteo.neri76@libero.it",1);
insert into Persona values ("FRNCRL07M03C365Q","Carlo","Franco","2007-08-03","carlo.franco47@libero.it",0);
insert into Persona values ("PRSCRS01H22L402V","Christian","Piras","2001-06-22","christian.piras73@yahoo.it",1);
insert into Persona values ("BRBLCA78E65A662W","Alice","Barbieri","1978-05-25","alice.barbieri75@hotmail.com",0);
insert into Persona values ("VTLGNN69P68B440X","Giovanna","Vitale","1969-09-28","giovanna.vitale63@gmail.com",3);
insert into Persona values ("FRRLNE61M50A037S","Elena","Ferretti","1961-08-10","elena.ferretti77@hotmail.com",1);
insert into Persona values ("PGLRFL03M08B354B","Raffaele","Puglisi","2003-08-08","raffaele.puglisi50@libero.it",0);
insert into Persona values ("GNTNNL66C57D276W","Antonella","Gentile","1966-03-17","antonella.gentile88@hotmail.com",1);
insert into Persona values ("FRRNNL89S58D969D","Antonella","Ferrari","1989-11-18","antonella.ferrari42@libero.it",3);
insert into Persona values ("DMCRTI59S62A662S","Rita","D'Amico","1959-11-22","rita.d'amico41@gmail.com",1);
insert into Persona values ("BNVPLA56B42C365I","Paola","Bonaventura","1956-02-02","paola.bonaventura18@yahoo.it",1);
insert into Persona values ("LNGVCN91R10G859M","Vincenzo","Longo","1991-10-10","vincenzo.longo41@gmail.com",3);
insert into Persona values ("VRDRCR64R09D433B","Riccardo","Verdi","1964-10-09","riccardo.verdi81@gmail.com",0);
insert into Persona values ("CNIMRO69B15B861T","Omar","Iacono","1969-02-15","omar.iacono48@libero.it",1);
insert into Persona values ("BRNLSN67E29C724P","Alessandro","Bernardi","1967-05-29","alessandro.bernardi75@gmail.com",3);
insert into Persona values ("BTASRA95L53C724C","Sara","Abate","1995-07-13","sara.abate30@libero.it",4);
insert into Persona values ("VLNLNZ03D24C118Z","Lorenzo","Valentini","2003-04-24","lorenzo.valentini40@libero.it",1);
insert into Persona values ("VRDGRG06T30C986J","Giorgio","Verdi","2006-12-30","giorgio.verdi54@yahoo.it",4);
insert into Persona values ("RMNCST61H60D433T","Celeste","Romano","1961-06-20","celeste.romano97@yahoo.it",1);
insert into Persona values ("CNTMNL00H03C351Y","Emanuele","Conti","2000-06-03","emanuele.conti58@yahoo.it",1);
insert into Persona values ("CNIRCR60P07H501P","Riccardo","Iacono","1960-09-07","riccardo.iacono13@hotmail.com",0);
insert into Persona values ("LNGFNC77S46A587K","Francesca","Longo","1977-11-06","francesca.longo99@libero.it",0);
insert into Persona values ("CNILGU97R15C792Y","Luigi","Iacono","1997-10-15","luigi.iacono99@gmail.com",1);
insert into Persona values ("BSSNDR63C48C986R","Andrea","Basso","1963-03-08","andrea.basso54@hotmail.com",1);
insert into Persona values ("ZNTDNC84L11B858F","Domenico","Zanetti","1984-07-11","domenico.zanetti84@libero.it",1);
insert into Persona values ("SLARTI80L65A643P","Rita","Sala","1980-07-25","rita.sala17@hotmail.com",4);
insert into Persona values ("TSCLRT73M13H223A","Alberto","Toscano","1973-08-13","alberto.toscano59@gmail.com",2);
insert into Persona values ("TSTMHL97M20B882A","Michele","Testa","1997-08-20","michele.testa86@yahoo.it",1);
insert into Persona values ("RNASSH06C01A643H","Sasha","Arena","2006-03-01","sasha.arena7@yahoo.it",3);
insert into Persona values ("FRNNNL02T62L378Y","Antonella","Franco","2002-12-22","antonella.franco84@gmail.com",1);
insert into Persona values ("MZZMTT94C19B861V","Matteo","Mazza","1994-03-19","matteo.mazza76@gmail.com",3);
insert into Persona values ("CSTSLV06H65L219T","Silvia","Costa","2006-06-25","silvia.costa33@yahoo.it",1);
insert into Persona values ("DBNVLR95L29D276L","Valerio","Di Benedetto","1995-07-29","valerio.di benedetto32@gmail.com",3);
insert into Persona values ("NGLSFO75C52D230I","Sofia","Angelini","1975-03-12","sofia.angelini39@gmail.com",1);
insert into Persona values ("NRELXA93E42D525N","Alex","Neri","1993-05-02","alex.neri2@gmail.com",1);
insert into Persona values ("BNCNTN57S24C792S","Antonio","Bianchi","1957-11-24","antonio.bianchi70@libero.it",3);
insert into Persona values ("VTLMSM83B20I386Q","Massimo","Vitale","1983-02-20","massimo.vitale31@gmail.com",0);
insert into Persona values ("RNLNGL87A67C986S","Angela","Rinaldi","1987-01-27","angela.rinaldi27@yahoo.it",1);
insert into Persona values ("FRRMTT05L26D230G","Matteo","Ferrari","2005-07-26","matteo.ferrari96@gmail.com",0);
insert into Persona values ("CLBJCP02S16L219Y","Jacopo","Calabrese","2002-11-16","jacopo.calabrese16@libero.it",0);
insert into Persona values ("SNTNNA07B49L424U","Anna","Santoro","2007-02-09","anna.santoro64@hotmail.com",3);
insert into Persona values ("LRSKVN89A18H196E","Kevin","Lorusso","1989-01-18","kevin.lorusso51@hotmail.com",1);
insert into Persona values ("BRBRFL75P30C887R","Raffaele","Barbieri","1975-09-30","raffaele.barbieri50@hotmail.com",1);
insert into Persona values ("LRSSFN62L01C365K","Stefano","Lorusso","1962-07-01","stefano.lorusso59@yahoo.it",1);
insert into Persona values ("LMBNCL58P20F776A","Nicola","Lombardi","1958-09-20","nicola.lombardi91@libero.it",1);
insert into Persona values ("DLCLRA95T45I143C","Laura","De Luca","1995-12-05","laura.de luca57@gmail.com",0);
insert into Persona values ("PGLNMO07S52D760Z","Noemi","Puglisi","2007-11-12","noemi.puglisi73@hotmail.com",1);
insert into Persona values ("TSCLNZ75B02H223Z","Lorenzo","Toscano","1975-02-02","lorenzo.toscano49@hotmail.com",3);
insert into Persona values ("FRRRNN70T48G715L","Arianna","Ferrari","1970-12-08","arianna.ferrari79@hotmail.com",1);

# ---------------------------------------------------------------------- #
# Add info into "Professore"                                             #
# ---------------------------------------------------------------------- #

insert into Professore values (3);
insert into Professore values (5);
insert into Professore values (8);
insert into Professore values (9);
insert into Professore values (20);
insert into Professore values (22);
insert into Professore values (28);
insert into Professore values (35);
insert into Professore values (38);
insert into Professore values (41);
insert into Professore values (44);
insert into Professore values (46);
insert into Professore values (58);
insert into Professore values (60);
insert into Professore values (62);
insert into Professore values (65);
insert into Professore values (67);
insert into Professore values (73);

# ---------------------------------------------------------------------- #
# Add info into "Provincia"                                              #
# ---------------------------------------------------------------------- #

truncate table Provincia;

insert into Provincia values ("AO","Aosta");
insert into Provincia values ("TO","Torino");
insert into Provincia values ("AT","Asti");
insert into Provincia values ("CN","Cuneo");
insert into Provincia values ("MI","Milano");
insert into Provincia values ("CO","Como");
insert into Provincia values ("MN","Mantova");
insert into Provincia values ("CR","Cremona");
insert into Provincia values ("BZ","Bolzano");
insert into Provincia values ("TN","Trento");
insert into Provincia values ("VE","Venezia");
insert into Provincia values ("PD","Padova");
insert into Provincia values ("VR","Verona");
insert into Provincia values ("GO","Gorizia");
insert into Provincia values ("UD","Udine");
insert into Provincia values ("TS","Trieste");
insert into Provincia values ("GE","Genova");
insert into Provincia values ("SP","La Spezia");
insert into Provincia values ("SV","Savona");
insert into Provincia values ("BO","Bologna");
insert into Provincia values ("FC","Forlì-Cesena");
insert into Provincia values ("RA","Ravenna");
insert into Provincia values ("AR","Arezzo");
insert into Provincia values ("PI","Pisa");
insert into Provincia values ("FI","Firenze");
insert into Provincia values ("PU","Pesaro-Urbino");
insert into Provincia values ("AP","Ascoli Piceno");
insert into Provincia values ("AN","Ancona");
insert into Provincia values ("RM","Roma");
insert into Provincia values ("FR","Frosinone");
insert into Provincia values ("RI","Rieti");
insert into Provincia values ("AQ","L'Aquila");
insert into Provincia values ("CH","Chieti");
insert into Provincia values ("PG","Perugia");
insert into Provincia values ("TR","Terni");
insert into Provincia values ("NA","Napoli");
insert into Provincia values ("BN","Benevento");
insert into Provincia values ("SA","Salerno");
insert into Provincia values ("CB","Campobasso");
insert into Provincia values ("BA","Bari");
insert into Provincia values ("BT","Barletta-Andria-Trani");
insert into Provincia values ("MT","Matera");
insert into Provincia values ("PZ","Potenza");
insert into Provincia values ("RC","Reggio Calabria");
insert into Provincia values ("KR","Crotone");
insert into Provincia values ("PA","Palermo");
insert into Provincia values ("CT","Catania");
insert into Provincia values ("TP","Trapani");
insert into Provincia values ("CA","Cagliari");
insert into Provincia values ("SS","Sassari");

# ---------------------------------------------------------------------- #
# Add info into "Segreteria"                                             #
# ---------------------------------------------------------------------- #

/*insert into Segreteria values (1,4);
insert into Segreteria values (7,3);
insert into Segreteria values (10,9);
insert into Segreteria values (13,4);
insert into Segreteria values (25,6);
insert into Segreteria values (47,3);
insert into Segreteria values (49,7);
insert into Segreteria values (55,8);*/

# ---------------------------------------------------------------------- #
# Add info into "Sistema Universitario"                                  #
# ---------------------------------------------------------------------- #

insert into Sistema_Universitario values (0,"serena.d'amico55@studio.unibo.it","svtn55dmg3","DMCSRN57B50F875R");
insert into Sistema_Universitario values (1,"giovanna.piras@studio.unibo.it","u76mw7obsm","PRSGNN08R52D491D");
insert into Sistema_Universitario values (2,"tommaso.iacono@studio.unibo.it","5lra2za3mr","CNITMS99C09H703L");
insert into Sistema_Universitario values (3,"francesco.iacono@studio.unibo.it","tb0bfph3ib","CNIFNC83E19D394D");
insert into Sistema_Universitario values (4,"enrico.pellegrini@studio.unibo.it","x78t2hmnwi","PLLNRC56S08I134V");
insert into Sistema_Universitario values (5,"massimo.lombardi@studio.unibo.it","7bh6st5t9c","LMBMSM92P04B861X");
insert into Sistema_Universitario values (6,"nicolò.zanetti20@studio.unibo.it","w4lvd155dt","ZNTNCL93P13G273X");
insert into Sistema_Universitario values (7,"francesco.napolitano32@studio.unibo.it","l2a5sam2wz","NPLFNC59M04H703E");
insert into Sistema_Universitario values (8,"giulia.ventura@studio.unibo.it","f5awjr3z6g","VNTGLI96C70C724J");
insert into Sistema_Universitario values (9,"filippo.napolitano20@studio.unibo.it","hx4gs9y9jf","NPLFPP91C21G915Q");
insert into Sistema_Universitario values (10,"alessandro.sorrentino62@studio.unibo.it","wg6py6d1u2","SRRLSN74H26L219Y");
insert into Sistema_Universitario values (11,"marco.conti@studio.unibo.it","lm8756lwbz","CNTMRC71D08B207F");
insert into Sistema_Universitario values (12,"nicola.esposito62@studio.unibo.it","g9vd8o4mkf","SPSNCL77L10G224E");
insert into Sistema_Universitario values (13,"sasha.piras88@studio.unibo.it","uz3ljqmbqp","PRSSSH07M28G484G");
insert into Sistema_Universitario values (14,"simone.iacono@studio.unibo.it","k8bidf7lal","CNISMN85T28L424I");
insert into Sistema_Universitario values (15,"anna.neri@studio.unibo.it","v898z2tqig","NRENNA64B49F776Z");
insert into Sistema_Universitario values (16,"camilla.zuccaro38@studio.unibo.it","9exiqg730e","ZCCCLL58B61F205H");
insert into Sistema_Universitario values (17,"giorgio.moroni20@studio.unibo.it","i6oqwixngg","MRNGRG71M12E376I");
insert into Sistema_Universitario values (18,"diego.crespi44@studio.unibo.it","eydrusxwmp","CRSDGI57H28A913F");
insert into Sistema_Universitario values (19,"emanuele.iacono@studio.unibo.it","m158x2dkwi","CNIMNL04B27F205L");
insert into Sistema_Universitario values (20,"celeste.ferretti@studio.unibo.it","8h2umb56zv","FRRCST02E13H223W");
insert into Sistema_Universitario values (21,"davide.valentini91@studio.unibo.it","qu48lo0co7","VLNDVD69E21A310L");
insert into Sistema_Universitario values (22,"gabriele.verdi@studio.unibo.it","u6vubsw4rd","VRDGRL07R29A662I");
insert into Sistema_Universitario values (23,"linda.grassi17@studio.unibo.it","u0jj4kjeqg","GRSLND08C59C724G");
insert into Sistema_Universitario values (24,"carlo.neri57@studio.unibo.it","qhohmvfdls","NRECRL80D05D949N");
insert into Sistema_Universitario values (25,"laura.verdi@studio.unibo.it","eo3nuakv2q","VRDLRA89B52A037W");
insert into Sistema_Universitario values (26,"gabriel.lucchesi76@studio.unibo.it","l4p120zdw2","LCCGRL98H12G930D");
insert into Sistema_Universitario values (27,"antonio.zuccaro69@studio.unibo.it","rke9q5xmop","ZCCNTN64M06A662G");
insert into Sistema_Universitario values (28,"walter.ventura79@studio.unibo.it","wb6wwz5n22","VNTWTR86L13I134F");
insert into Sistema_Universitario values (29,"irene.zuccaro26@studio.unibo.it","21t74pqbyp","ZCCRNI79S64G715X");
insert into Sistema_Universitario values (30,"silvia.donati73@studio.unibo.it","a85l407lmm","DNTSLV76H58I309J");
insert into Sistema_Universitario values (31,"giovanna.esposito38@studio.unibo.it","39dmbf27cj","SPSGNN04S61C724P");
insert into Sistema_Universitario values (32,"giulia.monti92@studio.unibo.it","echl8qq0pi","MNTGLI00H45G915X");
insert into Sistema_Universitario values (33,"giulia.caputo@studio.unibo.it","h7fa6lm3bz","CPTGLI63R70A794F");
insert into Sistema_Universitario values (34,"pietro.marchetti@studio.unibo.it","fuxpxye21e","MRCPTR72S20D969D");
insert into Sistema_Universitario values (35,"angela.ferrari55@studio.unibo.it","nbbqgut3av","FRRNGL56T42H266K");
insert into Sistema_Universitario values (36,"matteo.neri@studio.unibo.it","bwa2ven8ug","NREMTT85L17C792C");
insert into Sistema_Universitario values (37,"christian.piras26@studio.unibo.it","oew1ih6ko9","PRSCRS01H22L402V");
insert into Sistema_Universitario values (38,"giovanna.vitale76@studio.unibo.it","3rtpusrj41","VTLGNN69P68B440X");
insert into Sistema_Universitario values (39,"elena.ferretti48@studio.unibo.it","ze0oj4z1yy","FRRLNE61M50A037S");
insert into Sistema_Universitario values (40,"antonella.gentile32@studio.unibo.it","21rng9scn4","GNTNNL66C57D276W");
insert into Sistema_Universitario values (41,"antonella.ferrari60@studio.unibo.it","s9uvu5r9st","FRRNNL89S58D969D");
insert into Sistema_Universitario values (42,"rita.d'amico47@studio.unibo.it","0aj1pp4ecw","DMCRTI59S62A662S");
insert into Sistema_Universitario values (43,"paola.bonaventura@studio.unibo.it","6ymncgq4t8","BNVPLA56B42C365I");
insert into Sistema_Universitario values (44,"vincenzo.longo18@studio.unibo.it","tfxkq5vgyb","LNGVCN91R10G859M");
insert into Sistema_Universitario values (45,"omar.iacono@studio.unibo.it","r7qngl7ynl","CNIMRO69B15B861T");
insert into Sistema_Universitario values (46,"alessandro.bernardi22@studio.unibo.it","8wyd0efwdi","BRNLSN67E29C724P");
insert into Sistema_Universitario values (47,"sara.abate@studio.unibo.it","5lss7ut55r","BTASRA95L53C724C");
insert into Sistema_Universitario values (48,"lorenzo.valentini49@studio.unibo.it","03ktkad7jg","VLNLNZ03D24C118Z");
insert into Sistema_Universitario values (49,"giorgio.verdi44@studio.unibo.it","6jb3907i22","VRDGRG06T30C986J");
insert into Sistema_Universitario values (50,"celeste.romano@studio.unibo.it","q6yn6icigp","RMNCST61H60D433T");
insert into Sistema_Universitario values (51,"emanuele.conti@studio.unibo.it","ot2gj4rdvy","CNTMNL00H03C351Y");
insert into Sistema_Universitario values (52,"luigi.iacono89@studio.unibo.it","sto6lu3l5q","CNILGU97R15C792Y");
insert into Sistema_Universitario values (53,"andrea.basso30@studio.unibo.it","gzbyq29iow","BSSNDR63C48C986R");
insert into Sistema_Universitario values (54,"domenico.zanetti@studio.unibo.it","lghu4n3sbo","ZNTDNC84L11B858F");
insert into Sistema_Universitario values (55,"rita.sala31@studio.unibo.it","tmyf1ulshb","SLARTI80L65A643P");
insert into Sistema_Universitario values (56,"alberto.toscano@studio.unibo.it","zmsfvtz5ub","TSCLRT73M13H223A");
insert into Sistema_Universitario values (57,"michele.testa@studio.unibo.it","kk3r6uv1og","TSTMHL97M20B882A");
insert into Sistema_Universitario values (58,"sasha.arena@studio.unibo.it","ioayjrk0jy","RNASSH06C01A643H");
insert into Sistema_Universitario values (59,"antonella.franco28@studio.unibo.it","265oc3lub3","FRNNNL02T62L378Y");
insert into Sistema_Universitario values (60,"matteo.mazza44@studio.unibo.it","t6kmm8x2rj","MZZMTT94C19B861V");
insert into Sistema_Universitario values (61,"silvia.costa47@studio.unibo.it","2fn92rdltb","CSTSLV06H65L219T");
insert into Sistema_Universitario values (62,"valerio.di benedetto50@studio.unibo.it","5hpbyo8r07","DBNVLR95L29D276L");
insert into Sistema_Universitario values (63,"sofia.angelini79@studio.unibo.it","vluxnni1u8","NGLSFO75C52D230I");
insert into Sistema_Universitario values (64,"alex.neri40@studio.unibo.it","ho841od0ro","NRELXA93E42D525N");
insert into Sistema_Universitario values (65,"antonio.bianchi17@studio.unibo.it","024ommdk7x","BNCNTN57S24C792S");
insert into Sistema_Universitario values (66,"angela.rinaldi37@studio.unibo.it","kmj5gt5g6l","RNLNGL87A67C986S");
insert into Sistema_Universitario values (67,"anna.santoro@studio.unibo.it","n5tnqibgvh","SNTNNA07B49L424U");
insert into Sistema_Universitario values (68,"kevin.lorusso@studio.unibo.it","ouuiu5nof1","LRSKVN89A18H196E");
insert into Sistema_Universitario values (69,"raffaele.barbieri@studio.unibo.it","iq4e2kieno","BRBRFL75P30C887R");
insert into Sistema_Universitario values (70,"stefano.lorusso51@studio.unibo.it","nexa7bvhie","LRSSFN62L01C365K");
insert into Sistema_Universitario values (71,"nicola.lombardi14@studio.unibo.it","dooi8vicd6","LMBNCL58P20F776A");
insert into Sistema_Universitario values (72,"noemi.puglisi@studio.unibo.it","ct7b77t9ce","PGLNMO07S52D760Z");
insert into Sistema_Universitario values (73,"lorenzo.toscano88@studio.unibo.it","gf4io03jks","TSCLNZ75B02H223Z");
insert into Sistema_Universitario values (74,"arianna.ferrari@studio.unibo.it","2um7t2eahj","FRRRNN70T48G715L");

# ---------------------------------------------------------------------- #
# Add info into "Studente"                                               #
# ---------------------------------------------------------------------- #

insert into Studente values (0);
insert into Studente values (2);
insert into Studente values (4);
insert into Studente values (6);
insert into Studente values (11);
insert into Studente values (12);
insert into Studente values (14);
insert into Studente values (15);
insert into Studente values (16);
insert into Studente values (17);
insert into Studente values (18);
insert into Studente values (19);
insert into Studente values (21);
insert into Studente values (23);
insert into Studente values (24);
insert into Studente values (26);
insert into Studente values (27);
insert into Studente values (29);
insert into Studente values (30);
insert into Studente values (31);
insert into Studente values (32);
insert into Studente values (33);
insert into Studente values (34);
insert into Studente values (36);
insert into Studente values (37);
insert into Studente values (39);
insert into Studente values (40);
insert into Studente values (42);
insert into Studente values (43);
insert into Studente values (45);
insert into Studente values (48);
insert into Studente values (50);
insert into Studente values (51);
insert into Studente values (52);
insert into Studente values (53);
insert into Studente values (54);
insert into Studente values (56);
insert into Studente values (57);
insert into Studente values (59);
insert into Studente values (61);
insert into Studente values (63);
insert into Studente values (64);
insert into Studente values (66);
insert into Studente values (68);
insert into Studente values (69);
insert into Studente values (70);
insert into Studente values (71);
insert into Studente values (72);
insert into Studente values (74);

# ---------------------------------------------------------------------- #
# Add info into "Thread"                                                 #
# ---------------------------------------------------------------------- #

insert into Thread values
(0, 0, 0, 0,
 "Riunione dipartimento",
 "La riunione del dipartimento si terrà venerdì alle ore 15 in aula docenti.",
 "2026-01-10 09:30:00",
 5, 0, 1, 0, 1, null, 3);
insert into Thread values
(1, 0, 0, 1,
 "Sostituzioni docenti assenti",
 "Inserire qui le disponibilità per eventuali sostituzioni della prossima settimana.",
 "2026-01-11 08:15:00",
 3, 0, 0, 0, 0, null, 5);
 
 insert into Thread values
(2, 0, 3, 0,
 "Calendario verifiche",
 "Il calendario delle verifiche del mese è disponibile sul registro elettronico.",
 "2026-01-12 10:00:00",
 12, 1, 1, 0, 1, null, 8);
 
 
 insert into Thread values
(3, 1, 0, 0,
 "Assemblea di istituto",
 "Proposte per i temi dell’assemblea del prossimo mese.",
 "2026-01-13 14:20:00",
 8, 0, 0, 0, 0, null, 23);
 
 insert into Thread values
(4, 1, 1, 0,
 "Incontro con i docenti",
 "L’incontro con i docenti rappresentanti si terrà martedì alle 11.",
 "2026-01-14 09:00:00",
 15, 2, 1, 0, 1, null, 31);
 
 insert into Thread values
(5, 1, 2, 0,
 "Gita scolastica",
 "Avete idee per la prossima gita scolastica?",
 "2026-01-15 16:45:00",
 20, 3, 0, 0, 0, null, 23);
insert into Thread values
(6, 1, 2, 1,
 "Orario lezioni",
 "Che ne pensate del nuovo orario delle lezioni?",
 "2026-01-16 12:10:00",
 10, 1, 0, 0, 0, null, 24);
 
 
 insert into Thread values
(7, 2, 3, 0,
 "Chiusura scuola",
 "La scuola resterà chiusa lunedì per manutenzione straordinaria.",
 "2026-01-17 07:30:00",
 50, 0, 1, 1, 1, null, 1);

-- Constraints Section
-- ___________________

alter table Agg_Collaboratore add constraint REF_Agg_C_Perso_FK
     foreign key (CF)
     references Persona(CF);

alter table Agg_Collaboratore add constraint REF_Agg_C_Richi
     foreign key (Codice_Richiesta)
     references Richiesta_Evento(Codice);

alter table Agg_Promotore add constraint REF_Agg_P_Richi_FK
     foreign key (Codice_Richiesta)
     references Richiesta_Evento(Codice);

alter table Agg_Promotore add constraint REF_Agg_P_Promo
     foreign key (Codice_Promotore)
     references Promotore(Codice);

alter table Cambiare_Orario add constraint REF_Cambi_Luogo_FK
     foreign key (Codice_Luogo)
     references Luogo(Codice);

alter table Cambiare_Orario add constraint REF_Cambi_Richi_FK
     foreign key (Codice_Ric)
     references Richiesta_Evento(Codice);

alter table Cambiare_Orario add constraint REF_Cambi_Orari
     foreign key (Codice_Orario)
     references Orario_Evento(Codice);

alter table Canale add constraint REF_Canal_Forum
     foreign key (Cod_Forum)
     references Forum(Codice);

alter table Citta add constraint REF_Citta_Provi
     foreign key (Codice_Prov)
     references Provincia(Codice);

alter table Classe add constraint ID_Class_Unive_FK
     foreign key (Codice_Uni, Codice_Stanza)
     references Universitario(Codice_Uni, Codice);

alter table Collaboratore add constraint REF_Colla_Perso_FK
     foreign key (CF)
     references Persona(CF);

alter table Collaboratore add constraint REF_Colla_Event
     foreign key (Codice_Evento)
     references Evento(Codice);

alter table Composto_Da add constraint REF_Compo_Mater
     foreign key (Cod_Mat_Anno)
     references Materia_Anno(Cod_Mat_Anno);

alter table Composto_Da add constraint REF_Compo_Piano_FK
     foreign key (Codice_PianoDid)
     references Piano_Didattico(Codice_PianoDid);

alter table Corso add constraint REF_Corso_Ambit_FK
     foreign key (Ambito)
     references Ambito(Nome);

alter table Elemento add constraint REF_Eleme_Threa_FK
     foreign key (Cod_Unico_Thread)
     references Thread(Cod_Unico);

alter table Elemento add constraint REF_Eleme_Messa_FK
     foreign key (Cod_Unico_Messaggio)
     references Messaggio(Cod_Unico);

alter table Elemento add constraint EXTONE_Elemento
     check((Cod_Unico_Thread is not null and Cod_Unico_Messaggio is null)
          or (Cod_Unico_Thread is null and Cod_Unico_Messaggio is not null));

alter table Elim_Collaboratore add constraint REF_Elim__Perso_FK
     foreign key (CF)
     references Persona(CF);

alter table Elim_Collaboratore add constraint REF_Elim__Richi_1
     foreign key (Codice_Richiesta)
     references Richiesta_Evento(Codice);

alter table Elim_Promotore add constraint REF_Elim__Richi_FK
     foreign key (Codice_Richiesta)
     references Richiesta_Evento(Codice);

alter table Elim_Promotore add constraint REF_Elim__Promo
     foreign key (Codice_Promotore)
     references Promotore(Codice);

alter table Esterno add constraint SID_Ester_Indir_FK
     foreign key (Codice_Prov, Codice_Citta, N_Civico)
     references Indirizzo(Codice_Prov, Codice_Citta, N_Civico);

alter table Esterno add constraint SID_Ester_Luogo_FK
     foreign key (Cod_Luogo)
     references Luogo(Codice);

alter table Evento add constraint REF_Event_Perso_FK
     foreign key (CF)
     references Persona(CF);

alter table Formato_Da add constraint REF_Forma_Corso_FK
     foreign key (Codice_Corso)
     references Corso(Codice);

alter table Formato_Da add constraint REF_Forma_Mater
     foreign key (Codice_Mat)
     references Materia(Codice);

alter table Indirizzo add constraint REF_Indir_Citta
     foreign key (Codice_Prov, Codice_Citta)
     references Citta(Codice_Prov, Codice);

alter table Inoltrare_Messaggio add constraint REF_Inolt_Immag_1
     foreign key (`Path`)
     references Immagine(`Path`);

alter table Inoltrare_Messaggio add constraint REF_Inolt_Messa_FK
     foreign key (Cod_Unico)
     references Messaggio(Cod_Unico);

alter table Inoltrare_Thread add constraint REF_Inolt_Immag_FK
     foreign key (`Path`)
     references Immagine(`Path`);

alter table Inoltrare_Thread add constraint REF_Inolt_Threa
     foreign key (Cod_Unico)
     references Thread(Cod_Unico);

alter table Insegna add constraint REF_Inseg_Profe_FK
     foreign key (Matricola)
     references Professore(Matricola);

alter table Insegna add constraint REF_Inseg_Mater
     foreign key (Cod_Mat_Anno)
     references Materia_Anno(Cod_Mat_Anno);

alter table Materia add constraint REF_Mater_Sede_FK
     foreign key (Codice_Uni)
     references Sede(Codice);

alter table Materia_Anno add constraint REF_Mater_Mater
     foreign key (Codice_Mat)
     references Materia(Codice);

alter table Messaggio add constraint REF_Messa_Threa
     foreign key (Cod_Unico_Thread)
     references Thread(Cod_Unico);

alter table Messaggio add constraint REF_Messa_Messa_FK
     foreign key (Messaggio_Puntato)
     references Messaggio(Cod_Unico);

alter table Messaggio add constraint REF_Messa_Siste_FK
     foreign key (Matricola)
     references Sistema_Universitario(Matricola);

alter table Modulo add constraint EQU_Modul_Mater
     foreign key (Cod_Mat_Anno)
     references Materia_Anno(Cod_Mat_Anno);

alter table Modulo add constraint REF_Modul_Profe_FK
     foreign key (Matricola_Tit)
     references Professore(Matricola);

alter table Notifica add constraint REF_Notif_Siste_FK
     foreign key (Matricola)
     references Sistema_Universitario(Matricola);

alter table Orario add constraint REF_Orari_Modul
     foreign key (Cod_Mat_Anno, Codice_Modulo)
     references Modulo(Cod_Mat_Anno, Codice);

alter table Orario add constraint REF_Orari_Class
     foreign key (Codice_Uni, Codice_Stanza)
     references Classe(Codice_Uni, Codice_Stanza);

alter table Orario_Evento add constraint REF_Orari_Luogo
     foreign key (Cod_Luogo)
     references Luogo(Codice);

alter table Orario_Evento add constraint REF_Orari_Event
     foreign key (Codice_Evento)
     references Evento(Codice);

alter table Piano_Didattico add constraint REF_Piano_Corso_FK
     foreign key (Codice_Corso)
     references Corso(Codice);

alter table Piano_Didattico add constraint SID_Piano_Stude_FK
     foreign key (Matricola)
     references Studente(Matricola);

alter table Professore add constraint ID_Profe_Siste_FK
     foreign key (Matricola)
     references Sistema_Universitario(Matricola);

alter table Propongono add constraint REF_Propo_Promo_FK
     foreign key (Codice)
     references Promotore(Codice);

alter table Propongono add constraint EQU_Propo_Event
     foreign key (Codice_Evento)
     references Evento(Codice);

alter table Rappresentano add constraint REF_Rappr_Perso_FK
     foreign key (CF)
     references Persona(CF);

alter table Rappresentano add constraint REF_Rappr_Promo
     foreign key (Codice_Promotore)
     references Promotore(Codice);

alter table Ricevimento add constraint REF_Ricev_Uffic_FK
     foreign key (Codice_Uni, Codice_Stanza)
     references Ufficio(Codice_Uni, Codice_Stanza);

alter table Ricevimento add constraint REF_Ricev_Uffic_CHK
     check((Codice_Uni is not null and Codice_Stanza is not null)
          or (Codice_Uni is null and Codice_Stanza is null));

alter table Ricevimento add constraint REF_Ricev_Profe_FK
     foreign key (Matricola)
     references Professore(Matricola);

alter table Richiesta_Evento add constraint REF_Richi_Event_FK
     foreign key (Codice_Evento)
     references Evento(Codice);

alter table Richiesta_Evento add constraint REF_Richi_Perso_1_FK
     foreign key (Rappresentante)
     references Persona(CF);

alter table Richiesta_Evento add constraint REF_Richi_Perso_FK
     foreign key (Richiedente)
     references Persona(CF);

alter table Richiesta_Evento add constraint REF_Richi_Promo_FK
     foreign key (Richiedente_Inserimento)
     references Promotore(Codice);

alter table Richiesta_Orario add constraint REF_Richi_Orari_FK
     foreign key (Codice_Orario)
     references Orario(Codice);

alter table Richiesta_Orario add constraint REF_Richi_Modul_FK
     foreign key (Cod_Mat_Anno, Codice_Modulo)
     references Modulo(Cod_Mat_Anno, Codice);

alter table Richiesta_Orario add constraint REF_Richi_Modul_CHK
     check((Cod_Mat_Anno is not null and Codice_Modulo is not null)
          or (Cod_Mat_Anno is null and Codice_Modulo is null));

alter table Richiesta_Orario add constraint REF_Richi_Class_FK
     foreign key (Codice_Uni, Codice_Stanza)
     references Classe(Codice_Uni, Codice_Stanza);

alter table Richiesta_Orario add constraint REF_Richi_Class_CHK
     check((Codice_Uni is not null and Codice_Stanza is not null)
          or (Codice_Uni is null and Codice_Stanza is null));

alter table Richiesta_Orario add constraint REF_Richi_Profe_FK
     foreign key (Matricola)
     references Professore(Matricola);

alter table Richiesta_Ricevimento add constraint REF_Richi_Stude_FK
     foreign key (Matricola)
     references Studente(Matricola);

alter table Richiesta_Ricevimento add constraint REF_Richi_Slot_FK
     foreign key (Codice_Ric, N_Slot)
     references Slot(Codice_Ric, N_Slot);

alter table Richiesta_Ricevimento add constraint REF_Richi_Slot_CHK
     check((Codice_Ric is not null and N_Slot is not null)
          or (Codice_Ric is null and N_Slot is null));

alter table Richiesta_Ricevimento add constraint REF_Richi_Ricev_FK
     foreign key (Ricevimento)
     references Ricevimento(Codice);

alter table Sede add constraint SID_Sede_Indir_FK
     foreign key (Codice_Prov, Codice_Citta, N_Civico)
     references Indirizzo(Codice_Prov, Codice_Citta, N_Civico);

alter table Segna add constraint REF_Segna_Perso_FK
     foreign key (CF)
     references Persona(CF);

alter table Segna add constraint REF_Segna_Event
     foreign key (Codice_Evento)
     references Evento(Codice);

alter table Segreteria add constraint ID_Segre_Siste_FK
     foreign key (Matricola)
     references Sistema_Universitario(Matricola);

alter table Segreteria add constraint REF_Segre_Sede_FK
     foreign key (Codice_Uni)
     references Sede(Codice);

alter table Seguito_In add constraint REF_Segui_Sede
     foreign key (Codice_Uni)
     references Sede(Codice);

alter table Seguito_In add constraint EQU_Segui_Corso_FK
     foreign key (Codice_Corso)
     references Corso(Codice);

alter table Sistema_Universitario add constraint REF_Siste_Perso_FK
     foreign key (CF)
     references Persona(CF);

alter table Slot add constraint REF_Slot_Ricev
     foreign key (Codice_Ric)
     references Ricevimento(Codice);

alter table Slot add constraint REF_Slot_Stude_FK
     foreign key (Matricola)
     references Studente(Matricola);

alter table Studente add constraint ID_Stude_Siste_FK
     foreign key (Matricola)
     references Sistema_Universitario(Matricola);

alter table Thread add constraint REF_Threa_Canal
     foreign key (Cod_Forum, Cod_Canale)
     references Canale(Cod_Forum, Codice);

alter table Thread add constraint REF_Threa_Threa_FK
     foreign key (Thread_Puntato)
     references Thread(Cod_Unico);

alter table Thread add constraint REF_Threa_Siste_FK
     foreign key (Matricola)
     references Sistema_Universitario(Matricola);

alter table Tutor add constraint REF_Tutor_Stude_FK
     foreign key (Matricola)
     references Studente(Matricola);

alter table Tutor add constraint REF_Tutor_Mater
     foreign key (Cod_Mat_Anno)
     references Materia_Anno(Cod_Mat_Anno);

alter table Ufficio add constraint ID_Uffic_Unive_FK
     foreign key (Codice_Uni, Codice_Stanza)
     references Universitario(Codice_Uni, Codice);

alter table Ufficio add constraint REF_Uffic_Profe_FK
     foreign key (Matricola)
     references Professore(Matricola);

alter table Universitario add constraint REF_Unive_Sede
     foreign key (Codice_Uni)
     references Sede(Codice);

alter table Universitario add constraint SID_Unive_Luogo_FK
     foreign key (Cod_Luogo)
     references Luogo(Codice);


-- Index Section
-- _____________

create unique index ID_Agg_Collaboratore_IND
     on Agg_Collaboratore (Codice_Richiesta, CF);

create index REF_Agg_C_Perso_IND
     on Agg_Collaboratore (CF);

create unique index ID_Agg_Promotore_IND
     on Agg_Promotore (Codice_Promotore, Codice_Richiesta);

create index REF_Agg_P_Richi_IND
     on Agg_Promotore (Codice_Richiesta);

create unique index ID_Ambito_IND
     on Ambito (Nome);

create unique index ID_Cambiare_Orario_IND
     on Cambiare_Orario (Codice_Orario, Codice_Ric);

create index REF_Cambi_Luogo_IND
     on Cambiare_Orario (Codice_Luogo);

create index REF_Cambi_Richi_IND
     on Cambiare_Orario (Codice_Ric);

create unique index ID_Canale_IND
     on Canale (Cod_Forum, Codice);

create unique index ID_Citta_IND
     on Citta (Codice_Prov, Codice);

create unique index ID_Class_Unive_IND
     on Classe (Codice_Uni, Codice_Stanza);

create unique index ID_Collaboratore_IND
     on Collaboratore (Codice_Evento, CF);

create index REF_Colla_Perso_IND
     on Collaboratore (CF);

create unique index ID_Composto_Da_IND
     on Composto_Da (Cod_Mat_Anno, Codice_PianoDid);

create index REF_Compo_Piano_IND
     on Composto_Da (Codice_PianoDid);

create unique index ID_Corso_IND
     on Corso (Codice);

create index REF_Corso_Ambit_IND
     on Corso (Ambito);

create unique index ID_Elemento_IND
     on Elemento (Codice);

create index REF_Eleme_Threa_IND
     on Elemento (Cod_Unico_Thread);

create index REF_Eleme_Messa_IND
     on Elemento (Cod_Unico_Messaggio);

create unique index ID_Elim_Collaboratore_IND
     on Elim_Collaboratore (Codice_Richiesta, CF);

create index REF_Elim__Perso_IND
     on Elim_Collaboratore (CF);

create unique index ID_Elim_Promotore_IND
     on Elim_Promotore (Codice_Promotore, Codice_Richiesta);

create index REF_Elim__Richi_IND
     on Elim_Promotore (Codice_Richiesta);

create unique index SID_Ester_Indir_IND
     on Esterno (Codice_Prov, Codice_Citta, N_Civico);

create unique index ID_Esterno_IND
     on Esterno (Codice);

create unique index SID_Ester_Luogo_IND
     on Esterno (Cod_Luogo);

create unique index ID_Evento_IND
     on Evento (Codice);

create index REF_Event_Perso_IND
     on Evento (CF);

create unique index ID_Formato_Da_IND
     on Formato_Da (Codice_Mat, Codice_Corso);

create index REF_Forma_Corso_IND
     on Formato_Da (Codice_Corso);

create unique index ID_Forum_IND
     on Forum (Codice);

create unique index ID_Immagine_IND
     on Immagine (`Path`);

create unique index ID_Indirizzo_IND
     on Indirizzo (Codice_Prov, Codice_Citta, N_Civico);

create unique index ID_Inoltrare_Messaggio_IND
     on Inoltrare_Messaggio (`Path`, Cod_Unico);

create index REF_Inolt_Messa_IND
     on Inoltrare_Messaggio (Cod_Unico);

create unique index ID_Inoltrare_Thread_IND
     on Inoltrare_Thread (Cod_Unico, `Path`);

create index REF_Inolt_Immag_IND
     on Inoltrare_Thread (`Path`);

create unique index ID_Insegna_IND
     on Insegna (Cod_Mat_Anno, Matricola);

create index REF_Inseg_Profe_IND
     on Insegna (Matricola);

create unique index ID_Luogo_IND
     on Luogo (Codice);

create unique index ID_Materia_IND
     on Materia (Codice);

create index REF_Mater_Sede_IND
     on Materia (Codice_Uni);

create unique index SID_Materia_Anno_IND
     on Materia_Anno (Codice_Mat, Anno);

create unique index ID_Materia_Anno_IND
     on Materia_Anno (Cod_Mat_Anno);

create unique index ID_Messaggio_IND
     on Messaggio (Cod_Unico);

create unique index SID_Messaggio_IND
     on Messaggio (Cod_Unico_Thread, Codice);

create index REF_Messa_Messa_IND
     on Messaggio (Messaggio_Puntato);

create index REF_Messa_Siste_IND
     on Messaggio (Matricola);

create unique index ID_Modulo_IND
     on Modulo (Cod_Mat_Anno, Codice);

create index REF_Modul_Profe_IND
     on Modulo (Matricola_Tit);

create unique index ID_Notifica_IND
     on Notifica (Codice);

create index REF_Notif_Siste_IND
     on Notifica (Matricola);

create unique index SID_Orario_1_IND
     on Orario (Cod_Mat_Anno, Codice_Modulo, Orario_inizio);

create unique index SID_Orario_IND
     on Orario (Codice_Uni, Codice_Stanza, Orario_inizio);

create unique index ID_Orario_IND
     on Orario (Codice);

create unique index SID_Orario_Evento_1_IND
     on Orario_Evento (Codice_Evento, Inizio);

create unique index SID_Orario_Evento_IND
     on Orario_Evento (Cod_Luogo, Inizio);

create unique index ID_Orario_Evento_IND
     on Orario_Evento (Codice);

create unique index ID_Persona_IND
     on Persona (CF);

create unique index SID_Persona_IND
     on Persona (Email);

create unique index ID_Piano_Didattico_IND
     on Piano_Didattico (Codice_PianoDid);

create index REF_Piano_Corso_IND
     on Piano_Didattico (Codice_Corso);

create unique index SID_Piano_Didattico_IND
     on Piano_Didattico (Anno, Codice_Corso);

create unique index SID_Piano_Stude_IND
     on Piano_Didattico (Matricola);

create unique index ID_Profe_Siste_IND
     on Professore (Matricola);

create unique index ID_Promotore_IND
     on Promotore (Codice);

create unique index SID_Promotore_IND
     on Promotore (Email);

create unique index ID_Propongono_IND
     on Propongono (Codice_Evento, Codice);

create index REF_Propo_Promo_IND
     on Propongono (Codice);

create unique index ID_Provincia_IND
     on Provincia (Codice);

create unique index ID_Rappresentano_IND
     on Rappresentano (Codice_Promotore, CF);

create index REF_Rappr_Perso_IND
     on Rappresentano (CF);

create unique index ID_Ricevimento_IND
     on Ricevimento (Codice);

create index REF_Ricev_Uffic_IND
     on Ricevimento (Codice_Uni, Codice_Stanza);

create index REF_Ricev_Profe_IND
     on Ricevimento (Matricola);

create unique index ID_Richiesta_Evento_IND
     on Richiesta_Evento (Codice);

create index REF_Richi_Event_IND
     on Richiesta_Evento (Codice_Evento);

create index REF_Richi_Perso_1_IND
     on Richiesta_Evento (Rappresentante);

create index REF_Richi_Perso_IND
     on Richiesta_Evento (Richiedente);

create index REF_Richi_Promo_IND
     on Richiesta_Evento (Richiedente_Inserimento);

create unique index ID_Richiesta_Orario_IND
     on Richiesta_Orario (Codice);

create index REF_Richi_Orari_IND
     on Richiesta_Orario (Codice_Orario);

create index REF_Richi_Modul_IND
     on Richiesta_Orario (Cod_Mat_Anno, Codice_Modulo);

create index REF_Richi_Class_IND
     on Richiesta_Orario (Codice_Uni, Codice_Stanza);

create index REF_Richi_Profe_IND
     on Richiesta_Orario (Matricola);

create unique index ID_Richiesta_Ricevimento_IND
     on Richiesta_Ricevimento (Codice);

create index REF_Richi_Stude_IND
     on Richiesta_Ricevimento (Matricola);

create index REF_Richi_Slot_IND
     on Richiesta_Ricevimento (Codice_Ric, N_Slot);

create index REF_Richi_Ricev_IND
     on Richiesta_Ricevimento (Ricevimento);

create unique index SID_Sede_Indir_IND
     on Sede (Codice_Prov, Codice_Citta, N_Civico);

create unique index ID_Sede_IND
     on Sede (Codice);

create unique index ID_Segna_IND
     on Segna (Codice_Evento, CF);

create index REF_Segna_Perso_IND
     on Segna (CF);

create unique index ID_Segre_Siste_IND
     on Segreteria (Matricola);

create index REF_Segre_Sede_IND
     on Segreteria (Codice_Uni);

create unique index ID_Seguito_In_IND
     on Seguito_In (Codice_Uni, Codice_Corso);

create index EQU_Segui_Corso_IND
     on Seguito_In (Codice_Corso);

create unique index ID_Sistema_Universitario_IND
     on Sistema_Universitario (Matricola);

create index REF_Siste_Perso_IND
     on Sistema_Universitario (CF);

create unique index SID_Sistema_Universitario_IND
     on Sistema_Universitario (Email_Uni);

create unique index ID_Slot_IND
     on Slot (Codice_Ric, N_Slot);

create index REF_Slot_Stude_IND
     on Slot (Matricola);

create unique index ID_Stude_Siste_IND
     on Studente (Matricola);

create unique index SID_Thread_IND
     on Thread (Cod_Forum, Cod_Canale, Codice);

create unique index ID_Thread_IND
     on Thread (Cod_Unico);

create index REF_Threa_Threa_IND
     on Thread (Thread_Puntato);

create index REF_Threa_Siste_IND
     on Thread (Matricola);

create unique index ID_Tutor_IND
     on Tutor (Cod_Mat_Anno, Matricola);

create index REF_Tutor_Stude_IND
     on Tutor (Matricola);

create unique index ID_Uffic_Unive_IND
     on Ufficio (Codice_Uni, Codice_Stanza);

create index REF_Uffic_Profe_IND
     on Ufficio (Matricola);

create unique index ID_Universitario_IND
     on Universitario (Codice_Uni, Codice);

create unique index SID_Unive_Luogo_IND
     on Universitario (Cod_Luogo);

