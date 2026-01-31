<?php
session_start();
require_once(__DIR__ . "/Utils/functions.php");
require_once(__DIR__ . "/../Database/Database.php"); 
$dbh = new DatabaseHelper("localhost", "root", "", "Uniflow", 3306);
//define("UPLOAD_DIR", "./upload/"); //costante visibile da tutti per la cartella immagini
?>