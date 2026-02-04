<?php
require_once(__DIR__ . "/../Bootstrap.php");
header('Content-Type: application/json');

$response = [
    "titles" => [
        "one" => "I Nostri Campus",
        "ambiti" => "Mappa Interattiva",
        "corso" => "Eventi Recenti",
        "materie" => "Domande",
        "luoghi" => "Hai una domanda?",
        "classi" => "Domande Frequenti",
        "uffici" => "Domande",
        "professor" => "Hai una domanda?",
        "segreteria" => "Domande Frequenti",
    ],
    "data" => [
        "campus" => $dbh->getAllCampuses(),
        "ambiti" => "Mappa Interattiva",
        "corso" => "Eventi Recenti",
        "materie" => "Domande",
        "luoghi" => "Hai una domanda?",
        "classi" => "Domande Frequenti",
        "uffici" => "Domande",
        "professor" => "Hai una domanda?",
        "segreteria" => "Domande Frequenti",
    ]
];

echo json_encode($response);
exit;