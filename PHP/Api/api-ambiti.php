<?php
require_once(__DIR__ . "/../Bootstrap.php");
header('Content-Type: application/json');

$rows = $dbh->getAmbitiForPage();

$response = [
    "titles" => [
        "One" => "Informazioni sugli ambiti",
        "corso"  => "Corsi compresi"
    ],
    "data" => [
        "ambiti" => []
    ]
];

$ambiti = []; // ✅ inizializzazione

foreach ($rows as $row) {
    $ambitoNome = $row['ambito_nome'];

    if (!isset($ambiti[$ambitoNome])) {
        $ambiti[$ambitoNome] = [
            'nome'   => $ambitoNome,
            'colore' => $row['ambito_colore'],
            'corsi'  => []
        ];
    }

    if (!empty($row['corso_codice'])) {
        $ambiti[$ambitoNome]['corsi'][] = [
            'codice'      => $row['corso_codice'],
            'nome'        => $row['corso_nome'],
            'descrizione' => $row['corso_descrizione'],
            'colore'      => $row['corso_colore']
        ];
    }
}

// ✅ assegno i dati alla response
$response['data']['ambiti'] = array_values($ambiti);

echo json_encode($response);
exit;
