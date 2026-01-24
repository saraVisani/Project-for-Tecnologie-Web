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
     Codice_Stanza numeric(3) not null,
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
# Add info into "Composto_Da"                                            #
# ---------------------------------------------------------------------- #

truncate table Composto_Da;

insert into Composto_Da values (0, 8, 0);
insert into Composto_Da values (0, 9, 1);
insert into Composto_Da values (0, 30, 0);
insert into Composto_Da values (0, 31, 1);
insert into Composto_Da values (0, 39, 0);
insert into Composto_Da values (0, 40, 1);
insert into Composto_Da values (4, 244, 1);
insert into Composto_Da values (6, 263, 0);
insert into Composto_Da values (6, 264, 1);
insert into Composto_Da values (8, 69, 1);
insert into Composto_Da values (10, 74, 1);
insert into Composto_Da values (11, 63, 0);
insert into Composto_Da values (11, 64, 0);
insert into Composto_Da values (12, 286, 1);
insert into Composto_Da values (18, 83, 1);
insert into Composto_Da values (18, 89, 0);
insert into Composto_Da values (18, 90, 1);
insert into Composto_Da values (18, 139, 1);
insert into Composto_Da values (21, 12, 1);
insert into Composto_Da values (21, 34, 0);
insert into Composto_Da values (22, 10, 1);
insert into Composto_Da values (22, 32, 1);
insert into Composto_Da values (22, 41, 1);
insert into Composto_Da values (23, 262, 1);
insert into Composto_Da values (25, 117, 0);
insert into Composto_Da values (25, 118, 1);
insert into Composto_Da values (25, 194, 0);
insert into Composto_Da values (25, 195, 1);
insert into Composto_Da values (26, 235, 0);
insert into Composto_Da values (26, 236, 1);
insert into Composto_Da values (27, 271, 1);
insert into Composto_Da values (28, 242, 0);
insert into Composto_Da values (28, 243, 1);
insert into Composto_Da values (30, 249, 1);
insert into Composto_Da values (31, 8, 0);
insert into Composto_Da values (31, 9, 1);
insert into Composto_Da values (31, 30, 1);
insert into Composto_Da values (31, 39, 1);
insert into Composto_Da values (34, 79, 0);
insert into Composto_Da values (34, 80, 1);
insert into Composto_Da values (34, 85, 1);
insert into Composto_Da values (34, 130, 1);
insert into Composto_Da values (34, 135, 0);
insert into Composto_Da values (34, 136, 1);
insert into Composto_Da values (36, 74, 0);
insert into Composto_Da values (36, 75, 1);
insert into Composto_Da values (37, 461, 1);
insert into Composto_Da values (39, 23, 1);
insert into Composto_Da values (39, 29, 1);
insert into Composto_Da values (41, 74, 0);
insert into Composto_Da values (41, 75, 0);
insert into Composto_Da values (42, 5, 1);
insert into Composto_Da values (42, 13, 1);
insert into Composto_Da values (42, 18, 0);
insert into Composto_Da values (42, 19, 1);
insert into Composto_Da values (42, 47, 0);
insert into Composto_Da values (42, 48, 0);
insert into Composto_Da values (43, 270, 0);
insert into Composto_Da values (43, 271, 0);
insert into Composto_Da values (46, 277, 0);
insert into Composto_Da values (46, 278, 0);
insert into Composto_Da values (48, 64, 0);
insert into Composto_Da values (48, 65, 1);

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
# Add info into "Formato_Da"                                             #
# ---------------------------------------------------------------------- #

truncate table Formato_Da;

insert into Formato_Da values (1001,"ECO01",1,3,1,12);
insert into Formato_Da values (1001,"ECO02",0,2,2,6);
insert into Formato_Da values (1002,"ECO01",1,4,1,12);
insert into Formato_Da values (1002,"ECO03",0,2,2,6);
insert into Formato_Da values (1003,"ECO01",1,2,1,6);
insert into Formato_Da values (1003,"ECO02",0,3,2,12);
insert into Formato_Da values (1004,"TUR01",1,3,1,12);
insert into Formato_Da values (1004,"ECO02",0,2,2,6);
insert into Formato_Da values (1005,"TUR01",1,2,1,6);
insert into Formato_Da values (1005,"ECO03",0,3,2,12);
insert into Formato_Da values (1006,"ECO03",1,5,1,12);
insert into Formato_Da values (1007,"ECO01",1,3,2,6);
insert into Formato_Da values (1008,"MAT01",1,2,1,12);
insert into Formato_Da values (1009,"FIS01",1,2,1,12);
insert into Formato_Da values (1010,"CHI01",1,1,1,6);
insert into Formato_Da values (1011,"BIO01",1,2,2,12);
insert into Formato_Da values (1012,"ING01",0,3,1,6);
insert into Formato_Da values (1013,"ING01",0,2,2,12);
insert into Formato_Da values (1014,"ING02",0,4,1,6);
insert into Formato_Da values (1015,"MAT01",1,3,2,12);
insert into Formato_Da values (1016,"FIS01",0,4,2,12);
insert into Formato_Da values (1017,"ING_INF01",1,3,1,12);
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
insert into Formato_Da values (1029,"BASI_DATI01",1,5,1,12);
insert into Formato_Da values (1030,"BASI_DATI02",0,4,2,6);
insert into Formato_Da values (1031,"ML01",1,5,1,12);
insert into Formato_Da values (1032,"ANALISI_DATI",0,5,2,6);
insert into Formato_Da values (1033,"ROB01",1,5,1,12);
insert into Formato_Da values (1034,"ARC01",1,5,1,12);
insert into Formato_Da values (1035,"DES01",1,5,1,6);
insert into Formato_Da values (1036,"URB01",1,5,1,12);
insert into Formato_Da values (1037,"ARC_CES01",0,4,2,12);
insert into Formato_Da values (1038,"ARC_CES02",0,3,1,6);
insert into Formato_Da values (1039,"DES_CES01",0,4,2,12);
insert into Formato_Da values (1040,"URB_CES01",0,3,1,12);
insert into Formato_Da values (1041,"TEC_CES01",0,4,2,12);
insert into Formato_Da values (1042,"MICRO01",1,1,1,12);
insert into Formato_Da values (1043,"MACRO01",1,2,1,6);
insert into Formato_Da values (1044,"GESTAZ01",1,3,1,12);
insert into Formato_Da values (1045,"TUR_SOS01",1,2,1,6);
insert into Formato_Da values (1046,"MARK_TUR01",1,3,2,12);
insert into Formato_Da values (1047,"FINAZ01",1,5,1,12);
insert into Formato_Da values (1048,"MICRO02",0,2,2,6);
insert into Formato_Da values (1049,"ANALISI01",1,4,1,12);
insert into Formato_Da values (1050,"FIS02",0,3,2,12);
insert into Formato_Da values (1051,"CHI02",1,1,2,12);
insert into Formato_Da values (1052,"BIO02",0,2,1,12);
insert into Formato_Da values (1053,"OTT01",0,3,2,12);
insert into Formato_Da values (1054,"GESTIND01",0,4,1,6);
insert into Formato_Da values (1055,"PROGET01",0,3,2,12);
insert into Formato_Da values (1056,"ANALISI02",1,2,1,12);
insert into Formato_Da values (1057,"FIS03",0,4,2,12);
insert into Formato_Da values (1058,"PROGBASE01",1,3,1,12);
insert into Formato_Da values (1059,"INF01",1,2,2,12);
insert into Formato_Da values (1060,"MED01",1,5,1,12);
insert into Formato_Da values (1061,"ARC03",0,4,2,12);
insert into Formato_Da values (1062,"PROGAV01",0,3,1,12);
insert into Formato_Da values (1063,"BASI_DATI03",0,4,2,12);
insert into Formato_Da values (1064,"ML02",0,5,1,12);
insert into Formato_Da values (1065,"ANALISI_DATI02",0,4,2,12);
insert into Formato_Da values (1066,"PSI01",1,3,1,12);
insert into Formato_Da values (1066,"SOC01",0,2,2,12);

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

