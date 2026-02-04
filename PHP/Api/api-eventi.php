<?php
require_once(__DIR__ . "/../Bootstrap.php");
header('Content-Type: application/json');

$sede = $_GET['sede'] ?? null;
$date  = $_GET['date']  ?? date("Y");

if (!$sede){
    $sede = 0;
}

// recupero nome corso
$infoSede = $dbh->getCampusById($sede);

$response = [
    "titles" => [
        "One" => "Tutte gli eventi in " . $infoSede['nome'] . " da " . $date
    ],
    "data" => [
        "sede"    => $dbh->getAllCampusesWithCode(),
        "eventi"  => $dbh->getEventsByCampusIdInYear($sede, $date)
    ]
];

echo json_encode($response);
exit;
