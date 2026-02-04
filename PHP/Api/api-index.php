<?php
require_once(__DIR__ . "/../Bootstrap.php");
header('Content-Type: application/json');

// --- Risposta base ---
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
    "data" => ["campus" => $dbh->getAllCampuses(),

        "eventi" => $dbh->getMostRecentPublicEvents(),
        "faq" => $dbh->getMostPopularFAQsByLevel()
    ]
];

// --- Utente loggato ---
if(isUserLoggedIn()) {
    $userId = $_SESSION["user"]["username"] ?? null;
    $userLevel = $_SESSION["user"]["livello_accesso"] ?? 0;
    $userRole = $_SESSION["user"]["lavoro"] ?? null;

    $response["user"] = [
        "logged" => true,
        "role" => $userRole,
        "level" => $userLevel
    ];

    // --- Range e Data ---
    $range = $_GET["range"] ?? "week";
    $allowedRanges = ["day", "week", "month"];
    if(!in_array($range, $allowedRanges)) $range = "week";

    $date = $_GET["date"] ?? date("Y-m-d");
    if(!preg_match('/^\d{4}-\d{2}-\d{2}$/', $date)) $date = date("Y-m-d");

    // --- Debug temporaneo ---
    file_put_contents(__DIR__ . "/debug_home_params.txt", "range=$range, date=$date, role=$userRole, userId=$userId\n");

    // --- Titoli ---
    $response["titles"] = [
        "mainTitleOne" => "Orari",
        "mainTitleTwo" => "Eventi",
        "mainTitleTwoS1" => "Parte dello Staff",
        "mainTitleTwoS2" => "Iscritto",
        "asideTitleOne" => "Canali Seguiti",
    ];

    // --- Dati principali ---
    $orario = [];
    $ricevimenti = [];
    $eventi_staff = [];
    $eventi_iscritto = [];
    $classi_libere = [];

    if($userRole === "studente") {
        $orario = $dbh->getTimesStudent($userId, $range, $date) ?: [];
        $ricevimenti = $dbh->getReunionStudent($userId, $range, $date) ?: [];
        $response["titles"]["mainTitleTwo"] = "Ricevimenti";
        $response["titles"]["mainTitleThree"] = "Eventi";
        $response["titles"]["asideTitleTwo"] = "Notifiche";
    } elseif($userRole === "professor") {
        $orario = $dbh->getTimesProfessor($userId, $range, $date) ?: [];
        $ricevimenti = $dbh->getReunionProfessor($userId, $range, $date) ?: [];
        $response["titles"]["mainTitleTwo"] = "Ricevimenti";
        $response["titles"]["mainTitleThree"] = "Eventi";
        $response["titles"]["asideTitleTwo"] = "Notifiche";
    } else {
        $orario = [];
        $ricevimenti = [];
        $classi_libere = $dbh->freeClassrooms($userId) ?: [];
        $response["titles"]["mainTitleOne"] = "Notifiche";
        $response["titles"]["mainTitleThree"] = "Classi Libere";
    }

    $canali_Seguiti = $dbh->getSignInChannals($userLevel) ?: [];
    $eventi_staff = $dbh->getStaffEvents($userId, $range, $date) ?: [];
    $eventi_iscritto = $dbh->getSignInEvents($userId, $range, $date) ?: [];
    $notifiche = $dbh->getOpenNotifications($userId) ?: [];

    $response["data"] = [
        "orario" => $orario,
        "ricevimenti" => $ricevimenti,
        "canali_Seguiti" => $canali_Seguiti,
        "eventi_staff" => $eventi_staff,
        "eventi_iscritto" => $eventi_iscritto,
        "notifiche" => $notifiche,
        "classiLibere" => $classi_libere
    ];

    // --- Salva JSON per debug ---
    file_put_contents(__DIR__ . "/debug_home.json", json_encode($response, JSON_PRETTY_PRINT));
}

if (isset($_GET['refresh'])) {
    $refresh = $_GET['refresh'];
    if ($refresh === 'classiLibere' && isUserLoggedIn()) {
        $response['data']['classiLibere'] = $dbh->freeClassrooms($userId);
    }
}

// --- Output JSON ---
echo json_encode($response);
exit;
