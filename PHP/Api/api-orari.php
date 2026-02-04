<?php
require_once(__DIR__ . "/../Bootstrap.php");
header('Content-Type: application/json');

$corso = $_GET['corso'] ?? null;
$grado = $_GET['grado'] ?? null;
$date  = $_GET['date']  ?? date("Y");

if (!$corso){
    $corso = "ECO01";
}

if(!$grado) {
    $grado = 1;
}

// recupero nome corso
$infoCorso = $dbh->getCourseByCode($corso);

$response = [
    "titles" => [
        "One" => "Tutte le lezioni del corso " . $infoCorso["corso_nome"] . " (" . $corso . ")"
    ],
    "data" => [
        "corsi"    => $dbh->AllCourses(),
        "lezioni"  => $dbh->getLessionsByCourse($corso, $grado, $date)
    ]
];

echo json_encode($response);
exit;
