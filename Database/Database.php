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

    public function getTimesStudent($idUtente)
    {
        $cf = $this->resolveUserId($idUtente);
        if (!$cf) {
            return []; // nessun evento se utente non trovato
        }


    }

    public function getReunionStudent($idUtente)
    {
        $cf = $this->resolveUserId($idUtente);
        if (!$cf) {
            return []; // nessun evento se utente non trovato
        }
    }

    public function getTimesProfessor($idUtente)
    {
        $cf = $this->resolveUserId($idUtente);
        if (!$cf) {
            return []; // nessun evento se utente non trovato
        }
    }

    public function getReunionProfessor($idUtente)
    {
        $cf = $this->resolveUserId($idUtente);
        if (!$cf) {
            return []; // nessun evento se utente non trovato
        }
    }

    public function getSignInChannals($idUtente)
    {
        $cf = $this->resolveUserId($idUtente);
        if (!$cf) {
            return []; // nessun evento se utente non trovato
        }
    }

    public function getStaffEvents($idUtente)
    {
        $cf = $this->resolveUserId($idUtente);
        if (!$cf) {
            return []; // nessun evento se utente non trovato
        }
    }

    public function getSignInEvents($idUtente)
    {
        // Risolvi l'utente in CF
        $cf = $this->resolveUserId($idUtente);
        if (!$cf) {
            return []; // nessun evento se utente non trovato
        }

        $sql = "
            SELECT e.Nome, e.Inizio, e.Descrizione
            FROM Evento e
            INNER JOIN Segna s
                ON e.Codice = s.Codice_Evento
            WHERE s.CF = ?
            ORDER BY e.Inizio ASC
        ";

        $stmt = $this->db->prepare($sql);
        $stmt->bind_param("s", $cf);
        $stmt->execute();
        $result = $stmt->get_result();
        $eventi = $result->fetch_all(MYSQLI_ASSOC);
        $stmt->close();

        return $eventi;
    }

    public function getNotifications($idUtente)
    {
        $matricola = $this->resolveUserId($idUtente);
        if (!$matricola) {
            return []; // nessuna notifica se utente non trovato
        }

        $stmt = $this->db->prepare("
            SELECT Codice, Descizione, Chiusa
            FROM Notifica
            WHERE Matricola = ?
            ORDER BY Codice DESC
        ");
        $stmt->bind_param("i", $matricola);
        $stmt->execute();
        $result = $stmt->get_result();
        $notifiche = $result->fetch_all(MYSQLI_ASSOC);
        $stmt->close();

        return $notifiche;
    }
}
?>