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
}
?>