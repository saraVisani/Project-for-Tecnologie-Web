<?php
require_once(__DIR__ . "/../Bootstrap.php");
header('Content-Type: application/json');

$response = [
    "success" => false,
    "message" => "",
    "user" => null,
    "level_logged" => null,
    "login" => true,
];

$username = $_POST['username'] ?? '';
$password = $_POST['password'] ?? '';
$level    = (int)($_POST['liv_permesso'] ?? 0);

if (isUserLoggedIn()) {

    $_SESSION = [];
    session_destroy();

    $response['login'] = false;
    $response['message'] = "Logout effettuato con successo";

} else {

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
            'livello_accesso' => $level
        ];

        $response['success'] = true;
        $response['user'] = $username;
        $response['level_logged'] = $level;
    }
}

echo json_encode($response);
exit;
