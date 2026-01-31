<?php
require_once(__DIR__ . "/../Bootstrap.php");
header('Content-Type: application/json');

/* DEFAULT → utenti non loggati */
$response = [

    "user" => [
        "logged" => false,
        "role" => null,
        "level" => null
    ],

    "titles" => [
        "mainTitleOne" => "I Nostri Campus",
        "mainTitleTwo" => "Mappa Interattiva",
        "asideTitleOne" => "Eventi Recenti",
        "asideTitleTwo" => "Domande",
        "asideInnerTitleOne" => "Hai una domanda?",
        "asideInnerTitleTwo" => "Domande Frequenti"
    ],

    "data" => [
        "campus" => $dbh->getAllCampuses(),
        "eventi" => $dbh->getMostRecentPublicEvents(),
        "faq" => $dbh->getMostPopularFAQsByLevel()
    ]
];

/* ========================= */
/* UTENTE LOGGATO            */
/* ========================= */

if(isUserLoggedIn()){

    $response["user"]["logged"] = true;
    $response["user"]["role"] = $_SESSION["user"]["lavoro"];
    $response["user"]["level"] = $_SESSION["user"]["livello_accesso"];

}

echo json_encode($response);
?>