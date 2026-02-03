<?php
require_once(__DIR__ . "/../Bootstrap.php");
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    // Ritorna tutte le notifiche dell'utente
    echo json_encode(['notifiche' => $dbh->getAllNotifications($_SESSION['user_id'])]);

} elseif ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_GET['codice'])) {
    // CHIUDE notifica specifica
    $codice = $_GET['codice'];
    $stmt = $pdo->prepare("UPDATE notifiche SET chiusa = 1 WHERE codice = ? AND user_id = ?");
    $result = $dbh->closeNotification($codice);

    if ($result) {
        echo json_encode(['success' => true]);
    } else {
        echo json_encode(['success' => false]);
    }
}
?>
