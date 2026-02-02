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
                "link" => "../PHP/contatti.php"
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
            ["label" => "Ambiti", "link" => "#"],
            ["label" => "Corsi", "link" => "#"]
        ],
        "Studiare" => [
            ["label" => "Virtuale", "link" => "#"],
            ["label" => "Orari", "link" => "#"],
            ["label" => "Ricevimenti", "link" => "#"]
        ],
        "UniFlow" => [
            ["label" => "Eventi", "link" => "#"],
            ["label" => "Forum", "link" => "#"],
            ["label" => "Classi Vuote", "link" => "#"]
        ]
    ]
];

if(isUserLoggedIn()){
    $response["user"]["logged"] = true;
    $response["user"]["role"] = $_SESSION["user"]["lavoro"];
    $response["user"]["level"] = $_SESSION["user"]["livello_accesso"];

    $response["buttons"]["right"] = [
        [
            "label" => "Rubrica",
            "link" => "../PHP/contatti.php"
        ],
        [
            "label" => "Logout",
            "link" => null
        ]
    ];

    if(isUserStudent()){
        if(userLevelForAccess(2)){
            // studentRep
        } else {
            // student normale
        }

    } else if (isUserProfessor()){

    } else { // segreteria

    }
}

echo json_encode($response);
exit;
?>