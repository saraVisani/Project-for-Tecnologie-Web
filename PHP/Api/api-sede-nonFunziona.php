<?php
require_once(__DIR__ . "/../Bootstrap.php");
header("Content-Type: application/json");

$id = isset($_GET["id"]) ? intval($_GET["id"]) : null;

if ($id === null) {
    echo json_encode(["error" => "ID mancante"]);
    exit;
}

$sede = $dbh->getCampusById($id);

if (!$sede) {
    echo json_encode(["error" => "Sede non trovata"]);
    exit;
}

$response = [
    "sede" => $sede,
    "spazzi" => $dbh->getSpacesbyCampus($id),
    "segreteria" => $dbh->getSecretariatByCampusId($id),
    "professori" => $dbh->getProfessorsByCampusId($id),
    "corsi" => $dbh->getCoursesByCampusId($id),
    "eventi" => $dbh->getEventsByCampusId($id),
    "titles" => [
        "mainTitle" => "Dettagli Sede",
        "coursesTitle" => "Corsi Disponibili",
        "eventsTitle" => "Eventi in Sede"
    ]
];

echo json_encode($response);
exit;