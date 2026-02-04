<?php
require_once(__DIR__ . "/../Bootstrap.php");
header('Content-Type: application/json');

$sede = $_GET['sede'] ?? null;
$date = $_GET["date"] ?? date("Y-m-d");
if(!preg_match('/^\d{4}-\d{2}-\d{2}$/', $date)) $date = date("Y-m-d");

if ($sede === null) {
    http_response_code(400);
    echo json_encode(["error" => "Parametri mancanti"]);
    exit;
}

// recupero nome sede
$infoSede = $dbh->getCampusNameByCode($sede);

$response = [
    "titles" => [
        "One" => "Ricevimenti in " . $infoSede['nome'] . " da " . $date
    ],
    "data" => [
        "sede"    => $dbh->getAllCampusesWithCode(),
        "ricevimento"  => $dbh->getReunionsByCampus($sede, $date)
    ]
];

echo json_encode($response);
exit;
