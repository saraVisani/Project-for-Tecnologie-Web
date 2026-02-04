<?php
require_once(__DIR__ . "/../Bootstrap.php");
header('Content-Type: application/json');

$sede = $_GET['sede'] ?? null;

if (!$sede){
    $sede = 0;
}

// recupero nome corso
$infoSede = $dbh->getCampusById($sede);

$response = [
    "titles" => [
        "One" => "Tutte gli eventi in " . $infoSede['nome']
    ],
    "data" => [
        "sede"    => $dbh->getAllCampusesWithCode(),
        "classi"  => $dbh->getFreeClassroomsByCampus($sede)
    ]
];

echo json_encode($response);
exit;
