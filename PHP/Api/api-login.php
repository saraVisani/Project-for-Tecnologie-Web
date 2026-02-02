<?php
require_once(__DIR__ . "/../Bootstrap.php");
error_log("DEBUG POST: " . json_encode($_POST));
header('Content-Type: application/json');

// DEBUG: abilitiamo log dettagliati
/*ini_set('display_errors', 1);
ini_set('log_errors', 1);
ini_set('error_log', __DIR__ . '/debug.log');
error_reporting(E_ALL);*/

$response = [
    "success" => false,
    "message" => "",
    "user" => null,
    "level_logged" => null,
];

$username = trim($_POST['username'] ?? '');
$password = trim($_POST['password'] ?? '');
$level    = (int)($_POST['liv_permesso'] ?? 0);

/*error_log("DEBUG username: " . $username);
error_log("DEBUG password: " . $password);
error_log("DEBUG accessLevel: " . $level);
error_log("DEBUG usernameOk: " . ($dbh->usernameOk($username) ? "true" : "false"));
error_log("DEBUG passwordOk: " . ($dbh->passwordOk($username, $password) ? "true" : "false"));
error_log("DEBUG accessLevelOk: " . ($dbh->accessLevelOk($username, $level) ? "true" : "false"));
error_log("DEBUG getLevelAccess: " . $dbh->getLevelAccess($username));*/

if (!$dbh->usernameOk($username) || !$dbh->passwordOk($username, $password)) {

    $response['message'] = "Username o password non corretti";

} else if (!$dbh->accessLevelOk($username, $level)) {

    $correctLevel = $dbh->getLevelAccess($username);

    $_SESSION['user'] = [
        'username' => $username,
        'livello_accesso' => $correctLevel
    ];

    $response['success'] = true;
    $response['message'] = "Login effettuato con livello $correctLevel invece di $level";
    $response['user'] = $username;
    $response['level_logged'] = $correctLevel;

} else {

    $_SESSION['user'] = [
        'username' => $username,
        'livello_accesso' => $level,
        'lavoro' => $dbh->getUserJob($username),
    ];

    $response['success'] = true;
    $response['user'] = $username;
    $response['level_logged'] = $level;
}


echo json_encode($response);
exit;
