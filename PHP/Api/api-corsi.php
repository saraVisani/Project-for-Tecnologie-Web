<?php
require_once(__DIR__ . "/../Bootstrap.php");
header('Content-Type: application/json');

$rows = $dbh->corsesForPage();

$response = [
    "titles" => [
        "One" => "Informazioni sui corsi"
    ],
    "data" => [
        "corso" => []
    ]
];

$corsi = [];

foreach ($rows as $row) {
    $codiceCorso = $row['corso_codice'];

    if (!isset($corsi[$codiceCorso])) {
        $corsi[$codiceCorso] = [
            'codice'      => $codiceCorso,
            'nome'        => $row['corso_nome'],
            'descrizione' => $row['corso_descrizione'],
            'colore'      => $row['corso_colore'],
            'sedi'        => [],
            'materie'     => []
        ];
    }

    // SEDI
    if (!empty($row['sede_codice'])) {
        $corsi[$codiceCorso]['sedi'][$row['sede_codice']] = [
            'codice'      => $row['sede_codice'],
            'nome'        => $row['sede_nome'],
            'descrizione' => $row['sede_descrizione']
        ];
    }

    // MATERIE
    if (!empty($row['materia_codice'])) {
        $corsi[$codiceCorso]['materie'][$row['materia_codice']] = [
            'codice'        => $row['materia_codice'],
            'nome'          => $row['materia_nome'],
            'obbligatorio'  => $row['Obbligatorio'],
            'grado'         => $row['Grado'],
            'periodo'       => $row['Periodo'],
            'cfu'           => $row['CFU']
        ];
    }
}

// reset indici numerici
foreach ($corsi as &$corso) {
    $corso['sedi'] = array_values($corso['sedi']);
    $corso['materie'] = array_values($corso['materie']);
}

// ✅ assegno i corsi alla response
$response['data']['corso'] = array_values($corsi);

echo json_encode($response);
exit;
