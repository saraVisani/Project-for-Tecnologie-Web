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
     Codice_Stanza numeric(3) not null,
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
     Codice varchar(10) not null,
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
     Codice_Corso varchar(10) not null,
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
	Codice_Corso varchar(10) not null,
     Cod_Mat_Anno numeric(10) not null,
     Codice numeric(10) not null,
     Inizio_Modulo datetime not null,
     Fine_Modulo datetime not null,
     Descrizione varchar(510) not null,
     Matricola_Tit numeric(10) not null,
     constraint ID_Modulo_ID primary key (Codice_Corso, Cod_Mat_Anno, Codice));

create table Notifica (
     Codice numeric(10) not null,
     Descizione varchar(510) not null,
     Chiusa TINYINT(1) not null,
     Matricola numeric(10) not null,
     constraint ID_Notifica_ID primary key (Codice));

create table Orario (
     Codice numeric(10) not null,
     Codice_Corso varchar(10) not null,
     Cod_Mat_Anno numeric(10) not null,
     Codice_Modulo numeric(10) not null,
     Orario_inizio datetime not null,
     Codice_Uni numeric(10) not null,
     Codice_Stanza numeric(3) not null,
     Orario_fine datetime not null,
     constraint SID_Orario_1_ID unique (Codice_Corso, Cod_Mat_Anno, Codice_Modulo, Orario_inizio),
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
     Codice_Corso varchar(10) not null,
     Matricola numeric(10) not null,
     constraint ID_Piano_Didattico_ID primary key (Codice_PianoDid),
     constraint SID_Piano_Didattico_ID unique (Anno, Codice_Corso, Matricola));

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
     Codice_Stanza numeric(3),
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
     Codice_Corso varchar(10),
     Cod_Mat_Anno numeric(10),
     Codice_Modulo numeric(10),
     Codice_Uni numeric(10),
     Codice_Stanza numeric(3),
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
     Codice_Corso varchar(10) not null,
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
     Codice_Stanza numeric(3) not null,
     Matricola numeric(10) not null,
     constraint ID_Uffic_Unive_ID primary key (Codice_Uni, Codice_Stanza));

create table Universitario (
     Codice_Uni numeric(10) not null,
     Codice numeric(3) not null,
     Cod_Luogo numeric(10) not null,
     constraint ID_Universitario_ID primary key (Codice_Uni, Codice),
     constraint SID_Unive_Luogo_ID unique (Cod_Luogo));

# ---------------------------------------------------------------------- #
# Add info into "Ambito"                                                 #
# ---------------------------------------------------------------------- #

truncate table Ambito;

insert into Ambito values ("Economia e Management", "#ffc72c");
insert into Ambito values ("Farmacia e Biotecnologie", "#f58025");
insert into Ambito values ("Giurisprudenza", "#92c1e9");
insert into Ambito values ("Ingegneria e Architettura", "#008578");
insert into Ambito values ("Lingue e Letterature, Traduzione e Interpretazione", "#004c97");
insert into Ambito values ("Medicina e Chirurgia", "#c8102e");
insert into Ambito values ("Medicina Veterinaria", "#aa0061");
insert into Ambito values ("Psicologia", "#b15a7d");
insert into Ambito values ("Scienze", "#00843d");
insert into Ambito values ("Scienze Agro-alimentari", "#6e7e1f");
insert into Ambito values ("Scienze dell'Educazione e della Formazione", "#861f41");
insert into Ambito values ("Scienze Motorie", "#002554");
insert into Ambito values ("Scienze Politiche", "#5f259f");
insert into Ambito values ("Scienze Statistiche", "#005eb8");
insert into Ambito values ("Sociologia", "#685bc7");
insert into Ambito values ("Studi Umanistici", "#363535");

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
insert into Canale values (2, 4, "Informazioni e Risposte", 0, true, true);

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
insert into Citta values ("RN","RN","Rimini");
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
# Add info into "Classe"                                                 #
# ---------------------------------------------------------------------- #

truncate table Classe;

insert into Classe values (0, 508, 0);
insert into Classe values (1, 510, 0);
insert into Classe values (1, 324, 1);
insert into Classe values (1, 216, 1);
insert into Classe values (1, 506, 0);
insert into Classe values (1, 509, 0);
insert into Classe values (2, 425, 0);
insert into Classe values (2, 110, 1);
insert into Classe values (2, 116, 0);
insert into Classe values (3, 209, 0);
insert into Classe values (3, 203, 1);
insert into Classe values (3, 421, 0);
insert into Classe values (3, 501, 0);
insert into Classe values (3, 412, 0);
insert into Classe values (3, 410, 0);
insert into Classe values (4, 318, 1);
insert into Classe values (4, 520, 0);
insert into Classe values (4, 115, 1);
insert into Classe values (4, 406, 1);
insert into Classe values (4, 323, 1);
insert into Classe values (4, 123, 1);
insert into Classe values (4, 313, 1);
insert into Classe values (5, 106, 0);
insert into Classe values (5, 107, 1);
insert into Classe values (5, 526, 1);
insert into Classe values (5, 429, 1);
insert into Classe values (5, 302, 1);
insert into Classe values (5, 506, 1);
insert into Classe values (6, 507, 1);
insert into Classe values (6, 119, 0);
insert into Classe values (6, 313, 1);
insert into Classe values (7, 302, 1);
insert into Classe values (7, 101, 1);
insert into Classe values (7, 513, 0);
insert into Classe values (7, 109, 0);
insert into Classe values (8, 307, 0);
insert into Classe values (9, 527, 0);
insert into Classe values (10, 320, 0);
insert into Classe values (10, 224, 0);
insert into Classe values (10, 118, 0);
insert into Classe values (10, 204, 0);
insert into Classe values (10, 326, 0);
insert into Classe values (11, 121, 0);
insert into Classe values (11, 320, 0);
insert into Classe values (11, 218, 1);
insert into Classe values (11, 322, 1);
insert into Classe values (12, 428, 0);
insert into Classe values (12, 217, 1);
insert into Classe values (12, 313, 1);
insert into Classe values (12, 400, 1);
insert into Classe values (12, 500, 0);
insert into Classe values (13, 306, 0);
insert into Classe values (13, 120, 0);
insert into Classe values (13, 514, 0);
insert into Classe values (13, 222, 1);
insert into Classe values (13, 517, 0);
insert into Classe values (13, 228, 0);
insert into Classe values (14, 515, 1);
insert into Classe values (14, 217, 0);
insert into Classe values (14, 205, 0);
insert into Classe values (15, 209, 1);
insert into Classe values (15, 512, 1);
insert into Classe values (15, 121, 0);
insert into Classe values (16, 325, 0);
insert into Classe values (16, 418, 1);
insert into Classe values (16, 426, 1);
insert into Classe values (16, 403, 1);
insert into Classe values (16, 514, 0);
insert into Classe values (16, 214, 0);

# ---------------------------------------------------------------------- #
# Add info into "Collaboratore"                                          #
# ---------------------------------------------------------------------- #

truncate table Collaboratore;

insert into Collaboratore values (5, "ZCCNTN64M06A662G");
insert into Collaboratore values (7, "FRRCST02E13H223W");
insert into Collaboratore values (13, "VTLGNN69P68B440X");
insert into Collaboratore values (18, "NPLLND64A63L402P");
insert into Collaboratore values (18, "BTAVSS01H42H266Q");
insert into Collaboratore values (19, "FRNCRL07M03C365Q");
insert into Collaboratore values (19, "NRENNA64B49F776Z");
insert into Collaboratore values (19, "SPSTMS01T21G715H");
insert into Collaboratore values (20, "LMBNCL58P20F776A");
insert into Collaboratore values (20, "NREDNC60S08I123S");
insert into Collaboratore values (29, "SPSTMS01T21G715H");
insert into Collaboratore values (31, "FRNCRL07M03C365Q");
insert into Collaboratore values (32, "TSCDNL06E23A348K");
insert into Collaboratore values (32, "NREDNC60S08I123S");
insert into Collaboratore values (32, "VTLGNN69P68B440X");
insert into Collaboratore values (33, "NREDNC60S08I123S");
insert into Collaboratore values (34, "NPLLND64A63L402P");
insert into Collaboratore values (34, "FSCLNE01A51C887J");
insert into Collaboratore values (35, "TSCLNZ75B02H223Z");
insert into Collaboratore values (36, "FRNCRL07M03C365Q");
insert into Collaboratore values (37, "FSCLNE01A51C887J");
insert into Collaboratore values (39, "NRENNA64B49F776Z");
insert into Collaboratore values (40, "FRRCST02E13H223W");
insert into Collaboratore values (40, "NGLSFO75C52D230I");
insert into Collaboratore values (40, "DNTRFL67T20C933F");

# ---------------------------------------------------------------------- #
# Add info into "Composto_Da"                                            #
# ---------------------------------------------------------------------- #

truncate table Composto_Da;

insert into Composto_Da values (0, 9, 0);
insert into Composto_Da values (0, 10, 1);
insert into Composto_Da values (0, 30, 0);
insert into Composto_Da values (0, 31, 1);
insert into Composto_Da values (0, 39, 1);
insert into Composto_Da values (1, 353, 1);
insert into Composto_Da values (3, 251, 0);
insert into Composto_Da values (4, 250, 1);
insert into Composto_Da values (6, 271, 1);
insert into Composto_Da values (8, 69, 0);
insert into Composto_Da values (10, 74, 1);
insert into Composto_Da values (10, 439, 0);
insert into Composto_Da values (10, 440, 0);
insert into Composto_Da values (11, 63, 1);
insert into Composto_Da values (11, 428, 1);
insert into Composto_Da values (12, 293, 1);
insert into Composto_Da values (13, 54, 1);
insert into Composto_Da values (13, 397, 1);
insert into Composto_Da values (14, 314, 1);
insert into Composto_Da values (18, 83, 1);
insert into Composto_Da values (18, 89, 1);
insert into Composto_Da values (18, 139, 1);
insert into Composto_Da values (21, 13, 1);
insert into Composto_Da values (21, 34, 1);
insert into Composto_Da values (22, 11, 0);
insert into Composto_Da values (22, 12, 0);
insert into Composto_Da values (22, 32, 0);
insert into Composto_Da values (22, 33, 1);
insert into Composto_Da values (22, 41, 1);
insert into Composto_Da values (23, 270, 1);
insert into Composto_Da values (25, 117, 1);
insert into Composto_Da values (25, 194, 0);
insert into Composto_Da values (25, 195, 0);
insert into Composto_Da values (25, 202, 1);
insert into Composto_Da values (26, 242, 1);
insert into Composto_Da values (27, 278, 1);
insert into Composto_Da values (28, 248, 1);
insert into Composto_Da values (29, 312, 1);
insert into Composto_Da values (30, 256, 0);
insert into Composto_Da values (30, 257, 1);
insert into Composto_Da values (31, 9, 0);
insert into Composto_Da values (31, 10, 1);
insert into Composto_Da values (31, 30, 1);
insert into Composto_Da values (31, 39, 0);
insert into Composto_Da values (31, 40, 0);
insert into Composto_Da values (33, 342, 1);
insert into Composto_Da values (34, 79, 0);
insert into Composto_Da values (34, 80, 1);
insert into Composto_Da values (34, 85, 0);
insert into Composto_Da values (34, 86, 1);
insert into Composto_Da values (34, 130, 1);
insert into Composto_Da values (34, 135, 1);
insert into Composto_Da values (36, 74, 0);
insert into Composto_Da values (36, 75, 0);
insert into Composto_Da values (36, 439, 1);
insert into Composto_Da values (37, 461, 0);
insert into Composto_Da values (38, 237, 0);
insert into Composto_Da values (39, 23, 0);
insert into Composto_Da values (39, 24, 1);
insert into Composto_Da values (39, 29, 0);
insert into Composto_Da values (39, 30, 0);
insert into Composto_Da values (40, 404, 1);
insert into Composto_Da values (40, 410, 0);
insert into Composto_Da values (40, 411, 1);
insert into Composto_Da values (41, 74, 1);
insert into Composto_Da values (41, 439, 1);
insert into Composto_Da values (42, 5, 1);
insert into Composto_Da values (42, 13, 0);
insert into Composto_Da values (42, 18, 1);
insert into Composto_Da values (42, 47, 0);
insert into Composto_Da values (42, 48, 1);
insert into Composto_Da values (43, 277, 1);
insert into Composto_Da values (45, 356, 1);
insert into Composto_Da values (46, 284, 1);
insert into Composto_Da values (48, 64, 1);
insert into Composto_Da values (48, 429, 0);
insert into Composto_Da values (48, 430, 0);
insert into Composto_Da values (50, 262, 1);
insert into Composto_Da values (52, 52, 1);
insert into Composto_Da values (52, 102, 0);
insert into Composto_Da values (52, 103, 1);
insert into Composto_Da values (52, 416, 1);
insert into Composto_Da values (53, 20, 0);
insert into Composto_Da values (55, 83, 1);
insert into Composto_Da values (55, 89, 0);
insert into Composto_Da values (55, 90, 1);
insert into Composto_Da values (55, 139, 1);
insert into Composto_Da values (56, 332, 1);
insert into Composto_Da values (56, 451, 0);
insert into Composto_Da values (56, 452, 0);
insert into Composto_Da values (56, 457, 1);
insert into Composto_Da values (57, 404, 0);
insert into Composto_Da values (57, 405, 1);
insert into Composto_Da values (57, 410, 1);
insert into Composto_Da values (58, 63, 0);
insert into Composto_Da values (58, 64, 0);
insert into Composto_Da values (58, 428, 1);
insert into Composto_Da values (59, 312, 1);
insert into Composto_Da values (60, 20, 1);
insert into Composto_Da values (61, 2, 1);
insert into Composto_Da values (61, 10, 1);
insert into Composto_Da values (61, 15, 1);
insert into Composto_Da values (61, 44, 1);
insert into Composto_Da values (62, 382, 1);
insert into Composto_Da values (62, 388, 1);
insert into Composto_Da values (63, 118, 1);
insert into Composto_Da values (63, 123, 1);
insert into Composto_Da values (63, 165, 0);
insert into Composto_Da values (63, 166, 0);
insert into Composto_Da values (63, 173, 0);
insert into Composto_Da values (63, 174, 0);
insert into Composto_Da values (64, 403, 0);
insert into Composto_Da values (64, 404, 1);
insert into Composto_Da values (64, 409, 0);
insert into Composto_Da values (64, 410, 0);
insert into Composto_Da values (65, 58, 1);
insert into Composto_Da values (65, 109, 1);
insert into Composto_Da values (65, 424, 1);
insert into Composto_Da values (66, 347, 1);
insert into Composto_Da values (66, 458, 1);
insert into Composto_Da values (67, 27, 1);
insert into Composto_Da values (67, 33, 1);
insert into Composto_Da values (69, 348, 1);
insert into Composto_Da values (69, 459, 0);
insert into Composto_Da values (69, 460, 1);
insert into Composto_Da values (70, 317, 1);
insert into Composto_Da values (72, 180, 1);
insert into Composto_Da values (72, 186, 1);
insert into Composto_Da values (72, 215, 1);
insert into Composto_Da values (72, 221, 1);
insert into Composto_Da values (74, 59, 1);
insert into Composto_Da values (74, 110, 1);
insert into Composto_Da values (74, 425, 1);
insert into Composto_Da values (76, 250, 0);
insert into Composto_Da values (76, 251, 1);
insert into Composto_Da values (77, 256, 0);
insert into Composto_Da values (77, 257, 0);
insert into Composto_Da values (79, 461, 1);
insert into Composto_Da values (80, 237, 1);
insert into Composto_Da values (82, 69, 0);
insert into Composto_Da values (85, 179, 0);
insert into Composto_Da values (85, 180, 0);
insert into Composto_Da values (85, 185, 1);
insert into Composto_Da values (85, 214, 1);
insert into Composto_Da values (85, 220, 0);
insert into Composto_Da values (85, 221, 0);
insert into Composto_Da values (86, 73, 0);
insert into Composto_Da values (86, 74, 1);
insert into Composto_Da values (86, 438, 0);
insert into Composto_Da values (86, 439, 0);
insert into Composto_Da values (87, 261, 1);
insert into Composto_Da values (88, 65, 1);
insert into Composto_Da values (88, 430, 0);
insert into Composto_Da values (88, 431, 1);
insert into Composto_Da values (90, 53, 0);
insert into Composto_Da values (90, 54, 1);
insert into Composto_Da values (90, 396, 1);
insert into Composto_Da values (92, 332, 1);
insert into Composto_Da values (92, 451, 0);
insert into Composto_Da values (92, 452, 1);
insert into Composto_Da values (92, 457, 1);
insert into Composto_Da values (94, 27, 0);
insert into Composto_Da values (94, 33, 1);
insert into Composto_Da values (95, 352, 0);
insert into Composto_Da values (95, 353, 1);
insert into Composto_Da values (96, 116, 1);
insert into Composto_Da values (96, 193, 1);
insert into Composto_Da values (96, 201, 1);
insert into Composto_Da values (97, 279, 1);
insert into Composto_Da values (99, 303, 1);
insert into Composto_Da values (100, 118, 1);
insert into Composto_Da values (100, 195, 1);
insert into Composto_Da values (101, 355, 1);
insert into Composto_Da values (102, 55, 1);
insert into Composto_Da values (102, 419, 0);
insert into Composto_Da values (103, 180, 1);
insert into Composto_Da values (103, 186, 1);
insert into Composto_Da values (103, 215, 1);
insert into Composto_Da values (103, 221, 0);
insert into Composto_Da values (103, 222, 0);
insert into Composto_Da values (104, 58, 0);
insert into Composto_Da values (104, 59, 0);
insert into Composto_Da values (104, 109, 0);
insert into Composto_Da values (104, 110, 0);
insert into Composto_Da values (104, 424, 1);
insert into Composto_Da values (106, 277, 1);
insert into Composto_Da values (107, 257, 1);
insert into Composto_Da values (108, 296, 1);
insert into Composto_Da values (111, 361, 0);
insert into Composto_Da values (111, 362, 1);
insert into Composto_Da values (112, 229, 1);
insert into Composto_Da values (112, 235, 1);
insert into Composto_Da values (113, 62, 1);
insert into Composto_Da values (114, 307, 1);
insert into Composto_Da values (115, 34, 0);
insert into Composto_Da values (116, 55, 1);
insert into Composto_Da values (116, 398, 0);
insert into Composto_Da values (117, 461, 1);
insert into Composto_Da values (119, 404, 0);
insert into Composto_Da values (119, 405, 1);
insert into Composto_Da values (119, 410, 0);
insert into Composto_Da values (119, 411, 0);
insert into Composto_Da values (120, 311, 1);
insert into Composto_Da values (121, 116, 0);
insert into Composto_Da values (121, 117, 1);
insert into Composto_Da values (121, 121, 1);
insert into Composto_Da values (121, 163, 0);
insert into Composto_Da values (121, 164, 1);
insert into Composto_Da values (121, 171, 0);
insert into Composto_Da values (121, 172, 1);
insert into Composto_Da values (122, 180, 0);
insert into Composto_Da values (122, 181, 1);
insert into Composto_Da values (122, 186, 0);
insert into Composto_Da values (122, 187, 1);
insert into Composto_Da values (122, 215, 1);
insert into Composto_Da values (122, 221, 1);
insert into Composto_Da values (124, 311, 0);
insert into Composto_Da values (124, 312, 0);
insert into Composto_Da values (125, 58, 1);
insert into Composto_Da values (125, 109, 1);
insert into Composto_Da values (125, 424, 0);
insert into Composto_Da values (125, 425, 0);
insert into Composto_Da values (126, 269, 0);
insert into Composto_Da values (126, 270, 1);
insert into Composto_Da values (127, 80, 1);
insert into Composto_Da values (127, 86, 0);
insert into Composto_Da values (127, 87, 1);
insert into Composto_Da values (127, 131, 1);
insert into Composto_Da values (127, 136, 1);
insert into Composto_Da values (128, 51, 1);
insert into Composto_Da values (128, 394, 0);
insert into Composto_Da values (128, 395, 1);
insert into Composto_Da values (129, 10, 0);
insert into Composto_Da values (129, 11, 1);
insert into Composto_Da values (129, 31, 1);
insert into Composto_Da values (129, 40, 0);
insert into Composto_Da values (129, 41, 0);
insert into Composto_Da values (132, 360, 1);
insert into Composto_Da values (134, 65, 0);
insert into Composto_Da values (134, 66, 1);
insert into Composto_Da values (134, 430, 0);
insert into Composto_Da values (134, 431, 1);
insert into Composto_Da values (136, 251, 0);
insert into Composto_Da values (138, 461, 1);
insert into Composto_Da values (139, 353, 1);
insert into Composto_Da values (140, 6, 0);
insert into Composto_Da values (140, 27, 0);
insert into Composto_Da values (141, 20, 0);
insert into Composto_Da values (142, 5, 0);
insert into Composto_Da values (142, 6, 0);
insert into Composto_Da values (142, 20, 1);
insert into Composto_Da values (142, 26, 0);
insert into Composto_Da values (142, 27, 0);
insert into Composto_Da values (143, 327, 1);
insert into Composto_Da values (143, 446, 1);
insert into Composto_Da values (144, 265, 1);
insert into Composto_Da values (145, 117, 1);
insert into Composto_Da values (145, 122, 1);
insert into Composto_Da values (145, 164, 1);
insert into Composto_Da values (145, 172, 0);
insert into Composto_Da values (145, 173, 0);
insert into Composto_Da values (146, 53, 0);
insert into Composto_Da values (146, 54, 0);
insert into Composto_Da values (146, 396, 1);
insert into Composto_Da values (147, 10, 0);
insert into Composto_Da values (147, 11, 1);
insert into Composto_Da values (147, 31, 1);
insert into Composto_Da values (147, 40, 1);
insert into Composto_Da values (148, 256, 1);

# ---------------------------------------------------------------------- #
# Add info into "Corso"                                                  #
# ---------------------------------------------------------------------- #

truncate table Corso;

insert into Corso values ("ECO01","Economia Aziendale","Studio dell'organizzazione e gestione delle imprese",NULL,"Economia e Management");
insert into Corso values ("ECO02","Economia del Turismo","Formazione economica per il settore turistico",NULL,"Economia e Management");
insert into Corso values ("ECO03","Economia e Finanza","Analisi dei mercati finanziari e degli strumenti di investimento","#1E90FF","Economia e Management");
insert into Corso values ("TUR01","Scienze del Turismo","Gestione e valorizzazione dei sistemi turistici",NULL,"Economia e Management");
insert into Corso values ("ING01","Ingegneria Gestionale","Ottimizzazione dei processi aziendali e industriali",NULL,"Ingegneria e Architettura");
insert into Corso values ("ING02","Ingegneria Meccanica","Progettazione e analisi di sistemi meccanici",NULL,"Ingegneria e Architettura");
insert into Corso values ("ING_INF01","Ingegneria e Scienze Informatiche","Corso triennale di ingegneria e informatica, sviluppo software e sistemi intelligenti","#00FF00","Ingegneria e Architettura");
insert into Corso values ("ING_INF02","Informatica","Programmazione, algoritmi e sistemi informatici","#00FF00","Ingegneria e Architettura");
insert into Corso values ("ING_INF03","Data Science","Analisi dati, statistica e machine learning","#32CD32","Ingegneria e Architettura");
insert into Corso values ("ROB01","Robotica","Progettazione e programmazione di sistemi robotici","#FF69B4","Ingegneria e Architettura");
insert into Corso values ("MAT01","Matematica","Studio delle strutture matematiche e dei modelli teorici",NULL,"Scienze");
insert into Corso values ("FIS01","Fisica","Studio delle leggi fondamentali della natura",NULL,"Scienze");
insert into Corso values ("CHI01","Chimica","Studio della materia e delle sue trasformazioni",NULL,"Scienze");
insert into Corso values ("BIO01","Biologia","Studio dei sistemi biologici",NULL,"Scienze");
insert into Corso values ("STA01","Statistica","Analisi dei dati e modelli statistici","#FFD700","Scienze");
insert into Corso values ("ANA01","Analisi Matematica","Studio dei fondamenti dell'analisi reale e complessa",NULL,"Scienze");
insert into Corso values ("MED01","Medicina e Chirurgia","Formazione del medico e delle professioni sanitarie",NULL,"Medicina e Chirurgia");
insert into Corso values ("INF01","Infermieristica","Assistenza infermieristica e sanitaria",NULL,"Medicina e Chirurgia");
insert into Corso values ("FAR01","Farmacia","Studio del farmaco e della sua applicazione clinica",NULL,"Farmacia e Biotecnologie");
insert into Corso values ("BIOFAR01","Biotecnologie Farmaceutiche","Tecnologie per la ricerca e sviluppo di farmaci","#FF4500","Farmacia e Biotecnologie");
insert into Corso values ("GIU01","Giurisprudenza","Formazione giuridica completa per le professioni legali",NULL,"Giurisprudenza");
insert into Corso values ("DIR01","Scienze dei Servizi Giuridici","Studio del diritto applicato ai servizi",NULL,"Giurisprudenza");
insert into Corso values ("POL01","Scienze Politiche","Analisi dei sistemi politici e istituzionali",NULL,"Scienze Politiche");
insert into Corso values ("SOC01","Sociologia","Studio delle dinamiche sociali",NULL,"Sociologia");
insert into Corso values ("COM01","Scienze della Comunicazione","Teorie e tecniche della comunicazione",NULL,"Sociologia");
insert into Corso values ("PSI01","Psicologia","Studio del comportamento e dei processi cognitivi","#FF69B4","Psicologia");
insert into Corso values ("LET01","Lettere Moderne","Studio della letteratura e della lingua italiana",NULL,"Studi Umanistici");
insert into Corso values ("STO01","Storia","Analisi storica dall'antichità all'età contemporanea",NULL,"Studi Umanistici");
insert into Corso values ("FIL01","Filosofia","Studio del pensiero filosofico",NULL,"Studi Umanistici");
insert into Corso values ("LIN01","Lingue e Letterature Straniere","Studio delle lingue e culture straniere",NULL,"Lingue e Letterature, Traduzione e Interpretazione");
insert into Corso values ("ARC01","Architettura","Progettazione architettonica e urbana",NULL,"Ingegneria e Architettura");
insert into Corso values ("DES01","Design Industriale","Progettazione di prodotti e servizi",NULL,"Ingegneria e Architettura");
insert into Corso values ("URB01","Urbanistica","Pianificazione e gestione dello spazio urbano","#00CED1","Ingegneria e Architettura");
insert into Corso values ("ARC_CES01", "Architettura e Progettazione Edile", "Corso base di Architettura con focus su progettazione e costruzioni", NULL, "Ingegneria e Architettura");
insert into Corso values ("ARC_CES02", "Ingegneria Civile e Ambientale", "Studio delle strutture civili e gestione delle infrastrutture", NULL, "Ingegneria e Architettura");
insert into Corso values ("DES_CES01", "Design Industriale e Innovazione", "Progettazione di prodotti industriali e innovazione tecnologica", NULL, "Ingegneria e Architettura");
insert into Corso values ("URB_CES01", "Urbanistica e Pianificazione Territoriale", "Analisi e pianificazione dello spazio urbano", NULL, "Ingegneria e Architettura");
insert into Corso values ("TEC_CES01", "Tecnologie per l'Architettura", "Laboratori e applicazioni di nuove tecnologie nel design architettonico", "#00cc99", "Ingegneria e Architettura");

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
# Add info into "Esterno"                                                #
# ---------------------------------------------------------------------- #

truncate table Evento;

insert into Evento values (1, "Festival del Teatro Studentesco", "2026-05-10", "2026-05-11", 945, "Evento aperto alla cittadinanza", "ZNTDNC84L11B858F");
insert into Evento values (2, "Festival della Cultura", "2021-05-13", "2021-05-14", 8, "Evento formativo certificato", "BNCLRI99H45F883G");
insert into Evento values (3, "Workshop di Marketing Digitale", "2025-02-20", "2025-02-20", 1365, "Giornata informativa sui servizi universitari", "RSSCRL98S28C933M");
insert into Evento values (4, "Festival del Cinema Studentesco", "2021-06-09", "2021-06-09", 185, "Giornata informativa sui servizi universitari", "NNCMRC94M14A037S");
insert into Evento values (5, "Laboratorio di Chimica", "2022-08-01", "2022-08-01", 577, "Evento divulgativo per le scuole", "VRDDVD64L12C520H");
insert into Evento values (6, "Festival della Musica Universitaria", "2024-05-04", "2024-05-04", 62, "Workshop pratico con simulazioni reali", "MRCPTR72S20D969D");
insert into Evento values (7, "Torneo di Calcio Universitario", "2025-03-24", "2025-03-25", 51, "Presentazione di progetti di ricerca innovativi", "NPLDNL78R10C724W");
insert into Evento values (8, "Hackathon Informatica", "2023-12-26", "2023-12-26", 9, "Workshop intensivo di aggiornamento", "FRRVNC05S61F205M");
insert into Evento values (9, "Workshop di Statistica", "2020-12-08", "2020-12-08", 10, "Seminario su innovazione e sostenibilità", "DSNSRG96C16A189M");
insert into Evento values (10, "Laboratorio di Biologia Molecolare", "2024-01-12", "2024-01-12", 110, "Evento di disseminazione dei risultati di ricerca", "SLVJCP81D18H224Q");
insert into Evento values (11, "Torneo di Pallavolo Universitario", "2022-02-14", "2022-02-14", 47, "Tavola rotonda con professionisti del settore", "FRRLNE61M50A037S");
insert into Evento values (12, "Evento di Ricerca e Sviluppo", "2022-07-28", "2022-07-28", 42, "Workshop pratico per studenti universitari", "BNVPLA56B42C365I");
insert into Evento values (13, "Seminario di Storia dell'Arte", "2022-06-02", "2022-06-02", 3, "Convegno accademico annuale", "MSSGRL64R25A348D");
insert into Evento values (14, "Seminario di Filosofia", "2022-07-24", "2022-07-24", 51, "Seminario su innovazione e sostenibilità", "LMBMSM92P04B861X");
insert into Evento values (15, "Conferenza di Psicologia", "2024-07-23", "2024-07-23", 120, "Evento di formazione continua", "TSCDNL06E23A348K");
insert into Evento values (16, "Giornata dell'Orientamento", "2026-03-25", "2026-03-25", 1412, "Conferenza su tematiche di attualità", "SNTNNA07B49L424U");
insert into Evento values (17, "Giornata della Creatività", "2022-06-18", "2022-06-19", 103, "Evento istituzionale promosso dall’ateneo", "NREVLR76C04H703O");
insert into Evento values (18, "Evento di Ricerca e Sviluppo", "2023-07-25", "2023-07-26", 211, "Evento di presentazione dei corsi di laurea", "ZCCRNI79S64G715X");
insert into Evento values (19, "Workshop di Lingue Straniere", "2023-11-02", "2023-11-02", 109, "Convegno accademico annuale", "FSCNCL90L01C365C");
insert into Evento values (20, "Giornata della Creatività Digitale", "2025-11-08", "2025-11-08", 3, "Evento di disseminazione dei risultati di ricerca", "ZNTLXA08T04G224Y");
insert into Evento values (21, "Seminario di Storia dell'Arte", "2024-09-06", "2024-09-06", 53, "Iniziativa di orientamento post-laurea", "ZCCMRA90S51F839U");
insert into Evento values (22, "Seminario di Storia dell'Arte", "2023-03-26", "2023-03-26", 10, "Evento di orientamento per studenti e famiglie", "CRSDNL01C29G908C");
insert into Evento values (23, "Festival del Teatro Studentesco", "2022-02-07", "2022-02-07", 51, "Evento di orientamento per studenti e famiglie", "RNLVNC81S42F205Q");
insert into Evento values (24, "Giornata dell'Ingegneria", "2025-10-20", "2025-10-20", 5, "Incontro di presentazione di nuove tecnologie", "NPLDNL78R10C724W");
insert into Evento values (25, "Workshop di Statistica", "2026-03-24", "2026-03-24", 9, "Incontro di presentazione di nuove tecnologie", "VRDRCR64R09D433B");
insert into Evento values (26, "Festival del Teatro Studentesco", "2020-08-19", "2020-08-20", 87, "Evento aperto alla cittadinanza", "RSSCRS75C19A944H");
insert into Evento values (27, "Evento Culturale Interfacoltà", "2026-05-21", "2026-05-21", 5, "Incontro di divulgazione scientifica", "BNCLRI99H45F883G");
insert into Evento values (28, "Seminario di Economia Internazionale", "2021-11-06", "2021-11-06", 7, "Giornata di studio e confronto accademico", "MNTNCL89H70D276P");
insert into Evento values (29, "Evento di Beneficenza Studentesco", "2021-04-08", "2021-04-08", 108, "Evento di formazione continua", "RSSFNC60H25I123N");
insert into Evento values (30, "Workshop di Scrittura Accademica", "2023-10-25", "2023-10-25", 8, "Evento formativo certificato", "CRSDGI57H28A913F");
insert into Evento values (31, "Workshop di Matematica", "2020-08-31", "2020-08-31", 73, "Evento di formazione continua", "RMNCST61H60D433T");
insert into Evento values (32, "Workshop di Comunicazione Scientifica", "2025-10-27", "2025-10-29", 102, "Evento di networking tra studenti e aziende", "SRRDNC07M31H501V");
insert into Evento values (33, "Torneo di E-Sports Universitario", "2024-03-21", "2024-03-21", 1162, "Attività seminariale di supporto alla didattica", "FRRRNN70T48G715L");
insert into Evento values (34, "Giornata dell'Orientamento", "2020-12-17", "2020-12-17", 9, "Seminario di orientamento al lavoro", "FZADNC77B24D949G");
insert into Evento values (35, "Laboratorio di Biologia Molecolare", "2024-05-18", "2024-05-18", 211, "Evento istituzionale promosso dall’ateneo", "FSCLNE01A51C887J");
insert into Evento values (36, "Giornata della Creatività Digitale", "2022-12-03", "2022-12-05", 4, "Workshop pratico con simulazioni reali", "PRSGNN08R52D491D");
insert into Evento values (37, "Workshop di Lingue Straniere", "2020-07-09", "2020-07-09", 8, "Seminario introduttivo per nuovi iscritti", "VRDGRG06T30C986J");
insert into Evento values (38, "Giornata dello Studente Internazionale", "2020-12-28", "2020-12-28", 95, "Presentazione di progetti di ricerca innovativi", "NPLDNL78R10C724W");
insert into Evento values (39, "Workshop di Marketing Digitale", "2022-02-23", "2022-02-23", 5, "Incontro di presentazione di nuove tecnologie", "TSTNGL71S43L390M");
insert into Evento values (40, "Giornata delle Professioni Digitali", "2023-08-30", "2023-08-30", 99, "Conferenza con relatori internazionali", "FBBLCA75B52A286A");
insert into Evento values (41, "Evento di Beneficenza Studentesco", "2024-03-16", "2024-03-16", 9, "Giornata di studio e confronto accademico", "LRSSFN62L01C365K");
insert into Evento values (42, "Workshop di Marketing Digitale", "2023-02-02", "2023-02-02", 1365, "Seminario di orientamento al lavoro", "TSTMNL84P12B861F");
insert into Evento values (43, "Laboratorio di Informatica Avanzata", "2026-10-19", "2026-10-21", 719, "Evento di orientamento per studenti e famiglie", "RMNDBR75S51A189M");
insert into Evento values (44, "Saggio Teatrale Studentesco", "2025-06-17", "2025-06-17", 110, "Ciclo di incontri tematici interdisciplinari", "ZCCLSN99D52L219J");
insert into Evento values (45, "Laboratorio di Chimica Analitica", "2022-03-05", "2022-03-05", 9, "Seminario introduttivo per nuovi iscritti", "ZCCCLL58B61F205H");
insert into Evento values (46, "Workshop di Matematica", "2021-05-31", "2021-05-31", 96, "Incontro di approfondimento metodologico", "FRRNGL56T42H266K");
insert into Evento values (47, "Torneo di Calcio Universitario", "2024-07-16", "2024-07-16", 93, "Incontro formativo con esperti del settore", "FRRVNC05S61F205M");
insert into Evento values (48, "Conferenza di Psicologia", "2022-07-05", "2022-07-06", 325, "Giornata di studio e confronto accademico", "LBRRRT97B04B207B");
insert into Evento values (49, "Laboratorio di Biologia Molecolare", "2020-05-13", "2020-05-13", 102, "Conferenza divulgativa multidisciplinare", "CSTSLV06H65L219T");
insert into Evento values (50, "Giornata dell'Orientamento", "2020-06-22", "2020-06-22", 1139, "Incontro formativo con esperti del settore", "SLARTI80L65A643P");

# ---------------------------------------------------------------------- #
# Add info into "Formato_Da"                                             #
# ---------------------------------------------------------------------- #

truncate table Formato_Da;

insert into Formato_Da values (1001,"ECO01",1,3,1,12);
insert into Formato_Da values (1001,"ECO02",0,2,2,6);
insert into Formato_Da values (1002,"ECO01",1,4,1,12);
insert into Formato_Da values (1002,"ECO03",0,3,2,6);
insert into Formato_Da values (1003,"ECO01",1,2,1,6);
insert into Formato_Da values (1003,"ECO02",0,3,2,12);
insert into Formato_Da values (1004,"TUR01",1,3,1,12);
insert into Formato_Da values (1004,"ECO02",0,2,2,6);
insert into Formato_Da values (1005,"TUR01",1,2,1,6);
insert into Formato_Da values (1005,"ECO03",0,3,2,12);
insert into Formato_Da values (1006,"ECO03",1,5,1,12);
insert into Formato_Da values (1007,"ECO01",1,3,2,6);
insert into Formato_Da values (1008,"MAT01",1,2,1,12);
insert into Formato_Da values (1008,"ANA01",0,3,2,6);
insert into Formato_Da values (1009,"FIS01",1,2,1,12);
insert into Formato_Da values (1010,"CHI01",1,1,1,6);
insert into Formato_Da values (1011,"BIO01",1,2,2,12);
insert into Formato_Da values (1012,"ING01",0,3,1,6);
insert into Formato_Da values (1013,"ING01",0,2,2,12);
insert into Formato_Da values (1014,"ING02",0,4,1,6);
insert into Formato_Da values (1015,"MAT01",1,3,2,12);
insert into Formato_Da values (1016,"FIS01",0,4,2,12);
insert into Formato_Da values (1017,"ING_INF01",1,3,1,12);
insert into Formato_Da values (1017,"ING_INF02",0,4,2,6);
insert into Formato_Da values (1018,"ING_INF02",1,2,2,6);
insert into Formato_Da values (1019,"ING01",0,5,1,12);
insert into Formato_Da values (1020,"ING01",0,3,2,6);
insert into Formato_Da values (1021,"ING02",0,4,1,12);
insert into Formato_Da values (1022,"ING02",0,2,2,6);
insert into Formato_Da values (1023,"ING02",0,3,1,12);
insert into Formato_Da values (1024,"ING_INF02",1,2,1,12);
insert into Formato_Da values (1025,"ING_INF02",0,3,2,6);
insert into Formato_Da values (1026,"ING_INF03",1,5,1,12);
insert into Formato_Da values (1027,"ING_INF03",0,4,2,6);
insert into Formato_Da values (1028,"ING_INF01",0,3,1,12);
insert into Formato_Da values (1029,"ING_INF01",0,4,2,6);
insert into Formato_Da values (1030,"INF01",1,2,1,12);
insert into Formato_Da values (1031,"ING_INF03",1,5,1,12);
insert into Formato_Da values (1032,"ING_INF03",0,4,2,6);
insert into Formato_Da values (1033,"ROB01",1,5,1,12);
insert into Formato_Da values (1034,"ROB01",0,4,2,6);
insert into Formato_Da values (1035,"ARC01",1,5,1,12);
insert into Formato_Da values (1036,"DES01",1,4,1,6);
insert into Formato_Da values (1037,"URB01",1,5,1,12);
insert into Formato_Da values (1038,"ARC_CES01",0,3,2,6);
insert into Formato_Da values (1039,"ARC_CES02",0,4,1,12);
insert into Formato_Da values (1040,"DES_CES01",0,4,2,12);
insert into Formato_Da values (1041,"URB_CES01",0,3,1,12);
insert into Formato_Da values (1042,"TEC_CES01",0,4,2,12);
insert into Formato_Da values (1043,"LET01",1,2,1,6);
insert into Formato_Da values (1044,"STO01",1,3,1,12);
insert into Formato_Da values (1045,"FIL01",0,4,2,6);
insert into Formato_Da values (1046,"LIN01",0,3,1,12);
insert into Formato_Da values (1047,"POL01",1,4,1,12);
insert into Formato_Da values (1048,"SOC01",1,3,2,6);
insert into Formato_Da values (1049,"COM01",0,2,1,6);
insert into Formato_Da values (1050,"PSI01",1,4,1,12);
insert into Formato_Da values (1051,"GIU01",1,3,1,12);
insert into Formato_Da values (1052,"DIR01",0,2,2,6);
insert into Formato_Da values (1053,"FAR01",1,4,1,12);
insert into Formato_Da values (1054,"BIOFAR01",0,5,2,12);
insert into Formato_Da values (1055,"MED01",1,5,1,12);
insert into Formato_Da values (1056,"MED01",0,4,2,6);
insert into Formato_Da values (1057,"ANA01",1,3,1,12);
insert into Formato_Da values (1058,"STA01",1,4,2,6);
insert into Formato_Da values (1059,"STA01",0,3,1,12);
insert into Formato_Da values (1060,"MAT01",1,2,1,12);
insert into Formato_Da values (1061,"FIS01",0,4,2,12);
insert into Formato_Da values (1062,"CHI01",1,2,1,6);
insert into Formato_Da values (1063,"BIO01",0,3,2,12);
insert into Formato_Da values (1064,"POL01",1,4,1,12);
insert into Formato_Da values (1065,"SOC01",0,3,2,6);
insert into Formato_Da values (1066,"PSI01",1,3,1,12);
insert into Formato_Da values (1066,"SOC01",0,2,2,6);

# ---------------------------------------------------------------------- #
# Add info into "Forum"                                                  #
# ---------------------------------------------------------------------- #

truncate table Forum;

insert into Forum values (0, "Forum Professori");
insert into Forum values (1, "Forum Studenti");
insert into Forum values (2, "Forum Generale");

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
insert into Indirizzo values ("BO", "BO", 33, "Via", "Zamboni");
insert into Indirizzo values ("BO", "BO", 38, "Via", "Zamboni");
insert into Indirizzo values ("BO", "BO", 2, "Piazza", "San Giovanni in Monte");
insert into Indirizzo values ("BO", "BO", 20, "Via", "Guerrazzi");
insert into Indirizzo values ("BO", "BO", 45, "Viale", "Maggiore");
insert into Indirizzo values ("BO", "BO", 28, "Via", "del Terracini");
insert into Indirizzo values ("BO", "BO", 9, "Via", "Massarenti");
insert into Indirizzo values ("FC", "CE", 50, "Via", "dell'Università");
insert into Indirizzo values ("FC", "FO", 1, "Via", "Giacomo della Torre");
insert into Indirizzo values ("RA", "RA", 27, "Via", "Baccarini");
insert into Indirizzo values ("RA", "RA", 1, "Via", "degli Ariani");
insert into Indirizzo values ("RA", "RA", 6, "Via", "Mariani");
insert into Indirizzo values ("RA", "RA", 23, "Via", "Pasolini");
insert into Indirizzo values ("RA", "RA", 163, "Via", "Sant'Alberto");
insert into Indirizzo values ("RA", "RA", 55, "Via", "Tombesi dall'Ova");
insert into Indirizzo values ("RA", "RA", 5, "Viale", "Randi");
insert into Indirizzo values ("RN", "RN", 22, "Via", "Angherà");

# ---------------------------------------------------------------------- #
# Add info into "Insegna"                                                #
# ---------------------------------------------------------------------- #

truncate table Insegna;

insert into Insegna values (0,3);
insert into Insegna values (1,3);
insert into Insegna values (2,3);
insert into Insegna values (3,3);
insert into Insegna values (4,3);
insert into Insegna values (5,3);
insert into Insegna values (6,3);
insert into Insegna values (7,5);
insert into Insegna values (8,5);
insert into Insegna values (9,5);
insert into Insegna values (10,5);
insert into Insegna values (11,5);
insert into Insegna values (12,5);
insert into Insegna values (13,5);
insert into Insegna values (14,8);
insert into Insegna values (15,8);
insert into Insegna values (16,8);
insert into Insegna values (17,8);
insert into Insegna values (18,8);
insert into Insegna values (19,8);
insert into Insegna values (20,8);
insert into Insegna values (21,9);
insert into Insegna values (22,9);
insert into Insegna values (23,9);
insert into Insegna values (24,9);
insert into Insegna values (25,9);
insert into Insegna values (26,9);
insert into Insegna values (27,9);
insert into Insegna values (28,20);
insert into Insegna values (29,20);
insert into Insegna values (30,20);
insert into Insegna values (31,20);
insert into Insegna values (32,20);
insert into Insegna values (33,20);
insert into Insegna values (34,20);
insert into Insegna values (35,22);
insert into Insegna values (36,22);
insert into Insegna values (37,22);
insert into Insegna values (38,22);
insert into Insegna values (39,22);
insert into Insegna values (40,22);
insert into Insegna values (41,22);
insert into Insegna values (42,28);
insert into Insegna values (43,28);
insert into Insegna values (44,28);
insert into Insegna values (45,28);
insert into Insegna values (46,28);
insert into Insegna values (47,28);
insert into Insegna values (48,28);
insert into Insegna values (49,35);
insert into Insegna values (50,35);
insert into Insegna values (51,35);
insert into Insegna values (52,35);
insert into Insegna values (53,35);
insert into Insegna values (54,35);
insert into Insegna values (55,35);
insert into Insegna values (56,38);
insert into Insegna values (57,38);
insert into Insegna values (58,38);
insert into Insegna values (59,38);
insert into Insegna values (60,38);
insert into Insegna values (61,38);
insert into Insegna values (62,38);
insert into Insegna values (63,41);
insert into Insegna values (64,41);
insert into Insegna values (65,41);
insert into Insegna values (66,41);
insert into Insegna values (67,41);
insert into Insegna values (68,41);
insert into Insegna values (69,41);
insert into Insegna values (70,44);
insert into Insegna values (71,44);
insert into Insegna values (72,44);
insert into Insegna values (73,44);
insert into Insegna values (74,44);
insert into Insegna values (75,44);
insert into Insegna values (76,44);
insert into Insegna values (77,46);
insert into Insegna values (78,46);
insert into Insegna values (79,46);
insert into Insegna values (80,46);
insert into Insegna values (81,46);
insert into Insegna values (82,46);
insert into Insegna values (83,46);
insert into Insegna values (84,58);
insert into Insegna values (85,58);
insert into Insegna values (86,58);
insert into Insegna values (87,58);
insert into Insegna values (88,58);
insert into Insegna values (89,58);
insert into Insegna values (90,58);
insert into Insegna values (91,60);
insert into Insegna values (92,60);
insert into Insegna values (93,60);
insert into Insegna values (94,60);
insert into Insegna values (95,60);
insert into Insegna values (96,60);
insert into Insegna values (97,60);
insert into Insegna values (98,62);
insert into Insegna values (99,62);
insert into Insegna values (100,62);
insert into Insegna values (101,62);
insert into Insegna values (102,62);
insert into Insegna values (103,62);
insert into Insegna values (104,62);
insert into Insegna values (105,65);
insert into Insegna values (106,65);
insert into Insegna values (107,65);
insert into Insegna values (108,65);
insert into Insegna values (109,65);
insert into Insegna values (110,65);
insert into Insegna values (111,65);
insert into Insegna values (112,67);
insert into Insegna values (113,67);
insert into Insegna values (114,67);
insert into Insegna values (115,67);
insert into Insegna values (116,67);
insert into Insegna values (117,67);
insert into Insegna values (118,67);
insert into Insegna values (119,73);
insert into Insegna values (120,73);
insert into Insegna values (121,73);
insert into Insegna values (122,73);
insert into Insegna values (123,73);
insert into Insegna values (124,73);
insert into Insegna values (125,73);
insert into Insegna values (126,78);
insert into Insegna values (127,78);
insert into Insegna values (128,78);
insert into Insegna values (129,78);
insert into Insegna values (130,78);
insert into Insegna values (131,78);
insert into Insegna values (132,78);
insert into Insegna values (133,80);
insert into Insegna values (134,80);
insert into Insegna values (135,80);
insert into Insegna values (136,80);
insert into Insegna values (137,80);
insert into Insegna values (138,80);
insert into Insegna values (139,80);
insert into Insegna values (140,81);
insert into Insegna values (141,81);
insert into Insegna values (142,81);
insert into Insegna values (143,81);
insert into Insegna values (144,81);
insert into Insegna values (145,81);
insert into Insegna values (146,81);
insert into Insegna values (147,82);
insert into Insegna values (148,82);
insert into Insegna values (149,82);
insert into Insegna values (150,82);
insert into Insegna values (151,82);
insert into Insegna values (152,82);
insert into Insegna values (153,82);
insert into Insegna values (154,83);
insert into Insegna values (155,83);
insert into Insegna values (156,83);
insert into Insegna values (157,83);
insert into Insegna values (158,83);
insert into Insegna values (159,83);
insert into Insegna values (160,83);
insert into Insegna values (161,84);
insert into Insegna values (162,84);
insert into Insegna values (163,84);
insert into Insegna values (164,84);
insert into Insegna values (165,84);
insert into Insegna values (166,84);
insert into Insegna values (167,84);
insert into Insegna values (168,88);
insert into Insegna values (169,88);
insert into Insegna values (170,88);
insert into Insegna values (171,88);
insert into Insegna values (172,88);
insert into Insegna values (173,88);
insert into Insegna values (174,88);
insert into Insegna values (175,94);
insert into Insegna values (176,94);
insert into Insegna values (177,94);
insert into Insegna values (178,94);
insert into Insegna values (179,94);
insert into Insegna values (180,94);
insert into Insegna values (181,94);
insert into Insegna values (182,95);
insert into Insegna values (183,95);
insert into Insegna values (184,95);
insert into Insegna values (185,95);
insert into Insegna values (186,95);
insert into Insegna values (187,95);
insert into Insegna values (188,95);
insert into Insegna values (189,96);
insert into Insegna values (190,96);
insert into Insegna values (191,96);
insert into Insegna values (192,96);
insert into Insegna values (193,96);
insert into Insegna values (194,96);
insert into Insegna values (195,96);
insert into Insegna values (196,98);
insert into Insegna values (197,98);
insert into Insegna values (198,98);
insert into Insegna values (199,98);
insert into Insegna values (200,98);
insert into Insegna values (201,98);
insert into Insegna values (202,98);
insert into Insegna values (203,99);
insert into Insegna values (204,99);
insert into Insegna values (205,99);
insert into Insegna values (206,99);
insert into Insegna values (207,99);
insert into Insegna values (208,99);
insert into Insegna values (209,99);
insert into Insegna values (210,100);
insert into Insegna values (211,100);
insert into Insegna values (212,100);
insert into Insegna values (213,100);
insert into Insegna values (214,100);
insert into Insegna values (215,100);
insert into Insegna values (216,100);
insert into Insegna values (217,101);
insert into Insegna values (218,101);
insert into Insegna values (219,101);
insert into Insegna values (220,101);
insert into Insegna values (221,101);
insert into Insegna values (222,101);
insert into Insegna values (223,101);
insert into Insegna values (224,102);
insert into Insegna values (225,102);
insert into Insegna values (226,102);
insert into Insegna values (227,102);
insert into Insegna values (228,102);
insert into Insegna values (229,102);
insert into Insegna values (230,102);
insert into Insegna values (231,103);
insert into Insegna values (232,103);
insert into Insegna values (233,103);
insert into Insegna values (234,103);
insert into Insegna values (235,103);
insert into Insegna values (236,103);
insert into Insegna values (237,103);
insert into Insegna values (238,104);
insert into Insegna values (239,104);
insert into Insegna values (240,104);
insert into Insegna values (241,104);
insert into Insegna values (242,104);
insert into Insegna values (243,104);
insert into Insegna values (244,104);
insert into Insegna values (245,106);
insert into Insegna values (246,106);
insert into Insegna values (247,106);
insert into Insegna values (248,106);
insert into Insegna values (249,106);
insert into Insegna values (250,106);
insert into Insegna values (251,106);
insert into Insegna values (252,109);
insert into Insegna values (253,109);
insert into Insegna values (254,109);
insert into Insegna values (255,109);
insert into Insegna values (256,109);
insert into Insegna values (257,109);
insert into Insegna values (258,109);
insert into Insegna values (259,111);
insert into Insegna values (260,111);
insert into Insegna values (261,111);
insert into Insegna values (262,111);
insert into Insegna values (263,111);
insert into Insegna values (264,111);
insert into Insegna values (265,111);
insert into Insegna values (266,113);
insert into Insegna values (267,113);
insert into Insegna values (268,113);
insert into Insegna values (269,113);
insert into Insegna values (270,113);
insert into Insegna values (271,113);
insert into Insegna values (272,113);
insert into Insegna values (273,116);
insert into Insegna values (274,116);
insert into Insegna values (275,116);
insert into Insegna values (276,116);
insert into Insegna values (277,116);
insert into Insegna values (278,116);
insert into Insegna values (279,116);
insert into Insegna values (280,117);
insert into Insegna values (281,117);
insert into Insegna values (282,117);
insert into Insegna values (283,117);
insert into Insegna values (284,117);
insert into Insegna values (285,117);
insert into Insegna values (286,117);
insert into Insegna values (287,118);
insert into Insegna values (288,118);
insert into Insegna values (289,118);
insert into Insegna values (290,118);
insert into Insegna values (291,118);
insert into Insegna values (292,118);
insert into Insegna values (293,118);
insert into Insegna values (294,119);
insert into Insegna values (295,119);
insert into Insegna values (296,119);
insert into Insegna values (297,119);
insert into Insegna values (298,119);
insert into Insegna values (299,119);
insert into Insegna values (300,119);
insert into Insegna values (301,123);
insert into Insegna values (302,123);
insert into Insegna values (303,123);
insert into Insegna values (304,123);
insert into Insegna values (305,123);
insert into Insegna values (306,123);
insert into Insegna values (307,123);
insert into Insegna values (308,3);
insert into Insegna values (309,3);
insert into Insegna values (310,3);
insert into Insegna values (311,3);
insert into Insegna values (312,3);
insert into Insegna values (313,3);
insert into Insegna values (314,3);
insert into Insegna values (315,5);
insert into Insegna values (316,5);
insert into Insegna values (317,5);
insert into Insegna values (318,5);
insert into Insegna values (319,5);
insert into Insegna values (320,5);
insert into Insegna values (321,5);
insert into Insegna values (322,8);
insert into Insegna values (323,8);
insert into Insegna values (324,8);
insert into Insegna values (325,8);
insert into Insegna values (326,8);
insert into Insegna values (327,8);
insert into Insegna values (328,8);
insert into Insegna values (329,9);
insert into Insegna values (330,9);
insert into Insegna values (331,9);
insert into Insegna values (332,9);
insert into Insegna values (333,9);
insert into Insegna values (334,9);
insert into Insegna values (335,9);
insert into Insegna values (336,20);
insert into Insegna values (337,20);
insert into Insegna values (338,20);
insert into Insegna values (339,20);
insert into Insegna values (340,20);
insert into Insegna values (341,20);
insert into Insegna values (342,20);
insert into Insegna values (343,22);
insert into Insegna values (344,22);
insert into Insegna values (345,22);
insert into Insegna values (346,22);
insert into Insegna values (347,22);
insert into Insegna values (348,22);
insert into Insegna values (349,22);
insert into Insegna values (350,28);
insert into Insegna values (351,28);
insert into Insegna values (352,28);
insert into Insegna values (353,28);
insert into Insegna values (354,28);
insert into Insegna values (355,28);
insert into Insegna values (356,28);
insert into Insegna values (357,35);
insert into Insegna values (358,35);
insert into Insegna values (359,35);
insert into Insegna values (360,35);
insert into Insegna values (361,35);
insert into Insegna values (362,35);
insert into Insegna values (363,35);
insert into Insegna values (364,38);
insert into Insegna values (365,38);
insert into Insegna values (366,38);
insert into Insegna values (367,38);
insert into Insegna values (368,38);
insert into Insegna values (369,38);
insert into Insegna values (370,38);
insert into Insegna values (371,41);
insert into Insegna values (372,41);
insert into Insegna values (373,41);
insert into Insegna values (374,41);
insert into Insegna values (375,41);
insert into Insegna values (376,41);
insert into Insegna values (377,41);
insert into Insegna values (378,44);
insert into Insegna values (379,44);
insert into Insegna values (380,44);
insert into Insegna values (381,44);
insert into Insegna values (382,44);
insert into Insegna values (383,44);
insert into Insegna values (384,44);
insert into Insegna values (385,46);
insert into Insegna values (386,46);
insert into Insegna values (387,46);
insert into Insegna values (388,46);
insert into Insegna values (389,46);
insert into Insegna values (390,46);
insert into Insegna values (391,46);
insert into Insegna values (392,58);
insert into Insegna values (393,58);
insert into Insegna values (394,58);
insert into Insegna values (395,58);
insert into Insegna values (396,58);
insert into Insegna values (397,58);
insert into Insegna values (398,58);
insert into Insegna values (399,60);
insert into Insegna values (400,60);
insert into Insegna values (401,60);
insert into Insegna values (402,60);
insert into Insegna values (403,60);
insert into Insegna values (404,60);
insert into Insegna values (405,60);
insert into Insegna values (406,62);
insert into Insegna values (407,62);
insert into Insegna values (408,62);
insert into Insegna values (409,62);
insert into Insegna values (410,62);
insert into Insegna values (411,62);
insert into Insegna values (412,62);
insert into Insegna values (413,65);
insert into Insegna values (414,65);
insert into Insegna values (415,65);
insert into Insegna values (416,65);
insert into Insegna values (417,65);
insert into Insegna values (418,65);
insert into Insegna values (419,65);
insert into Insegna values (420,67);
insert into Insegna values (421,67);
insert into Insegna values (422,67);
insert into Insegna values (423,67);
insert into Insegna values (424,67);
insert into Insegna values (425,67);
insert into Insegna values (426,67);
insert into Insegna values (427,73);
insert into Insegna values (428,73);
insert into Insegna values (429,73);
insert into Insegna values (430,73);
insert into Insegna values (431,73);
insert into Insegna values (432,73);
insert into Insegna values (433,73);
insert into Insegna values (434,78);
insert into Insegna values (435,78);
insert into Insegna values (436,78);
insert into Insegna values (437,78);
insert into Insegna values (438,78);
insert into Insegna values (439,78);
insert into Insegna values (440,78);
insert into Insegna values (441,80);
insert into Insegna values (442,80);
insert into Insegna values (443,80);
insert into Insegna values (444,80);
insert into Insegna values (445,80);
insert into Insegna values (446,80);
insert into Insegna values (447,80);
insert into Insegna values (448,81);
insert into Insegna values (449,81);
insert into Insegna values (450,81);
insert into Insegna values (451,81);
insert into Insegna values (452,81);
insert into Insegna values (453,81);
insert into Insegna values (454,81);
insert into Insegna values (455,82);
insert into Insegna values (456,82);
insert into Insegna values (457,82);
insert into Insegna values (458,82);
insert into Insegna values (459,82);
insert into Insegna values (460,82);
insert into Insegna values (461,82);
insert into Insegna values (343,225);
insert into Insegna values (344,225);
insert into Insegna values (345,225);
insert into Insegna values (346,225);
insert into Insegna values (347,225);
insert into Insegna values (348,225);
insert into Insegna values (349,225);
insert into Insegna values (378,226);
insert into Insegna values (379,226);
insert into Insegna values (380,226);
insert into Insegna values (381,226);
insert into Insegna values (382,226);
insert into Insegna values (383,226);
insert into Insegna values (384,226);
insert into Insegna values (56,227);
insert into Insegna values (57,227);
insert into Insegna values (58,227);
insert into Insegna values (59,227);
insert into Insegna values (60,227);
insert into Insegna values (61,227);
insert into Insegna values (62,227);
insert into Insegna values (49,228);
insert into Insegna values (50,228);
insert into Insegna values (51,228);
insert into Insegna values (52,228);
insert into Insegna values (53,228);
insert into Insegna values (54,228);
insert into Insegna values (55,228);
insert into Insegna values (434,229);
insert into Insegna values (435,229);
insert into Insegna values (436,229);
insert into Insegna values (437,229);
insert into Insegna values (438,229);
insert into Insegna values (439,229);
insert into Insegna values (440,229);
insert into Insegna values (364,230);
insert into Insegna values (365,230);
insert into Insegna values (366,230);
insert into Insegna values (367,230);
insert into Insegna values (368,230);
insert into Insegna values (369,230);
insert into Insegna values (370,230);
insert into Insegna values (308,231);
insert into Insegna values (309,231);
insert into Insegna values (310,231);
insert into Insegna values (311,231);
insert into Insegna values (312,231);
insert into Insegna values (313,231);
insert into Insegna values (314,231);
insert into Insegna values (280,232);
insert into Insegna values (281,232);
insert into Insegna values (282,232);
insert into Insegna values (283,232);
insert into Insegna values (284,232);
insert into Insegna values (285,232);
insert into Insegna values (286,232);
insert into Insegna values (49,233);
insert into Insegna values (50,233);
insert into Insegna values (51,233);
insert into Insegna values (52,233);
insert into Insegna values (53,233);
insert into Insegna values (54,233);
insert into Insegna values (55,233);
insert into Insegna values (266,234);
insert into Insegna values (267,234);
insert into Insegna values (268,234);
insert into Insegna values (269,234);
insert into Insegna values (270,234);
insert into Insegna values (271,234);
insert into Insegna values (272,234);
insert into Insegna values (70,235);
insert into Insegna values (71,235);
insert into Insegna values (72,235);
insert into Insegna values (73,235);
insert into Insegna values (74,235);
insert into Insegna values (75,235);
insert into Insegna values (76,235);
insert into Insegna values (273,236);
insert into Insegna values (274,236);
insert into Insegna values (275,236);
insert into Insegna values (276,236);
insert into Insegna values (277,236);
insert into Insegna values (278,236);
insert into Insegna values (279,236);
insert into Insegna values (42,237);
insert into Insegna values (43,237);
insert into Insegna values (44,237);
insert into Insegna values (45,237);
insert into Insegna values (46,237);
insert into Insegna values (47,237);
insert into Insegna values (48,237);
insert into Insegna values (154,238);
insert into Insegna values (155,238);
insert into Insegna values (156,238);
insert into Insegna values (157,238);
insert into Insegna values (158,238);
insert into Insegna values (159,238);
insert into Insegna values (160,238);
insert into Insegna values (70,239);
insert into Insegna values (71,239);
insert into Insegna values (72,239);
insert into Insegna values (73,239);
insert into Insegna values (74,239);
insert into Insegna values (75,239);
insert into Insegna values (76,239);
insert into Insegna values (406,240);
insert into Insegna values (407,240);
insert into Insegna values (408,240);
insert into Insegna values (409,240);
insert into Insegna values (410,240);
insert into Insegna values (411,240);
insert into Insegna values (412,240);
insert into Insegna values (343,241);
insert into Insegna values (344,241);
insert into Insegna values (345,241);
insert into Insegna values (346,241);
insert into Insegna values (347,241);
insert into Insegna values (348,241);
insert into Insegna values (349,241);
insert into Insegna values (168,242);
insert into Insegna values (169,242);
insert into Insegna values (170,242);
insert into Insegna values (171,242);
insert into Insegna values (172,242);
insert into Insegna values (173,242);
insert into Insegna values (174,242);
insert into Insegna values (112,243);
insert into Insegna values (113,243);
insert into Insegna values (114,243);
insert into Insegna values (115,243);
insert into Insegna values (116,243);
insert into Insegna values (117,243);
insert into Insegna values (118,243);
insert into Insegna values (266,244);
insert into Insegna values (267,244);
insert into Insegna values (268,244);
insert into Insegna values (269,244);
insert into Insegna values (270,244);
insert into Insegna values (271,244);
insert into Insegna values (272,244);
insert into Insegna values (35,245);
insert into Insegna values (36,245);
insert into Insegna values (37,245);
insert into Insegna values (38,245);
insert into Insegna values (39,245);
insert into Insegna values (40,245);
insert into Insegna values (41,245);
insert into Insegna values (189,246);
insert into Insegna values (190,246);
insert into Insegna values (191,246);
insert into Insegna values (192,246);
insert into Insegna values (193,246);
insert into Insegna values (194,246);
insert into Insegna values (195,246);
insert into Insegna values (70,247);
insert into Insegna values (71,247);
insert into Insegna values (72,247);
insert into Insegna values (73,247);
insert into Insegna values (74,247);
insert into Insegna values (75,247);
insert into Insegna values (76,247);
insert into Insegna values (385,248);
insert into Insegna values (386,248);
insert into Insegna values (387,248);
insert into Insegna values (388,248);
insert into Insegna values (389,248);
insert into Insegna values (390,248);
insert into Insegna values (391,248);
insert into Insegna values (455,249);
insert into Insegna values (456,249);
insert into Insegna values (457,249);
insert into Insegna values (458,249);
insert into Insegna values (459,249);
insert into Insegna values (460,249);
insert into Insegna values (461,249);
insert into Insegna values (413,250);
insert into Insegna values (414,250);
insert into Insegna values (415,250);
insert into Insegna values (416,250);
insert into Insegna values (417,250);
insert into Insegna values (418,250);
insert into Insegna values (419,250);
insert into Insegna values (448,251);
insert into Insegna values (449,251);
insert into Insegna values (450,251);
insert into Insegna values (451,251);
insert into Insegna values (452,251);
insert into Insegna values (453,251);
insert into Insegna values (454,251);
insert into Insegna values (259,252);
insert into Insegna values (260,252);
insert into Insegna values (261,252);
insert into Insegna values (262,252);
insert into Insegna values (263,252);
insert into Insegna values (264,252);
insert into Insegna values (265,252);
insert into Insegna values (189,253);
insert into Insegna values (190,253);
insert into Insegna values (191,253);
insert into Insegna values (192,253);
insert into Insegna values (193,253);
insert into Insegna values (194,253);
insert into Insegna values (195,253);
insert into Insegna values (154,254);
insert into Insegna values (155,254);
insert into Insegna values (156,254);
insert into Insegna values (157,254);
insert into Insegna values (158,254);
insert into Insegna values (159,254);
insert into Insegna values (160,254);
insert into Insegna values (154,255);
insert into Insegna values (155,255);
insert into Insegna values (156,255);
insert into Insegna values (157,255);
insert into Insegna values (158,255);
insert into Insegna values (159,255);
insert into Insegna values (160,255);
insert into Insegna values (280,256);
insert into Insegna values (281,256);
insert into Insegna values (282,256);
insert into Insegna values (283,256);
insert into Insegna values (284,256);
insert into Insegna values (285,256);
insert into Insegna values (286,256);
insert into Insegna values (364,257);
insert into Insegna values (365,257);
insert into Insegna values (366,257);
insert into Insegna values (367,257);
insert into Insegna values (368,257);
insert into Insegna values (369,257);
insert into Insegna values (370,257);

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
insert into Luogo values (15, 10, 'Ufficio Erasmus');
insert into Luogo values (16, 9, 'Ufficio Segreteria Studenti');
insert into Luogo values (17, 9, 'Ufficio Protocollo');
insert into Luogo values (18, 1278, 'Polo Didattico Lettere');
insert into Luogo values (19, 837, 'Polo Didattico Biotecnologie');
insert into Luogo values (20, 9, 'Ufficio Didattico');
insert into Luogo values (21, 475, 'Polo Didattico Scienze');
insert into Luogo values (22, 9, 'Ufficio Supporto Docenti');
insert into Luogo values (23, 108, 'Aula Magna');
insert into Luogo values (24, 10, 'Ufficio Erasmus');
insert into Luogo values (25, 220, 'Parco della Didattica');
insert into Luogo values (26, 185, 'Giardino Botanico');
insert into Luogo values (27, 6, 'Ufficio Ricerca e Sviluppo');
insert into Luogo values (28, 67, 'Aula Informatica 2');
insert into Luogo values (29, 8, 'Ufficio Servizi Informatici');
insert into Luogo values (30, 73, 'Aula Multimediale');
insert into Luogo values (31, 99, 'Aula Laboratorio Fisica');
insert into Luogo values (32, 99, 'Aula Didattica 202');
insert into Luogo values (33, 102, 'Aula Studio C');
insert into Luogo values (34, 6, 'Ufficio Servizi Informatici');
insert into Luogo values (35, 852, 'Polo Didattico Fisica');
insert into Luogo values (36, 4, 'Ufficio Orientamento');
insert into Luogo values (37, 101, 'Aula Seminari');
insert into Luogo values (38, 85, 'Aula Studio B');
insert into Luogo values (39, 3, 'Ufficio Placement');
insert into Luogo values (40, 10, 'Ufficio Placement');
insert into Luogo values (41, 355, 'Polo Didattico Ingegneria');
insert into Luogo values (42, 210, 'Giardino della Pace');
insert into Luogo values (43, 8, 'Ufficio Supporto Docenti');
insert into Luogo values (44, 61, 'Aula Didattica 202');
insert into Luogo values (45, 102, 'Aula Didattica 102');
insert into Luogo values (46, 93, 'Aula Laboratorio Matematica');
insert into Luogo values (47, 4, 'Ufficio Erasmus');
insert into Luogo values (48, 80, 'Aula Laboratorio Matematica');
insert into Luogo values (49, 68, 'Aula Informatica 3');
insert into Luogo values (50, 6, 'Ufficio Qualità');
insert into Luogo values (51, 87, 'Aula Informatica 1');
insert into Luogo values (52, 100, 'Aula Progetti');
insert into Luogo values (53, 7, 'Ufficio Segreteria Studenti');
insert into Luogo values (54, 5, 'Ufficio Risorse Umane');
insert into Luogo values (55, 109, 'Aula Progetti');
insert into Luogo values (56, 135, 'Giardino degli Studenti');
insert into Luogo values (57, 140, 'Giardino della Conoscenza');
insert into Luogo values (58, 59, 'Aula Studio C');
insert into Luogo values (59, 211, 'Polo Didattico Informatica');
insert into Luogo values (60, 96, 'Aula Informatica 2');
insert into Luogo values (61, 59, 'Aula Conferenze');
insert into Luogo values (62, 87, 'Aula Seminari');
insert into Luogo values (63, 83, 'Aula Studio B');
insert into Luogo values (64, 47, 'Aula Progetti');
insert into Luogo values (65, 3, 'Ufficio Comunicazione');
insert into Luogo values (66, 95, 'Aula Didattica 102');
insert into Luogo values (67, 105, 'Aula Informatica 1');
insert into Luogo values (68, 44, 'Aula Informatica Avanzata');
insert into Luogo values (69, 9, 'Ufficio Logistica');
insert into Luogo values (70, 211, 'Giardino delle Scienze');
insert into Luogo values (71, 42, 'Aula Laboratorio Chimica');
insert into Luogo values (72, 89, 'Aula Studio C');
insert into Luogo values (73, 102, 'Giardino dei Saperi');
insert into Luogo values (74, 43, 'Aula Studio B');
insert into Luogo values (75, 238, 'Giardino della Ricerca');
insert into Luogo values (76, 55, 'Aula Informatica 3');
insert into Luogo values (77, 9, 'Ufficio Didattico');
insert into Luogo values (78, 4, 'Ufficio Relazioni Internazionali');
insert into Luogo values (79, 102, 'Aula Studio A');
insert into Luogo values (80, 7, 'Ufficio Segreteria Studenti');
insert into Luogo values (81, 83, 'Aula Progetti');
insert into Luogo values (82, 6, 'Ufficio Segreteria Studenti');
insert into Luogo values (83, 1499, 'Polo Didattico Fisica');
insert into Luogo values (84, 250, 'Giardino delle Scienze');
insert into Luogo values (85, 103, 'Aula Laboratorio Biologia');
insert into Luogo values (86, 515, 'Polo Didattico Biotecnologie');
insert into Luogo values (87, 6, 'Ufficio Qualità');
insert into Luogo values (88, 47, 'Aula Seminari');
insert into Luogo values (89, 109, 'Aula Laboratorio Chimica');
insert into Luogo values (90, 10, 'Ufficio Segreteria Studenti');
insert into Luogo values (91, 56, 'Aula Laboratorio Biologia');
insert into Luogo values (92, 577, 'Polo Didattico Economia');
insert into Luogo values (93, 719, 'Polo Didattico Medicina');
insert into Luogo values (94, 8, 'Ufficio Protocollo');
insert into Luogo values (95, 9, 'Ufficio Didattico');
insert into Luogo values (96, 4, 'Ufficio Orientamento');
insert into Luogo values (97, 9, 'Ufficio Risorse Umane');
insert into Luogo values (98, 3, 'Ufficio Pianificazione');
insert into Luogo values (99, 8, 'Ufficio Didattico');
insert into Luogo values (100, 1139, 'Polo Didattico Comunicazione');
insert into Luogo values (101, 112, 'Aula Didattica 201');
insert into Luogo values (102, 138, 'Giardino della Pace');
insert into Luogo values (103, 3, 'Ufficio Tecnico');
insert into Luogo values (104, 1052, 'Polo Didattico Matematica');
insert into Luogo values (105, 3, 'Ufficio Segreteria Studenti');
insert into Luogo values (106, 10, 'Ufficio Placement');
insert into Luogo values (107, 3, 'Ufficio Logistica');
insert into Luogo values (108, 7, 'Ufficio Logistica');
insert into Luogo values (109, 466, 'Polo Didattico Biotecnologie');
insert into Luogo values (110, 7, 'Ufficio Servizi Informatici');
insert into Luogo values (111, 1412, 'Polo Didattico Biotecnologie');
insert into Luogo values (112, 62, 'Aula Progetti');
insert into Luogo values (113, 5, 'Ufficio Logistica');
insert into Luogo values (114, 8, 'Ufficio Servizi Informatici');
insert into Luogo values (115, 42, 'Aula Studio A');
insert into Luogo values (116, 6, 'Ufficio Ricerca e Sviluppo');
insert into Luogo values (117, 283, 'Giardino della Ricerca');
insert into Luogo values (118, 51, 'Aula Laboratorio Fisica');
insert into Luogo values (119, 108, 'Aula Informatica Avanzata');
insert into Luogo values (120, 6, 'Ufficio Qualità');
insert into Luogo values (121, 82, 'Aula Studio C');
insert into Luogo values (122, 3, 'Ufficio Affari Generali');
insert into Luogo values (123, 8, 'Ufficio Segreteria Studenti');
insert into Luogo values (124, 84, 'Aula Studio C');
insert into Luogo values (125, 7, 'Ufficio Tecnico');
insert into Luogo values (126, 45, 'Aula Informatica Avanzata');
insert into Luogo values (127, 5, 'Ufficio Qualità');
insert into Luogo values (128, 5, 'Ufficio Placement');
insert into Luogo values (129, 4, 'Ufficio Tirocini');
insert into Luogo values (130, 53, 'Aula Seminari');
insert into Luogo values (131, 91, 'Aula Didattica 101');
insert into Luogo values (132, 10, 'Ufficio Tirocini');
insert into Luogo values (133, 91, 'Aula Studio B');
insert into Luogo values (134, 7, 'Ufficio Relazioni Internazionali');
insert into Luogo values (135, 62, 'Aula Laboratorio Chimica');
insert into Luogo values (136, 5, 'Ufficio Amministrativo');
insert into Luogo values (137, 1162, 'Polo Didattico Comunicazione');
insert into Luogo values (138, 53, 'Aula Laboratorio Chimica');
insert into Luogo values (139, 75, 'Aula Seminari');
insert into Luogo values (140, 70, 'Aula Didattica 201');
insert into Luogo values (141, 298, 'Giardino della Cultura');
insert into Luogo values (142, 1105, 'Polo Didattico Matematica');
insert into Luogo values (143, 81, 'Aula Studio A');
insert into Luogo values (144, 8, 'Ufficio Servizi Informatici');
insert into Luogo values (145, 110, 'Aula Multimediale');
insert into Luogo values (146, 287, 'Parco della Didattica');
insert into Luogo values (147, 102, 'Aula Informatica 3');
insert into Luogo values (148, 59, 'Aula Conferenze');
insert into Luogo values (149, 104, 'Aula Progetti');
insert into Luogo values (150, 8, 'Ufficio Qualità');
insert into Luogo values (151, 117, 'Aula Didattica 201');
insert into Luogo values (152, 9, 'Ufficio Tirocini');
insert into Luogo values (153, 104, 'Giardino delle Idee');
insert into Luogo values (154, 101, 'Aula Studio B');
insert into Luogo values (155, 138, 'Giardino della Ricerca');
insert into Luogo values (156, 8, 'Ufficio Orientamento');
insert into Luogo values (157, 99, 'Aula Seminari');
insert into Luogo values (158, 3, 'Ufficio Qualità');
insert into Luogo values (159, 134, 'Giardino dei Saperi');
insert into Luogo values (160, 5, 'Ufficio Didattico');
insert into Luogo values (161, 99, 'Aula Multimediale');
insert into Luogo values (162, 9, 'Ufficio Tecnico');
insert into Luogo values (163, 78, 'Aula Studio B');
insert into Luogo values (164, 945, 'Polo Didattico Matematica');
insert into Luogo values (165, 110, 'Aula Laboratorio Matematica');
insert into Luogo values (166, 356, 'Polo Didattico Architettura');
insert into Luogo values (167, 7, 'Ufficio Relazioni Internazionali');
insert into Luogo values (168, 1365, 'Polo Didattico Fisica');
insert into Luogo values (169, 5, 'Ufficio Didattico');
insert into Luogo values (170, 115, 'Aula Magna');
insert into Luogo values (171, 250, 'Giardino degli Studenti');
insert into Luogo values (172, 10, 'Ufficio Tecnico');
insert into Luogo values (173, 42, 'Aula Seminari');
insert into Luogo values (174, 650, 'Polo Didattico Biotecnologie');
insert into Luogo values (175, 107, 'Aula Laboratorio Fisica');
insert into Luogo values (176, 7, 'Ufficio Placement');
insert into Luogo values (177, 44, 'Aula Informatica 2');
insert into Luogo values (178, 80, 'Aula Laboratorio Matematica');
insert into Luogo values (179, 8, 'Ufficio Servizi Informatici');
insert into Luogo values (180, 120, 'Giardino dei Saperi');
insert into Luogo values (181, 59, 'Aula Studio B');
insert into Luogo values (182, 5, 'Ufficio Didattico');
insert into Luogo values (183, 98, 'Aula Conferenze');
insert into Luogo values (184, 102, 'Aula Laboratorio Biologia');

# ---------------------------------------------------------------------- #
# Add info into "Materia"                                                #
# ---------------------------------------------------------------------- #

truncate table Materia;

insert into Materia values (1001, "Microeconomia", 0);
insert into Materia values (1002, "Macroeconomia", 0);
insert into Materia values (1003, "Gestione Aziendale", 0);
insert into Materia values (1004, "Turismo Sostenibile", 0);
insert into Materia values (1005, "Marketing Turistico", 0);
insert into Materia values (1006, "Finanza Aziendale", 1);
insert into Materia values (1007, "Microeconomia", 2);
insert into Materia values (1008, "Analisi Matematica I", 2);
insert into Materia values (1009, "Fisica I", 2);
insert into Materia values (1010, "Chimica", 2);
insert into Materia values (1011, "Biologia", 2);
insert into Materia values (1012, "Ottimizzazione dei Processi", 3);
insert into Materia values (1013, "Gestione Industriale", 3);
insert into Materia values (1014, "Progettazione Meccanica", 3);
insert into Materia values (1015, "Analisi Matematica I", 4);
insert into Materia values (1016, "Fisica I", 4);
insert into Materia values (1017, "Programmazione Base", 5);
insert into Materia values (1018, "Ottimizzazione dei Processi", 5);
insert into Materia values (1019, "Gestione Industriale", 5);
insert into Materia values (1020, "Progettazione Meccanica", 5);
insert into Materia values (1021, "Programmazione Avanzata", 5);
insert into Materia values (1022, "Basi di Dati", 5);
insert into Materia values (1023, "Machine Learning", 5);
insert into Materia values (1024, "Analisi dei Dati", 5);
insert into Materia values (1025, "Robotica Industriale", 5);
insert into Materia values (1026, "Architettura", 5);
insert into Materia values (1027, "Design dei Prodotti", 5);
insert into Materia values (1028, "Pianificazione Urbana", 5);
insert into Materia values (1029, "Programmazione Base", 6);
insert into Materia values (1030, "Infermieristica", 6);
insert into Materia values (1031, "Medicina e Chirurgia", 6);
insert into Materia values (1032, "Architettura", 7);
insert into Materia values (1033, "Programmazione Base", 7);
insert into Materia values (1034, "Algoritmi e Strutture Dati", 7);
insert into Materia values (1035, "Sistemi Intelligenti", 7);
insert into Materia values (1036, "Progettazione Edile", 7);
insert into Materia values (1037, "Strutture Civili", 7);
insert into Materia values (1038, "Innovazione Industriale", 7);
insert into Materia values (1039, "Pianificazione Territoriale", 7);
insert into Materia values (1040, "Tecnologie per l'Architettura", 7);
insert into Materia values (1041, "Microeconomia", 8);
insert into Materia values (1042, "Macroeconomia", 8);
insert into Materia values (1043, "Gestione Aziendale", 8);
insert into Materia values (1044, "Turismo Sostenibile", 8);
insert into Materia values (1045, "Marketing Turistico", 8);
insert into Materia values (1046, "Analisi Matematica I", 9);
insert into Materia values (1047, "Microeconomia", 9);
insert into Materia values (1048, "Macroeconomia", 9);
insert into Materia values (1049, "Gestione Aziendale", 9);
insert into Materia values (1050, "Turismo Sostenibile", 9);
insert into Materia values (1051, "Marketing Turistico", 9);
insert into Materia values (1052, "Architettura", 11);
insert into Materia values (1053, "Urbanistica", 11);
insert into Materia values (1054, "Analisi Matematica I", 12);
insert into Materia values (1055, "Turismo Sostenibile", 12);
insert into Materia values (1056, "Marketing Turistico", 12);
insert into Materia values (1057, "Pianificazione Urbana", 12);
insert into Materia values (1058, "Analisi Matematica I", 13);
insert into Materia values (1059, "Fisica I", 13);
insert into Materia values (1060, "Analisi Matematica I", 14);
insert into Materia values (1061, "Fisica I", 14);
insert into Materia values (1062, "Scienze Politiche", 15);
insert into Materia values (1063, "Medicina e Chirurgia", 15);
insert into Materia values (1064, "Scienze Politiche", 16);
insert into Materia values (1065, "Sociologia", 16);
insert into Materia values (1066, "Scienze della Comunicazione", 16);

# ---------------------------------------------------------------------- #
# Add info into "Materia_Anno"                                           #
# ---------------------------------------------------------------------- #

truncate table Materia_Anno;

insert into Materia_Anno values (0, 1001, 2020);
insert into Materia_Anno values (1, 1001, 2021);
insert into Materia_Anno values (2, 1001, 2022);
insert into Materia_Anno values (3, 1001, 2023);
insert into Materia_Anno values (4, 1001, 2024);
insert into Materia_Anno values (5, 1001, 2025);
insert into Materia_Anno values (6, 1001, 2026);
insert into Materia_Anno values (7, 1002, 2020);
insert into Materia_Anno values (8, 1002, 2021);
insert into Materia_Anno values (9, 1002, 2022);
insert into Materia_Anno values (10, 1002, 2023);
insert into Materia_Anno values (11, 1002, 2024);
insert into Materia_Anno values (12, 1002, 2025);
insert into Materia_Anno values (13, 1002, 2026);
insert into Materia_Anno values (14, 1003, 2020);
insert into Materia_Anno values (15, 1003, 2021);
insert into Materia_Anno values (16, 1003, 2022);
insert into Materia_Anno values (17, 1003, 2023);
insert into Materia_Anno values (18, 1003, 2024);
insert into Materia_Anno values (19, 1003, 2025);
insert into Materia_Anno values (20, 1003, 2026);
insert into Materia_Anno values (21, 1004, 2020);
insert into Materia_Anno values (22, 1004, 2021);
insert into Materia_Anno values (23, 1004, 2022);
insert into Materia_Anno values (24, 1004, 2023);
insert into Materia_Anno values (25, 1004, 2024);
insert into Materia_Anno values (26, 1004, 2025);
insert into Materia_Anno values (27, 1004, 2026);
insert into Materia_Anno values (28, 1005, 2020);
insert into Materia_Anno values (29, 1005, 2021);
insert into Materia_Anno values (30, 1005, 2022);
insert into Materia_Anno values (31, 1005, 2023);
insert into Materia_Anno values (32, 1005, 2024);
insert into Materia_Anno values (33, 1005, 2025);
insert into Materia_Anno values (34, 1005, 2026);
insert into Materia_Anno values (35, 1006, 2020);
insert into Materia_Anno values (36, 1006, 2021);
insert into Materia_Anno values (37, 1006, 2022);
insert into Materia_Anno values (38, 1006, 2023);
insert into Materia_Anno values (39, 1006, 2024);
insert into Materia_Anno values (40, 1006, 2025);
insert into Materia_Anno values (41, 1006, 2026);
insert into Materia_Anno values (42, 1007, 2020);
insert into Materia_Anno values (43, 1007, 2021);
insert into Materia_Anno values (44, 1007, 2022);
insert into Materia_Anno values (45, 1007, 2023);
insert into Materia_Anno values (46, 1007, 2024);
insert into Materia_Anno values (47, 1007, 2025);
insert into Materia_Anno values (48, 1007, 2026);
insert into Materia_Anno values (49, 1008, 2020);
insert into Materia_Anno values (50, 1008, 2021);
insert into Materia_Anno values (51, 1008, 2022);
insert into Materia_Anno values (52, 1008, 2023);
insert into Materia_Anno values (53, 1008, 2024);
insert into Materia_Anno values (54, 1008, 2025);
insert into Materia_Anno values (55, 1008, 2026);
insert into Materia_Anno values (56, 1009, 2020);
insert into Materia_Anno values (57, 1009, 2021);
insert into Materia_Anno values (58, 1009, 2022);
insert into Materia_Anno values (59, 1009, 2023);
insert into Materia_Anno values (60, 1009, 2024);
insert into Materia_Anno values (61, 1009, 2025);
insert into Materia_Anno values (62, 1009, 2026);
insert into Materia_Anno values (63, 1010, 2020);
insert into Materia_Anno values (64, 1010, 2021);
insert into Materia_Anno values (65, 1010, 2022);
insert into Materia_Anno values (66, 1010, 2023);
insert into Materia_Anno values (67, 1010, 2024);
insert into Materia_Anno values (68, 1010, 2025);
insert into Materia_Anno values (69, 1010, 2026);
insert into Materia_Anno values (70, 1011, 2020);
insert into Materia_Anno values (71, 1011, 2021);
insert into Materia_Anno values (72, 1011, 2022);
insert into Materia_Anno values (73, 1011, 2023);
insert into Materia_Anno values (74, 1011, 2024);
insert into Materia_Anno values (75, 1011, 2025);
insert into Materia_Anno values (76, 1011, 2026);
insert into Materia_Anno values (77, 1012, 2020);
insert into Materia_Anno values (78, 1012, 2021);
insert into Materia_Anno values (79, 1012, 2022);
insert into Materia_Anno values (80, 1012, 2023);
insert into Materia_Anno values (81, 1012, 2024);
insert into Materia_Anno values (82, 1012, 2025);
insert into Materia_Anno values (83, 1012, 2026);
insert into Materia_Anno values (84, 1013, 2020);
insert into Materia_Anno values (85, 1013, 2021);
insert into Materia_Anno values (86, 1013, 2022);
insert into Materia_Anno values (87, 1013, 2023);
insert into Materia_Anno values (88, 1013, 2024);
insert into Materia_Anno values (89, 1013, 2025);
insert into Materia_Anno values (90, 1013, 2026);
insert into Materia_Anno values (91, 1014, 2020);
insert into Materia_Anno values (92, 1014, 2021);
insert into Materia_Anno values (93, 1014, 2022);
insert into Materia_Anno values (94, 1014, 2023);
insert into Materia_Anno values (95, 1014, 2024);
insert into Materia_Anno values (96, 1014, 2025);
insert into Materia_Anno values (97, 1014, 2026);
insert into Materia_Anno values (98, 1015, 2020);
insert into Materia_Anno values (99, 1015, 2021);
insert into Materia_Anno values (100, 1015, 2022);
insert into Materia_Anno values (101, 1015, 2023);
insert into Materia_Anno values (102, 1015, 2024);
insert into Materia_Anno values (103, 1015, 2025);
insert into Materia_Anno values (104, 1015, 2026);
insert into Materia_Anno values (105, 1016, 2020);
insert into Materia_Anno values (106, 1016, 2021);
insert into Materia_Anno values (107, 1016, 2022);
insert into Materia_Anno values (108, 1016, 2023);
insert into Materia_Anno values (109, 1016, 2024);
insert into Materia_Anno values (110, 1016, 2025);
insert into Materia_Anno values (111, 1016, 2026);
insert into Materia_Anno values (112, 1017, 2020);
insert into Materia_Anno values (113, 1017, 2021);
insert into Materia_Anno values (114, 1017, 2022);
insert into Materia_Anno values (115, 1017, 2023);
insert into Materia_Anno values (116, 1017, 2024);
insert into Materia_Anno values (117, 1017, 2025);
insert into Materia_Anno values (118, 1017, 2026);
insert into Materia_Anno values (119, 1018, 2020);
insert into Materia_Anno values (120, 1018, 2021);
insert into Materia_Anno values (121, 1018, 2022);
insert into Materia_Anno values (122, 1018, 2023);
insert into Materia_Anno values (123, 1018, 2024);
insert into Materia_Anno values (124, 1018, 2025);
insert into Materia_Anno values (125, 1018, 2026);
insert into Materia_Anno values (126, 1019, 2020);
insert into Materia_Anno values (127, 1019, 2021);
insert into Materia_Anno values (128, 1019, 2022);
insert into Materia_Anno values (129, 1019, 2023);
insert into Materia_Anno values (130, 1019, 2024);
insert into Materia_Anno values (131, 1019, 2025);
insert into Materia_Anno values (132, 1019, 2026);
insert into Materia_Anno values (133, 1020, 2020);
insert into Materia_Anno values (134, 1020, 2021);
insert into Materia_Anno values (135, 1020, 2022);
insert into Materia_Anno values (136, 1020, 2023);
insert into Materia_Anno values (137, 1020, 2024);
insert into Materia_Anno values (138, 1020, 2025);
insert into Materia_Anno values (139, 1020, 2026);
insert into Materia_Anno values (140, 1021, 2020);
insert into Materia_Anno values (141, 1021, 2021);
insert into Materia_Anno values (142, 1021, 2022);
insert into Materia_Anno values (143, 1021, 2023);
insert into Materia_Anno values (144, 1021, 2024);
insert into Materia_Anno values (145, 1021, 2025);
insert into Materia_Anno values (146, 1021, 2026);
insert into Materia_Anno values (147, 1022, 2020);
insert into Materia_Anno values (148, 1022, 2021);
insert into Materia_Anno values (149, 1022, 2022);
insert into Materia_Anno values (150, 1022, 2023);
insert into Materia_Anno values (151, 1022, 2024);
insert into Materia_Anno values (152, 1022, 2025);
insert into Materia_Anno values (153, 1022, 2026);
insert into Materia_Anno values (154, 1023, 2020);
insert into Materia_Anno values (155, 1023, 2021);
insert into Materia_Anno values (156, 1023, 2022);
insert into Materia_Anno values (157, 1023, 2023);
insert into Materia_Anno values (158, 1023, 2024);
insert into Materia_Anno values (159, 1023, 2025);
insert into Materia_Anno values (160, 1023, 2026);
insert into Materia_Anno values (161, 1024, 2020);
insert into Materia_Anno values (162, 1024, 2021);
insert into Materia_Anno values (163, 1024, 2022);
insert into Materia_Anno values (164, 1024, 2023);
insert into Materia_Anno values (165, 1024, 2024);
insert into Materia_Anno values (166, 1024, 2025);
insert into Materia_Anno values (167, 1024, 2026);
insert into Materia_Anno values (168, 1025, 2020);
insert into Materia_Anno values (169, 1025, 2021);
insert into Materia_Anno values (170, 1025, 2022);
insert into Materia_Anno values (171, 1025, 2023);
insert into Materia_Anno values (172, 1025, 2024);
insert into Materia_Anno values (173, 1025, 2025);
insert into Materia_Anno values (174, 1025, 2026);
insert into Materia_Anno values (175, 1026, 2020);
insert into Materia_Anno values (176, 1026, 2021);
insert into Materia_Anno values (177, 1026, 2022);
insert into Materia_Anno values (178, 1026, 2023);
insert into Materia_Anno values (179, 1026, 2024);
insert into Materia_Anno values (180, 1026, 2025);
insert into Materia_Anno values (181, 1026, 2026);
insert into Materia_Anno values (182, 1027, 2020);
insert into Materia_Anno values (183, 1027, 2021);
insert into Materia_Anno values (184, 1027, 2022);
insert into Materia_Anno values (185, 1027, 2023);
insert into Materia_Anno values (186, 1027, 2024);
insert into Materia_Anno values (187, 1027, 2025);
insert into Materia_Anno values (188, 1027, 2026);
insert into Materia_Anno values (189, 1028, 2020);
insert into Materia_Anno values (190, 1028, 2021);
insert into Materia_Anno values (191, 1028, 2022);
insert into Materia_Anno values (192, 1028, 2023);
insert into Materia_Anno values (193, 1028, 2024);
insert into Materia_Anno values (194, 1028, 2025);
insert into Materia_Anno values (195, 1028, 2026);
insert into Materia_Anno values (196, 1029, 2020);
insert into Materia_Anno values (197, 1029, 2021);
insert into Materia_Anno values (198, 1029, 2022);
insert into Materia_Anno values (199, 1029, 2023);
insert into Materia_Anno values (200, 1029, 2024);
insert into Materia_Anno values (201, 1029, 2025);
insert into Materia_Anno values (202, 1029, 2026);
insert into Materia_Anno values (203, 1030, 2020);
insert into Materia_Anno values (204, 1030, 2021);
insert into Materia_Anno values (205, 1030, 2022);
insert into Materia_Anno values (206, 1030, 2023);
insert into Materia_Anno values (207, 1030, 2024);
insert into Materia_Anno values (208, 1030, 2025);
insert into Materia_Anno values (209, 1030, 2026);
insert into Materia_Anno values (210, 1031, 2020);
insert into Materia_Anno values (211, 1031, 2021);
insert into Materia_Anno values (212, 1031, 2022);
insert into Materia_Anno values (213, 1031, 2023);
insert into Materia_Anno values (214, 1031, 2024);
insert into Materia_Anno values (215, 1031, 2025);
insert into Materia_Anno values (216, 1031, 2026);
insert into Materia_Anno values (217, 1032, 2020);
insert into Materia_Anno values (218, 1032, 2021);
insert into Materia_Anno values (219, 1032, 2022);
insert into Materia_Anno values (220, 1032, 2023);
insert into Materia_Anno values (221, 1032, 2024);
insert into Materia_Anno values (222, 1032, 2025);
insert into Materia_Anno values (223, 1032, 2026);
insert into Materia_Anno values (224, 1033, 2020);
insert into Materia_Anno values (225, 1033, 2021);
insert into Materia_Anno values (226, 1033, 2022);
insert into Materia_Anno values (227, 1033, 2023);
insert into Materia_Anno values (228, 1033, 2024);
insert into Materia_Anno values (229, 1033, 2025);
insert into Materia_Anno values (230, 1033, 2026);
insert into Materia_Anno values (231, 1034, 2020);
insert into Materia_Anno values (232, 1034, 2021);
insert into Materia_Anno values (233, 1034, 2022);
insert into Materia_Anno values (234, 1034, 2023);
insert into Materia_Anno values (235, 1034, 2024);
insert into Materia_Anno values (236, 1034, 2025);
insert into Materia_Anno values (237, 1034, 2026);
insert into Materia_Anno values (238, 1035, 2020);
insert into Materia_Anno values (239, 1035, 2021);
insert into Materia_Anno values (240, 1035, 2022);
insert into Materia_Anno values (241, 1035, 2023);
insert into Materia_Anno values (242, 1035, 2024);
insert into Materia_Anno values (243, 1035, 2025);
insert into Materia_Anno values (244, 1035, 2026);
insert into Materia_Anno values (245, 1036, 2020);
insert into Materia_Anno values (246, 1036, 2021);
insert into Materia_Anno values (247, 1036, 2022);
insert into Materia_Anno values (248, 1036, 2023);
insert into Materia_Anno values (249, 1036, 2024);
insert into Materia_Anno values (250, 1036, 2025);
insert into Materia_Anno values (251, 1036, 2026);
insert into Materia_Anno values (252, 1037, 2020);
insert into Materia_Anno values (253, 1037, 2021);
insert into Materia_Anno values (254, 1037, 2022);
insert into Materia_Anno values (255, 1037, 2023);
insert into Materia_Anno values (256, 1037, 2024);
insert into Materia_Anno values (257, 1037, 2025);
insert into Materia_Anno values (258, 1037, 2026);
insert into Materia_Anno values (259, 1038, 2020);
insert into Materia_Anno values (260, 1038, 2021);
insert into Materia_Anno values (261, 1038, 2022);
insert into Materia_Anno values (262, 1038, 2023);
insert into Materia_Anno values (263, 1038, 2024);
insert into Materia_Anno values (264, 1038, 2025);
insert into Materia_Anno values (265, 1038, 2026);
insert into Materia_Anno values (266, 1039, 2020);
insert into Materia_Anno values (267, 1039, 2021);
insert into Materia_Anno values (268, 1039, 2022);
insert into Materia_Anno values (269, 1039, 2023);
insert into Materia_Anno values (270, 1039, 2024);
insert into Materia_Anno values (271, 1039, 2025);
insert into Materia_Anno values (272, 1039, 2026);
insert into Materia_Anno values (273, 1040, 2020);
insert into Materia_Anno values (274, 1040, 2021);
insert into Materia_Anno values (275, 1040, 2022);
insert into Materia_Anno values (276, 1040, 2023);
insert into Materia_Anno values (277, 1040, 2024);
insert into Materia_Anno values (278, 1040, 2025);
insert into Materia_Anno values (279, 1040, 2026);
insert into Materia_Anno values (280, 1041, 2020);
insert into Materia_Anno values (281, 1041, 2021);
insert into Materia_Anno values (282, 1041, 2022);
insert into Materia_Anno values (283, 1041, 2023);
insert into Materia_Anno values (284, 1041, 2024);
insert into Materia_Anno values (285, 1041, 2025);
insert into Materia_Anno values (286, 1041, 2026);
insert into Materia_Anno values (287, 1042, 2020);
insert into Materia_Anno values (288, 1042, 2021);
insert into Materia_Anno values (289, 1042, 2022);
insert into Materia_Anno values (290, 1042, 2023);
insert into Materia_Anno values (291, 1042, 2024);
insert into Materia_Anno values (292, 1042, 2025);
insert into Materia_Anno values (293, 1042, 2026);
insert into Materia_Anno values (294, 1043, 2020);
insert into Materia_Anno values (295, 1043, 2021);
insert into Materia_Anno values (296, 1043, 2022);
insert into Materia_Anno values (297, 1043, 2023);
insert into Materia_Anno values (298, 1043, 2024);
insert into Materia_Anno values (299, 1043, 2025);
insert into Materia_Anno values (300, 1043, 2026);
insert into Materia_Anno values (301, 1044, 2020);
insert into Materia_Anno values (302, 1044, 2021);
insert into Materia_Anno values (303, 1044, 2022);
insert into Materia_Anno values (304, 1044, 2023);
insert into Materia_Anno values (305, 1044, 2024);
insert into Materia_Anno values (306, 1044, 2025);
insert into Materia_Anno values (307, 1044, 2026);
insert into Materia_Anno values (308, 1045, 2020);
insert into Materia_Anno values (309, 1045, 2021);
insert into Materia_Anno values (310, 1045, 2022);
insert into Materia_Anno values (311, 1045, 2023);
insert into Materia_Anno values (312, 1045, 2024);
insert into Materia_Anno values (313, 1045, 2025);
insert into Materia_Anno values (314, 1045, 2026);
insert into Materia_Anno values (315, 1046, 2020);
insert into Materia_Anno values (316, 1046, 2021);
insert into Materia_Anno values (317, 1046, 2022);
insert into Materia_Anno values (318, 1046, 2023);
insert into Materia_Anno values (319, 1046, 2024);
insert into Materia_Anno values (320, 1046, 2025);
insert into Materia_Anno values (321, 1046, 2026);
insert into Materia_Anno values (322, 1047, 2020);
insert into Materia_Anno values (323, 1047, 2021);
insert into Materia_Anno values (324, 1047, 2022);
insert into Materia_Anno values (325, 1047, 2023);
insert into Materia_Anno values (326, 1047, 2024);
insert into Materia_Anno values (327, 1047, 2025);
insert into Materia_Anno values (328, 1047, 2026);
insert into Materia_Anno values (329, 1048, 2020);
insert into Materia_Anno values (330, 1048, 2021);
insert into Materia_Anno values (331, 1048, 2022);
insert into Materia_Anno values (332, 1048, 2023);
insert into Materia_Anno values (333, 1048, 2024);
insert into Materia_Anno values (334, 1048, 2025);
insert into Materia_Anno values (335, 1048, 2026);
insert into Materia_Anno values (336, 1049, 2020);
insert into Materia_Anno values (337, 1049, 2021);
insert into Materia_Anno values (338, 1049, 2022);
insert into Materia_Anno values (339, 1049, 2023);
insert into Materia_Anno values (340, 1049, 2024);
insert into Materia_Anno values (341, 1049, 2025);
insert into Materia_Anno values (342, 1049, 2026);
insert into Materia_Anno values (343, 1050, 2020);
insert into Materia_Anno values (344, 1050, 2021);
insert into Materia_Anno values (345, 1050, 2022);
insert into Materia_Anno values (346, 1050, 2023);
insert into Materia_Anno values (347, 1050, 2024);
insert into Materia_Anno values (348, 1050, 2025);
insert into Materia_Anno values (349, 1050, 2026);
insert into Materia_Anno values (350, 1051, 2020);
insert into Materia_Anno values (351, 1051, 2021);
insert into Materia_Anno values (352, 1051, 2022);
insert into Materia_Anno values (353, 1051, 2023);
insert into Materia_Anno values (354, 1051, 2024);
insert into Materia_Anno values (355, 1051, 2025);
insert into Materia_Anno values (356, 1051, 2026);
insert into Materia_Anno values (357, 1052, 2020);
insert into Materia_Anno values (358, 1052, 2021);
insert into Materia_Anno values (359, 1052, 2022);
insert into Materia_Anno values (360, 1052, 2023);
insert into Materia_Anno values (361, 1052, 2024);
insert into Materia_Anno values (362, 1052, 2025);
insert into Materia_Anno values (363, 1052, 2026);
insert into Materia_Anno values (364, 1053, 2020);
insert into Materia_Anno values (365, 1053, 2021);
insert into Materia_Anno values (366, 1053, 2022);
insert into Materia_Anno values (367, 1053, 2023);
insert into Materia_Anno values (368, 1053, 2024);
insert into Materia_Anno values (369, 1053, 2025);
insert into Materia_Anno values (370, 1053, 2026);
insert into Materia_Anno values (371, 1054, 2020);
insert into Materia_Anno values (372, 1054, 2021);
insert into Materia_Anno values (373, 1054, 2022);
insert into Materia_Anno values (374, 1054, 2023);
insert into Materia_Anno values (375, 1054, 2024);
insert into Materia_Anno values (376, 1054, 2025);
insert into Materia_Anno values (377, 1054, 2026);
insert into Materia_Anno values (378, 1055, 2020);
insert into Materia_Anno values (379, 1055, 2021);
insert into Materia_Anno values (380, 1055, 2022);
insert into Materia_Anno values (381, 1055, 2023);
insert into Materia_Anno values (382, 1055, 2024);
insert into Materia_Anno values (383, 1055, 2025);
insert into Materia_Anno values (384, 1055, 2026);
insert into Materia_Anno values (385, 1056, 2020);
insert into Materia_Anno values (386, 1056, 2021);
insert into Materia_Anno values (387, 1056, 2022);
insert into Materia_Anno values (388, 1056, 2023);
insert into Materia_Anno values (389, 1056, 2024);
insert into Materia_Anno values (390, 1056, 2025);
insert into Materia_Anno values (391, 1056, 2026);
insert into Materia_Anno values (392, 1057, 2020);
insert into Materia_Anno values (393, 1057, 2021);
insert into Materia_Anno values (394, 1057, 2022);
insert into Materia_Anno values (395, 1057, 2023);
insert into Materia_Anno values (396, 1057, 2024);
insert into Materia_Anno values (397, 1057, 2025);
insert into Materia_Anno values (398, 1057, 2026);
insert into Materia_Anno values (399, 1058, 2020);
insert into Materia_Anno values (400, 1058, 2021);
insert into Materia_Anno values (401, 1058, 2022);
insert into Materia_Anno values (402, 1058, 2023);
insert into Materia_Anno values (403, 1058, 2024);
insert into Materia_Anno values (404, 1058, 2025);
insert into Materia_Anno values (405, 1058, 2026);
insert into Materia_Anno values (406, 1059, 2020);
insert into Materia_Anno values (407, 1059, 2021);
insert into Materia_Anno values (408, 1059, 2022);
insert into Materia_Anno values (409, 1059, 2023);
insert into Materia_Anno values (410, 1059, 2024);
insert into Materia_Anno values (411, 1059, 2025);
insert into Materia_Anno values (412, 1059, 2026);
insert into Materia_Anno values (413, 1060, 2020);
insert into Materia_Anno values (414, 1060, 2021);
insert into Materia_Anno values (415, 1060, 2022);
insert into Materia_Anno values (416, 1060, 2023);
insert into Materia_Anno values (417, 1060, 2024);
insert into Materia_Anno values (418, 1060, 2025);
insert into Materia_Anno values (419, 1060, 2026);
insert into Materia_Anno values (420, 1061, 2020);
insert into Materia_Anno values (421, 1061, 2021);
insert into Materia_Anno values (422, 1061, 2022);
insert into Materia_Anno values (423, 1061, 2023);
insert into Materia_Anno values (424, 1061, 2024);
insert into Materia_Anno values (425, 1061, 2025);
insert into Materia_Anno values (426, 1061, 2026);
insert into Materia_Anno values (427, 1062, 2020);
insert into Materia_Anno values (428, 1062, 2021);
insert into Materia_Anno values (429, 1062, 2022);
insert into Materia_Anno values (430, 1062, 2023);
insert into Materia_Anno values (431, 1062, 2024);
insert into Materia_Anno values (432, 1062, 2025);
insert into Materia_Anno values (433, 1062, 2026);
insert into Materia_Anno values (434, 1063, 2020);
insert into Materia_Anno values (435, 1063, 2021);
insert into Materia_Anno values (436, 1063, 2022);
insert into Materia_Anno values (437, 1063, 2023);
insert into Materia_Anno values (438, 1063, 2024);
insert into Materia_Anno values (439, 1063, 2025);
insert into Materia_Anno values (440, 1063, 2026);
insert into Materia_Anno values (441, 1064, 2020);
insert into Materia_Anno values (442, 1064, 2021);
insert into Materia_Anno values (443, 1064, 2022);
insert into Materia_Anno values (444, 1064, 2023);
insert into Materia_Anno values (445, 1064, 2024);
insert into Materia_Anno values (446, 1064, 2025);
insert into Materia_Anno values (447, 1064, 2026);
insert into Materia_Anno values (448, 1065, 2020);
insert into Materia_Anno values (449, 1065, 2021);
insert into Materia_Anno values (450, 1065, 2022);
insert into Materia_Anno values (451, 1065, 2023);
insert into Materia_Anno values (452, 1065, 2024);
insert into Materia_Anno values (453, 1065, 2025);
insert into Materia_Anno values (454, 1065, 2026);
insert into Materia_Anno values (455, 1066, 2020);
insert into Materia_Anno values (456, 1066, 2021);
insert into Materia_Anno values (457, 1066, 2022);
insert into Materia_Anno values (458, 1066, 2023);
insert into Materia_Anno values (459, 1066, 2024);
insert into Materia_Anno values (460, 1066, 2025);
insert into Materia_Anno values (461, 1066, 2026);

# ---------------------------------------------------------------------- #
# Add info into "Modulo"                                                 #
# ---------------------------------------------------------------------- #

truncate table Modulo;

insert into Modulo values ('ECO01', 0, 1, '2020-09-10', '2020-12-12', 'Esercitazioni pratiche', 3);
insert into Modulo values ('ECO01', 1, 1, '2021-09-14', '2021-12-10', 'Corso di aggiornamento', 3);
insert into Modulo values ('ECO01', 2, 1, '2022-09-11', '2022-12-17', 'Sviluppo algoritmi', 3);
insert into Modulo values ('ECO01', 2, 2, '2022-09-15', '2022-12-11', 'Progettazione software', 3);
insert into Modulo values ('ECO01', 2, 3, '2022-09-21', '2022-12-20', 'Sessione di problem solving', 3);
insert into Modulo values ('ECO01', 2, 4, '2022-09-13', '2022-12-11', 'Lezione avanzata', 3);
insert into Modulo values ('ECO01', 3, 1, '2023-09-10', '2023-12-19', 'Sessione pratica', 3);
insert into Modulo values ('ECO01', 4, 1, '2024-09-10', '2024-12-14', 'Corso di aggiornamento', 3);
insert into Modulo values ('ECO01', 5, 1, '2025-09-20', '2025-12-21', 'Esercizi di laboratorio', 3);
insert into Modulo values ('ECO01', 6, 1, '2026-09-15', '2026-12-14', 'Analisi statistica', 3);
insert into Modulo values ('ECO01', 6, 2, '2026-09-15', '2026-12-08', 'Corso intensivo', 3);
insert into Modulo values ('ECO01', 7, 1, '2020-09-19', '2020-12-11', 'Corso di aggiornamento', 5);
insert into Modulo values ('ECO01', 7, 2, '2020-09-19', '2020-12-18', 'Studio comparativo', 5);
insert into Modulo values ('ECO01', 8, 1, '2021-09-21', '2021-12-12', 'Revisione concetti base', 5);
insert into Modulo values ('ECO01', 9, 1, '2022-09-21', '2022-12-22', 'Progettazione software', 5);
insert into Modulo values ('ECO01', 10, 1, '2023-09-19', '2023-12-10', 'Introduzione alle normative', 5);
insert into Modulo values ('ECO01', 10, 2, '2023-09-19', '2023-12-17', 'Studio di scenario', 5);
insert into Modulo values ('ECO01', 11, 1, '2024-09-11', '2024-12-14', 'Sviluppo algoritmi', 5);
insert into Modulo values ('ECO01', 12, 1, '2025-09-10', '2025-12-20', 'Applicazioni pratiche', 5);
insert into Modulo values ('ECO01', 13, 1, '2026-09-08', '2026-12-18', 'Presentazione di gruppo', 5);
insert into Modulo values ('ECO01', 14, 1, '2020-09-22', '2020-12-14', 'Approfondimento scientifico', 8);
insert into Modulo values ('ECO01', 15, 1, '2021-09-22', '2021-12-20', 'Studio interdisciplinare', 8);
insert into Modulo values ('ECO01', 16, 1, '2022-09-12', '2022-12-09', 'Approfondimento scientifico', 8);
insert into Modulo values ('ECO01', 16, 2, '2022-09-22', '2022-12-19', 'Revisione concetti base', 8);
insert into Modulo values ('ECO01', 17, 1, '2023-09-15', '2023-12-18', 'Analisi dei casi studio', 8);
insert into Modulo values ('ECO01', 17, 2, '2023-09-09', '2023-12-15', 'Attività sperimentale', 8);
insert into Modulo values ('ECO01', 18, 1, '2024-09-21', '2024-12-21', 'Seminario specialistico', 8);
insert into Modulo values ('ECO01', 19, 1, '2025-09-09', '2025-12-19', 'Analisi statistica', 8);
insert into Modulo values ('ECO01', 20, 1, '2026-09-20', '2026-12-15', 'Attività sperimentale', 8);
insert into Modulo values ('ECO01', 20, 2, '2026-09-13', '2026-12-17', 'Progettazione software', 8);
insert into Modulo values ('TUR01', 21, 1, '2020-09-15', '2020-12-09', 'Attività sperimentale', 9);
insert into Modulo values ('TUR01', 21, 2, '2020-09-19', '2020-12-13', 'Analisi statistica', 9);
insert into Modulo values ('TUR01', 22, 1, '2021-09-17', '2021-12-18', 'Laboratorio', 9);
insert into Modulo values ('TUR01', 22, 2, '2021-09-08', '2021-12-15', 'Studio comparativo', 9);
insert into Modulo values ('TUR01', 23, 1, '2022-09-11', '2022-12-21', 'Corso di aggiornamento', 9);
insert into Modulo values ('TUR01', 23, 2, '2022-09-14', '2022-12-21', 'Studio di scenario', 9);
insert into Modulo values ('TUR01', 24, 1, '2023-09-19', '2023-12-20', 'Lezione avanzata', 9);
insert into Modulo values ('TUR01', 24, 2, '2023-09-08', '2023-12-12', 'Esercitazioni pratiche', 9);
insert into Modulo values ('TUR01', 25, 1, '2024-09-15', '2024-12-18', 'Discussione teorica', 9);
insert into Modulo values ('TUR01', 25, 2, '2024-09-20', '2024-12-18', 'Studio interdisciplinare', 9);
insert into Modulo values ('TUR01', 26, 1, '2025-09-21', '2025-12-22', 'Esercizi di laboratorio', 9);
insert into Modulo values ('TUR01', 26, 2, '2025-09-09', '2025-12-18', 'Presentazione di gruppo', 9);
insert into Modulo values ('TUR01', 27, 1, '2026-09-21', '2026-12-17', 'Sessione pratica', 9);
insert into Modulo values ('TUR01', 28, 1, '2020-09-18', '2020-12-22', 'Analisi dei casi studio', 20);
insert into Modulo values ('TUR01', 29, 1, '2021-09-08', '2021-12-15', 'Corso intensivo', 20);
insert into Modulo values ('TUR01', 29, 2, '2021-09-21', '2021-12-20', 'Approfondimento scientifico', 20);
insert into Modulo values ('TUR01', 29, 3, '2021-09-14', '2021-12-15', 'Analisi statistica', 20);
insert into Modulo values ('TUR01', 29, 4, '2021-09-19', '2021-12-22', 'Modulo introduttivo', 20);
insert into Modulo values ('TUR01', 30, 1, '2022-09-13', '2022-12-18', 'Studio interdisciplinare', 20);
insert into Modulo values ('TUR01', 31, 1, '2023-09-22', '2023-12-08', 'Attività sperimentale', 20);
insert into Modulo values ('TUR01', 31, 2, '2023-09-11', '2023-12-10', 'Simulazioni e role-play', 20);
insert into Modulo values ('TUR01', 31, 3, '2023-09-14', '2023-12-13', 'Studio di scenario', 20);
insert into Modulo values ('TUR01', 31, 4, '2023-09-22', '2023-12-18', 'Applicazioni pratiche', 20);
insert into Modulo values ('TUR01', 32, 1, '2024-09-13', '2024-12-14', 'Sviluppo algoritmi', 20);
insert into Modulo values ('TUR01', 32, 2, '2024-09-12', '2024-12-20', 'Studio interdisciplinare', 20);
insert into Modulo values ('TUR01', 33, 1, '2025-09-10', '2025-12-17', 'Sessione di problem solving', 20);
insert into Modulo values ('TUR01', 34, 1, '2026-09-21', '2026-12-13', 'Approccio metodologico', 20);
insert into Modulo values ('TUR01', 34, 2, '2026-09-10', '2026-12-09', 'Sviluppo algoritmi', 20);
insert into Modulo values ('ECO03', 35, 1, '2020-09-17', '2020-12-08', 'Progettazione software', 22);
insert into Modulo values ('ECO03', 36, 1, '2021-09-16', '2021-12-12', 'Corso intensivo', 245);
insert into Modulo values ('ECO03', 37, 1, '2022-09-19', '2022-12-12', 'Applicazioni pratiche', 22);
insert into Modulo values ('ECO03', 37, 2, '2022-09-16', '2022-12-12', 'Presentazione di gruppo', 22);
insert into Modulo values ('ECO03', 38, 1, '2023-09-11', '2023-12-14', 'Analisi statistica', 245);
insert into Modulo values ('ECO03', 39, 1, '2024-09-21', '2024-12-19', 'Analisi dei casi studio', 245);
insert into Modulo values ('ECO03', 39, 2, '2024-09-22', '2024-12-11', 'Workshop interattivo', 22);
insert into Modulo values ('ECO03', 40, 1, '2025-09-15', '2025-12-13', 'Analisi statistica', 245);
insert into Modulo values ('ECO03', 41, 1, '2026-09-21', '2026-12-18', 'Analisi dei casi studio', 245);
insert into Modulo values ('ECO01', 42, 1, '2020-02-09', '2020-06-16', 'Laboratorio creativo', 237);
insert into Modulo values ('ECO01', 43, 1, '2021-02-12', '2021-06-18', 'Studio di scenario', 237);
insert into Modulo values ('ECO01', 44, 1, '2022-02-10', '2022-06-19', 'Applicazioni pratiche', 237);
insert into Modulo values ('ECO01', 45, 1, '2023-02-11', '2023-06-17', 'Studio interdisciplinare', 28);
insert into Modulo values ('ECO01', 45, 2, '2023-02-13', '2023-06-11', 'Laboratorio creativo', 28);
insert into Modulo values ('ECO01', 46, 1, '2024-02-14', '2024-06-22', 'Laboratorio', 237);
insert into Modulo values ('ECO01', 46, 2, '2024-02-13', '2024-06-22', 'Analisi statistica', 237);
insert into Modulo values ('ECO01', 46, 3, '2024-02-08', '2024-06-16', 'Esercitazioni pratiche', 237);
insert into Modulo values ('ECO01', 46, 4, '2024-02-20', '2024-06-10', 'Esercizi di laboratorio', 237);
insert into Modulo values ('ECO01', 47, 1, '2025-02-14', '2025-06-12', 'Esercitazioni pratiche', 237);
insert into Modulo values ('ECO01', 47, 2, '2025-02-21', '2025-06-15', 'Laboratorio creativo', 237);
insert into Modulo values ('ECO01', 48, 1, '2026-02-18', '2026-06-16', 'Corso di aggiornamento', 237);
insert into Modulo values ('ECO01', 48, 2, '2026-02-12', '2026-06-20', 'Corso di aggiornamento', 28);
insert into Modulo values ('MAT01', 49, 1, '2020-09-12', '2020-12-14', 'Laboratorio creativo', 233);
insert into Modulo values ('MAT01', 50, 1, '2021-09-21', '2021-12-18', 'Introduzione alle normative', 233);
insert into Modulo values ('MAT01', 51, 1, '2022-09-20', '2022-12-10', 'Lezione avanzata', 233);
insert into Modulo values ('MAT01', 51, 2, '2022-09-18', '2022-12-08', 'Seminario applicativo', 233);
insert into Modulo values ('MAT01', 52, 1, '2023-09-11', '2023-12-20', 'Analisi statistica', 228);
insert into Modulo values ('MAT01', 52, 2, '2023-09-12', '2023-12-13', 'Presentazione di gruppo', 233);
insert into Modulo values ('MAT01', 53, 1, '2024-09-12', '2024-12-21', 'Modulo introduttivo', 233);
insert into Modulo values ('MAT01', 53, 2, '2024-09-12', '2024-12-14', 'Analisi statistica', 233);
insert into Modulo values ('MAT01', 54, 1, '2025-09-09', '2025-12-15', 'Workshop interattivo', 228);
insert into Modulo values ('MAT01', 54, 2, '2025-09-08', '2025-12-17', 'Analisi dei casi studio', 233);
insert into Modulo values ('MAT01', 55, 1, '2026-09-10', '2026-12-11', 'Esercitazioni pratiche', 228);
insert into Modulo values ('MAT01', 55, 2, '2026-09-16', '2026-12-15', 'Studio di scenario', 228);
insert into Modulo values ('FIS01', 56, 1, '2020-09-11', '2020-12-11', 'Sviluppo algoritmi', 38);
insert into Modulo values ('FIS01', 57, 1, '2021-09-08', '2021-12-09', 'Progettazione software', 227);
insert into Modulo values ('FIS01', 57, 2, '2021-09-19', '2021-12-11', 'Seminario specialistico', 227);
insert into Modulo values ('FIS01', 57, 3, '2021-09-22', '2021-12-10', 'Approfondimento scientifico', 38);
insert into Modulo values ('FIS01', 57, 4, '2021-09-21', '2021-12-19', 'Studio interdisciplinare', 227);
insert into Modulo values ('FIS01', 58, 1, '2022-09-21', '2022-12-16', 'Sessione pratica', 227);
insert into Modulo values ('FIS01', 58, 2, '2022-09-10', '2022-12-20', 'Presentazione di gruppo', 38);
insert into Modulo values ('FIS01', 58, 3, '2022-09-17', '2022-12-20', 'Laboratorio', 38);
insert into Modulo values ('FIS01', 58, 4, '2022-09-20', '2022-12-22', 'Corso intensivo', 38);
insert into Modulo values ('FIS01', 59, 1, '2023-09-16', '2023-12-22', 'Sessione di problem solving', 38);
insert into Modulo values ('FIS01', 60, 1, '2024-09-12', '2024-12-14', 'Approccio metodologico', 38);
insert into Modulo values ('FIS01', 61, 1, '2025-09-22', '2025-12-19', 'Laboratorio', 38);
insert into Modulo values ('FIS01', 62, 1, '2026-09-20', '2026-12-17', 'Attività sperimentale', 227);
insert into Modulo values ('CHI01', 63, 1, '2020-09-20', '2020-12-16', 'Sessione di problem solving', 41);
insert into Modulo values ('CHI01', 64, 1, '2021-09-08', '2021-12-12', 'Simulazioni e role-play', 41);
insert into Modulo values ('CHI01', 65, 1, '2022-09-18', '2022-12-12', 'Progettazione software', 41);
insert into Modulo values ('CHI01', 65, 2, '2022-09-09', '2022-12-22', 'Attività sperimentale', 41);
insert into Modulo values ('CHI01', 65, 3, '2022-09-18', '2022-12-22', 'Esercizi di laboratorio', 41);
insert into Modulo values ('CHI01', 65, 4, '2022-09-12', '2022-12-10', 'Lezione avanzata', 41);
insert into Modulo values ('CHI01', 66, 1, '2023-09-22', '2023-12-10', 'Workshop interattivo', 41);
insert into Modulo values ('CHI01', 67, 1, '2024-09-21', '2024-12-10', 'Corso intensivo', 41);
insert into Modulo values ('CHI01', 68, 1, '2025-09-22', '2025-12-21', 'Revisione concetti base', 41);
insert into Modulo values ('CHI01', 68, 2, '2025-09-19', '2025-12-17', 'Lezione avanzata', 41);
insert into Modulo values ('CHI01', 69, 1, '2026-09-11', '2026-12-22', 'Analisi dei casi studio', 41);
insert into Modulo values ('CHI01', 69, 2, '2026-09-12', '2026-12-08', 'Corso intensivo', 41);
insert into Modulo values ('BIO01', 70, 1, '2020-02-13', '2020-06-08', 'Approfondimento scientifico', 239);
insert into Modulo values ('BIO01', 70, 2, '2020-02-21', '2020-06-11', 'Simulazioni e role-play', 239);
insert into Modulo values ('BIO01', 71, 1, '2021-02-22', '2021-06-13', 'Esercizi di laboratorio', 239);
insert into Modulo values ('BIO01', 71, 2, '2021-02-21', '2021-06-10', 'Attività sperimentale', 247);
insert into Modulo values ('BIO01', 72, 1, '2022-02-14', '2022-06-17', 'Sviluppo algoritmi', 247);
insert into Modulo values ('BIO01', 72, 2, '2022-02-22', '2022-06-20', 'Attività sperimentale', 239);
insert into Modulo values ('BIO01', 73, 1, '2023-02-11', '2023-06-17', 'Attività sperimentale', 239);
insert into Modulo values ('BIO01', 73, 2, '2023-02-18', '2023-06-08', 'Corso di aggiornamento', 44);
insert into Modulo values ('BIO01', 74, 1, '2024-02-11', '2024-06-20', 'Approfondimento scientifico', 235);
insert into Modulo values ('BIO01', 74, 2, '2024-02-15', '2024-06-20', 'Modulo introduttivo', 235);
insert into Modulo values ('BIO01', 75, 1, '2025-02-09', '2025-06-19', 'Sessione di problem solving', 44);
insert into Modulo values ('BIO01', 76, 1, '2026-02-21', '2026-06-19', 'Attività sperimentale', 44);
insert into Modulo values ('ING01', 77, 1, '2020-09-12', '2020-12-12', 'Analisi statistica', 46);
insert into Modulo values ('ING01', 77, 2, '2020-09-14', '2020-12-21', 'Sviluppo algoritmi', 46);
insert into Modulo values ('ING01', 78, 1, '2021-09-15', '2021-12-14', 'Laboratorio creativo', 46);
insert into Modulo values ('ING01', 78, 2, '2021-09-18', '2021-12-09', 'Modulo introduttivo', 46);
insert into Modulo values ('ING01', 79, 1, '2022-09-18', '2022-12-14', 'Corso intensivo', 46);
insert into Modulo values ('ING01', 80, 1, '2023-09-16', '2023-12-08', 'Approccio metodologico', 46);
insert into Modulo values ('ING01', 80, 2, '2023-09-15', '2023-12-22', 'Discussione teorica', 46);
insert into Modulo values ('ING01', 81, 1, '2024-09-16', '2024-12-13', 'Revisione concetti base', 46);
insert into Modulo values ('ING01', 82, 1, '2025-09-15', '2025-12-17', 'Workshop interattivo', 46);
insert into Modulo values ('ING01', 83, 1, '2026-09-09', '2026-12-11', 'Attività sperimentale', 46);
insert into Modulo values ('ING01', 83, 2, '2026-09-13', '2026-12-19', 'Simulazioni e role-play', 46);
insert into Modulo values ('ING01', 83, 3, '2026-09-20', '2026-12-21', 'Analisi dei casi studio', 46);
insert into Modulo values ('ING01', 83, 4, '2026-09-09', '2026-12-12', 'Analisi dei casi studio', 46);
insert into Modulo values ('ING01', 84, 1, '2020-02-19', '2020-06-12', 'Analisi statistica', 58);
insert into Modulo values ('ING01', 84, 2, '2020-02-10', '2020-06-08', 'Studio interdisciplinare', 58);
insert into Modulo values ('ING01', 85, 1, '2021-02-18', '2021-06-19', 'Studio comparativo', 58);
insert into Modulo values ('ING01', 86, 1, '2022-02-15', '2022-06-19', 'Presentazione di gruppo', 58);
insert into Modulo values ('ING01', 86, 2, '2022-02-18', '2022-06-15', 'Seminario applicativo', 58);
insert into Modulo values ('ING01', 87, 1, '2023-02-18', '2023-06-12', 'Studio comparativo', 58);
insert into Modulo values ('ING01', 87, 2, '2023-02-18', '2023-06-17', 'Attività sperimentale', 58);
insert into Modulo values ('ING01', 88, 1, '2024-02-09', '2024-06-14', 'Seminario specialistico', 58);
insert into Modulo values ('ING01', 89, 1, '2025-02-20', '2025-06-09', 'Attività sperimentale', 58);
insert into Modulo values ('ING01', 89, 2, '2025-02-12', '2025-06-11', 'Simulazioni e role-play', 58);
insert into Modulo values ('ING01', 89, 3, '2025-02-13', '2025-06-18', 'Approfondimento scientifico', 58);
insert into Modulo values ('ING01', 89, 4, '2025-02-20', '2025-06-11', 'Analisi statistica', 58);
insert into Modulo values ('ING01', 90, 1, '2026-02-08', '2026-06-15', 'Seminario specialistico', 58);
insert into Modulo values ('ING01', 90, 2, '2026-02-21', '2026-06-10', 'Corso di aggiornamento', 58);
insert into Modulo values ('ING02', 91, 1, '2020-09-22', '2020-12-19', 'Sessione pratica', 60);
insert into Modulo values ('ING02', 92, 1, '2021-09-17', '2021-12-12', 'Progettazione software', 60);
insert into Modulo values ('ING02', 93, 1, '2022-09-10', '2022-12-16', 'Seminario specialistico', 60);
insert into Modulo values ('ING02', 94, 1, '2023-09-14', '2023-12-18', 'Lezione avanzata', 60);
insert into Modulo values ('ING02', 94, 2, '2023-09-20', '2023-12-17', 'Attività sperimentale', 60);
insert into Modulo values ('ING02', 95, 1, '2024-09-20', '2024-12-13', 'Presentazione di gruppo', 60);
insert into Modulo values ('ING02', 95, 2, '2024-09-16', '2024-12-18', 'Lezione avanzata', 60);
insert into Modulo values ('ING02', 96, 1, '2025-09-18', '2025-12-16', 'Esercizi di laboratorio', 60);
insert into Modulo values ('ING02', 96, 2, '2025-09-18', '2025-12-12', 'Seminario specialistico', 60);
insert into Modulo values ('ING02', 96, 3, '2025-09-08', '2025-12-21', 'Seminario applicativo', 60);
insert into Modulo values ('ING02', 96, 4, '2025-09-14', '2025-12-21', 'Analisi statistica', 60);
insert into Modulo values ('ING02', 97, 1, '2026-09-10', '2026-12-08', 'Sessione di problem solving', 60);
insert into Modulo values ('MAT01', 98, 1, '2020-02-13', '2020-06-19', 'Studio di scenario', 62);
insert into Modulo values ('MAT01', 99, 1, '2021-02-13', '2021-06-20', 'Studio interdisciplinare', 62);
insert into Modulo values ('MAT01', 99, 2, '2021-02-17', '2021-06-20', 'Studio comparativo', 62);
insert into Modulo values ('MAT01', 100, 1, '2022-02-20', '2022-06-10', 'Discussione teorica', 62);
insert into Modulo values ('MAT01', 100, 2, '2022-02-09', '2022-06-17', 'Analisi dei casi studio', 62);
insert into Modulo values ('MAT01', 101, 1, '2023-02-22', '2023-06-12', 'Studio interdisciplinare', 62);
insert into Modulo values ('MAT01', 101, 2, '2023-02-21', '2023-06-17', 'Analisi dei casi studio', 62);
insert into Modulo values ('MAT01', 101, 3, '2023-02-15', '2023-06-18', 'Progetto guidato', 62);
insert into Modulo values ('MAT01', 101, 4, '2023-02-11', '2023-06-13', 'Seminario applicativo', 62);
insert into Modulo values ('MAT01', 102, 1, '2024-02-12', '2024-06-21', 'Modulo introduttivo', 62);
insert into Modulo values ('MAT01', 102, 2, '2024-02-19', '2024-06-10', 'Approccio metodologico', 62);
insert into Modulo values ('MAT01', 103, 1, '2025-02-15', '2025-06-22', 'Studio comparativo', 62);
insert into Modulo values ('MAT01', 103, 2, '2025-02-16', '2025-06-20', 'Laboratorio', 62);
insert into Modulo values ('MAT01', 104, 1, '2026-02-18', '2026-06-20', 'Seminario applicativo', 62);
insert into Modulo values ('FIS01', 105, 1, '2020-02-22', '2020-06-10', 'Progetto guidato', 65);
insert into Modulo values ('FIS01', 106, 1, '2021-02-21', '2021-06-18', 'Progettazione software', 65);
insert into Modulo values ('FIS01', 107, 1, '2022-02-12', '2022-06-22', 'Approccio metodologico', 65);
insert into Modulo values ('FIS01', 108, 1, '2023-02-11', '2023-06-11', 'Laboratorio', 65);
insert into Modulo values ('FIS01', 109, 1, '2024-02-18', '2024-06-20', 'Corso di aggiornamento', 65);
insert into Modulo values ('FIS01', 110, 1, '2025-02-18', '2025-06-22', 'Progettazione software', 65);
insert into Modulo values ('FIS01', 111, 1, '2026-02-17', '2026-06-21', 'Presentazione di gruppo', 65);
insert into Modulo values ('FIS01', 111, 2, '2026-02-12', '2026-06-13', 'Approfondimento scientifico', 65);
insert into Modulo values ('ING_INF01', 112, 1, '2020-09-19', '2020-12-14', 'Analisi statistica', 243);
insert into Modulo values ('ING_INF01', 112, 2, '2020-09-09', '2020-12-15', 'Approfondimento scientifico', 243);
insert into Modulo values ('ING_INF01', 113, 1, '2021-09-20', '2021-12-16', 'Revisione concetti base', 67);
insert into Modulo values ('ING_INF01', 114, 1, '2022-09-16', '2022-12-15', 'Esercitazioni pratiche', 67);
insert into Modulo values ('ING_INF01', 114, 2, '2022-09-15', '2022-12-16', 'Modulo introduttivo', 67);
insert into Modulo values ('ING_INF01', 114, 3, '2022-09-19', '2022-12-19', 'Studio comparativo', 67);
insert into Modulo values ('ING_INF01', 114, 4, '2022-09-17', '2022-12-15', 'Introduzione alle normative', 67);
insert into Modulo values ('ING_INF01', 115, 1, '2023-09-16', '2023-12-20', 'Modulo introduttivo', 243);
insert into Modulo values ('ING_INF01', 115, 2, '2023-09-08', '2023-12-22', 'Approccio metodologico', 67);
insert into Modulo values ('ING_INF01', 116, 1, '2024-09-19', '2024-12-16', 'Studio comparativo', 243);
insert into Modulo values ('ING_INF01', 117, 1, '2025-09-21', '2025-12-19', 'Laboratorio', 243);
insert into Modulo values ('ING_INF01', 118, 1, '2026-09-13', '2026-12-12', 'Corso di aggiornamento', 67);
insert into Modulo values ('ING_INF02', 119, 1, '2020-02-18', '2020-06-18', 'Lezione avanzata', 73);
insert into Modulo values ('ING_INF02', 120, 1, '2021-02-16', '2021-06-09', 'Modulo introduttivo', 73);
insert into Modulo values ('ING_INF02', 121, 1, '2022-02-12', '2022-06-21', 'Sessione di problem solving', 73);
insert into Modulo values ('ING_INF02', 122, 1, '2023-02-13', '2023-06-20', 'Modulo introduttivo', 73);
insert into Modulo values ('ING_INF02', 122, 2, '2023-02-10', '2023-06-16', 'Introduzione alle normative', 73);
insert into Modulo values ('ING_INF02', 123, 1, '2024-02-18', '2024-06-21', 'Seminario specialistico', 73);
insert into Modulo values ('ING_INF02', 124, 1, '2025-02-16', '2025-06-18', 'Presentazione di gruppo', 73);
insert into Modulo values ('ING_INF02', 124, 2, '2025-02-15', '2025-06-20', 'Esercitazioni pratiche', 73);
insert into Modulo values ('ING_INF02', 125, 1, '2026-02-18', '2026-06-16', 'Sessione di problem solving', 73);
insert into Modulo values ('ING01', 126, 1, '2020-09-16', '2020-12-12', 'Presentazione di gruppo', 78);
insert into Modulo values ('ING01', 127, 1, '2021-09-13', '2021-12-20', 'Discussione teorica', 78);
insert into Modulo values ('ING01', 127, 2, '2021-09-10', '2021-12-10', 'Sviluppo algoritmi', 78);
insert into Modulo values ('ING01', 128, 1, '2022-09-19', '2022-12-12', 'Esercizi di laboratorio', 78);
insert into Modulo values ('ING01', 128, 2, '2022-09-20', '2022-12-10', 'Workshop interattivo', 78);
insert into Modulo values ('ING01', 129, 1, '2023-09-13', '2023-12-11', 'Corso di aggiornamento', 78);
insert into Modulo values ('ING01', 129, 2, '2023-09-11', '2023-12-16', 'Approfondimento scientifico', 78);
insert into Modulo values ('ING01', 129, 3, '2023-09-18', '2023-12-13', 'Simulazioni e role-play', 78);
insert into Modulo values ('ING01', 129, 4, '2023-09-12', '2023-12-19', 'Introduzione alle normative', 78);
insert into Modulo values ('ING01', 130, 1, '2024-09-17', '2024-12-09', 'Seminario applicativo', 78);
insert into Modulo values ('ING01', 131, 1, '2025-09-14', '2025-12-15', 'Attività sperimentale', 78);
insert into Modulo values ('ING01', 131, 2, '2025-09-20', '2025-12-12', 'Discussione teorica', 78);
insert into Modulo values ('ING01', 132, 1, '2026-09-17', '2026-12-18', 'Progettazione software', 78);
insert into Modulo values ('ING01', 132, 2, '2026-09-22', '2026-12-09', 'Progetto guidato', 78);
insert into Modulo values ('ING01', 133, 1, '2020-02-16', '2020-06-21', 'Sessione pratica', 80);
insert into Modulo values ('ING01', 134, 1, '2021-02-08', '2021-06-11', 'Introduzione alle normative', 80);
insert into Modulo values ('ING01', 135, 1, '2022-02-12', '2022-06-17', 'Attività sperimentale', 80);
insert into Modulo values ('ING01', 136, 1, '2023-02-15', '2023-06-19', 'Sessione pratica', 80);
insert into Modulo values ('ING01', 136, 2, '2023-02-10', '2023-06-08', 'Sessione di problem solving', 80);
insert into Modulo values ('ING01', 137, 1, '2024-02-09', '2024-06-20', 'Progetto guidato', 80);
insert into Modulo values ('ING01', 137, 2, '2024-02-14', '2024-06-13', 'Sessione pratica', 80);
insert into Modulo values ('ING01', 138, 1, '2025-02-14', '2025-06-18', 'Sessione pratica', 80);
insert into Modulo values ('ING01', 139, 1, '2026-02-22', '2026-06-17', 'Lezione avanzata', 80);
insert into Modulo values ('ING02', 140, 1, '2020-09-12', '2020-12-15', 'Analisi statistica', 81);
insert into Modulo values ('ING02', 140, 2, '2020-09-16', '2020-12-14', 'Studio di scenario', 81);
insert into Modulo values ('ING02', 140, 3, '2020-09-19', '2020-12-16', 'Presentazione di gruppo', 81);
insert into Modulo values ('ING02', 140, 4, '2020-09-16', '2020-12-20', 'Revisione concetti base', 81);
insert into Modulo values ('ING02', 141, 1, '2021-09-15', '2021-12-21', 'Laboratorio creativo', 81);
insert into Modulo values ('ING02', 142, 1, '2022-09-09', '2022-12-14', 'Revisione concetti base', 81);
insert into Modulo values ('ING02', 142, 2, '2022-09-09', '2022-12-18', 'Presentazione di gruppo', 81);
insert into Modulo values ('ING02', 143, 1, '2023-09-21', '2023-12-21', 'Corso intensivo', 81);
insert into Modulo values ('ING02', 144, 1, '2024-09-20', '2024-12-22', 'Sessione pratica', 81);
insert into Modulo values ('ING02', 144, 2, '2024-09-13', '2024-12-21', 'Introduzione alle normative', 81);
insert into Modulo values ('ING02', 145, 1, '2025-09-08', '2025-12-08', 'Studio interdisciplinare', 81);
insert into Modulo values ('ING02', 146, 1, '2026-09-17', '2026-12-08', 'Studio di scenario', 81);
insert into Modulo values ('ING02', 147, 1, '2020-02-09', '2020-06-14', 'Laboratorio creativo', 82);
insert into Modulo values ('ING02', 148, 1, '2021-02-16', '2021-06-08', 'Esercizi di laboratorio', 82);
insert into Modulo values ('ING02', 148, 2, '2021-02-10', '2021-06-18', 'Studio interdisciplinare', 82);
insert into Modulo values ('ING02', 149, 1, '2022-02-18', '2022-06-14', 'Introduzione alle normative', 82);
insert into Modulo values ('ING02', 149, 2, '2022-02-08', '2022-06-08', 'Discussione teorica', 82);
insert into Modulo values ('ING02', 150, 1, '2023-02-16', '2023-06-16', 'Studio interdisciplinare', 82);
insert into Modulo values ('ING02', 151, 1, '2024-02-13', '2024-06-13', 'Corso intensivo', 82);
insert into Modulo values ('ING02', 152, 1, '2025-02-09', '2025-06-21', 'Corso intensivo', 82);
insert into Modulo values ('ING02', 153, 1, '2026-02-19', '2026-06-18', 'Discussione teorica', 82);
insert into Modulo values ('ING02', 153, 2, '2026-02-08', '2026-06-13', 'Laboratorio creativo', 82);
insert into Modulo values ('ING02', 154, 1, '2020-09-21', '2020-12-09', 'Studio interdisciplinare', 238);
insert into Modulo values ('ING02', 154, 2, '2020-09-14', '2020-12-19', 'Revisione concetti base', 83);
insert into Modulo values ('ING02', 154, 3, '2020-09-14', '2020-12-17', 'Presentazione di gruppo', 254);
insert into Modulo values ('ING02', 154, 4, '2020-09-11', '2020-12-21', 'Studio comparativo', 83);
insert into Modulo values ('ING02', 155, 1, '2021-09-17', '2021-12-12', 'Sessione pratica', 255);
insert into Modulo values ('ING02', 156, 1, '2022-09-08', '2022-12-21', 'Seminario specialistico', 83);
insert into Modulo values ('ING02', 156, 2, '2022-09-20', '2022-12-16', 'Discussione teorica', 83);
insert into Modulo values ('ING02', 156, 3, '2022-09-09', '2022-12-11', 'Workshop interattivo', 83);
insert into Modulo values ('ING02', 156, 4, '2022-09-22', '2022-12-11', 'Laboratorio creativo', 255);
insert into Modulo values ('ING02', 157, 1, '2023-09-18', '2023-12-22', 'Esercitazioni pratiche', 238);
insert into Modulo values ('ING02', 158, 1, '2024-09-21', '2024-12-13', 'Introduzione alle normative', 238);
insert into Modulo values ('ING02', 158, 2, '2024-09-11', '2024-12-15', 'Seminario specialistico', 255);
insert into Modulo values ('ING02', 159, 1, '2025-09-09', '2025-12-10', 'Studio di scenario', 255);
insert into Modulo values ('ING02', 160, 1, '2026-09-18', '2026-12-20', 'Workshop interattivo', 254);
insert into Modulo values ('ING_INF02', 161, 1, '2020-09-11', '2020-12-09', 'Simulazioni e role-play', 84);
insert into Modulo values ('ING_INF02', 161, 2, '2020-09-13', '2020-12-13', 'Studio interdisciplinare', 84);
insert into Modulo values ('ING_INF02', 162, 1, '2021-09-09', '2021-12-22', 'Sessione di problem solving', 84);
insert into Modulo values ('ING_INF02', 163, 1, '2022-09-14', '2022-12-20', 'Corso di aggiornamento', 84);
insert into Modulo values ('ING_INF02', 163, 2, '2022-09-17', '2022-12-16', 'Laboratorio', 84);
insert into Modulo values ('ING_INF02', 164, 1, '2023-09-09', '2023-12-17', 'Studio comparativo', 84);
insert into Modulo values ('ING_INF02', 164, 2, '2023-09-18', '2023-12-10', 'Sessione pratica', 84);
insert into Modulo values ('ING_INF02', 165, 1, '2024-09-20', '2024-12-18', 'Approfondimento scientifico', 84);
insert into Modulo values ('ING_INF02', 165, 2, '2024-09-19', '2024-12-20', 'Workshop interattivo', 84);
insert into Modulo values ('ING_INF02', 166, 1, '2025-09-13', '2025-12-22', 'Revisione concetti base', 84);
insert into Modulo values ('ING_INF02', 167, 1, '2026-09-18', '2026-12-10', 'Sessione pratica', 84);
insert into Modulo values ('ING_INF02', 168, 1, '2020-02-20', '2020-06-16', 'Progetto guidato', 242);
insert into Modulo values ('ING_INF02', 169, 1, '2021-02-20', '2021-06-17', 'Simulazioni e role-play', 88);
insert into Modulo values ('ING_INF02', 169, 2, '2021-02-08', '2021-06-12', 'Studio comparativo', 88);
insert into Modulo values ('ING_INF02', 170, 1, '2022-02-17', '2022-06-19', 'Corso di aggiornamento', 242);
insert into Modulo values ('ING_INF02', 170, 2, '2022-02-08', '2022-06-20', 'Analisi dei casi studio', 88);
insert into Modulo values ('ING_INF02', 171, 1, '2023-02-13', '2023-06-18', 'Approfondimento scientifico', 242);
insert into Modulo values ('ING_INF02', 171, 2, '2023-02-19', '2023-06-15', 'Sessione di problem solving', 88);
insert into Modulo values ('ING_INF02', 172, 1, '2024-02-16', '2024-06-10', 'Esercitazioni pratiche', 88);
insert into Modulo values ('ING_INF02', 172, 2, '2024-02-13', '2024-06-22', 'Esercitazioni pratiche', 242);
insert into Modulo values ('ING_INF02', 173, 1, '2025-02-13', '2025-06-08', 'Studio comparativo', 88);
insert into Modulo values ('ING_INF02', 173, 2, '2025-02-10', '2025-06-12', 'Modulo introduttivo', 242);
insert into Modulo values ('ING_INF02', 174, 1, '2026-02-09', '2026-06-19', 'Sessione di problem solving', 242);
insert into Modulo values ('ING_INF03', 175, 1, '2020-09-13', '2020-12-11', 'Presentazione di gruppo', 94);
insert into Modulo values ('ING_INF03', 176, 1, '2021-09-20', '2021-12-18', 'Sessione pratica', 94);
insert into Modulo values ('ING_INF03', 176, 2, '2021-09-17', '2021-12-10', 'Workshop interattivo', 94);
insert into Modulo values ('ING_INF03', 177, 1, '2022-09-08', '2022-12-09', 'Presentazione di gruppo', 94);
insert into Modulo values ('ING_INF03', 178, 1, '2023-09-14', '2023-12-08', 'Studio di scenario', 94);
insert into Modulo values ('ING_INF03', 179, 1, '2024-09-18', '2024-12-08', 'Laboratorio', 94);
insert into Modulo values ('ING_INF03', 180, 1, '2025-09-18', '2025-12-16', 'Studio interdisciplinare', 94);
insert into Modulo values ('ING_INF03', 180, 2, '2025-09-10', '2025-12-08', 'Introduzione alle normative', 94);
insert into Modulo values ('ING_INF03', 181, 1, '2026-09-08', '2026-12-10', 'Lezione avanzata', 94);
insert into Modulo values ('ING_INF03', 182, 1, '2020-02-11', '2020-06-19', 'Analisi statistica', 95);
insert into Modulo values ('ING_INF03', 183, 1, '2021-02-22', '2021-06-10', 'Progettazione software', 95);
insert into Modulo values ('ING_INF03', 184, 1, '2022-02-15', '2022-06-12', 'Corso di aggiornamento', 95);
insert into Modulo values ('ING_INF03', 185, 1, '2023-02-20', '2023-06-14', 'Analisi statistica', 95);
insert into Modulo values ('ING_INF03', 185, 2, '2023-02-09', '2023-06-22', 'Discussione teorica', 95);
insert into Modulo values ('ING_INF03', 186, 1, '2024-02-18', '2024-06-19', 'Sessione pratica', 95);
insert into Modulo values ('ING_INF03', 187, 1, '2025-02-13', '2025-06-22', 'Studio di scenario', 95);
insert into Modulo values ('ING_INF03', 187, 2, '2025-02-20', '2025-06-11', 'Analisi dei casi studio', 95);
insert into Modulo values ('ING_INF03', 187, 3, '2025-02-20', '2025-06-10', 'Laboratorio creativo', 95);
insert into Modulo values ('ING_INF03', 187, 4, '2025-02-22', '2025-06-08', 'Sessione pratica', 95);
insert into Modulo values ('ING_INF03', 188, 1, '2026-02-20', '2026-06-12', 'Introduzione alle normative', 95);
insert into Modulo values ('ING_INF01', 189, 1, '2020-09-19', '2020-12-12', 'Workshop interattivo', 96);
insert into Modulo values ('ING_INF01', 189, 2, '2020-09-19', '2020-12-15', 'Laboratorio', 253);
insert into Modulo values ('ING_INF01', 190, 1, '2021-09-17', '2021-12-22', 'Seminario applicativo', 246);
insert into Modulo values ('ING_INF01', 191, 1, '2022-09-19', '2022-12-09', 'Revisione concetti base', 253);
insert into Modulo values ('ING_INF01', 191, 2, '2022-09-18', '2022-12-22', 'Attività sperimentale', 246);
insert into Modulo values ('ING_INF01', 192, 1, '2023-09-19', '2023-12-10', 'Esercizi di laboratorio', 96);
insert into Modulo values ('ING_INF01', 193, 1, '2024-09-12', '2024-12-09', 'Analisi dei casi studio', 253);
insert into Modulo values ('ING_INF01', 193, 2, '2024-09-17', '2024-12-08', 'Studio comparativo', 246);
insert into Modulo values ('ING_INF01', 193, 3, '2024-09-13', '2024-12-20', 'Esercitazioni pratiche', 246);
insert into Modulo values ('ING_INF01', 193, 4, '2024-09-12', '2024-12-15', 'Corso di aggiornamento', 253);
insert into Modulo values ('ING_INF01', 194, 1, '2025-09-11', '2025-12-16', 'Introduzione alle normative', 253);
insert into Modulo values ('ING_INF01', 195, 1, '2026-09-10', '2026-12-21', 'Studio interdisciplinare', 253);
insert into Modulo values ('ING_INF01', 196, 1, '2020-02-11', '2020-06-17', 'Approccio metodologico', 98);
insert into Modulo values ('ING_INF01', 197, 1, '2021-02-21', '2021-06-12', 'Discussione teorica', 98);
insert into Modulo values ('ING_INF01', 197, 2, '2021-02-09', '2021-06-16', 'Seminario specialistico', 98);
insert into Modulo values ('ING_INF01', 198, 1, '2022-02-20', '2022-06-16', 'Applicazioni pratiche', 98);
insert into Modulo values ('ING_INF01', 198, 2, '2022-02-09', '2022-06-13', 'Sviluppo algoritmi', 98);
insert into Modulo values ('ING_INF01', 199, 1, '2023-02-18', '2023-06-19', 'Studio interdisciplinare', 98);
insert into Modulo values ('ING_INF01', 200, 1, '2024-02-20', '2024-06-14', 'Introduzione alle normative', 98);
insert into Modulo values ('ING_INF01', 200, 2, '2024-02-20', '2024-06-20', 'Progettazione software', 98);
insert into Modulo values ('ING_INF01', 201, 1, '2025-02-19', '2025-06-17', 'Workshop interattivo', 98);
insert into Modulo values ('ING_INF01', 202, 1, '2026-02-12', '2026-06-15', 'Corso di aggiornamento', 98);
insert into Modulo values ('INF01', 203, 1, '2020-09-17', '2020-12-10', 'Esercizi di laboratorio', 99);
insert into Modulo values ('INF01', 204, 1, '2021-09-11', '2021-12-21', 'Seminario applicativo', 99);
insert into Modulo values ('INF01', 205, 1, '2022-09-17', '2022-12-19', 'Attività sperimentale', 99);
insert into Modulo values ('INF01', 206, 1, '2023-09-12', '2023-12-09', 'Corso intensivo', 99);
insert into Modulo values ('INF01', 206, 2, '2023-09-08', '2023-12-21', 'Sessione pratica', 99);
insert into Modulo values ('INF01', 206, 3, '2023-09-16', '2023-12-15', 'Studio interdisciplinare', 99);
insert into Modulo values ('INF01', 206, 4, '2023-09-17', '2023-12-10', 'Studio di scenario', 99);
insert into Modulo values ('INF01', 207, 1, '2024-09-17', '2024-12-15', 'Sviluppo algoritmi', 99);
insert into Modulo values ('INF01', 207, 2, '2024-09-10', '2024-12-20', 'Simulazioni e role-play', 99);
insert into Modulo values ('INF01', 208, 1, '2025-09-14', '2025-12-21', 'Progettazione software', 99);
insert into Modulo values ('INF01', 209, 1, '2026-09-16', '2026-12-21', 'Progettazione software', 99);
insert into Modulo values ('ING_INF03', 210, 1, '2020-09-18', '2020-12-22', 'Sviluppo algoritmi', 100);
insert into Modulo values ('ING_INF03', 211, 1, '2021-09-16', '2021-12-19', 'Sessione pratica', 100);
insert into Modulo values ('ING_INF03', 212, 1, '2022-09-12', '2022-12-21', 'Approccio metodologico', 100);
insert into Modulo values ('ING_INF03', 213, 1, '2023-09-09', '2023-12-17', 'Laboratorio', 100);
insert into Modulo values ('ING_INF03', 214, 1, '2024-09-09', '2024-12-18', 'Simulazioni e role-play', 100);
insert into Modulo values ('ING_INF03', 215, 1, '2025-09-21', '2025-12-19', 'Studio interdisciplinare', 100);
insert into Modulo values ('ING_INF03', 215, 2, '2025-09-16', '2025-12-16', 'Introduzione alle normative', 100);
insert into Modulo values ('ING_INF03', 216, 1, '2026-09-19', '2026-12-12', 'Analisi statistica', 100);
insert into Modulo values ('ING_INF03', 216, 2, '2026-09-10', '2026-12-14', 'Modulo introduttivo', 100);
insert into Modulo values ('ING_INF03', 217, 1, '2020-02-10', '2020-06-21', 'Approccio metodologico', 101);
insert into Modulo values ('ING_INF03', 217, 2, '2020-02-14', '2020-06-20', 'Progetto guidato', 101);
insert into Modulo values ('ING_INF03', 217, 3, '2020-02-09', '2020-06-21', 'Laboratorio creativo', 101);
insert into Modulo values ('ING_INF03', 217, 4, '2020-02-20', '2020-06-13', 'Studio interdisciplinare', 101);
insert into Modulo values ('ING_INF03', 218, 1, '2021-02-10', '2021-06-10', 'Sessione pratica', 101);
insert into Modulo values ('ING_INF03', 218, 2, '2021-02-22', '2021-06-12', 'Esercizi di laboratorio', 101);
insert into Modulo values ('ING_INF03', 219, 1, '2022-02-17', '2022-06-14', 'Sessione di problem solving', 101);
insert into Modulo values ('ING_INF03', 219, 2, '2022-02-15', '2022-06-11', 'Approfondimento scientifico', 101);
insert into Modulo values ('ING_INF03', 220, 1, '2023-02-12', '2023-06-22', 'Workshop interattivo', 101);
insert into Modulo values ('ING_INF03', 220, 2, '2023-02-11', '2023-06-14', 'Applicazioni pratiche', 101);
insert into Modulo values ('ING_INF03', 221, 1, '2024-02-18', '2024-06-10', 'Laboratorio creativo', 101);
insert into Modulo values ('ING_INF03', 221, 2, '2024-02-10', '2024-06-19', 'Sessione pratica', 101);
insert into Modulo values ('ING_INF03', 222, 1, '2025-02-21', '2025-06-19', 'Esercitazioni pratiche', 101);
insert into Modulo values ('ING_INF03', 222, 2, '2025-02-11', '2025-06-21', 'Corso intensivo', 101);
insert into Modulo values ('ING_INF03', 223, 1, '2026-02-12', '2026-06-21', 'Progetto guidato', 101);
insert into Modulo values ('ING_INF03', 223, 2, '2026-02-10', '2026-06-21', 'Laboratorio', 101);
insert into Modulo values ('ROB01', 224, 1, '2020-09-22', '2020-12-17', 'Studio comparativo', 102);
insert into Modulo values ('ROB01', 224, 2, '2020-09-17', '2020-12-14', 'Laboratorio', 102);
insert into Modulo values ('ROB01', 225, 1, '2021-09-17', '2021-12-14', 'Presentazione di gruppo', 102);
insert into Modulo values ('ROB01', 225, 2, '2021-09-15', '2021-12-10', 'Modulo introduttivo', 102);
insert into Modulo values ('ROB01', 226, 1, '2022-09-11', '2022-12-08', 'Seminario applicativo', 102);
insert into Modulo values ('ROB01', 227, 1, '2023-09-19', '2023-12-08', 'Laboratorio', 102);
insert into Modulo values ('ROB01', 228, 1, '2024-09-09', '2024-12-08', 'Modulo introduttivo', 102);
insert into Modulo values ('ROB01', 229, 1, '2025-09-12', '2025-12-10', 'Studio interdisciplinare', 102);
insert into Modulo values ('ROB01', 229, 2, '2025-09-16', '2025-12-11', 'Modulo introduttivo', 102);
insert into Modulo values ('ROB01', 230, 1, '2026-09-08', '2026-12-08', 'Presentazione di gruppo', 102);
insert into Modulo values ('ROB01', 230, 2, '2026-09-19', '2026-12-20', 'Approfondimento scientifico', 102);
insert into Modulo values ('ROB01', 230, 3, '2026-09-14', '2026-12-08', 'Applicazioni pratiche', 102);
insert into Modulo values ('ROB01', 230, 4, '2026-09-08', '2026-12-09', 'Analisi dei casi studio', 102);
insert into Modulo values ('ROB01', 231, 1, '2020-02-12', '2020-06-16', 'Lezione avanzata', 103);
insert into Modulo values ('ROB01', 232, 1, '2021-02-13', '2021-06-21', 'Analisi statistica', 103);
insert into Modulo values ('ROB01', 232, 2, '2021-02-10', '2021-06-20', 'Analisi statistica', 103);
insert into Modulo values ('ROB01', 232, 3, '2021-02-12', '2021-06-12', 'Modulo introduttivo', 103);
insert into Modulo values ('ROB01', 232, 4, '2021-02-09', '2021-06-21', 'Discussione teorica', 103);
insert into Modulo values ('ROB01', 233, 1, '2022-02-15', '2022-06-15', 'Esercizi di laboratorio', 103);
insert into Modulo values ('ROB01', 234, 1, '2023-02-13', '2023-06-09', 'Applicazioni pratiche', 103);
insert into Modulo values ('ROB01', 234, 2, '2023-02-19', '2023-06-13', 'Lezione avanzata', 103);
insert into Modulo values ('ROB01', 234, 3, '2023-02-19', '2023-06-19', 'Approccio metodologico', 103);
insert into Modulo values ('ROB01', 234, 4, '2023-02-20', '2023-06-15', 'Seminario specialistico', 103);
insert into Modulo values ('ROB01', 235, 1, '2024-02-18', '2024-06-12', 'Esercizi di laboratorio', 103);
insert into Modulo values ('ROB01', 236, 1, '2025-02-13', '2025-06-21', 'Applicazioni pratiche', 103);
insert into Modulo values ('ROB01', 236, 2, '2025-02-17', '2025-06-08', 'Presentazione di gruppo', 103);
insert into Modulo values ('ROB01', 237, 1, '2026-02-17', '2026-06-15', 'Corso intensivo', 103);
insert into Modulo values ('ROB01', 237, 2, '2026-02-19', '2026-06-08', 'Approfondimento scientifico', 103);
insert into Modulo values ('ARC01', 238, 1, '2020-09-22', '2020-12-12', 'Progettazione software', 104);
insert into Modulo values ('ARC01', 239, 1, '2021-09-21', '2021-12-13', 'Corso intensivo', 104);
insert into Modulo values ('ARC01', 239, 2, '2021-09-10', '2021-12-11', 'Studio comparativo', 104);
insert into Modulo values ('ARC01', 240, 1, '2022-09-11', '2022-12-09', 'Lezione avanzata', 104);
insert into Modulo values ('ARC01', 240, 2, '2022-09-08', '2022-12-22', 'Studio di scenario', 104);
insert into Modulo values ('ARC01', 241, 1, '2023-09-17', '2023-12-08', 'Sviluppo algoritmi', 104);
insert into Modulo values ('ARC01', 241, 2, '2023-09-11', '2023-12-09', 'Studio comparativo', 104);
insert into Modulo values ('ARC01', 242, 1, '2024-09-20', '2024-12-17', 'Corso di aggiornamento', 104);
insert into Modulo values ('ARC01', 242, 2, '2024-09-09', '2024-12-22', 'Applicazioni pratiche', 104);
insert into Modulo values ('ARC01', 243, 1, '2025-09-13', '2025-12-12', 'Corso intensivo', 104);
insert into Modulo values ('ARC01', 244, 1, '2026-09-21', '2026-12-09', 'Modulo introduttivo', 104);
insert into Modulo values ('ARC01', 244, 2, '2026-09-16', '2026-12-21', 'Revisione concetti base', 104);
insert into Modulo values ('ARC01', 244, 3, '2026-09-20', '2026-12-10', 'Corso di aggiornamento', 104);
insert into Modulo values ('ARC01', 244, 4, '2026-09-12', '2026-12-16', 'Sessione pratica', 104);
insert into Modulo values ('DES01', 245, 1, '2020-09-12', '2020-12-12', 'Approccio metodologico', 106);
insert into Modulo values ('DES01', 246, 1, '2021-09-17', '2021-12-20', 'Laboratorio', 106);
insert into Modulo values ('DES01', 246, 2, '2021-09-22', '2021-12-09', 'Seminario applicativo', 106);
insert into Modulo values ('DES01', 246, 3, '2021-09-19', '2021-12-13', 'Discussione teorica', 106);
insert into Modulo values ('DES01', 246, 4, '2021-09-12', '2021-12-14', 'Progettazione software', 106);
insert into Modulo values ('DES01', 247, 1, '2022-09-22', '2022-12-19', 'Studio comparativo', 106);
insert into Modulo values ('DES01', 248, 1, '2023-09-12', '2023-12-08', 'Lezione avanzata', 106);
insert into Modulo values ('DES01', 248, 2, '2023-09-18', '2023-12-13', 'Laboratorio', 106);
insert into Modulo values ('DES01', 249, 1, '2024-09-16', '2024-12-20', 'Studio interdisciplinare', 106);
insert into Modulo values ('DES01', 250, 1, '2025-09-09', '2025-12-15', 'Applicazioni pratiche', 106);
insert into Modulo values ('DES01', 251, 1, '2026-09-08', '2026-12-17', 'Corso di aggiornamento', 106);
insert into Modulo values ('DES01', 251, 2, '2026-09-21', '2026-12-10', 'Studio di scenario', 106);
insert into Modulo values ('URB01', 252, 1, '2020-09-20', '2020-12-11', 'Lezione avanzata', 109);
insert into Modulo values ('URB01', 252, 2, '2020-09-11', '2020-12-11', 'Esercitazioni pratiche', 109);
insert into Modulo values ('URB01', 252, 3, '2020-09-11', '2020-12-15', 'Studio di scenario', 109);
insert into Modulo values ('URB01', 252, 4, '2020-09-12', '2020-12-20', 'Sessione pratica', 109);
insert into Modulo values ('URB01', 253, 1, '2021-09-12', '2021-12-21', 'Seminario specialistico', 109);
insert into Modulo values ('URB01', 253, 2, '2021-09-10', '2021-12-19', 'Corso intensivo', 109);
insert into Modulo values ('URB01', 253, 3, '2021-09-19', '2021-12-10', 'Presentazione di gruppo', 109);
insert into Modulo values ('URB01', 253, 4, '2021-09-16', '2021-12-13', 'Analisi dei casi studio', 109);
insert into Modulo values ('URB01', 254, 1, '2022-09-14', '2022-12-10', 'Seminario specialistico', 109);
insert into Modulo values ('URB01', 255, 1, '2023-09-21', '2023-12-12', 'Approfondimento scientifico', 109);
insert into Modulo values ('URB01', 256, 1, '2024-09-13', '2024-12-21', 'Lezione avanzata', 109);
insert into Modulo values ('URB01', 257, 1, '2025-09-21', '2025-12-16', 'Attività sperimentale', 109);
insert into Modulo values ('URB01', 257, 2, '2025-09-11', '2025-12-16', 'Corso di aggiornamento', 109);
insert into Modulo values ('URB01', 258, 1, '2026-09-19', '2026-12-15', 'Sessione pratica', 109);
insert into Modulo values ('URB01', 258, 2, '2026-09-21', '2026-12-21', 'Approfondimento scientifico', 109);
insert into Modulo values ('ARC_CES01', 259, 1, '2020-02-09', '2020-06-16', 'Modulo introduttivo', 111);
insert into Modulo values ('ARC_CES01', 259, 2, '2020-02-14', '2020-06-10', 'Esercitazioni pratiche', 111);
insert into Modulo values ('ARC_CES01', 260, 1, '2021-02-21', '2021-06-17', 'Laboratorio', 111);
insert into Modulo values ('ARC_CES01', 261, 1, '2022-02-22', '2022-06-14', 'Approccio metodologico', 111);
insert into Modulo values ('ARC_CES01', 262, 1, '2023-02-11', '2023-06-13', 'Seminario specialistico', 111);
insert into Modulo values ('ARC_CES01', 263, 1, '2024-02-15', '2024-06-17', 'Sessione pratica', 111);
insert into Modulo values ('ARC_CES01', 264, 1, '2025-02-22', '2025-06-14', 'Seminario specialistico', 252);
insert into Modulo values ('ARC_CES01', 265, 1, '2026-02-16', '2026-06-20', 'Esercizi di laboratorio', 252);
insert into Modulo values ('ARC_CES02', 266, 1, '2020-09-20', '2020-12-20', 'Laboratorio creativo', 244);
insert into Modulo values ('ARC_CES02', 266, 2, '2020-09-10', '2020-12-08', 'Seminario applicativo', 244);
insert into Modulo values ('ARC_CES02', 267, 1, '2021-09-16', '2021-12-18', 'Discussione teorica', 244);
insert into Modulo values ('ARC_CES02', 268, 1, '2022-09-13', '2022-12-16', 'Introduzione alle normative', 244);
insert into Modulo values ('ARC_CES02', 269, 1, '2023-09-16', '2023-12-18', 'Studio di scenario', 234);
insert into Modulo values ('ARC_CES02', 270, 1, '2024-09-10', '2024-12-22', 'Lezione avanzata', 113);
insert into Modulo values ('ARC_CES02', 270, 2, '2024-09-09', '2024-12-18', 'Revisione concetti base', 244);
insert into Modulo values ('ARC_CES02', 271, 1, '2025-09-18', '2025-12-22', 'Esercitazioni pratiche', 234);
insert into Modulo values ('ARC_CES02', 272, 1, '2026-09-18', '2026-12-11', 'Approccio metodologico', 113);
insert into Modulo values ('ARC_CES02', 272, 2, '2026-09-18', '2026-12-12', 'Lezione avanzata', 113);
insert into Modulo values ('ARC_CES02', 272, 3, '2026-09-08', '2026-12-10', 'Esercitazioni pratiche', 113);
insert into Modulo values ('ARC_CES02', 272, 4, '2026-09-17', '2026-12-18', 'Sessione pratica', 234);
insert into Modulo values ('DES_CES01', 273, 1, '2020-02-08', '2020-06-08', 'Analisi dei casi studio', 236);
insert into Modulo values ('DES_CES01', 274, 1, '2021-02-16', '2021-06-22', 'Studio interdisciplinare', 116);
insert into Modulo values ('DES_CES01', 274, 2, '2021-02-19', '2021-06-17', 'Analisi dei casi studio', 116);
insert into Modulo values ('DES_CES01', 275, 1, '2022-02-11', '2022-06-19', 'Esercitazioni pratiche', 116);
insert into Modulo values ('DES_CES01', 276, 1, '2023-02-19', '2023-06-10', 'Workshop interattivo', 236);
insert into Modulo values ('DES_CES01', 276, 2, '2023-02-09', '2023-06-11', 'Workshop interattivo', 116);
insert into Modulo values ('DES_CES01', 277, 1, '2024-02-10', '2024-06-10', 'Sessione pratica', 236);
insert into Modulo values ('DES_CES01', 278, 1, '2025-02-08', '2025-06-21', 'Modulo introduttivo', 116);
insert into Modulo values ('DES_CES01', 278, 2, '2025-02-09', '2025-06-22', 'Studio interdisciplinare', 236);
insert into Modulo values ('DES_CES01', 279, 1, '2026-02-18', '2026-06-19', 'Workshop interattivo', 236);
insert into Modulo values ('DES_CES01', 279, 2, '2026-02-16', '2026-06-13', 'Studio interdisciplinare', 116);
insert into Modulo values ('DES_CES01', 279, 3, '2026-02-09', '2026-06-12', 'Progetto guidato', 116);
insert into Modulo values ('DES_CES01', 279, 4, '2026-02-21', '2026-06-09', 'Seminario specialistico', 236);
insert into Modulo values ('URB_CES01', 280, 1, '2020-09-11', '2020-12-13', 'Introduzione alle normative', 256);
insert into Modulo values ('URB_CES01', 280, 2, '2020-09-18', '2020-12-22', 'Analisi statistica', 117);
insert into Modulo values ('URB_CES01', 280, 3, '2020-09-19', '2020-12-16', 'Seminario specialistico', 256);
insert into Modulo values ('URB_CES01', 280, 4, '2020-09-14', '2020-12-10', 'Seminario specialistico', 117);
insert into Modulo values ('URB_CES01', 281, 1, '2021-09-17', '2021-12-15', 'Approccio metodologico', 232);
insert into Modulo values ('URB_CES01', 282, 1, '2022-09-21', '2022-12-20', 'Attività sperimentale', 256);
insert into Modulo values ('URB_CES01', 283, 1, '2023-09-19', '2023-12-15', 'Progettazione software', 232);
insert into Modulo values ('URB_CES01', 284, 1, '2024-09-11', '2024-12-11', 'Studio comparativo', 117);
insert into Modulo values ('URB_CES01', 284, 2, '2024-09-11', '2024-12-21', 'Studio di scenario', 232);
insert into Modulo values ('URB_CES01', 285, 1, '2025-09-13', '2025-12-19', 'Corso intensivo', 117);
insert into Modulo values ('URB_CES01', 285, 2, '2025-09-17', '2025-12-08', 'Seminario applicativo', 256);
insert into Modulo values ('URB_CES01', 286, 1, '2026-09-15', '2026-12-20', 'Studio interdisciplinare', 117);
insert into Modulo values ('URB_CES01', 286, 2, '2026-09-20', '2026-12-22', 'Corso di aggiornamento', 256);
insert into Modulo values ('TEC_CES01', 287, 1, '2020-02-10', '2020-06-21', 'Progetto guidato', 118);
insert into Modulo values ('TEC_CES01', 288, 1, '2021-02-21', '2021-06-08', 'Sviluppo algoritmi', 118);
insert into Modulo values ('TEC_CES01', 289, 1, '2022-02-11', '2022-06-09', 'Presentazione di gruppo', 118);
insert into Modulo values ('TEC_CES01', 289, 2, '2022-02-21', '2022-06-09', 'Workshop interattivo', 118);
insert into Modulo values ('TEC_CES01', 290, 1, '2023-02-12', '2023-06-09', 'Discussione teorica', 118);
insert into Modulo values ('TEC_CES01', 290, 2, '2023-02-10', '2023-06-15', 'Corso intensivo', 118);
insert into Modulo values ('TEC_CES01', 291, 1, '2024-02-22', '2024-06-15', 'Corso di aggiornamento', 118);
insert into Modulo values ('TEC_CES01', 292, 1, '2025-02-13', '2025-06-19', 'Sessione pratica', 118);
insert into Modulo values ('TEC_CES01', 293, 1, '2026-02-08', '2026-06-19', 'Presentazione di gruppo', 118);
insert into Modulo values ('LET01', 294, 1, '2020-09-10', '2020-12-11', 'Seminario specialistico', 119);
insert into Modulo values ('LET01', 294, 2, '2020-09-11', '2020-12-08', 'Corso intensivo', 119);
insert into Modulo values ('LET01', 295, 1, '2021-09-22', '2021-12-17', 'Introduzione alle normative', 119);
insert into Modulo values ('LET01', 296, 1, '2022-09-21', '2022-12-16', 'Sviluppo algoritmi', 119);
insert into Modulo values ('LET01', 297, 1, '2023-09-15', '2023-12-21', 'Corso intensivo', 119);
insert into Modulo values ('LET01', 298, 1, '2024-09-09', '2024-12-11', 'Simulazioni e role-play', 119);
insert into Modulo values ('LET01', 299, 1, '2025-09-15', '2025-12-21', 'Laboratorio creativo', 119);
insert into Modulo values ('LET01', 299, 2, '2025-09-16', '2025-12-17', 'Esercizi di laboratorio', 119);
insert into Modulo values ('LET01', 300, 1, '2026-09-17', '2026-12-14', 'Applicazioni pratiche', 119);
insert into Modulo values ('STO01', 301, 1, '2020-09-21', '2020-12-08', 'Laboratorio creativo', 123);
insert into Modulo values ('STO01', 301, 2, '2020-09-15', '2020-12-14', 'Sessione pratica', 123);
insert into Modulo values ('STO01', 302, 1, '2021-09-20', '2021-12-17', 'Laboratorio', 123);
insert into Modulo values ('STO01', 302, 2, '2021-09-09', '2021-12-16', 'Analisi dei casi studio', 123);
insert into Modulo values ('STO01', 303, 1, '2022-09-13', '2022-12-15', 'Simulazioni e role-play', 123);
insert into Modulo values ('STO01', 304, 1, '2023-09-15', '2023-12-21', 'Laboratorio', 123);
insert into Modulo values ('STO01', 304, 2, '2023-09-16', '2023-12-12', 'Sviluppo algoritmi', 123);
insert into Modulo values ('STO01', 305, 1, '2024-09-14', '2024-12-19', 'Esercizi di laboratorio', 123);
insert into Modulo values ('STO01', 306, 1, '2025-09-10', '2025-12-19', 'Laboratorio creativo', 123);
insert into Modulo values ('STO01', 306, 2, '2025-09-10', '2025-12-18', 'Sessione pratica', 123);
insert into Modulo values ('STO01', 307, 1, '2026-09-08', '2026-12-12', 'Lezione avanzata', 123);
insert into Modulo values ('FIL01', 308, 1, '2020-02-16', '2020-06-10', 'Esercizi di laboratorio', 3);
insert into Modulo values ('FIL01', 309, 1, '2021-02-19', '2021-06-22', 'Seminario specialistico', 3);
insert into Modulo values ('FIL01', 309, 2, '2021-02-17', '2021-06-14', 'Seminario specialistico', 231);
insert into Modulo values ('FIL01', 310, 1, '2022-02-18', '2022-06-09', 'Modulo introduttivo', 3);
insert into Modulo values ('FIL01', 311, 1, '2023-02-19', '2023-06-16', 'Sessione pratica', 231);
insert into Modulo values ('FIL01', 312, 1, '2024-02-13', '2024-06-22', 'Attività sperimentale', 231);
insert into Modulo values ('FIL01', 312, 2, '2024-02-19', '2024-06-21', 'Approfondimento scientifico', 3);
insert into Modulo values ('FIL01', 313, 1, '2025-02-08', '2025-06-17', 'Modulo introduttivo', 3);
insert into Modulo values ('FIL01', 314, 1, '2026-02-11', '2026-06-16', 'Sessione pratica', 3);
insert into Modulo values ('FIL01', 314, 2, '2026-02-14', '2026-06-18', 'Sviluppo algoritmi', 231);
insert into Modulo values ('LIN01', 315, 1, '2020-09-14', '2020-12-17', 'Lezione avanzata', 5);
insert into Modulo values ('LIN01', 316, 1, '2021-09-22', '2021-12-12', 'Simulazioni e role-play', 5);
insert into Modulo values ('LIN01', 316, 2, '2021-09-16', '2021-12-16', 'Approfondimento scientifico', 5);
insert into Modulo values ('LIN01', 316, 3, '2021-09-20', '2021-12-22', 'Applicazioni pratiche', 5);
insert into Modulo values ('LIN01', 316, 4, '2021-09-13', '2021-12-08', 'Presentazione di gruppo', 5);
insert into Modulo values ('LIN01', 317, 1, '2022-09-20', '2022-12-18', 'Seminario applicativo', 5);
insert into Modulo values ('LIN01', 318, 1, '2023-09-08', '2023-12-22', 'Esercizi di laboratorio', 5);
insert into Modulo values ('LIN01', 319, 1, '2024-09-14', '2024-12-21', 'Seminario specialistico', 5);
insert into Modulo values ('LIN01', 320, 1, '2025-09-19', '2025-12-11', 'Discussione teorica', 5);
insert into Modulo values ('LIN01', 320, 2, '2025-09-22', '2025-12-13', 'Presentazione di gruppo', 5);
insert into Modulo values ('LIN01', 320, 3, '2025-09-18', '2025-12-16', 'Approccio metodologico', 5);
insert into Modulo values ('LIN01', 320, 4, '2025-09-11', '2025-12-09', 'Laboratorio', 5);
insert into Modulo values ('LIN01', 321, 1, '2026-09-22', '2026-12-17', 'Approccio metodologico', 5);
insert into Modulo values ('POL01', 322, 1, '2020-09-20', '2020-12-17', 'Modulo introduttivo', 8);
insert into Modulo values ('POL01', 323, 1, '2021-09-18', '2021-12-14', 'Applicazioni pratiche', 8);
insert into Modulo values ('POL01', 323, 2, '2021-09-10', '2021-12-13', 'Workshop interattivo', 8);
insert into Modulo values ('POL01', 323, 3, '2021-09-18', '2021-12-11', 'Applicazioni pratiche', 8);
insert into Modulo values ('POL01', 323, 4, '2021-09-22', '2021-12-17', 'Esercitazioni pratiche', 8);
insert into Modulo values ('POL01', 324, 1, '2022-09-20', '2022-12-18', 'Studio di scenario', 8);
insert into Modulo values ('POL01', 324, 2, '2022-09-09', '2022-12-15', 'Corso intensivo', 8);
insert into Modulo values ('POL01', 325, 1, '2023-09-12', '2023-12-15', 'Esercizi di laboratorio', 8);
insert into Modulo values ('POL01', 325, 2, '2023-09-14', '2023-12-10', 'Lezione avanzata', 8);
insert into Modulo values ('POL01', 326, 1, '2024-09-21', '2024-12-14', 'Lezione avanzata', 8);
insert into Modulo values ('POL01', 327, 1, '2025-09-09', '2025-12-08', 'Esercizi di laboratorio', 8);
insert into Modulo values ('POL01', 328, 1, '2026-09-17', '2026-12-20', 'Introduzione alle normative', 8);
insert into Modulo values ('POL01', 328, 2, '2026-09-22', '2026-12-14', 'Analisi statistica', 8);
insert into Modulo values ('POL01', 328, 3, '2026-09-15', '2026-12-15', 'Corso di aggiornamento', 8);
insert into Modulo values ('POL01', 328, 4, '2026-09-17', '2026-12-15', 'Corso di aggiornamento', 8);
insert into Modulo values ('SOC01', 329, 1, '2020-02-19', '2020-06-12', 'Discussione teorica', 9);
insert into Modulo values ('SOC01', 330, 1, '2021-02-11', '2021-06-22', 'Attività sperimentale', 9);
insert into Modulo values ('SOC01', 330, 2, '2021-02-18', '2021-06-14', 'Esercitazioni pratiche', 9);
insert into Modulo values ('SOC01', 331, 1, '2022-02-10', '2022-06-10', 'Analisi dei casi studio', 9);
insert into Modulo values ('SOC01', 332, 1, '2023-02-21', '2023-06-22', 'Seminario applicativo', 9);
insert into Modulo values ('SOC01', 332, 2, '2023-02-21', '2023-06-21', 'Corso di aggiornamento', 9);
insert into Modulo values ('SOC01', 333, 1, '2024-02-10', '2024-06-15', 'Applicazioni pratiche', 9);
insert into Modulo values ('SOC01', 334, 1, '2025-02-09', '2025-06-12', 'Seminario specialistico', 9);
insert into Modulo values ('SOC01', 335, 1, '2026-02-15', '2026-06-20', 'Modulo introduttivo', 9);
insert into Modulo values ('COM01', 336, 1, '2020-09-09', '2020-12-17', 'Attività sperimentale', 20);
insert into Modulo values ('COM01', 336, 2, '2020-09-11', '2020-12-18', 'Revisione concetti base', 20);
insert into Modulo values ('COM01', 337, 1, '2021-09-08', '2021-12-09', 'Modulo introduttivo', 20);
insert into Modulo values ('COM01', 338, 1, '2022-09-10', '2022-12-12', 'Analisi dei casi studio', 20);
insert into Modulo values ('COM01', 339, 1, '2023-09-16', '2023-12-14', 'Studio interdisciplinare', 20);
insert into Modulo values ('COM01', 340, 1, '2024-09-10', '2024-12-22', 'Studio comparativo', 20);
insert into Modulo values ('COM01', 341, 1, '2025-09-14', '2025-12-13', 'Approfondimento scientifico', 20);
insert into Modulo values ('COM01', 342, 1, '2026-09-22', '2026-12-10', 'Discussione teorica', 20);
insert into Modulo values ('COM01', 342, 2, '2026-09-12', '2026-12-15', 'Studio comparativo', 20);
insert into Modulo values ('PSI01', 343, 1, '2020-09-17', '2020-12-18', 'Studio di scenario', 241);
insert into Modulo values ('PSI01', 343, 2, '2020-09-20', '2020-12-08', 'Seminario applicativo', 241);
insert into Modulo values ('PSI01', 344, 1, '2021-09-14', '2021-12-08', 'Seminario applicativo', 241);
insert into Modulo values ('PSI01', 344, 2, '2021-09-22', '2021-12-16', 'Introduzione alle normative', 225);
insert into Modulo values ('PSI01', 344, 3, '2021-09-17', '2021-12-21', 'Sessione pratica', 241);
insert into Modulo values ('PSI01', 344, 4, '2021-09-15', '2021-12-19', 'Revisione concetti base', 241);
insert into Modulo values ('PSI01', 345, 1, '2022-09-20', '2022-12-20', 'Corso di aggiornamento', 22);
insert into Modulo values ('PSI01', 345, 2, '2022-09-22', '2022-12-20', 'Sessione pratica', 241);
insert into Modulo values ('PSI01', 346, 1, '2023-09-08', '2023-12-10', 'Studio comparativo', 22);
insert into Modulo values ('PSI01', 347, 1, '2024-09-21', '2024-12-09', 'Esercizi di laboratorio', 225);
insert into Modulo values ('PSI01', 348, 1, '2025-09-08', '2025-12-19', 'Sessione di problem solving', 241);
insert into Modulo values ('PSI01', 348, 2, '2025-09-12', '2025-12-09', 'Workshop interattivo', 241);
insert into Modulo values ('PSI01', 349, 1, '2026-09-21', '2026-12-14', 'Analisi dei casi studio', 241);
insert into Modulo values ('PSI01', 349, 2, '2026-09-11', '2026-12-12', 'Workshop interattivo', 241);
insert into Modulo values ('GIU01', 350, 1, '2020-09-20', '2020-12-14', 'Discussione teorica', 28);
insert into Modulo values ('GIU01', 351, 1, '2021-09-13', '2021-12-19', 'Analisi statistica', 28);
insert into Modulo values ('GIU01', 352, 1, '2022-09-14', '2022-12-11', 'Laboratorio', 28);
insert into Modulo values ('GIU01', 352, 2, '2022-09-09', '2022-12-20', 'Corso di aggiornamento', 28);
insert into Modulo values ('GIU01', 353, 1, '2023-09-09', '2023-12-12', 'Progetto guidato', 28);
insert into Modulo values ('GIU01', 354, 1, '2024-09-18', '2024-12-11', 'Progettazione software', 28);
insert into Modulo values ('GIU01', 355, 1, '2025-09-17', '2025-12-14', 'Analisi statistica', 28);
insert into Modulo values ('GIU01', 356, 1, '2026-09-11', '2026-12-17', 'Analisi statistica', 28);
insert into Modulo values ('GIU01', 356, 2, '2026-09-11', '2026-12-16', 'Sessione di problem solving', 28);
insert into Modulo values ('GIU01', 356, 3, '2026-09-14', '2026-12-17', 'Progettazione software', 28);
insert into Modulo values ('GIU01', 356, 4, '2026-09-17', '2026-12-09', 'Analisi statistica', 28);
insert into Modulo values ('DIR01', 357, 1, '2020-02-15', '2020-06-19', 'Esercizi di laboratorio', 35);
insert into Modulo values ('DIR01', 358, 1, '2021-02-17', '2021-06-13', 'Progetto guidato', 35);
insert into Modulo values ('DIR01', 359, 1, '2022-02-20', '2022-06-18', 'Approccio metodologico', 35);
insert into Modulo values ('DIR01', 359, 2, '2022-02-20', '2022-06-10', 'Esercizi di laboratorio', 35);
insert into Modulo values ('DIR01', 360, 1, '2023-02-15', '2023-06-17', 'Progettazione software', 35);
insert into Modulo values ('DIR01', 360, 2, '2023-02-09', '2023-06-13', 'Esercizi di laboratorio', 35);
insert into Modulo values ('DIR01', 361, 1, '2024-02-18', '2024-06-18', 'Sviluppo algoritmi', 35);
insert into Modulo values ('DIR01', 362, 1, '2025-02-16', '2025-06-17', 'Introduzione alle normative', 35);
insert into Modulo values ('DIR01', 362, 2, '2025-02-22', '2025-06-10', 'Approfondimento scientifico', 35);
insert into Modulo values ('DIR01', 363, 1, '2026-02-13', '2026-06-20', 'Sviluppo algoritmi', 35);
insert into Modulo values ('FAR01', 364, 1, '2020-09-17', '2020-12-15', 'Seminario applicativo', 257);
insert into Modulo values ('FAR01', 364, 2, '2020-09-21', '2020-12-18', 'Sessione di problem solving', 38);
insert into Modulo values ('FAR01', 365, 1, '2021-09-20', '2021-12-09', 'Introduzione alle normative', 257);
insert into Modulo values ('FAR01', 365, 2, '2021-09-22', '2021-12-14', 'Sessione di problem solving', 257);
insert into Modulo values ('FAR01', 366, 1, '2022-09-10', '2022-12-15', 'Seminario specialistico', 230);
insert into Modulo values ('FAR01', 366, 2, '2022-09-18', '2022-12-08', 'Approccio metodologico', 257);
insert into Modulo values ('FAR01', 367, 1, '2023-09-08', '2023-12-09', 'Analisi dei casi studio', 38);
insert into Modulo values ('FAR01', 368, 1, '2024-09-21', '2024-12-14', 'Seminario specialistico', 257);
insert into Modulo values ('FAR01', 368, 2, '2024-09-14', '2024-12-16', 'Introduzione alle normative', 257);
insert into Modulo values ('FAR01', 369, 1, '2025-09-11', '2025-12-17', 'Sessione pratica', 257);
insert into Modulo values ('FAR01', 370, 1, '2026-09-20', '2026-12-19', 'Corso intensivo', 38);
insert into Modulo values ('FAR01', 370, 2, '2026-09-11', '2026-12-20', 'Esercizi di laboratorio', 257);
insert into Modulo values ('BIOFAR01', 371, 1, '2020-02-10', '2020-06-21', 'Approfondimento scientifico', 41);
insert into Modulo values ('BIOFAR01', 371, 2, '2020-02-14', '2020-06-09', 'Studio comparativo', 41);
insert into Modulo values ('BIOFAR01', 372, 1, '2021-02-09', '2021-06-16', 'Approfondimento scientifico', 41);
insert into Modulo values ('BIOFAR01', 372, 2, '2021-02-22', '2021-06-11', 'Esercitazioni pratiche', 41);
insert into Modulo values ('BIOFAR01', 373, 1, '2022-02-18', '2022-06-14', 'Esercizi di laboratorio', 41);
insert into Modulo values ('BIOFAR01', 373, 2, '2022-02-13', '2022-06-12', 'Revisione concetti base', 41);
insert into Modulo values ('BIOFAR01', 374, 1, '2023-02-14', '2023-06-19', 'Studio di scenario', 41);
insert into Modulo values ('BIOFAR01', 374, 2, '2023-02-13', '2023-06-20', 'Discussione teorica', 41);
insert into Modulo values ('BIOFAR01', 375, 1, '2024-02-14', '2024-06-14', 'Sessione di problem solving', 41);
insert into Modulo values ('BIOFAR01', 375, 2, '2024-02-15', '2024-06-19', 'Laboratorio creativo', 41);
insert into Modulo values ('BIOFAR01', 376, 1, '2025-02-18', '2025-06-12', 'Simulazioni e role-play', 41);
insert into Modulo values ('BIOFAR01', 377, 1, '2026-02-18', '2026-06-13', 'Laboratorio creativo', 41);
insert into Modulo values ('MED01', 378, 1, '2020-09-13', '2020-12-17', 'Seminario applicativo', 44);
insert into Modulo values ('MED01', 379, 1, '2021-09-14', '2021-12-14', 'Laboratorio creativo', 44);
insert into Modulo values ('MED01', 379, 2, '2021-09-09', '2021-12-13', 'Revisione concetti base', 226);
insert into Modulo values ('MED01', 380, 1, '2022-09-22', '2022-12-11', 'Progetto guidato', 226);
insert into Modulo values ('MED01', 381, 1, '2023-09-13', '2023-12-15', 'Workshop interattivo', 44);
insert into Modulo values ('MED01', 382, 1, '2024-09-17', '2024-12-14', 'Analisi dei casi studio', 226);
insert into Modulo values ('MED01', 382, 2, '2024-09-08', '2024-12-21', 'Corso intensivo', 44);
insert into Modulo values ('MED01', 383, 1, '2025-09-08', '2025-12-15', 'Discussione teorica', 226);
insert into Modulo values ('MED01', 384, 1, '2026-09-09', '2026-12-15', 'Analisi statistica', 226);
insert into Modulo values ('MED01', 385, 1, '2020-02-22', '2020-06-19', 'Progetto guidato', 248);
insert into Modulo values ('MED01', 386, 1, '2021-02-18', '2021-06-14', 'Modulo introduttivo', 46);
insert into Modulo values ('MED01', 387, 1, '2022-02-10', '2022-06-20', 'Laboratorio', 248);
insert into Modulo values ('MED01', 387, 2, '2022-02-12', '2022-06-16', 'Approfondimento scientifico', 248);
insert into Modulo values ('MED01', 388, 1, '2023-02-15', '2023-06-11', 'Corso intensivo', 248);
insert into Modulo values ('MED01', 389, 1, '2024-02-19', '2024-06-20', 'Applicazioni pratiche', 248);
insert into Modulo values ('MED01', 390, 1, '2025-02-13', '2025-06-21', 'Approfondimento scientifico', 46);
insert into Modulo values ('MED01', 390, 2, '2025-02-11', '2025-06-12', 'Lezione avanzata', 248);
insert into Modulo values ('MED01', 391, 1, '2026-02-17', '2026-06-21', 'Corso di aggiornamento', 46);
insert into Modulo values ('ANA01', 392, 1, '2020-09-15', '2020-12-17', 'Lezione avanzata', 58);
insert into Modulo values ('ANA01', 393, 1, '2021-09-18', '2021-12-17', 'Attività sperimentale', 58);
insert into Modulo values ('ANA01', 394, 1, '2022-09-08', '2022-12-14', 'Corso di aggiornamento', 58);
insert into Modulo values ('ANA01', 395, 1, '2023-09-22', '2023-12-15', 'Laboratorio', 58);
insert into Modulo values ('ANA01', 396, 1, '2024-09-22', '2024-12-18', 'Revisione concetti base', 58);
insert into Modulo values ('ANA01', 396, 2, '2024-09-10', '2024-12-16', 'Seminario applicativo', 58);
insert into Modulo values ('ANA01', 397, 1, '2025-09-12', '2025-12-14', 'Lezione avanzata', 58);
insert into Modulo values ('ANA01', 397, 2, '2025-09-22', '2025-12-19', 'Approfondimento scientifico', 58);
insert into Modulo values ('ANA01', 397, 3, '2025-09-15', '2025-12-16', 'Progettazione software', 58);
insert into Modulo values ('ANA01', 397, 4, '2025-09-18', '2025-12-15', 'Esercizi di laboratorio', 58);
insert into Modulo values ('ANA01', 398, 1, '2026-09-21', '2026-12-16', 'Presentazione di gruppo', 58);
insert into Modulo values ('STA01', 399, 1, '2020-02-20', '2020-06-11', 'Corso di aggiornamento', 60);
insert into Modulo values ('STA01', 399, 2, '2020-02-10', '2020-06-14', 'Sessione pratica', 60);
insert into Modulo values ('STA01', 400, 1, '2021-02-17', '2021-06-22', 'Laboratorio', 60);
insert into Modulo values ('STA01', 400, 2, '2021-02-09', '2021-06-08', 'Corso di aggiornamento', 60);
insert into Modulo values ('STA01', 400, 3, '2021-02-12', '2021-06-14', 'Corso intensivo', 60);
insert into Modulo values ('STA01', 400, 4, '2021-02-21', '2021-06-16', 'Laboratorio', 60);
insert into Modulo values ('STA01', 401, 1, '2022-02-10', '2022-06-22', 'Modulo introduttivo', 60);
insert into Modulo values ('STA01', 402, 1, '2023-02-17', '2023-06-15', 'Progetto guidato', 60);
insert into Modulo values ('STA01', 402, 2, '2023-02-13', '2023-06-08', 'Applicazioni pratiche', 60);
insert into Modulo values ('STA01', 403, 1, '2024-02-13', '2024-06-20', 'Seminario applicativo', 60);
insert into Modulo values ('STA01', 403, 2, '2024-02-22', '2024-06-12', 'Sessione pratica', 60);
insert into Modulo values ('STA01', 404, 1, '2025-02-12', '2025-06-17', 'Simulazioni e role-play', 60);
insert into Modulo values ('STA01', 405, 1, '2026-02-15', '2026-06-16', 'Attività sperimentale', 60);
insert into Modulo values ('STA01', 406, 1, '2020-09-14', '2020-12-15', 'Laboratorio creativo', 62);
insert into Modulo values ('STA01', 407, 1, '2021-09-12', '2021-12-11', 'Workshop interattivo', 240);
insert into Modulo values ('STA01', 408, 1, '2022-09-20', '2022-12-17', 'Sessione pratica', 240);
insert into Modulo values ('STA01', 408, 2, '2022-09-21', '2022-12-21', 'Progetto guidato', 240);
insert into Modulo values ('STA01', 409, 1, '2023-09-16', '2023-12-18', 'Analisi dei casi studio', 240);
insert into Modulo values ('STA01', 409, 2, '2023-09-19', '2023-12-12', 'Modulo introduttivo', 240);
insert into Modulo values ('STA01', 410, 1, '2024-09-10', '2024-12-17', 'Studio comparativo', 62);
insert into Modulo values ('STA01', 411, 1, '2025-09-16', '2025-12-08', 'Analisi dei casi studio', 240);
insert into Modulo values ('STA01', 412, 1, '2026-09-17', '2026-12-11', 'Introduzione alle normative', 62);
insert into Modulo values ('STA01', 412, 2, '2026-09-11', '2026-12-09', 'Laboratorio', 62);
insert into Modulo values ('MAT01', 413, 1, '2020-09-16', '2020-12-09', 'Esercizi di laboratorio', 250);
insert into Modulo values ('MAT01', 414, 1, '2021-09-21', '2021-12-20', 'Modulo introduttivo', 65);
insert into Modulo values ('MAT01', 414, 2, '2021-09-10', '2021-12-08', 'Approfondimento scientifico', 250);
insert into Modulo values ('MAT01', 415, 1, '2022-09-20', '2022-12-20', 'Sessione di problem solving', 65);
insert into Modulo values ('MAT01', 415, 2, '2022-09-20', '2022-12-18', 'Esercitazioni pratiche', 250);
insert into Modulo values ('MAT01', 416, 1, '2023-09-17', '2023-12-08', 'Workshop interattivo', 65);
insert into Modulo values ('MAT01', 417, 1, '2024-09-19', '2024-12-20', 'Modulo introduttivo', 250);
insert into Modulo values ('MAT01', 417, 2, '2024-09-12', '2024-12-12', 'Sessione pratica', 250);
insert into Modulo values ('MAT01', 418, 1, '2025-09-16', '2025-12-09', 'Sviluppo algoritmi', 250);
insert into Modulo values ('MAT01', 418, 2, '2025-09-18', '2025-12-21', 'Modulo introduttivo', 250);
insert into Modulo values ('MAT01', 418, 3, '2025-09-19', '2025-12-10', 'Presentazione di gruppo', 250);
insert into Modulo values ('MAT01', 418, 4, '2025-09-20', '2025-12-16', 'Attività sperimentale', 250);
insert into Modulo values ('MAT01', 419, 1, '2026-09-15', '2026-12-22', 'Approfondimento scientifico', 65);
insert into Modulo values ('MAT01', 419, 2, '2026-09-08', '2026-12-08', 'Applicazioni pratiche', 65);
insert into Modulo values ('MAT01', 419, 3, '2026-09-09', '2026-12-18', 'Approfondimento scientifico', 250);
insert into Modulo values ('MAT01', 419, 4, '2026-09-19', '2026-12-22', 'Progettazione software', 65);
insert into Modulo values ('FIS01', 420, 1, '2020-02-18', '2020-06-21', 'Attività sperimentale', 67);
insert into Modulo values ('FIS01', 420, 2, '2020-02-22', '2020-06-11', 'Applicazioni pratiche', 67);
insert into Modulo values ('FIS01', 421, 1, '2021-02-19', '2021-06-12', 'Sessione di problem solving', 67);
insert into Modulo values ('FIS01', 422, 1, '2022-02-22', '2022-06-13', 'Laboratorio', 67);
insert into Modulo values ('FIS01', 422, 2, '2022-02-08', '2022-06-16', 'Seminario applicativo', 67);
insert into Modulo values ('FIS01', 422, 3, '2022-02-12', '2022-06-19', 'Revisione concetti base', 67);
insert into Modulo values ('FIS01', 422, 4, '2022-02-16', '2022-06-19', 'Seminario specialistico', 67);
insert into Modulo values ('FIS01', 423, 1, '2023-02-21', '2023-06-18', 'Attività sperimentale', 67);
insert into Modulo values ('FIS01', 424, 1, '2024-02-12', '2024-06-14', 'Seminario specialistico', 67);
insert into Modulo values ('FIS01', 424, 2, '2024-02-17', '2024-06-15', 'Approccio metodologico', 67);
insert into Modulo values ('FIS01', 425, 1, '2025-02-08', '2025-06-17', 'Approfondimento scientifico', 67);
insert into Modulo values ('FIS01', 426, 1, '2026-02-21', '2026-06-22', 'Sessione di problem solving', 67);
insert into Modulo values ('FIS01', 426, 2, '2026-02-20', '2026-06-20', 'Presentazione di gruppo', 67);
insert into Modulo values ('CHI01', 427, 1, '2020-09-15', '2020-12-20', 'Presentazione di gruppo', 73);
insert into Modulo values ('CHI01', 428, 1, '2021-09-13', '2021-12-08', 'Presentazione di gruppo', 73);
insert into Modulo values ('CHI01', 428, 2, '2021-09-21', '2021-12-08', 'Studio di scenario', 73);
insert into Modulo values ('CHI01', 428, 3, '2021-09-17', '2021-12-19', 'Simulazioni e role-play', 73);
insert into Modulo values ('CHI01', 428, 4, '2021-09-14', '2021-12-21', 'Esercizi di laboratorio', 73);
insert into Modulo values ('CHI01', 429, 1, '2022-09-14', '2022-12-20', 'Lezione avanzata', 73);
insert into Modulo values ('CHI01', 430, 1, '2023-09-16', '2023-12-11', 'Corso di aggiornamento', 73);
insert into Modulo values ('CHI01', 431, 1, '2024-09-22', '2024-12-15', 'Attività sperimentale', 73);
insert into Modulo values ('CHI01', 431, 2, '2024-09-20', '2024-12-13', 'Sessione pratica', 73);
insert into Modulo values ('CHI01', 432, 1, '2025-09-08', '2025-12-12', 'Approfondimento scientifico', 73);
insert into Modulo values ('CHI01', 432, 2, '2025-09-22', '2025-12-20', 'Studio comparativo', 73);
insert into Modulo values ('CHI01', 432, 3, '2025-09-18', '2025-12-21', 'Discussione teorica', 73);
insert into Modulo values ('CHI01', 432, 4, '2025-09-18', '2025-12-15', 'Modulo introduttivo', 73);
insert into Modulo values ('CHI01', 433, 1, '2026-09-19', '2026-12-10', 'Laboratorio creativo', 73);
insert into Modulo values ('CHI01', 433, 2, '2026-09-18', '2026-12-18', 'Seminario specialistico', 73);
insert into Modulo values ('BIO01', 434, 1, '2020-02-09', '2020-06-20', 'Attività sperimentale', 78);
insert into Modulo values ('BIO01', 435, 1, '2021-02-08', '2021-06-17', 'Seminario applicativo', 229);
insert into Modulo values ('BIO01', 435, 2, '2021-02-20', '2021-06-09', 'Lezione avanzata', 229);
insert into Modulo values ('BIO01', 436, 1, '2022-02-16', '2022-06-17', 'Progettazione software', 78);
insert into Modulo values ('BIO01', 437, 1, '2023-02-13', '2023-06-19', 'Approccio metodologico', 78);
insert into Modulo values ('BIO01', 437, 2, '2023-02-08', '2023-06-11', 'Discussione teorica', 229);
insert into Modulo values ('BIO01', 437, 3, '2023-02-21', '2023-06-13', 'Introduzione alle normative', 229);
insert into Modulo values ('BIO01', 437, 4, '2023-02-21', '2023-06-13', 'Studio interdisciplinare', 78);
insert into Modulo values ('BIO01', 438, 1, '2024-02-22', '2024-06-20', 'Attività sperimentale', 229);
insert into Modulo values ('BIO01', 439, 1, '2025-02-11', '2025-06-11', 'Sessione pratica', 229);
insert into Modulo values ('BIO01', 440, 1, '2026-02-11', '2026-06-11', 'Approccio metodologico', 78);
insert into Modulo values ('BIO01', 440, 2, '2026-02-09', '2026-06-15', 'Attività sperimentale', 78);
insert into Modulo values ('POL01', 441, 1, '2020-09-17', '2020-12-17', 'Studio interdisciplinare', 80);
insert into Modulo values ('POL01', 442, 1, '2021-09-14', '2021-12-09', 'Sessione di problem solving', 80);
insert into Modulo values ('POL01', 442, 2, '2021-09-16', '2021-12-15', 'Laboratorio creativo', 80);
insert into Modulo values ('POL01', 442, 3, '2021-09-21', '2021-12-20', 'Esercizi di laboratorio', 80);
insert into Modulo values ('POL01', 442, 4, '2021-09-20', '2021-12-10', 'Seminario specialistico', 80);
insert into Modulo values ('POL01', 443, 1, '2022-09-12', '2022-12-13', 'Lezione avanzata', 80);
insert into Modulo values ('POL01', 443, 2, '2022-09-14', '2022-12-11', 'Modulo introduttivo', 80);
insert into Modulo values ('POL01', 444, 1, '2023-09-18', '2023-12-09', 'Analisi dei casi studio', 80);
insert into Modulo values ('POL01', 444, 2, '2023-09-16', '2023-12-14', 'Sviluppo algoritmi', 80);
insert into Modulo values ('POL01', 445, 1, '2024-09-14', '2024-12-20', 'Corso di aggiornamento', 80);
insert into Modulo values ('POL01', 446, 1, '2025-09-18', '2025-12-14', 'Introduzione alle normative', 80);
insert into Modulo values ('POL01', 447, 1, '2026-09-12', '2026-12-12', 'Corso intensivo', 80);
insert into Modulo values ('POL01', 447, 2, '2026-09-16', '2026-12-14', 'Applicazioni pratiche', 80);
insert into Modulo values ('SOC01', 448, 1, '2020-02-21', '2020-06-11', 'Sessione pratica', 251);
insert into Modulo values ('SOC01', 448, 2, '2020-02-12', '2020-06-10', 'Simulazioni e role-play', 251);
insert into Modulo values ('SOC01', 449, 1, '2021-02-15', '2021-06-11', 'Workshop interattivo', 81);
insert into Modulo values ('SOC01', 450, 1, '2022-02-21', '2022-06-09', 'Sviluppo algoritmi', 251);
insert into Modulo values ('SOC01', 451, 1, '2023-02-10', '2023-06-09', 'Progetto guidato', 81);
insert into Modulo values ('SOC01', 451, 2, '2023-02-10', '2023-06-15', 'Attività sperimentale', 81);
insert into Modulo values ('SOC01', 452, 1, '2024-02-13', '2024-06-14', 'Simulazioni e role-play', 81);
insert into Modulo values ('SOC01', 452, 2, '2024-02-10', '2024-06-15', 'Analisi dei casi studio', 81);
insert into Modulo values ('SOC01', 452, 3, '2024-02-11', '2024-06-21', 'Analisi dei casi studio', 251);
insert into Modulo values ('SOC01', 452, 4, '2024-02-18', '2024-06-15', 'Studio di scenario', 251);
insert into Modulo values ('SOC01', 453, 1, '2025-02-13', '2025-06-20', 'Laboratorio creativo', 81);
insert into Modulo values ('SOC01', 453, 2, '2025-02-17', '2025-06-19', 'Seminario applicativo', 251);
insert into Modulo values ('SOC01', 454, 1, '2026-02-12', '2026-06-09', 'Studio interdisciplinare', 81);
insert into Modulo values ('SOC01', 454, 2, '2026-02-22', '2026-06-08', 'Esercitazioni pratiche', 251);
insert into Modulo values ('PSI01', 455, 1, '2020-09-11', '2020-12-19', 'Laboratorio creativo', 249);
insert into Modulo values ('PSI01', 455, 2, '2020-09-08', '2020-12-12', 'Sessione di problem solving', 82);
insert into Modulo values ('PSI01', 456, 1, '2021-09-20', '2021-12-18', 'Seminario specialistico', 249);
insert into Modulo values ('PSI01', 456, 2, '2021-09-20', '2021-12-22', 'Discussione teorica', 249);
insert into Modulo values ('PSI01', 456, 3, '2021-09-10', '2021-12-09', 'Approccio metodologico', 249);
insert into Modulo values ('PSI01', 456, 4, '2021-09-12', '2021-12-11', 'Simulazioni e role-play', 249);
insert into Modulo values ('PSI01', 457, 1, '2022-09-16', '2022-12-22', 'Approccio metodologico', 82);
insert into Modulo values ('PSI01', 457, 2, '2022-09-17', '2022-12-10', 'Seminario applicativo', 249);
insert into Modulo values ('PSI01', 458, 1, '2023-09-08', '2023-12-13', 'Esercitazioni pratiche', 249);
insert into Modulo values ('PSI01', 459, 1, '2024-09-18', '2024-12-17', 'Sessione pratica', 249);
insert into Modulo values ('PSI01', 459, 2, '2024-09-16', '2024-12-11', 'Seminario specialistico', 82);
insert into Modulo values ('PSI01', 460, 1, '2025-09-11', '2025-12-13', 'Revisione concetti base', 82);
insert into Modulo values ('PSI01', 460, 2, '2025-09-10', '2025-12-14', 'Esercitazioni pratiche', 82);
insert into Modulo values ('PSI01', 460, 3, '2025-09-19', '2025-12-08', 'Discussione teorica', 249);
insert into Modulo values ('PSI01', 460, 4, '2025-09-21', '2025-12-08', 'Studio interdisciplinare', 249);
insert into Modulo values ('PSI01', 461, 1, '2026-09-08', '2026-12-20', 'Approfondimento scientifico', 82);
insert into Modulo values ('PSI01', 461, 2, '2026-09-15', '2026-12-10', 'Laboratorio creativo', 82);

# ---------------------------------------------------------------------- #
# Add info into "Orario"                                                   #
# ---------------------------------------------------------------------- #

truncate table Orario;

insert into Orario values (0, 'ECO01', 0, 1, '2020-09-11 09:00:00', 0, 508, '2020-09-11 11:00:00');
insert into Orario values (1, 'ECO01', 0, 1, '2020-09-15 15:00:00', 0, 508, '2020-09-15 17:00:00');
insert into Orario values (2, 'ECO01', 1, 1, '2021-09-16 09:00:00', 0, 508, '2021-09-16 11:00:00');
insert into Orario values (3, 'ECO01', 1, 1, '2021-09-17 13:00:00', 0, 508, '2021-09-17 15:00:00');
insert into Orario values (4, 'ECO01', 2, 1, '2022-09-16 09:00:00', 0, 508, '2022-09-16 11:00:00');
insert into Orario values (5, 'ECO01', 2, 1, '2022-09-13 11:00:00', 0, 508, '2022-09-13 12:00:00');
insert into Orario values (6, 'ECO01', 2, 1, '2022-09-15 13:00:00', 0, 508, '2022-09-15 15:00:00');
insert into Orario values (7, 'ECO01', 2, 2, '2022-09-17 09:00:00', 0, 508, '2022-09-17 11:00:00');
insert into Orario values (8, 'ECO01', 2, 2, '2022-09-15 15:00:00', 0, 508, '2022-09-15 17:00:00');
insert into Orario values (9, 'ECO01', 2, 3, '2022-09-21 13:00:00', 0, 508, '2022-09-21 15:00:00');
insert into Orario values (10, 'ECO01', 2, 3, '2022-09-22 09:00:00', 0, 508, '2022-09-22 11:00:00');
insert into Orario values (11, 'ECO01', 2, 3, '2022-09-23 15:00:00', 0, 508, '2022-09-23 17:00:00');
insert into Orario values (12, 'ECO01', 2, 4, '2022-09-18 09:00:00', 0, 508, '2022-09-18 11:00:00');
insert into Orario values (13, 'ECO01', 2, 4, '2022-09-14 11:00:00', 0, 508, '2022-09-14 12:00:00');
insert into Orario values (14, 'ECO01', 3, 1, '2023-09-12 09:00:00', 0, 508, '2023-09-12 11:00:00');
insert into Orario values (15, 'ECO01', 3, 1, '2023-09-14 15:00:00', 0, 508, '2023-09-14 17:00:00');
insert into Orario values (16, 'ECO01', 4, 1, '2024-09-13 13:00:00', 0, 508, '2024-09-13 15:00:00');
insert into Orario values (17, 'ECO01', 4, 1, '2024-09-11 09:00:00', 0, 508, '2024-09-11 11:00:00');
insert into Orario values (18, 'ECO01', 5, 1, '2025-09-22 15:00:00', 0, 508, '2025-09-22 17:00:00');
insert into Orario values (19, 'ECO01', 5, 1, '2025-09-24 09:00:00', 0, 508, '2025-09-24 11:00:00');
insert into Orario values (20, 'ECO01', 5, 1, '2025-09-25 11:00:00', 0, 508, '2025-09-25 12:00:00');
insert into Orario values (21, 'ECO01', 6, 1, '2026-09-18 13:00:00', 0, 508, '2026-09-18 15:00:00');
insert into Orario values (22, 'ECO01', 6, 1, '2026-09-15 09:00:00', 0, 508, '2026-09-15 11:00:00');
insert into Orario values (23, 'ECO01', 6, 1, '2026-09-17 11:00:00', 0, 508, '2026-09-17 12:00:00');
insert into Orario values (24, 'ECO01', 6, 2, '2026-09-19 13:00:00', 0, 508, '2026-09-19 15:00:00');
insert into Orario values (25, 'ECO01', 6, 2, '2026-09-16 15:00:00', 0, 508, '2026-09-16 17:00:00');
insert into Orario values (26, 'ECO01', 7, 1, '2020-09-19 13:00:00', 0, 508, '2020-09-19 15:00:00');
insert into Orario values (27, 'ECO01', 7, 1, '2020-09-22 13:00:00', 0, 508, '2020-09-22 15:00:00');
insert into Orario values (28, 'ECO01', 7, 2, '2020-09-24 15:00:00', 0, 508, '2020-09-24 17:00:00');
insert into Orario values (29, 'ECO01', 7, 2, '2020-09-22 09:00:00', 0, 508, '2020-09-22 11:00:00');
insert into Orario values (30, 'ECO01', 8, 1, '2021-09-24 09:00:00', 0, 508, '2021-09-24 11:00:00');
insert into Orario values (31, 'ECO01', 8, 1, '2021-09-21 13:00:00', 0, 508, '2021-09-21 15:00:00');
insert into Orario values (32, 'ECO01', 9, 1, '2022-09-25 15:00:00', 0, 508, '2022-09-25 17:00:00');
insert into Orario values (33, 'ECO01', 9, 1, '2022-09-26 15:00:00', 0, 508, '2022-09-26 17:00:00');
insert into Orario values (34, 'ECO01', 10, 1, '2023-09-21 11:00:00', 0, 508, '2023-09-21 12:00:00');
insert into Orario values (35, 'ECO01', 10, 1, '2023-09-19 13:00:00', 0, 508, '2023-09-19 15:00:00');
insert into Orario values (36, 'ECO01', 10, 2, '2023-09-19 11:00:00', 0, 508, '2023-09-19 12:00:00');
insert into Orario values (37, 'ECO01', 11, 1, '2024-09-16 09:00:00', 0, 508, '2024-09-16 11:00:00');
insert into Orario values (38, 'ECO01', 11, 1, '2024-09-11 13:00:00', 0, 508, '2024-09-11 15:00:00');
insert into Orario values (39, 'ECO01', 11, 1, '2024-09-14 13:00:00', 0, 508, '2024-09-14 15:00:00');
insert into Orario values (40, 'ECO01', 12, 1, '2025-09-12 13:00:00', 0, 508, '2025-09-12 15:00:00');
insert into Orario values (41, 'ECO01', 12, 1, '2025-09-14 15:00:00', 0, 508, '2025-09-14 17:00:00');
insert into Orario values (42, 'ECO01', 12, 1, '2025-09-13 13:00:00', 0, 508, '2025-09-13 15:00:00');
insert into Orario values (43, 'ECO01', 13, 1, '2026-09-11 11:00:00', 0, 508, '2026-09-11 12:00:00');
insert into Orario values (44, 'ECO01', 13, 1, '2026-09-09 11:00:00', 0, 508, '2026-09-09 12:00:00');
insert into Orario values (45, 'ECO01', 13, 1, '2026-09-12 09:00:00', 0, 508, '2026-09-12 11:00:00');
insert into Orario values (46, 'ECO01', 14, 1, '2020-09-24 09:00:00', 0, 508, '2020-09-24 11:00:00');
insert into Orario values (47, 'ECO01', 14, 1, '2020-09-27 11:00:00', 0, 508, '2020-09-27 12:00:00');
insert into Orario values (48, 'ECO01', 15, 1, '2021-09-27 13:00:00', 0, 508, '2021-09-27 15:00:00');
insert into Orario values (49, 'ECO01', 15, 1, '2021-09-25 13:00:00', 0, 508, '2021-09-25 15:00:00');
insert into Orario values (50, 'ECO01', 16, 1, '2022-09-13 15:00:00', 0, 508, '2022-09-13 17:00:00');
insert into Orario values (51, 'ECO01', 16, 1, '2022-09-14 15:00:00', 0, 508, '2022-09-14 17:00:00');
insert into Orario values (52, 'ECO01', 16, 1, '2022-09-15 11:00:00', 0, 508, '2022-09-15 12:00:00');
insert into Orario values (53, 'ECO01', 16, 2, '2022-09-25 11:00:00', 0, 508, '2022-09-25 12:00:00');
insert into Orario values (54, 'ECO01', 16, 2, '2022-09-23 13:00:00', 0, 508, '2022-09-23 15:00:00');
insert into Orario values (55, 'ECO01', 16, 2, '2022-09-22 15:00:00', 0, 508, '2022-09-22 17:00:00');
insert into Orario values (56, 'ECO01', 17, 1, '2023-09-16 11:00:00', 0, 508, '2023-09-16 12:00:00');
insert into Orario values (57, 'ECO01', 17, 1, '2023-09-20 09:00:00', 0, 508, '2023-09-20 11:00:00');
insert into Orario values (58, 'ECO01', 17, 1, '2023-09-18 09:00:00', 0, 508, '2023-09-18 11:00:00');
insert into Orario values (59, 'ECO01', 17, 2, '2023-09-11 09:00:00', 0, 508, '2023-09-11 11:00:00');
insert into Orario values (60, 'ECO01', 17, 2, '2023-09-10 15:00:00', 0, 508, '2023-09-10 17:00:00');
insert into Orario values (61, 'ECO01', 18, 1, '2024-09-25 11:00:00', 0, 508, '2024-09-25 12:00:00');
insert into Orario values (62, 'ECO01', 18, 1, '2024-09-24 11:00:00', 0, 508, '2024-09-24 12:00:00');
insert into Orario values (63, 'ECO01', 18, 1, '2024-09-23 09:00:00', 0, 508, '2024-09-23 11:00:00');
insert into Orario values (64, 'ECO01', 19, 1, '2025-09-11 15:00:00', 0, 508, '2025-09-11 17:00:00');
insert into Orario values (65, 'ECO01', 19, 1, '2025-09-12 11:00:00', 0, 508, '2025-09-12 12:00:00');
insert into Orario values (66, 'ECO01', 19, 1, '2025-09-10 09:00:00', 0, 508, '2025-09-10 11:00:00');
insert into Orario values (67, 'ECO01', 20, 1, '2026-09-21 11:00:00', 0, 508, '2026-09-21 12:00:00');
insert into Orario values (68, 'ECO01', 20, 1, '2026-09-24 15:00:00', 0, 508, '2026-09-24 17:00:00');
insert into Orario values (69, 'ECO01', 20, 1, '2026-09-23 15:00:00', 0, 508, '2026-09-23 17:00:00');
insert into Orario values (70, 'ECO01', 20, 2, '2026-09-16 09:00:00', 0, 508, '2026-09-16 11:00:00');
insert into Orario values (71, 'ECO01', 20, 2, '2026-09-18 11:00:00', 0, 508, '2026-09-18 12:00:00');
insert into Orario values (72, 'TUR01', 21, 1, '2020-09-16 15:00:00', 0, 508, '2020-09-16 17:00:00');
insert into Orario values (73, 'TUR01', 21, 1, '2020-09-20 09:00:00', 0, 508, '2020-09-20 11:00:00');
insert into Orario values (74, 'TUR01', 21, 1, '2020-09-15 11:00:00', 0, 508, '2020-09-15 12:00:00');
insert into Orario values (75, 'TUR01', 22, 1, '2021-09-18 13:00:00', 0, 508, '2021-09-18 15:00:00');
insert into Orario values (76, 'TUR01', 22, 1, '2021-09-17 09:00:00', 0, 508, '2021-09-17 11:00:00');
insert into Orario values (77, 'TUR01', 22, 2, '2021-09-09 13:00:00', 0, 508, '2021-09-09 15:00:00');
insert into Orario values (78, 'TUR01', 22, 2, '2021-09-12 15:00:00', 0, 508, '2021-09-12 17:00:00');
insert into Orario values (79, 'TUR01', 22, 2, '2021-09-10 11:00:00', 0, 508, '2021-09-10 12:00:00');
insert into Orario values (80, 'TUR01', 23, 1, '2022-09-13 09:00:00', 0, 508, '2022-09-13 11:00:00');
insert into Orario values (81, 'TUR01', 23, 1, '2022-09-16 15:00:00', 0, 508, '2022-09-16 17:00:00');
insert into Orario values (82, 'TUR01', 23, 1, '2022-09-11 15:00:00', 0, 508, '2022-09-11 17:00:00');
insert into Orario values (83, 'TUR01', 23, 2, '2022-09-19 13:00:00', 0, 508, '2022-09-19 15:00:00');
insert into Orario values (84, 'TUR01', 23, 2, '2022-09-18 11:00:00', 0, 508, '2022-09-18 12:00:00');
insert into Orario values (85, 'TUR01', 24, 1, '2023-09-22 11:00:00', 0, 508, '2023-09-22 12:00:00');
insert into Orario values (86, 'TUR01', 24, 2, '2023-09-13 13:00:00', 0, 508, '2023-09-13 15:00:00');
insert into Orario values (87, 'TUR01', 25, 1, '2024-09-19 15:00:00', 0, 508, '2024-09-19 17:00:00');
insert into Orario values (88, 'TUR01', 25, 1, '2024-09-16 13:00:00', 0, 508, '2024-09-16 15:00:00');
insert into Orario values (89, 'TUR01', 25, 2, '2024-09-24 13:00:00', 0, 508, '2024-09-24 15:00:00');
insert into Orario values (90, 'TUR01', 25, 2, '2024-09-22 09:00:00', 0, 508, '2024-09-22 11:00:00');
insert into Orario values (91, 'TUR01', 26, 1, '2025-09-21 11:00:00', 0, 508, '2025-09-21 12:00:00');
insert into Orario values (92, 'TUR01', 26, 1, '2025-09-22 13:00:00', 0, 508, '2025-09-22 15:00:00');
insert into Orario values (93, 'TUR01', 26, 2, '2025-09-12 09:00:00', 0, 508, '2025-09-12 11:00:00');
insert into Orario values (94, 'TUR01', 26, 2, '2025-09-14 13:00:00', 0, 508, '2025-09-14 15:00:00');
insert into Orario values (95, 'TUR01', 27, 1, '2026-09-23 11:00:00', 0, 508, '2026-09-23 12:00:00');
insert into Orario values (96, 'TUR01', 27, 1, '2026-09-25 15:00:00', 0, 508, '2026-09-25 17:00:00');
insert into Orario values (97, 'TUR01', 28, 1, '2020-09-21 09:00:00', 0, 508, '2020-09-21 11:00:00');
insert into Orario values (98, 'TUR01', 28, 1, '2020-09-18 09:00:00', 0, 508, '2020-09-18 11:00:00');
insert into Orario values (99, 'TUR01', 28, 1, '2020-09-23 15:00:00', 0, 508, '2020-09-23 17:00:00');
insert into Orario values (100, 'TUR01', 29, 1, '2021-09-11 11:00:00', 0, 508, '2021-09-11 12:00:00');
insert into Orario values (101, 'TUR01', 29, 1, '2021-09-08 13:00:00', 0, 508, '2021-09-08 15:00:00');
insert into Orario values (102, 'TUR01', 29, 2, '2021-09-22 15:00:00', 0, 508, '2021-09-22 17:00:00');
insert into Orario values (103, 'TUR01', 29, 2, '2021-09-24 13:00:00', 0, 508, '2021-09-24 15:00:00');
insert into Orario values (104, 'TUR01', 29, 2, '2021-09-21 09:00:00', 0, 508, '2021-09-21 11:00:00');
insert into Orario values (105, 'TUR01', 29, 3, '2021-09-18 11:00:00', 0, 508, '2021-09-18 12:00:00');
insert into Orario values (106, 'TUR01', 29, 3, '2021-09-14 11:00:00', 0, 508, '2021-09-14 12:00:00');
insert into Orario values (107, 'TUR01', 29, 4, '2021-09-23 09:00:00', 0, 508, '2021-09-23 11:00:00');
insert into Orario values (108, 'TUR01', 29, 4, '2021-09-22 09:00:00', 0, 508, '2021-09-22 11:00:00');
insert into Orario values (109, 'TUR01', 30, 1, '2022-09-17 13:00:00', 0, 508, '2022-09-17 15:00:00');
insert into Orario values (110, 'TUR01', 31, 1, '2023-09-23 09:00:00', 0, 508, '2023-09-23 11:00:00');
insert into Orario values (111, 'TUR01', 31, 1, '2023-09-22 09:00:00', 0, 508, '2023-09-22 11:00:00');
insert into Orario values (112, 'TUR01', 31, 3, '2023-09-17 11:00:00', 0, 508, '2023-09-17 12:00:00');
insert into Orario values (113, 'TUR01', 31, 3, '2023-09-18 13:00:00', 0, 508, '2023-09-18 15:00:00');
insert into Orario values (114, 'TUR01', 31, 3, '2023-09-15 09:00:00', 0, 508, '2023-09-15 11:00:00');
insert into Orario values (115, 'TUR01', 31, 4, '2023-09-25 15:00:00', 0, 508, '2023-09-25 17:00:00');
insert into Orario values (116, 'TUR01', 31, 4, '2023-09-24 15:00:00', 0, 508, '2023-09-24 17:00:00');
insert into Orario values (117, 'TUR01', 32, 1, '2024-09-18 15:00:00', 0, 508, '2024-09-18 17:00:00');
insert into Orario values (118, 'TUR01', 32, 1, '2024-09-17 11:00:00', 0, 508, '2024-09-17 12:00:00');
insert into Orario values (119, 'TUR01', 32, 2, '2024-09-12 13:00:00', 0, 508, '2024-09-12 15:00:00');
insert into Orario values (120, 'TUR01', 32, 2, '2024-09-16 15:00:00', 0, 508, '2024-09-16 17:00:00');
insert into Orario values (121, 'TUR01', 32, 2, '2024-09-15 09:00:00', 0, 508, '2024-09-15 11:00:00');
insert into Orario values (122, 'TUR01', 33, 1, '2025-09-14 11:00:00', 0, 508, '2025-09-14 12:00:00');
insert into Orario values (123, 'TUR01', 34, 1, '2026-09-26 11:00:00', 0, 508, '2026-09-26 12:00:00');
insert into Orario values (124, 'TUR01', 34, 1, '2026-09-23 09:00:00', 0, 508, '2026-09-23 11:00:00');
insert into Orario values (125, 'TUR01', 34, 2, '2026-09-10 13:00:00', 0, 508, '2026-09-10 15:00:00');
insert into Orario values (126, 'ECO03', 35, 1, '2020-09-20 15:00:00', 1, 506, '2020-09-20 17:00:00');
insert into Orario values (127, 'ECO03', 35, 1, '2020-09-17 13:00:00', 1, 509, '2020-09-17 15:00:00');
insert into Orario values (128, 'ECO03', 36, 1, '2021-09-18 11:00:00', 1, 509, '2021-09-18 12:00:00');
insert into Orario values (129, 'ECO03', 36, 1, '2021-09-21 13:00:00', 1, 510, '2021-09-21 15:00:00');
insert into Orario values (130, 'ECO03', 37, 1, '2022-09-20 09:00:00', 1, 324, '2022-09-20 11:00:00');
insert into Orario values (131, 'ECO03', 37, 1, '2022-09-24 09:00:00', 1, 216, '2022-09-24 11:00:00');
insert into Orario values (132, 'ECO03', 37, 2, '2022-09-16 15:00:00', 1, 510, '2022-09-16 17:00:00');
insert into Orario values (133, 'ECO03', 37, 2, '2022-09-18 13:00:00', 1, 510, '2022-09-18 15:00:00');
insert into Orario values (134, 'ECO03', 37, 2, '2022-09-19 15:00:00', 1, 510, '2022-09-19 17:00:00');
insert into Orario values (135, 'ECO03', 38, 1, '2023-09-13 15:00:00', 1, 216, '2023-09-13 17:00:00');
insert into Orario values (136, 'ECO03', 38, 1, '2023-09-11 15:00:00', 1, 324, '2023-09-11 17:00:00');
insert into Orario values (137, 'ECO03', 39, 1, '2024-09-24 09:00:00', 1, 509, '2024-09-24 11:00:00');
insert into Orario values (138, 'ECO03', 39, 1, '2024-09-23 09:00:00', 1, 324, '2024-09-23 11:00:00');
insert into Orario values (139, 'ECO03', 39, 1, '2024-09-21 11:00:00', 1, 216, '2024-09-21 12:00:00');
insert into Orario values (140, 'ECO03', 39, 2, '2024-09-23 11:00:00', 1, 510, '2024-09-23 12:00:00');
insert into Orario values (141, 'ECO03', 39, 2, '2024-09-26 09:00:00', 1, 324, '2024-09-26 11:00:00');
insert into Orario values (142, 'ECO03', 40, 1, '2025-09-16 09:00:00', 1, 509, '2025-09-16 11:00:00');
insert into Orario values (143, 'ECO03', 40, 1, '2025-09-17 11:00:00', 1, 216, '2025-09-17 12:00:00');
insert into Orario values (144, 'ECO03', 41, 1, '2026-09-24 11:00:00', 1, 216, '2026-09-24 12:00:00');
insert into Orario values (145, 'ECO03', 41, 1, '2026-09-26 13:00:00', 1, 216, '2026-09-26 15:00:00');
insert into Orario values (146, 'ECO01', 42, 1, '2020-02-11 15:00:00', 2, 110, '2020-02-11 17:00:00');
insert into Orario values (147, 'ECO01', 42, 1, '2020-02-14 09:00:00', 2, 116, '2020-02-14 11:00:00');
insert into Orario values (148, 'ECO01', 42, 1, '2020-02-13 15:00:00', 2, 110, '2020-02-13 17:00:00');
insert into Orario values (149, 'ECO01', 43, 1, '2021-02-12 11:00:00', 2, 116, '2021-02-12 12:00:00');
insert into Orario values (150, 'ECO01', 43, 1, '2021-02-15 13:00:00', 2, 425, '2021-02-15 15:00:00');
insert into Orario values (151, 'ECO01', 44, 1, '2022-02-14 11:00:00', 2, 116, '2022-02-14 12:00:00');
insert into Orario values (152, 'ECO01', 44, 1, '2022-02-15 15:00:00', 2, 110, '2022-02-15 17:00:00');
insert into Orario values (153, 'ECO01', 44, 1, '2022-02-11 13:00:00', 2, 116, '2022-02-11 15:00:00');
insert into Orario values (154, 'ECO01', 45, 1, '2023-02-12 11:00:00', 2, 110, '2023-02-12 12:00:00');
insert into Orario values (155, 'ECO01', 45, 1, '2023-02-16 13:00:00', 2, 425, '2023-02-16 15:00:00');
insert into Orario values (156, 'ECO01', 45, 1, '2023-02-14 11:00:00', 2, 425, '2023-02-14 12:00:00');
insert into Orario values (157, 'ECO01', 45, 2, '2023-02-18 09:00:00', 2, 425, '2023-02-18 11:00:00');
insert into Orario values (158, 'ECO01', 45, 2, '2023-02-15 09:00:00', 2, 110, '2023-02-15 11:00:00');
insert into Orario values (159, 'ECO01', 45, 2, '2023-02-13 11:00:00', 2, 425, '2023-02-13 12:00:00');
insert into Orario values (160, 'ECO01', 46, 1, '2024-02-18 11:00:00', 2, 110, '2024-02-18 12:00:00');
insert into Orario values (161, 'ECO01', 46, 1, '2024-02-19 11:00:00', 2, 116, '2024-02-19 12:00:00');
insert into Orario values (162, 'ECO01', 46, 2, '2024-02-17 13:00:00', 2, 116, '2024-02-17 15:00:00');
insert into Orario values (163, 'ECO01', 46, 2, '2024-02-13 13:00:00', 2, 116, '2024-02-13 15:00:00');
insert into Orario values (164, 'ECO01', 46, 2, '2024-02-18 15:00:00', 2, 116, '2024-02-18 17:00:00');
insert into Orario values (165, 'ECO01', 46, 3, '2024-02-11 09:00:00', 2, 110, '2024-02-11 11:00:00');
insert into Orario values (166, 'ECO01', 46, 3, '2024-02-12 11:00:00', 2, 110, '2024-02-12 12:00:00');
insert into Orario values (167, 'ECO01', 46, 3, '2024-02-09 15:00:00', 2, 116, '2024-02-09 17:00:00');
insert into Orario values (168, 'ECO01', 46, 4, '2024-02-20 11:00:00', 2, 116, '2024-02-20 12:00:00');
insert into Orario values (169, 'ECO01', 46, 4, '2024-02-23 13:00:00', 2, 425, '2024-02-23 15:00:00');
insert into Orario values (170, 'ECO01', 47, 1, '2025-02-19 15:00:00', 2, 116, '2025-02-19 17:00:00');
insert into Orario values (171, 'ECO01', 47, 1, '2025-02-18 15:00:00', 2, 110, '2025-02-18 17:00:00');
insert into Orario values (172, 'ECO01', 47, 2, '2025-02-22 09:00:00', 2, 425, '2025-02-22 11:00:00');
insert into Orario values (173, 'ECO01', 47, 2, '2025-02-26 11:00:00', 2, 116, '2025-02-26 12:00:00');
insert into Orario values (174, 'ECO01', 48, 1, '2026-02-18 15:00:00', 2, 425, '2026-02-18 17:00:00');
insert into Orario values (175, 'ECO01', 48, 1, '2026-02-23 09:00:00', 2, 116, '2026-02-23 11:00:00');
insert into Orario values (176, 'ECO01', 48, 1, '2026-02-22 11:00:00', 2, 425, '2026-02-22 12:00:00');
insert into Orario values (177, 'ECO01', 48, 2, '2026-02-14 15:00:00', 2, 116, '2026-02-14 17:00:00');
insert into Orario values (178, 'ECO01', 48, 2, '2026-02-15 15:00:00', 2, 116, '2026-02-15 17:00:00');
insert into Orario values (179, 'MAT01', 49, 1, '2020-09-13 11:00:00', 2, 425, '2020-09-13 12:00:00');
insert into Orario values (180, 'MAT01', 49, 1, '2020-09-14 11:00:00', 2, 110, '2020-09-14 12:00:00');
insert into Orario values (181, 'MAT01', 49, 1, '2020-09-16 09:00:00', 2, 116, '2020-09-16 11:00:00');
insert into Orario values (182, 'MAT01', 50, 1, '2021-09-22 11:00:00', 2, 116, '2021-09-22 12:00:00');
insert into Orario values (183, 'MAT01', 50, 1, '2021-09-24 13:00:00', 2, 110, '2021-09-24 15:00:00');
insert into Orario values (184, 'MAT01', 50, 1, '2021-09-26 11:00:00', 2, 116, '2021-09-26 12:00:00');
insert into Orario values (185, 'MAT01', 51, 1, '2022-09-24 15:00:00', 2, 116, '2022-09-24 17:00:00');
insert into Orario values (186, 'MAT01', 51, 1, '2022-09-20 13:00:00', 2, 110, '2022-09-20 15:00:00');
insert into Orario values (187, 'MAT01', 51, 2, '2022-09-22 13:00:00', 2, 425, '2022-09-22 15:00:00');
insert into Orario values (188, 'MAT01', 51, 2, '2022-09-23 15:00:00', 2, 116, '2022-09-23 17:00:00');
insert into Orario values (189, 'MAT01', 52, 1, '2023-09-12 13:00:00', 2, 425, '2023-09-12 15:00:00');
insert into Orario values (190, 'MAT01', 52, 1, '2023-09-11 13:00:00', 2, 110, '2023-09-11 15:00:00');
insert into Orario values (191, 'MAT01', 52, 2, '2023-09-17 15:00:00', 2, 425, '2023-09-17 17:00:00');
insert into Orario values (192, 'MAT01', 52, 2, '2023-09-14 15:00:00', 2, 425, '2023-09-14 17:00:00');
insert into Orario values (193, 'MAT01', 52, 2, '2023-09-13 09:00:00', 2, 425, '2023-09-13 11:00:00');
insert into Orario values (194, 'MAT01', 53, 1, '2024-09-15 13:00:00', 2, 425, '2024-09-15 15:00:00');
insert into Orario values (195, 'MAT01', 53, 1, '2024-09-12 13:00:00', 2, 110, '2024-09-12 15:00:00');
insert into Orario values (196, 'MAT01', 53, 2, '2024-09-13 09:00:00', 2, 425, '2024-09-13 11:00:00');
insert into Orario values (197, 'MAT01', 53, 2, '2024-09-17 15:00:00', 2, 116, '2024-09-17 17:00:00');
insert into Orario values (198, 'MAT01', 53, 2, '2024-09-15 11:00:00', 2, 116, '2024-09-15 12:00:00');
insert into Orario values (199, 'MAT01', 54, 1, '2025-09-10 11:00:00', 2, 110, '2025-09-10 12:00:00');
insert into Orario values (200, 'MAT01', 54, 1, '2025-09-11 15:00:00', 2, 116, '2025-09-11 17:00:00');
insert into Orario values (201, 'MAT01', 54, 1, '2025-09-13 11:00:00', 2, 425, '2025-09-13 12:00:00');
insert into Orario values (202, 'MAT01', 54, 2, '2025-09-09 11:00:00', 2, 116, '2025-09-09 12:00:00');
insert into Orario values (203, 'MAT01', 55, 1, '2026-09-10 13:00:00', 2, 425, '2026-09-10 15:00:00');
insert into Orario values (204, 'MAT01', 55, 1, '2026-09-15 11:00:00', 2, 116, '2026-09-15 12:00:00');
insert into Orario values (205, 'MAT01', 55, 1, '2026-09-11 13:00:00', 2, 110, '2026-09-11 15:00:00');
insert into Orario values (206, 'MAT01', 55, 2, '2026-09-17 11:00:00', 2, 110, '2026-09-17 12:00:00');
insert into Orario values (207, 'MAT01', 55, 2, '2026-09-16 15:00:00', 2, 425, '2026-09-16 17:00:00');
insert into Orario values (208, 'MAT01', 55, 2, '2026-09-19 11:00:00', 2, 116, '2026-09-19 12:00:00');
insert into Orario values (209, 'FIS01', 56, 1, '2020-09-11 09:00:00', 2, 110, '2020-09-11 11:00:00');
insert into Orario values (210, 'FIS01', 56, 1, '2020-09-16 15:00:00', 2, 110, '2020-09-16 17:00:00');
insert into Orario values (211, 'FIS01', 57, 1, '2021-09-10 13:00:00', 2, 116, '2021-09-10 15:00:00');
insert into Orario values (212, 'FIS01', 57, 1, '2021-09-08 15:00:00', 2, 425, '2021-09-08 17:00:00');
insert into Orario values (213, 'FIS01', 57, 2, '2021-09-24 13:00:00', 2, 116, '2021-09-24 15:00:00');
insert into Orario values (214, 'FIS01', 57, 2, '2021-09-22 09:00:00', 2, 116, '2021-09-22 11:00:00');
insert into Orario values (215, 'FIS01', 57, 3, '2021-09-23 13:00:00', 2, 116, '2021-09-23 15:00:00');
insert into Orario values (216, 'FIS01', 57, 3, '2021-09-22 13:00:00', 2, 116, '2021-09-22 15:00:00');
insert into Orario values (217, 'FIS01', 57, 4, '2021-09-26 11:00:00', 2, 110, '2021-09-26 12:00:00');
insert into Orario values (218, 'FIS01', 58, 1, '2022-09-22 13:00:00', 2, 110, '2022-09-22 15:00:00');
insert into Orario values (219, 'FIS01', 58, 1, '2022-09-24 13:00:00', 2, 425, '2022-09-24 15:00:00');
insert into Orario values (220, 'FIS01', 58, 2, '2022-09-13 11:00:00', 2, 425, '2022-09-13 12:00:00');
insert into Orario values (221, 'FIS01', 58, 2, '2022-09-11 15:00:00', 2, 425, '2022-09-11 17:00:00');
insert into Orario values (222, 'FIS01', 58, 2, '2022-09-12 11:00:00', 2, 110, '2022-09-12 12:00:00');
insert into Orario values (223, 'FIS01', 58, 3, '2022-09-17 11:00:00', 2, 110, '2022-09-17 12:00:00');
insert into Orario values (224, 'FIS01', 58, 3, '2022-09-20 13:00:00', 2, 116, '2022-09-20 15:00:00');
insert into Orario values (225, 'FIS01', 58, 3, '2022-09-19 09:00:00', 2, 116, '2022-09-19 11:00:00');
insert into Orario values (226, 'FIS01', 58, 4, '2022-09-25 11:00:00', 2, 116, '2022-09-25 12:00:00');
insert into Orario values (227, 'FIS01', 58, 4, '2022-09-21 13:00:00', 2, 116, '2022-09-21 15:00:00');
insert into Orario values (228, 'FIS01', 59, 1, '2023-09-19 11:00:00', 2, 425, '2023-09-19 12:00:00');
insert into Orario values (229, 'FIS01', 59, 1, '2023-09-16 13:00:00', 2, 425, '2023-09-16 15:00:00');
insert into Orario values (230, 'FIS01', 60, 1, '2024-09-16 11:00:00', 2, 110, '2024-09-16 12:00:00');
insert into Orario values (231, 'FIS01', 60, 1, '2024-09-12 09:00:00', 2, 425, '2024-09-12 11:00:00');
insert into Orario values (232, 'FIS01', 60, 1, '2024-09-15 09:00:00', 2, 425, '2024-09-15 11:00:00');
insert into Orario values (233, 'FIS01', 61, 1, '2025-09-22 11:00:00', 2, 425, '2025-09-22 12:00:00');
insert into Orario values (234, 'FIS01', 61, 1, '2025-09-25 15:00:00', 2, 116, '2025-09-25 17:00:00');
insert into Orario values (235, 'FIS01', 61, 1, '2025-09-27 15:00:00', 2, 425, '2025-09-27 17:00:00');
insert into Orario values (236, 'FIS01', 62, 1, '2026-09-22 09:00:00', 2, 110, '2026-09-22 11:00:00');
insert into Orario values (237, 'FIS01', 62, 1, '2026-09-23 15:00:00', 2, 110, '2026-09-23 17:00:00');
insert into Orario values (238, 'CHI01', 63, 1, '2020-09-23 15:00:00', 2, 116, '2020-09-23 17:00:00');
insert into Orario values (239, 'CHI01', 63, 1, '2020-09-20 09:00:00', 2, 110, '2020-09-20 11:00:00');
insert into Orario values (240, 'CHI01', 64, 1, '2021-09-13 09:00:00', 2, 116, '2021-09-13 11:00:00');
insert into Orario values (241, 'CHI01', 64, 1, '2021-09-08 09:00:00', 2, 116, '2021-09-08 11:00:00');
insert into Orario values (242, 'CHI01', 65, 1, '2022-09-19 15:00:00', 2, 425, '2022-09-19 17:00:00');
insert into Orario values (243, 'CHI01', 65, 1, '2022-09-20 09:00:00', 2, 425, '2022-09-20 11:00:00');
insert into Orario values (244, 'CHI01', 65, 2, '2022-09-13 09:00:00', 2, 110, '2022-09-13 11:00:00');
insert into Orario values (245, 'CHI01', 65, 2, '2022-09-11 15:00:00', 2, 110, '2022-09-11 17:00:00');
insert into Orario values (246, 'CHI01', 65, 2, '2022-09-14 11:00:00', 2, 116, '2022-09-14 12:00:00');
insert into Orario values (247, 'CHI01', 65, 3, '2022-09-21 11:00:00', 2, 110, '2022-09-21 12:00:00');
insert into Orario values (248, 'CHI01', 65, 3, '2022-09-22 11:00:00', 2, 425, '2022-09-22 12:00:00');
insert into Orario values (249, 'CHI01', 65, 4, '2022-09-14 13:00:00', 2, 116, '2022-09-14 15:00:00');
insert into Orario values (250, 'CHI01', 65, 4, '2022-09-15 13:00:00', 2, 425, '2022-09-15 15:00:00');
insert into Orario values (251, 'CHI01', 66, 1, '2023-09-22 09:00:00', 2, 116, '2023-09-22 11:00:00');
insert into Orario values (252, 'CHI01', 66, 1, '2023-09-27 13:00:00', 2, 116, '2023-09-27 15:00:00');
insert into Orario values (253, 'CHI01', 67, 1, '2024-09-24 13:00:00', 2, 425, '2024-09-24 15:00:00');
insert into Orario values (254, 'CHI01', 67, 1, '2024-09-23 11:00:00', 2, 425, '2024-09-23 12:00:00');
insert into Orario values (255, 'CHI01', 67, 1, '2024-09-21 15:00:00', 2, 425, '2024-09-21 17:00:00');
insert into Orario values (256, 'CHI01', 68, 1, '2025-09-25 09:00:00', 2, 425, '2025-09-25 11:00:00');
insert into Orario values (257, 'CHI01', 68, 1, '2025-09-27 11:00:00', 2, 110, '2025-09-27 12:00:00');
insert into Orario values (258, 'CHI01', 68, 1, '2025-09-24 15:00:00', 2, 425, '2025-09-24 17:00:00');
insert into Orario values (259, 'CHI01', 68, 2, '2025-09-23 09:00:00', 2, 425, '2025-09-23 11:00:00');
insert into Orario values (260, 'CHI01', 68, 2, '2025-09-19 15:00:00', 2, 110, '2025-09-19 17:00:00');
insert into Orario values (261, 'CHI01', 68, 2, '2025-09-20 13:00:00', 2, 116, '2025-09-20 15:00:00');
insert into Orario values (262, 'CHI01', 69, 1, '2026-09-14 13:00:00', 2, 110, '2026-09-14 15:00:00');
insert into Orario values (263, 'CHI01', 69, 1, '2026-09-16 13:00:00', 2, 110, '2026-09-16 15:00:00');
insert into Orario values (264, 'CHI01', 69, 1, '2026-09-11 09:00:00', 2, 116, '2026-09-11 11:00:00');
insert into Orario values (265, 'CHI01', 69, 2, '2026-09-14 11:00:00', 2, 116, '2026-09-14 12:00:00');
insert into Orario values (266, 'CHI01', 69, 2, '2026-09-17 11:00:00', 2, 116, '2026-09-17 12:00:00');
insert into Orario values (267, 'BIO01', 70, 1, '2020-02-17 13:00:00', 2, 425, '2020-02-17 15:00:00');
insert into Orario values (268, 'BIO01', 70, 1, '2020-02-13 15:00:00', 2, 425, '2020-02-13 17:00:00');
insert into Orario values (269, 'BIO01', 70, 2, '2020-02-22 15:00:00', 2, 116, '2020-02-22 17:00:00');
insert into Orario values (270, 'BIO01', 70, 2, '2020-02-23 15:00:00', 2, 110, '2020-02-23 17:00:00');
insert into Orario values (271, 'BIO01', 70, 2, '2020-02-21 15:00:00', 2, 116, '2020-02-21 17:00:00');
insert into Orario values (272, 'BIO01', 71, 1, '2021-02-26 13:00:00', 2, 425, '2021-02-26 15:00:00');
insert into Orario values (273, 'BIO01', 71, 1, '2021-02-25 11:00:00', 2, 425, '2021-02-25 12:00:00');
insert into Orario values (274, 'BIO01', 71, 2, '2021-02-25 15:00:00', 2, 110, '2021-02-25 17:00:00');
insert into Orario values (275, 'BIO01', 71, 2, '2021-02-21 09:00:00', 2, 110, '2021-02-21 11:00:00');
insert into Orario values (276, 'BIO01', 71, 2, '2021-02-26 09:00:00', 2, 116, '2021-02-26 11:00:00');
insert into Orario values (277, 'BIO01', 72, 1, '2022-02-19 11:00:00', 2, 425, '2022-02-19 12:00:00');
insert into Orario values (278, 'BIO01', 72, 1, '2022-02-14 13:00:00', 2, 425, '2022-02-14 15:00:00');
insert into Orario values (279, 'BIO01', 72, 1, '2022-02-16 15:00:00', 2, 110, '2022-02-16 17:00:00');
insert into Orario values (280, 'BIO01', 72, 2, '2022-02-22 09:00:00', 2, 116, '2022-02-22 11:00:00');
insert into Orario values (281, 'BIO01', 72, 2, '2022-02-26 13:00:00', 2, 116, '2022-02-26 15:00:00');
insert into Orario values (282, 'BIO01', 73, 1, '2023-02-13 09:00:00', 2, 425, '2023-02-13 11:00:00');
insert into Orario values (283, 'BIO01', 73, 1, '2023-02-12 09:00:00', 2, 425, '2023-02-12 11:00:00');
insert into Orario values (284, 'BIO01', 73, 1, '2023-02-16 13:00:00', 2, 116, '2023-02-16 15:00:00');
insert into Orario values (285, 'BIO01', 73, 2, '2023-02-23 15:00:00', 2, 116, '2023-02-23 17:00:00');
insert into Orario values (286, 'BIO01', 73, 2, '2023-02-22 13:00:00', 2, 116, '2023-02-22 15:00:00');
insert into Orario values (287, 'BIO01', 73, 2, '2023-02-21 13:00:00', 2, 116, '2023-02-21 15:00:00');
insert into Orario values (288, 'BIO01', 74, 1, '2024-02-16 15:00:00', 2, 110, '2024-02-16 17:00:00');
insert into Orario values (289, 'BIO01', 74, 1, '2024-02-15 11:00:00', 2, 425, '2024-02-15 12:00:00');
insert into Orario values (290, 'BIO01', 74, 2, '2024-02-20 09:00:00', 2, 425, '2024-02-20 11:00:00');
insert into Orario values (291, 'BIO01', 74, 2, '2024-02-16 09:00:00', 2, 425, '2024-02-16 11:00:00');
insert into Orario values (292, 'BIO01', 74, 2, '2024-02-15 13:00:00', 2, 425, '2024-02-15 15:00:00');
insert into Orario values (293, 'BIO01', 75, 1, '2025-02-09 15:00:00', 2, 116, '2025-02-09 17:00:00');
insert into Orario values (294, 'BIO01', 75, 1, '2025-02-13 15:00:00', 2, 110, '2025-02-13 17:00:00');
insert into Orario values (295, 'BIO01', 76, 1, '2026-02-25 11:00:00', 2, 110, '2026-02-25 12:00:00');
insert into Orario values (296, 'BIO01', 76, 1, '2026-02-23 13:00:00', 2, 110, '2026-02-23 15:00:00');
insert into Orario values (297, 'ING01', 77, 1, '2020-09-15 13:00:00', 3, 410, '2020-09-15 15:00:00');
insert into Orario values (298, 'ING01', 77, 1, '2020-09-14 11:00:00', 3, 209, '2020-09-14 12:00:00');
insert into Orario values (299, 'ING01', 77, 2, '2020-09-18 09:00:00', 3, 209, '2020-09-18 11:00:00');
insert into Orario values (300, 'ING01', 77, 2, '2020-09-15 15:00:00', 3, 209, '2020-09-15 17:00:00');
insert into Orario values (301, 'ING01', 78, 1, '2021-09-17 13:00:00', 3, 209, '2021-09-17 15:00:00');
insert into Orario values (302, 'ING01', 78, 1, '2021-09-20 11:00:00', 3, 209, '2021-09-20 12:00:00');
insert into Orario values (303, 'ING01', 78, 2, '2021-09-18 15:00:00', 3, 410, '2021-09-18 17:00:00');
insert into Orario values (304, 'ING01', 78, 2, '2021-09-21 13:00:00', 3, 412, '2021-09-21 15:00:00');
insert into Orario values (305, 'ING01', 79, 1, '2022-09-22 11:00:00', 3, 209, '2022-09-22 12:00:00');
insert into Orario values (306, 'ING01', 79, 1, '2022-09-18 11:00:00', 3, 501, '2022-09-18 12:00:00');
insert into Orario values (307, 'ING01', 79, 1, '2022-09-23 11:00:00', 3, 209, '2022-09-23 12:00:00');
insert into Orario values (308, 'ING01', 80, 1, '2023-09-20 15:00:00', 3, 209, '2023-09-20 17:00:00');
insert into Orario values (309, 'ING01', 80, 1, '2023-09-21 11:00:00', 3, 410, '2023-09-21 12:00:00');
insert into Orario values (310, 'ING01', 80, 2, '2023-09-19 13:00:00', 3, 501, '2023-09-19 15:00:00');
insert into Orario values (311, 'ING01', 80, 2, '2023-09-15 15:00:00', 3, 412, '2023-09-15 17:00:00');
insert into Orario values (312, 'ING01', 80, 2, '2023-09-20 11:00:00', 3, 209, '2023-09-20 12:00:00');
insert into Orario values (313, 'ING01', 81, 1, '2024-09-21 13:00:00', 3, 209, '2024-09-21 15:00:00');
insert into Orario values (314, 'ING01', 81, 1, '2024-09-16 15:00:00', 3, 209, '2024-09-16 17:00:00');
insert into Orario values (315, 'ING01', 82, 1, '2025-09-19 13:00:00', 3, 203, '2025-09-19 15:00:00');
insert into Orario values (316, 'ING01', 82, 1, '2025-09-15 11:00:00', 3, 412, '2025-09-15 12:00:00');
insert into Orario values (317, 'ING01', 82, 1, '2025-09-18 13:00:00', 3, 203, '2025-09-18 15:00:00');
insert into Orario values (318, 'ING01', 83, 1, '2026-09-13 13:00:00', 3, 209, '2026-09-13 15:00:00');
insert into Orario values (319, 'ING01', 83, 1, '2026-09-14 13:00:00', 3, 203, '2026-09-14 15:00:00');
insert into Orario values (320, 'ING01', 83, 1, '2026-09-09 13:00:00', 3, 203, '2026-09-09 15:00:00');
insert into Orario values (321, 'ING01', 83, 2, '2026-09-18 15:00:00', 3, 412, '2026-09-18 17:00:00');
insert into Orario values (322, 'ING01', 83, 2, '2026-09-13 11:00:00', 3, 203, '2026-09-13 12:00:00');
insert into Orario values (323, 'ING01', 83, 2, '2026-09-15 09:00:00', 3, 501, '2026-09-15 11:00:00');
insert into Orario values (324, 'ING01', 83, 3, '2026-09-25 15:00:00', 3, 410, '2026-09-25 17:00:00');
insert into Orario values (325, 'ING01', 83, 3, '2026-09-23 09:00:00', 3, 421, '2026-09-23 11:00:00');
insert into Orario values (326, 'ING01', 83, 4, '2026-09-14 11:00:00', 3, 410, '2026-09-14 12:00:00');
insert into Orario values (327, 'ING01', 83, 4, '2026-09-11 11:00:00', 3, 421, '2026-09-11 12:00:00');
insert into Orario values (328, 'ING01', 83, 4, '2026-09-12 15:00:00', 3, 412, '2026-09-12 17:00:00');
insert into Orario values (329, 'ING01', 84, 1, '2020-02-24 09:00:00', 3, 209, '2020-02-24 11:00:00');
insert into Orario values (330, 'ING01', 84, 1, '2020-02-23 09:00:00', 3, 209, '2020-02-23 11:00:00');
insert into Orario values (331, 'ING01', 84, 1, '2020-02-22 11:00:00', 3, 410, '2020-02-22 12:00:00');
insert into Orario values (332, 'ING01', 84, 2, '2020-02-11 15:00:00', 3, 203, '2020-02-11 17:00:00');
insert into Orario values (333, 'ING01', 84, 2, '2020-02-10 13:00:00', 3, 203, '2020-02-10 15:00:00');
insert into Orario values (334, 'ING01', 84, 2, '2020-02-12 13:00:00', 3, 501, '2020-02-12 15:00:00');
insert into Orario values (335, 'ING01', 85, 1, '2021-02-18 11:00:00', 3, 209, '2021-02-18 12:00:00');
insert into Orario values (336, 'ING01', 85, 1, '2021-02-20 09:00:00', 3, 421, '2021-02-20 11:00:00');
insert into Orario values (337, 'ING01', 85, 1, '2021-02-19 09:00:00', 3, 209, '2021-02-19 11:00:00');
insert into Orario values (338, 'ING01', 86, 1, '2022-02-20 13:00:00', 3, 410, '2022-02-20 15:00:00');
insert into Orario values (339, 'ING01', 86, 1, '2022-02-17 13:00:00', 3, 410, '2022-02-17 15:00:00');
insert into Orario values (340, 'ING01', 86, 1, '2022-02-18 15:00:00', 3, 412, '2022-02-18 17:00:00');
insert into Orario values (341, 'ING01', 86, 2, '2022-02-20 09:00:00', 3, 209, '2022-02-20 11:00:00');
insert into Orario values (342, 'ING01', 86, 2, '2022-02-23 15:00:00', 3, 421, '2022-02-23 17:00:00');
insert into Orario values (343, 'ING01', 87, 1, '2023-02-18 13:00:00', 3, 203, '2023-02-18 15:00:00');
insert into Orario values (344, 'ING01', 87, 1, '2023-02-21 15:00:00', 3, 412, '2023-02-21 17:00:00');
insert into Orario values (345, 'ING01', 87, 2, '2023-02-21 09:00:00', 3, 410, '2023-02-21 11:00:00');
insert into Orario values (346, 'ING01', 87, 2, '2023-02-22 13:00:00', 3, 203, '2023-02-22 15:00:00');
insert into Orario values (347, 'ING01', 87, 2, '2023-02-23 15:00:00', 3, 203, '2023-02-23 17:00:00');
insert into Orario values (348, 'ING01', 88, 1, '2024-02-13 13:00:00', 3, 410, '2024-02-13 15:00:00');
insert into Orario values (349, 'ING01', 88, 1, '2024-02-11 15:00:00', 3, 412, '2024-02-11 17:00:00');
insert into Orario values (350, 'ING01', 88, 1, '2024-02-14 11:00:00', 3, 412, '2024-02-14 12:00:00');
insert into Orario values (351, 'ING01', 89, 1, '2025-02-21 13:00:00', 3, 421, '2025-02-21 15:00:00');
insert into Orario values (352, 'ING01', 89, 1, '2025-02-24 11:00:00', 3, 410, '2025-02-24 12:00:00');
insert into Orario values (353, 'ING01', 89, 2, '2025-02-15 11:00:00', 3, 421, '2025-02-15 12:00:00');
insert into Orario values (354, 'ING01', 89, 2, '2025-02-14 11:00:00', 3, 501, '2025-02-14 12:00:00');
insert into Orario values (355, 'ING01', 89, 3, '2025-02-15 09:00:00', 3, 421, '2025-02-15 11:00:00');
insert into Orario values (356, 'ING01', 89, 3, '2025-02-14 13:00:00', 3, 209, '2025-02-14 15:00:00');
insert into Orario values (357, 'ING01', 89, 4, '2025-02-24 13:00:00', 3, 412, '2025-02-24 15:00:00');
insert into Orario values (358, 'ING01', 89, 4, '2025-02-23 11:00:00', 3, 501, '2025-02-23 12:00:00');
insert into Orario values (359, 'ING01', 89, 4, '2025-02-20 13:00:00', 3, 421, '2025-02-20 15:00:00');
insert into Orario values (360, 'ING01', 90, 1, '2026-02-10 13:00:00', 3, 209, '2026-02-10 15:00:00');
insert into Orario values (361, 'ING01', 90, 1, '2026-02-12 09:00:00', 3, 410, '2026-02-12 11:00:00');
insert into Orario values (362, 'ING01', 90, 1, '2026-02-08 15:00:00', 3, 412, '2026-02-08 17:00:00');
insert into Orario values (363, 'ING01', 90, 2, '2026-02-24 11:00:00', 3, 501, '2026-02-24 12:00:00');
insert into Orario values (364, 'ING01', 90, 2, '2026-02-25 13:00:00', 3, 203, '2026-02-25 15:00:00');
insert into Orario values (365, 'ING02', 91, 1, '2020-09-27 13:00:00', 3, 209, '2020-09-27 15:00:00');
insert into Orario values (366, 'ING02', 91, 1, '2020-09-26 09:00:00', 3, 421, '2020-09-26 11:00:00');
insert into Orario values (367, 'ING02', 92, 1, '2021-09-19 11:00:00', 3, 412, '2021-09-19 12:00:00');
insert into Orario values (368, 'ING02', 92, 1, '2021-09-17 13:00:00', 3, 203, '2021-09-17 15:00:00');
insert into Orario values (369, 'ING02', 92, 1, '2021-09-21 15:00:00', 3, 412, '2021-09-21 17:00:00');
insert into Orario values (370, 'ING02', 93, 1, '2022-09-11 09:00:00', 3, 410, '2022-09-11 11:00:00');
insert into Orario values (371, 'ING02', 93, 1, '2022-09-10 09:00:00', 3, 410, '2022-09-10 11:00:00');
insert into Orario values (372, 'ING02', 94, 1, '2023-09-14 13:00:00', 3, 421, '2023-09-14 15:00:00');
insert into Orario values (373, 'ING02', 94, 1, '2023-09-15 11:00:00', 3, 209, '2023-09-15 12:00:00');
insert into Orario values (374, 'ING02', 94, 2, '2023-09-20 13:00:00', 3, 209, '2023-09-20 15:00:00');
insert into Orario values (375, 'ING02', 94, 2, '2023-09-22 13:00:00', 3, 203, '2023-09-22 15:00:00');
insert into Orario values (376, 'ING02', 95, 1, '2024-09-25 11:00:00', 3, 209, '2024-09-25 12:00:00');
insert into Orario values (377, 'ING02', 95, 1, '2024-09-22 09:00:00', 3, 410, '2024-09-22 11:00:00');
insert into Orario values (378, 'ING02', 95, 2, '2024-09-19 15:00:00', 3, 203, '2024-09-19 17:00:00');
insert into Orario values (379, 'ING02', 95, 2, '2024-09-16 11:00:00', 3, 203, '2024-09-16 12:00:00');
insert into Orario values (380, 'ING02', 95, 2, '2024-09-18 09:00:00', 3, 412, '2024-09-18 11:00:00');
insert into Orario values (381, 'ING02', 96, 1, '2025-09-18 15:00:00', 3, 203, '2025-09-18 17:00:00');
insert into Orario values (382, 'ING02', 96, 1, '2025-09-20 11:00:00', 3, 412, '2025-09-20 12:00:00');
insert into Orario values (383, 'ING02', 96, 2, '2025-09-22 09:00:00', 3, 501, '2025-09-22 11:00:00');
insert into Orario values (384, 'ING02', 96, 2, '2025-09-23 11:00:00', 3, 412, '2025-09-23 12:00:00');
insert into Orario values (385, 'ING02', 96, 3, '2025-09-09 15:00:00', 3, 421, '2025-09-09 17:00:00');
insert into Orario values (386, 'ING02', 96, 3, '2025-09-08 15:00:00', 3, 410, '2025-09-08 17:00:00');
insert into Orario values (387, 'ING02', 96, 3, '2025-09-12 13:00:00', 3, 209, '2025-09-12 15:00:00');
insert into Orario values (388, 'ING02', 96, 4, '2025-09-18 13:00:00', 3, 209, '2025-09-18 15:00:00');
insert into Orario values (389, 'ING02', 96, 4, '2025-09-16 13:00:00', 3, 421, '2025-09-16 15:00:00');
insert into Orario values (390, 'ING02', 97, 1, '2026-09-11 15:00:00', 3, 209, '2026-09-11 17:00:00');
insert into Orario values (391, 'ING02', 97, 1, '2026-09-14 09:00:00', 3, 501, '2026-09-14 11:00:00');
insert into Orario values (392, 'ING02', 97, 1, '2026-09-13 15:00:00', 3, 412, '2026-09-13 17:00:00');
insert into Orario values (393, 'MAT01', 98, 1, '2020-02-15 11:00:00', 4, 318, '2020-02-15 12:00:00');
insert into Orario values (394, 'MAT01', 98, 1, '2020-02-13 13:00:00', 4, 323, '2020-02-13 15:00:00');
insert into Orario values (395, 'MAT01', 99, 1, '2021-02-17 15:00:00', 4, 323, '2021-02-17 17:00:00');
insert into Orario values (396, 'MAT01', 99, 1, '2021-02-16 09:00:00', 4, 520, '2021-02-16 11:00:00');
insert into Orario values (397, 'MAT01', 99, 2, '2021-02-18 09:00:00', 4, 123, '2021-02-18 11:00:00');
insert into Orario values (398, 'MAT01', 99, 2, '2021-02-20 09:00:00', 4, 123, '2021-02-20 11:00:00');
insert into Orario values (399, 'MAT01', 100, 1, '2022-02-22 13:00:00', 4, 318, '2022-02-22 15:00:00');
insert into Orario values (400, 'MAT01', 100, 1, '2022-02-25 15:00:00', 4, 123, '2022-02-25 17:00:00');
insert into Orario values (401, 'MAT01', 100, 2, '2022-02-11 11:00:00', 4, 123, '2022-02-11 12:00:00');
insert into Orario values (402, 'MAT01', 100, 2, '2022-02-09 15:00:00', 4, 313, '2022-02-09 17:00:00');
insert into Orario values (403, 'MAT01', 101, 1, '2023-02-22 11:00:00', 4, 406, '2023-02-22 12:00:00');
insert into Orario values (404, 'MAT01', 101, 1, '2023-02-24 15:00:00', 4, 115, '2023-02-24 17:00:00');
insert into Orario values (405, 'MAT01', 101, 1, '2023-02-27 13:00:00', 4, 406, '2023-02-27 15:00:00');
insert into Orario values (406, 'MAT01', 101, 2, '2023-02-21 09:00:00', 4, 520, '2023-02-21 11:00:00');
insert into Orario values (407, 'MAT01', 101, 2, '2023-02-26 13:00:00', 4, 313, '2023-02-26 15:00:00');
insert into Orario values (408, 'MAT01', 101, 3, '2023-02-17 15:00:00', 4, 520, '2023-02-17 17:00:00');
insert into Orario values (409, 'MAT01', 101, 3, '2023-02-16 09:00:00', 4, 313, '2023-02-16 11:00:00');
insert into Orario values (410, 'MAT01', 101, 3, '2023-02-20 11:00:00', 4, 115, '2023-02-20 12:00:00');
insert into Orario values (411, 'MAT01', 101, 4, '2023-02-14 13:00:00', 4, 323, '2023-02-14 15:00:00');
insert into Orario values (412, 'MAT01', 102, 1, '2024-02-12 13:00:00', 4, 520, '2024-02-12 15:00:00');
insert into Orario values (413, 'MAT01', 102, 1, '2024-02-16 15:00:00', 4, 313, '2024-02-16 17:00:00');
insert into Orario values (414, 'MAT01', 102, 1, '2024-02-17 09:00:00', 4, 520, '2024-02-17 11:00:00');
insert into Orario values (415, 'MAT01', 102, 2, '2024-02-23 09:00:00', 4, 115, '2024-02-23 11:00:00');
insert into Orario values (416, 'MAT01', 102, 2, '2024-02-22 13:00:00', 4, 323, '2024-02-22 15:00:00');
insert into Orario values (417, 'MAT01', 103, 1, '2025-02-15 13:00:00', 4, 115, '2025-02-15 15:00:00');
insert into Orario values (418, 'MAT01', 103, 1, '2025-02-20 11:00:00', 4, 323, '2025-02-20 12:00:00');
insert into Orario values (419, 'MAT01', 103, 2, '2025-02-17 13:00:00', 4, 313, '2025-02-17 15:00:00');
insert into Orario values (420, 'MAT01', 103, 2, '2025-02-18 11:00:00', 4, 323, '2025-02-18 12:00:00');
insert into Orario values (421, 'MAT01', 103, 2, '2025-02-20 09:00:00', 4, 313, '2025-02-20 11:00:00');
insert into Orario values (422, 'MAT01', 104, 1, '2026-02-22 11:00:00', 4, 323, '2026-02-22 12:00:00');
insert into Orario values (423, 'MAT01', 104, 1, '2026-02-21 11:00:00', 4, 318, '2026-02-21 12:00:00');
insert into Orario values (424, 'FIS01', 105, 1, '2020-02-23 11:00:00', 4, 323, '2020-02-23 12:00:00');
insert into Orario values (425, 'FIS01', 105, 1, '2020-02-24 09:00:00', 4, 323, '2020-02-24 11:00:00');
insert into Orario values (426, 'FIS01', 105, 1, '2020-02-26 11:00:00', 4, 123, '2020-02-26 12:00:00');
insert into Orario values (427, 'FIS01', 106, 1, '2021-02-25 09:00:00', 4, 123, '2021-02-25 11:00:00');
insert into Orario values (428, 'FIS01', 106, 1, '2021-02-21 11:00:00', 4, 406, '2021-02-21 12:00:00');
insert into Orario values (429, 'FIS01', 106, 1, '2021-02-22 13:00:00', 4, 520, '2021-02-22 15:00:00');
insert into Orario values (430, 'FIS01', 107, 1, '2022-02-13 11:00:00', 4, 115, '2022-02-13 12:00:00');
insert into Orario values (431, 'FIS01', 107, 1, '2022-02-15 15:00:00', 4, 406, '2022-02-15 17:00:00');
insert into Orario values (432, 'FIS01', 107, 1, '2022-02-14 11:00:00', 4, 323, '2022-02-14 12:00:00');
insert into Orario values (433, 'FIS01', 108, 1, '2023-02-14 15:00:00', 4, 520, '2023-02-14 17:00:00');
insert into Orario values (434, 'FIS01', 108, 1, '2023-02-13 11:00:00', 4, 318, '2023-02-13 12:00:00');
insert into Orario values (435, 'FIS01', 108, 1, '2023-02-15 11:00:00', 4, 123, '2023-02-15 12:00:00');
insert into Orario values (436, 'FIS01', 109, 1, '2024-02-18 11:00:00', 4, 123, '2024-02-18 12:00:00');
insert into Orario values (437, 'FIS01', 109, 1, '2024-02-23 13:00:00', 4, 115, '2024-02-23 15:00:00');
insert into Orario values (438, 'FIS01', 109, 1, '2024-02-21 11:00:00', 4, 520, '2024-02-21 12:00:00');
insert into Orario values (439, 'FIS01', 110, 1, '2025-02-22 13:00:00', 4, 318, '2025-02-22 15:00:00');
insert into Orario values (440, 'FIS01', 110, 1, '2025-02-23 13:00:00', 4, 406, '2025-02-23 15:00:00');
insert into Orario values (441, 'FIS01', 110, 1, '2025-02-18 13:00:00', 4, 318, '2025-02-18 15:00:00');
insert into Orario values (442, 'FIS01', 111, 1, '2026-02-19 11:00:00', 4, 323, '2026-02-19 12:00:00');
insert into Orario values (443, 'FIS01', 111, 1, '2026-02-18 13:00:00', 4, 123, '2026-02-18 15:00:00');
insert into Orario values (444, 'FIS01', 111, 2, '2026-02-12 13:00:00', 4, 123, '2026-02-12 15:00:00');
insert into Orario values (445, 'FIS01', 111, 2, '2026-02-14 11:00:00', 4, 318, '2026-02-14 12:00:00');
insert into Orario values (446, 'ING_INF01', 112, 1, '2020-09-24 09:00:00', 5, 106, '2020-09-24 11:00:00');
insert into Orario values (447, 'ING_INF01', 112, 1, '2020-09-19 11:00:00', 5, 107, '2020-09-19 12:00:00');
insert into Orario values (448, 'ING_INF01', 112, 1, '2020-09-21 13:00:00', 5, 302, '2020-09-21 15:00:00');
insert into Orario values (449, 'ING_INF01', 112, 2, '2020-09-09 11:00:00', 5, 506, '2020-09-09 12:00:00');
insert into Orario values (450, 'ING_INF01', 112, 2, '2020-09-12 13:00:00', 5, 106, '2020-09-12 15:00:00');
insert into Orario values (451, 'ING_INF01', 112, 2, '2020-09-14 11:00:00', 5, 106, '2020-09-14 12:00:00');
insert into Orario values (452, 'ING_INF01', 113, 1, '2021-09-23 13:00:00', 5, 302, '2021-09-23 15:00:00');
insert into Orario values (453, 'ING_INF01', 113, 1, '2021-09-24 15:00:00', 5, 526, '2021-09-24 17:00:00');
insert into Orario values (454, 'ING_INF01', 113, 1, '2021-09-21 13:00:00', 5, 106, '2021-09-21 15:00:00');
insert into Orario values (455, 'ING_INF01', 114, 1, '2022-09-21 15:00:00', 5, 302, '2022-09-21 17:00:00');
insert into Orario values (456, 'ING_INF01', 114, 1, '2022-09-16 13:00:00', 5, 107, '2022-09-16 15:00:00');
insert into Orario values (457, 'ING_INF01', 114, 2, '2022-09-16 09:00:00', 5, 106, '2022-09-16 11:00:00');
insert into Orario values (458, 'ING_INF01', 114, 2, '2022-09-17 13:00:00', 5, 302, '2022-09-17 15:00:00');
insert into Orario values (459, 'ING_INF01', 114, 2, '2022-09-19 13:00:00', 5, 506, '2022-09-19 15:00:00');
insert into Orario values (460, 'ING_INF01', 114, 3, '2022-09-24 11:00:00', 5, 107, '2022-09-24 12:00:00');
insert into Orario values (461, 'ING_INF01', 114, 3, '2022-09-21 09:00:00', 5, 302, '2022-09-21 11:00:00');
insert into Orario values (462, 'ING_INF01', 114, 3, '2022-09-22 09:00:00', 5, 506, '2022-09-22 11:00:00');
insert into Orario values (463, 'ING_INF01', 114, 4, '2022-09-20 15:00:00', 5, 526, '2022-09-20 17:00:00');
insert into Orario values (464, 'ING_INF01', 114, 4, '2022-09-18 11:00:00', 5, 106, '2022-09-18 12:00:00');
insert into Orario values (465, 'ING_INF01', 115, 1, '2023-09-21 11:00:00', 5, 107, '2023-09-21 12:00:00');
insert into Orario values (466, 'ING_INF01', 115, 1, '2023-09-19 09:00:00', 5, 302, '2023-09-19 11:00:00');
insert into Orario values (467, 'ING_INF01', 115, 1, '2023-09-16 09:00:00', 5, 429, '2023-09-16 11:00:00');
insert into Orario values (468, 'ING_INF01', 115, 2, '2023-09-10 11:00:00', 5, 106, '2023-09-10 12:00:00');
insert into Orario values (469, 'ING_INF01', 115, 2, '2023-09-13 11:00:00', 5, 302, '2023-09-13 12:00:00');
insert into Orario values (470, 'ING_INF01', 116, 1, '2024-09-19 15:00:00', 5, 506, '2024-09-19 17:00:00');
insert into Orario values (471, 'ING_INF01', 116, 1, '2024-09-20 13:00:00', 5, 106, '2024-09-20 15:00:00');
insert into Orario values (472, 'ING_INF01', 117, 1, '2025-09-24 15:00:00', 5, 526, '2025-09-24 17:00:00');
insert into Orario values (473, 'ING_INF01', 117, 1, '2025-09-23 15:00:00', 5, 429, '2025-09-23 17:00:00');
insert into Orario values (474, 'ING_INF01', 118, 1, '2026-09-13 09:00:00', 5, 106, '2026-09-13 11:00:00');
insert into Orario values (475, 'ING_INF01', 118, 1, '2026-09-17 15:00:00', 5, 302, '2026-09-17 17:00:00');
insert into Orario values (476, 'ING_INF01', 118, 1, '2026-09-16 09:00:00', 5, 302, '2026-09-16 11:00:00');
insert into Orario values (477, 'ING_INF02', 119, 1, '2020-02-20 11:00:00', 5, 107, '2020-02-20 12:00:00');
insert into Orario values (478, 'ING_INF02', 119, 1, '2020-02-18 15:00:00', 5, 506, '2020-02-18 17:00:00');
insert into Orario values (479, 'ING_INF02', 120, 1, '2021-02-16 15:00:00', 5, 429, '2021-02-16 17:00:00');
insert into Orario values (480, 'ING_INF02', 120, 1, '2021-02-20 15:00:00', 5, 429, '2021-02-20 17:00:00');
insert into Orario values (481, 'ING_INF02', 120, 1, '2021-02-18 09:00:00', 5, 106, '2021-02-18 11:00:00');
insert into Orario values (482, 'ING_INF02', 121, 1, '2022-02-14 11:00:00', 5, 429, '2022-02-14 12:00:00');
insert into Orario values (483, 'ING_INF02', 121, 1, '2022-02-15 15:00:00', 5, 107, '2022-02-15 17:00:00');
insert into Orario values (484, 'ING_INF02', 122, 1, '2023-02-18 13:00:00', 5, 526, '2023-02-18 15:00:00');
insert into Orario values (485, 'ING_INF02', 122, 1, '2023-02-13 15:00:00', 5, 506, '2023-02-13 17:00:00');
insert into Orario values (486, 'ING_INF02', 122, 1, '2023-02-16 11:00:00', 5, 302, '2023-02-16 12:00:00');
insert into Orario values (487, 'ING_INF02', 122, 2, '2023-02-15 11:00:00', 5, 506, '2023-02-15 12:00:00');
insert into Orario values (488, 'ING_INF02', 122, 2, '2023-02-12 15:00:00', 5, 526, '2023-02-12 17:00:00');
insert into Orario values (489, 'ING_INF02', 122, 2, '2023-02-14 11:00:00', 5, 506, '2023-02-14 12:00:00');
insert into Orario values (490, 'ING_INF02', 123, 1, '2024-02-20 09:00:00', 5, 429, '2024-02-20 11:00:00');
insert into Orario values (491, 'ING_INF02', 123, 1, '2024-02-22 15:00:00', 5, 526, '2024-02-22 17:00:00');
insert into Orario values (492, 'ING_INF02', 123, 1, '2024-02-18 13:00:00', 5, 302, '2024-02-18 15:00:00');
insert into Orario values (493, 'ING_INF02', 124, 1, '2025-02-20 15:00:00', 5, 429, '2025-02-20 17:00:00');
insert into Orario values (494, 'ING_INF02', 124, 1, '2025-02-16 09:00:00', 5, 526, '2025-02-16 11:00:00');
insert into Orario values (495, 'ING_INF02', 124, 2, '2025-02-15 13:00:00', 5, 429, '2025-02-15 15:00:00');
insert into Orario values (496, 'ING_INF02', 124, 2, '2025-02-16 11:00:00', 5, 506, '2025-02-16 12:00:00');
insert into Orario values (497, 'ING_INF02', 125, 1, '2026-02-21 15:00:00', 5, 506, '2026-02-21 17:00:00');
insert into Orario values (498, 'ING_INF02', 125, 1, '2026-02-22 15:00:00', 5, 429, '2026-02-22 17:00:00');
insert into Orario values (499, 'ING_INF02', 125, 1, '2026-02-23 11:00:00', 5, 106, '2026-02-23 12:00:00');
insert into Orario values (500, 'ING01', 126, 1, '2020-09-21 11:00:00', 5, 429, '2020-09-21 12:00:00');
insert into Orario values (501, 'ING01', 126, 1, '2020-09-17 09:00:00', 5, 106, '2020-09-17 11:00:00');
insert into Orario values (502, 'ING01', 127, 1, '2021-09-13 09:00:00', 5, 526, '2021-09-13 11:00:00');
insert into Orario values (503, 'ING01', 127, 1, '2021-09-14 09:00:00', 5, 429, '2021-09-14 11:00:00');
insert into Orario values (504, 'ING01', 127, 2, '2021-09-15 15:00:00', 5, 107, '2021-09-15 17:00:00');
insert into Orario values (505, 'ING01', 127, 2, '2021-09-10 11:00:00', 5, 526, '2021-09-10 12:00:00');
insert into Orario values (506, 'ING01', 128, 1, '2022-09-19 15:00:00', 5, 506, '2022-09-19 17:00:00');
insert into Orario values (507, 'ING01', 128, 1, '2022-09-22 15:00:00', 5, 526, '2022-09-22 17:00:00');
insert into Orario values (508, 'ING01', 128, 2, '2022-09-20 09:00:00', 5, 107, '2022-09-20 11:00:00');
insert into Orario values (509, 'ING01', 128, 2, '2022-09-22 11:00:00', 5, 302, '2022-09-22 12:00:00');
insert into Orario values (510, 'ING01', 129, 1, '2023-09-18 13:00:00', 5, 526, '2023-09-18 15:00:00');
insert into Orario values (511, 'ING01', 129, 1, '2023-09-16 15:00:00', 5, 526, '2023-09-16 17:00:00');
insert into Orario values (512, 'ING01', 129, 1, '2023-09-17 11:00:00', 5, 302, '2023-09-17 12:00:00');
insert into Orario values (513, 'ING01', 129, 2, '2023-09-13 13:00:00', 5, 106, '2023-09-13 15:00:00');
insert into Orario values (514, 'ING01', 129, 2, '2023-09-14 15:00:00', 5, 107, '2023-09-14 17:00:00');
insert into Orario values (515, 'ING01', 129, 3, '2023-09-22 11:00:00', 5, 302, '2023-09-22 12:00:00');
insert into Orario values (516, 'ING01', 129, 3, '2023-09-23 13:00:00', 5, 506, '2023-09-23 15:00:00');
insert into Orario values (517, 'ING01', 129, 4, '2023-09-14 13:00:00', 5, 506, '2023-09-14 15:00:00');
insert into Orario values (518, 'ING01', 129, 4, '2023-09-12 15:00:00', 5, 106, '2023-09-12 17:00:00');
insert into Orario values (519, 'ING01', 130, 1, '2024-09-17 13:00:00', 5, 302, '2024-09-17 15:00:00');
insert into Orario values (520, 'ING01', 130, 1, '2024-09-21 11:00:00', 5, 106, '2024-09-21 12:00:00');
insert into Orario values (521, 'ING01', 130, 1, '2024-09-22 15:00:00', 5, 526, '2024-09-22 17:00:00');
insert into Orario values (522, 'ING01', 131, 1, '2025-09-19 13:00:00', 5, 107, '2025-09-19 15:00:00');
insert into Orario values (523, 'ING01', 131, 1, '2025-09-16 13:00:00', 5, 506, '2025-09-16 15:00:00');
insert into Orario values (524, 'ING01', 131, 2, '2025-09-23 11:00:00', 5, 107, '2025-09-23 12:00:00');
insert into Orario values (525, 'ING01', 131, 2, '2025-09-21 15:00:00', 5, 429, '2025-09-21 17:00:00');
insert into Orario values (526, 'ING01', 132, 1, '2026-09-22 15:00:00', 5, 302, '2026-09-22 17:00:00');
insert into Orario values (527, 'ING01', 132, 1, '2026-09-20 13:00:00', 5, 302, '2026-09-20 15:00:00');
insert into Orario values (528, 'ING01', 132, 1, '2026-09-21 15:00:00', 5, 429, '2026-09-21 17:00:00');
insert into Orario values (529, 'ING01', 132, 2, '2026-09-23 15:00:00', 5, 106, '2026-09-23 17:00:00');
insert into Orario values (530, 'ING01', 132, 2, '2026-09-22 13:00:00', 5, 106, '2026-09-22 15:00:00');
insert into Orario values (531, 'ING01', 132, 2, '2026-09-25 11:00:00', 5, 429, '2026-09-25 12:00:00');
insert into Orario values (532, 'ING01', 133, 1, '2020-02-18 09:00:00', 5, 107, '2020-02-18 11:00:00');
insert into Orario values (533, 'ING01', 133, 1, '2020-02-21 15:00:00', 5, 506, '2020-02-21 17:00:00');
insert into Orario values (534, 'ING01', 133, 1, '2020-02-16 13:00:00', 5, 107, '2020-02-16 15:00:00');
insert into Orario values (535, 'ING01', 134, 1, '2021-02-08 15:00:00', 5, 506, '2021-02-08 17:00:00');
insert into Orario values (536, 'ING01', 134, 1, '2021-02-12 11:00:00', 5, 526, '2021-02-12 12:00:00');
insert into Orario values (537, 'ING01', 135, 1, '2022-02-14 11:00:00', 5, 526, '2022-02-14 12:00:00');
insert into Orario values (538, 'ING01', 135, 1, '2022-02-12 09:00:00', 5, 107, '2022-02-12 11:00:00');
insert into Orario values (539, 'ING01', 135, 1, '2022-02-17 11:00:00', 5, 107, '2022-02-17 12:00:00');
insert into Orario values (540, 'ING01', 136, 1, '2023-02-15 09:00:00', 5, 506, '2023-02-15 11:00:00');
insert into Orario values (541, 'ING01', 136, 1, '2023-02-18 09:00:00', 5, 107, '2023-02-18 11:00:00');
insert into Orario values (542, 'ING01', 136, 2, '2023-02-14 13:00:00', 5, 302, '2023-02-14 15:00:00');
insert into Orario values (543, 'ING01', 136, 2, '2023-02-10 15:00:00', 5, 107, '2023-02-10 17:00:00');
insert into Orario values (544, 'ING01', 137, 1, '2024-02-12 11:00:00', 5, 107, '2024-02-12 12:00:00');
insert into Orario values (545, 'ING01', 137, 1, '2024-02-10 13:00:00', 5, 107, '2024-02-10 15:00:00');
insert into Orario values (546, 'ING01', 137, 2, '2024-02-19 13:00:00', 5, 302, '2024-02-19 15:00:00');
insert into Orario values (547, 'ING01', 137, 2, '2024-02-15 15:00:00', 5, 302, '2024-02-15 17:00:00');
insert into Orario values (548, 'ING01', 138, 1, '2025-02-19 13:00:00', 5, 526, '2025-02-19 15:00:00');
insert into Orario values (549, 'ING01', 138, 1, '2025-02-18 11:00:00', 5, 106, '2025-02-18 12:00:00');
insert into Orario values (550, 'ING01', 138, 1, '2025-02-17 13:00:00', 5, 106, '2025-02-17 15:00:00');
insert into Orario values (551, 'ING01', 139, 1, '2026-02-25 11:00:00', 5, 302, '2026-02-25 12:00:00');
insert into Orario values (552, 'ING01', 139, 1, '2026-02-23 15:00:00', 5, 526, '2026-02-23 17:00:00');
insert into Orario values (553, 'ING02', 140, 1, '2020-09-17 09:00:00', 5, 107, '2020-09-17 11:00:00');
insert into Orario values (554, 'ING02', 140, 1, '2020-09-16 09:00:00', 5, 526, '2020-09-16 11:00:00');
insert into Orario values (555, 'ING02', 140, 2, '2020-09-18 09:00:00', 5, 506, '2020-09-18 11:00:00');
insert into Orario values (556, 'ING02', 140, 2, '2020-09-21 15:00:00', 5, 526, '2020-09-21 17:00:00');
insert into Orario values (557, 'ING02', 140, 3, '2020-09-23 11:00:00', 5, 302, '2020-09-23 12:00:00');
insert into Orario values (558, 'ING02', 140, 3, '2020-09-24 15:00:00', 5, 526, '2020-09-24 17:00:00');
insert into Orario values (559, 'ING02', 140, 3, '2020-09-19 09:00:00', 5, 506, '2020-09-19 11:00:00');
insert into Orario values (560, 'ING02', 140, 4, '2020-09-18 13:00:00', 5, 506, '2020-09-18 15:00:00');
insert into Orario values (561, 'ING02', 140, 4, '2020-09-21 09:00:00', 5, 302, '2020-09-21 11:00:00');
insert into Orario values (562, 'ING02', 141, 1, '2021-09-17 11:00:00', 5, 429, '2021-09-17 12:00:00');
insert into Orario values (563, 'ING02', 141, 1, '2021-09-20 11:00:00', 5, 526, '2021-09-20 12:00:00');
insert into Orario values (564, 'ING02', 142, 1, '2022-09-14 11:00:00', 5, 429, '2022-09-14 12:00:00');
insert into Orario values (565, 'ING02', 142, 1, '2022-09-11 15:00:00', 5, 107, '2022-09-11 17:00:00');
insert into Orario values (566, 'ING02', 142, 2, '2022-09-10 09:00:00', 5, 526, '2022-09-10 11:00:00');
insert into Orario values (567, 'ING02', 142, 2, '2022-09-09 11:00:00', 5, 302, '2022-09-09 12:00:00');
insert into Orario values (568, 'ING02', 143, 1, '2023-09-21 11:00:00', 5, 302, '2023-09-21 12:00:00');
insert into Orario values (569, 'ING02', 143, 1, '2023-09-25 09:00:00', 5, 526, '2023-09-25 11:00:00');
insert into Orario values (570, 'ING02', 143, 1, '2023-09-23 15:00:00', 5, 429, '2023-09-23 17:00:00');
insert into Orario values (571, 'ING02', 144, 1, '2024-09-23 15:00:00', 5, 107, '2024-09-23 17:00:00');
insert into Orario values (572, 'ING02', 144, 1, '2024-09-22 11:00:00', 5, 429, '2024-09-22 12:00:00');
insert into Orario values (573, 'ING02', 144, 2, '2024-09-15 09:00:00', 5, 107, '2024-09-15 11:00:00');
insert into Orario values (574, 'ING02', 144, 2, '2024-09-17 13:00:00', 5, 107, '2024-09-17 15:00:00');
insert into Orario values (575, 'ING02', 144, 2, '2024-09-14 09:00:00', 5, 107, '2024-09-14 11:00:00');
insert into Orario values (576, 'ING02', 145, 1, '2025-09-12 13:00:00', 5, 526, '2025-09-12 15:00:00');
insert into Orario values (577, 'ING02', 145, 1, '2025-09-08 13:00:00', 5, 107, '2025-09-08 15:00:00');
insert into Orario values (578, 'ING02', 146, 1, '2026-09-21 15:00:00', 5, 526, '2026-09-21 17:00:00');
insert into Orario values (579, 'ING02', 146, 1, '2026-09-17 15:00:00', 5, 506, '2026-09-17 17:00:00');
insert into Orario values (580, 'ING02', 147, 1, '2020-02-14 15:00:00', 5, 106, '2020-02-14 17:00:00');
insert into Orario values (581, 'ING02', 147, 1, '2020-02-13 13:00:00', 5, 429, '2020-02-13 15:00:00');
insert into Orario values (582, 'ING02', 147, 1, '2020-02-11 13:00:00', 5, 107, '2020-02-11 15:00:00');
insert into Orario values (583, 'ING02', 148, 1, '2021-02-16 09:00:00', 5, 302, '2021-02-16 11:00:00');
insert into Orario values (584, 'ING02', 148, 1, '2021-02-20 13:00:00', 5, 302, '2021-02-20 15:00:00');
insert into Orario values (585, 'ING02', 148, 2, '2021-02-12 13:00:00', 5, 526, '2021-02-12 15:00:00');
insert into Orario values (586, 'ING02', 148, 2, '2021-02-14 15:00:00', 5, 106, '2021-02-14 17:00:00');
insert into Orario values (587, 'ING02', 149, 1, '2022-02-18 09:00:00', 5, 302, '2022-02-18 11:00:00');
insert into Orario values (588, 'ING02', 149, 1, '2022-02-23 09:00:00', 5, 429, '2022-02-23 11:00:00');
insert into Orario values (589, 'ING02', 149, 1, '2022-02-20 09:00:00', 5, 506, '2022-02-20 11:00:00');
insert into Orario values (590, 'ING02', 149, 2, '2022-02-11 15:00:00', 5, 429, '2022-02-11 17:00:00');
insert into Orario values (591, 'ING02', 149, 2, '2022-02-09 11:00:00', 5, 106, '2022-02-09 12:00:00');
insert into Orario values (592, 'ING02', 150, 1, '2023-02-16 15:00:00', 5, 506, '2023-02-16 17:00:00');
insert into Orario values (593, 'ING02', 150, 1, '2023-02-20 09:00:00', 5, 106, '2023-02-20 11:00:00');
insert into Orario values (594, 'ING02', 151, 1, '2024-02-18 09:00:00', 5, 106, '2024-02-18 11:00:00');
insert into Orario values (595, 'ING02', 151, 1, '2024-02-15 15:00:00', 5, 526, '2024-02-15 17:00:00');
insert into Orario values (596, 'ING02', 152, 1, '2025-02-12 09:00:00', 5, 526, '2025-02-12 11:00:00');
insert into Orario values (597, 'ING02', 152, 1, '2025-02-13 09:00:00', 5, 429, '2025-02-13 11:00:00');
insert into Orario values (598, 'ING02', 152, 1, '2025-02-14 15:00:00', 5, 106, '2025-02-14 17:00:00');
insert into Orario values (599, 'ING02', 153, 1, '2026-02-24 13:00:00', 5, 429, '2026-02-24 15:00:00');
insert into Orario values (600, 'ING02', 153, 1, '2026-02-20 09:00:00', 5, 106, '2026-02-20 11:00:00');
insert into Orario values (601, 'ING02', 153, 2, '2026-02-13 13:00:00', 5, 429, '2026-02-13 15:00:00');
insert into Orario values (602, 'ING02', 153, 2, '2026-02-11 11:00:00', 5, 429, '2026-02-11 12:00:00');
insert into Orario values (603, 'ING02', 154, 1, '2020-09-25 13:00:00', 5, 107, '2020-09-25 15:00:00');
insert into Orario values (604, 'ING02', 154, 1, '2020-09-23 11:00:00', 5, 106, '2020-09-23 12:00:00');
insert into Orario values (605, 'ING02', 154, 1, '2020-09-21 11:00:00', 5, 106, '2020-09-21 12:00:00');
insert into Orario values (606, 'ING02', 154, 2, '2020-09-16 15:00:00', 5, 429, '2020-09-16 17:00:00');
insert into Orario values (607, 'ING02', 154, 2, '2020-09-15 15:00:00', 5, 107, '2020-09-15 17:00:00');
insert into Orario values (608, 'ING02', 154, 2, '2020-09-14 09:00:00', 5, 429, '2020-09-14 11:00:00');
insert into Orario values (609, 'ING02', 154, 3, '2020-09-17 09:00:00', 5, 302, '2020-09-17 11:00:00');
insert into Orario values (610, 'ING02', 154, 3, '2020-09-14 13:00:00', 5, 526, '2020-09-14 15:00:00');
insert into Orario values (611, 'ING02', 154, 3, '2020-09-15 13:00:00', 5, 429, '2020-09-15 15:00:00');
insert into Orario values (612, 'ING02', 154, 4, '2020-09-13 09:00:00', 5, 107, '2020-09-13 11:00:00');
insert into Orario values (613, 'ING02', 154, 4, '2020-09-16 13:00:00', 5, 526, '2020-09-16 15:00:00');
insert into Orario values (614, 'ING02', 155, 1, '2021-09-17 13:00:00', 5, 429, '2021-09-17 15:00:00');
insert into Orario values (615, 'ING02', 155, 1, '2021-09-21 13:00:00', 5, 526, '2021-09-21 15:00:00');
insert into Orario values (616, 'ING02', 155, 1, '2021-09-22 09:00:00', 5, 302, '2021-09-22 11:00:00');
insert into Orario values (617, 'ING02', 156, 1, '2022-09-13 15:00:00', 5, 526, '2022-09-13 17:00:00');
insert into Orario values (618, 'ING02', 156, 1, '2022-09-08 15:00:00', 5, 302, '2022-09-08 17:00:00');
insert into Orario values (619, 'ING02', 156, 1, '2022-09-09 15:00:00', 5, 506, '2022-09-09 17:00:00');
insert into Orario values (620, 'ING02', 156, 2, '2022-09-24 09:00:00', 5, 506, '2022-09-24 11:00:00');
insert into Orario values (621, 'ING02', 156, 2, '2022-09-22 11:00:00', 5, 107, '2022-09-22 12:00:00');
insert into Orario values (622, 'ING02', 156, 3, '2022-09-11 09:00:00', 5, 429, '2022-09-11 11:00:00');
insert into Orario values (623, 'ING02', 156, 3, '2022-09-10 09:00:00', 5, 107, '2022-09-10 11:00:00');
insert into Orario values (624, 'ING02', 156, 4, '2022-09-23 09:00:00', 5, 506, '2022-09-23 11:00:00');
insert into Orario values (625, 'ING02', 156, 4, '2022-09-27 11:00:00', 5, 526, '2022-09-27 12:00:00');
insert into Orario values (626, 'ING02', 156, 4, '2022-09-25 09:00:00', 5, 506, '2022-09-25 11:00:00');
insert into Orario values (627, 'ING02', 157, 1, '2023-09-22 15:00:00', 5, 526, '2023-09-22 17:00:00');
insert into Orario values (628, 'ING02', 157, 1, '2023-09-23 11:00:00', 5, 429, '2023-09-23 12:00:00');
insert into Orario values (629, 'ING02', 158, 1, '2024-09-26 13:00:00', 5, 526, '2024-09-26 15:00:00');
insert into Orario values (630, 'ING02', 158, 1, '2024-09-25 13:00:00', 5, 506, '2024-09-25 15:00:00');
insert into Orario values (631, 'ING02', 158, 1, '2024-09-23 09:00:00', 5, 526, '2024-09-23 11:00:00');
insert into Orario values (632, 'ING02', 158, 2, '2024-09-15 11:00:00', 5, 429, '2024-09-15 12:00:00');
insert into Orario values (633, 'ING02', 158, 2, '2024-09-12 11:00:00', 5, 506, '2024-09-12 12:00:00');
insert into Orario values (634, 'ING02', 159, 1, '2025-09-12 15:00:00', 5, 506, '2025-09-12 17:00:00');
insert into Orario values (635, 'ING02', 159, 1, '2025-09-14 09:00:00', 5, 106, '2025-09-14 11:00:00');
insert into Orario values (636, 'ING02', 159, 1, '2025-09-11 13:00:00', 5, 526, '2025-09-11 15:00:00');
insert into Orario values (637, 'ING02', 160, 1, '2026-09-20 15:00:00', 5, 506, '2026-09-20 17:00:00');
insert into Orario values (638, 'ING02', 160, 1, '2026-09-23 11:00:00', 5, 526, '2026-09-23 12:00:00');
insert into Orario values (639, 'ING02', 160, 1, '2026-09-19 09:00:00', 5, 106, '2026-09-19 11:00:00');
insert into Orario values (640, 'ING_INF02', 161, 1, '2020-09-12 11:00:00', 5, 429, '2020-09-12 12:00:00');
insert into Orario values (641, 'ING_INF02', 161, 1, '2020-09-11 15:00:00', 5, 526, '2020-09-11 17:00:00');
insert into Orario values (642, 'ING_INF02', 161, 1, '2020-09-13 11:00:00', 5, 107, '2020-09-13 12:00:00');
insert into Orario values (643, 'ING_INF02', 161, 2, '2020-09-15 11:00:00', 5, 106, '2020-09-15 12:00:00');
insert into Orario values (644, 'ING_INF02', 161, 2, '2020-09-14 11:00:00', 5, 526, '2020-09-14 12:00:00');
insert into Orario values (645, 'ING_INF02', 162, 1, '2021-09-09 09:00:00', 5, 526, '2021-09-09 11:00:00');
insert into Orario values (646, 'ING_INF02', 162, 1, '2021-09-12 13:00:00', 5, 506, '2021-09-12 15:00:00');
insert into Orario values (647, 'ING_INF02', 163, 1, '2022-09-17 11:00:00', 5, 429, '2022-09-17 12:00:00');
insert into Orario values (648, 'ING_INF02', 163, 1, '2022-09-18 15:00:00', 5, 107, '2022-09-18 17:00:00');
insert into Orario values (649, 'ING_INF02', 163, 2, '2022-09-21 15:00:00', 5, 107, '2022-09-21 17:00:00');
insert into Orario values (650, 'ING_INF02', 163, 2, '2022-09-22 15:00:00', 5, 107, '2022-09-22 17:00:00');
insert into Orario values (651, 'ING_INF02', 163, 2, '2022-09-17 09:00:00', 5, 107, '2022-09-17 11:00:00');
insert into Orario values (652, 'ING_INF02', 164, 1, '2023-09-11 15:00:00', 5, 506, '2023-09-11 17:00:00');
insert into Orario values (653, 'ING_INF02', 164, 1, '2023-09-13 15:00:00', 5, 429, '2023-09-13 17:00:00');
insert into Orario values (654, 'ING_INF02', 164, 1, '2023-09-14 15:00:00', 5, 106, '2023-09-14 17:00:00');
insert into Orario values (655, 'ING_INF02', 164, 2, '2023-09-21 13:00:00', 5, 506, '2023-09-21 15:00:00');
insert into Orario values (656, 'ING_INF02', 164, 2, '2023-09-23 09:00:00', 5, 429, '2023-09-23 11:00:00');
insert into Orario values (657, 'ING_INF02', 164, 2, '2023-09-18 09:00:00', 5, 526, '2023-09-18 11:00:00');
insert into Orario values (658, 'ING_INF02', 165, 1, '2024-09-24 15:00:00', 5, 429, '2024-09-24 17:00:00');
insert into Orario values (659, 'ING_INF02', 165, 1, '2024-09-21 13:00:00', 5, 429, '2024-09-21 15:00:00');
insert into Orario values (660, 'ING_INF02', 165, 1, '2024-09-20 15:00:00', 5, 429, '2024-09-20 17:00:00');
insert into Orario values (661, 'ING_INF02', 165, 2, '2024-09-23 09:00:00', 5, 506, '2024-09-23 11:00:00');
insert into Orario values (662, 'ING_INF02', 165, 2, '2024-09-19 15:00:00', 5, 526, '2024-09-19 17:00:00');
insert into Orario values (663, 'ING_INF02', 166, 1, '2025-09-15 13:00:00', 5, 429, '2025-09-15 15:00:00');
insert into Orario values (664, 'ING_INF02', 166, 1, '2025-09-16 13:00:00', 5, 302, '2025-09-16 15:00:00');
insert into Orario values (665, 'ING_INF02', 166, 1, '2025-09-18 15:00:00', 5, 526, '2025-09-18 17:00:00');
insert into Orario values (666, 'ING_INF02', 167, 1, '2026-09-20 15:00:00', 5, 526, '2026-09-20 17:00:00');
insert into Orario values (667, 'ING_INF02', 167, 1, '2026-09-19 15:00:00', 5, 302, '2026-09-19 17:00:00');
insert into Orario values (668, 'ING_INF02', 167, 1, '2026-09-23 15:00:00', 5, 302, '2026-09-23 17:00:00');
insert into Orario values (669, 'ING_INF02', 168, 1, '2020-02-25 09:00:00', 5, 107, '2020-02-25 11:00:00');
insert into Orario values (670, 'ING_INF02', 168, 1, '2020-02-23 09:00:00', 5, 302, '2020-02-23 11:00:00');
insert into Orario values (671, 'ING_INF02', 168, 1, '2020-02-24 13:00:00', 5, 526, '2020-02-24 15:00:00');
insert into Orario values (672, 'ING_INF02', 169, 1, '2021-02-22 11:00:00', 5, 302, '2021-02-22 12:00:00');
insert into Orario values (673, 'ING_INF02', 169, 1, '2021-02-24 09:00:00', 5, 106, '2021-02-24 11:00:00');
insert into Orario values (674, 'ING_INF02', 169, 2, '2021-02-08 15:00:00', 5, 302, '2021-02-08 17:00:00');
insert into Orario values (675, 'ING_INF02', 169, 2, '2021-02-10 09:00:00', 5, 302, '2021-02-10 11:00:00');
insert into Orario values (676, 'ING_INF02', 170, 1, '2022-02-19 13:00:00', 5, 106, '2022-02-19 15:00:00');
insert into Orario values (677, 'ING_INF02', 170, 1, '2022-02-17 09:00:00', 5, 526, '2022-02-17 11:00:00');
insert into Orario values (678, 'ING_INF02', 170, 2, '2022-02-12 11:00:00', 5, 302, '2022-02-12 12:00:00');
insert into Orario values (679, 'ING_INF02', 170, 2, '2022-02-11 09:00:00', 5, 106, '2022-02-11 11:00:00');
insert into Orario values (680, 'ING_INF02', 171, 1, '2023-02-14 11:00:00', 5, 107, '2023-02-14 12:00:00');
insert into Orario values (681, 'ING_INF02', 171, 1, '2023-02-13 11:00:00', 5, 106, '2023-02-13 12:00:00');
insert into Orario values (682, 'ING_INF02', 171, 2, '2023-02-23 09:00:00', 5, 506, '2023-02-23 11:00:00');
insert into Orario values (683, 'ING_INF02', 171, 2, '2023-02-22 11:00:00', 5, 506, '2023-02-22 12:00:00');
insert into Orario values (684, 'ING_INF02', 171, 2, '2023-02-20 13:00:00', 5, 302, '2023-02-20 15:00:00');
insert into Orario values (685, 'ING_INF02', 172, 1, '2024-02-18 13:00:00', 5, 106, '2024-02-18 15:00:00');
insert into Orario values (686, 'ING_INF02', 172, 1, '2024-02-20 15:00:00', 5, 302, '2024-02-20 17:00:00');
insert into Orario values (687, 'ING_INF02', 172, 1, '2024-02-19 15:00:00', 5, 302, '2024-02-19 17:00:00');
insert into Orario values (688, 'ING_INF02', 172, 2, '2024-02-16 15:00:00', 5, 302, '2024-02-16 17:00:00');
insert into Orario values (689, 'ING_INF02', 172, 2, '2024-02-15 09:00:00', 5, 526, '2024-02-15 11:00:00');
insert into Orario values (690, 'ING_INF02', 172, 2, '2024-02-17 11:00:00', 5, 302, '2024-02-17 12:00:00');
insert into Orario values (691, 'ING_INF02', 173, 1, '2025-02-18 09:00:00', 5, 526, '2025-02-18 11:00:00');
insert into Orario values (692, 'ING_INF02', 173, 1, '2025-02-17 11:00:00', 5, 302, '2025-02-17 12:00:00');
insert into Orario values (693, 'ING_INF02', 173, 2, '2025-02-12 09:00:00', 5, 107, '2025-02-12 11:00:00');
insert into Orario values (694, 'ING_INF02', 173, 2, '2025-02-14 11:00:00', 5, 506, '2025-02-14 12:00:00');
insert into Orario values (695, 'ING_INF02', 174, 1, '2026-02-14 15:00:00', 5, 107, '2026-02-14 17:00:00');
insert into Orario values (696, 'ING_INF02', 174, 1, '2026-02-11 15:00:00', 5, 302, '2026-02-11 17:00:00');
insert into Orario values (697, 'ING_INF02', 174, 1, '2026-02-09 11:00:00', 5, 429, '2026-02-09 12:00:00');
insert into Orario values (698, 'ING_INF03', 175, 1, '2020-09-16 11:00:00', 5, 106, '2020-09-16 12:00:00');
insert into Orario values (699, 'ING_INF03', 175, 1, '2020-09-15 15:00:00', 5, 106, '2020-09-15 17:00:00');
insert into Orario values (700, 'ING_INF03', 176, 1, '2021-09-24 13:00:00', 5, 302, '2021-09-24 15:00:00');
insert into Orario values (701, 'ING_INF03', 176, 1, '2021-09-23 13:00:00', 5, 526, '2021-09-23 15:00:00');
insert into Orario values (702, 'ING_INF03', 176, 2, '2021-09-19 13:00:00', 5, 106, '2021-09-19 15:00:00');
insert into Orario values (703, 'ING_INF03', 176, 2, '2021-09-20 13:00:00', 5, 107, '2021-09-20 15:00:00');
insert into Orario values (704, 'ING_INF03', 177, 1, '2022-09-12 09:00:00', 5, 506, '2022-09-12 11:00:00');
insert into Orario values (705, 'ING_INF03', 177, 1, '2022-09-11 13:00:00', 5, 106, '2022-09-11 15:00:00');
insert into Orario values (706, 'ING_INF03', 178, 1, '2023-09-16 09:00:00', 5, 302, '2023-09-16 11:00:00');
insert into Orario values (707, 'ING_INF03', 178, 1, '2023-09-18 15:00:00', 5, 429, '2023-09-18 17:00:00');
insert into Orario values (708, 'ING_INF03', 179, 1, '2024-09-20 13:00:00', 5, 506, '2024-09-20 15:00:00');
insert into Orario values (709, 'ING_INF03', 179, 1, '2024-09-22 13:00:00', 5, 429, '2024-09-22 15:00:00');
insert into Orario values (710, 'ING_INF03', 179, 1, '2024-09-23 13:00:00', 5, 302, '2024-09-23 15:00:00');
insert into Orario values (711, 'ING_INF03', 180, 1, '2025-09-20 13:00:00', 5, 526, '2025-09-20 15:00:00');
insert into Orario values (712, 'ING_INF03', 180, 1, '2025-09-19 11:00:00', 5, 106, '2025-09-19 12:00:00');
insert into Orario values (713, 'ING_INF03', 180, 2, '2025-09-15 09:00:00', 5, 302, '2025-09-15 11:00:00');
insert into Orario values (714, 'ING_INF03', 180, 2, '2025-09-13 09:00:00', 5, 106, '2025-09-13 11:00:00');
insert into Orario values (715, 'ING_INF03', 180, 2, '2025-09-11 09:00:00', 5, 107, '2025-09-11 11:00:00');
insert into Orario values (716, 'ING_INF03', 181, 1, '2026-09-11 13:00:00', 5, 302, '2026-09-11 15:00:00');
insert into Orario values (717, 'ING_INF03', 181, 1, '2026-09-08 09:00:00', 5, 506, '2026-09-08 11:00:00');
insert into Orario values (718, 'ING_INF03', 182, 1, '2020-02-13 09:00:00', 5, 429, '2020-02-13 11:00:00');
insert into Orario values (719, 'ING_INF03', 182, 1, '2020-02-11 11:00:00', 5, 429, '2020-02-11 12:00:00');
insert into Orario values (720, 'ING_INF03', 182, 1, '2020-02-14 11:00:00', 5, 429, '2020-02-14 12:00:00');
insert into Orario values (721, 'ING_INF03', 183, 1, '2021-02-25 09:00:00', 5, 106, '2021-02-25 11:00:00');
insert into Orario values (722, 'ING_INF03', 183, 1, '2021-02-24 15:00:00', 5, 506, '2021-02-24 17:00:00');
insert into Orario values (723, 'ING_INF03', 184, 1, '2022-02-16 11:00:00', 5, 526, '2022-02-16 12:00:00');
insert into Orario values (724, 'ING_INF03', 184, 1, '2022-02-17 09:00:00', 5, 506, '2022-02-17 11:00:00');
insert into Orario values (725, 'ING_INF03', 185, 1, '2023-02-22 15:00:00', 5, 302, '2023-02-22 17:00:00');
insert into Orario values (726, 'ING_INF03', 185, 1, '2023-02-23 11:00:00', 5, 106, '2023-02-23 12:00:00');
insert into Orario values (727, 'ING_INF03', 185, 2, '2023-02-12 15:00:00', 5, 302, '2023-02-12 17:00:00');
insert into Orario values (728, 'ING_INF03', 185, 2, '2023-02-13 09:00:00', 5, 107, '2023-02-13 11:00:00');
insert into Orario values (729, 'ING_INF03', 186, 1, '2024-02-22 11:00:00', 5, 107, '2024-02-22 12:00:00');
insert into Orario values (730, 'ING_INF03', 186, 1, '2024-02-19 11:00:00', 5, 302, '2024-02-19 12:00:00');
insert into Orario values (731, 'ING_INF03', 187, 1, '2025-02-13 13:00:00', 5, 429, '2025-02-13 15:00:00');
insert into Orario values (732, 'ING_INF03', 187, 1, '2025-02-17 15:00:00', 5, 107, '2025-02-17 17:00:00');
insert into Orario values (733, 'ING_INF03', 187, 2, '2025-02-23 13:00:00', 5, 429, '2025-02-23 15:00:00');
insert into Orario values (734, 'ING_INF03', 187, 2, '2025-02-22 09:00:00', 5, 106, '2025-02-22 11:00:00');
insert into Orario values (735, 'ING_INF03', 187, 3, '2025-02-21 11:00:00', 5, 107, '2025-02-21 12:00:00');
insert into Orario values (736, 'ING_INF03', 187, 3, '2025-02-22 13:00:00', 5, 429, '2025-02-22 15:00:00');
insert into Orario values (737, 'ING_INF03', 187, 4, '2025-02-25 15:00:00', 5, 526, '2025-02-25 17:00:00');
insert into Orario values (738, 'ING_INF03', 187, 4, '2025-02-23 15:00:00', 5, 526, '2025-02-23 17:00:00');
insert into Orario values (739, 'ING_INF03', 187, 4, '2025-02-22 11:00:00', 5, 302, '2025-02-22 12:00:00');
insert into Orario values (740, 'ING_INF03', 188, 1, '2026-02-23 13:00:00', 5, 107, '2026-02-23 15:00:00');
insert into Orario values (741, 'ING_INF03', 188, 1, '2026-02-21 09:00:00', 5, 302, '2026-02-21 11:00:00');
insert into Orario values (742, 'ING_INF03', 188, 1, '2026-02-25 11:00:00', 5, 429, '2026-02-25 12:00:00');
insert into Orario values (743, 'ING_INF01', 189, 1, '2020-09-21 11:00:00', 5, 107, '2020-09-21 12:00:00');
insert into Orario values (744, 'ING_INF01', 189, 1, '2020-09-24 09:00:00', 5, 506, '2020-09-24 11:00:00');
insert into Orario values (745, 'ING_INF01', 189, 1, '2020-09-23 13:00:00', 5, 526, '2020-09-23 15:00:00');
insert into Orario values (746, 'ING_INF01', 189, 2, '2020-09-22 09:00:00', 5, 429, '2020-09-22 11:00:00');
insert into Orario values (747, 'ING_INF01', 189, 2, '2020-09-24 11:00:00', 5, 506, '2020-09-24 12:00:00');
insert into Orario values (748, 'ING_INF01', 189, 2, '2020-09-19 09:00:00', 5, 107, '2020-09-19 11:00:00');
insert into Orario values (749, 'ING_INF01', 190, 1, '2021-09-17 11:00:00', 5, 302, '2021-09-17 12:00:00');
insert into Orario values (750, 'ING_INF01', 190, 1, '2021-09-20 09:00:00', 5, 526, '2021-09-20 11:00:00');
insert into Orario values (751, 'ING_INF01', 191, 1, '2022-09-22 09:00:00', 5, 106, '2022-09-22 11:00:00');
insert into Orario values (752, 'ING_INF01', 191, 1, '2022-09-23 15:00:00', 5, 429, '2022-09-23 17:00:00');
insert into Orario values (753, 'ING_INF01', 191, 1, '2022-09-24 09:00:00', 5, 106, '2022-09-24 11:00:00');
insert into Orario values (754, 'ING_INF01', 191, 2, '2022-09-19 15:00:00', 5, 302, '2022-09-19 17:00:00');
insert into Orario values (755, 'ING_INF01', 191, 2, '2022-09-23 13:00:00', 5, 106, '2022-09-23 15:00:00');
insert into Orario values (756, 'ING_INF01', 191, 2, '2022-09-21 09:00:00', 5, 106, '2022-09-21 11:00:00');
insert into Orario values (757, 'ING_INF01', 192, 1, '2023-09-24 11:00:00', 5, 429, '2023-09-24 12:00:00');
insert into Orario values (758, 'ING_INF01', 192, 1, '2023-09-21 09:00:00', 5, 506, '2023-09-21 11:00:00');
insert into Orario values (759, 'ING_INF01', 193, 1, '2024-09-13 11:00:00', 5, 302, '2024-09-13 12:00:00');
insert into Orario values (760, 'ING_INF01', 193, 1, '2024-09-14 15:00:00', 5, 107, '2024-09-14 17:00:00');
insert into Orario values (761, 'ING_INF01', 193, 2, '2024-09-17 09:00:00', 5, 526, '2024-09-17 11:00:00');
insert into Orario values (762, 'ING_INF01', 193, 2, '2024-09-22 11:00:00', 5, 106, '2024-09-22 12:00:00');
insert into Orario values (763, 'ING_INF01', 193, 3, '2024-09-14 13:00:00', 5, 302, '2024-09-14 15:00:00');
insert into Orario values (764, 'ING_INF01', 193, 3, '2024-09-17 15:00:00', 5, 526, '2024-09-17 17:00:00');
insert into Orario values (765, 'ING_INF01', 193, 3, '2024-09-16 11:00:00', 5, 302, '2024-09-16 12:00:00');
insert into Orario values (766, 'ING_INF01', 193, 4, '2024-09-17 13:00:00', 5, 429, '2024-09-17 15:00:00');
insert into Orario values (767, 'ING_INF01', 193, 4, '2024-09-16 13:00:00', 5, 107, '2024-09-16 15:00:00');
insert into Orario values (768, 'ING_INF01', 194, 1, '2025-09-13 13:00:00', 5, 106, '2025-09-13 15:00:00');
insert into Orario values (769, 'ING_INF01', 194, 1, '2025-09-16 11:00:00', 5, 302, '2025-09-16 12:00:00');
insert into Orario values (770, 'ING_INF01', 195, 1, '2026-09-12 11:00:00', 5, 107, '2026-09-12 12:00:00');
insert into Orario values (771, 'ING_INF01', 195, 1, '2026-09-11 13:00:00', 5, 106, '2026-09-11 15:00:00');
insert into Orario values (772, 'ING_INF01', 195, 1, '2026-09-10 11:00:00', 5, 302, '2026-09-10 12:00:00');
insert into Orario values (773, 'ING_INF01', 196, 1, '2020-02-12 09:00:00', 6, 119, '2020-02-12 11:00:00');
insert into Orario values (774, 'ING_INF01', 196, 1, '2020-02-14 11:00:00', 6, 507, '2020-02-14 12:00:00');
insert into Orario values (775, 'ING_INF01', 197, 1, '2021-02-24 09:00:00', 6, 507, '2021-02-24 11:00:00');
insert into Orario values (776, 'ING_INF01', 197, 1, '2021-02-26 11:00:00', 6, 313, '2021-02-26 12:00:00');
insert into Orario values (777, 'ING_INF01', 197, 1, '2021-02-21 13:00:00', 6, 119, '2021-02-21 15:00:00');
insert into Orario values (778, 'ING_INF01', 197, 2, '2021-02-10 09:00:00', 6, 507, '2021-02-10 11:00:00');
insert into Orario values (779, 'ING_INF01', 197, 2, '2021-02-09 11:00:00', 6, 507, '2021-02-09 12:00:00');
insert into Orario values (780, 'ING_INF01', 197, 2, '2021-02-11 13:00:00', 6, 507, '2021-02-11 15:00:00');
insert into Orario values (781, 'ING_INF01', 198, 1, '2022-02-20 11:00:00', 6, 507, '2022-02-20 12:00:00');
insert into Orario values (782, 'ING_INF01', 198, 1, '2022-02-25 11:00:00', 6, 313, '2022-02-25 12:00:00');
insert into Orario values (783, 'ING_INF01', 198, 1, '2022-02-24 15:00:00', 6, 119, '2022-02-24 17:00:00');
insert into Orario values (784, 'ING_INF01', 198, 2, '2022-02-09 15:00:00', 6, 313, '2022-02-09 17:00:00');
insert into Orario values (785, 'ING_INF01', 198, 2, '2022-02-10 11:00:00', 6, 119, '2022-02-10 12:00:00');
insert into Orario values (786, 'ING_INF01', 199, 1, '2023-02-20 09:00:00', 6, 507, '2023-02-20 11:00:00');
insert into Orario values (787, 'ING_INF01', 199, 1, '2023-02-18 09:00:00', 6, 119, '2023-02-18 11:00:00');
insert into Orario values (788, 'ING_INF01', 200, 1, '2024-02-20 13:00:00', 6, 507, '2024-02-20 15:00:00');
insert into Orario values (789, 'ING_INF01', 200, 1, '2024-02-25 11:00:00', 6, 119, '2024-02-25 12:00:00');
insert into Orario values (790, 'ING_INF01', 200, 2, '2024-02-24 09:00:00', 6, 507, '2024-02-24 11:00:00');
insert into Orario values (791, 'ING_INF01', 200, 2, '2024-02-25 13:00:00', 6, 313, '2024-02-25 15:00:00');
insert into Orario values (792, 'ING_INF01', 200, 2, '2024-02-23 13:00:00', 6, 507, '2024-02-23 15:00:00');
insert into Orario values (793, 'ING_INF01', 201, 1, '2025-02-20 15:00:00', 6, 313, '2025-02-20 17:00:00');
insert into Orario values (794, 'ING_INF01', 201, 1, '2025-02-19 09:00:00', 6, 119, '2025-02-19 11:00:00');
insert into Orario values (795, 'ING_INF01', 202, 1, '2026-02-14 09:00:00', 6, 313, '2026-02-14 11:00:00');
insert into Orario values (796, 'ING_INF01', 202, 1, '2026-02-16 13:00:00', 6, 119, '2026-02-16 15:00:00');
insert into Orario values (797, 'INF01', 203, 1, '2020-09-19 13:00:00', 6, 119, '2020-09-19 15:00:00');
insert into Orario values (798, 'INF01', 203, 1, '2020-09-21 09:00:00', 6, 313, '2020-09-21 11:00:00');
insert into Orario values (799, 'INF01', 203, 1, '2020-09-17 15:00:00', 6, 507, '2020-09-17 17:00:00');
insert into Orario values (800, 'INF01', 204, 1, '2021-09-14 13:00:00', 6, 507, '2021-09-14 15:00:00');
insert into Orario values (801, 'INF01', 204, 1, '2021-09-12 13:00:00', 6, 119, '2021-09-12 15:00:00');
insert into Orario values (802, 'INF01', 205, 1, '2022-09-20 11:00:00', 6, 119, '2022-09-20 12:00:00');
insert into Orario values (803, 'INF01', 205, 1, '2022-09-19 15:00:00', 6, 313, '2022-09-19 17:00:00');
insert into Orario values (804, 'INF01', 205, 1, '2022-09-18 11:00:00', 6, 313, '2022-09-18 12:00:00');
insert into Orario values (805, 'INF01', 206, 1, '2023-09-17 11:00:00', 6, 313, '2023-09-17 12:00:00');
insert into Orario values (806, 'INF01', 206, 1, '2023-09-16 15:00:00', 6, 313, '2023-09-16 17:00:00');
insert into Orario values (807, 'INF01', 206, 1, '2023-09-15 09:00:00', 6, 313, '2023-09-15 11:00:00');
insert into Orario values (808, 'INF01', 206, 2, '2023-09-08 09:00:00', 6, 119, '2023-09-08 11:00:00');
insert into Orario values (809, 'INF01', 206, 2, '2023-09-10 11:00:00', 6, 507, '2023-09-10 12:00:00');
insert into Orario values (810, 'INF01', 206, 3, '2023-09-20 09:00:00', 6, 119, '2023-09-20 11:00:00');
insert into Orario values (811, 'INF01', 206, 3, '2023-09-19 11:00:00', 6, 507, '2023-09-19 12:00:00');
insert into Orario values (812, 'INF01', 206, 4, '2023-09-19 15:00:00', 6, 313, '2023-09-19 17:00:00');
insert into Orario values (813, 'INF01', 206, 4, '2023-09-21 15:00:00', 6, 313, '2023-09-21 17:00:00');
insert into Orario values (814, 'INF01', 207, 1, '2024-09-20 11:00:00', 6, 507, '2024-09-20 12:00:00');
insert into Orario values (815, 'INF01', 207, 1, '2024-09-22 15:00:00', 6, 507, '2024-09-22 17:00:00');
insert into Orario values (816, 'INF01', 207, 2, '2024-09-12 13:00:00', 6, 313, '2024-09-12 15:00:00');
insert into Orario values (817, 'INF01', 207, 2, '2024-09-13 09:00:00', 6, 119, '2024-09-13 11:00:00');
insert into Orario values (818, 'INF01', 208, 1, '2025-09-16 15:00:00', 6, 507, '2025-09-16 17:00:00');
insert into Orario values (819, 'INF01', 208, 1, '2025-09-19 15:00:00', 6, 119, '2025-09-19 17:00:00');
insert into Orario values (820, 'INF01', 209, 1, '2026-09-17 15:00:00', 6, 313, '2026-09-17 17:00:00');
insert into Orario values (821, 'INF01', 209, 1, '2026-09-19 15:00:00', 6, 507, '2026-09-19 17:00:00');
insert into Orario values (822, 'INF01', 209, 1, '2026-09-21 09:00:00', 6, 507, '2026-09-21 11:00:00');
insert into Orario values (823, 'ING_INF03', 210, 1, '2020-09-20 13:00:00', 6, 119, '2020-09-20 15:00:00');
insert into Orario values (824, 'ING_INF03', 210, 1, '2020-09-21 13:00:00', 6, 507, '2020-09-21 15:00:00');
insert into Orario values (825, 'ING_INF03', 210, 1, '2020-09-22 09:00:00', 6, 119, '2020-09-22 11:00:00');
insert into Orario values (826, 'ING_INF03', 211, 1, '2021-09-20 13:00:00', 6, 119, '2021-09-20 15:00:00');
insert into Orario values (827, 'ING_INF03', 211, 1, '2021-09-16 09:00:00', 6, 507, '2021-09-16 11:00:00');
insert into Orario values (828, 'ING_INF03', 211, 1, '2021-09-17 15:00:00', 6, 507, '2021-09-17 17:00:00');
insert into Orario values (829, 'ING_INF03', 212, 1, '2022-09-13 11:00:00', 6, 119, '2022-09-13 12:00:00');
insert into Orario values (830, 'ING_INF03', 212, 1, '2022-09-16 13:00:00', 6, 507, '2022-09-16 15:00:00');
insert into Orario values (831, 'ING_INF03', 212, 1, '2022-09-12 15:00:00', 6, 507, '2022-09-12 17:00:00');
insert into Orario values (832, 'ING_INF03', 213, 1, '2023-09-09 15:00:00', 6, 313, '2023-09-09 17:00:00');
insert into Orario values (833, 'ING_INF03', 213, 1, '2023-09-13 15:00:00', 6, 507, '2023-09-13 17:00:00');
insert into Orario values (834, 'ING_INF03', 213, 1, '2023-09-14 13:00:00', 6, 507, '2023-09-14 15:00:00');
insert into Orario values (835, 'ING_INF03', 214, 1, '2024-09-11 09:00:00', 6, 119, '2024-09-11 11:00:00');
insert into Orario values (836, 'ING_INF03', 214, 1, '2024-09-13 09:00:00', 6, 313, '2024-09-13 11:00:00');
insert into Orario values (837, 'ING_INF03', 214, 1, '2024-09-12 09:00:00', 6, 507, '2024-09-12 11:00:00');
insert into Orario values (838, 'ING_INF03', 215, 1, '2025-09-22 11:00:00', 6, 313, '2025-09-22 12:00:00');
insert into Orario values (839, 'ING_INF03', 215, 1, '2025-09-21 11:00:00', 6, 507, '2025-09-21 12:00:00');
insert into Orario values (840, 'ING_INF03', 215, 1, '2025-09-25 11:00:00', 6, 119, '2025-09-25 12:00:00');
insert into Orario values (841, 'ING_INF03', 215, 2, '2025-09-19 15:00:00', 6, 507, '2025-09-19 17:00:00');
insert into Orario values (842, 'ING_INF03', 215, 2, '2025-09-21 09:00:00', 6, 119, '2025-09-21 11:00:00');
insert into Orario values (843, 'ING_INF03', 216, 1, '2026-09-22 11:00:00', 6, 119, '2026-09-22 12:00:00');
insert into Orario values (844, 'ING_INF03', 216, 1, '2026-09-19 15:00:00', 6, 313, '2026-09-19 17:00:00');
insert into Orario values (845, 'ING_INF03', 216, 1, '2026-09-23 15:00:00', 6, 313, '2026-09-23 17:00:00');
insert into Orario values (846, 'ING_INF03', 216, 2, '2026-09-14 09:00:00', 6, 119, '2026-09-14 11:00:00');
insert into Orario values (847, 'ING_INF03', 216, 2, '2026-09-13 09:00:00', 6, 507, '2026-09-13 11:00:00');
insert into Orario values (848, 'ING_INF03', 217, 1, '2020-02-13 13:00:00', 7, 302, '2020-02-13 15:00:00');
insert into Orario values (849, 'ING_INF03', 217, 1, '2020-02-12 13:00:00', 7, 109, '2020-02-12 15:00:00');
insert into Orario values (850, 'ING_INF03', 217, 1, '2020-02-15 11:00:00', 7, 513, '2020-02-15 12:00:00');
insert into Orario values (851, 'ING_INF03', 217, 2, '2020-02-18 09:00:00', 7, 302, '2020-02-18 11:00:00');
insert into Orario values (852, 'ING_INF03', 217, 2, '2020-02-17 15:00:00', 7, 302, '2020-02-17 17:00:00');
insert into Orario values (853, 'ING_INF03', 217, 3, '2020-02-09 09:00:00', 7, 513, '2020-02-09 11:00:00');
insert into Orario values (854, 'ING_INF03', 217, 3, '2020-02-13 11:00:00', 7, 302, '2020-02-13 12:00:00');
insert into Orario values (855, 'ING_INF03', 217, 4, '2020-02-22 09:00:00', 7, 302, '2020-02-22 11:00:00');
insert into Orario values (856, 'ING_INF03', 217, 4, '2020-02-25 09:00:00', 7, 101, '2020-02-25 11:00:00');
insert into Orario values (857, 'ING_INF03', 218, 1, '2021-02-11 15:00:00', 7, 302, '2021-02-11 17:00:00');
insert into Orario values (858, 'ING_INF03', 218, 1, '2021-02-12 09:00:00', 7, 513, '2021-02-12 11:00:00');
insert into Orario values (859, 'ING_INF03', 218, 2, '2021-02-26 11:00:00', 7, 513, '2021-02-26 12:00:00');
insert into Orario values (860, 'ING_INF03', 218, 2, '2021-02-23 15:00:00', 7, 101, '2021-02-23 17:00:00');
insert into Orario values (861, 'ING_INF03', 218, 2, '2021-02-25 11:00:00', 7, 109, '2021-02-25 12:00:00');
insert into Orario values (862, 'ING_INF03', 219, 1, '2022-02-18 13:00:00', 7, 109, '2022-02-18 15:00:00');
insert into Orario values (863, 'ING_INF03', 219, 1, '2022-02-19 09:00:00', 7, 101, '2022-02-19 11:00:00');
insert into Orario values (864, 'ING_INF03', 219, 1, '2022-02-22 13:00:00', 7, 101, '2022-02-22 15:00:00');
insert into Orario values (865, 'ING_INF03', 219, 2, '2022-02-18 15:00:00', 7, 109, '2022-02-18 17:00:00');
insert into Orario values (866, 'ING_INF03', 219, 2, '2022-02-17 09:00:00', 7, 101, '2022-02-17 11:00:00');
insert into Orario values (867, 'ING_INF03', 219, 2, '2022-02-20 11:00:00', 7, 101, '2022-02-20 12:00:00');
insert into Orario values (868, 'ING_INF03', 220, 1, '2023-02-12 11:00:00', 7, 101, '2023-02-12 12:00:00');
insert into Orario values (869, 'ING_INF03', 220, 1, '2023-02-15 09:00:00', 7, 101, '2023-02-15 11:00:00');
insert into Orario values (870, 'ING_INF03', 220, 2, '2023-02-16 13:00:00', 7, 109, '2023-02-16 15:00:00');
insert into Orario values (871, 'ING_INF03', 220, 2, '2023-02-11 13:00:00', 7, 109, '2023-02-11 15:00:00');
insert into Orario values (872, 'ING_INF03', 221, 1, '2024-02-20 09:00:00', 7, 513, '2024-02-20 11:00:00');
insert into Orario values (873, 'ING_INF03', 221, 1, '2024-02-23 13:00:00', 7, 302, '2024-02-23 15:00:00');
insert into Orario values (874, 'ING_INF03', 221, 1, '2024-02-19 11:00:00', 7, 513, '2024-02-19 12:00:00');
insert into Orario values (875, 'ING_INF03', 221, 2, '2024-02-10 15:00:00', 7, 101, '2024-02-10 17:00:00');
insert into Orario values (876, 'ING_INF03', 221, 2, '2024-02-14 15:00:00', 7, 513, '2024-02-14 17:00:00');
insert into Orario values (877, 'ING_INF03', 222, 1, '2025-02-22 13:00:00', 7, 109, '2025-02-22 15:00:00');
insert into Orario values (878, 'ING_INF03', 222, 1, '2025-02-23 11:00:00', 7, 109, '2025-02-23 12:00:00');
insert into Orario values (879, 'ING_INF03', 222, 2, '2025-02-13 15:00:00', 7, 109, '2025-02-13 17:00:00');
insert into Orario values (880, 'ING_INF03', 222, 2, '2025-02-12 13:00:00', 7, 109, '2025-02-12 15:00:00');
insert into Orario values (881, 'ING_INF03', 223, 1, '2026-02-16 15:00:00', 7, 101, '2026-02-16 17:00:00');
insert into Orario values (882, 'ING_INF03', 223, 1, '2026-02-12 11:00:00', 7, 302, '2026-02-12 12:00:00');
insert into Orario values (883, 'ING_INF03', 223, 1, '2026-02-15 11:00:00', 7, 302, '2026-02-15 12:00:00');
insert into Orario values (884, 'ING_INF03', 223, 2, '2026-02-12 13:00:00', 7, 109, '2026-02-12 15:00:00');
insert into Orario values (885, 'ROB01', 224, 1, '2020-09-22 15:00:00', 7, 302, '2020-09-22 17:00:00');
insert into Orario values (886, 'ROB01', 224, 1, '2020-09-27 11:00:00', 7, 302, '2020-09-27 12:00:00');
insert into Orario values (887, 'ROB01', 224, 1, '2020-09-26 09:00:00', 7, 101, '2020-09-26 11:00:00');
insert into Orario values (888, 'ROB01', 224, 2, '2020-09-22 11:00:00', 7, 302, '2020-09-22 12:00:00');
insert into Orario values (889, 'ROB01', 224, 2, '2020-09-20 15:00:00', 7, 302, '2020-09-20 17:00:00');
insert into Orario values (890, 'ROB01', 225, 1, '2021-09-19 13:00:00', 7, 101, '2021-09-19 15:00:00');
insert into Orario values (891, 'ROB01', 225, 1, '2021-09-18 11:00:00', 7, 513, '2021-09-18 12:00:00');
insert into Orario values (892, 'ROB01', 225, 1, '2021-09-21 11:00:00', 7, 302, '2021-09-21 12:00:00');
insert into Orario values (893, 'ROB01', 225, 2, '2021-09-18 13:00:00', 7, 513, '2021-09-18 15:00:00');
insert into Orario values (894, 'ROB01', 225, 2, '2021-09-20 13:00:00', 7, 109, '2021-09-20 15:00:00');
insert into Orario values (895, 'ROB01', 226, 1, '2022-09-15 15:00:00', 7, 109, '2022-09-15 17:00:00');
insert into Orario values (896, 'ROB01', 226, 1, '2022-09-13 15:00:00', 7, 101, '2022-09-13 17:00:00');
insert into Orario values (897, 'ROB01', 227, 1, '2023-09-21 11:00:00', 7, 302, '2023-09-21 12:00:00');
insert into Orario values (898, 'ROB01', 227, 1, '2023-09-19 15:00:00', 7, 513, '2023-09-19 17:00:00');
insert into Orario values (899, 'ROB01', 228, 1, '2024-09-12 09:00:00', 7, 109, '2024-09-12 11:00:00');
insert into Orario values (900, 'ROB01', 228, 1, '2024-09-14 15:00:00', 7, 513, '2024-09-14 17:00:00');
insert into Orario values (901, 'ROB01', 229, 1, '2025-09-12 13:00:00', 7, 101, '2025-09-12 15:00:00');
insert into Orario values (902, 'ROB01', 229, 1, '2025-09-15 13:00:00', 7, 101, '2025-09-15 15:00:00');
insert into Orario values (903, 'ROB01', 229, 1, '2025-09-14 09:00:00', 7, 101, '2025-09-14 11:00:00');
insert into Orario values (904, 'ROB01', 229, 2, '2025-09-19 13:00:00', 7, 109, '2025-09-19 15:00:00');
insert into Orario values (905, 'ROB01', 229, 2, '2025-09-17 13:00:00', 7, 302, '2025-09-17 15:00:00');
insert into Orario values (906, 'ROB01', 229, 2, '2025-09-16 15:00:00', 7, 101, '2025-09-16 17:00:00');
insert into Orario values (907, 'ROB01', 230, 1, '2026-09-08 11:00:00', 7, 302, '2026-09-08 12:00:00');
insert into Orario values (908, 'ROB01', 230, 1, '2026-09-11 13:00:00', 7, 513, '2026-09-11 15:00:00');
insert into Orario values (909, 'ROB01', 230, 2, '2026-09-19 15:00:00', 7, 513, '2026-09-19 17:00:00');
insert into Orario values (910, 'ROB01', 230, 2, '2026-09-24 13:00:00', 7, 101, '2026-09-24 15:00:00');
insert into Orario values (911, 'ROB01', 230, 3, '2026-09-16 11:00:00', 7, 302, '2026-09-16 12:00:00');
insert into Orario values (912, 'ROB01', 230, 3, '2026-09-18 15:00:00', 7, 101, '2026-09-18 17:00:00');
insert into Orario values (913, 'ROB01', 230, 4, '2026-09-09 11:00:00', 7, 513, '2026-09-09 12:00:00');
insert into Orario values (914, 'ROB01', 230, 4, '2026-09-12 09:00:00', 7, 513, '2026-09-12 11:00:00');
insert into Orario values (915, 'ROB01', 231, 1, '2020-02-15 09:00:00', 7, 109, '2020-02-15 11:00:00');
insert into Orario values (916, 'ROB01', 231, 1, '2020-02-14 15:00:00', 7, 513, '2020-02-14 17:00:00');
insert into Orario values (917, 'ROB01', 231, 1, '2020-02-17 15:00:00', 7, 513, '2020-02-17 17:00:00');
insert into Orario values (918, 'ROB01', 232, 1, '2021-02-17 11:00:00', 7, 513, '2021-02-17 12:00:00');
insert into Orario values (919, 'ROB01', 232, 1, '2021-02-13 13:00:00', 7, 302, '2021-02-13 15:00:00');
insert into Orario values (920, 'ROB01', 232, 2, '2021-02-13 15:00:00', 7, 109, '2021-02-13 17:00:00');
insert into Orario values (921, 'ROB01', 232, 2, '2021-02-11 11:00:00', 7, 101, '2021-02-11 12:00:00');
insert into Orario values (922, 'ROB01', 232, 2, '2021-02-10 15:00:00', 7, 302, '2021-02-10 17:00:00');
insert into Orario values (923, 'ROB01', 232, 3, '2021-02-15 11:00:00', 7, 302, '2021-02-15 12:00:00');
insert into Orario values (924, 'ROB01', 232, 3, '2021-02-14 09:00:00', 7, 302, '2021-02-14 11:00:00');
insert into Orario values (925, 'ROB01', 232, 4, '2021-02-14 15:00:00', 7, 513, '2021-02-14 17:00:00');
insert into Orario values (926, 'ROB01', 233, 1, '2022-02-16 15:00:00', 7, 513, '2022-02-16 17:00:00');
insert into Orario values (927, 'ROB01', 233, 1, '2022-02-18 11:00:00', 7, 302, '2022-02-18 12:00:00');
insert into Orario values (928, 'ROB01', 234, 1, '2023-02-13 13:00:00', 7, 513, '2023-02-13 15:00:00');
insert into Orario values (929, 'ROB01', 234, 1, '2023-02-16 09:00:00', 7, 109, '2023-02-16 11:00:00');
insert into Orario values (930, 'ROB01', 234, 1, '2023-02-15 13:00:00', 7, 101, '2023-02-15 15:00:00');
insert into Orario values (931, 'ROB01', 234, 2, '2023-02-19 15:00:00', 7, 109, '2023-02-19 17:00:00');
insert into Orario values (932, 'ROB01', 234, 2, '2023-02-21 09:00:00', 7, 101, '2023-02-21 11:00:00');
insert into Orario values (933, 'ROB01', 234, 2, '2023-02-23 13:00:00', 7, 302, '2023-02-23 15:00:00');
insert into Orario values (934, 'ROB01', 234, 3, '2023-02-24 15:00:00', 7, 101, '2023-02-24 17:00:00');
insert into Orario values (935, 'ROB01', 234, 4, '2023-02-23 11:00:00', 7, 101, '2023-02-23 12:00:00');
insert into Orario values (936, 'ROB01', 234, 4, '2023-02-24 11:00:00', 7, 302, '2023-02-24 12:00:00');
insert into Orario values (937, 'ROB01', 235, 1, '2024-02-20 15:00:00', 7, 302, '2024-02-20 17:00:00');
insert into Orario values (938, 'ROB01', 235, 1, '2024-02-18 13:00:00', 7, 101, '2024-02-18 15:00:00');
insert into Orario values (939, 'ROB01', 236, 1, '2025-02-15 09:00:00', 7, 302, '2025-02-15 11:00:00');
insert into Orario values (940, 'ROB01', 236, 1, '2025-02-17 11:00:00', 7, 101, '2025-02-17 12:00:00');
insert into Orario values (941, 'ROB01', 236, 2, '2025-02-18 15:00:00', 7, 101, '2025-02-18 17:00:00');
insert into Orario values (942, 'ROB01', 236, 2, '2025-02-19 13:00:00', 7, 513, '2025-02-19 15:00:00');
insert into Orario values (943, 'ROB01', 236, 2, '2025-02-20 09:00:00', 7, 513, '2025-02-20 11:00:00');
insert into Orario values (944, 'ROB01', 237, 1, '2026-02-20 09:00:00', 7, 513, '2026-02-20 11:00:00');
insert into Orario values (945, 'ROB01', 237, 1, '2026-02-18 15:00:00', 7, 109, '2026-02-18 17:00:00');
insert into Orario values (946, 'ROB01', 237, 1, '2026-02-21 09:00:00', 7, 109, '2026-02-21 11:00:00');
insert into Orario values (947, 'ROB01', 237, 2, '2026-02-20 11:00:00', 7, 109, '2026-02-20 12:00:00');
insert into Orario values (948, 'ROB01', 237, 2, '2026-02-21 15:00:00', 7, 101, '2026-02-21 17:00:00');
insert into Orario values (949, 'ARC01', 238, 1, '2020-09-22 13:00:00', 7, 302, '2020-09-22 15:00:00');
insert into Orario values (950, 'ARC01', 238, 1, '2020-09-27 13:00:00', 7, 513, '2020-09-27 15:00:00');
insert into Orario values (951, 'ARC01', 238, 1, '2020-09-24 11:00:00', 7, 109, '2020-09-24 12:00:00');
insert into Orario values (952, 'ARC01', 239, 1, '2021-09-23 13:00:00', 7, 109, '2021-09-23 15:00:00');
insert into Orario values (953, 'ARC01', 239, 1, '2021-09-24 11:00:00', 7, 109, '2021-09-24 12:00:00');
insert into Orario values (954, 'ARC01', 239, 2, '2021-09-12 15:00:00', 7, 101, '2021-09-12 17:00:00');
insert into Orario values (955, 'ARC01', 239, 2, '2021-09-11 15:00:00', 7, 109, '2021-09-11 17:00:00');
insert into Orario values (956, 'ARC01', 240, 1, '2022-09-12 13:00:00', 7, 513, '2022-09-12 15:00:00');
insert into Orario values (957, 'ARC01', 240, 1, '2022-09-13 15:00:00', 7, 513, '2022-09-13 17:00:00');
insert into Orario values (958, 'ARC01', 240, 1, '2022-09-14 13:00:00', 7, 101, '2022-09-14 15:00:00');
insert into Orario values (959, 'ARC01', 240, 2, '2022-09-10 13:00:00', 7, 513, '2022-09-10 15:00:00');
insert into Orario values (960, 'ARC01', 240, 2, '2022-09-09 15:00:00', 7, 513, '2022-09-09 17:00:00');
insert into Orario values (961, 'ARC01', 241, 1, '2023-09-18 11:00:00', 7, 302, '2023-09-18 12:00:00');
insert into Orario values (962, 'ARC01', 241, 1, '2023-09-17 15:00:00', 7, 513, '2023-09-17 17:00:00');
insert into Orario values (963, 'ARC01', 241, 1, '2023-09-19 13:00:00', 7, 101, '2023-09-19 15:00:00');
insert into Orario values (964, 'ARC01', 241, 2, '2023-09-16 15:00:00', 7, 513, '2023-09-16 17:00:00');
insert into Orario values (965, 'ARC01', 241, 2, '2023-09-14 09:00:00', 7, 101, '2023-09-14 11:00:00');
insert into Orario values (966, 'ARC01', 241, 2, '2023-09-11 15:00:00', 7, 302, '2023-09-11 17:00:00');
insert into Orario values (967, 'ARC01', 242, 1, '2024-09-21 09:00:00', 7, 302, '2024-09-21 11:00:00');
insert into Orario values (968, 'ARC01', 242, 1, '2024-09-25 09:00:00', 7, 101, '2024-09-25 11:00:00');
insert into Orario values (969, 'ARC01', 242, 1, '2024-09-22 11:00:00', 7, 302, '2024-09-22 12:00:00');
insert into Orario values (970, 'ARC01', 242, 2, '2024-09-11 11:00:00', 7, 513, '2024-09-11 12:00:00');
insert into Orario values (971, 'ARC01', 242, 2, '2024-09-14 09:00:00', 7, 101, '2024-09-14 11:00:00');
insert into Orario values (972, 'ARC01', 242, 2, '2024-09-09 13:00:00', 7, 302, '2024-09-09 15:00:00');
insert into Orario values (973, 'ARC01', 243, 1, '2025-09-15 15:00:00', 7, 302, '2025-09-15 17:00:00');
insert into Orario values (974, 'ARC01', 243, 1, '2025-09-16 09:00:00', 7, 109, '2025-09-16 11:00:00');
insert into Orario values (975, 'ARC01', 244, 1, '2026-09-22 09:00:00', 7, 101, '2026-09-22 11:00:00');
insert into Orario values (976, 'ARC01', 244, 1, '2026-09-26 09:00:00', 7, 302, '2026-09-26 11:00:00');
insert into Orario values (977, 'ARC01', 244, 2, '2026-09-19 09:00:00', 7, 109, '2026-09-19 11:00:00');
insert into Orario values (978, 'ARC01', 244, 2, '2026-09-20 11:00:00', 7, 101, '2026-09-20 12:00:00');
insert into Orario values (979, 'ARC01', 244, 2, '2026-09-16 13:00:00', 7, 101, '2026-09-16 15:00:00');
insert into Orario values (980, 'ARC01', 244, 3, '2026-09-24 11:00:00', 7, 109, '2026-09-24 12:00:00');
insert into Orario values (981, 'ARC01', 244, 3, '2026-09-22 15:00:00', 7, 109, '2026-09-22 17:00:00');
insert into Orario values (982, 'ARC01', 244, 3, '2026-09-25 09:00:00', 7, 302, '2026-09-25 11:00:00');
insert into Orario values (983, 'ARC01', 244, 4, '2026-09-12 15:00:00', 7, 513, '2026-09-12 17:00:00');
insert into Orario values (984, 'ARC01', 244, 4, '2026-09-15 09:00:00', 7, 109, '2026-09-15 11:00:00');
insert into Orario values (985, 'DES01', 245, 1, '2020-09-15 13:00:00', 7, 302, '2020-09-15 15:00:00');
insert into Orario values (986, 'DES01', 245, 1, '2020-09-16 13:00:00', 7, 109, '2020-09-16 15:00:00');
insert into Orario values (987, 'DES01', 245, 1, '2020-09-14 11:00:00', 7, 109, '2020-09-14 12:00:00');
insert into Orario values (988, 'DES01', 246, 1, '2021-09-19 09:00:00', 7, 109, '2021-09-19 11:00:00');
insert into Orario values (989, 'DES01', 246, 1, '2021-09-21 13:00:00', 7, 513, '2021-09-21 15:00:00');
insert into Orario values (990, 'DES01', 246, 2, '2021-09-24 13:00:00', 7, 101, '2021-09-24 15:00:00');
insert into Orario values (991, 'DES01', 246, 2, '2021-09-27 11:00:00', 7, 101, '2021-09-27 12:00:00');
insert into Orario values (992, 'DES01', 246, 3, '2021-09-20 15:00:00', 7, 302, '2021-09-20 17:00:00');
insert into Orario values (993, 'DES01', 246, 3, '2021-09-23 13:00:00', 7, 513, '2021-09-23 15:00:00');
insert into Orario values (994, 'DES01', 246, 3, '2021-09-24 09:00:00', 7, 101, '2021-09-24 11:00:00');
insert into Orario values (995, 'DES01', 246, 4, '2021-09-14 11:00:00', 7, 101, '2021-09-14 12:00:00');
insert into Orario values (996, 'DES01', 246, 4, '2021-09-15 11:00:00', 7, 101, '2021-09-15 12:00:00');
insert into Orario values (997, 'DES01', 247, 1, '2022-09-27 15:00:00', 7, 109, '2022-09-27 17:00:00');
insert into Orario values (998, 'DES01', 247, 1, '2022-09-23 09:00:00', 7, 302, '2022-09-23 11:00:00');
insert into Orario values (999, 'DES01', 247, 1, '2022-09-26 15:00:00', 7, 513, '2022-09-26 17:00:00');
insert into Orario values (1000, 'DES01', 248, 1, '2023-09-16 15:00:00', 7, 109, '2023-09-16 17:00:00');
insert into Orario values (1001, 'DES01', 248, 1, '2023-09-14 15:00:00', 7, 101, '2023-09-14 17:00:00');
insert into Orario values (1002, 'DES01', 248, 1, '2023-09-12 15:00:00', 7, 109, '2023-09-12 17:00:00');
insert into Orario values (1003, 'DES01', 248, 2, '2023-09-21 13:00:00', 7, 109, '2023-09-21 15:00:00');
insert into Orario values (1004, 'DES01', 248, 2, '2023-09-20 15:00:00', 7, 513, '2023-09-20 17:00:00');
insert into Orario values (1005, 'DES01', 248, 2, '2023-09-18 09:00:00', 7, 101, '2023-09-18 11:00:00');
insert into Orario values (1006, 'DES01', 249, 1, '2024-09-19 15:00:00', 7, 101, '2024-09-19 17:00:00');
insert into Orario values (1007, 'DES01', 249, 1, '2024-09-16 09:00:00', 7, 101, '2024-09-16 11:00:00');
insert into Orario values (1008, 'DES01', 249, 1, '2024-09-18 15:00:00', 7, 109, '2024-09-18 17:00:00');
insert into Orario values (1009, 'DES01', 250, 1, '2025-09-10 11:00:00', 7, 109, '2025-09-10 12:00:00');
insert into Orario values (1010, 'DES01', 251, 1, '2026-09-08 11:00:00', 7, 101, '2026-09-08 12:00:00');
insert into Orario values (1011, 'DES01', 251, 1, '2026-09-11 13:00:00', 7, 109, '2026-09-11 15:00:00');
insert into Orario values (1012, 'DES01', 251, 2, '2026-09-24 15:00:00', 7, 302, '2026-09-24 17:00:00');
insert into Orario values (1013, 'DES01', 251, 2, '2026-09-26 13:00:00', 7, 109, '2026-09-26 15:00:00');
insert into Orario values (1014, 'DES01', 251, 2, '2026-09-22 11:00:00', 7, 109, '2026-09-22 12:00:00');
insert into Orario values (1015, 'URB01', 252, 1, '2020-09-21 15:00:00', 7, 513, '2020-09-21 17:00:00');
insert into Orario values (1016, 'URB01', 252, 1, '2020-09-22 09:00:00', 7, 513, '2020-09-22 11:00:00');
insert into Orario values (1017, 'URB01', 252, 2, '2020-09-14 09:00:00', 7, 109, '2020-09-14 11:00:00');
insert into Orario values (1018, 'URB01', 252, 2, '2020-09-12 13:00:00', 7, 109, '2020-09-12 15:00:00');
insert into Orario values (1019, 'URB01', 252, 3, '2020-09-11 09:00:00', 7, 109, '2020-09-11 11:00:00');
insert into Orario values (1020, 'URB01', 252, 3, '2020-09-12 15:00:00', 7, 109, '2020-09-12 17:00:00');
insert into Orario values (1021, 'URB01', 252, 4, '2020-09-13 13:00:00', 7, 302, '2020-09-13 15:00:00');
insert into Orario values (1022, 'URB01', 252, 4, '2020-09-16 09:00:00', 7, 101, '2020-09-16 11:00:00');
insert into Orario values (1023, 'URB01', 253, 1, '2021-09-15 09:00:00', 7, 302, '2021-09-15 11:00:00');
insert into Orario values (1024, 'URB01', 253, 1, '2021-09-12 11:00:00', 7, 513, '2021-09-12 12:00:00');
insert into Orario values (1025, 'URB01', 253, 1, '2021-09-17 13:00:00', 7, 109, '2021-09-17 15:00:00');
insert into Orario values (1026, 'URB01', 253, 2, '2021-09-15 11:00:00', 7, 513, '2021-09-15 12:00:00');
insert into Orario values (1027, 'URB01', 253, 2, '2021-09-10 15:00:00', 7, 302, '2021-09-10 17:00:00');
insert into Orario values (1028, 'URB01', 253, 2, '2021-09-13 11:00:00', 7, 109, '2021-09-13 12:00:00');
insert into Orario values (1029, 'URB01', 253, 3, '2021-09-23 15:00:00', 7, 101, '2021-09-23 17:00:00');
insert into Orario values (1030, 'URB01', 253, 4, '2021-09-21 09:00:00', 7, 302, '2021-09-21 11:00:00');
insert into Orario values (1031, 'URB01', 253, 4, '2021-09-20 13:00:00', 7, 513, '2021-09-20 15:00:00');
insert into Orario values (1032, 'URB01', 253, 4, '2021-09-18 15:00:00', 7, 109, '2021-09-18 17:00:00');
insert into Orario values (1033, 'URB01', 254, 1, '2022-09-18 11:00:00', 7, 109, '2022-09-18 12:00:00');
insert into Orario values (1034, 'URB01', 254, 1, '2022-09-16 13:00:00', 7, 109, '2022-09-16 15:00:00');
insert into Orario values (1035, 'URB01', 254, 1, '2022-09-14 15:00:00', 7, 109, '2022-09-14 17:00:00');
insert into Orario values (1036, 'URB01', 255, 1, '2023-09-22 15:00:00', 7, 109, '2023-09-22 17:00:00');
insert into Orario values (1037, 'URB01', 255, 1, '2023-09-23 11:00:00', 7, 302, '2023-09-23 12:00:00');
insert into Orario values (1038, 'URB01', 256, 1, '2024-09-16 15:00:00', 7, 513, '2024-09-16 17:00:00');
insert into Orario values (1039, 'URB01', 256, 1, '2024-09-18 11:00:00', 7, 101, '2024-09-18 12:00:00');
insert into Orario values (1040, 'URB01', 256, 1, '2024-09-13 11:00:00', 7, 101, '2024-09-13 12:00:00');
insert into Orario values (1041, 'URB01', 257, 1, '2025-09-22 15:00:00', 7, 302, '2025-09-22 17:00:00');
insert into Orario values (1042, 'URB01', 257, 1, '2025-09-25 11:00:00', 7, 302, '2025-09-25 12:00:00');
insert into Orario values (1043, 'URB01', 257, 2, '2025-09-16 11:00:00', 7, 101, '2025-09-16 12:00:00');
insert into Orario values (1044, 'URB01', 257, 2, '2025-09-13 15:00:00', 7, 302, '2025-09-13 17:00:00');
insert into Orario values (1045, 'URB01', 257, 2, '2025-09-14 11:00:00', 7, 513, '2025-09-14 12:00:00');
insert into Orario values (1046, 'URB01', 258, 1, '2026-09-20 13:00:00', 7, 109, '2026-09-20 15:00:00');
insert into Orario values (1047, 'URB01', 258, 1, '2026-09-22 09:00:00', 7, 513, '2026-09-22 11:00:00');
insert into Orario values (1048, 'URB01', 258, 2, '2026-09-23 09:00:00', 7, 101, '2026-09-23 11:00:00');
insert into Orario values (1049, 'URB01', 258, 2, '2026-09-22 15:00:00', 7, 302, '2026-09-22 17:00:00');
insert into Orario values (1050, 'URB01', 258, 2, '2026-09-24 15:00:00', 7, 513, '2026-09-24 17:00:00');
insert into Orario values (1051, 'ARC_CES01', 259, 1, '2020-02-10 11:00:00', 7, 101, '2020-02-10 12:00:00');
insert into Orario values (1052, 'ARC_CES01', 259, 1, '2020-02-11 09:00:00', 7, 302, '2020-02-11 11:00:00');
insert into Orario values (1053, 'ARC_CES01', 259, 1, '2020-02-13 11:00:00', 7, 513, '2020-02-13 12:00:00');
insert into Orario values (1054, 'ARC_CES01', 259, 2, '2020-02-18 15:00:00', 7, 109, '2020-02-18 17:00:00');
insert into Orario values (1055, 'ARC_CES01', 259, 2, '2020-02-15 11:00:00', 7, 109, '2020-02-15 12:00:00');
insert into Orario values (1056, 'ARC_CES01', 259, 2, '2020-02-16 15:00:00', 7, 109, '2020-02-16 17:00:00');
insert into Orario values (1057, 'ARC_CES01', 260, 1, '2021-02-26 09:00:00', 7, 101, '2021-02-26 11:00:00');
insert into Orario values (1058, 'ARC_CES01', 260, 1, '2021-02-21 13:00:00', 7, 109, '2021-02-21 15:00:00');
insert into Orario values (1059, 'ARC_CES01', 261, 1, '2022-02-23 11:00:00', 7, 101, '2022-02-23 12:00:00');
insert into Orario values (1060, 'ARC_CES01', 261, 1, '2022-02-24 09:00:00', 7, 101, '2022-02-24 11:00:00');
insert into Orario values (1061, 'ARC_CES01', 262, 1, '2023-02-13 11:00:00', 7, 513, '2023-02-13 12:00:00');
insert into Orario values (1062, 'ARC_CES01', 262, 1, '2023-02-11 09:00:00', 7, 302, '2023-02-11 11:00:00');
insert into Orario values (1063, 'ARC_CES01', 263, 1, '2024-02-20 15:00:00', 7, 513, '2024-02-20 17:00:00');
insert into Orario values (1064, 'ARC_CES01', 263, 1, '2024-02-19 11:00:00', 7, 101, '2024-02-19 12:00:00');
insert into Orario values (1065, 'ARC_CES01', 263, 1, '2024-02-16 09:00:00', 7, 302, '2024-02-16 11:00:00');
insert into Orario values (1066, 'ARC_CES01', 264, 1, '2025-02-23 13:00:00', 7, 109, '2025-02-23 15:00:00');
insert into Orario values (1067, 'ARC_CES01', 264, 1, '2025-02-22 13:00:00', 7, 513, '2025-02-22 15:00:00');
insert into Orario values (1068, 'ARC_CES01', 264, 1, '2025-02-27 11:00:00', 7, 101, '2025-02-27 12:00:00');
insert into Orario values (1069, 'ARC_CES01', 265, 1, '2026-02-21 11:00:00', 7, 109, '2026-02-21 12:00:00');
insert into Orario values (1070, 'ARC_CES01', 265, 1, '2026-02-19 13:00:00', 7, 101, '2026-02-19 15:00:00');
insert into Orario values (1071, 'ARC_CES02', 266, 1, '2020-09-24 15:00:00', 7, 109, '2020-09-24 17:00:00');
insert into Orario values (1072, 'ARC_CES02', 266, 1, '2020-09-21 11:00:00', 7, 101, '2020-09-21 12:00:00');
insert into Orario values (1073, 'ARC_CES02', 266, 2, '2020-09-11 11:00:00', 7, 513, '2020-09-11 12:00:00');
insert into Orario values (1074, 'ARC_CES02', 267, 1, '2021-09-20 11:00:00', 7, 101, '2021-09-20 12:00:00');
insert into Orario values (1075, 'ARC_CES02', 267, 1, '2021-09-17 15:00:00', 7, 513, '2021-09-17 17:00:00');
insert into Orario values (1076, 'ARC_CES02', 267, 1, '2021-09-16 15:00:00', 7, 101, '2021-09-16 17:00:00');
insert into Orario values (1077, 'ARC_CES02', 268, 1, '2022-09-15 11:00:00', 7, 101, '2022-09-15 12:00:00');
insert into Orario values (1078, 'ARC_CES02', 268, 1, '2022-09-14 13:00:00', 7, 109, '2022-09-14 15:00:00');
insert into Orario values (1079, 'ARC_CES02', 268, 1, '2022-09-17 11:00:00', 7, 302, '2022-09-17 12:00:00');
insert into Orario values (1080, 'ARC_CES02', 269, 1, '2023-09-20 13:00:00', 7, 513, '2023-09-20 15:00:00');
insert into Orario values (1081, 'ARC_CES02', 270, 1, '2024-09-10 09:00:00', 7, 101, '2024-09-10 11:00:00');
insert into Orario values (1082, 'ARC_CES02', 270, 1, '2024-09-12 09:00:00', 7, 302, '2024-09-12 11:00:00');
insert into Orario values (1083, 'ARC_CES02', 270, 1, '2024-09-15 09:00:00', 7, 302, '2024-09-15 11:00:00');
insert into Orario values (1084, 'ARC_CES02', 270, 2, '2024-09-13 09:00:00', 7, 302, '2024-09-13 11:00:00');
insert into Orario values (1085, 'ARC_CES02', 270, 2, '2024-09-09 13:00:00', 7, 101, '2024-09-09 15:00:00');
insert into Orario values (1086, 'ARC_CES02', 271, 1, '2025-09-23 09:00:00', 7, 109, '2025-09-23 11:00:00');
insert into Orario values (1087, 'ARC_CES02', 271, 1, '2025-09-19 09:00:00', 7, 101, '2025-09-19 11:00:00');
insert into Orario values (1088, 'ARC_CES02', 272, 1, '2026-09-18 13:00:00', 7, 302, '2026-09-18 15:00:00');
insert into Orario values (1089, 'ARC_CES02', 272, 1, '2026-09-23 13:00:00', 7, 109, '2026-09-23 15:00:00');
insert into Orario values (1090, 'ARC_CES02', 272, 1, '2026-09-22 09:00:00', 7, 109, '2026-09-22 11:00:00');
insert into Orario values (1091, 'ARC_CES02', 272, 2, '2026-09-23 09:00:00', 7, 513, '2026-09-23 11:00:00');
insert into Orario values (1092, 'ARC_CES02', 272, 3, '2026-09-10 11:00:00', 7, 302, '2026-09-10 12:00:00');
insert into Orario values (1093, 'ARC_CES02', 272, 3, '2026-09-12 11:00:00', 7, 513, '2026-09-12 12:00:00');
insert into Orario values (1094, 'ARC_CES02', 272, 3, '2026-09-09 09:00:00', 7, 101, '2026-09-09 11:00:00');
insert into Orario values (1095, 'ARC_CES02', 272, 4, '2026-09-21 09:00:00', 7, 109, '2026-09-21 11:00:00');
insert into Orario values (1096, 'ARC_CES02', 272, 4, '2026-09-20 11:00:00', 7, 513, '2026-09-20 12:00:00');
insert into Orario values (1097, 'DES_CES01', 273, 1, '2020-02-09 11:00:00', 7, 109, '2020-02-09 12:00:00');
insert into Orario values (1098, 'DES_CES01', 273, 1, '2020-02-10 15:00:00', 7, 101, '2020-02-10 17:00:00');
insert into Orario values (1099, 'DES_CES01', 273, 1, '2020-02-08 15:00:00', 7, 513, '2020-02-08 17:00:00');
insert into Orario values (1100, 'DES_CES01', 274, 1, '2021-02-20 09:00:00', 7, 109, '2021-02-20 11:00:00');
insert into Orario values (1101, 'DES_CES01', 274, 1, '2021-02-17 15:00:00', 7, 109, '2021-02-17 17:00:00');
insert into Orario values (1102, 'DES_CES01', 274, 1, '2021-02-19 11:00:00', 7, 101, '2021-02-19 12:00:00');
insert into Orario values (1103, 'DES_CES01', 274, 2, '2021-02-20 15:00:00', 7, 513, '2021-02-20 17:00:00');
insert into Orario values (1104, 'DES_CES01', 274, 2, '2021-02-22 11:00:00', 7, 101, '2021-02-22 12:00:00');
insert into Orario values (1105, 'DES_CES01', 274, 2, '2021-02-24 11:00:00', 7, 513, '2021-02-24 12:00:00');
insert into Orario values (1106, 'DES_CES01', 275, 1, '2022-02-15 15:00:00', 7, 513, '2022-02-15 17:00:00');
insert into Orario values (1107, 'DES_CES01', 275, 1, '2022-02-11 11:00:00', 7, 302, '2022-02-11 12:00:00');
insert into Orario values (1108, 'DES_CES01', 276, 1, '2023-02-21 11:00:00', 7, 109, '2023-02-21 12:00:00');
insert into Orario values (1109, 'DES_CES01', 276, 1, '2023-02-22 13:00:00', 7, 513, '2023-02-22 15:00:00');
insert into Orario values (1110, 'DES_CES01', 276, 2, '2023-02-14 09:00:00', 7, 513, '2023-02-14 11:00:00');
insert into Orario values (1111, 'DES_CES01', 276, 2, '2023-02-09 09:00:00', 7, 101, '2023-02-09 11:00:00');
insert into Orario values (1112, 'DES_CES01', 277, 1, '2024-02-13 13:00:00', 7, 101, '2024-02-13 15:00:00');
insert into Orario values (1113, 'DES_CES01', 277, 1, '2024-02-11 13:00:00', 7, 109, '2024-02-11 15:00:00');
insert into Orario values (1114, 'DES_CES01', 277, 1, '2024-02-12 15:00:00', 7, 513, '2024-02-12 17:00:00');
insert into Orario values (1115, 'DES_CES01', 278, 1, '2025-02-08 13:00:00', 7, 109, '2025-02-08 15:00:00');
insert into Orario values (1116, 'DES_CES01', 278, 1, '2025-02-12 15:00:00', 7, 302, '2025-02-12 17:00:00');
insert into Orario values (1117, 'DES_CES01', 278, 1, '2025-02-09 11:00:00', 7, 101, '2025-02-09 12:00:00');
insert into Orario values (1118, 'DES_CES01', 278, 2, '2025-02-09 15:00:00', 7, 109, '2025-02-09 17:00:00');
insert into Orario values (1119, 'DES_CES01', 278, 2, '2025-02-10 09:00:00', 7, 513, '2025-02-10 11:00:00');
insert into Orario values (1120, 'DES_CES01', 279, 1, '2026-02-23 15:00:00', 7, 302, '2026-02-23 17:00:00');
insert into Orario values (1121, 'DES_CES01', 279, 1, '2026-02-18 09:00:00', 7, 109, '2026-02-18 11:00:00');
insert into Orario values (1122, 'DES_CES01', 279, 2, '2026-02-21 13:00:00', 7, 109, '2026-02-21 15:00:00');
insert into Orario values (1123, 'DES_CES01', 279, 2, '2026-02-17 15:00:00', 7, 101, '2026-02-17 17:00:00');
insert into Orario values (1124, 'DES_CES01', 279, 3, '2026-02-11 13:00:00', 7, 101, '2026-02-11 15:00:00');
insert into Orario values (1125, 'DES_CES01', 279, 3, '2026-02-12 11:00:00', 7, 109, '2026-02-12 12:00:00');
insert into Orario values (1126, 'DES_CES01', 279, 3, '2026-02-13 11:00:00', 7, 513, '2026-02-13 12:00:00');
insert into Orario values (1127, 'DES_CES01', 279, 4, '2026-02-21 11:00:00', 7, 302, '2026-02-21 12:00:00');
insert into Orario values (1128, 'DES_CES01', 279, 4, '2026-02-22 11:00:00', 7, 513, '2026-02-22 12:00:00');
insert into Orario values (1129, 'URB_CES01', 280, 1, '2020-09-14 13:00:00', 8, 307, '2020-09-14 15:00:00');
insert into Orario values (1130, 'URB_CES01', 280, 1, '2020-09-16 09:00:00', 8, 307, '2020-09-16 11:00:00');
insert into Orario values (1131, 'URB_CES01', 280, 1, '2020-09-12 15:00:00', 8, 307, '2020-09-12 17:00:00');
insert into Orario values (1132, 'URB_CES01', 280, 2, '2020-09-19 11:00:00', 8, 307, '2020-09-19 12:00:00');
insert into Orario values (1133, 'URB_CES01', 280, 2, '2020-09-18 09:00:00', 8, 307, '2020-09-18 11:00:00');
insert into Orario values (1134, 'URB_CES01', 280, 3, '2020-09-22 11:00:00', 8, 307, '2020-09-22 12:00:00');
insert into Orario values (1135, 'URB_CES01', 280, 3, '2020-09-20 13:00:00', 8, 307, '2020-09-20 15:00:00');
insert into Orario values (1136, 'URB_CES01', 280, 3, '2020-09-21 11:00:00', 8, 307, '2020-09-21 12:00:00');
insert into Orario values (1137, 'URB_CES01', 280, 4, '2020-09-19 15:00:00', 8, 307, '2020-09-19 17:00:00');
insert into Orario values (1138, 'URB_CES01', 280, 4, '2020-09-15 11:00:00', 8, 307, '2020-09-15 12:00:00');
insert into Orario values (1139, 'URB_CES01', 280, 4, '2020-09-16 15:00:00', 8, 307, '2020-09-16 17:00:00');
insert into Orario values (1140, 'URB_CES01', 281, 1, '2021-09-19 11:00:00', 8, 307, '2021-09-19 12:00:00');
insert into Orario values (1141, 'URB_CES01', 281, 1, '2021-09-20 09:00:00', 8, 307, '2021-09-20 11:00:00');
insert into Orario values (1142, 'URB_CES01', 281, 1, '2021-09-22 09:00:00', 8, 307, '2021-09-22 11:00:00');
insert into Orario values (1143, 'URB_CES01', 282, 1, '2022-09-25 11:00:00', 8, 307, '2022-09-25 12:00:00');
insert into Orario values (1144, 'URB_CES01', 282, 1, '2022-09-23 11:00:00', 8, 307, '2022-09-23 12:00:00');
insert into Orario values (1145, 'URB_CES01', 282, 1, '2022-09-22 13:00:00', 8, 307, '2022-09-22 15:00:00');
insert into Orario values (1146, 'URB_CES01', 283, 1, '2023-09-23 13:00:00', 8, 307, '2023-09-23 15:00:00');
insert into Orario values (1147, 'URB_CES01', 283, 1, '2023-09-21 09:00:00', 8, 307, '2023-09-21 11:00:00');
insert into Orario values (1148, 'URB_CES01', 283, 1, '2023-09-22 15:00:00', 8, 307, '2023-09-22 17:00:00');
insert into Orario values (1149, 'URB_CES01', 284, 1, '2024-09-11 11:00:00', 8, 307, '2024-09-11 12:00:00');
insert into Orario values (1150, 'URB_CES01', 284, 1, '2024-09-13 11:00:00', 8, 307, '2024-09-13 12:00:00');
insert into Orario values (1151, 'URB_CES01', 284, 1, '2024-09-12 11:00:00', 8, 307, '2024-09-12 12:00:00');
insert into Orario values (1152, 'URB_CES01', 284, 2, '2024-09-11 15:00:00', 8, 307, '2024-09-11 17:00:00');
insert into Orario values (1153, 'URB_CES01', 284, 2, '2024-09-12 15:00:00', 8, 307, '2024-09-12 17:00:00');
insert into Orario values (1154, 'URB_CES01', 285, 1, '2025-09-14 13:00:00', 8, 307, '2025-09-14 15:00:00');
insert into Orario values (1155, 'URB_CES01', 285, 1, '2025-09-13 15:00:00', 8, 307, '2025-09-13 17:00:00');
insert into Orario values (1156, 'URB_CES01', 285, 2, '2025-09-19 15:00:00', 8, 307, '2025-09-19 17:00:00');
insert into Orario values (1157, 'URB_CES01', 285, 2, '2025-09-21 15:00:00', 8, 307, '2025-09-21 17:00:00');
insert into Orario values (1158, 'URB_CES01', 286, 1, '2026-09-20 15:00:00', 8, 307, '2026-09-20 17:00:00');
insert into Orario values (1159, 'URB_CES01', 286, 1, '2026-09-17 13:00:00', 8, 307, '2026-09-17 15:00:00');
insert into Orario values (1160, 'URB_CES01', 286, 2, '2026-09-23 15:00:00', 8, 307, '2026-09-23 17:00:00');
insert into Orario values (1161, 'URB_CES01', 286, 2, '2026-09-24 15:00:00', 8, 307, '2026-09-24 17:00:00');
insert into Orario values (1162, 'TEC_CES01', 287, 1, '2020-02-11 09:00:00', 8, 307, '2020-02-11 11:00:00');
insert into Orario values (1163, 'TEC_CES01', 287, 1, '2020-02-15 09:00:00', 8, 307, '2020-02-15 11:00:00');
insert into Orario values (1164, 'TEC_CES01', 288, 1, '2021-02-25 13:00:00', 8, 307, '2021-02-25 15:00:00');
insert into Orario values (1165, 'TEC_CES01', 288, 1, '2021-02-21 15:00:00', 8, 307, '2021-02-21 17:00:00');
insert into Orario values (1166, 'TEC_CES01', 289, 1, '2022-02-12 09:00:00', 8, 307, '2022-02-12 11:00:00');
insert into Orario values (1167, 'TEC_CES01', 289, 1, '2022-02-11 15:00:00', 8, 307, '2022-02-11 17:00:00');
insert into Orario values (1168, 'TEC_CES01', 289, 1, '2022-02-13 11:00:00', 8, 307, '2022-02-13 12:00:00');
insert into Orario values (1169, 'TEC_CES01', 289, 2, '2022-02-21 15:00:00', 8, 307, '2022-02-21 17:00:00');
insert into Orario values (1170, 'TEC_CES01', 289, 2, '2022-02-26 15:00:00', 8, 307, '2022-02-26 17:00:00');
insert into Orario values (1171, 'TEC_CES01', 289, 2, '2022-02-24 09:00:00', 8, 307, '2022-02-24 11:00:00');
insert into Orario values (1172, 'TEC_CES01', 290, 1, '2023-02-16 11:00:00', 8, 307, '2023-02-16 12:00:00');
insert into Orario values (1173, 'TEC_CES01', 290, 1, '2023-02-12 15:00:00', 8, 307, '2023-02-12 17:00:00');
insert into Orario values (1174, 'TEC_CES01', 290, 1, '2023-02-15 11:00:00', 8, 307, '2023-02-15 12:00:00');
insert into Orario values (1175, 'TEC_CES01', 290, 2, '2023-02-11 09:00:00', 8, 307, '2023-02-11 11:00:00');
insert into Orario values (1176, 'TEC_CES01', 290, 2, '2023-02-10 11:00:00', 8, 307, '2023-02-10 12:00:00');
insert into Orario values (1177, 'TEC_CES01', 290, 2, '2023-02-14 11:00:00', 8, 307, '2023-02-14 12:00:00');
insert into Orario values (1178, 'TEC_CES01', 291, 1, '2024-02-23 11:00:00', 8, 307, '2024-02-23 12:00:00');
insert into Orario values (1179, 'TEC_CES01', 291, 1, '2024-02-26 09:00:00', 8, 307, '2024-02-26 11:00:00');
insert into Orario values (1180, 'TEC_CES01', 292, 1, '2025-02-13 11:00:00', 8, 307, '2025-02-13 12:00:00');
insert into Orario values (1181, 'TEC_CES01', 292, 1, '2025-02-14 13:00:00', 8, 307, '2025-02-14 15:00:00');
insert into Orario values (1182, 'TEC_CES01', 292, 1, '2025-02-17 11:00:00', 8, 307, '2025-02-17 12:00:00');
insert into Orario values (1183, 'TEC_CES01', 293, 1, '2026-02-10 13:00:00', 8, 307, '2026-02-10 15:00:00');
insert into Orario values (1184, 'TEC_CES01', 293, 1, '2026-02-13 09:00:00', 8, 307, '2026-02-13 11:00:00');
insert into Orario values (1185, 'LET01', 294, 1, '2020-09-11 09:00:00', 8, 307, '2020-09-11 11:00:00');
insert into Orario values (1186, 'LET01', 294, 1, '2020-09-10 15:00:00', 8, 307, '2020-09-10 17:00:00');
insert into Orario values (1187, 'LET01', 294, 2, '2020-09-12 09:00:00', 8, 307, '2020-09-12 11:00:00');
insert into Orario values (1188, 'LET01', 294, 2, '2020-09-16 11:00:00', 8, 307, '2020-09-16 12:00:00');
insert into Orario values (1189, 'LET01', 294, 2, '2020-09-14 11:00:00', 8, 307, '2020-09-14 12:00:00');
insert into Orario values (1190, 'LET01', 295, 1, '2021-09-24 13:00:00', 8, 307, '2021-09-24 15:00:00');
insert into Orario values (1191, 'LET01', 295, 1, '2021-09-23 09:00:00', 8, 307, '2021-09-23 11:00:00');
insert into Orario values (1192, 'LET01', 296, 1, '2022-09-21 13:00:00', 8, 307, '2022-09-21 15:00:00');
insert into Orario values (1193, 'LET01', 296, 1, '2022-09-23 09:00:00', 8, 307, '2022-09-23 11:00:00');
insert into Orario values (1194, 'LET01', 297, 1, '2023-09-18 15:00:00', 8, 307, '2023-09-18 17:00:00');
insert into Orario values (1195, 'LET01', 297, 1, '2023-09-17 09:00:00', 8, 307, '2023-09-17 11:00:00');
insert into Orario values (1196, 'LET01', 298, 1, '2024-09-14 11:00:00', 8, 307, '2024-09-14 12:00:00');
insert into Orario values (1197, 'LET01', 298, 1, '2024-09-13 13:00:00', 8, 307, '2024-09-13 15:00:00');
insert into Orario values (1198, 'LET01', 299, 1, '2025-09-16 13:00:00', 8, 307, '2025-09-16 15:00:00');
insert into Orario values (1199, 'LET01', 299, 1, '2025-09-17 15:00:00', 8, 307, '2025-09-17 17:00:00');
insert into Orario values (1200, 'LET01', 299, 2, '2025-09-19 13:00:00', 8, 307, '2025-09-19 15:00:00');
insert into Orario values (1201, 'LET01', 300, 1, '2026-09-19 15:00:00', 8, 307, '2026-09-19 17:00:00');
insert into Orario values (1202, 'LET01', 300, 1, '2026-09-20 13:00:00', 8, 307, '2026-09-20 15:00:00');
insert into Orario values (1203, 'LET01', 300, 1, '2026-09-17 11:00:00', 8, 307, '2026-09-17 12:00:00');
insert into Orario values (1204, 'STO01', 301, 1, '2020-09-23 15:00:00', 8, 307, '2020-09-23 17:00:00');
insert into Orario values (1205, 'STO01', 301, 1, '2020-09-22 13:00:00', 8, 307, '2020-09-22 15:00:00');
insert into Orario values (1206, 'STO01', 301, 1, '2020-09-21 09:00:00', 8, 307, '2020-09-21 11:00:00');
insert into Orario values (1207, 'STO01', 301, 2, '2020-09-18 13:00:00', 8, 307, '2020-09-18 15:00:00');
insert into Orario values (1208, 'STO01', 301, 2, '2020-09-19 09:00:00', 8, 307, '2020-09-19 11:00:00');
insert into Orario values (1209, 'STO01', 302, 1, '2021-09-23 15:00:00', 8, 307, '2021-09-23 17:00:00');
insert into Orario values (1210, 'STO01', 302, 1, '2021-09-22 13:00:00', 8, 307, '2021-09-22 15:00:00');
insert into Orario values (1211, 'STO01', 302, 2, '2021-09-14 13:00:00', 8, 307, '2021-09-14 15:00:00');
insert into Orario values (1212, 'STO01', 302, 2, '2021-09-12 09:00:00', 8, 307, '2021-09-12 11:00:00');
insert into Orario values (1213, 'STO01', 302, 2, '2021-09-09 13:00:00', 8, 307, '2021-09-09 15:00:00');
insert into Orario values (1214, 'STO01', 303, 1, '2022-09-14 15:00:00', 8, 307, '2022-09-14 17:00:00');
insert into Orario values (1215, 'STO01', 303, 1, '2022-09-13 09:00:00', 8, 307, '2022-09-13 11:00:00');
insert into Orario values (1216, 'STO01', 304, 1, '2023-09-15 11:00:00', 8, 307, '2023-09-15 12:00:00');
insert into Orario values (1217, 'STO01', 304, 1, '2023-09-17 11:00:00', 8, 307, '2023-09-17 12:00:00');
insert into Orario values (1218, 'STO01', 304, 1, '2023-09-19 13:00:00', 8, 307, '2023-09-19 15:00:00');
insert into Orario values (1219, 'STO01', 304, 2, '2023-09-20 13:00:00', 8, 307, '2023-09-20 15:00:00');
insert into Orario values (1220, 'STO01', 304, 2, '2023-09-21 13:00:00', 8, 307, '2023-09-21 15:00:00');
insert into Orario values (1221, 'STO01', 305, 1, '2024-09-16 09:00:00', 8, 307, '2024-09-16 11:00:00');
insert into Orario values (1222, 'STO01', 305, 1, '2024-09-19 13:00:00', 8, 307, '2024-09-19 15:00:00');
insert into Orario values (1223, 'STO01', 306, 1, '2025-09-11 09:00:00', 8, 307, '2025-09-11 11:00:00');
insert into Orario values (1224, 'STO01', 306, 1, '2025-09-14 09:00:00', 8, 307, '2025-09-14 11:00:00');
insert into Orario values (1225, 'STO01', 306, 2, '2025-09-15 09:00:00', 8, 307, '2025-09-15 11:00:00');
insert into Orario values (1226, 'STO01', 306, 2, '2025-09-12 09:00:00', 8, 307, '2025-09-12 11:00:00');
insert into Orario values (1227, 'STO01', 307, 1, '2026-09-09 09:00:00', 8, 307, '2026-09-09 11:00:00');
insert into Orario values (1228, 'STO01', 307, 1, '2026-09-13 11:00:00', 8, 307, '2026-09-13 12:00:00');
insert into Orario values (1229, 'FIL01', 308, 1, '2020-02-21 13:00:00', 8, 307, '2020-02-21 15:00:00');
insert into Orario values (1230, 'FIL01', 308, 1, '2020-02-18 09:00:00', 8, 307, '2020-02-18 11:00:00');
insert into Orario values (1231, 'FIL01', 308, 1, '2020-02-17 15:00:00', 8, 307, '2020-02-17 17:00:00');
insert into Orario values (1232, 'FIL01', 309, 1, '2021-02-19 15:00:00', 8, 307, '2021-02-19 17:00:00');
insert into Orario values (1233, 'FIL01', 309, 1, '2021-02-20 11:00:00', 8, 307, '2021-02-20 12:00:00');
insert into Orario values (1234, 'FIL01', 309, 1, '2021-02-21 09:00:00', 8, 307, '2021-02-21 11:00:00');
insert into Orario values (1235, 'FIL01', 309, 2, '2021-02-22 13:00:00', 8, 307, '2021-02-22 15:00:00');
insert into Orario values (1236, 'FIL01', 309, 2, '2021-02-18 09:00:00', 8, 307, '2021-02-18 11:00:00');
insert into Orario values (1237, 'FIL01', 310, 1, '2022-02-23 13:00:00', 8, 307, '2022-02-23 15:00:00');
insert into Orario values (1238, 'FIL01', 310, 1, '2022-02-18 15:00:00', 8, 307, '2022-02-18 17:00:00');
insert into Orario values (1239, 'FIL01', 310, 1, '2022-02-20 15:00:00', 8, 307, '2022-02-20 17:00:00');
insert into Orario values (1240, 'FIL01', 311, 1, '2023-02-21 13:00:00', 8, 307, '2023-02-21 15:00:00');
insert into Orario values (1241, 'FIL01', 311, 1, '2023-02-24 09:00:00', 8, 307, '2023-02-24 11:00:00');
insert into Orario values (1242, 'FIL01', 312, 1, '2024-02-18 13:00:00', 8, 307, '2024-02-18 15:00:00');
insert into Orario values (1243, 'FIL01', 312, 1, '2024-02-14 13:00:00', 8, 307, '2024-02-14 15:00:00');
insert into Orario values (1244, 'FIL01', 312, 2, '2024-02-22 13:00:00', 8, 307, '2024-02-22 15:00:00');
insert into Orario values (1245, 'FIL01', 312, 2, '2024-02-23 09:00:00', 8, 307, '2024-02-23 11:00:00');
insert into Orario values (1246, 'FIL01', 313, 1, '2025-02-09 15:00:00', 8, 307, '2025-02-09 17:00:00');
insert into Orario values (1247, 'FIL01', 313, 1, '2025-02-11 15:00:00', 8, 307, '2025-02-11 17:00:00');
insert into Orario values (1248, 'FIL01', 313, 1, '2025-02-10 09:00:00', 8, 307, '2025-02-10 11:00:00');
insert into Orario values (1249, 'FIL01', 314, 1, '2026-02-12 13:00:00', 8, 307, '2026-02-12 15:00:00');
insert into Orario values (1250, 'FIL01', 314, 1, '2026-02-14 11:00:00', 8, 307, '2026-02-14 12:00:00');
insert into Orario values (1251, 'FIL01', 314, 2, '2026-02-17 15:00:00', 8, 307, '2026-02-17 17:00:00');
insert into Orario values (1252, 'FIL01', 314, 2, '2026-02-15 15:00:00', 8, 307, '2026-02-15 17:00:00');
insert into Orario values (1253, 'FIL01', 314, 2, '2026-02-16 15:00:00', 8, 307, '2026-02-16 17:00:00');
insert into Orario values (1254, 'LIN01', 315, 1, '2020-09-15 11:00:00', 9, 527, '2020-09-15 12:00:00');
insert into Orario values (1255, 'LIN01', 315, 1, '2020-09-19 15:00:00', 9, 527, '2020-09-19 17:00:00');
insert into Orario values (1256, 'LIN01', 315, 1, '2020-09-17 09:00:00', 9, 527, '2020-09-17 11:00:00');
insert into Orario values (1257, 'LIN01', 316, 1, '2021-09-22 09:00:00', 9, 527, '2021-09-22 11:00:00');
insert into Orario values (1258, 'LIN01', 316, 1, '2021-09-25 13:00:00', 9, 527, '2021-09-25 15:00:00');
insert into Orario values (1259, 'LIN01', 316, 1, '2021-09-24 09:00:00', 9, 527, '2021-09-24 11:00:00');
insert into Orario values (1260, 'LIN01', 316, 2, '2021-09-19 15:00:00', 9, 527, '2021-09-19 17:00:00');
insert into Orario values (1261, 'LIN01', 316, 2, '2021-09-18 09:00:00', 9, 527, '2021-09-18 11:00:00');
insert into Orario values (1262, 'LIN01', 316, 3, '2021-09-20 11:00:00', 9, 527, '2021-09-20 12:00:00');
insert into Orario values (1263, 'LIN01', 316, 4, '2021-09-15 09:00:00', 9, 527, '2021-09-15 11:00:00');
insert into Orario values (1264, 'LIN01', 317, 1, '2022-09-20 09:00:00', 9, 527, '2022-09-20 11:00:00');
insert into Orario values (1265, 'LIN01', 317, 1, '2022-09-22 11:00:00', 9, 527, '2022-09-22 12:00:00');
insert into Orario values (1266, 'LIN01', 318, 1, '2023-09-08 09:00:00', 9, 527, '2023-09-08 11:00:00');
insert into Orario values (1267, 'LIN01', 318, 1, '2023-09-09 13:00:00', 9, 527, '2023-09-09 15:00:00');
insert into Orario values (1268, 'LIN01', 318, 1, '2023-09-13 11:00:00', 9, 527, '2023-09-13 12:00:00');
insert into Orario values (1269, 'LIN01', 319, 1, '2024-09-14 15:00:00', 9, 527, '2024-09-14 17:00:00');
insert into Orario values (1270, 'LIN01', 319, 1, '2024-09-17 09:00:00', 9, 527, '2024-09-17 11:00:00');
insert into Orario values (1271, 'LIN01', 319, 1, '2024-09-16 09:00:00', 9, 527, '2024-09-16 11:00:00');
insert into Orario values (1272, 'LIN01', 320, 1, '2025-09-22 13:00:00', 9, 527, '2025-09-22 15:00:00');
insert into Orario values (1273, 'LIN01', 320, 1, '2025-09-21 13:00:00', 9, 527, '2025-09-21 15:00:00');
insert into Orario values (1274, 'LIN01', 320, 1, '2025-09-19 09:00:00', 9, 527, '2025-09-19 11:00:00');
insert into Orario values (1275, 'LIN01', 320, 2, '2025-09-23 11:00:00', 9, 527, '2025-09-23 12:00:00');
insert into Orario values (1276, 'LIN01', 320, 2, '2025-09-27 09:00:00', 9, 527, '2025-09-27 11:00:00');
insert into Orario values (1277, 'LIN01', 320, 3, '2025-09-21 11:00:00', 9, 527, '2025-09-21 12:00:00');
insert into Orario values (1278, 'LIN01', 320, 3, '2025-09-20 15:00:00', 9, 527, '2025-09-20 17:00:00');
insert into Orario values (1279, 'LIN01', 320, 3, '2025-09-23 09:00:00', 9, 527, '2025-09-23 11:00:00');
insert into Orario values (1280, 'LIN01', 320, 4, '2025-09-12 15:00:00', 9, 527, '2025-09-12 17:00:00');
insert into Orario values (1281, 'LIN01', 320, 4, '2025-09-14 11:00:00', 9, 527, '2025-09-14 12:00:00');
insert into Orario values (1282, 'LIN01', 320, 4, '2025-09-16 15:00:00', 9, 527, '2025-09-16 17:00:00');
insert into Orario values (1283, 'LIN01', 321, 1, '2026-09-26 11:00:00', 9, 527, '2026-09-26 12:00:00');
insert into Orario values (1284, 'LIN01', 321, 1, '2026-09-23 15:00:00', 9, 527, '2026-09-23 17:00:00');
insert into Orario values (1285, 'POL01', 322, 1, '2020-09-20 15:00:00', 9, 527, '2020-09-20 17:00:00');
insert into Orario values (1286, 'POL01', 322, 1, '2020-09-25 11:00:00', 9, 527, '2020-09-25 12:00:00');
insert into Orario values (1287, 'POL01', 323, 1, '2021-09-20 15:00:00', 9, 527, '2021-09-20 17:00:00');
insert into Orario values (1288, 'POL01', 323, 1, '2021-09-23 11:00:00', 9, 527, '2021-09-23 12:00:00');
insert into Orario values (1289, 'POL01', 323, 2, '2021-09-12 13:00:00', 9, 527, '2021-09-12 15:00:00');
insert into Orario values (1290, 'POL01', 323, 2, '2021-09-14 11:00:00', 9, 527, '2021-09-14 12:00:00');
insert into Orario values (1291, 'POL01', 323, 2, '2021-09-10 15:00:00', 9, 527, '2021-09-10 17:00:00');
insert into Orario values (1292, 'POL01', 323, 3, '2021-09-19 09:00:00', 9, 527, '2021-09-19 11:00:00');
insert into Orario values (1293, 'POL01', 323, 3, '2021-09-18 11:00:00', 9, 527, '2021-09-18 12:00:00');
insert into Orario values (1294, 'POL01', 323, 4, '2021-09-27 11:00:00', 9, 527, '2021-09-27 12:00:00');
insert into Orario values (1295, 'POL01', 323, 4, '2021-09-25 09:00:00', 9, 527, '2021-09-25 11:00:00');
insert into Orario values (1296, 'POL01', 323, 4, '2021-09-22 15:00:00', 9, 527, '2021-09-22 17:00:00');
insert into Orario values (1297, 'POL01', 324, 1, '2022-09-21 11:00:00', 9, 527, '2022-09-21 12:00:00');
insert into Orario values (1298, 'POL01', 324, 1, '2022-09-25 15:00:00', 9, 527, '2022-09-25 17:00:00');
insert into Orario values (1299, 'POL01', 324, 2, '2022-09-14 11:00:00', 9, 527, '2022-09-14 12:00:00');
insert into Orario values (1300, 'POL01', 324, 2, '2022-09-11 15:00:00', 9, 527, '2022-09-11 17:00:00');
insert into Orario values (1301, 'POL01', 325, 1, '2023-09-13 09:00:00', 9, 527, '2023-09-13 11:00:00');
insert into Orario values (1302, 'POL01', 325, 1, '2023-09-15 09:00:00', 9, 527, '2023-09-15 11:00:00');
insert into Orario values (1303, 'POL01', 325, 2, '2023-09-15 15:00:00', 9, 527, '2023-09-15 17:00:00');
insert into Orario values (1304, 'POL01', 325, 2, '2023-09-14 13:00:00', 9, 527, '2023-09-14 15:00:00');
insert into Orario values (1305, 'POL01', 325, 2, '2023-09-19 11:00:00', 9, 527, '2023-09-19 12:00:00');
insert into Orario values (1306, 'POL01', 326, 1, '2024-09-23 11:00:00', 9, 527, '2024-09-23 12:00:00');
insert into Orario values (1307, 'POL01', 326, 1, '2024-09-21 13:00:00', 9, 527, '2024-09-21 15:00:00');
insert into Orario values (1308, 'POL01', 327, 1, '2025-09-09 11:00:00', 9, 527, '2025-09-09 12:00:00');
insert into Orario values (1309, 'POL01', 327, 1, '2025-09-12 13:00:00', 9, 527, '2025-09-12 15:00:00');
insert into Orario values (1310, 'POL01', 327, 1, '2025-09-11 09:00:00', 9, 527, '2025-09-11 11:00:00');
insert into Orario values (1311, 'POL01', 328, 1, '2026-09-18 11:00:00', 9, 527, '2026-09-18 12:00:00');
insert into Orario values (1312, 'POL01', 328, 1, '2026-09-17 13:00:00', 9, 527, '2026-09-17 15:00:00');
insert into Orario values (1313, 'POL01', 328, 2, '2026-09-25 09:00:00', 9, 527, '2026-09-25 11:00:00');
insert into Orario values (1314, 'POL01', 328, 2, '2026-09-24 15:00:00', 9, 527, '2026-09-24 17:00:00');
insert into Orario values (1315, 'POL01', 328, 3, '2026-09-15 09:00:00', 9, 527, '2026-09-15 11:00:00');
insert into Orario values (1316, 'POL01', 328, 3, '2026-09-18 09:00:00', 9, 527, '2026-09-18 11:00:00');
insert into Orario values (1317, 'POL01', 328, 4, '2026-09-20 15:00:00', 9, 527, '2026-09-20 17:00:00');
insert into Orario values (1318, 'SOC01', 329, 1, '2020-02-22 13:00:00', 9, 527, '2020-02-22 15:00:00');
insert into Orario values (1319, 'SOC01', 329, 1, '2020-02-19 09:00:00', 9, 527, '2020-02-19 11:00:00');
insert into Orario values (1320, 'SOC01', 329, 1, '2020-02-23 11:00:00', 9, 527, '2020-02-23 12:00:00');
insert into Orario values (1321, 'SOC01', 330, 1, '2021-02-14 09:00:00', 9, 527, '2021-02-14 11:00:00');
insert into Orario values (1322, 'SOC01', 330, 1, '2021-02-15 15:00:00', 9, 527, '2021-02-15 17:00:00');
insert into Orario values (1323, 'SOC01', 330, 2, '2021-02-22 09:00:00', 9, 527, '2021-02-22 11:00:00');
insert into Orario values (1324, 'SOC01', 330, 2, '2021-02-18 09:00:00', 9, 527, '2021-02-18 11:00:00');
insert into Orario values (1325, 'SOC01', 330, 2, '2021-02-20 11:00:00', 9, 527, '2021-02-20 12:00:00');
insert into Orario values (1326, 'SOC01', 331, 1, '2022-02-13 13:00:00', 9, 527, '2022-02-13 15:00:00');
insert into Orario values (1327, 'SOC01', 331, 1, '2022-02-14 11:00:00', 9, 527, '2022-02-14 12:00:00');
insert into Orario values (1328, 'SOC01', 331, 1, '2022-02-15 11:00:00', 9, 527, '2022-02-15 12:00:00');
insert into Orario values (1329, 'SOC01', 332, 1, '2023-02-24 09:00:00', 9, 527, '2023-02-24 11:00:00');
insert into Orario values (1330, 'SOC01', 332, 1, '2023-02-23 09:00:00', 9, 527, '2023-02-23 11:00:00');
insert into Orario values (1331, 'SOC01', 332, 1, '2023-02-21 15:00:00', 9, 527, '2023-02-21 17:00:00');
insert into Orario values (1332, 'SOC01', 332, 2, '2023-02-25 11:00:00', 9, 527, '2023-02-25 12:00:00');
insert into Orario values (1333, 'SOC01', 332, 2, '2023-02-21 13:00:00', 9, 527, '2023-02-21 15:00:00');
insert into Orario values (1334, 'SOC01', 333, 1, '2024-02-10 11:00:00', 9, 527, '2024-02-10 12:00:00');
insert into Orario values (1335, 'SOC01', 333, 1, '2024-02-14 11:00:00', 9, 527, '2024-02-14 12:00:00');
insert into Orario values (1336, 'SOC01', 333, 1, '2024-02-11 15:00:00', 9, 527, '2024-02-11 17:00:00');
insert into Orario values (1337, 'SOC01', 334, 1, '2025-02-11 09:00:00', 9, 527, '2025-02-11 11:00:00');
insert into Orario values (1338, 'SOC01', 334, 1, '2025-02-09 09:00:00', 9, 527, '2025-02-09 11:00:00');
insert into Orario values (1339, 'SOC01', 335, 1, '2026-02-17 13:00:00', 9, 527, '2026-02-17 15:00:00');
insert into Orario values (1340, 'SOC01', 335, 1, '2026-02-15 13:00:00', 9, 527, '2026-02-15 15:00:00');
insert into Orario values (1341, 'SOC01', 335, 1, '2026-02-19 13:00:00', 9, 527, '2026-02-19 15:00:00');
insert into Orario values (1342, 'COM01', 336, 1, '2020-09-14 13:00:00', 9, 527, '2020-09-14 15:00:00');
insert into Orario values (1343, 'COM01', 336, 1, '2020-09-09 15:00:00', 9, 527, '2020-09-09 17:00:00');
insert into Orario values (1344, 'COM01', 336, 2, '2020-09-11 11:00:00', 9, 527, '2020-09-11 12:00:00');
insert into Orario values (1345, 'COM01', 336, 2, '2020-09-12 11:00:00', 9, 527, '2020-09-12 12:00:00');
insert into Orario values (1346, 'COM01', 336, 2, '2020-09-14 09:00:00', 9, 527, '2020-09-14 11:00:00');
insert into Orario values (1347, 'COM01', 337, 1, '2021-09-11 15:00:00', 9, 527, '2021-09-11 17:00:00');
insert into Orario values (1348, 'COM01', 337, 1, '2021-09-10 11:00:00', 9, 527, '2021-09-10 12:00:00');
insert into Orario values (1349, 'COM01', 338, 1, '2022-09-15 15:00:00', 9, 527, '2022-09-15 17:00:00');
insert into Orario values (1350, 'COM01', 339, 1, '2023-09-21 15:00:00', 9, 527, '2023-09-21 17:00:00');
insert into Orario values (1351, 'COM01', 339, 1, '2023-09-16 15:00:00', 9, 527, '2023-09-16 17:00:00');
insert into Orario values (1352, 'COM01', 339, 1, '2023-09-17 11:00:00', 9, 527, '2023-09-17 12:00:00');
insert into Orario values (1353, 'COM01', 340, 1, '2024-09-14 09:00:00', 9, 527, '2024-09-14 11:00:00');
insert into Orario values (1354, 'COM01', 340, 1, '2024-09-15 13:00:00', 9, 527, '2024-09-15 15:00:00');
insert into Orario values (1355, 'COM01', 341, 1, '2025-09-14 15:00:00', 9, 527, '2025-09-14 17:00:00');
insert into Orario values (1356, 'COM01', 341, 1, '2025-09-15 09:00:00', 9, 527, '2025-09-15 11:00:00');
insert into Orario values (1357, 'COM01', 342, 1, '2026-09-24 13:00:00', 9, 527, '2026-09-24 15:00:00');
insert into Orario values (1358, 'COM01', 342, 1, '2026-09-22 11:00:00', 9, 527, '2026-09-22 12:00:00');
insert into Orario values (1359, 'COM01', 342, 2, '2026-09-13 15:00:00', 9, 527, '2026-09-13 17:00:00');
insert into Orario values (1360, 'COM01', 342, 2, '2026-09-14 09:00:00', 9, 527, '2026-09-14 11:00:00');
insert into Orario values (1361, 'PSI01', 343, 1, '2020-09-18 09:00:00', 9, 527, '2020-09-18 11:00:00');
insert into Orario values (1362, 'PSI01', 343, 2, '2020-09-24 09:00:00', 9, 527, '2020-09-24 11:00:00');
insert into Orario values (1363, 'PSI01', 343, 2, '2020-09-20 11:00:00', 9, 527, '2020-09-20 12:00:00');
insert into Orario values (1364, 'PSI01', 344, 1, '2021-09-16 09:00:00', 9, 527, '2021-09-16 11:00:00');
insert into Orario values (1365, 'PSI01', 344, 2, '2021-09-23 15:00:00', 9, 527, '2021-09-23 17:00:00');
insert into Orario values (1366, 'PSI01', 344, 3, '2021-09-22 13:00:00', 9, 527, '2021-09-22 15:00:00');
insert into Orario values (1367, 'PSI01', 344, 3, '2021-09-21 11:00:00', 9, 527, '2021-09-21 12:00:00');
insert into Orario values (1368, 'PSI01', 344, 4, '2021-09-17 11:00:00', 9, 527, '2021-09-17 12:00:00');
insert into Orario values (1369, 'PSI01', 345, 1, '2022-09-20 11:00:00', 9, 527, '2022-09-20 12:00:00');
insert into Orario values (1370, 'PSI01', 345, 2, '2022-09-27 13:00:00', 9, 527, '2022-09-27 15:00:00');
insert into Orario values (1371, 'PSI01', 345, 2, '2022-09-25 11:00:00', 9, 527, '2022-09-25 12:00:00');
insert into Orario values (1372, 'PSI01', 345, 2, '2022-09-24 09:00:00', 9, 527, '2022-09-24 11:00:00');
insert into Orario values (1373, 'PSI01', 346, 1, '2023-09-11 15:00:00', 9, 527, '2023-09-11 17:00:00');
insert into Orario values (1374, 'PSI01', 347, 1, '2024-09-22 09:00:00', 9, 527, '2024-09-22 11:00:00');
insert into Orario values (1375, 'PSI01', 347, 1, '2024-09-25 15:00:00', 9, 527, '2024-09-25 17:00:00');
insert into Orario values (1376, 'PSI01', 347, 1, '2024-09-24 11:00:00', 9, 527, '2024-09-24 12:00:00');
insert into Orario values (1377, 'PSI01', 348, 1, '2025-09-09 13:00:00', 9, 527, '2025-09-09 15:00:00');
insert into Orario values (1378, 'PSI01', 348, 1, '2025-09-13 09:00:00', 9, 527, '2025-09-13 11:00:00');
insert into Orario values (1379, 'PSI01', 348, 2, '2025-09-15 15:00:00', 9, 527, '2025-09-15 17:00:00');
insert into Orario values (1380, 'PSI01', 349, 1, '2026-09-23 11:00:00', 9, 527, '2026-09-23 12:00:00');
insert into Orario values (1381, 'PSI01', 349, 2, '2026-09-13 13:00:00', 9, 527, '2026-09-13 15:00:00');
insert into Orario values (1382, 'PSI01', 349, 2, '2026-09-14 13:00:00', 9, 527, '2026-09-14 15:00:00');
insert into Orario values (1383, 'PSI01', 349, 2, '2026-09-16 09:00:00', 9, 527, '2026-09-16 11:00:00');
insert into Orario values (1384, 'GIU01', 350, 1, '2020-09-20 13:00:00', 9, 527, '2020-09-20 15:00:00');
insert into Orario values (1385, 'GIU01', 351, 1, '2021-09-13 15:00:00', 9, 527, '2021-09-13 17:00:00');
insert into Orario values (1386, 'GIU01', 352, 1, '2022-09-17 09:00:00', 9, 527, '2022-09-17 11:00:00');
insert into Orario values (1387, 'GIU01', 352, 1, '2022-09-15 13:00:00', 9, 527, '2022-09-15 15:00:00');
insert into Orario values (1388, 'GIU01', 352, 2, '2022-09-09 11:00:00', 9, 527, '2022-09-09 12:00:00');
insert into Orario values (1389, 'GIU01', 352, 2, '2022-09-10 09:00:00', 9, 527, '2022-09-10 11:00:00');
insert into Orario values (1390, 'GIU01', 353, 1, '2023-09-12 11:00:00', 9, 527, '2023-09-12 12:00:00');
insert into Orario values (1391, 'GIU01', 353, 1, '2023-09-09 15:00:00', 9, 527, '2023-09-09 17:00:00');
insert into Orario values (1392, 'GIU01', 353, 1, '2023-09-14 15:00:00', 9, 527, '2023-09-14 17:00:00');
insert into Orario values (1393, 'GIU01', 354, 1, '2024-09-21 11:00:00', 9, 527, '2024-09-21 12:00:00');
insert into Orario values (1394, 'GIU01', 354, 1, '2024-09-22 11:00:00', 9, 527, '2024-09-22 12:00:00');
insert into Orario values (1395, 'GIU01', 355, 1, '2025-09-17 11:00:00', 9, 527, '2025-09-17 12:00:00');
insert into Orario values (1396, 'GIU01', 356, 1, '2026-09-14 15:00:00', 9, 527, '2026-09-14 17:00:00');
insert into Orario values (1397, 'GIU01', 356, 1, '2026-09-13 09:00:00', 9, 527, '2026-09-13 11:00:00');
insert into Orario values (1398, 'GIU01', 356, 2, '2026-09-16 11:00:00', 9, 527, '2026-09-16 12:00:00');
insert into Orario values (1399, 'GIU01', 356, 2, '2026-09-12 11:00:00', 9, 527, '2026-09-12 12:00:00');
insert into Orario values (1400, 'GIU01', 356, 3, '2026-09-18 13:00:00', 9, 527, '2026-09-18 15:00:00');
insert into Orario values (1401, 'GIU01', 356, 4, '2026-09-22 13:00:00', 9, 527, '2026-09-22 15:00:00');
insert into Orario values (1402, 'GIU01', 356, 4, '2026-09-20 13:00:00', 9, 527, '2026-09-20 15:00:00');
insert into Orario values (1403, 'DIR01', 357, 1, '2020-02-20 11:00:00', 11, 322, '2020-02-20 12:00:00');
insert into Orario values (1404, 'DIR01', 357, 1, '2020-02-16 13:00:00', 11, 322, '2020-02-16 15:00:00');
insert into Orario values (1405, 'DIR01', 358, 1, '2021-02-19 11:00:00', 11, 320, '2021-02-19 12:00:00');
insert into Orario values (1406, 'DIR01', 358, 1, '2021-02-22 11:00:00', 11, 322, '2021-02-22 12:00:00');
insert into Orario values (1407, 'DIR01', 359, 1, '2022-02-20 15:00:00', 11, 121, '2022-02-20 17:00:00');
insert into Orario values (1408, 'DIR01', 359, 1, '2022-02-21 09:00:00', 11, 121, '2022-02-21 11:00:00');
insert into Orario values (1409, 'DIR01', 359, 1, '2022-02-23 15:00:00', 11, 322, '2022-02-23 17:00:00');
insert into Orario values (1410, 'DIR01', 359, 2, '2022-02-25 15:00:00', 11, 320, '2022-02-25 17:00:00');
insert into Orario values (1411, 'DIR01', 359, 2, '2022-02-24 13:00:00', 11, 218, '2022-02-24 15:00:00');
insert into Orario values (1412, 'DIR01', 360, 1, '2023-02-16 11:00:00', 11, 121, '2023-02-16 12:00:00');
insert into Orario values (1413, 'DIR01', 360, 1, '2023-02-17 15:00:00', 11, 320, '2023-02-17 17:00:00');
insert into Orario values (1414, 'DIR01', 360, 1, '2023-02-19 13:00:00', 11, 218, '2023-02-19 15:00:00');
insert into Orario values (1415, 'DIR01', 360, 2, '2023-02-09 15:00:00', 11, 322, '2023-02-09 17:00:00');
insert into Orario values (1416, 'DIR01', 360, 2, '2023-02-13 09:00:00', 11, 121, '2023-02-13 11:00:00');
insert into Orario values (1417, 'DIR01', 361, 1, '2024-02-20 15:00:00', 11, 322, '2024-02-20 17:00:00');
insert into Orario values (1418, 'DIR01', 361, 1, '2024-02-18 09:00:00', 11, 121, '2024-02-18 11:00:00');
insert into Orario values (1419, 'DIR01', 362, 1, '2025-02-16 15:00:00', 11, 218, '2025-02-16 17:00:00');
insert into Orario values (1420, 'DIR01', 362, 1, '2025-02-18 09:00:00', 11, 322, '2025-02-18 11:00:00');
insert into Orario values (1421, 'DIR01', 362, 2, '2025-02-27 15:00:00', 11, 121, '2025-02-27 17:00:00');
insert into Orario values (1422, 'DIR01', 362, 2, '2025-02-24 11:00:00', 11, 320, '2025-02-24 12:00:00');
insert into Orario values (1423, 'DIR01', 363, 1, '2026-02-15 15:00:00', 11, 320, '2026-02-15 17:00:00');
insert into Orario values (1424, 'DIR01', 363, 1, '2026-02-18 15:00:00', 11, 121, '2026-02-18 17:00:00');
insert into Orario values (1425, 'DIR01', 363, 1, '2026-02-14 11:00:00', 11, 218, '2026-02-14 12:00:00');
insert into Orario values (1426, 'FAR01', 364, 1, '2020-09-21 13:00:00', 11, 322, '2020-09-21 15:00:00');
insert into Orario values (1427, 'FAR01', 364, 1, '2020-09-17 15:00:00', 11, 320, '2020-09-17 17:00:00');
insert into Orario values (1428, 'FAR01', 364, 2, '2020-09-21 11:00:00', 11, 322, '2020-09-21 12:00:00');
insert into Orario values (1429, 'FAR01', 364, 2, '2020-09-25 13:00:00', 11, 121, '2020-09-25 15:00:00');
insert into Orario values (1430, 'FAR01', 365, 1, '2021-09-24 13:00:00', 11, 218, '2021-09-24 15:00:00');
insert into Orario values (1431, 'FAR01', 365, 1, '2021-09-25 15:00:00', 11, 121, '2021-09-25 17:00:00');
insert into Orario values (1432, 'FAR01', 365, 1, '2021-09-23 09:00:00', 11, 322, '2021-09-23 11:00:00');
insert into Orario values (1433, 'FAR01', 365, 2, '2021-09-22 11:00:00', 11, 121, '2021-09-22 12:00:00');
insert into Orario values (1434, 'FAR01', 366, 1, '2022-09-13 11:00:00', 11, 320, '2022-09-13 12:00:00');
insert into Orario values (1435, 'FAR01', 366, 1, '2022-09-11 09:00:00', 11, 121, '2022-09-11 11:00:00');
insert into Orario values (1436, 'FAR01', 366, 2, '2022-09-21 11:00:00', 11, 320, '2022-09-21 12:00:00');
insert into Orario values (1437, 'FAR01', 366, 2, '2022-09-20 11:00:00', 11, 121, '2022-09-20 12:00:00');
insert into Orario values (1438, 'FAR01', 367, 1, '2023-09-12 15:00:00', 11, 218, '2023-09-12 17:00:00');
insert into Orario values (1439, 'FAR01', 367, 1, '2023-09-10 15:00:00', 11, 218, '2023-09-10 17:00:00');
insert into Orario values (1440, 'FAR01', 368, 1, '2024-09-23 09:00:00', 11, 121, '2024-09-23 11:00:00');
insert into Orario values (1441, 'FAR01', 368, 1, '2024-09-21 13:00:00', 11, 218, '2024-09-21 15:00:00');
insert into Orario values (1442, 'FAR01', 368, 2, '2024-09-17 11:00:00', 11, 320, '2024-09-17 12:00:00');
insert into Orario values (1443, 'FAR01', 368, 2, '2024-09-16 15:00:00', 11, 218, '2024-09-16 17:00:00');
insert into Orario values (1444, 'FAR01', 369, 1, '2025-09-13 13:00:00', 11, 322, '2025-09-13 15:00:00');
insert into Orario values (1445, 'FAR01', 369, 1, '2025-09-16 11:00:00', 11, 121, '2025-09-16 12:00:00');
insert into Orario values (1446, 'FAR01', 369, 1, '2025-09-14 11:00:00', 11, 218, '2025-09-14 12:00:00');
insert into Orario values (1447, 'FAR01', 370, 1, '2026-09-25 11:00:00', 11, 322, '2026-09-25 12:00:00');
insert into Orario values (1448, 'FAR01', 370, 1, '2026-09-23 15:00:00', 11, 121, '2026-09-23 17:00:00');
insert into Orario values (1449, 'FAR01', 370, 2, '2026-09-13 13:00:00', 11, 121, '2026-09-13 15:00:00');
insert into Orario values (1450, 'FAR01', 370, 2, '2026-09-16 11:00:00', 11, 121, '2026-09-16 12:00:00');
insert into Orario values (1451, 'BIOFAR01', 371, 1, '2020-02-13 11:00:00', 12, 500, '2020-02-13 12:00:00');
insert into Orario values (1452, 'BIOFAR01', 371, 1, '2020-02-10 15:00:00', 12, 217, '2020-02-10 17:00:00');
insert into Orario values (1453, 'BIOFAR01', 371, 1, '2020-02-15 11:00:00', 12, 217, '2020-02-15 12:00:00');
insert into Orario values (1454, 'BIOFAR01', 371, 2, '2020-02-17 11:00:00', 12, 500, '2020-02-17 12:00:00');
insert into Orario values (1455, 'BIOFAR01', 371, 2, '2020-02-19 15:00:00', 12, 313, '2020-02-19 17:00:00');
insert into Orario values (1456, 'BIOFAR01', 371, 2, '2020-02-15 13:00:00', 12, 313, '2020-02-15 15:00:00');
insert into Orario values (1457, 'BIOFAR01', 372, 1, '2021-02-09 09:00:00', 12, 313, '2021-02-09 11:00:00');
insert into Orario values (1458, 'BIOFAR01', 372, 1, '2021-02-10 13:00:00', 12, 400, '2021-02-10 15:00:00');
insert into Orario values (1459, 'BIOFAR01', 372, 1, '2021-02-11 13:00:00', 12, 400, '2021-02-11 15:00:00');
insert into Orario values (1460, 'BIOFAR01', 372, 2, '2021-02-24 09:00:00', 12, 217, '2021-02-24 11:00:00');
insert into Orario values (1461, 'BIOFAR01', 372, 2, '2021-02-23 09:00:00', 12, 400, '2021-02-23 11:00:00');
insert into Orario values (1462, 'BIOFAR01', 373, 1, '2022-02-20 11:00:00', 12, 500, '2022-02-20 12:00:00');
insert into Orario values (1463, 'BIOFAR01', 373, 1, '2022-02-19 09:00:00', 12, 313, '2022-02-19 11:00:00');
insert into Orario values (1464, 'BIOFAR01', 373, 1, '2022-02-23 09:00:00', 12, 428, '2022-02-23 11:00:00');
insert into Orario values (1465, 'BIOFAR01', 373, 2, '2022-02-18 11:00:00', 12, 217, '2022-02-18 12:00:00');
insert into Orario values (1466, 'BIOFAR01', 373, 2, '2022-02-14 15:00:00', 12, 428, '2022-02-14 17:00:00');
insert into Orario values (1467, 'BIOFAR01', 374, 1, '2023-02-17 11:00:00', 12, 313, '2023-02-17 12:00:00');
insert into Orario values (1468, 'BIOFAR01', 374, 1, '2023-02-18 09:00:00', 12, 313, '2023-02-18 11:00:00');
insert into Orario values (1469, 'BIOFAR01', 374, 2, '2023-02-18 11:00:00', 12, 500, '2023-02-18 12:00:00');
insert into Orario values (1470, 'BIOFAR01', 374, 2, '2023-02-15 11:00:00', 12, 217, '2023-02-15 12:00:00');
insert into Orario values (1471, 'BIOFAR01', 375, 1, '2024-02-19 09:00:00', 12, 217, '2024-02-19 11:00:00');
insert into Orario values (1472, 'BIOFAR01', 375, 1, '2024-02-14 11:00:00', 12, 500, '2024-02-14 12:00:00');
insert into Orario values (1473, 'BIOFAR01', 375, 2, '2024-02-16 09:00:00', 12, 217, '2024-02-16 11:00:00');
insert into Orario values (1474, 'BIOFAR01', 375, 2, '2024-02-20 11:00:00', 12, 400, '2024-02-20 12:00:00');
insert into Orario values (1475, 'BIOFAR01', 376, 1, '2025-02-21 15:00:00', 12, 400, '2025-02-21 17:00:00');
insert into Orario values (1476, 'BIOFAR01', 376, 1, '2025-02-22 09:00:00', 12, 217, '2025-02-22 11:00:00');
insert into Orario values (1477, 'BIOFAR01', 376, 1, '2025-02-19 09:00:00', 12, 217, '2025-02-19 11:00:00');
insert into Orario values (1478, 'BIOFAR01', 377, 1, '2026-02-18 13:00:00', 12, 400, '2026-02-18 15:00:00');
insert into Orario values (1479, 'BIOFAR01', 377, 1, '2026-02-20 09:00:00', 12, 400, '2026-02-20 11:00:00');
insert into Orario values (1480, 'MED01', 378, 1, '2020-09-15 09:00:00', 12, 217, '2020-09-15 11:00:00');
insert into Orario values (1481, 'MED01', 378, 1, '2020-09-17 09:00:00', 12, 217, '2020-09-17 11:00:00');
insert into Orario values (1482, 'MED01', 378, 1, '2020-09-18 15:00:00', 12, 313, '2020-09-18 17:00:00');
insert into Orario values (1483, 'MED01', 379, 1, '2021-09-14 09:00:00', 12, 400, '2021-09-14 11:00:00');
insert into Orario values (1484, 'MED01', 379, 1, '2021-09-17 11:00:00', 12, 500, '2021-09-17 12:00:00');
insert into Orario values (1485, 'MED01', 379, 1, '2021-09-16 15:00:00', 12, 217, '2021-09-16 17:00:00');
insert into Orario values (1486, 'MED01', 379, 2, '2021-09-09 11:00:00', 12, 217, '2021-09-09 12:00:00');
insert into Orario values (1487, 'MED01', 379, 2, '2021-09-11 09:00:00', 12, 428, '2021-09-11 11:00:00');
insert into Orario values (1488, 'MED01', 379, 2, '2021-09-10 09:00:00', 12, 428, '2021-09-10 11:00:00');
insert into Orario values (1489, 'MED01', 380, 1, '2022-09-24 09:00:00', 12, 500, '2022-09-24 11:00:00');
insert into Orario values (1490, 'MED01', 380, 1, '2022-09-27 09:00:00', 12, 313, '2022-09-27 11:00:00');
insert into Orario values (1491, 'MED01', 380, 1, '2022-09-22 13:00:00', 12, 428, '2022-09-22 15:00:00');
insert into Orario values (1492, 'MED01', 381, 1, '2023-09-16 11:00:00', 12, 428, '2023-09-16 12:00:00');
insert into Orario values (1493, 'MED01', 381, 1, '2023-09-17 15:00:00', 12, 428, '2023-09-17 17:00:00');
insert into Orario values (1494, 'MED01', 382, 1, '2024-09-18 09:00:00', 12, 400, '2024-09-18 11:00:00');
insert into Orario values (1495, 'MED01', 382, 1, '2024-09-22 15:00:00', 12, 217, '2024-09-22 17:00:00');
insert into Orario values (1496, 'MED01', 382, 1, '2024-09-19 11:00:00', 12, 428, '2024-09-19 12:00:00');
insert into Orario values (1497, 'MED01', 382, 2, '2024-09-13 15:00:00', 12, 428, '2024-09-13 17:00:00');
insert into Orario values (1498, 'MED01', 382, 2, '2024-09-12 15:00:00', 12, 217, '2024-09-12 17:00:00');
insert into Orario values (1499, 'MED01', 383, 1, '2025-09-11 15:00:00', 12, 428, '2025-09-11 17:00:00');
insert into Orario values (1500, 'MED01', 383, 1, '2025-09-08 13:00:00', 12, 428, '2025-09-08 15:00:00');
insert into Orario values (1501, 'MED01', 384, 1, '2026-09-10 13:00:00', 12, 428, '2026-09-10 15:00:00');
insert into Orario values (1502, 'MED01', 384, 1, '2026-09-11 15:00:00', 12, 500, '2026-09-11 17:00:00');
insert into Orario values (1503, 'MED01', 384, 1, '2026-09-14 15:00:00', 12, 217, '2026-09-14 17:00:00');
insert into Orario values (1504, 'MED01', 385, 1, '2020-02-24 13:00:00', 12, 428, '2020-02-24 15:00:00');
insert into Orario values (1505, 'MED01', 385, 1, '2020-02-22 15:00:00', 12, 500, '2020-02-22 17:00:00');
insert into Orario values (1506, 'MED01', 386, 1, '2021-02-22 13:00:00', 12, 428, '2021-02-22 15:00:00');
insert into Orario values (1507, 'MED01', 386, 1, '2021-02-21 15:00:00', 12, 400, '2021-02-21 17:00:00');
insert into Orario values (1508, 'MED01', 387, 1, '2022-02-11 09:00:00', 12, 313, '2022-02-11 11:00:00');
insert into Orario values (1509, 'MED01', 387, 1, '2022-02-15 09:00:00', 12, 428, '2022-02-15 11:00:00');
insert into Orario values (1510, 'MED01', 387, 1, '2022-02-14 13:00:00', 12, 428, '2022-02-14 15:00:00');
insert into Orario values (1511, 'MED01', 387, 2, '2022-02-13 15:00:00', 12, 500, '2022-02-13 17:00:00');
insert into Orario values (1512, 'MED01', 387, 2, '2022-02-16 09:00:00', 12, 400, '2022-02-16 11:00:00');
insert into Orario values (1513, 'MED01', 387, 2, '2022-02-14 11:00:00', 12, 400, '2022-02-14 12:00:00');
insert into Orario values (1514, 'MED01', 388, 1, '2023-02-18 11:00:00', 12, 400, '2023-02-18 12:00:00');
insert into Orario values (1515, 'MED01', 388, 1, '2023-02-20 13:00:00', 12, 500, '2023-02-20 15:00:00');
insert into Orario values (1516, 'MED01', 389, 1, '2024-02-19 13:00:00', 12, 217, '2024-02-19 15:00:00');
insert into Orario values (1517, 'MED01', 389, 1, '2024-02-20 13:00:00', 12, 217, '2024-02-20 15:00:00');
insert into Orario values (1518, 'MED01', 390, 1, '2025-02-18 11:00:00', 12, 217, '2025-02-18 12:00:00');
insert into Orario values (1519, 'MED01', 390, 1, '2025-02-16 09:00:00', 12, 428, '2025-02-16 11:00:00');
insert into Orario values (1520, 'MED01', 390, 1, '2025-02-17 09:00:00', 12, 428, '2025-02-17 11:00:00');
insert into Orario values (1521, 'MED01', 390, 2, '2025-02-15 15:00:00', 12, 500, '2025-02-15 17:00:00');
insert into Orario values (1522, 'MED01', 390, 2, '2025-02-13 13:00:00', 12, 500, '2025-02-13 15:00:00');
insert into Orario values (1523, 'MED01', 391, 1, '2026-02-18 09:00:00', 12, 217, '2026-02-18 11:00:00');
insert into Orario values (1524, 'MED01', 391, 1, '2026-02-19 11:00:00', 12, 313, '2026-02-19 12:00:00');
insert into Orario values (1525, 'ANA01', 392, 1, '2020-09-19 09:00:00', 12, 313, '2020-09-19 11:00:00');
insert into Orario values (1526, 'ANA01', 392, 1, '2020-09-18 11:00:00', 12, 313, '2020-09-18 12:00:00');
insert into Orario values (1527, 'ANA01', 393, 1, '2021-09-18 09:00:00', 12, 313, '2021-09-18 11:00:00');
insert into Orario values (1528, 'ANA01', 393, 1, '2021-09-21 09:00:00', 12, 313, '2021-09-21 11:00:00');
insert into Orario values (1529, 'ANA01', 394, 1, '2022-09-08 15:00:00', 12, 428, '2022-09-08 17:00:00');
insert into Orario values (1530, 'ANA01', 394, 1, '2022-09-11 11:00:00', 12, 500, '2022-09-11 12:00:00');
insert into Orario values (1531, 'ANA01', 395, 1, '2023-09-26 15:00:00', 12, 500, '2023-09-26 17:00:00');
insert into Orario values (1532, 'ANA01', 395, 1, '2023-09-24 11:00:00', 12, 500, '2023-09-24 12:00:00');
insert into Orario values (1533, 'ANA01', 395, 1, '2023-09-23 09:00:00', 12, 400, '2023-09-23 11:00:00');
insert into Orario values (1534, 'ANA01', 396, 1, '2024-09-27 09:00:00', 12, 217, '2024-09-27 11:00:00');
insert into Orario values (1535, 'ANA01', 396, 1, '2024-09-24 09:00:00', 12, 400, '2024-09-24 11:00:00');
insert into Orario values (1536, 'ANA01', 396, 1, '2024-09-26 13:00:00', 12, 400, '2024-09-26 15:00:00');
insert into Orario values (1537, 'ANA01', 396, 2, '2024-09-14 11:00:00', 12, 500, '2024-09-14 12:00:00');
insert into Orario values (1538, 'ANA01', 396, 2, '2024-09-12 11:00:00', 12, 428, '2024-09-12 12:00:00');
insert into Orario values (1539, 'ANA01', 397, 1, '2025-09-15 11:00:00', 12, 313, '2025-09-15 12:00:00');
insert into Orario values (1540, 'ANA01', 397, 1, '2025-09-12 13:00:00', 12, 428, '2025-09-12 15:00:00');
insert into Orario values (1541, 'ANA01', 397, 1, '2025-09-17 13:00:00', 12, 428, '2025-09-17 15:00:00');
insert into Orario values (1542, 'ANA01', 397, 2, '2025-09-24 09:00:00', 12, 428, '2025-09-24 11:00:00');
insert into Orario values (1543, 'ANA01', 397, 2, '2025-09-26 15:00:00', 12, 217, '2025-09-26 17:00:00');
insert into Orario values (1544, 'ANA01', 397, 3, '2025-09-16 15:00:00', 12, 500, '2025-09-16 17:00:00');
insert into Orario values (1545, 'ANA01', 397, 3, '2025-09-20 13:00:00', 12, 400, '2025-09-20 15:00:00');
insert into Orario values (1546, 'ANA01', 397, 4, '2025-09-22 15:00:00', 12, 500, '2025-09-22 17:00:00');
insert into Orario values (1547, 'ANA01', 397, 4, '2025-09-21 11:00:00', 12, 428, '2025-09-21 12:00:00');
insert into Orario values (1548, 'ANA01', 398, 1, '2026-09-22 15:00:00', 12, 217, '2026-09-22 17:00:00');
insert into Orario values (1549, 'ANA01', 398, 1, '2026-09-21 13:00:00', 12, 500, '2026-09-21 15:00:00');
insert into Orario values (1550, 'ANA01', 398, 1, '2026-09-23 09:00:00', 12, 217, '2026-09-23 11:00:00');
insert into Orario values (1551, 'STA01', 399, 1, '2020-02-25 13:00:00', 13, 514, '2020-02-25 15:00:00');
insert into Orario values (1552, 'STA01', 399, 1, '2020-02-20 13:00:00', 13, 222, '2020-02-20 15:00:00');
insert into Orario values (1553, 'STA01', 399, 2, '2020-02-10 09:00:00', 13, 222, '2020-02-10 11:00:00');
insert into Orario values (1554, 'STA01', 399, 2, '2020-02-15 09:00:00', 13, 306, '2020-02-15 11:00:00');
insert into Orario values (1555, 'STA01', 399, 2, '2020-02-12 09:00:00', 13, 222, '2020-02-12 11:00:00');
insert into Orario values (1556, 'STA01', 400, 1, '2021-02-21 15:00:00', 13, 222, '2021-02-21 17:00:00');
insert into Orario values (1557, 'STA01', 400, 1, '2021-02-22 11:00:00', 13, 120, '2021-02-22 12:00:00');
insert into Orario values (1558, 'STA01', 400, 1, '2021-02-20 11:00:00', 13, 120, '2021-02-20 12:00:00');
insert into Orario values (1559, 'STA01', 400, 2, '2021-02-12 13:00:00', 13, 228, '2021-02-12 15:00:00');
insert into Orario values (1560, 'STA01', 400, 2, '2021-02-11 11:00:00', 13, 222, '2021-02-11 12:00:00');
insert into Orario values (1561, 'STA01', 400, 3, '2021-02-16 09:00:00', 13, 228, '2021-02-16 11:00:00');
insert into Orario values (1562, 'STA01', 400, 3, '2021-02-12 11:00:00', 13, 228, '2021-02-12 12:00:00');
insert into Orario values (1563, 'STA01', 400, 3, '2021-02-14 11:00:00', 13, 514, '2021-02-14 12:00:00');
insert into Orario values (1564, 'STA01', 400, 4, '2021-02-21 09:00:00', 13, 228, '2021-02-21 11:00:00');
insert into Orario values (1565, 'STA01', 401, 1, '2022-02-12 11:00:00', 13, 228, '2022-02-12 12:00:00');
insert into Orario values (1566, 'STA01', 401, 1, '2022-02-11 09:00:00', 13, 120, '2022-02-11 11:00:00');
insert into Orario values (1567, 'STA01', 402, 1, '2023-02-18 11:00:00', 13, 120, '2023-02-18 12:00:00');
insert into Orario values (1568, 'STA01', 402, 1, '2023-02-20 13:00:00', 13, 222, '2023-02-20 15:00:00');
insert into Orario values (1569, 'STA01', 402, 1, '2023-02-17 09:00:00', 13, 514, '2023-02-17 11:00:00');
insert into Orario values (1570, 'STA01', 402, 2, '2023-02-16 11:00:00', 13, 120, '2023-02-16 12:00:00');
insert into Orario values (1571, 'STA01', 402, 2, '2023-02-13 13:00:00', 13, 222, '2023-02-13 15:00:00');
insert into Orario values (1572, 'STA01', 403, 1, '2024-02-18 15:00:00', 13, 514, '2024-02-18 17:00:00');
insert into Orario values (1573, 'STA01', 403, 1, '2024-02-17 09:00:00', 13, 120, '2024-02-17 11:00:00');
insert into Orario values (1574, 'STA01', 403, 1, '2024-02-13 15:00:00', 13, 517, '2024-02-13 17:00:00');
insert into Orario values (1575, 'STA01', 403, 2, '2024-02-27 11:00:00', 13, 517, '2024-02-27 12:00:00');
insert into Orario values (1576, 'STA01', 403, 2, '2024-02-25 11:00:00', 13, 306, '2024-02-25 12:00:00');
insert into Orario values (1577, 'STA01', 403, 2, '2024-02-24 11:00:00', 13, 222, '2024-02-24 12:00:00');
insert into Orario values (1578, 'STA01', 404, 1, '2025-02-16 09:00:00', 13, 222, '2025-02-16 11:00:00');
insert into Orario values (1579, 'STA01', 404, 1, '2025-02-17 13:00:00', 13, 517, '2025-02-17 15:00:00');
insert into Orario values (1580, 'STA01', 405, 1, '2026-02-15 11:00:00', 13, 222, '2026-02-15 12:00:00');
insert into Orario values (1581, 'STA01', 405, 1, '2026-02-18 15:00:00', 13, 306, '2026-02-18 17:00:00');
insert into Orario values (1582, 'STA01', 405, 1, '2026-02-16 09:00:00', 13, 222, '2026-02-16 11:00:00');
insert into Orario values (1583, 'STA01', 406, 1, '2020-09-15 09:00:00', 13, 306, '2020-09-15 11:00:00');
insert into Orario values (1584, 'STA01', 406, 1, '2020-09-14 13:00:00', 13, 228, '2020-09-14 15:00:00');
insert into Orario values (1585, 'STA01', 407, 1, '2021-09-16 09:00:00', 13, 222, '2021-09-16 11:00:00');
insert into Orario values (1586, 'STA01', 407, 1, '2021-09-15 09:00:00', 13, 120, '2021-09-15 11:00:00');
insert into Orario values (1587, 'STA01', 408, 1, '2022-09-25 09:00:00', 13, 222, '2022-09-25 11:00:00');
insert into Orario values (1588, 'STA01', 408, 1, '2022-09-21 11:00:00', 13, 120, '2022-09-21 12:00:00');
insert into Orario values (1589, 'STA01', 408, 1, '2022-09-24 13:00:00', 13, 517, '2022-09-24 15:00:00');
insert into Orario values (1590, 'STA01', 408, 2, '2022-09-23 11:00:00', 13, 306, '2022-09-23 12:00:00');
insert into Orario values (1591, 'STA01', 408, 2, '2022-09-22 15:00:00', 13, 120, '2022-09-22 17:00:00');
insert into Orario values (1592, 'STA01', 408, 2, '2022-09-21 13:00:00', 13, 517, '2022-09-21 15:00:00');
insert into Orario values (1593, 'STA01', 409, 1, '2023-09-16 09:00:00', 13, 228, '2023-09-16 11:00:00');
insert into Orario values (1594, 'STA01', 409, 1, '2023-09-20 11:00:00', 13, 228, '2023-09-20 12:00:00');
insert into Orario values (1595, 'STA01', 409, 2, '2023-09-22 09:00:00', 13, 517, '2023-09-22 11:00:00');
insert into Orario values (1596, 'STA01', 409, 2, '2023-09-21 09:00:00', 13, 222, '2023-09-21 11:00:00');
insert into Orario values (1597, 'STA01', 409, 2, '2023-09-19 15:00:00', 13, 306, '2023-09-19 17:00:00');
insert into Orario values (1598, 'STA01', 410, 1, '2024-09-10 15:00:00', 13, 514, '2024-09-10 17:00:00');
insert into Orario values (1599, 'STA01', 410, 1, '2024-09-14 09:00:00', 13, 306, '2024-09-14 11:00:00');
insert into Orario values (1600, 'STA01', 410, 1, '2024-09-11 09:00:00', 13, 222, '2024-09-11 11:00:00');
insert into Orario values (1601, 'STA01', 411, 1, '2025-09-18 13:00:00', 13, 517, '2025-09-18 15:00:00');
insert into Orario values (1602, 'STA01', 411, 1, '2025-09-16 13:00:00', 13, 517, '2025-09-16 15:00:00');
insert into Orario values (1603, 'STA01', 412, 1, '2026-09-17 15:00:00', 13, 514, '2026-09-17 17:00:00');
insert into Orario values (1604, 'STA01', 412, 1, '2026-09-20 13:00:00', 13, 222, '2026-09-20 15:00:00');
insert into Orario values (1605, 'STA01', 412, 2, '2026-09-13 09:00:00', 13, 517, '2026-09-13 11:00:00');
insert into Orario values (1606, 'STA01', 412, 2, '2026-09-14 11:00:00', 13, 306, '2026-09-14 12:00:00');
insert into Orario values (1607, 'STA01', 412, 2, '2026-09-11 11:00:00', 13, 120, '2026-09-11 12:00:00');
insert into Orario values (1608, 'MAT01', 413, 1, '2020-09-16 11:00:00', 14, 515, '2020-09-16 12:00:00');
insert into Orario values (1609, 'MAT01', 413, 1, '2020-09-18 11:00:00', 14, 205, '2020-09-18 12:00:00');
insert into Orario values (1610, 'MAT01', 413, 1, '2020-09-21 11:00:00', 14, 515, '2020-09-21 12:00:00');
insert into Orario values (1611, 'MAT01', 414, 1, '2021-09-24 15:00:00', 14, 205, '2021-09-24 17:00:00');
insert into Orario values (1612, 'MAT01', 414, 1, '2021-09-23 09:00:00', 14, 515, '2021-09-23 11:00:00');
insert into Orario values (1613, 'MAT01', 414, 1, '2021-09-22 15:00:00', 14, 205, '2021-09-22 17:00:00');
insert into Orario values (1614, 'MAT01', 414, 2, '2021-09-12 13:00:00', 14, 205, '2021-09-12 15:00:00');
insert into Orario values (1615, 'MAT01', 414, 2, '2021-09-10 11:00:00', 14, 205, '2021-09-10 12:00:00');
insert into Orario values (1616, 'MAT01', 415, 1, '2022-09-20 09:00:00', 14, 515, '2022-09-20 11:00:00');
insert into Orario values (1617, 'MAT01', 415, 1, '2022-09-21 15:00:00', 14, 205, '2022-09-21 17:00:00');
insert into Orario values (1618, 'MAT01', 415, 1, '2022-09-23 11:00:00', 14, 205, '2022-09-23 12:00:00');
insert into Orario values (1619, 'MAT01', 415, 2, '2022-09-25 11:00:00', 14, 217, '2022-09-25 12:00:00');
insert into Orario values (1620, 'MAT01', 416, 1, '2023-09-17 11:00:00', 14, 217, '2023-09-17 12:00:00');
insert into Orario values (1621, 'MAT01', 416, 1, '2023-09-19 15:00:00', 14, 515, '2023-09-19 17:00:00');
insert into Orario values (1622, 'MAT01', 416, 1, '2023-09-21 15:00:00', 14, 515, '2023-09-21 17:00:00');
insert into Orario values (1623, 'MAT01', 417, 1, '2024-09-23 15:00:00', 14, 205, '2024-09-23 17:00:00');
insert into Orario values (1624, 'MAT01', 417, 1, '2024-09-20 15:00:00', 14, 205, '2024-09-20 17:00:00');
insert into Orario values (1625, 'MAT01', 417, 2, '2024-09-17 11:00:00', 14, 205, '2024-09-17 12:00:00');
insert into Orario values (1626, 'MAT01', 417, 2, '2024-09-14 15:00:00', 14, 205, '2024-09-14 17:00:00');
insert into Orario values (1627, 'MAT01', 417, 2, '2024-09-15 15:00:00', 14, 217, '2024-09-15 17:00:00');
insert into Orario values (1628, 'MAT01', 418, 1, '2025-09-19 13:00:00', 14, 515, '2025-09-19 15:00:00');
insert into Orario values (1629, 'MAT01', 418, 1, '2025-09-18 15:00:00', 14, 515, '2025-09-18 17:00:00');
insert into Orario values (1630, 'MAT01', 418, 1, '2025-09-20 09:00:00', 14, 515, '2025-09-20 11:00:00');
insert into Orario values (1631, 'MAT01', 418, 2, '2025-09-18 13:00:00', 14, 205, '2025-09-18 15:00:00');
insert into Orario values (1632, 'MAT01', 418, 3, '2025-09-22 13:00:00', 14, 515, '2025-09-22 15:00:00');
insert into Orario values (1633, 'MAT01', 418, 3, '2025-09-20 13:00:00', 14, 205, '2025-09-20 15:00:00');
insert into Orario values (1634, 'MAT01', 418, 4, '2025-09-23 09:00:00', 14, 515, '2025-09-23 11:00:00');
insert into Orario values (1635, 'MAT01', 418, 4, '2025-09-21 15:00:00', 14, 205, '2025-09-21 17:00:00');
insert into Orario values (1636, 'MAT01', 418, 4, '2025-09-25 09:00:00', 14, 515, '2025-09-25 11:00:00');
insert into Orario values (1637, 'MAT01', 419, 1, '2026-09-16 15:00:00', 14, 217, '2026-09-16 17:00:00');
insert into Orario values (1638, 'MAT01', 419, 1, '2026-09-19 11:00:00', 14, 515, '2026-09-19 12:00:00');
insert into Orario values (1639, 'MAT01', 419, 1, '2026-09-20 15:00:00', 14, 515, '2026-09-20 17:00:00');
insert into Orario values (1640, 'MAT01', 419, 2, '2026-09-13 09:00:00', 14, 217, '2026-09-13 11:00:00');
insert into Orario values (1641, 'MAT01', 419, 2, '2026-09-08 13:00:00', 14, 205, '2026-09-08 15:00:00');
insert into Orario values (1642, 'MAT01', 419, 3, '2026-09-12 15:00:00', 14, 217, '2026-09-12 17:00:00');
insert into Orario values (1643, 'MAT01', 419, 3, '2026-09-09 09:00:00', 14, 217, '2026-09-09 11:00:00');
insert into Orario values (1644, 'MAT01', 419, 4, '2026-09-22 15:00:00', 14, 217, '2026-09-22 17:00:00');
insert into Orario values (1645, 'FIS01', 420, 1, '2020-02-18 15:00:00', 14, 515, '2020-02-18 17:00:00');
insert into Orario values (1646, 'FIS01', 420, 1, '2020-02-19 09:00:00', 14, 217, '2020-02-19 11:00:00');
insert into Orario values (1647, 'FIS01', 420, 2, '2020-02-23 11:00:00', 14, 217, '2020-02-23 12:00:00');
insert into Orario values (1648, 'FIS01', 420, 2, '2020-02-22 15:00:00', 14, 217, '2020-02-22 17:00:00');
insert into Orario values (1649, 'FIS01', 421, 1, '2021-02-23 13:00:00', 14, 205, '2021-02-23 15:00:00');
insert into Orario values (1650, 'FIS01', 421, 1, '2021-02-20 15:00:00', 14, 515, '2021-02-20 17:00:00');
insert into Orario values (1651, 'FIS01', 421, 1, '2021-02-24 09:00:00', 14, 515, '2021-02-24 11:00:00');
insert into Orario values (1652, 'FIS01', 422, 1, '2022-02-23 13:00:00', 14, 205, '2022-02-23 15:00:00');
insert into Orario values (1653, 'FIS01', 422, 1, '2022-02-25 09:00:00', 14, 217, '2022-02-25 11:00:00');
insert into Orario values (1654, 'FIS01', 422, 1, '2022-02-27 13:00:00', 14, 217, '2022-02-27 15:00:00');
insert into Orario values (1655, 'FIS01', 422, 2, '2022-02-12 09:00:00', 14, 205, '2022-02-12 11:00:00');
insert into Orario values (1656, 'FIS01', 422, 2, '2022-02-08 09:00:00', 14, 205, '2022-02-08 11:00:00');
insert into Orario values (1657, 'FIS01', 422, 3, '2022-02-16 15:00:00', 14, 205, '2022-02-16 17:00:00');
insert into Orario values (1658, 'FIS01', 422, 3, '2022-02-12 13:00:00', 14, 205, '2022-02-12 15:00:00');
insert into Orario values (1659, 'FIS01', 422, 3, '2022-02-13 15:00:00', 14, 515, '2022-02-13 17:00:00');
insert into Orario values (1660, 'FIS01', 422, 4, '2022-02-16 11:00:00', 14, 515, '2022-02-16 12:00:00');
insert into Orario values (1661, 'FIS01', 422, 4, '2022-02-20 13:00:00', 14, 515, '2022-02-20 15:00:00');
insert into Orario values (1662, 'FIS01', 422, 4, '2022-02-19 15:00:00', 14, 205, '2022-02-19 17:00:00');
insert into Orario values (1663, 'FIS01', 423, 1, '2023-02-23 09:00:00', 14, 205, '2023-02-23 11:00:00');
insert into Orario values (1664, 'FIS01', 423, 1, '2023-02-26 15:00:00', 14, 205, '2023-02-26 17:00:00');
insert into Orario values (1665, 'FIS01', 423, 1, '2023-02-21 15:00:00', 14, 217, '2023-02-21 17:00:00');
insert into Orario values (1666, 'FIS01', 424, 1, '2024-02-16 11:00:00', 14, 515, '2024-02-16 12:00:00');
insert into Orario values (1667, 'FIS01', 424, 1, '2024-02-14 09:00:00', 14, 515, '2024-02-14 11:00:00');
insert into Orario values (1668, 'FIS01', 424, 1, '2024-02-12 09:00:00', 14, 217, '2024-02-12 11:00:00');
insert into Orario values (1669, 'FIS01', 424, 2, '2024-02-22 15:00:00', 14, 205, '2024-02-22 17:00:00');
insert into Orario values (1670, 'FIS01', 424, 2, '2024-02-20 11:00:00', 14, 217, '2024-02-20 12:00:00');
insert into Orario values (1671, 'FIS01', 425, 1, '2025-02-11 15:00:00', 14, 515, '2025-02-11 17:00:00');
insert into Orario values (1672, 'FIS01', 425, 1, '2025-02-10 13:00:00', 14, 205, '2025-02-10 15:00:00');
insert into Orario values (1673, 'FIS01', 425, 1, '2025-02-09 11:00:00', 14, 217, '2025-02-09 12:00:00');
insert into Orario values (1674, 'FIS01', 426, 1, '2026-02-25 13:00:00', 14, 205, '2026-02-25 15:00:00');
insert into Orario values (1675, 'FIS01', 426, 1, '2026-02-26 09:00:00', 14, 205, '2026-02-26 11:00:00');
insert into Orario values (1676, 'FIS01', 426, 2, '2026-02-23 15:00:00', 14, 205, '2026-02-23 17:00:00');
insert into Orario values (1677, 'FIS01', 426, 2, '2026-02-22 13:00:00', 14, 205, '2026-02-22 15:00:00');
insert into Orario values (1678, 'FIS01', 426, 2, '2026-02-20 09:00:00', 14, 217, '2026-02-20 11:00:00');
insert into Orario values (1679, 'CHI01', 427, 1, '2020-09-17 09:00:00', 15, 209, '2020-09-17 11:00:00');
insert into Orario values (1680, 'CHI01', 427, 1, '2020-09-15 15:00:00', 15, 121, '2020-09-15 17:00:00');
insert into Orario values (1681, 'CHI01', 427, 1, '2020-09-16 13:00:00', 15, 512, '2020-09-16 15:00:00');
insert into Orario values (1682, 'CHI01', 428, 1, '2021-09-13 11:00:00', 15, 121, '2021-09-13 12:00:00');
insert into Orario values (1683, 'CHI01', 428, 1, '2021-09-15 13:00:00', 15, 512, '2021-09-15 15:00:00');
insert into Orario values (1684, 'CHI01', 428, 1, '2021-09-17 09:00:00', 15, 209, '2021-09-17 11:00:00');
insert into Orario values (1685, 'CHI01', 428, 2, '2021-09-22 15:00:00', 15, 512, '2021-09-22 17:00:00');
insert into Orario values (1686, 'CHI01', 428, 2, '2021-09-26 09:00:00', 15, 121, '2021-09-26 11:00:00');
insert into Orario values (1687, 'CHI01', 428, 3, '2021-09-21 11:00:00', 15, 512, '2021-09-21 12:00:00');
insert into Orario values (1688, 'CHI01', 428, 3, '2021-09-18 15:00:00', 15, 512, '2021-09-18 17:00:00');
insert into Orario values (1689, 'CHI01', 428, 4, '2021-09-16 11:00:00', 15, 121, '2021-09-16 12:00:00');
insert into Orario values (1690, 'CHI01', 428, 4, '2021-09-19 09:00:00', 15, 209, '2021-09-19 11:00:00');
insert into Orario values (1691, 'CHI01', 429, 1, '2022-09-15 13:00:00', 15, 512, '2022-09-15 15:00:00');
insert into Orario values (1692, 'CHI01', 429, 1, '2022-09-17 11:00:00', 15, 209, '2022-09-17 12:00:00');
insert into Orario values (1693, 'CHI01', 430, 1, '2023-09-19 15:00:00', 15, 209, '2023-09-19 17:00:00');
insert into Orario values (1694, 'CHI01', 430, 1, '2023-09-18 09:00:00', 15, 209, '2023-09-18 11:00:00');
insert into Orario values (1695, 'CHI01', 430, 1, '2023-09-21 09:00:00', 15, 512, '2023-09-21 11:00:00');
insert into Orario values (1696, 'CHI01', 431, 1, '2024-09-25 13:00:00', 15, 209, '2024-09-25 15:00:00');
insert into Orario values (1697, 'CHI01', 431, 1, '2024-09-24 15:00:00', 15, 209, '2024-09-24 17:00:00');
insert into Orario values (1698, 'CHI01', 431, 2, '2024-09-23 09:00:00', 15, 512, '2024-09-23 11:00:00');
insert into Orario values (1699, 'CHI01', 431, 2, '2024-09-22 11:00:00', 15, 121, '2024-09-22 12:00:00');
insert into Orario values (1700, 'CHI01', 432, 1, '2025-09-09 11:00:00', 15, 121, '2025-09-09 12:00:00');
insert into Orario values (1701, 'CHI01', 432, 1, '2025-09-12 11:00:00', 15, 121, '2025-09-12 12:00:00');
insert into Orario values (1702, 'CHI01', 432, 1, '2025-09-11 15:00:00', 15, 512, '2025-09-11 17:00:00');
insert into Orario values (1703, 'CHI01', 432, 2, '2025-09-24 11:00:00', 15, 209, '2025-09-24 12:00:00');
insert into Orario values (1704, 'CHI01', 432, 2, '2025-09-22 11:00:00', 15, 209, '2025-09-22 12:00:00');
insert into Orario values (1705, 'CHI01', 432, 3, '2025-09-19 09:00:00', 15, 209, '2025-09-19 11:00:00');
insert into Orario values (1706, 'CHI01', 432, 3, '2025-09-21 15:00:00', 15, 121, '2025-09-21 17:00:00');
insert into Orario values (1707, 'CHI01', 432, 4, '2025-09-21 11:00:00', 15, 121, '2025-09-21 12:00:00');
insert into Orario values (1708, 'CHI01', 432, 4, '2025-09-18 13:00:00', 15, 121, '2025-09-18 15:00:00');
insert into Orario values (1709, 'CHI01', 433, 1, '2026-09-24 09:00:00', 15, 512, '2026-09-24 11:00:00');
insert into Orario values (1710, 'CHI01', 433, 1, '2026-09-22 11:00:00', 15, 121, '2026-09-22 12:00:00');
insert into Orario values (1711, 'CHI01', 433, 1, '2026-09-23 13:00:00', 15, 512, '2026-09-23 15:00:00');
insert into Orario values (1712, 'CHI01', 433, 2, '2026-09-19 11:00:00', 15, 209, '2026-09-19 12:00:00');
insert into Orario values (1713, 'CHI01', 433, 2, '2026-09-18 11:00:00', 15, 121, '2026-09-18 12:00:00');
insert into Orario values (1714, 'CHI01', 433, 2, '2026-09-21 15:00:00', 15, 512, '2026-09-21 17:00:00');
insert into Orario values (1715, 'BIO01', 434, 1, '2020-02-13 15:00:00', 15, 121, '2020-02-13 17:00:00');
insert into Orario values (1716, 'BIO01', 434, 1, '2020-02-09 11:00:00', 15, 512, '2020-02-09 12:00:00');
insert into Orario values (1717, 'BIO01', 434, 1, '2020-02-10 13:00:00', 15, 512, '2020-02-10 15:00:00');
insert into Orario values (1718, 'BIO01', 435, 1, '2021-02-11 13:00:00', 15, 512, '2021-02-11 15:00:00');
insert into Orario values (1719, 'BIO01', 435, 1, '2021-02-08 15:00:00', 15, 121, '2021-02-08 17:00:00');
insert into Orario values (1720, 'BIO01', 435, 2, '2021-02-21 13:00:00', 15, 121, '2021-02-21 15:00:00');
insert into Orario values (1721, 'BIO01', 435, 2, '2021-02-23 11:00:00', 15, 512, '2021-02-23 12:00:00');
insert into Orario values (1722, 'BIO01', 436, 1, '2022-02-20 11:00:00', 15, 121, '2022-02-20 12:00:00');
insert into Orario values (1723, 'BIO01', 436, 1, '2022-02-19 09:00:00', 15, 121, '2022-02-19 11:00:00');
insert into Orario values (1724, 'BIO01', 437, 1, '2023-02-18 09:00:00', 15, 209, '2023-02-18 11:00:00');
insert into Orario values (1725, 'BIO01', 437, 1, '2023-02-13 13:00:00', 15, 121, '2023-02-13 15:00:00');
insert into Orario values (1726, 'BIO01', 437, 1, '2023-02-16 09:00:00', 15, 512, '2023-02-16 11:00:00');
insert into Orario values (1727, 'BIO01', 437, 2, '2023-02-09 09:00:00', 15, 209, '2023-02-09 11:00:00');
insert into Orario values (1728, 'BIO01', 437, 2, '2023-02-10 15:00:00', 15, 512, '2023-02-10 17:00:00');
insert into Orario values (1729, 'BIO01', 437, 2, '2023-02-08 11:00:00', 15, 121, '2023-02-08 12:00:00');
insert into Orario values (1730, 'BIO01', 437, 3, '2023-02-22 09:00:00', 15, 209, '2023-02-22 11:00:00');
insert into Orario values (1731, 'BIO01', 437, 3, '2023-02-23 15:00:00', 15, 209, '2023-02-23 17:00:00');
insert into Orario values (1732, 'BIO01', 437, 3, '2023-02-26 13:00:00', 15, 209, '2023-02-26 15:00:00');
insert into Orario values (1733, 'BIO01', 437, 4, '2023-02-24 13:00:00', 15, 512, '2023-02-24 15:00:00');
insert into Orario values (1734, 'BIO01', 437, 4, '2023-02-26 11:00:00', 15, 209, '2023-02-26 12:00:00');
insert into Orario values (1735, 'BIO01', 437, 4, '2023-02-25 09:00:00', 15, 209, '2023-02-25 11:00:00');
insert into Orario values (1736, 'BIO01', 438, 1, '2024-02-24 15:00:00', 15, 209, '2024-02-24 17:00:00');
insert into Orario values (1737, 'BIO01', 438, 1, '2024-02-25 11:00:00', 15, 512, '2024-02-25 12:00:00');
insert into Orario values (1738, 'BIO01', 438, 1, '2024-02-27 11:00:00', 15, 121, '2024-02-27 12:00:00');
insert into Orario values (1739, 'BIO01', 439, 1, '2025-02-11 11:00:00', 15, 121, '2025-02-11 12:00:00');
insert into Orario values (1740, 'BIO01', 439, 1, '2025-02-16 13:00:00', 15, 121, '2025-02-16 15:00:00');
insert into Orario values (1741, 'BIO01', 440, 1, '2026-02-13 15:00:00', 15, 209, '2026-02-13 17:00:00');
insert into Orario values (1742, 'BIO01', 440, 1, '2026-02-14 13:00:00', 15, 209, '2026-02-14 15:00:00');
insert into Orario values (1743, 'BIO01', 440, 2, '2026-02-14 15:00:00', 15, 512, '2026-02-14 17:00:00');
insert into Orario values (1744, 'BIO01', 440, 2, '2026-02-12 09:00:00', 15, 209, '2026-02-12 11:00:00');
insert into Orario values (1745, 'BIO01', 440, 2, '2026-02-10 11:00:00', 15, 512, '2026-02-10 12:00:00');
insert into Orario values (1746, 'POL01', 441, 1, '2020-09-19 15:00:00', 16, 403, '2020-09-19 17:00:00');
insert into Orario values (1747, 'POL01', 441, 1, '2020-09-20 09:00:00', 16, 403, '2020-09-20 11:00:00');
insert into Orario values (1748, 'POL01', 441, 1, '2020-09-22 09:00:00', 16, 214, '2020-09-22 11:00:00');
insert into Orario values (1749, 'POL01', 442, 1, '2021-09-16 09:00:00', 16, 214, '2021-09-16 11:00:00');
insert into Orario values (1750, 'POL01', 442, 1, '2021-09-15 11:00:00', 16, 214, '2021-09-15 12:00:00');
insert into Orario values (1751, 'POL01', 442, 2, '2021-09-21 15:00:00', 16, 325, '2021-09-21 17:00:00');
insert into Orario values (1752, 'POL01', 442, 3, '2021-09-21 11:00:00', 16, 418, '2021-09-21 12:00:00');
insert into Orario values (1753, 'POL01', 442, 3, '2021-09-24 13:00:00', 16, 426, '2021-09-24 15:00:00');
insert into Orario values (1754, 'POL01', 442, 4, '2021-09-23 11:00:00', 16, 426, '2021-09-23 12:00:00');
insert into Orario values (1755, 'POL01', 442, 4, '2021-09-25 13:00:00', 16, 403, '2021-09-25 15:00:00');
insert into Orario values (1756, 'POL01', 443, 1, '2022-09-15 13:00:00', 16, 214, '2022-09-15 15:00:00');
insert into Orario values (1757, 'POL01', 443, 1, '2022-09-14 09:00:00', 16, 403, '2022-09-14 11:00:00');
insert into Orario values (1758, 'POL01', 443, 1, '2022-09-13 11:00:00', 16, 426, '2022-09-13 12:00:00');
insert into Orario values (1759, 'POL01', 443, 2, '2022-09-18 11:00:00', 16, 418, '2022-09-18 12:00:00');
insert into Orario values (1760, 'POL01', 443, 2, '2022-09-16 11:00:00', 16, 403, '2022-09-16 12:00:00');
insert into Orario values (1761, 'POL01', 443, 2, '2022-09-19 11:00:00', 16, 418, '2022-09-19 12:00:00');
insert into Orario values (1762, 'POL01', 444, 1, '2023-09-21 15:00:00', 16, 418, '2023-09-21 17:00:00');
insert into Orario values (1763, 'POL01', 444, 1, '2023-09-18 15:00:00', 16, 214, '2023-09-18 17:00:00');
insert into Orario values (1764, 'POL01', 444, 1, '2023-09-20 13:00:00', 16, 214, '2023-09-20 15:00:00');
insert into Orario values (1765, 'POL01', 444, 2, '2023-09-19 15:00:00', 16, 214, '2023-09-19 17:00:00');
insert into Orario values (1766, 'POL01', 444, 2, '2023-09-17 15:00:00', 16, 214, '2023-09-17 17:00:00');
insert into Orario values (1767, 'POL01', 445, 1, '2024-09-14 13:00:00', 16, 325, '2024-09-14 15:00:00');
insert into Orario values (1768, 'POL01', 445, 1, '2024-09-15 13:00:00', 16, 214, '2024-09-15 15:00:00');
insert into Orario values (1769, 'POL01', 445, 1, '2024-09-16 11:00:00', 16, 514, '2024-09-16 12:00:00');
insert into Orario values (1770, 'POL01', 446, 1, '2025-09-19 15:00:00', 16, 418, '2025-09-19 17:00:00');
insert into Orario values (1771, 'POL01', 446, 1, '2025-09-22 09:00:00', 16, 325, '2025-09-22 11:00:00');
insert into Orario values (1772, 'POL01', 447, 1, '2026-09-12 11:00:00', 16, 403, '2026-09-12 12:00:00');
insert into Orario values (1773, 'POL01', 447, 1, '2026-09-17 09:00:00', 16, 418, '2026-09-17 11:00:00');
insert into Orario values (1774, 'POL01', 447, 1, '2026-09-13 15:00:00', 16, 426, '2026-09-13 17:00:00');
insert into Orario values (1775, 'POL01', 447, 2, '2026-09-16 11:00:00', 16, 418, '2026-09-16 12:00:00');
insert into Orario values (1776, 'POL01', 447, 2, '2026-09-20 09:00:00', 16, 403, '2026-09-20 11:00:00');
insert into Orario values (1777, 'POL01', 447, 2, '2026-09-18 09:00:00', 16, 418, '2026-09-18 11:00:00');
insert into Orario values (1778, 'SOC01', 448, 1, '2020-02-25 15:00:00', 16, 426, '2020-02-25 17:00:00');
insert into Orario values (1779, 'SOC01', 448, 1, '2020-02-23 15:00:00', 16, 418, '2020-02-23 17:00:00');
insert into Orario values (1780, 'SOC01', 448, 1, '2020-02-26 15:00:00', 16, 418, '2020-02-26 17:00:00');
insert into Orario values (1781, 'SOC01', 448, 2, '2020-02-13 15:00:00', 16, 514, '2020-02-13 17:00:00');
insert into Orario values (1782, 'SOC01', 448, 2, '2020-02-15 09:00:00', 16, 418, '2020-02-15 11:00:00');
insert into Orario values (1783, 'SOC01', 448, 2, '2020-02-16 15:00:00', 16, 514, '2020-02-16 17:00:00');
insert into Orario values (1784, 'SOC01', 449, 1, '2021-02-18 09:00:00', 16, 325, '2021-02-18 11:00:00');
insert into Orario values (1785, 'SOC01', 449, 1, '2021-02-16 15:00:00', 16, 325, '2021-02-16 17:00:00');
insert into Orario values (1786, 'SOC01', 450, 1, '2022-02-21 15:00:00', 16, 514, '2022-02-21 17:00:00');
insert into Orario values (1787, 'SOC01', 450, 1, '2022-02-22 09:00:00', 16, 426, '2022-02-22 11:00:00');
insert into Orario values (1788, 'SOC01', 451, 1, '2023-02-13 11:00:00', 16, 418, '2023-02-13 12:00:00');
insert into Orario values (1789, 'SOC01', 451, 1, '2023-02-14 11:00:00', 16, 418, '2023-02-14 12:00:00');
insert into Orario values (1790, 'SOC01', 451, 2, '2023-02-12 15:00:00', 16, 325, '2023-02-12 17:00:00');
insert into Orario values (1791, 'SOC01', 451, 2, '2023-02-10 13:00:00', 16, 325, '2023-02-10 15:00:00');
insert into Orario values (1792, 'SOC01', 452, 1, '2024-02-14 09:00:00', 16, 325, '2024-02-14 11:00:00');
insert into Orario values (1793, 'SOC01', 452, 1, '2024-02-17 09:00:00', 16, 514, '2024-02-17 11:00:00');
insert into Orario values (1794, 'SOC01', 452, 2, '2024-02-10 11:00:00', 16, 426, '2024-02-10 12:00:00');
insert into Orario values (1795, 'SOC01', 452, 2, '2024-02-15 15:00:00', 16, 418, '2024-02-15 17:00:00');
insert into Orario values (1796, 'SOC01', 452, 3, '2024-02-15 11:00:00', 16, 403, '2024-02-15 12:00:00');
insert into Orario values (1797, 'SOC01', 452, 3, '2024-02-11 13:00:00', 16, 426, '2024-02-11 15:00:00');
insert into Orario values (1798, 'SOC01', 452, 4, '2024-02-20 15:00:00', 16, 418, '2024-02-20 17:00:00');
insert into Orario values (1799, 'SOC01', 452, 4, '2024-02-23 09:00:00', 16, 418, '2024-02-23 11:00:00');
insert into Orario values (1800, 'SOC01', 453, 1, '2025-02-18 09:00:00', 16, 403, '2025-02-18 11:00:00');
insert into Orario values (1801, 'SOC01', 453, 1, '2025-02-16 15:00:00', 16, 403, '2025-02-16 17:00:00');
insert into Orario values (1802, 'SOC01', 453, 2, '2025-02-19 15:00:00', 16, 426, '2025-02-19 17:00:00');
insert into Orario values (1803, 'SOC01', 453, 2, '2025-02-17 15:00:00', 16, 403, '2025-02-17 17:00:00');
insert into Orario values (1804, 'SOC01', 453, 2, '2025-02-20 15:00:00', 16, 214, '2025-02-20 17:00:00');
insert into Orario values (1805, 'SOC01', 454, 1, '2026-02-16 15:00:00', 16, 325, '2026-02-16 17:00:00');
insert into Orario values (1806, 'SOC01', 454, 1, '2026-02-13 09:00:00', 16, 403, '2026-02-13 11:00:00');
insert into Orario values (1807, 'SOC01', 454, 2, '2026-02-26 15:00:00', 16, 214, '2026-02-26 17:00:00');
insert into Orario values (1808, 'SOC01', 454, 2, '2026-02-27 11:00:00', 16, 418, '2026-02-27 12:00:00');
insert into Orario values (1809, 'SOC01', 454, 2, '2026-02-23 13:00:00', 16, 403, '2026-02-23 15:00:00');
insert into Orario values (1810, 'PSI01', 455, 1, '2020-09-16 11:00:00', 16, 403, '2020-09-16 12:00:00');
insert into Orario values (1811, 'PSI01', 455, 1, '2020-09-13 11:00:00', 16, 514, '2020-09-13 12:00:00');
insert into Orario values (1812, 'PSI01', 455, 2, '2020-09-09 13:00:00', 16, 325, '2020-09-09 15:00:00');
insert into Orario values (1813, 'PSI01', 455, 2, '2020-09-11 13:00:00', 16, 418, '2020-09-11 15:00:00');
insert into Orario values (1814, 'PSI01', 455, 2, '2020-09-13 15:00:00', 16, 426, '2020-09-13 17:00:00');
insert into Orario values (1815, 'PSI01', 456, 1, '2021-09-25 15:00:00', 16, 325, '2021-09-25 17:00:00');
insert into Orario values (1816, 'PSI01', 456, 1, '2021-09-24 13:00:00', 16, 514, '2021-09-24 15:00:00');
insert into Orario values (1817, 'PSI01', 456, 2, '2021-09-20 09:00:00', 16, 418, '2021-09-20 11:00:00');
insert into Orario values (1818, 'PSI01', 456, 2, '2021-09-25 13:00:00', 16, 514, '2021-09-25 15:00:00');
insert into Orario values (1819, 'PSI01', 456, 2, '2021-09-22 13:00:00', 16, 214, '2021-09-22 15:00:00');
insert into Orario values (1820, 'PSI01', 456, 3, '2021-09-14 15:00:00', 16, 426, '2021-09-14 17:00:00');
insert into Orario values (1821, 'PSI01', 456, 3, '2021-09-15 09:00:00', 16, 514, '2021-09-15 11:00:00');
insert into Orario values (1822, 'PSI01', 456, 4, '2021-09-12 15:00:00', 16, 403, '2021-09-12 17:00:00');
insert into Orario values (1823, 'PSI01', 456, 4, '2021-09-14 09:00:00', 16, 325, '2021-09-14 11:00:00');
insert into Orario values (1824, 'PSI01', 456, 4, '2021-09-15 11:00:00', 16, 325, '2021-09-15 12:00:00');
insert into Orario values (1825, 'PSI01', 457, 1, '2022-09-18 09:00:00', 16, 214, '2022-09-18 11:00:00');
insert into Orario values (1826, 'PSI01', 457, 1, '2022-09-17 11:00:00', 16, 418, '2022-09-17 12:00:00');
insert into Orario values (1827, 'PSI01', 457, 1, '2022-09-16 13:00:00', 16, 325, '2022-09-16 15:00:00');
insert into Orario values (1828, 'PSI01', 457, 2, '2022-09-19 09:00:00', 16, 403, '2022-09-19 11:00:00');
insert into Orario values (1829, 'PSI01', 457, 2, '2022-09-21 11:00:00', 16, 403, '2022-09-21 12:00:00');
insert into Orario values (1830, 'PSI01', 458, 1, '2023-09-10 13:00:00', 16, 214, '2023-09-10 15:00:00');
insert into Orario values (1831, 'PSI01', 458, 1, '2023-09-08 11:00:00', 16, 418, '2023-09-08 12:00:00');
insert into Orario values (1832, 'PSI01', 458, 1, '2023-09-11 15:00:00', 16, 514, '2023-09-11 17:00:00');
insert into Orario values (1833, 'PSI01', 459, 1, '2024-09-23 11:00:00', 16, 426, '2024-09-23 12:00:00');
insert into Orario values (1834, 'PSI01', 459, 1, '2024-09-20 13:00:00', 16, 214, '2024-09-20 15:00:00');
insert into Orario values (1835, 'PSI01', 459, 2, '2024-09-16 13:00:00', 16, 403, '2024-09-16 15:00:00');
insert into Orario values (1836, 'PSI01', 459, 2, '2024-09-21 13:00:00', 16, 418, '2024-09-21 15:00:00');
insert into Orario values (1837, 'PSI01', 459, 2, '2024-09-19 11:00:00', 16, 418, '2024-09-19 12:00:00');
insert into Orario values (1838, 'PSI01', 460, 1, '2025-09-14 09:00:00', 16, 514, '2025-09-14 11:00:00');
insert into Orario values (1839, 'PSI01', 460, 1, '2025-09-12 09:00:00', 16, 403, '2025-09-12 11:00:00');
insert into Orario values (1840, 'PSI01', 460, 2, '2025-09-10 13:00:00', 16, 325, '2025-09-10 15:00:00');
insert into Orario values (1841, 'PSI01', 460, 2, '2025-09-15 13:00:00', 16, 325, '2025-09-15 15:00:00');
insert into Orario values (1842, 'PSI01', 460, 2, '2025-09-12 13:00:00', 16, 514, '2025-09-12 15:00:00');
insert into Orario values (1843, 'PSI01', 460, 3, '2025-09-24 15:00:00', 16, 325, '2025-09-24 17:00:00');
insert into Orario values (1844, 'PSI01', 460, 3, '2025-09-21 09:00:00', 16, 514, '2025-09-21 11:00:00');
insert into Orario values (1845, 'PSI01', 460, 3, '2025-09-23 11:00:00', 16, 514, '2025-09-23 12:00:00');
insert into Orario values (1846, 'PSI01', 460, 4, '2025-09-21 13:00:00', 16, 214, '2025-09-21 15:00:00');
insert into Orario values (1847, 'PSI01', 460, 4, '2025-09-22 09:00:00', 16, 418, '2025-09-22 11:00:00');
insert into Orario values (1848, 'PSI01', 461, 1, '2026-09-10 13:00:00', 16, 214, '2026-09-10 15:00:00');
insert into Orario values (1849, 'PSI01', 461, 1, '2026-09-09 11:00:00', 16, 426, '2026-09-09 12:00:00');
insert into Orario values (1850, 'PSI01', 461, 1, '2026-09-13 09:00:00', 16, 403, '2026-09-13 11:00:00');
insert into Orario values (1851, 'PSI01', 461, 2, '2026-09-19 13:00:00', 16, 325, '2026-09-19 15:00:00');
insert into Orario values (1852, 'PSI01', 461, 2, '2026-09-20 09:00:00', 16, 325, '2026-09-20 11:00:00');
insert into Orario values (1853, 'PSI01', 461, 2, '2026-09-15 09:00:00', 16, 418, '2026-09-15 11:00:00');

# ---------------------------------------------------------------------- #
# Add info into "Orario_Evento"                                          #
# ---------------------------------------------------------------------- #

truncate table Orario_Evento;

insert into Orario_Evento values (1, 1, "2026-05-10 16:30:00", 9, "2026-05-10 19:30:00");
insert into Orario_Evento values (2, 1, "2026-05-11 14:00:00", 9, "2026-05-11 16:00:00");
insert into Orario_Evento values (3, 2, "2021-05-13 12:30:00", 37, "2021-05-13 14:30:00");
insert into Orario_Evento values (4, 2, "2021-05-14 16:30:00", 37, "2021-05-14 18:30:00");
insert into Orario_Evento values (5, 3, "2025-02-20 13:00:00", 168, "2025-02-20 14:00:00");
insert into Orario_Evento values (6, 4, "2021-06-09 16:30:00", 164, "2021-06-09 19:30:00");
insert into Orario_Evento values (7, 5, "2022-08-01 13:00:00", 18, "2022-08-01 15:00:00");
insert into Orario_Evento values (8, 6, "2024-05-04 08:00:00", 21, "2024-05-04 11:00:00");
insert into Orario_Evento values (9, 7, "2025-03-24 10:30:00", 9, "2025-03-24 11:30:00");
insert into Orario_Evento values (10, 7, "2025-03-25 12:00:00", 9, "2025-03-25 13:00:00");
insert into Orario_Evento values (11, 8, "2023-12-26 09:30:00", 175, "2023-12-26 10:30:00");
insert into Orario_Evento values (12, 9, "2020-12-08 15:30:00", 163, "2020-12-08 16:30:00");
insert into Orario_Evento values (13, 10, "2024-01-12 10:00:00", 5, "2024-01-12 13:00:00");
insert into Orario_Evento values (14, 11, "2022-02-14 11:00:00", 70, "2022-02-14 13:00:00");
insert into Orario_Evento values (15, 12, "2022-07-28 12:00:00", 88, "2022-07-28 15:00:00");
insert into Orario_Evento values (16, 13, "2022-06-02 12:30:00", 161, "2022-06-02 15:30:00");
insert into Orario_Evento values (17, 14, "2022-07-24 17:00:00", 14, "2022-07-24 18:00:00");
insert into Orario_Evento values (18, 15, "2024-07-23 11:00:00", 35, "2024-07-23 13:00:00");
insert into Orario_Evento values (19, 16, "2026-03-25 17:30:00", 5, "2026-03-25 18:30:00");
insert into Orario_Evento values (20, 17, "2022-06-18 08:00:00", 137, "2022-06-18 09:00:00");
insert into Orario_Evento values (21, 17, "2022-06-19 11:00:00", 137, "2022-06-19 14:00:00");
insert into Orario_Evento values (22, 18, "2023-07-25 13:30:00", 25, "2023-07-25 14:30:00");
insert into Orario_Evento values (23, 18, "2023-07-26 10:30:00", 25, "2023-07-26 12:30:00");
insert into Orario_Evento values (24, 19, "2023-11-02 08:00:00", 35, "2023-11-02 09:00:00");
insert into Orario_Evento values (25, 20, "2025-11-08 14:30:00", 72, "2025-11-08 17:30:00");
insert into Orario_Evento values (26, 21, "2024-09-06 15:30:00", 51, "2024-09-06 18:30:00");
insert into Orario_Evento values (27, 22, "2023-03-26 17:00:00", 48, "2023-03-26 19:00:00");
insert into Orario_Evento values (28, 23, "2022-02-07 08:30:00", 51, "2022-02-07 10:30:00");
insert into Orario_Evento values (29, 24, "2025-10-20 17:00:00", 22, "2025-10-20 20:00:00");
insert into Orario_Evento values (30, 25, "2026-03-24 09:30:00", 143, "2026-03-24 11:30:00");
insert into Orario_Evento values (31, 26, "2020-08-19 10:30:00", 32, "2020-08-19 11:30:00");
insert into Orario_Evento values (32, 26, "2020-08-20 11:00:00", 32, "2020-08-20 12:00:00");
insert into Orario_Evento values (33, 27, "2026-05-21 08:30:00", 142, "2026-05-21 10:30:00");
insert into Orario_Evento values (34, 28, "2021-11-06 10:30:00", 81, "2021-11-06 12:30:00");
insert into Orario_Evento values (35, 29, "2021-04-08 12:00:00", 86, "2021-04-08 14:00:00");
insert into Orario_Evento values (36, 30, "2023-10-25 11:30:00", 131, "2023-10-25 13:30:00");
insert into Orario_Evento values (37, 31, "2020-08-31 14:00:00", 163, "2020-08-31 17:00:00");
insert into Orario_Evento values (38, 32, "2025-10-27 10:30:00", 170, "2025-10-27 12:30:00");
insert into Orario_Evento values (39, 32, "2025-10-28 14:00:00", 170, "2025-10-28 15:00:00");
insert into Orario_Evento values (40, 32, "2025-10-29 14:00:00", 170, "2025-10-29 17:00:00");
insert into Orario_Evento values (41, 33, "2024-03-21 17:30:00", 2, "2024-03-21 18:30:00");
insert into Orario_Evento values (42, 34, "2020-12-17 08:00:00", 126, "2020-12-17 10:00:00");
insert into Orario_Evento values (43, 35, "2024-05-18 17:30:00", 11, "2024-05-18 19:30:00");
insert into Orario_Evento values (44, 36, "2022-12-03 08:30:00", 6, "2022-12-03 09:30:00");
insert into Orario_Evento values (45, 36, "2022-12-04 08:00:00", 6, "2022-12-04 10:00:00");
insert into Orario_Evento values (46, 36, "2022-12-05 14:30:00", 6, "2022-12-05 17:30:00");
insert into Orario_Evento values (47, 37, "2020-07-09 16:30:00", 93, "2020-07-09 19:30:00");
insert into Orario_Evento values (48, 38, "2020-12-28 12:00:00", 184, "2020-12-28 14:00:00");
insert into Orario_Evento values (49, 39, "2022-02-23 17:30:00", 160, "2022-02-23 20:30:00");
insert into Orario_Evento values (50, 40, "2023-08-30 13:00:00", 102, "2023-08-30 14:00:00");
insert into Orario_Evento values (51, 41, "2024-03-16 13:00:00", 163, "2024-03-16 14:00:00");
insert into Orario_Evento values (52, 42, "2023-02-02 09:30:00", 5, "2023-02-02 11:30:00");
insert into Orario_Evento values (53, 43, "2026-10-19 12:30:00", 111, "2026-10-19 14:30:00");
insert into Orario_Evento values (54, 43, "2026-10-20 09:00:00", 111, "2026-10-20 10:00:00");
insert into Orario_Evento values (55, 43, "2026-10-21 13:30:00", 111, "2026-10-21 15:30:00");
insert into Orario_Evento values (56, 44, "2025-06-17 17:30:00", 166, "2025-06-17 19:30:00");
insert into Orario_Evento values (57, 45, "2022-03-05 08:00:00", 22, "2022-03-05 10:00:00");
insert into Orario_Evento values (58, 46, "2021-05-31 09:00:00", 60, "2021-05-31 11:00:00");
insert into Orario_Evento values (59, 47, "2024-07-16 10:00:00", 25, "2024-07-16 13:00:00");
insert into Orario_Evento values (60, 48, "2022-07-05 13:30:00", 137, "2022-07-05 15:30:00");
insert into Orario_Evento values (61, 48, "2022-07-06 09:30:00", 137, "2022-07-06 11:30:00");
insert into Orario_Evento values (62, 49, "2020-05-13 14:30:00", 101, "2020-05-13 16:30:00");
insert into Orario_Evento values (63, 50, "2020-06-22 11:00:00", 2, "2020-06-22 12:00:00");

# ---------------------------------------------------------------------- #
# Add info into "Persona"                                                #
# ---------------------------------------------------------------------- #

truncate table Persona;

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
insert into Persona values ("MNCRCR65S05B440T","Riccardo","Mancini","1965-11-05","riccardo.mancini16@hotmail.com",4);
insert into Persona values ("NPLCRS80R11D969E","Christian","Napolitano","1980-10-11","christian.napolitano54@yahoo.it",4);
insert into Persona values ("TSTRFL98T09A348N","Raffaele","Testa","1998-12-09","raffaele.testa26@libero.it",4);
insert into Persona values ("RMNNCL71A45B858H","Nicole","Romano","1971-01-05","nicole.romano94@yahoo.it",3);
insert into Persona values ("DSNSRG96C16A189M","Sergio","De Santis","1996-03-16","sergio.de santis58@yahoo.it",4);
insert into Persona values ("RSSMRC66B27F548Z","Marco","Russo","1966-02-27","marco.russo89@libero.it",3);
insert into Persona values ("ZNTDBR85L47E376K","Debora","Zanetti","1985-07-07","debora.zanetti1@yahoo.it",3);
insert into Persona values ("NPLDNL78R10C724W","Daniele","Napolitano","1978-10-10","daniele.napolitano90@libero.it",3);
insert into Persona values ("RNALCA97H54F839D","Alice","Arena","1997-06-14","alice.arena17@libero.it",3);
insert into Persona values ("MNTDNC66B18L781F","Domenico","Monti","1966-02-18","domenico.monti29@yahoo.it",3);
insert into Persona values ("CPPNTN83D23C118H","Antonio","Coppola","1983-04-23","antonio.coppola19@gmail.com",4);
insert into Persona values ("FRRMHL57M02C839Y","Michele","Ferretti","1957-08-02","michele.ferretti5@hotmail.com",4);
insert into Persona values ("CPTDNL56M31G715D","Daniele","Caputo","1956-08-31","daniele.caputo4@hotmail.com",4);
insert into Persona values ("SPSTMS01T21G715H","Tommaso","Esposito","2001-12-21","tommaso.esposito61@yahoo.it",3);
insert into Persona values ("VRDSVT92A04I386K","Salvatore","Verdi","1992-01-04","salvatore.verdi73@libero.it",4);
insert into Persona values ("FSCFBA78L28B858T","Fabio","Fusco","1978-07-28","fabio.fusco9@yahoo.it",4);
insert into Persona values ("RNLVNC81S42F205Q","Veronica","Rinaldi","1981-11-02","veronica.rinaldi21@libero.it",4);
insert into Persona values ("FZALCU87E57A794Z","Lucia","Fazio","1987-05-17","lucia.fazio89@libero.it",4);
insert into Persona values ("BRBLRI58T61D111Z","Ilaria","Barbieri","1958-12-21","ilaria.barbieri88@libero.it",4);
insert into Persona values ("FBBLCU83P19I134B","Luca","Fabbri","1983-09-19","luca.fabbri55@gmail.com",3);
insert into Persona values ("NPLSRA78E61G484V","Sara","Napolitano","1978-05-21","sara.napolitano52@gmail.com",3);
insert into Persona values ("BRDFRC76H03D704Z","Federico","Bordoni","1976-06-03","federico.bordoni16@gmail.com",3);
insert into Persona values ("NNCMRC94M14A037S","Marco","Innocenti","1994-08-14","marco.innocenti66@libero.it",4);
insert into Persona values ("BTASFN04S22I143R","Stefano","Abate","2004-11-22","stefano.abate67@libero.it",3);
insert into Persona values ("FZAFNC83T59D394O","Francesca","Fazio","1983-12-19","francesca.fazio37@hotmail.com",3);
insert into Persona values ("RSSVSS06L54G930D","Vanessa","Russo","2006-07-14","vanessa.russo86@hotmail.com",3);
insert into Persona values ("NREDNC60S08I123S","Domenico","Neri","1960-11-08","domenico.neri80@yahoo.it",3);
insert into Persona values ("RSSFRC86M19B858U","Federico","Russo","1986-08-19","federico.russo98@libero.it",3);
insert into Persona values ("NPLLND64A63L402P","Linda","Napolitano","1964-01-23","linda.napolitano57@yahoo.it",3);
insert into Persona values ("VNTDNS84L17G224D","Denis","Ventura","1984-07-17","denis.ventura39@gmail.com",3);
insert into Persona values ("ZNTMRC79M14I134E","Marco","Zanetti","1979-08-14","marco.zanetti59@gmail.com",4);
insert into Persona values ("FSCLNE01A51C887J","Elena","Fusco","2001-01-11","elena.fusco73@libero.it",3);
insert into Persona values ("BLDFRC74S17G715F","Federico","Baldini","1974-11-17","federico.baldini24@libero.it",4);
insert into Persona values ("NPLDNL84P18B889A","Daniele","Napolitano","1984-09-18","daniele.napolitano64@gmail.com",4);
insert into Persona values ("SLVJCP81D18H224Q","Jacopo","Silvestri","1981-04-18","jacopo.silvestri17@gmail.com",3);
insert into Persona values ("ZNTLSE89E50F753M","Elisa","Zanetti","1989-05-10","elisa.zanetti51@yahoo.it",4);
insert into Persona values ("CNIMRA61C49D949K","Maria","Iacono","1961-03-09","maria.iacono30@hotmail.com",3);
insert into Persona values ("RNLGNN72H43B440K","Giovanna","Rinaldi","1972-06-03","giovanna.rinaldi65@gmail.com",4);
insert into Persona values ("RSSCLL81T52B889G","Camilla","Russo","1981-12-12","camilla.russo27@hotmail.com",3);
insert into Persona values ("SRRDNC07M31H501V","Domenico","Serra","2007-08-31","domenico.serra35@hotmail.com",4);
insert into Persona values ("PRSSFN00D13I386O","Stefano","Piras","2000-04-13","stefano.piras5@gmail.com",4);
insert into Persona values ("TSTNCL83S27L219Y","Nicola","Testa","1983-11-27","nicola.testa11@libero.it",3);
insert into Persona values ("MNTNCL89H70D276P","Nicole","Monti","1989-06-30","nicole.monti11@hotmail.com",3);
insert into Persona values ("DBNRTI56A67C792B","Rita","Di Benedetto","1956-01-27","rita.di benedetto95@hotmail.com",3);
insert into Persona values ("CNILRT71A20I143A","Alberto","Iacono","1971-01-20","alberto.iacono71@gmail.com",3);
insert into Persona values ("GRZCHR88P55A372Q","Chiara","Graziani","1988-09-15","chiara.graziani42@hotmail.com",4);
insert into Persona values ("VLLNCL88P46L602S","Nicole","Villa","1988-09-06","nicole.villa60@gmail.com",4);
insert into Persona values ("TSTCLD87L41H703E","Claudia","Testa","1987-07-01","claudia.testa39@yahoo.it",4);
insert into Persona values ("DNTRFL67T20C933F","Raffaele","Donati","1967-12-20","raffaele.donati8@gmail.com",3);
insert into Persona values ("RMNDBR65E43C792R","Debora","Romano","1965-05-03","debora.romano22@gmail.com",4);
insert into Persona values ("CVLNGL82M52A037X","Angela","Cavaliere","1982-08-12","angela.cavaliere9@gmail.com",1);
insert into Persona values ("CRSDNL01C29G908C","Daniele","Crespi","2001-03-29","daniele.crespi46@libero.it",1);
insert into Persona values ("GRCFBA76E02C792W","Fabio","Greco","1976-05-02","fabio.greco78@yahoo.it",1);
insert into Persona values ("PLLMNL72D03A310N","Manuel","Pellegrini","1972-04-03","manuel.pellegrini89@gmail.com",1);
insert into Persona values ("FBBLCA75B52A286A","Alice","Fabbri","1975-02-12","alice.fabbri43@hotmail.com",1);
insert into Persona values ("TSCLND94C63B889V","Linda","Toscano","1994-03-23","linda.toscano80@yahoo.it",1);
insert into Persona values ("RSSRNI94D43L424P","Irene","Russo","1994-04-03","irene.russo64@hotmail.com",1);
insert into Persona values ("FRRSVT06T27G224F","Salvatore","Ferretti","2006-12-27","salvatore.ferretti1@gmail.com",1);
insert into Persona values ("BRBCRS94R23C118T","Chris","Barbieri","1994-10-23","chris.barbieri94@gmail.com",2);
insert into Persona values ("DSNSRA85A67H196I","Sara","De Santis","1985-01-27","sara.de santis45@libero.it",1);
insert into Persona values ("SLVMHL96E10I386H","Michele","Silvestri","1996-05-10","michele.silvestri93@hotmail.com",1);
insert into Persona values ("BTAVSS01H42H266Q","Vanessa","Abate","2001-06-02","vanessa.abate11@gmail.com",1);
insert into Persona values ("NNCDBR94B45G702M","Debora","Innocenti","1994-02-05","debora.innocenti81@gmail.com",1);
insert into Persona values ("CRBDNS78H21G224N","Denis","Carbone","1978-06-21","denis.carbone89@gmail.com",1);
insert into Persona values ("GRRGLI74E71A189I","Giulia","Guerra","1974-05-31","giulia.guerra69@gmail.com",1);
insert into Persona values ("DBNPRZ92T53G224F","Patrizia","Di Benedetto","1992-12-13","patrizia.di benedetto97@hotmail.com",1);
insert into Persona values ("DNGRTI75R66B882Q","Rita","De Angelis","1975-10-26","rita.de angelis99@hotmail.com",1);
insert into Persona values ("CNIFNC97R42A189W","Francesca","Iacono","1997-10-02","francesca.iacono62@libero.it",1);
insert into Persona values ("FRRDGI02C23D525W","Diego","Ferrari","2002-03-23","diego.ferrari93@hotmail.com",1);
insert into Persona values ("TSCDNL06E23A348K","Daniele","Toscano","2006-05-23","daniele.toscano20@libero.it",1);
insert into Persona values ("TSCGRG67M12A587Z","Giorgio","Toscano","1967-08-12","giorgio.toscano38@hotmail.com",1);
insert into Persona values ("LCCSFO65H62B858G","Sofia","Lucchesi","1965-06-22","sofia.lucchesi29@gmail.com",1);
insert into Persona values ("GRZLRT72S02E376U","Alberto","Graziani","1972-11-02","alberto.graziani59@hotmail.com",2);
insert into Persona values ("NNCNTN60R21F205K","Antonio","Innocenti","1960-10-21","antonio.innocenti19@gmail.com",1);
insert into Persona values ("LNGLRT64A14L424P","Alberto","Longo","1964-01-14","alberto.longo34@yahoo.it",1);
insert into Persona values ("FRRLCU62B20A587Q","Luca","Ferrari","1962-02-20","luca.ferrari23@gmail.com",1);
insert into Persona values ("MSSGRL64R25A348D","Gabriele","Messina","1964-10-25","gabriele.messina93@yahoo.it",1);
insert into Persona values ("DLCDNL56C66B882T","Daniela","De Luca","1956-03-26","daniela.de luca69@libero.it",1);
insert into Persona values ("TSCTMS82P30B861E","Tommaso","Toscano","1982-09-30","tommaso.toscano73@yahoo.it",1);
insert into Persona values ("FRRVLR70D03F205S","Valerio","Ferrari","1970-04-03","valerio.ferrari65@libero.it",1);
insert into Persona values ("RNALRT64A28L736F","Alberto","Arena","1964-01-28","alberto.arena91@gmail.com",1);
insert into Persona values ("LNGDNL79H11H266B","Daniele","Longo","1979-06-11","daniele.longo9@libero.it",1);
insert into Persona values ("RSSCLL82H49D230O","Camilla","Rossi","1982-06-09","camilla.rossi74@hotmail.com",1);
insert into Persona values ("ZCCMRA90S51F839U","Maria","Zuccaro","1990-11-11","maria.zuccaro85@hotmail.com",1);
insert into Persona values ("NPLNNL95M49F572O","Antonella","Napolitano","1995-08-09","antonella.napolitano26@hotmail.com",2);
insert into Persona values ("CRATRS04C59G224K","Teresa","Cairo","2004-03-19","teresa.cairo2@gmail.com",1);
insert into Persona values ("DSTPLA56P27A310S","Paolo","Di Stefano","1956-09-27","paolo.di stefano48@yahoo.it",2);
insert into Persona values ("LMBDNC93A24G930S","Domenico","Lombardi","1993-01-24","domenico.lombardi32@yahoo.it",1);
insert into Persona values ("RSSFNC60H25I123N","Francesco","Rossi","1960-06-25","francesco.rossi97@yahoo.it",1);
insert into Persona values ("FBBLRT56T14F548U","Alberto","Fabbri","1956-12-14","alberto.fabbri92@gmail.com",1);
insert into Persona values ("GRCCST06S58C887R","Cristina","Greco","2006-11-18","cristina.greco46@gmail.com",2);
insert into Persona values ("NPLKVN02D28D949K","Kevin","Napolitano","2002-04-28","kevin.napolitano90@gmail.com",1);
insert into Persona values ("CLBGRG08P18A372X","Giorgio","Calabrese","2008-09-18","giorgio.calabrese12@libero.it",2);
insert into Persona values ("NTNVLR78B02H266W","Valerio","Antonelli","1978-02-02","valerio.antonelli29@yahoo.it",1);
insert into Persona values ("TSCMRT68B54L219J","Marta","Toscano","1968-02-14","marta.toscano17@gmail.com",1);
insert into Persona values ("NNCFRC92M31H223C","Federico","Innocenti","1992-08-31","federico.innocenti77@gmail.com",1);
insert into Persona values ("ZCCLSN99D52L219J","Alessandra","Zuccaro","1999-04-12","alessandra.zuccaro47@libero.it",2);
insert into Persona values ("SNTSMN95T21I386A","Simone","Santoro","1995-12-21","simone.santoro62@hotmail.com",1);
insert into Persona values ("TSTMNL84P12B861F","Emanuele","Testa","1984-09-12","emanuele.testa99@gmail.com",2);
insert into Persona values ("PGLSRA00B55F548J","Sara","Puglisi","2000-02-15","sara.puglisi86@gmail.com",1);
insert into Persona values ("FRRLNR08S56L736F","Eleonora","Ferrari","2008-11-16","eleonora.ferrari76@hotmail.com",1);
insert into Persona values ("BRNNCL66A02F883Q","Nicolò","Bernardi","1966-01-02","nicolò.bernardi25@gmail.com",1);
insert into Persona values ("CPTDNS68E69A271E","Denis","Caputo","1968-05-29","denis.caputo78@hotmail.com",1);
insert into Persona values ("VNTGPP08R29D612J","Giuseppe","Ventura","2008-10-29","giuseppe.ventura97@yahoo.it",1);
insert into Persona values ("MTASRA88C56F205X","Sara","Amato","1988-03-16","sara.amato29@yahoo.it",1);
insert into Persona values ("RMNLCU08A19B882Z","Luca","Romano","2008-01-19","luca.romano23@gmail.com",1);
insert into Persona values ("CRSMTT07L22L378A","Matteo","Crespi","2007-07-22","matteo.crespi5@hotmail.com",1);
insert into Persona values ("ZNTLXA08T04G224Y","Alex","Zanetti","2008-12-04","alex.zanetti46@yahoo.it",1);
insert into Persona values ("FZAMTT06A02B882O","Matteo","Fazio","2006-01-02","matteo.fazio97@gmail.com",1);
insert into Persona values ("CRSCLL65P60D525W","Camilla","Crespi","1965-09-20","camilla.crespi32@yahoo.it",1);
insert into Persona values ("ZCCGPP02T07A390P","Giuseppe","Zuccaro","2002-12-07","giuseppe.zuccaro84@gmail.com",1);
insert into Persona values ("GLLMTN65T49D760N","Martina","Gallo","1965-12-09","martina.gallo94@libero.it",1);
insert into Persona values ("CNIGRL03M30G484E","Gabriel","Iacono","2003-08-30","gabriel.iacono27@gmail.com",1);
insert into Persona values ("RMNDBR75S51A189M","Debora","Armani","1975-11-11","debora.armani85@gmail.com",1);
insert into Persona values ("VRDPRZ04E41D111O","Patrizia","Verdi","2004-05-01","patrizia.verdi5@gmail.com",1);
insert into Persona values ("DNTTRS06S69A643J","Teresa","Donati","2006-11-29","teresa.donati0@yahoo.it",1);
insert into Persona values ("TSCLXA86C08D969F","Alex","Toscano","1986-03-08","alex.toscano91@yahoo.it",1);
insert into Persona values ("VLNDNC93T01A271A","Domenico","Valentini","1993-12-01","domenico.valentini91@hotmail.com",1);
insert into Persona values ("CVLCRS73L21C839N","Chris","Cavaliere","1973-07-21","chris.cavaliere61@gmail.com",1);
insert into Persona values ("DMCLNZ01E01F776T","Lorenzo","D'Amico","2001-05-01","lorenzo.d'amico45@hotmail.com",1);
insert into Persona values ("TSTMTT60T09D394B","Matteo","Testa","1960-12-09","matteo.testa20@gmail.com",1);
insert into Persona values ("MRCVNI88A09D612U","Ivan","Marchetti","1988-01-09","ivan.marchetti0@hotmail.com",2);
insert into Persona values ("RSSGRG81P53L402C","Giorgia","Russo","1981-09-13","giorgia.russo91@yahoo.it",1);
insert into Persona values ("SLVNCL84R05B440F","Nicola","Silvestri","1984-10-05","nicola.silvestri43@libero.it",1);
insert into Persona values ("TSCNCL64R24D394Q","Nicola","Toscano","1964-10-24","nicola.toscano57@libero.it",1);
insert into Persona values ("ZCCMNL67B24C351E","Manuel","Zuccaro","1967-02-24","manuel.zuccaro48@libero.it",1);
insert into Persona values ("SLVNNL72H53L378B","Antonella","Silvestri","1972-06-13","antonella.silvestri7@yahoo.it",1);
insert into Persona values ("TSCFRC71L54L378Q","Federica","Toscano","1971-07-14","federica.toscano99@yahoo.it",1);
insert into Persona values ("CRSGNN86S61G702C","Giovanna","Crespi","1986-11-21","giovanna.crespi14@gmail.com",1);
insert into Persona values ("MRCSFO73S55H224Q","Sofia","Marchetti","1973-11-15","sofia.marchetti54@yahoo.it",1);
insert into Persona values ("NRELCU75B45C839Y","Lucia","Neri","1975-02-05","lucia.neri15@hotmail.com",1);
insert into Persona values ("TSTRTI68B66I386Z","Rita","Testa","1968-02-26","rita.testa50@yahoo.it",1);
insert into Persona values ("RSSCRL98S28C933M","Carlo","Russo","1998-11-28","carlo.russo6@yahoo.it",1);
insert into Persona values ("CNINNA69R53A944G","Anna","Iacono","1969-10-13","anna.iacono42@hotmail.com",1);
insert into Persona values ("LNGDVD98S29D433S","Davide","Longo","1998-11-29","davide.longo28@hotmail.com",1);
insert into Persona values ("FRNNRC61C23C933U","Enrico","Franco","1961-03-23","enrico.franco37@gmail.com",1);
insert into Persona values ("ZCCFNC85M31D276Q","Francesco","Zuccaro","1985-08-31","francesco.zuccaro35@yahoo.it",2);
insert into Persona values ("RMNCHR67S60I239M","Chiara","Armani","1967-11-20","chiara.armani85@yahoo.it",1);
insert into Persona values ("VLLDNL89E30F839G","Daniele","Villa","1989-05-30","daniele.villa50@libero.it",1);
insert into Persona values ("PGLGRG65S41I134Z","Giorgia","Puglisi","1965-11-01","giorgia.puglisi11@yahoo.it",1);
insert into Persona values ("MRNLCU86R43A769L","Lucia","Moroni","1986-10-03","lucia.moroni5@yahoo.it",1);
insert into Persona values ("FBBPTR77R28L219J","Pietro","Fabbri","1977-10-28","pietro.fabbri89@gmail.com",1);
insert into Persona values ("MRTDNS98S21F776J","Denis","Martini","1998-11-21","denis.martini7@gmail.com",2);
insert into Persona values ("GRSLNE02E47D525B","Elena","Grassi","2002-05-07","elena.grassi97@gmail.com",1);
insert into Persona values ("NNCNNL60S54A662H","Antonella","Innocenti","1960-11-14","antonella.innocenti73@hotmail.com",2);
insert into Persona values ("BNCMNC72D70B882D","Monica","Bianchi","1972-04-30","monica.bianchi9@libero.it",1);
insert into Persona values ("CPTLGU78B21L390T","Luigi","Caputo","1978-02-21","luigi.caputo80@libero.it",1);
insert into Persona values ("FSCNCL90L01C365C","Nicola","Fusco","1990-07-01","nicola.fusco85@yahoo.it",1);
insert into Persona values ("VNTSFN74R02G715K","Stefano","Ventura","1974-10-02","stefano.ventura96@yahoo.it",1);
insert into Persona values ("CVLCSR04B16F839O","Cesare","Cavaliere","2004-02-16","cesare.cavaliere42@libero.it",1);
insert into Persona values ("MRCFRC58P27D394K","Federico","Marchetti","1958-09-27","federico.marchetti58@libero.it",3);
insert into Persona values ("NREVLR76C04H703O","Valerio","Neri","1976-03-04","valerio.neri87@hotmail.com",3);
insert into Persona values ("SRRGPP65C31C839S","Giuseppe","Sorrentino","1965-03-31","giuseppe.sorrentino44@hotmail.com",3);
insert into Persona values ("BLLFRC91P46B207H","Federica","Bellini","1991-09-06","federica.bellini72@gmail.com",3);
insert into Persona values ("ZCCGLI65P64C839P","Giulia","Zuccaro","1965-09-24","giulia.zuccaro37@yahoo.it",3);
insert into Persona values ("VRDDVD64L12C520H","Davide","Verdi","1964-07-12","davide.verdi27@libero.it",3);
insert into Persona values ("RMNPLA74D13A310O","Paolo","Romano","1974-04-13","paolo.romano99@gmail.com",3);
insert into Persona values ("BNCLRI99H45F883G","Ilaria","Bianchi","1999-06-05","ilaria.bianchi81@hotmail.com",3);
insert into Persona values ("FRRNNL88H44D111B","Antonella","Ferrari","1988-06-04","antonella.ferrari41@gmail.com",3);
insert into Persona values ("PRSRCC56E69L045Y","Rebecca","Piras","1956-05-29","rebecca.piras49@yahoo.it",3);
insert into Persona values ("ZCCPLA70R63D230J","Paola","Zuccaro","1970-10-23","paola.zuccaro78@gmail.com",3);
insert into Persona values ("MRNRRT87D05A944L","Roberto","Marino","1987-04-05","roberto.marino91@yahoo.it",3);
insert into Persona values ("NPLBRC56S50L781H","Beatrice","Napolitano","1956-11-10","beatrice.napolitano56@hotmail.com",3);
insert into Persona values ("TSTLRI66M55D612M","Ilaria","Testa","1966-08-15","ilaria.testa45@gmail.com",3);
insert into Persona values ("NTNGLI96L63D394H","Giulia","Antonelli","1996-07-23","giulia.antonelli41@hotmail.com",3);
insert into Persona values ("MRCLNR89C52C351D","Eleonora","Marchetti","1989-03-12","eleonora.marchetti22@hotmail.com",3);
insert into Persona values ("TSTNGL71S43L390M","Angela","Testa","1971-11-03","angela.testa4@gmail.com",3);
insert into Persona values ("RNLLND69A43L781P","Linda","Rinaldi","1969-01-03","linda.rinaldi49@yahoo.it",3);
insert into Persona values ("BRDLXA72D43C351V","Alex","Bordoni","1972-04-03","alex.bordoni67@gmail.com",3);
insert into Persona values ("VLLSFN62L30I386Q","Stefano","Villa","1962-07-30","stefano.villa52@hotmail.com",3);
insert into Persona values ("FRRVNC05S61F205M","Veronica","Ferrari","2005-11-21","veronica.ferrari78@yahoo.it",3);
insert into Persona values ("DBNCST87H53D914I","Celeste","Di Benedetto","1987-06-13","celeste.di benedetto97@libero.it",3);
insert into Persona values ("MRNLCA85D67L378B","Alice","Marino","1985-04-27","alice.marino28@gmail.com",3);
insert into Persona values ("CNICST05S09G915I","Cristian","Iacono","2005-11-09","cristian.iacono7@hotmail.com",3);
insert into Persona values ("MRTNMO90T55G484L","Noemi","Martini","1990-12-15","noemi.martini43@libero.it",3);
insert into Persona values ("RSSCRS75C19A944H","Christian","Russo","1975-03-19","christian.russo65@yahoo.it",3);
insert into Persona values ("RSSLSE61M44F205T","Elisa","Russo","1961-08-04","elisa.russo26@hotmail.com",3);
insert into Persona values ("LBRMRT81A66L781O","Marta","Alberti","1981-01-26","marta.alberti68@libero.it",3);
insert into Persona values ("FRNMRT79B59I386L","Marta","Franco","1979-02-19","marta.franco51@libero.it",3);
insert into Persona values ("MRNRRT65S15H266K","Roberto","Moroni","1965-11-15","roberto.moroni11@gmail.com",3);
insert into Persona values ("LBRRRT97B04B207B","Roberto","Alberti","1997-02-04","roberto.alberti25@yahoo.it",3);
insert into Persona values ("SRRCLD75B25L219F","Claudio","Serra","1975-02-25","claudio.serra92@yahoo.it",3);
insert into Persona values ("SRRVCN59C25D027Z","Vincenzo","Serra","1959-03-25","vincenzo.serra90@gmail.com",3);

# ---------------------------------------------------------------------- #
# Add info into "Piano_Didattico"                                        #
# ---------------------------------------------------------------------- #

truncate table Piano_Didattico;

insert into Piano_Didattico values (0, 2020, "ECO03", 0);
insert into Piano_Didattico values (1, 2021, "GIU01", 2);
insert into Piano_Didattico values (2, 2025, "MED01", 4);
insert into Piano_Didattico values (3, 2023, "DES01", 6);
insert into Piano_Didattico values (4, 2022, "DES01", 11);
insert into Piano_Didattico values (5, 2024, "FIL01", 12);
insert into Piano_Didattico values (6, 2022, "ARC_CES02", 14);
insert into Piano_Didattico values (7, 2025, "FIL01", 15);
insert into Piano_Didattico values (8, 2026, "CHI01", 16);
insert into Piano_Didattico values (9, 2026, "ARC_CES02", 17);
insert into Piano_Didattico values (10, 2023, "BIO01", 18);
insert into Piano_Didattico values (11, 2020, "CHI01", 19);
insert into Piano_Didattico values (12, 2023, "TEC_CES01", 21);
insert into Piano_Didattico values (13, 2023, "ANA01", 23);
insert into Piano_Didattico values (14, 2023, "FIL01", 24);
insert into Piano_Didattico values (15, 2023, "URB01", 26);
insert into Piano_Didattico values (16, 2026, "ING_INF02", 27);
insert into Piano_Didattico values (17, 2026, "ECO02", 29);
insert into Piano_Didattico values (18, 2024, "ING01", 30);
insert into Piano_Didattico values (19, 2026, "ING02", 31);
insert into Piano_Didattico values (20, 2024, "FIL01", 32);
insert into Piano_Didattico values (21, 2024, "ECO03", 33);
insert into Piano_Didattico values (22, 2022, "ECO03", 34);
insert into Piano_Didattico values (23, 2021, "ARC_CES02", 36);
insert into Piano_Didattico values (24, 2026, "BIO01", 37);
insert into Piano_Didattico values (25, 2023, "ING_INF01", 39);
insert into Piano_Didattico values (26, 2020, "ARC01", 40);
insert into Piano_Didattico values (27, 2022, "DES_CES01", 42);
insert into Piano_Didattico values (28, 2020, "DES01", 43);
insert into Piano_Didattico values (29, 2021, "FIL01", 45);
insert into Piano_Didattico values (30, 2020, "URB01", 48);
insert into Piano_Didattico values (31, 2020, "ECO03", 50);
insert into Piano_Didattico values (32, 2026, "ROB01", 51);
insert into Piano_Didattico values (33, 2025, "COM01", 52);
insert into Piano_Didattico values (34, 2020, "ING01", 53);
insert into Piano_Didattico values (35, 2026, "ROB01", 54);
insert into Piano_Didattico values (36, 2023, "BIO01", 56);
insert into Piano_Didattico values (37, 2025, "SOC01", 57);
insert into Piano_Didattico values (38, 2023, "ROB01", 59);
insert into Piano_Didattico values (39, 2020, "TUR01", 61);
insert into Piano_Didattico values (40, 2022, "STA01", 63);
insert into Piano_Didattico values (41, 2023, "BIO01", 64);
insert into Piano_Didattico values (42, 2023, "ECO01", 66);
insert into Piano_Didattico values (43, 2021, "DES_CES01", 68);
insert into Piano_Didattico values (44, 2025, "ARC_CES02", 69);
insert into Piano_Didattico values (45, 2024, "GIU01", 70);
insert into Piano_Didattico values (46, 2022, "URB_CES01", 71);
insert into Piano_Didattico values (47, 2025, "STA01", 72);
insert into Piano_Didattico values (48, 2021, "CHI01", 74);
insert into Piano_Didattico values (49, 2025, "DES_CES01", 126);
insert into Piano_Didattico values (50, 2021, "ARC_CES01", 127);
insert into Piano_Didattico values (51, 2025, "DES_CES01", 128);
insert into Piano_Didattico values (52, 2022, "MAT01", 129);
insert into Piano_Didattico values (53, 2025, "ECO01", 130);
insert into Piano_Didattico values (54, 2026, "COM01", 131);
insert into Piano_Didattico values (55, 2024, "ING01", 132);
insert into Piano_Didattico values (56, 2021, "SOC01", 133);
insert into Piano_Didattico values (57, 2022, "STA01", 134);
insert into Piano_Didattico values (58, 2020, "CHI01", 135);
insert into Piano_Didattico values (59, 2021, "FIL01", 136);
insert into Piano_Didattico values (60, 2025, "ECO01", 137);
insert into Piano_Didattico values (61, 2020, "ECO01", 138);
insert into Piano_Didattico values (62, 2020, "MED01", 139);
insert into Piano_Didattico values (63, 2023, "ING_INF02", 140);
insert into Piano_Didattico values (64, 2021, "STA01", 141);
insert into Piano_Didattico values (65, 2021, "FIS01", 142);
insert into Piano_Didattico values (66, 2021, "PSI01", 143);
insert into Piano_Didattico values (67, 2024, "TUR01", 144);
insert into Piano_Didattico values (68, 2026, "LET01", 145);
insert into Piano_Didattico values (69, 2022, "PSI01", 146);
insert into Piano_Didattico values (70, 2020, "LIN01", 147);
insert into Piano_Didattico values (71, 2025, "STO01", 148);
insert into Piano_Didattico values (72, 2021, "ING_INF03", 149);
insert into Piano_Didattico values (73, 2026, "FIL01", 150);
insert into Piano_Didattico values (74, 2022, "FIS01", 151);
insert into Piano_Didattico values (75, 2024, "BIOFAR01", 152);
insert into Piano_Didattico values (76, 2022, "DES01", 153);
insert into Piano_Didattico values (77, 2020, "URB01", 154);
insert into Piano_Didattico values (78, 2024, "URB01", 155);
insert into Piano_Didattico values (79, 2025, "SOC01", 156);
insert into Piano_Didattico values (80, 2023, "ROB01", 157);
insert into Piano_Didattico values (81, 2026, "COM01", 158);
insert into Piano_Didattico values (82, 2026, "CHI01", 159);
insert into Piano_Didattico values (83, 2026, "MED01", 160);
insert into Piano_Didattico values (84, 2024, "URB01", 161);
insert into Piano_Didattico values (85, 2020, "ING_INF03", 162);
insert into Piano_Didattico values (86, 2022, "BIO01", 163);
insert into Piano_Didattico values (87, 2020, "ARC_CES01", 164);
insert into Piano_Didattico values (88, 2022, "CHI01", 165);
insert into Piano_Didattico values (89, 2026, "INF01", 166);
insert into Piano_Didattico values (90, 2022, "ANA01", 167);
insert into Piano_Didattico values (91, 2025, "LIN01", 168);
insert into Piano_Didattico values (92, 2021, "SOC01", 169);
insert into Piano_Didattico values (93, 2024, "FAR01", 170);
insert into Piano_Didattico values (94, 2024, "TUR01", 171);
insert into Piano_Didattico values (95, 2020, "GIU01", 172);
insert into Piano_Didattico values (96, 2022, "ING_INF01", 173);
insert into Piano_Didattico values (97, 2023, "DES_CES01", 174);
insert into Piano_Didattico values (98, 2025, "LIN01", 175);
insert into Piano_Didattico values (99, 2020, "STO01", 176);
insert into Piano_Didattico values (100, 2024, "ING_INF01", 177);
insert into Piano_Didattico values (101, 2023, "GIU01", 178);
insert into Piano_Didattico values (102, 2025, "MAT01", 179);
insert into Piano_Didattico values (103, 2021, "ING_INF03", 180);
insert into Piano_Didattico values (104, 2021, "FIS01", 181);
insert into Piano_Didattico values (105, 2024, "MED01", 182);
insert into Piano_Didattico values (106, 2021, "DES_CES01", 183);
insert into Piano_Didattico values (107, 2021, "URB01", 184);
insert into Piano_Didattico values (108, 2021, "LET01", 185);
insert into Piano_Didattico values (109, 2026, "URB01", 186);
insert into Piano_Didattico values (110, 2026, "COM01", 187);
insert into Piano_Didattico values (111, 2023, "DIR01", 188);
insert into Piano_Didattico values (112, 2021, "ROB01", 189);
insert into Piano_Didattico values (113, 2025, "FIS01", 190);
insert into Piano_Didattico values (114, 2024, "STO01", 191);
insert into Piano_Didattico values (115, 2025, "TUR01", 192);
insert into Piano_Didattico values (116, 2024, "ANA01", 193);
insert into Piano_Didattico values (117, 2025, "SOC01", 194);
insert into Piano_Didattico values (118, 2026, "FIS01", 195);
insert into Piano_Didattico values (119, 2022, "STA01", 196);
insert into Piano_Didattico values (120, 2020, "FIL01", 197);
insert into Piano_Didattico values (121, 2021, "ING_INF02", 198);
insert into Piano_Didattico values (122, 2021, "ING_INF03", 199);
insert into Piano_Didattico values (123, 2024, "FAR01", 200);
insert into Piano_Didattico values (124, 2020, "FIL01", 201);
insert into Piano_Didattico values (125, 2021, "FIS01", 202);
insert into Piano_Didattico values (126, 2020, "ARC_CES02", 203);
insert into Piano_Didattico values (127, 2021, "ING01", 204);
insert into Piano_Didattico values (128, 2020, "ANA01", 205);
insert into Piano_Didattico values (129, 2021, "ECO03", 206);
insert into Piano_Didattico values (130, 2026, "STO01", 207);
insert into Piano_Didattico values (131, 2026, "LIN01", 208);
insert into Piano_Didattico values (132, 2022, "DIR01", 209);
insert into Piano_Didattico values (133, 2026, "STO01", 210);
insert into Piano_Didattico values (134, 2022, "CHI01", 211);
insert into Piano_Didattico values (135, 2026, "INF01", 212);
insert into Piano_Didattico values (136, 2023, "DES01", 213);
insert into Piano_Didattico values (137, 2024, "ARC_CES02", 214);
insert into Piano_Didattico values (138, 2024, "PSI01", 215);
insert into Piano_Didattico values (139, 2021, "GIU01", 216);
insert into Piano_Didattico values (140, 2025, "ECO02", 217);
insert into Piano_Didattico values (141, 2025, "ECO01", 218);
insert into Piano_Didattico values (142, 2024, "ECO02", 219);
insert into Piano_Didattico values (143, 2022, "POL01", 220);
insert into Piano_Didattico values (144, 2024, "ARC_CES01", 221);
insert into Piano_Didattico values (145, 2022, "ING_INF02", 222);
insert into Piano_Didattico values (146, 2022, "ANA01", 223);
insert into Piano_Didattico values (147, 2021, "ECO03", 224);
insert into Piano_Didattico values (148, 2020, "URB01", 125);

# ---------------------------------------------------------------------- #
# Add info into "Professore"                                             #
# ---------------------------------------------------------------------- #

truncate table Professore;

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
insert into Professore values (78);
insert into Professore values (80);
insert into Professore values (81);
insert into Professore values (82);
insert into Professore values (83);
insert into Professore values (84);
insert into Professore values (88);
insert into Professore values (94);
insert into Professore values (95);
insert into Professore values (96);
insert into Professore values (98);
insert into Professore values (99);
insert into Professore values (100);
insert into Professore values (101);
insert into Professore values (102);
insert into Professore values (103);
insert into Professore values (104);
insert into Professore values (106);
insert into Professore values (109);
insert into Professore values (111);
insert into Professore values (113);
insert into Professore values (116);
insert into Professore values (117);
insert into Professore values (118);
insert into Professore values (119);
insert into Professore values (123);
insert into Professore values (225);
insert into Professore values (226);
insert into Professore values (227);
insert into Professore values (228);
insert into Professore values (229);
insert into Professore values (230);
insert into Professore values (231);
insert into Professore values (232);
insert into Professore values (233);
insert into Professore values (234);
insert into Professore values (235);
insert into Professore values (236);
insert into Professore values (237);
insert into Professore values (238);
insert into Professore values (239);
insert into Professore values (240);
insert into Professore values (241);
insert into Professore values (242);
insert into Professore values (243);
insert into Professore values (244);
insert into Professore values (245);
insert into Professore values (246);
insert into Professore values (247);
insert into Professore values (248);
insert into Professore values (249);
insert into Professore values (250);
insert into Professore values (251);
insert into Professore values (252);
insert into Professore values (253);
insert into Professore values (254);
insert into Professore values (255);
insert into Professore values (256);
insert into Professore values (257);

# ---------------------------------------------------------------------- #
# Add info into "Promotore"                                              #
# ---------------------------------------------------------------------- #

truncate table Promotore;

insert into Promotore values (1, "Celestial Minds", "celestialminds32@libero.it");
insert into Promotore values (2, "Radiant Minds", "radiantminds46@hotmail.com");
insert into Promotore values (3, "Starbound", "starbound69@gmail.com");
insert into Promotore values (4, "Aurora Labs", "auroralabs94@yahoo.it");
insert into Promotore values (5, "Pixel Pioneers", "pixelpioneers13@hotmail.com");
insert into Promotore values (6, "IronWolf Collective", "ironwolfcollective74@libero.it");
insert into Promotore values (7, "IronWolf Collective", "ironwolfcollective45@hotmail.com");
insert into Promotore values (8, "Neon Knights", "neonknights68@yahoo.it");
insert into Promotore values (9, "QuantumLeap", "quantumleap56@yahoo.it");
insert into Promotore values (10, "SkyBound", "skybound68@hotmail.com");
insert into Promotore values (11, "LumenTech", "lumentech71@yahoo.it");
insert into Promotore values (12, "Quantum Squad", "quantumsquad2@hotmail.com");
insert into Promotore values (13, "Ignite Labs", "ignitelabs8@hotmail.com");
insert into Promotore values (14, "Nova Titans", "novatitans64@libero.it");
insert into Promotore values (15, "Bright Horizon", "brighthorizon11@libero.it");
insert into Promotore values (16, "GoldenHive", "goldenhive58@yahoo.it");
insert into Promotore values (17, "Data Mavericks", "datamavericks94@yahoo.it");
insert into Promotore values (18, "Titan Group", "titangroup55@gmail.com");
insert into Promotore values (19, "Skyline Dynamics", "skylinedynamics21@hotmail.com");
insert into Promotore values (20, "Velocity Ventures", "velocityventures26@yahoo.it");
insert into Promotore values (21, "Solaris Team", "solaristeam43@hotmail.com");
insert into Promotore values (22, "Momentum Group", "momentumgroup40@gmail.com");
insert into Promotore values (23, "Bright Horizon", "brighthorizon58@yahoo.it");
insert into Promotore values (24, "Titanium Crew", "titaniumcrew33@libero.it");
insert into Promotore values (25, "Phoenix Alliance", "phoenixalliance15@hotmail.com");
insert into Promotore values (26, "Titan Group", "titangroup50@libero.it");
insert into Promotore values (27, "Emerald Hive", "emeraldhive51@hotmail.com");
insert into Promotore values (28, "Obsidian Circle", "obsidiancircle67@hotmail.com");
insert into Promotore values (29, "Momentum Group", "momentumgroup28@hotmail.com");
insert into Promotore values (30, "Aurora Labs", "auroralabs87@yahoo.it");
insert into Promotore values (31, "Ignite Labs", "ignitelabs47@libero.it");
insert into Promotore values (32, "Cosmic Collective", "cosmiccollective65@hotmail.com");
insert into Promotore values (33, "Starbound", "starbound52@yahoo.it");
insert into Promotore values (34, "Vortex Vision", "vortexvision4@gmail.com");
insert into Promotore values (35, "NextGen Innovators", "nextgeninnovators39@yahoo.it");
insert into Promotore values (36, "Pixel Pioneers", "pixelpioneers53@yahoo.it");
insert into Promotore values (37, "Lumina Crew", "luminacrew51@hotmail.com");
insert into Promotore values (38, "Orbis Solutions", "orbissolutions65@gmail.com");
insert into Promotore values (39, "Nova Crew", "novacrew62@hotmail.com");
insert into Promotore values (40, "NimbusTech", "nimbustech93@yahoo.it");
insert into Promotore values (41, "Emerald Hive", "emeraldhive8@hotmail.com");
insert into Promotore values (42, "SilverLine", "silverline17@hotmail.com");
insert into Promotore values (43, "QuantumLeap", "quantumleap60@libero.it");
insert into Promotore values (44, "Vortex Vision", "vortexvision81@hotmail.com");
insert into Promotore values (45, "Starbound", "starbound71@libero.it");
insert into Promotore values (46, "Alpha Nexus", "alphanexus29@yahoo.it");
insert into Promotore values (47, "Titanium Crew", "titaniumcrew99@yahoo.it");
insert into Promotore values (48, "Eclipse Syndicate", "eclipsesyndicate94@gmail.com");
insert into Promotore values (49, "Radiant Minds", "radiantminds2@libero.it");
insert into Promotore values (50, "Vanguard Labs", "vanguardlabs15@libero.it");

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
insert into Provincia values ("RN","Rimini");
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
# Add info into "Rappresentano"                                                   #
# ---------------------------------------------------------------------- #

truncate table Rappresentano;

insert into Rappresentano values (5, "ZNTDNC84L11B858F");
insert into Rappresentano values (5, "FRNNNL02T62L378Y");
insert into Rappresentano values (7, "BRDLXA72D43C351V");
insert into Rappresentano values (7, "RMNDBR65E43C792R");
insert into Rappresentano values (8, "TSTNCL83S27L219Y");
insert into Rappresentano values (8, "NNCNNL60S54A662H");
insert into Rappresentano values (9, "LBRMRT81A66L781O");
insert into Rappresentano values (9, "MRCLNR89C52C351D");
insert into Rappresentano values (10, "VRDGRL07R29A662I");
insert into Rappresentano values (10, "CLBJCP02S16L219Y");
insert into Rappresentano values (10, "FRNNNL02T62L378Y");
insert into Rappresentano values (11, "FRRNGL56T42H266K");
insert into Rappresentano values (11, "DBNRTI56A67C792B");
insert into Rappresentano values (12, "CSTSLV06H65L219T");
insert into Rappresentano values (12, "RMNLCU08A19B882Z");
insert into Rappresentano values (13, "PGLGRG65S41I134Z");
insert into Rappresentano values (24, "NRECRL80D05D949N");
insert into Rappresentano values (24, "BRNLSN67E29C724P");
insert into Rappresentano values (24, "CNITMS99C09H703L");
insert into Rappresentano values (27, "NNCNTN60R21F205K");
insert into Rappresentano values (27, "NPLKVN02D28D949K");
insert into Rappresentano values (27, "NPLBRC56S50L781H");
insert into Rappresentano values (28, "MRNGRG71M12E376I");
insert into Rappresentano values (29, "TSCLXA86C08D969F");
insert into Rappresentano values (29, "DBNPRZ92T53G224F");
insert into Rappresentano values (29, "RSSGRG81P53L402C");
insert into Rappresentano values (30, "FRRDGI02C23D525W");
insert into Rappresentano values (30, "GRRGLI74E71A189I");
insert into Rappresentano values (31, "RMNPLA74D13A310O");
insert into Rappresentano values (32, "SLARTI80L65A643P");
insert into Rappresentano values (32, "CRSGNN86S61G702C");
insert into Rappresentano values (32, "ZCCPLA70R63D230J");
insert into Rappresentano values (34, "BTASRA95L53C724C");
insert into Rappresentano values (35, "CVLNGL82M52A037X");
insert into Rappresentano values (35, "NNCMRC94M14A037S");
insert into Rappresentano values (35, "VLLSFN62L30I386Q");
insert into Rappresentano values (36, "PRSGNN08R52D491D");
insert into Rappresentano values (36, "TSTLRI66M55D612M");
insert into Rappresentano values (36, "DNTSLV76H58I309J");
insert into Rappresentano values (37, "CPTLGU78B21L390T");
insert into Rappresentano values (37, "DMCLNZ01E01F776T");
insert into Rappresentano values (37, "BTASRA95L53C724C");
insert into Rappresentano values (38, "SRRDNC07M31H501V");
insert into Rappresentano values (38, "FBBLCU83P19I134B");
insert into Rappresentano values (39, "BTASFN04S22I143R");
insert into Rappresentano values (39, "RMNLCU08A19B882Z");
insert into Rappresentano values (41, "BTASRA95L53C724C");
insert into Rappresentano values (43, "SRRVCN59C25D027Z");
insert into Rappresentano values (44, "VNTGPP08R29D612J");
insert into Rappresentano values (45, "SPSNCL77L10G224E");
insert into Rappresentano values (47, "FRRNNL88H44D111B");
insert into Rappresentano values (48, "MNCRCR65S05B440T");
insert into Rappresentano values (49, "SRRDNC07M31H501V");
insert into Rappresentano values (49, "RSSGRG81P53L402C");
insert into Rappresentano values (50, "PRSCRS01H22L402V");

# ---------------------------------------------------------------------- #
# Add info into "Richiesta_Evento"                                       #
# ---------------------------------------------------------------------- #

truncate table Richiesta_Evento;

insert into Richiesta_Evento values (1, "Modifica", "Laboratorio di Chimica", 33, "Workshop intensivo di aggiornamento", 28, "CVLCRS73L21C839N", "NULL", "NULL");
insert into Richiesta_Evento values (2, "Eliminazione", "NULL", NULL, "NULL", 19, "NULL", "RSSGRG81P53L402C", "NULL");
insert into Richiesta_Evento values (3, "Inserimento", "Workshop di Marketing Digitale", 193, "Evento di orientamento per studenti e famiglie", 51, "DLCLRA95T45I143C", "NULL", "MRNGRG71M12E376I");
insert into Richiesta_Evento values (4, "Inserimento", "Incontro di Networking Accademico", 51, "Workshop intensivo di aggiornamento", 52, "GRSLND08C59C724G", "NULL", "SLANCL68P11G484W");
insert into Richiesta_Evento values (5, "Inserimento", "Seminario di Economia", 13, "Seminario introduttivo per nuovi iscritti", 53, "DNTSLV76H58I309J", "NULL", "TSTLRI66M55D612M");
insert into Richiesta_Evento values (6, "Inserimento", "Evento di Volontariato Universitario", 59, "Evento di disseminazione dei risultati di ricerca", 54, "BTAVSS01H42H266Q", "NULL", "BRMDVD84P02A587E");
insert into Richiesta_Evento values (7, "Eliminazione", "NULL", NULL, "NULL", 33, "NULL", "CNITMS99C09H703L", "NULL");
insert into Richiesta_Evento values (8, "Inserimento", "Laboratorio di Design e Architettura", 106, "Conferenza con relatori internazionali", 55, "GRSLND08C59C724G", "NULL", "NREDNL98P01A913Z");
insert into Richiesta_Evento values (9, "Eliminazione", "NULL", NULL, "NULL", 26, "NULL", "BRNNCL66A02F883Q", "NULL");
insert into Richiesta_Evento values (10, "Inserimento", "Laboratorio di Informatica Avanzata", 138, "Evento di formazione continua", 56, "CLBJCP02S16L219Y", "NULL", "ZCCFNC85M31D276Q");

# ---------------------------------------------------------------------- #
# Add info into "Sede"                                                   #
# ---------------------------------------------------------------------- #

truncate table Sede;

insert into Sede values (0, "BO", "BO", 33, "Palazzo Poggi");
insert into Sede values (1, "BO", "BO", 38, "Palazzo Riario");
insert into Sede values (2, "BO", "BO", 2, "San Giovanni in Monte");
insert into Sede values (3, "BO", "BO", 20, "Collegio dei Fiamminghi");
insert into Sede values (4, "BO", "BO", 45, "Palazzo Hercolani");
insert into Sede values (5, "BO", "BO", 28, "Complesso Terracini");
insert into Sede values (6, "BO", "BO", 9, "Policlinico Sant'Orsola-Malpighi");
insert into Sede values (7, "FC", "CE", 50, "Campus universitario di Cesena");
insert into Sede values (8, "FC", "FO", 1, "Polo universitario di Forlì");
insert into Sede values (9, "RA", "RA", 27, "Direzione e servizi studenti");
insert into Sede values (10, "RA", "RA", 1, "Dipartimento Beni Culturali");
insert into Sede values (11, "RA", "RA", 6, "Palazzo Corradini");
insert into Sede values (12, "RA", "RA", 23, "Palazzo Verdi");
insert into Sede values (13, "RA", "RA", 163, "Laboratori Scientifici");
insert into Sede values (14, "RA", "RA", 55, "Ingegneria e Architettura");
insert into Sede values (15, "RA", "RA", 5, "Ospedale S.Maria delle Croci");
insert into Sede values (16, "RN", "RN", 22, "Complesso Valgimigli");

# ---------------------------------------------------------------------- #
# Add info into "Segreteria"                                             #
# ---------------------------------------------------------------------- #

truncate table Segreteria;

insert into Segreteria values (1,4);
insert into Segreteria values (7,3);
insert into Segreteria values (10,9);
insert into Segreteria values (13,4);
insert into Segreteria values (25,6);
insert into Segreteria values (47,3);
insert into Segreteria values (49,7);
insert into Segreteria values (55,8);
insert into Segreteria values (75,9);
insert into Segreteria values (76,3);
insert into Segreteria values (77,5);
insert into Segreteria values (79,1);
insert into Segreteria values (85,4);
insert into Segreteria values (86,5);
insert into Segreteria values (87,7);
insert into Segreteria values (89,10);
insert into Segreteria values (90,3);
insert into Segreteria values (91,8);
insert into Segreteria values (92,3);
insert into Segreteria values (93,2);
insert into Segreteria values (97,4);
insert into Segreteria values (105,9);
insert into Segreteria values (107,8);
insert into Segreteria values (108,5);
insert into Segreteria values (110,2);
insert into Segreteria values (112,6);
insert into Segreteria values (114,9);
insert into Segreteria values (115,1);
insert into Segreteria values (120,9);
insert into Segreteria values (121,2);
insert into Segreteria values (122,7);
insert into Segreteria values (124,5);

# ---------------------------------------------------------------------- #
# Add info into "Seguito_In"                                             #
# ---------------------------------------------------------------------- #

truncate table Seguito_In;

insert into Seguito_In values ("ECO01", 0);
insert into Seguito_In values ("ECO01", 8);
insert into Seguito_In values ("ECO01", 9);
insert into Seguito_In values ("ECO01", 12);
insert into Seguito_In values ("ECO02", 0);
insert into Seguito_In values ("ECO02", 8);
insert into Seguito_In values ("ECO02", 12);
insert into Seguito_In values ("ECO03", 1);
insert into Seguito_In values ("ECO03", 3);
insert into Seguito_In values ("TUR01", 0);
insert into Seguito_In values ("TUR01", 8);
insert into Seguito_In values ("TUR01", 12);
insert into Seguito_In values ("ING01", 3);
insert into Seguito_In values ("ING01", 5);
insert into Seguito_In values ("ING01", 8);
insert into Seguito_In values ("ING02", 3);
insert into Seguito_In values ("ING02", 5);
insert into Seguito_In values ("ING_INF01", 7);
insert into Seguito_In values ("ING_INF01", 10);
insert into Seguito_In values ("ING_INF02", 5);
insert into Seguito_In values ("ING_INF02", 8);
insert into Seguito_In values ("ING_INF02", 10);
insert into Seguito_In values ("ING_INF03", 5);
insert into Seguito_In values ("ING_INF03", 10);
insert into Seguito_In values ("ROB01", 5);
insert into Seguito_In values ("ROB01", 10);
insert into Seguito_In values ("ARC01", 5);
insert into Seguito_In values ("ARC01", 11);
insert into Seguito_In values ("DES01", 5);
insert into Seguito_In values ("URB01", 5);
insert into Seguito_In values ("URB01", 12);
insert into Seguito_In values ("ARC_CES01", 7);
insert into Seguito_In values ("ARC_CES01", 10);
insert into Seguito_In values ("ARC_CES02", 7);
insert into Seguito_In values ("DES_CES01", 7);
insert into Seguito_In values ("URB_CES01", 7);
insert into Seguito_In values ("TEC_CES01", 7);
insert into Seguito_In values ("MAT01", 2);
insert into Seguito_In values ("MAT01", 8);
insert into Seguito_In values ("MAT01", 13);
insert into Seguito_In values ("FIS01", 2);
insert into Seguito_In values ("FIS01", 4);
insert into Seguito_In values ("FIS01", 13);
insert into Seguito_In values ("CHI01", 2);
insert into Seguito_In values ("BIO01", 2);
insert into Seguito_In values ("STA01", 2);
insert into Seguito_In values ("STA01", 8);
insert into Seguito_In values ("ANA01", 2);
insert into Seguito_In values ("ANA01", 12);
insert into Seguito_In values ("MED01", 6);
insert into Seguito_In values ("MED01", 15);
insert into Seguito_In values ("INF01", 6);
insert into Seguito_In values ("FAR01", 0);
insert into Seguito_In values ("BIOFAR01", 0);
insert into Seguito_In values ("GIU01", 0);
insert into Seguito_In values ("GIU01", 12);
insert into Seguito_In values ("DIR01", 0);
insert into Seguito_In values ("POL01", 12);
insert into Seguito_In values ("POL01", 16);
insert into Seguito_In values ("SOC01", 16);
insert into Seguito_In values ("COM01", 16);
insert into Seguito_In values ("PSI01", 0);
insert into Seguito_In values ("LET01", 0);
insert into Seguito_In values ("LET01", 12);
insert into Seguito_In values ("STO01", 0);
insert into Seguito_In values ("STO01", 11);
insert into Seguito_In values ("FIL01", 0);
insert into Seguito_In values ("LIN01", 0);

# ---------------------------------------------------------------------- #
# Add info into "Sistema Universitario"                                  #
# ---------------------------------------------------------------------- #

truncate table Sistema_Universitario;

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
insert into Sistema_Universitario values (75,"riccardo.mancini@studio.unibo.it","4emoah720y","MNCRCR65S05B440T");
insert into Sistema_Universitario values (76,"christian.napolitano@studio.unibo.it","jvofdstkrh","NPLCRS80R11D969E");
insert into Sistema_Universitario values (77,"raffaele.testa@studio.unibo.it","80pmsmjn0p","TSTRFL98T09A348N");
insert into Sistema_Universitario values (78,"nicole.romano65@studio.unibo.it","2t31fgi5gp","RMNNCL71A45B858H");
insert into Sistema_Universitario values (79,"sergio.de santis35@studio.unibo.it","m8zjdwysz3","DSNSRG96C16A189M");
insert into Sistema_Universitario values (80,"marco.russo66@studio.unibo.it","4b13r8z0wu","RSSMRC66B27F548Z");
insert into Sistema_Universitario values (81,"debora.zanetti37@studio.unibo.it","5jklw5vdlr","ZNTDBR85L47E376K");
insert into Sistema_Universitario values (82,"daniele.napolitano97@studio.unibo.it","7cvygjpv4f","NPLDNL78R10C724W");
insert into Sistema_Universitario values (83,"alice.arena@studio.unibo.it","3r2vwh0avx","RNALCA97H54F839D");
insert into Sistema_Universitario values (84,"domenico.monti@studio.unibo.it","p4zh3sukkx","MNTDNC66B18L781F");
insert into Sistema_Universitario values (85,"antonio.coppola@studio.unibo.it","460i03f4id","CPPNTN83D23C118H");
insert into Sistema_Universitario values (86,"michele.ferretti@studio.unibo.it","22lg1jvgre","FRRMHL57M02C839Y");
insert into Sistema_Universitario values (87,"daniele.caputo@studio.unibo.it","siu9v5h8a7","CPTDNL56M31G715D");
insert into Sistema_Universitario values (88,"tommaso.esposito13@studio.unibo.it","usubhnszuw","SPSTMS01T21G715H");
insert into Sistema_Universitario values (89,"salvatore.verdi@studio.unibo.it","p8g81t3rs3","VRDSVT92A04I386K");
insert into Sistema_Universitario values (90,"fabio.fusco62@studio.unibo.it","mcvet3l0kl","FSCFBA78L28B858T");
insert into Sistema_Universitario values (91,"veronica.rinaldi@studio.unibo.it","8uyvw8420p","RNLVNC81S42F205Q");
insert into Sistema_Universitario values (92,"lucia.fazio@studio.unibo.it","i3zacokmlf","FZALCU87E57A794Z");
insert into Sistema_Universitario values (93,"ilaria.barbieri9@studio.unibo.it","i470ge33t2","BRBLRI58T61D111Z");
insert into Sistema_Universitario values (94,"luca.fabbri@studio.unibo.it","y1ev5hevc9","FBBLCU83P19I134B");
insert into Sistema_Universitario values (95,"sara.napolitano52@studio.unibo.it","irxs8j1llz","NPLSRA78E61G484V");
insert into Sistema_Universitario values (96,"federico.bordoni21@studio.unibo.it","w5lzsh1otj","BRDFRC76H03D704Z");
insert into Sistema_Universitario values (97,"marco.innocenti@studio.unibo.it","0h51giq3rg","NNCMRC94M14A037S");
insert into Sistema_Universitario values (98,"stefano.abate@studio.unibo.it","xrhcgssz1z","BTASFN04S22I143R");
insert into Sistema_Universitario values (99,"francesca.fazio4@studio.unibo.it","8ljhcp26cc","FZAFNC83T59D394O");
insert into Sistema_Universitario values (100,"vanessa.russo@studio.unibo.it","e2gff81des","RSSVSS06L54G930D");
insert into Sistema_Universitario values (101,"domenico.neri@studio.unibo.it","b40bd7kgs1","NREDNC60S08I123S");
insert into Sistema_Universitario values (102,"federico.russo71@studio.unibo.it","o2yrzqjnnd","RSSFRC86M19B858U");
insert into Sistema_Universitario values (103,"linda.napolitano@studio.unibo.it","bbi925s512","NPLLND64A63L402P");
insert into Sistema_Universitario values (104,"denis.ventura@studio.unibo.it","wc4obu65c7","VNTDNS84L17G224D");
insert into Sistema_Universitario values (105,"marco.zanetti@studio.unibo.it","8vi0q3lo8d","ZNTMRC79M14I134E");
insert into Sistema_Universitario values (106,"elena.fusco35@studio.unibo.it","3x5hmb6wha","FSCLNE01A51C887J");
insert into Sistema_Universitario values (107,"federico.baldini@studio.unibo.it","9jl83y0it6","BLDFRC74S17G715F");
insert into Sistema_Universitario values (108,"daniele.napolitano@studio.unibo.it","1tcui9cqxb","NPLDNL84P18B889A");
insert into Sistema_Universitario values (109,"jacopo.silvestri@studio.unibo.it","ck3phyouti","SLVJCP81D18H224Q");
insert into Sistema_Universitario values (110,"elisa.zanetti@studio.unibo.it","pnvd2hpmxb","ZNTLSE89E50F753M");
insert into Sistema_Universitario values (111,"maria.iacono@studio.unibo.it","9emrh88a4p","CNIMRA61C49D949K");
insert into Sistema_Universitario values (112,"giovanna.rinaldi51@studio.unibo.it","b71yebi8on","RNLGNN72H43B440K");
insert into Sistema_Universitario values (113,"camilla.russo68@studio.unibo.it","xqko1kujq7","RSSCLL81T52B889G");
insert into Sistema_Universitario values (114,"domenico.serra@studio.unibo.it","xcjzqn4pe5","SRRDNC07M31H501V");
insert into Sistema_Universitario values (115,"stefano.piras@studio.unibo.it","oasbb0ju9l","PRSSFN00D13I386O");
insert into Sistema_Universitario values (116,"nicola.testa@studio.unibo.it","75xotdkkut","TSTNCL83S27L219Y");
insert into Sistema_Universitario values (117,"nicole.monti45@studio.unibo.it","1bwumnp7p8","MNTNCL89H70D276P");
insert into Sistema_Universitario values (118,"rita.di benedetto@studio.unibo.it","7upkoseker","DBNRTI56A67C792B");
insert into Sistema_Universitario values (119,"alberto.iacono44@studio.unibo.it","tzu8i8fte3","CNILRT71A20I143A");
insert into Sistema_Universitario values (120,"chiara.graziani@studio.unibo.it","38p0vxz11r","GRZCHR88P55A372Q");
insert into Sistema_Universitario values (121,"nicole.villa81@studio.unibo.it","ddjc3h1zi9","VLLNCL88P46L602S");
insert into Sistema_Universitario values (122,"claudia.testa43@studio.unibo.it","u8k3wfg1ud","TSTCLD87L41H703E");
insert into Sistema_Universitario values (123,"raffaele.donati58@studio.unibo.it","zi5atv8ysn","DNTRFL67T20C933F");
insert into Sistema_Universitario values (124,"debora.romano18@studio.unibo.it","q5ut5ut7x5","RMNDBR65E43C792R");
insert into Sistema_Universitario values (125,"angela.cavaliere24@studio.unibo.it","p03o0awg9t","CVLNGL82M52A037X");
insert into Sistema_Universitario values (126,"daniele.crespi43@studio.unibo.it","qba6dmb6c6","CRSDNL01C29G908C");
insert into Sistema_Universitario values (127,"fabio.greco@studio.unibo.it","76d1by90ke","GRCFBA76E02C792W");
insert into Sistema_Universitario values (128,"manuel.pellegrini@studio.unibo.it","3c3gxpy1l7","PLLMNL72D03A310N");
insert into Sistema_Universitario values (129,"alice.fabbri@studio.unibo.it","5z6jivtxh2","FBBLCA75B52A286A");
insert into Sistema_Universitario values (130,"linda.toscano@studio.unibo.it","jjghathbos","TSCLND94C63B889V");
insert into Sistema_Universitario values (131,"irene.russo@studio.unibo.it","sypmwspd2q","RSSRNI94D43L424P");
insert into Sistema_Universitario values (132,"salvatore.ferretti@studio.unibo.it","2sod8q6m2q","FRRSVT06T27G224F");
insert into Sistema_Universitario values (133,"chris.barbieri@studio.unibo.it","n49e4kkvjc","BRBCRS94R23C118T");
insert into Sistema_Universitario values (134,"sara.de santis@studio.unibo.it","qc2wjbb77e","DSNSRA85A67H196I");
insert into Sistema_Universitario values (135,"michele.silvestri52@studio.unibo.it","j5j7n0x477","SLVMHL96E10I386H");
insert into Sistema_Universitario values (136,"vanessa.abate21@studio.unibo.it","ovnl1s8nvt","BTAVSS01H42H266Q");
insert into Sistema_Universitario values (137,"debora.innocenti@studio.unibo.it","32jgfs2dzq","NNCDBR94B45G702M");
insert into Sistema_Universitario values (138,"denis.carbone@studio.unibo.it","64dimlmzr0","CRBDNS78H21G224N");
insert into Sistema_Universitario values (139,"giulia.guerra53@studio.unibo.it","b8z8xxok3d","GRRGLI74E71A189I");
insert into Sistema_Universitario values (140,"patrizia.di benedetto@studio.unibo.it","b8w83vpgxm","DBNPRZ92T53G224F");
insert into Sistema_Universitario values (141,"rita.de angelis25@studio.unibo.it","kt3zu4e7cb","DNGRTI75R66B882Q");
insert into Sistema_Universitario values (142,"francesca.iacono55@studio.unibo.it","d0srt6qhir","CNIFNC97R42A189W");
insert into Sistema_Universitario values (143,"diego.ferrari29@studio.unibo.it","hkzukibi3s","FRRDGI02C23D525W");
insert into Sistema_Universitario values (144,"daniele.toscano36@studio.unibo.it","i3r6ygepxp","TSCDNL06E23A348K");
insert into Sistema_Universitario values (145,"giorgio.toscano@studio.unibo.it","zr6d7d92vk","TSCGRG67M12A587Z");
insert into Sistema_Universitario values (146,"sofia.lucchesi@studio.unibo.it","5d6r2kzebs","LCCSFO65H62B858G");
insert into Sistema_Universitario values (147,"alberto.graziani@studio.unibo.it","hugrydfc4a","GRZLRT72S02E376U");
insert into Sistema_Universitario values (148,"antonio.innocenti@studio.unibo.it","trblxe32ca","NNCNTN60R21F205K");
insert into Sistema_Universitario values (149,"alberto.longo32@studio.unibo.it","n5wec6w85p","LNGLRT64A14L424P");
insert into Sistema_Universitario values (150,"luca.ferrari@studio.unibo.it","sv54ig7v7q","FRRLCU62B20A587Q");
insert into Sistema_Universitario values (151,"gabriele.messina86@studio.unibo.it","r7aisqorok","MSSGRL64R25A348D");
insert into Sistema_Universitario values (152,"daniela.de luca6@studio.unibo.it","jmtet65p0d","DLCDNL56C66B882T");
insert into Sistema_Universitario values (153,"tommaso.toscano47@studio.unibo.it","aknp1cwhjo","TSCTMS82P30B861E");
insert into Sistema_Universitario values (154,"valerio.ferrari74@studio.unibo.it","weig7jja0y","FRRVLR70D03F205S");
insert into Sistema_Universitario values (155,"alberto.arena57@studio.unibo.it","5b1tgtt4s2","RNALRT64A28L736F");
insert into Sistema_Universitario values (156,"daniele.longo@studio.unibo.it","1rcprofstu","LNGDNL79H11H266B");
insert into Sistema_Universitario values (157,"camilla.rossi58@studio.unibo.it","1btrhpzyhw","RSSCLL82H49D230O");
insert into Sistema_Universitario values (158,"maria.zuccaro37@studio.unibo.it","cyol1svq9y","ZCCMRA90S51F839U");
insert into Sistema_Universitario values (159,"antonella.napolitano28@studio.unibo.it","rhflt8dzsb","NPLNNL95M49F572O");
insert into Sistema_Universitario values (160,"teresa.cairo83@studio.unibo.it","8pf2kjgy1h","CRATRS04C59G224K");
insert into Sistema_Universitario values (161,"paolo.di stefano58@studio.unibo.it","zp3p0wez04","DSTPLA56P27A310S");
insert into Sistema_Universitario values (162,"domenico.lombardi@studio.unibo.it","tztl3ooq89","LMBDNC93A24G930S");
insert into Sistema_Universitario values (163,"francesco.rossi52@studio.unibo.it","3moapq804z","RSSFNC60H25I123N");
insert into Sistema_Universitario values (164,"alberto.fabbri@studio.unibo.it","09e3efv50w","FBBLRT56T14F548U");
insert into Sistema_Universitario values (165,"cristina.greco35@studio.unibo.it","lkicba8mhv","GRCCST06S58C887R");
insert into Sistema_Universitario values (166,"kevin.napolitano@studio.unibo.it","38t94nltnr","NPLKVN02D28D949K");
insert into Sistema_Universitario values (167,"giorgio.calabrese@studio.unibo.it","eezs5grful","CLBGRG08P18A372X");
insert into Sistema_Universitario values (168,"valerio.antonelli65@studio.unibo.it","spgqao350g","NTNVLR78B02H266W");
insert into Sistema_Universitario values (169,"marta.toscano@studio.unibo.it","1mjhccfpp8","TSCMRT68B54L219J");
insert into Sistema_Universitario values (170,"federico.innocenti@studio.unibo.it","0tlpr5y9x0","NNCFRC92M31H223C");
insert into Sistema_Universitario values (171,"alessandra.zuccaro39@studio.unibo.it","5z4urqoktb","ZCCLSN99D52L219J");
insert into Sistema_Universitario values (172,"simone.santoro@studio.unibo.it","qlpa1xd37s","SNTSMN95T21I386A");
insert into Sistema_Universitario values (173,"emanuele.testa@studio.unibo.it","d6zj6etxma","TSTMNL84P12B861F");
insert into Sistema_Universitario values (174,"sara.puglisi@studio.unibo.it","pk9vny0o8x","PGLSRA00B55F548J");
insert into Sistema_Universitario values (175,"eleonora.ferrari@studio.unibo.it","qwd5ascz4w","FRRLNR08S56L736F");
insert into Sistema_Universitario values (176,"nicolò.bernardi@studio.unibo.it","bchakd8deq","BRNNCL66A02F883Q");
insert into Sistema_Universitario values (177,"denis.caputo@studio.unibo.it","782hrbzt2h","CPTDNS68E69A271E");
insert into Sistema_Universitario values (178,"giuseppe.ventura75@studio.unibo.it","zsi8c0x8i9","VNTGPP08R29D612J");
insert into Sistema_Universitario values (179,"sara.amato@studio.unibo.it","fs3b87vz6x","MTASRA88C56F205X");
insert into Sistema_Universitario values (180,"luca.romano@studio.unibo.it","z8y7ir3te9","RMNLCU08A19B882Z");
insert into Sistema_Universitario values (181,"matteo.crespi55@studio.unibo.it","120p5m2qbh","CRSMTT07L22L378A");
insert into Sistema_Universitario values (182,"alex.zanetti67@studio.unibo.it","seqd61cf06","ZNTLXA08T04G224Y");
insert into Sistema_Universitario values (183,"matteo.fazio95@studio.unibo.it","svnjegh3dd","FZAMTT06A02B882O");
insert into Sistema_Universitario values (184,"camilla.crespi@studio.unibo.it","k31jbnwo36","CRSCLL65P60D525W");
insert into Sistema_Universitario values (185,"giuseppe.zuccaro26@studio.unibo.it","qu48sozu4d","ZCCGPP02T07A390P");
insert into Sistema_Universitario values (186,"martina.gallo@studio.unibo.it","vvp7ua9loc","GLLMTN65T49D760N");
insert into Sistema_Universitario values (187,"gabriel.iacono@studio.unibo.it","tugwg4z2m1","CNIGRL03M30G484E");
insert into Sistema_Universitario values (188,"debora.armani41@studio.unibo.it","u1gp63oig6","RMNDBR75S51A189M");
insert into Sistema_Universitario values (189,"patrizia.verdi@studio.unibo.it","dpui6vlvxl","VRDPRZ04E41D111O");
insert into Sistema_Universitario values (190,"teresa.donati72@studio.unibo.it","24btd041sv","DNTTRS06S69A643J");
insert into Sistema_Universitario values (191,"alex.toscano@studio.unibo.it","n3b3j8b9v7","TSCLXA86C08D969F");
insert into Sistema_Universitario values (192,"domenico.valentini42@studio.unibo.it","9dfgskfcpq","VLNDNC93T01A271A");
insert into Sistema_Universitario values (193,"chris.cavaliere61@studio.unibo.it","jah8ao4z9f","CVLCRS73L21C839N");
insert into Sistema_Universitario values (194,"lorenzo.d'amico63@studio.unibo.it","rkpwg1zok7","DMCLNZ01E01F776T");
insert into Sistema_Universitario values (195,"matteo.testa76@studio.unibo.it","zjhdwfvdd3","TSTMTT60T09D394B");
insert into Sistema_Universitario values (196,"ivan.marchetti97@studio.unibo.it","0opkyrfcdk","MRCVNI88A09D612U");
insert into Sistema_Universitario values (197,"giorgia.russo@studio.unibo.it","8vb9tdarl9","RSSGRG81P53L402C");
insert into Sistema_Universitario values (198,"nicola.silvestri65@studio.unibo.it","geyhb2pps1","SLVNCL84R05B440F");
insert into Sistema_Universitario values (199,"nicola.toscano14@studio.unibo.it","uehhoxdruz","TSCNCL64R24D394Q");
insert into Sistema_Universitario values (200,"manuel.zuccaro@studio.unibo.it","m8metgzwgd","ZCCMNL67B24C351E");
insert into Sistema_Universitario values (201,"antonella.silvestri85@studio.unibo.it","slbu3g4v8o","SLVNNL72H53L378B");
insert into Sistema_Universitario values (202,"federica.toscano@studio.unibo.it","3nspsmiwnv","TSCFRC71L54L378Q");
insert into Sistema_Universitario values (203,"giovanna.crespi@studio.unibo.it","hx083trxms","CRSGNN86S61G702C");
insert into Sistema_Universitario values (204,"sofia.marchetti7@studio.unibo.it","sd1ywviumv","MRCSFO73S55H224Q");
insert into Sistema_Universitario values (205,"lucia.neri59@studio.unibo.it","s0nirnvj33","NRELCU75B45C839Y");
insert into Sistema_Universitario values (206,"rita.testa@studio.unibo.it","xr6s0rz32x","TSTRTI68B66I386Z");
insert into Sistema_Universitario values (207,"carlo.russo@studio.unibo.it","gkczhvqfqa","RSSCRL98S28C933M");
insert into Sistema_Universitario values (208,"anna.iacono@studio.unibo.it","5k5ljzmxyt","CNINNA69R53A944G");
insert into Sistema_Universitario values (209,"davide.longo32@studio.unibo.it","kpe1z9onsz","LNGDVD98S29D433S");
insert into Sistema_Universitario values (210,"enrico.franco64@studio.unibo.it","84d1zvdcz9","FRNNRC61C23C933U");
insert into Sistema_Universitario values (211,"francesco.zuccaro88@studio.unibo.it","ng3ijahz8f","ZCCFNC85M31D276Q");
insert into Sistema_Universitario values (212,"chiara.armani@studio.unibo.it","s1qgn3wz26","RMNCHR67S60I239M");
insert into Sistema_Universitario values (213,"daniele.villa@studio.unibo.it","1814c9svru","VLLDNL89E30F839G");
insert into Sistema_Universitario values (214,"giorgia.puglisi@studio.unibo.it","lsoq5vjduf","PGLGRG65S41I134Z");
insert into Sistema_Universitario values (215,"lucia.moroni@studio.unibo.it","9o3kzcndko","MRNLCU86R43A769L");
insert into Sistema_Universitario values (216,"pietro.fabbri@studio.unibo.it","nahp9pu7rk","FBBPTR77R28L219J");
insert into Sistema_Universitario values (217,"denis.martini@studio.unibo.it","e3xtp3uqo2","MRTDNS98S21F776J");
insert into Sistema_Universitario values (218,"elena.grassi@studio.unibo.it","becv6syzi4","GRSLNE02E47D525B");
insert into Sistema_Universitario values (219,"antonella.innocenti13@studio.unibo.it","6plfwxfmm1","NNCNNL60S54A662H");
insert into Sistema_Universitario values (220,"monica.bianchi31@studio.unibo.it","196a707dg1","BNCMNC72D70B882D");
insert into Sistema_Universitario values (221,"luigi.caputo82@studio.unibo.it","xvztaj44db","CPTLGU78B21L390T");
insert into Sistema_Universitario values (222,"nicola.fusco94@studio.unibo.it","8w80mikcv6","FSCNCL90L01C365C");
insert into Sistema_Universitario values (223,"stefano.ventura@studio.unibo.it","3hx5hy954c","VNTSFN74R02G715K");
insert into Sistema_Universitario values (224,"cesare.cavaliere75@studio.unibo.it","450c7bpvtp","CVLCSR04B16F839O");
insert into Sistema_Universitario values (225,"federico.marchetti2@studio.unibo.it","0opr63trqv","MRCFRC58P27D394K");
insert into Sistema_Universitario values (226,"valerio.neri24@studio.unibo.it","6gbk7txaej","NREVLR76C04H703O");
insert into Sistema_Universitario values (227,"giuseppe.sorrentino36@studio.unibo.it","3tjr5l2zp8","SRRGPP65C31C839S");
insert into Sistema_Universitario values (228,"federica.bellini80@studio.unibo.it","psbpadujuk","BLLFRC91P46B207H");
insert into Sistema_Universitario values (229,"giulia.zuccaro8@studio.unibo.it","wgq542dpq1","ZCCGLI65P64C839P");
insert into Sistema_Universitario values (230,"davide.verdi@studio.unibo.it","a9804b9t16","VRDDVD64L12C520H");
insert into Sistema_Universitario values (231,"paolo.romano3@studio.unibo.it","3tts4cyhmz","RMNPLA74D13A310O");
insert into Sistema_Universitario values (232,"ilaria.bianchi90@studio.unibo.it","953rc7l30r","BNCLRI99H45F883G");
insert into Sistema_Universitario values (233,"antonella.ferrari77@studio.unibo.it","njlrqp1vp6","FRRNNL88H44D111B");
insert into Sistema_Universitario values (234,"rebecca.piras@studio.unibo.it","yco2teb0or","PRSRCC56E69L045Y");
insert into Sistema_Universitario values (235,"paola.zuccaro34@studio.unibo.it","ho3hel7oru","ZCCPLA70R63D230J");
insert into Sistema_Universitario values (236,"roberto.marino@studio.unibo.it","rjfz6bjvu3","MRNRRT87D05A944L");
insert into Sistema_Universitario values (237,"beatrice.napolitano56@studio.unibo.it","ed0mw2b75d","NPLBRC56S50L781H");
insert into Sistema_Universitario values (238,"ilaria.testa33@studio.unibo.it","0kd3gvy8qi","TSTLRI66M55D612M");
insert into Sistema_Universitario values (239,"giulia.antonelli56@studio.unibo.it","jan8s0lk0r","NTNGLI96L63D394H");
insert into Sistema_Universitario values (240,"eleonora.marchetti@studio.unibo.it","gdg7his7os","MRCLNR89C52C351D");
insert into Sistema_Universitario values (241,"angela.testa3@studio.unibo.it","kixb9utlmc","TSTNGL71S43L390M");
insert into Sistema_Universitario values (242,"linda.rinaldi85@studio.unibo.it","hbzfkltpjj","RNLLND69A43L781P");
insert into Sistema_Universitario values (243,"alex.bordoni83@studio.unibo.it","3zvxqm031d","BRDLXA72D43C351V");
insert into Sistema_Universitario values (244,"stefano.villa55@studio.unibo.it","j6aw50oqsp","VLLSFN62L30I386Q");
insert into Sistema_Universitario values (245,"veronica.ferrari24@studio.unibo.it","xeie4v7dqu","FRRVNC05S61F205M");
insert into Sistema_Universitario values (246,"celeste.di benedetto@studio.unibo.it","cfnhrc42ss","DBNCST87H53D914I");
insert into Sistema_Universitario values (247,"alice.marino@studio.unibo.it","iqg0svsaog","MRNLCA85D67L378B");
insert into Sistema_Universitario values (248,"cristian.iacono33@studio.unibo.it","dv4zdc96nz","CNICST05S09G915I");
insert into Sistema_Universitario values (249,"noemi.martini@studio.unibo.it","e7pm9h37ix","MRTNMO90T55G484L");
insert into Sistema_Universitario values (250,"christian.russo62@studio.unibo.it","u6z78xva00","RSSCRS75C19A944H");
insert into Sistema_Universitario values (251,"elisa.russo31@studio.unibo.it","jehrnl7f3e","RSSLSE61M44F205T");
insert into Sistema_Universitario values (252,"marta.alberti@studio.unibo.it","fpzrfs55cx","LBRMRT81A66L781O");
insert into Sistema_Universitario values (253,"marta.franco88@studio.unibo.it","rbl69yqe5x","FRNMRT79B59I386L");
insert into Sistema_Universitario values (254,"roberto.moroni92@studio.unibo.it","3sxhtcayxa","MRNRRT65S15H266K");
insert into Sistema_Universitario values (255,"roberto.alberti6@studio.unibo.it","j3z85y75bm","LBRRRT97B04B207B");
insert into Sistema_Universitario values (256,"claudio.serra4@studio.unibo.it","xwakdqbie1","SRRCLD75B25L219F");
insert into Sistema_Universitario values (257,"vincenzo.serra@studio.unibo.it","jlrhkglxvt","SRRVCN59C25D027Z");

# ---------------------------------------------------------------------- #
# Add info into "Studente"                                               #
# ---------------------------------------------------------------------- #

truncate table Studente;

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
insert into Studente values (125);
insert into Studente values (126);
insert into Studente values (127);
insert into Studente values (128);
insert into Studente values (129);
insert into Studente values (130);
insert into Studente values (131);
insert into Studente values (132);
insert into Studente values (133);
insert into Studente values (134);
insert into Studente values (135);
insert into Studente values (136);
insert into Studente values (137);
insert into Studente values (138);
insert into Studente values (139);
insert into Studente values (140);
insert into Studente values (141);
insert into Studente values (142);
insert into Studente values (143);
insert into Studente values (144);
insert into Studente values (145);
insert into Studente values (146);
insert into Studente values (147);
insert into Studente values (148);
insert into Studente values (149);
insert into Studente values (150);
insert into Studente values (151);
insert into Studente values (152);
insert into Studente values (153);
insert into Studente values (154);
insert into Studente values (155);
insert into Studente values (156);
insert into Studente values (157);
insert into Studente values (158);
insert into Studente values (159);
insert into Studente values (160);
insert into Studente values (161);
insert into Studente values (162);
insert into Studente values (163);
insert into Studente values (164);
insert into Studente values (165);
insert into Studente values (166);
insert into Studente values (167);
insert into Studente values (168);
insert into Studente values (169);
insert into Studente values (170);
insert into Studente values (171);
insert into Studente values (172);
insert into Studente values (173);
insert into Studente values (174);
insert into Studente values (175);
insert into Studente values (176);
insert into Studente values (177);
insert into Studente values (178);
insert into Studente values (179);
insert into Studente values (180);
insert into Studente values (181);
insert into Studente values (182);
insert into Studente values (183);
insert into Studente values (184);
insert into Studente values (185);
insert into Studente values (186);
insert into Studente values (187);
insert into Studente values (188);
insert into Studente values (189);
insert into Studente values (190);
insert into Studente values (191);
insert into Studente values (192);
insert into Studente values (193);
insert into Studente values (194);
insert into Studente values (195);
insert into Studente values (196);
insert into Studente values (197);
insert into Studente values (198);
insert into Studente values (199);
insert into Studente values (200);
insert into Studente values (201);
insert into Studente values (202);
insert into Studente values (203);
insert into Studente values (204);
insert into Studente values (205);
insert into Studente values (206);
insert into Studente values (207);
insert into Studente values (208);
insert into Studente values (209);
insert into Studente values (210);
insert into Studente values (211);
insert into Studente values (212);
insert into Studente values (213);
insert into Studente values (214);
insert into Studente values (215);
insert into Studente values (216);
insert into Studente values (217);
insert into Studente values (218);
insert into Studente values (219);
insert into Studente values (220);
insert into Studente values (221);
insert into Studente values (222);
insert into Studente values (223);
insert into Studente values (224);

# ---------------------------------------------------------------------- #
# Add info into "Thread"                                                 #
# ---------------------------------------------------------------------- #

truncate table Thread;

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

# ---------------------------------------------------------------------- #
# Add info into "Ufficio"                                                #
# ---------------------------------------------------------------------- #

truncate table Ufficio;

insert into Ufficio values (0, 526, 3);
insert into Ufficio values (0, 529, 5);
insert into Ufficio values (0, 307, 8);
insert into Ufficio values (0, 505, 9);
insert into Ufficio values (0, 228, 20);
insert into Ufficio values (0, 115, 22);
insert into Ufficio values (1, 410, 28);
insert into Ufficio values (1, 212, 35);
insert into Ufficio values (1, 125, 38);
insert into Ufficio values (2, 105, 41);
insert into Ufficio values (2, 414, 44);
insert into Ufficio values (2, 422, 46);
insert into Ufficio values (2, 501, 58);
insert into Ufficio values (3, 413, 60);
insert into Ufficio values (3, 429, 62);
insert into Ufficio values (3, 309, 65);
insert into Ufficio values (3, 102, 67);
insert into Ufficio values (5, 209, 73);
insert into Ufficio values (5, 122, 3);
insert into Ufficio values (6, 123, 5);
insert into Ufficio values (6, 325, 8);
insert into Ufficio values (6, 307, 9);
insert into Ufficio values (6, 300, 20);
insert into Ufficio values (7, 227, 22);
insert into Ufficio values (7, 505, 28);
insert into Ufficio values (7, 529, 35);
insert into Ufficio values (8, 503, 38);
insert into Ufficio values (8, 203, 41);
insert into Ufficio values (8, 318, 44);
insert into Ufficio values (8, 522, 46);
insert into Ufficio values (8, 403, 58);
insert into Ufficio values (8, 124, 60);
insert into Ufficio values (9, 306, 62);
insert into Ufficio values (9, 521, 65);
insert into Ufficio values (9, 127, 67);
insert into Ufficio values (9, 413, 73);
insert into Ufficio values (9, 220, 3);
insert into Ufficio values (9, 401, 5);
insert into Ufficio values (9, 409, 8);
insert into Ufficio values (10, 209, 9);
insert into Ufficio values (10, 117, 20);
insert into Ufficio values (10, 402, 22);
insert into Ufficio values (10, 115, 28);
insert into Ufficio values (11, 505, 35);
insert into Ufficio values (11, 229, 38);
insert into Ufficio values (11, 429, 41);
insert into Ufficio values (11, 316, 44);
insert into Ufficio values (11, 412, 46);
insert into Ufficio values (11, 313, 58);
insert into Ufficio values (12, 122, 60);
insert into Ufficio values (12, 325, 62);
insert into Ufficio values (13, 329, 65);
insert into Ufficio values (13, 203, 67);
insert into Ufficio values (14, 312, 73);
insert into Ufficio values (14, 408, 3);
insert into Ufficio values (14, 502, 5);
insert into Ufficio values (14, 423, 8);
insert into Ufficio values (15, 321, 9);
insert into Ufficio values (15, 306, 20);
insert into Ufficio values (15, 502, 22);
insert into Ufficio values (16, 521, 28);
insert into Ufficio values (16, 511, 35);
insert into Ufficio values (16, 513, 38);

# ---------------------------------------------------------------------- #
# Add info into "Universitario"                                          #
# ---------------------------------------------------------------------- #

truncate table Universitario;

insert into Universitario values (0, 526, 15);
insert into Universitario values (0, 529, 16);
insert into Universitario values (0, 307, 17);
insert into Universitario values (0, 513, 18);
insert into Universitario values (0, 110, 19);
insert into Universitario values (0, 505, 20);
insert into Universitario values (0, 410, 21);
insert into Universitario values (0, 228, 22);
insert into Universitario values (0, 508, 23);
insert into Universitario values (0, 115, 24);
insert into Universitario values (1, 320, 25);
insert into Universitario values (1, 507, 26);
insert into Universitario values (1, 410, 27);
insert into Universitario values (1, 510, 28);
insert into Universitario values (1, 212, 29);
insert into Universitario values (1, 324, 30);
insert into Universitario values (1, 216, 31);
insert into Universitario values (1, 506, 32);
insert into Universitario values (1, 509, 33);
insert into Universitario values (1, 125, 34);
insert into Universitario values (2, 108, 35);
insert into Universitario values (2, 105, 36);
insert into Universitario values (2, 425, 37);
insert into Universitario values (2, 110, 38);
insert into Universitario values (2, 414, 39);
insert into Universitario values (2, 422, 40);
insert into Universitario values (2, 314, 41);
insert into Universitario values (2, 114, 42);
insert into Universitario values (2, 501, 43);
insert into Universitario values (2, 116, 44);
insert into Universitario values (3, 209, 45);
insert into Universitario values (3, 203, 46);
insert into Universitario values (3, 413, 47);
insert into Universitario values (3, 421, 48);
insert into Universitario values (3, 501, 49);
insert into Universitario values (3, 429, 50);
insert into Universitario values (3, 412, 51);
insert into Universitario values (3, 410, 52);
insert into Universitario values (3, 309, 53);
insert into Universitario values (3, 102, 54);
insert into Universitario values (4, 318, 55);
insert into Universitario values (4, 312, 56);
insert into Universitario values (4, 525, 57);
insert into Universitario values (4, 520, 58);
insert into Universitario values (4, 124, 59);
insert into Universitario values (4, 115, 60);
insert into Universitario values (4, 406, 61);
insert into Universitario values (4, 323, 62);
insert into Universitario values (4, 123, 63);
insert into Universitario values (4, 313, 64);
insert into Universitario values (5, 209, 65);
insert into Universitario values (5, 106, 66);
insert into Universitario values (5, 107, 67);
insert into Universitario values (5, 526, 68);
insert into Universitario values (5, 122, 69);
insert into Universitario values (5, 522, 70);
insert into Universitario values (5, 429, 71);
insert into Universitario values (5, 302, 72);
insert into Universitario values (5, 513, 73);
insert into Universitario values (5, 506, 74);
insert into Universitario values (6, 108, 75);
insert into Universitario values (6, 507, 76);
insert into Universitario values (6, 123, 77);
insert into Universitario values (6, 325, 78);
insert into Universitario values (6, 119, 79);
insert into Universitario values (6, 307, 80);
insert into Universitario values (6, 313, 81);
insert into Universitario values (6, 300, 82);
insert into Universitario values (6, 218, 83);
insert into Universitario values (6, 527, 84);
insert into Universitario values (7, 302, 85);
insert into Universitario values (7, 313, 86);
insert into Universitario values (7, 227, 87);
insert into Universitario values (7, 101, 88);
insert into Universitario values (7, 513, 89);
insert into Universitario values (7, 505, 90);
insert into Universitario values (7, 109, 91);
insert into Universitario values (7, 520, 92);
insert into Universitario values (7, 308, 93);
insert into Universitario values (7, 529, 94);
insert into Universitario values (8, 503, 95);
insert into Universitario values (8, 203, 96);
insert into Universitario values (8, 318, 97);
insert into Universitario values (8, 522, 98);
insert into Universitario values (8, 403, 99);
insert into Universitario values (8, 107, 100);
insert into Universitario values (8, 307, 101);
insert into Universitario values (8, 322, 102);
insert into Universitario values (8, 124, 103);
insert into Universitario values (8, 120, 104);
insert into Universitario values (9, 306, 105);
insert into Universitario values (9, 521, 106);
insert into Universitario values (9, 127, 107);
insert into Universitario values (9, 413, 108);
insert into Universitario values (9, 101, 109);
insert into Universitario values (9, 220, 110);
insert into Universitario values (9, 525, 111);
insert into Universitario values (9, 527, 112);
insert into Universitario values (9, 401, 113);
insert into Universitario values (9, 409, 114);
insert into Universitario values (10, 320, 115);
insert into Universitario values (10, 209, 116);
insert into Universitario values (10, 219, 117);
insert into Universitario values (10, 224, 118);
insert into Universitario values (10, 118, 119);
insert into Universitario values (10, 117, 120);
insert into Universitario values (10, 204, 121);
insert into Universitario values (10, 402, 122);
insert into Universitario values (10, 115, 123);
insert into Universitario values (10, 326, 124);
insert into Universitario values (11, 505, 125);
insert into Universitario values (11, 121, 126);
insert into Universitario values (11, 229, 127);
insert into Universitario values (11, 429, 128);
insert into Universitario values (11, 316, 129);
insert into Universitario values (11, 320, 130);
insert into Universitario values (11, 218, 131);
insert into Universitario values (11, 412, 132);
insert into Universitario values (11, 322, 133);
insert into Universitario values (11, 313, 134);
insert into Universitario values (12, 428, 135);
insert into Universitario values (12, 122, 136);
insert into Universitario values (12, 120, 137);
insert into Universitario values (12, 217, 138);
insert into Universitario values (12, 313, 139);
insert into Universitario values (12, 400, 140);
insert into Universitario values (12, 328, 141);
insert into Universitario values (12, 227, 142);
insert into Universitario values (12, 500, 143);
insert into Universitario values (12, 325, 144);
insert into Universitario values (13, 306, 145);
insert into Universitario values (13, 101, 146);
insert into Universitario values (13, 120, 147);
insert into Universitario values (13, 514, 148);
insert into Universitario values (13, 222, 149);
insert into Universitario values (13, 329, 150);
insert into Universitario values (13, 517, 151);
insert into Universitario values (13, 203, 152);
insert into Universitario values (13, 426, 153);
insert into Universitario values (13, 228, 154);
insert into Universitario values (14, 401, 155);
insert into Universitario values (14, 312, 156);
insert into Universitario values (14, 515, 157);
insert into Universitario values (14, 408, 158);
insert into Universitario values (14, 101, 159);
insert into Universitario values (14, 502, 160);
insert into Universitario values (14, 217, 161);
insert into Universitario values (14, 423, 162);
insert into Universitario values (14, 205, 163);
insert into Universitario values (14, 508, 164);
insert into Universitario values (15, 209, 165);
insert into Universitario values (15, 228, 166);
insert into Universitario values (15, 321, 167);
insert into Universitario values (15, 229, 168);
insert into Universitario values (15, 306, 169);
insert into Universitario values (15, 512, 170);
insert into Universitario values (15, 407, 171);
insert into Universitario values (15, 502, 172);
insert into Universitario values (15, 121, 173);
insert into Universitario values (15, 528, 174);
insert into Universitario values (16, 325, 175);
insert into Universitario values (16, 521, 176);
insert into Universitario values (16, 418, 177);
insert into Universitario values (16, 426, 178);
insert into Universitario values (16, 511, 179);
insert into Universitario values (16, 100, 180);
insert into Universitario values (16, 403, 181);
insert into Universitario values (16, 513, 182);
insert into Universitario values (16, 514, 183);
insert into Universitario values (16, 214, 184);

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

alter table Modulo add constraint EQU_Modul_Corso
	 foreign key (Codice_Corso)
     references Corso(Codice);

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
     foreign key (Codice_Corso, Cod_Mat_Anno, Codice_Modulo)
     references Modulo(Codice_Corso, Cod_Mat_Anno, Codice);

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
     foreign key (Codice_Corso, Cod_Mat_Anno, Codice_Modulo)
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
     on Modulo (Codice_Materia, Cod_Mat_Anno, Codice);

create index REF_Modul_Profe_IND
     on Modulo (Matricola_Tit);

create unique index ID_Notifica_IND
     on Notifica (Codice);

create index REF_Notif_Siste_IND
     on Notifica (Matricola);

create unique index SID_Orario_1_IND
     on Orario (Codice_Corso, Cod_Mat_Anno, Codice_Modulo, Orario_inizio);

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
     on Piano_Didattico (Anno, Codice_Corso, Matricola);

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

