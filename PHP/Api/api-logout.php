<?php
require_once(__DIR__ . "/../Bootstrap.php");
header('Content-Type: application/json');

session_unset();
session_destroy();

// Cancella cookie di sessione
if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(
        session_name(),
        '',
        time() - 42000,
        $params["path"],
        $params["domain"],
        $params["secure"],
        $params["httponly"]
    );
}

echo json_encode([
    "success" => true,
    "message" => "Logout effettuato con successo"
]);
exit;
