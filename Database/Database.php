<?php

class DatabaseHelper
{
    private $db;

    public function __construct($servername, $username, $password, $dbname, $port)
    {
        $this->db = new mysqli($servername, $username, $password, $dbname, $port);
        if ($this->db->connect_error) {
            die("Connection failed");
        }
    }

    // Funzione privata per ottenere la matricola reale a partire da email o matricola
    private function resolveUserId($idUtente)
    {
        // Se è già numerico, lo consideriamo matricola
        if (is_numeric($idUtente)) {
            return (int)$idUtente;
        }

        // Altrimenti consideriamo che sia l'email universitaria
        $stmt = $this->db->prepare("SELECT Matricola FROM Sistema_Universitario WHERE Email_Uni = ?");
        $stmt->bind_param("s", $idUtente);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        $stmt->close();

        return $row ? (int)$row['Matricola'] : null; // ritorna null se non trovato
    }

    private function buildDateRangeWhere(string $range, $date, string $field = "data"): string
    {
        switch ($range) {
            case "day":
                return "$field >= '$date 00:00:00'
                        AND $field <= '$date 23:59:59'";

            case "week":
                return "$field >= '$date'
                        AND $field < DATE_ADD('$date', INTERVAL 7 DAY)";

            case "month":
                return "$field >= '$date'
                        AND $field < DATE_ADD('$date', INTERVAL 1 MONTH)";

            default:
                return "$field >= CURDATE()
                        AND $field < DATE_ADD(CURDATE(), INTERVAL 7 DAY)";
        }
    }

    private function baseReunionQuery(): string
    {
        return "
            SELECT
                R.Data_Inizio,
                R.Data_Fine,
                R.Online,
                P.Nome        AS nome_prof,
                P.Cognome     AS cognome_prof,
                R.Codice_Stanza AS codice_ufficio,
                L.Nome          AS nome_ufficio,
                Sd.Nome         AS nome_sede
            FROM Ricevimento R
            JOIN Sistema_Universitario SU
                ON SU.Matricola = R.Matricola
            JOIN Persona P
                ON P.CF = SU.CF
            LEFT JOIN Universitario UN
                ON UN.Codice_Uni = R.Codice_Uni
                AND UN.Codice = R.Codice_Stanza
            LEFT JOIN Luogo L
                ON L.Codice = UN.Cod_Luogo
            LEFT JOIN Sede Sd
                ON Sd.Codice = L.Codice
        ";
    }

    private function getCFfromMat($mt){
        $query = "
            SELECT CF
            FROM Sistema_Universitario
            WHERE Matricola = ?
            LIMIT 1
        ";

        $stmt = $this->db->prepare($query);
        $stmt->bind_param("i", $mt);
        $stmt->execute();

        $result = $stmt->get_result();
        $row = $result->fetch_assoc();

        $stmt->close();

        return $row ? $row["CF"] : null;
    }

    public function usernameOk($username)
    {
        // ottieni la matricola (da email o direttamente)
        $matricola = $this->resolveUserId($username);

        // se resolveUserId ha dato null, l'utente non esiste
        if ($matricola === null) {
            return false;
        }

        // controllo esplicito che la matricola esista nel DB
        $stmt = $this->db->prepare("SELECT Matricola FROM Sistema_Universitario WHERE Matricola = ?");
        $stmt->bind_param("i", $matricola);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        $stmt->close();

        return !empty($row); // true se esiste
    }

    public function passwordOk($username, $password){
        $mt = $this->resolveUserId($username);
        if ($mt === null ) {
            return false;
        }

        $query = "SELECT Password
                    FROM Sistema_Universitario
                    WHERE Matricola = ? AND Password = ?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("is", $mt, $password);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        $stmt->close();

        return !empty($row);
    }

    public function accessLevelOk($username, $level){
        $mt = $this->resolveUserId($username);
        if ($mt === null) {
            return false;
        }

        $query = "SELECT Livello_Permesso
                    FROM Sistema_Universitario, Persona
                    WHERE Matricola = ?
                    AND Persona.Livello_Permesso >= ?
                    AND Sistema_Universitario.CF = Persona.CF";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("ii", $mt, $level);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        $stmt->close();

        return !empty($row);
    }

    public function getLevelAccess($username){
        $mt = $this->resolveUserId($username);
        if ($mt === null) {
            return false;
        }

        $query = "SELECT Persona.Livello_Permesso
                FROM Sistema_Universitario
                JOIN Persona ON Sistema_Universitario.CF = Persona.CF
                WHERE Matricola = ?";

        $stmt = $this->db->prepare($query);
        $stmt->bind_param("i", $mt);
        $stmt->execute();

        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        $stmt->close();

        return $row ? (int)$row['Livello_Permesso'] : false;
    }

    public function getUserJob($username){
        $mt = $this->resolveUserId($username);
        if ($mt === null) {
            return false;
        }

        // Studente
        $stmt = $this->db->prepare("SELECT Matricola FROM Studente WHERE Matricola = ?");
        $stmt->bind_param("i", $mt);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($result->num_rows > 0) {
            $stmt->close();
            return 'studente';
        }
        $stmt->close();

        // Professore
        $stmt = $this->db->prepare("SELECT Matricola FROM Professore WHERE Matricola = ?");
        $stmt->bind_param("i", $mt);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($result->num_rows > 0) {
            $stmt->close();
            return 'professore';
        }
        $stmt->close();

        // Segreteria
        $stmt = $this->db->prepare("SELECT Matricola FROM Segreteria WHERE Matricola = ?");
        $stmt->bind_param("i", $mt);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($result->num_rows > 0) {
            $stmt->close();
            return 'segreteria';
        }
        $stmt->close();

        return false; // non trovato
    }

    public function getMostRecentPublicEvents($number = 3)
    {
        $sql = "SELECT Nome AS titolo, Inizio AS data, Descrizione AS descrizione
                FROM evento
                WHERE pubblico = 1
                ORDER BY Inizio DESC
                LIMIT ?";
        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("i", $number);
        $stmt->execute();
        $result = $stmt->get_result();
        $events = $result->fetch_all(MYSQLI_ASSOC);
        $stmt->close();
        return $events;
    }

    public function getMostPopularFAQsByLevel($number = 3, $Forum = 2, $Grado = 0)
    {
        $sql = "SELECT t.Titolo AS domanda
                FROM Thread t
                INNER JOIN Canale c
                    ON t.Cod_Forum = c.Cod_Forum AND t.Cod_Canale = c.Codice
                WHERE t.Cod_Forum = ? AND c.Grado = ?
                ORDER BY t.Likes DESC
                LIMIT ?";
        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("iii", $Forum, $Grado, $number);
        $stmt->execute();
        $result = $stmt->get_result();
        $faqs = $result->fetch_all(MYSQLI_ASSOC);
        $stmt->close();
        return $faqs;
    }

    public function getAllCampuses()
    {
        $sql = "SELECT sede.Nome as nome, sede.Codice_Prov, sede.Codice_Citta, sede.N_Civico, indirizzo.Via, indirizzo.Nome as nome_indirizzo, sede.descrizione
                FROM sede, indirizzo
                WHERE sede.Codice_Prov = indirizzo.Codice_Prov
                    AND sede.Codice_Citta = indirizzo.Codice_Citta
                    AND sede.N_Civico = indirizzo.N_Civico";
        $result = $this->db->query($sql);
        $campuses = $result->fetch_all(MYSQLI_ASSOC);
        return $campuses;
    }

    public function getTimesStudent($idUtente, $range, $date)
    {
        $cf = $this->resolveUserId($idUtente);
        if ($cf === null) {
            return []; // nessun evento se utente non trovato
        }
        $when = $this->buildDateRangeWhere($range, $date, "O.Orario_inizio");

        $sql = "SELECT
                O.Orario_inizio,
                O.Orario_fine,

                M.Nome              AS nome_materia,
                MO.Descrizione      AS nome_modulo,

                MO.Matricola_Tit    AS prof_titolare,

                C.Codice_Stanza     AS codice_aula,
                L.Nome              AS nome_aula,
                C.Lab               AS laboratorio,

                S.Nome              AS nome_sede
            FROM Orario O

            -- Filtra lezioni dello studente
            JOIN Composto_Da CD
                ON CD.Cod_Mat_Anno = O.Cod_Mat_Anno
            JOIN Piano_Didattico PD
                ON PD.Codice_PianoDid = CD.Codice_PianoDid
                AND PD.Matricola = ?

            -- Modulo / Materia
            JOIN Modulo MO
                ON MO.Codice_Corso = O.Codice_Corso
                AND MO.Cod_Mat_Anno = O.Cod_Mat_Anno
                AND MO.Codice = O.Codice_Modulo

            JOIN Materia_Anno MA
                ON MA.Cod_Mat_Anno = MO.Cod_Mat_Anno
            JOIN Materia M
                ON M.Codice = MA.Codice_Mat

            -- Aula / sede
            JOIN Classe C
                ON C.Codice_Uni = O.Codice_Uni
                AND C.Codice_Stanza = O.Codice_Stanza

            JOIN Universitario U
                ON U.Codice_Uni = C.Codice_Uni
                AND U.Codice = C.Codice_Stanza

            JOIN Luogo L
                ON L.Codice = U.Cod_Luogo

            JOIN Sede S
                ON S.Codice = U.Codice_Uni

            WHERE $when
            ORDER BY O.Orario_inizio ASC
        ";

        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("i", $cf);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_all(MYSQLI_ASSOC);
        $stmt->close();

        return $row;
    }

    public function getReunionStudent($idUtente, $range, $date)
    {
        $matricolaStud = $this->resolveUserId($idUtente);
        if ($matricolaStud === null ) {
            return [];
        }

        $when = $this->buildDateRangeWhere($range, $date, "R.Data_Inizio");

        $sql = $this->baseReunionQuery() . "
            JOIN Slot S
                ON S.Codice_Ric = R.Codice
            WHERE S.Matricola = ?
            AND $when
            ORDER BY R.Data_Inizio ASC
        ";

        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("i", $matricolaStud);
        $stmt->execute();

        $result = $stmt->get_result();
        $rows = $result->fetch_all(MYSQLI_ASSOC);

        $stmt->close();
        return $rows;
    }


    public function getTimesProfessor($idUtente, $range, $date)
    {
        $cf = $this->resolveUserId($idUtente);
        if ($cf === null) {
            return []; // nessun evento se utente non trovato
        }
        $when = $this->buildDateRangeWhere($range, $date,"O.Orario_inizio");

        $query = "SELECT
                O.Orario_inizio,
                O.Orario_fine,

                M.Nome              AS nome_materia,
                MO.Descrizione      AS nome_modulo,

                MO.Matricola_Tit    AS prof_titolare,

                C.Codice_Stanza     AS codice_aula,
                L.Nome              AS nome_aula,
                C.Lab               AS laboratorio,

                S.Nome              AS nome_sede
            FROM Orario O

            -- filtra lezioni del professore
            JOIN Insegna I
                ON I.Cod_Mat_Anno = O.Cod_Mat_Anno
                AND I.Matricola = ?

            -- Modulo / Materia
            JOIN Modulo MO
                ON MO.Codice_Corso = O.Codice_Corso
                AND MO.Cod_Mat_Anno = O.Cod_Mat_Anno
                AND MO.Codice = O.Codice_Modulo

            JOIN Materia_Anno MA
                ON MA.Cod_Mat_Anno = MO.Cod_Mat_Anno
            JOIN Materia M
                ON M.Codice = MA.Codice_Mat

            -- Aula / sede
            JOIN Classe C
                ON C.Codice_Uni = O.Codice_Uni
                AND C.Codice_Stanza = O.Codice_Stanza

            JOIN Universitario U
                ON U.Codice_Uni = C.Codice_Uni
                AND U.Codice = C.Codice_Stanza

            JOIN Luogo L
                ON L.Codice = U.Cod_Luogo

            JOIN Sede S
                ON S.Codice = U.Codice_Uni

            WHERE $when
            ORDER BY O.Orario_inizio ASC
        ";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("i", $cf);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_all(MYSQLI_ASSOC);
        $stmt->close();

        return $row;
    }
    public function getReunionProfessor($idUtente, $range, $date)
    {
        $matricolaProf = $this->resolveUserId($idUtente);
        if ($matricolaProf === null) {
            return [];
        }

        $when = $this->buildDateRangeWhere($range, $date, "R.Data_Inizio");

        $sql = $this->baseReunionQuery() . "
            WHERE R.Matricola = ?
            AND $when
            ORDER BY R.Data_Inizio ASC
        ";

        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("i", $matricolaProf);
        $stmt->execute();

        $result = $stmt->get_result();
        $rows = $result->fetch_all(MYSQLI_ASSOC);

        $stmt->close();
        return $rows;
    }

    public function getSignInChannals($level)
    {
        $sql = "
            SELECT
                C.Cod_Forum,
                C.Codice,
                C.Nome AS nome_canale,
                C.Grado,
                C.Visualizzare,
                C.Visualizzare_Tutti,
                F.Nome AS nome_forum
            FROM Canale C
            JOIN Forum F
                ON F.Codice = C.Cod_Forum
            WHERE
                C.Grado <= ?  -- livello base
                OR (C.Grado = ? + 1 AND C.Visualizzare = 1)
                OR (C.Visualizzare_Tutti = 1)
            ORDER BY F.Nome, C.Codice
        ";

        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("ii", $level, $level);
        $stmt->execute();

        $result = $stmt->get_result();
        $rows = $result->fetch_all(MYSQLI_ASSOC);
        $stmt->close();

        // raggruppa per forum
        $grouped = [];
        foreach ($rows as $row) {
            $forumId = $row['Cod_Forum'];
            if (!isset($grouped[$forumId])) {
                $grouped[$forumId] = [
                    'Cod_Forum' => $forumId,
                    'nome_forum' => $row['nome_forum'],
                    'canali' => []
                ];
            }
            $grouped[$forumId]['canali'][] = [
                'Codice' => $row['Codice'],
                'nome_canale' => $row['nome_canale'],
                'Grado' => $row['Grado'],
                'Visualizzare' => $row['Visualizzare'],
                'Visualizzare_Tutti' => $row['Visualizzare_Tutti']
            ];
        }

        // ritorna array numerico invece che associativo
        return array_values($grouped);
    }

    public function getStaffEvents($idUtente, $range, $date)
    {
        $mt = $this->resolveUserId($idUtente);
        if ($mt === null) return [];
        $cf = $this->getCFfromMat($mt);

        $when = $this->buildDateRangeWhere($range, $date, "O.Inizio");

        $sql = "
            SELECT DISTINCT
                E.Codice,
                E.Nome,
                O.Inizio      AS orario_inizio,
                O.Fine        AS orario_fine,
                L.Nome        AS nome_luogo,
                S.Nome        AS nome_sede,

                -- ruolo dinamico
                CASE
                    WHEN E.CF = ? THEN 'promotore'
                    WHEN C.CF IS NOT NULL THEN 'collaboratore'
                    WHEN R.CF IS NOT NULL THEN 'rappresentante'
                END AS ruolo
            FROM Evento E
            JOIN Orario_Evento O
                ON O.Codice_Evento = E.Codice

            -- collaboratore
            LEFT JOIN Collaboratore C
                ON C.Codice_Evento = E.Codice
                AND C.CF = ?

            -- rappresentante di promotore
            LEFT JOIN Propongono P
                ON P.Codice_Evento = E.Codice
            LEFT JOIN Rappresentano R
                ON R.Codice_Promotore = P.Codice
                AND R.CF = ?

            -- luogo / sede
            LEFT JOIN Luogo L
                ON L.Codice = O.Cod_Luogo
            LEFT JOIN Sede S
                ON S.Codice = L.Codice

            WHERE (
                E.CF = ? OR C.CF IS NOT NULL OR R.CF IS NOT NULL
            )
            AND $when
            ORDER BY O.Inizio ASC
        ";

        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("ssss", $cf, $cf, $cf, $cf);
        $stmt->execute();

        $result = $stmt->get_result();
        $eventi = $result->fetch_all(MYSQLI_ASSOC);

        $stmt->close();
        return $eventi;
    }

    public function getSignInEvents($idUtente, $range, $date)
    {
        $mt = $this->resolveUserId($idUtente);
        if ($mt === null) return [];
        $cf = $this->getCFfromMat($mt);

        $when = $this->buildDateRangeWhere($range, $date, "O.Inizio");

        $sql = "
            SELECT
                E.Codice,
                E.Nome,
                O.Inizio      AS orario_inizio,
                O.Fine        AS orario_fine,
                L.Nome        AS nome_luogo,
                S.Nome        AS nome_sede,
                'partecipante' AS ruolo
            FROM Evento E
            JOIN Segna Sg
                ON Sg.Codice_Evento = E.Codice
                AND Sg.CF = ?
            JOIN Orario_Evento O
                ON O.Codice_Evento = E.Codice
            LEFT JOIN Luogo L
                ON L.Codice = O.Cod_Luogo
            LEFT JOIN Universitario U
                ON U.Cod_Luogo = L.Codice
            LEFT JOIN Sede S
                ON S.Codice = U.Codice_Uni
            WHERE $when
            ORDER BY O.Inizio ASC;
        ";

        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("s", $cf);
        $stmt->execute();

        $result = $stmt->get_result();
        $eventi = $result->fetch_all(MYSQLI_ASSOC);

        $stmt->close();
        return $eventi;
    }

    public function getOpenNotifications($idUtente)
    {
        $matricola = $this->resolveUserId($idUtente);
        if ($matricola === null) {
            return []; // nessuna notifica se utente non trovato
        }

        $stmt = $this->db->prepare("SELECT Codice as codice, Descrizione as descrizione, Chiusa as chiusa
            FROM Notifica
            WHERE Matricola = ?
            AND Notifica.Chiusa = 0
            ORDER BY Codice ASC");

        $stmt->bind_param("i", $matricola);
        $stmt->execute();
        $result = $stmt->get_result();
        $notifiche = $result->fetch_all(MYSQLI_ASSOC);
        $stmt->close();

        return $notifiche;
    }
    public function getAllNotifications($idUtente)
    {
        $matricola = $this->resolveUserId($idUtente);
        if ($matricola === null) {
            return []; // nessuna notifica se utente non trovato
        }

        $stmt = $this->db->prepare("SELECT Codice as codice, Descrizione as descrizione, Chiusa as chiusa
            FROM Notifica
            WHERE Matricola = ?
            ORDER BY Codice ASC");

        $stmt->bind_param("i", $matricola);
        $stmt->execute();
        $result = $stmt->get_result();
        $notifiche = $result->fetch_all(MYSQLI_ASSOC);
        $stmt->close();

        return $notifiche;
    }

    public function closeNotification($cod){
        $sql = "UPDATE Notifica
                SET Chiusa = 1
                WHERE Codice = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("i", $cod);
        $stmt->execute();
        $result = $stmt->get_result();

        return $result;
    }

    public function getCampusById($id){
        $query = "SELECT sede.Nome as nome, Provincia.Nome as provincia, Citta.Nome as citta, sede.N_Civico, indirizzo.Via, indirizzo.Nome as nome_indirizzo, sede.Descrizione as descrizione
                FROM sede
                JOIN indirizzo ON sede.Codice_Prov = indirizzo.Codice_Prov
                    AND sede.Codice_Citta = indirizzo.Codice_Citta
                    AND sede.N_Civico = indirizzo.N_Civico
                JOIN Provincia ON sede.Codice_Prov = Provincia.Codice
                JOIN Citta ON sede.Codice_Citta = Citta.Codice
                WHERE sede.Codice = ?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result();
        $sede = $result->fetch_assoc();
        $stmt->close();
        return $sede;
    }

    public function getSpacesByCampus($id) {
        $sql = "SELECT
                l.Nome AS nome,
                l.Capienza AS capienza,
                u.Codice AS codice_stanza,
                CASE
                    WHEN c.Codice_Stanza IS NOT NULL THEN 'CLASSE'
                    WHEN o.Codice_Stanza IS NOT NULL THEN 'UFFICIO'
                    ELSE 'UNIVERSITARIO'
                END AS tipo,
                c.Lab AS laboratorio,
                p.Nome AS prof_nome,
                p.Cognome AS prof_cognome
            FROM Universitario u
            JOIN Luogo l ON l.Codice = u.Cod_Luogo
            LEFT JOIN Classe c
                ON c.Codice_Uni = u.Codice_Uni
            AND c.Codice_Stanza = u.Codice
            LEFT JOIN Ufficio o
                ON o.Codice_Uni = u.Codice_Uni
            AND o.Codice_Stanza = u.Codice
            LEFT JOIN Sistema_Universitario su
                ON su.Matricola = o.Matricola
            LEFT JOIN Persona p
                ON p.CF = su.CF
            WHERE u.Codice_Uni = ?";

        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result();
        $spazzi = $result->fetch_all(MYSQLI_ASSOC);
        $stmt->close();

        return $spazzi;
    }

    public function getSecretariatByCampusId($id) {
        $sql = "SELECT p.Nome AS nome, p.Cognome AS cognome, su.Email_Uni AS email
            FROM Segreteria s
            JOIN Sistema_Universitario su ON s.Matricola = su.Matricola
            JOIN Persona p ON su.CF = p.CF
            WHERE s.Codice_Uni = ?";

        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result();
        $segreteria = $result->fetch_all(MYSQLI_ASSOC);
        $stmt->close();

        return $segreteria;
    }

    public function getProfessorsByCampusId($id) {
        $sql = "SELECT DISTINCT
                pe.Nome AS nome,
                pe.Cognome AS cognome,
                su.Email_Uni AS email
            FROM Professore pr
            JOIN Sistema_Universitario su
                ON su.Matricola = pr.Matricola
            JOIN Persona pe
                ON pe.CF = su.CF
            JOIN Insegna i
                ON i.Matricola = pr.Matricola
            JOIN Materia_Anno ma
                ON ma.Cod_Mat_Anno = i.Cod_Mat_Anno
            JOIN Materia m
                ON m.Codice = ma.Codice_Mat
            WHERE m.Codice_Uni = ?";

        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result();
        $professori = $result->fetch_all(MYSQLI_ASSOC);
        $stmt->close();

        return $professori;
    }

    public function getCoursesByCampusId($id) {
        $sql = "SELECT
                c.Codice AS codice,
                c.Nome AS nome,
                c.Descrizione AS descrizione,
                COALESCE(c.Colore, a.Colore) AS colore,
                a.Nome AS ambito
            FROM Seguito_In si
            JOIN Corso c
                ON c.Codice = si.Codice_Corso
            JOIN Ambito a
                ON a.Nome = c.Ambito
            WHERE si.Codice_Uni = ?
            ORDER BY c.Nome";

        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result();
        $corsi = $result->fetch_all(MYSQLI_ASSOC);
        $stmt->close();

        return $corsi;
    }

    public function getEventsByCampusId($id) {
        $sql = "SELECT
                e.Codice AS id,
                e.Nome AS nome,
                e.Descrizione AS descrizione,
                e.Posti AS posti,
                e.Pubblico AS pubblico,
                le.Nome AS luogo,
                oe.Inizio AS inizio,
                oe.Fine AS fine
            FROM Universitario u
            JOIN Orario_Evento oe
                ON oe.Cod_Luogo = u.Cod_Luogo
            JOIN Evento e
                ON e.Codice = oe.Codice_Evento
            JOIN Luogo le
                ON le.Codice = u.Cod_Luogo
            WHERE u.Codice_Uni = ?
            AND oe.Fine > NOW()
            ORDER BY oe.Inizio ASC";

        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result();
        $cal = $result->fetch_all(MYSQLI_ASSOC);
        $stmt->close();

        return $cal;
    }
}
?>