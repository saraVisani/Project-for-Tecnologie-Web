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

create database Uniflow;


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
     Nome char(1) not null,
     Colore varchar(10) not null,
     constraint ID_Ambito_ID primary key (Nome));

create table Cambiare_Orario (
     Codice_Orario numeric(10) not null,
     Codice_Ric numeric(10) not null,
     Nuovo_Inizio date,
     Nuovo_Fine date,
     Codice_Luogo numeric(10),
     constraint ID_Cambiare_Orario_ID primary key (Codice_Orario, Codice_Ric));

create table Canale (
     Cod_Forum numeric(1) not null,
     Codice numeric(10) not null,
     Nome varchar(30) not null,
     Grado numeric(1) not null,
     Visualizzare char not null,
     Visualizzare_Tutti char not null,
     constraint ID_Canale_ID primary key (Cod_Forum, Codice));

create table Citta (
     Codice_Prov varchar(5) not null,
     Codice varchar(5) not null,
     Nome varchar(30) not null,
     constraint ID_Citta_ID primary key (Codice_Prov, Codice));

create table Classe (
     Codice_Uni numeric(10) not null,
     Codice_Stanza numeric(4,3) not null,
     Lab char not null,
     constraint ID_Class_Unive_ID primary key (Codice_Uni, Codice_Stanza));

create table Collaboratore (
     Codice_Evento numeric(10) not null,
     CF varchar(16) not null,
     constraint ID_Collaboratore_ID primary key (Codice_Evento, CF));

create table Composto_Da (
     Codice_PianoDid numeric(10) not null,
     Cod_Mat_Anno numeric(10) not null,
     Superato char not null,
     constraint ID_Composto_Da_ID primary key (Cod_Mat_Anno, Codice_PianoDid));

create table Corso (
     Codice numeric(10) not null,
     Nome varchar(30) not null,
     Descrizione varchar(510) not null,
     Colore varchar(10) not null,
     Ambito char(1) not null,
     constraint ID_Corso_ID primary key (Codice));

create table Elemento (
     Codice numeric(10) not null,
     Nome varchar(20) not null,
     Voto numeric(10) not null,
     Cod_Unico_Thread varchar(10),
     Cod_Unico_Messaggio varchar(10),
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
     Inizio date not null,
     Fine date not null,
     Posti numeric(6) not null,
     Descrizione varchar(510) not null,
     CF varchar(16) not null,
     constraint ID_Evento_ID primary key (Codice));

create table Formato_Da (
     Codice_Mat numeric(10) not null,
     Codice_Corso numeric(10) not null,
     Obbligatorio char not null,
     Grado numeric(1) not null,
     Periodo numeric(1) not null,
     CFU numeric(2) not null,
     constraint ID_Formato_Da_ID primary key (Codice_Mat, Codice_Corso));

create table Forum (
     Codice numeric(1) not null,
     Nome varchar(30) not null,
     constraint ID_Forum_ID primary key (Codice));

create table Immagine (
     Path varchar(255) not null,
     Descrizione varchar(510),
     constraint ID_Immagine_ID primary key (Path));

create table Indirizzo (
     Codice_Prov varchar(5) not null,
     Codice_Citta varchar(5) not null,
     N_Civico numeric(6) not null,
     Via varchar(30) not null,
     Nome varchar(30) not null,
     constraint ID_Indirizzo_ID primary key (Codice_Prov, Codice_Citta, N_Civico));

create table Inoltrare_Messaggio (
     Cod_Unico varchar(10) not null,
     Path varchar(255) not null,
     constraint ID_Inoltrare_Messaggio_ID primary key (Path, Cod_Unico));

create table Inoltrare_Thread (
     Cod_Unico varchar(10) not null,
     Path varchar(255) not null,
     constraint ID_Inoltrare_Thread_ID primary key (Cod_Unico, Path));

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
     Anno date not null,
     constraint SID_Materia_Anno_ID unique (Codice_Mat, Anno),
     constraint ID_Materia_Anno_ID primary key (Cod_Mat_Anno));

create table Messaggio (
     Cod_Unico varchar(10) not null,
     Codice numeric(10) not null,
     Cod_Unico_Thread varchar(10) not null,
     Testo varchar(60000) not null,
     Data date not null,
     Likes numeric(10) not null,
     Dislike numeric(10) not null,
     Pin char not null,
     Pin_Speciale char not null,
     Messaggio_Puntato varchar(10),
     Matricola numeric(10) not null,
     constraint ID_Messaggio_ID primary key (Cod_Unico),
     constraint SID_Messaggio_ID unique (Cod_Unico_Thread, Codice));

create table Modulo (
     Cod_Mat_Anno numeric(10) not null,
     Codice numeric(10) not null,
     Inizio_Modulo date not null,
     Fine_Modulo date not null,
     Descrizione varchar(510) not null,
     Matricola_Tit numeric(10) not null,
     constraint ID_Modulo_ID primary key (Cod_Mat_Anno, Codice));

create table Notifica (
     Codice numeric(10) not null,
     Descizione varchar(510) not null,
     Chiusa char not null,
     Matricola numeric(10) not null,
     constraint ID_Notifica_ID primary key (Codice));

create table Orario (
     Codice numeric(10) not null,
     Cod_Mat_Anno numeric(10) not null,
     Codice_Modulo numeric(10) not null,
     Orario_inizio date not null,
     Codice_Uni numeric(10) not null,
     Codice_Stanza numeric(4,3) not null,
     Orario_fine date not null,
     constraint SID_Orario_1_ID unique (Cod_Mat_Anno, Codice_Modulo, Orario_inizio),
     constraint SID_Orario_ID unique (Codice_Uni, Codice_Stanza, Orario_inizio),
     constraint ID_Orario_ID primary key (Codice));

create table Orario_Evento (
     Codice numeric(10) not null,
     Codice_Evento numeric(10) not null,
     Inizio date not null,
     Cod_Luogo numeric(10) not null,
     Fine date not null,
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
     Anno date not null,
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
     Online char not null,
     Data_Inizio date not null,
     Data_Fine date not null,
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
     Data_Inizio date,
     Data_Fine date,
     Codice_Orario numeric(10),
     Cod_Mat_Anno numeric(10),
     Codice_Modulo numeric(10),
     Codice_Uni numeric(10),
     Codice_Stanza numeric(4,3),
     Matricola numeric(10) not null,
     constraint ID_Richiesta_Orario_ID primary key (Codice));

create table Richiesta_Ricevimento (
     Codice numeric(10) not null,
     Inserimento char not null,
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
     Cod_Unico varchar(10) not null,
     Cod_Forum numeric(1) not null,
     Cod_Canale numeric(10) not null,
     Codice numeric(10) not null,
     Titolo varchar(20) not null,
     Testo varchar(60000) not null,
     Data date not null,
     Likes numeric(10) not null,
     Dislike numeric(10) not null,
     Pin char not null,
     Chiuso char not null,
     No_Reply char not null,
     Thread_Puntato varchar(10),
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


-- Constraints Section
-- ___________________ 

alter table Agg_Collaboratore add constraint REF_Agg_C_Perso_FK
     foreign key (CF)
     references Persona;

alter table Agg_Collaboratore add constraint REF_Agg_C_Richi
     foreign key (Codice_Richiesta)
     references Richiesta_Evento;

alter table Agg_Promotore add constraint REF_Agg_P_Richi_FK
     foreign key (Codice_Richiesta)
     references Richiesta_Evento;

alter table Agg_Promotore add constraint REF_Agg_P_Promo
     foreign key (Codice_Promotore)
     references Promotore;

alter table Cambiare_Orario add constraint REF_Cambi_Luogo_FK
     foreign key (Codice_Luogo)
     references Luogo;

alter table Cambiare_Orario add constraint REF_Cambi_Richi_FK
     foreign key (Codice_Ric)
     references Richiesta_Evento;

alter table Cambiare_Orario add constraint REF_Cambi_Orari
     foreign key (Codice_Orario)
     references Orario_Evento;

alter table Canale add constraint REF_Canal_Forum
     foreign key (Cod_Forum)
     references Forum;

alter table Citta add constraint REF_Citta_Provi
     foreign key (Codice_Prov)
     references Provincia;

alter table Classe add constraint ID_Class_Unive_FK
     foreign key (Codice_Uni, Codice_Stanza)
     references Universitario;

alter table Collaboratore add constraint REF_Colla_Perso_FK
     foreign key (CF)
     references Persona;

alter table Collaboratore add constraint REF_Colla_Event
     foreign key (Codice_Evento)
     references Evento;

alter table Composto_Da add constraint REF_Compo_Mater
     foreign key (Cod_Mat_Anno)
     references Materia_Anno;

alter table Composto_Da add constraint REF_Compo_Piano_FK
     foreign key (Codice_PianoDid)
     references Piano_Didattico;

alter table Corso add constraint ID_Corso_CHK
     check(exists(select * from Seguito_In
                  where Seguito_In.Codice_Corso = Codice)); 

alter table Corso add constraint REF_Corso_Ambit_FK
     foreign key (Ambito)
     references Ambito;

alter table Elemento add constraint REF_Eleme_Threa_FK
     foreign key (Cod_Unico_Thread)
     references Thread;

alter table Elemento add constraint REF_Eleme_Messa_FK
     foreign key (Cod_Unico_Messaggio)
     references Messaggio;

alter table Elemento add constraint EXTONE_Elemento
     check((Cod_Unico_Thread is not null and Cod_Unico_Messaggio is null)
           or (Cod_Unico_Thread is null and Cod_Unico_Messaggio is not null)); 

alter table Elim_Collaboratore add constraint REF_Elim__Perso_FK
     foreign key (CF)
     references Persona;

alter table Elim_Collaboratore add constraint REF_Elim__Richi_1
     foreign key (Codice_Richiesta)
     references Richiesta_Evento;

alter table Elim_Promotore add constraint REF_Elim__Richi_FK
     foreign key (Codice_Richiesta)
     references Richiesta_Evento;

alter table Elim_Promotore add constraint REF_Elim__Promo
     foreign key (Codice_Promotore)
     references Promotore;

alter table Esterno add constraint SID_Ester_Indir_FK
     foreign key (Codice_Prov, Codice_Citta, N_Civico)
     references Indirizzo;

alter table Esterno add constraint SID_Ester_Luogo_FK
     foreign key (Cod_Luogo)
     references Luogo;

alter table Evento add constraint ID_Evento_CHK
     check(exists(select * from Propongono
                  where Propongono.Codice_Evento = Codice)); 

alter table Evento add constraint REF_Event_Perso_FK
     foreign key (CF)
     references Persona;

alter table Formato_Da add constraint REF_Forma_Corso_FK
     foreign key (Codice_Corso)
     references Corso;

alter table Formato_Da add constraint REF_Forma_Mater
     foreign key (Codice_Mat)
     references Materia;

alter table Indirizzo add constraint REF_Indir_Citta
     foreign key (Codice_Prov, Codice_Citta)
     references Citta;

alter table Inoltrare_Messaggio add constraint REF_Inolt_Immag_1
     foreign key (Path)
     references Immagine;

alter table Inoltrare_Messaggio add constraint REF_Inolt_Messa_FK
     foreign key (Cod_Unico)
     references Messaggio;

alter table Inoltrare_Thread add constraint REF_Inolt_Immag_FK
     foreign key (Path)
     references Immagine;

alter table Inoltrare_Thread add constraint REF_Inolt_Threa
     foreign key (Cod_Unico)
     references Thread;

alter table Insegna add constraint REF_Inseg_Profe_FK
     foreign key (Matricola)
     references Professore;

alter table Insegna add constraint REF_Inseg_Mater
     foreign key (Cod_Mat_Anno)
     references Materia_Anno;

alter table Materia add constraint REF_Mater_Sede_FK
     foreign key (Codice_Uni)
     references Sede;

alter table Materia_Anno add constraint REF_Mater_Mater
     foreign key (Codice_Mat)
     references Materia;

alter table Materia_Anno add constraint ID_Materia_Anno_CHK
     check(exists(select * from Modulo
                  where Modulo.Cod_Mat_Anno = Cod_Mat_Anno)); 

alter table Messaggio add constraint REF_Messa_Threa
     foreign key (Cod_Unico_Thread)
     references Thread;

alter table Messaggio add constraint REF_Messa_Messa_FK
     foreign key (Messaggio_Puntato)
     references Messaggio;

alter table Messaggio add constraint REF_Messa_Siste_FK
     foreign key (Matricola)
     references Sistema_Universitario;

alter table Modulo add constraint EQU_Modul_Mater
     foreign key (Cod_Mat_Anno)
     references Materia_Anno;

alter table Modulo add constraint REF_Modul_Profe_FK
     foreign key (Matricola_Tit)
     references Professore;

alter table Notifica add constraint REF_Notif_Siste_FK
     foreign key (Matricola)
     references Sistema_Universitario;

alter table Orario add constraint REF_Orari_Modul
     foreign key (Cod_Mat_Anno, Codice_Modulo)
     references Modulo;

alter table Orario add constraint REF_Orari_Class
     foreign key (Codice_Uni, Codice_Stanza)
     references Classe;

alter table Orario_Evento add constraint REF_Orari_Luogo
     foreign key (Cod_Luogo)
     references Luogo;

alter table Orario_Evento add constraint REF_Orari_Event
     foreign key (Codice_Evento)
     references Evento;

alter table Piano_Didattico add constraint REF_Piano_Corso_FK
     foreign key (Codice_Corso)
     references Corso;

alter table Piano_Didattico add constraint SID_Piano_Stude_FK
     foreign key (Matricola)
     references Studente;

alter table Professore add constraint ID_Profe_Siste_FK
     foreign key (Matricola)
     references Sistema_Universitario;

alter table Propongono add constraint REF_Propo_Promo_FK
     foreign key (Codice)
     references Promotore;

alter table Propongono add constraint EQU_Propo_Event
     foreign key (Codice_Evento)
     references Evento;

alter table Rappresentano add constraint REF_Rappr_Perso_FK
     foreign key (CF)
     references Persona;

alter table Rappresentano add constraint REF_Rappr_Promo
     foreign key (Codice_Promotore)
     references Promotore;

alter table Ricevimento add constraint REF_Ricev_Uffic_FK
     foreign key (Codice_Uni, Codice_Stanza)
     references Ufficio;

alter table Ricevimento add constraint REF_Ricev_Uffic_CHK
     check((Codice_Uni is not null and Codice_Stanza is not null)
           or (Codice_Uni is null and Codice_Stanza is null)); 

alter table Ricevimento add constraint REF_Ricev_Profe_FK
     foreign key (Matricola)
     references Professore;

alter table Richiesta_Evento add constraint REF_Richi_Event_FK
     foreign key (Codice_Evento)
     references Evento;

alter table Richiesta_Evento add constraint REF_Richi_Perso_1_FK
     foreign key (Rappresentante)
     references Persona;

alter table Richiesta_Evento add constraint REF_Richi_Perso_FK
     foreign key (Richiedente)
     references Persona;

alter table Richiesta_Evento add constraint REF_Richi_Promo_FK
     foreign key (Richiedente_Inserimento)
     references Promotore;

alter table Richiesta_Orario add constraint REF_Richi_Orari_FK
     foreign key (Codice_Orario)
     references Orario;

alter table Richiesta_Orario add constraint REF_Richi_Modul_FK
     foreign key (Cod_Mat_Anno, Codice_Modulo)
     references Modulo;

alter table Richiesta_Orario add constraint REF_Richi_Modul_CHK
     check((Cod_Mat_Anno is not null and Codice_Modulo is not null)
           or (Cod_Mat_Anno is null and Codice_Modulo is null)); 

alter table Richiesta_Orario add constraint REF_Richi_Class_FK
     foreign key (Codice_Uni, Codice_Stanza)
     references Classe;

alter table Richiesta_Orario add constraint REF_Richi_Class_CHK
     check((Codice_Uni is not null and Codice_Stanza is not null)
           or (Codice_Uni is null and Codice_Stanza is null)); 

alter table Richiesta_Orario add constraint REF_Richi_Profe_FK
     foreign key (Matricola)
     references Professore;

alter table Richiesta_Ricevimento add constraint REF_Richi_Stude_FK
     foreign key (Matricola)
     references Studente;

alter table Richiesta_Ricevimento add constraint REF_Richi_Slot_FK
     foreign key (Codice_Ric, N_Slot)
     references Slot;

alter table Richiesta_Ricevimento add constraint REF_Richi_Slot_CHK
     check((Codice_Ric is not null and N_Slot is not null)
           or (Codice_Ric is null and N_Slot is null)); 

alter table Richiesta_Ricevimento add constraint REF_Richi_Ricev_FK
     foreign key (Ricevimento)
     references Ricevimento;

alter table Sede add constraint SID_Sede_Indir_FK
     foreign key (Codice_Prov, Codice_Citta, N_Civico)
     references Indirizzo;

alter table Segna add constraint REF_Segna_Perso_FK
     foreign key (CF)
     references Persona;

alter table Segna add constraint REF_Segna_Event
     foreign key (Codice_Evento)
     references Evento;

alter table Segreteria add constraint ID_Segre_Siste_FK
     foreign key (Matricola)
     references Sistema_Universitario;

alter table Segreteria add constraint REF_Segre_Sede_FK
     foreign key (Codice_Uni)
     references Sede;

alter table Seguito_In add constraint REF_Segui_Sede
     foreign key (Codice_Uni)
     references Sede;

alter table Seguito_In add constraint EQU_Segui_Corso_FK
     foreign key (Codice_Corso)
     references Corso;

alter table Sistema_Universitario add constraint REF_Siste_Perso_FK
     foreign key (CF)
     references Persona;

alter table Slot add constraint REF_Slot_Ricev
     foreign key (Codice_Ric)
     references Ricevimento;

alter table Slot add constraint REF_Slot_Stude_FK
     foreign key (Matricola)
     references Studente;

alter table Studente add constraint ID_Stude_Siste_CHK
     check(exists(select * from Piano_Didattico
                  where Piano_Didattico.Matricola = Matricola)); 

alter table Studente add constraint ID_Stude_Siste_FK
     foreign key (Matricola)
     references Sistema_Universitario;

alter table Thread add constraint REF_Threa_Canal
     foreign key (Cod_Forum, Cod_Canale)
     references Canale;

alter table Thread add constraint REF_Threa_Threa_FK
     foreign key (Thread_Puntato)
     references Thread;

alter table Thread add constraint REF_Threa_Siste_FK
     foreign key (Matricola)
     references Sistema_Universitario;

alter table Tutor add constraint REF_Tutor_Stude_FK
     foreign key (Matricola)
     references Studente;

alter table Tutor add constraint REF_Tutor_Mater
     foreign key (Cod_Mat_Anno)
     references Materia_Anno;

alter table Ufficio add constraint ID_Uffic_Unive_FK
     foreign key (Codice_Uni, Codice_Stanza)
     references Universitario;

alter table Ufficio add constraint REF_Uffic_Profe_FK
     foreign key (Matricola)
     references Professore;

alter table Universitario add constraint REF_Unive_Sede
     foreign key (Codice_Uni)
     references Sede;

alter table Universitario add constraint SID_Unive_Luogo_FK
     foreign key (Cod_Luogo)
     references Luogo;


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
     on Immagine (Path);

create unique index ID_Indirizzo_IND
     on Indirizzo (Codice_Prov, Codice_Citta, N_Civico);

create unique index ID_Inoltrare_Messaggio_IND
     on Inoltrare_Messaggio (Path, Cod_Unico);

create index REF_Inolt_Messa_IND
     on Inoltrare_Messaggio (Cod_Unico);

create unique index ID_Inoltrare_Thread_IND
     on Inoltrare_Thread (Cod_Unico, Path);

create index REF_Inolt_Immag_IND
     on Inoltrare_Thread (Path);

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

