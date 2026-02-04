<?php
require_once(__DIR__ . "/../Bootstrap.php");
header('Content-Type: application/json');

$response = [
    "user" => [
        "logged" => false,
        "role" => null,
        "level" => null
    ],

    "buttons" => [
        "left" => [
            [
                "label" => "Home",
                "link" => "../PHP/index.php"
            ]
        ],
        "right" => [
            [
                "label" => "Rubrica",
                "link" => "../PHP/rubrica.php"
            ],
            [
                "label" => "Login",
                "link" => "../PHP/login.php"
            ]
        ]
    ],

    "items" => [
        "Ateneo" => [
            ["label" => "Sedi", "link" => "#"],
            ["label" => "Ambiti", "link" => "../PHP/ambiti.php"],
            ["label" => "Corsi", "link" => "../PHP/corsi.php"]
        ],
        "Studiare" => [
            ["label" => "Virtuale", "link" => "https://virtuale.unibo.it/my/"],
            ["label" => "Orari", "link" => "../PHP/orari.php"],
            ["label" => "Ricevimenti", "link" => "../PHP/ricevimento.php"]
        ],
        "UniFlow" => [
            ["label" => "Eventi", "link" => "../PHP/eventi.php"],
            ["label" => "Forum", "link" => "#"],
            ["label" => "Classi Vuote", "link" => "../PHP/classi-vuote.php"]
        ]
    ]
];

if(isUserLoggedIn()){
    $response["user"]["logged"] = true;
    $response["user"]["role"] = $_SESSION["user"]["lavoro"];
    $response["user"]["level"] = $_SESSION["user"]["livello_accesso"];

    $response["buttons"]["right"] = [
        [
            "label" => "Notifiche",
            "link" => "../PHP/notifiche.php"
        ],
        [
            "label" => "Rubrica",
            "link" => "../PHP/rubrica.php"
        ],
        [
            "label" => "Logout",
            "link" => null
        ]
    ];

    if(isUserStudent()){
        $response["items"] = [
            "Ateneo" => [
                ["label" => "Sedi", "link" => "#"],
                ["label" => "Ambiti", "link" => "../PHP/ambiti.php"],
                ["label" => "Corsi", "link" => "../PHP/corsi.php"]
            ],
            "Studiare" => [
                ["label" => "Virtuale", "link" => "https://virtuale.unibo.it/my/"],
                ["label" => "EOL", "link" => "https://studenti.unibo.it/sol/studenti/home.htm"],
                ["label" => "Studenti Online", "link" => "https://eol.unibo.it/login/index.php"]
            ],
            "Forum" => [
                ["label" => "Professori", "link" => "#"],
                ["label" => "Studenti", "link" => "#"],
                ["label" => "Generali", "link" => "#"]
            ],
            "Richieste" => [
                ["label" => "Ricevimento", "link" => "#"],
                ["label" => "Evento", "link" => "#"]
            ],
            "UniFlow" => [
                ["label" => "Eventi", "link" => "#"],
                ["label" => "Lezioni", "link" => "#"],
                ["label" => "Ricevimenti", "link" => "#"],
                ["label" => "Classi Vuote", "link" => "../PHP/classi-vuote.php"]
            ]
        ];
    } else if (isUserProfessor()){
        $response["items"] = [
            "Ateneo" => [
                ["label" => "Sedi", "link" => "#"],
                ["label" => "Ambiti", "link" => "../PHP/ambiti.php"],
                ["label" => "Corsi", "link" => "../PHP/corsi.php"]
            ],
            "Studiare" => [
                ["label" => "Virtuale", "link" => "https://virtuale.unibo.it/my/"],
                ["label" => "EOL", "link" => "https://studenti.unibo.it/sol/studenti/home.htm"],
                ["label" => "Studenti Online", "link" => "https://eol.unibo.it/login/index.php"]
            ],
            "Forum" => [
                ["label" => "Professori", "link" => "#"],
                ["label" => "Studenti", "link" => "#"],
                ["label" => "Generali", "link" => "#"]
            ],
            "Richieste" => [
                ["label" => "Orario", "link" => "#"],
                ["label" => "Evento", "link" => "#"]
            ],
            "UniFlow" => [
                ["label" => "Eventi", "link" => "#"],
                ["label" => "Lezioni", "link" => "#"],
                ["label" => "Ricevimenti", "link" => "#"],
                ["label" => "Classi Vuote", "link" => "../PHP/classi-vuote.php"]
            ]
        ];
    } else { // segreteria
        $response["items"] = [
            "Ateneo" => [
                ["label" => "Sedi", "link" => "#"],
                ["label" => "Ambiti", "link" => "../PHP/ambiti.php"],
                ["label" => "Corsi", "link" => "../PHP/corsi.php"],
                ["label" => "Uffici", "link" => "#"]
            ],
            "Forum" => [
                ["label" => "Professori", "link" => "#"],
                ["label" => "Studenti", "link" => "#"],
                ["label" => "Generali", "link" => "#"]
            ],
            "Richieste" => [
                ["label" => "Lezioni", "link" => "#"],
                ["label" => "Ricevimenti", "link" => "#"],
                ["label" => "Eventi", "link" => "#"]
            ],
            "UniFlow" => [
                ["label" => "Eventi", "link" => "#"],
                ["label" => "Lezioni", "link" => "#"],
                ["label" => "Classi Vuote", "link" => "../PHP/classi-vuote.php"]
            ]
        ];
    }
}

echo json_encode($response);
exit;
?>