<?php
require_once("Bootstrap.php");

$templateParams["titolo"] = "Orari | UniFlow";
$templateParams["name"] = "Lezione";
$templateParams["css"][] = "../CSS/archivi.css";
$templateParams["js"][] = "../Js/helperOrarioRicevimento.js";
$templateParams["js"][] = "../Js/orari.js";

require("Template/base.php");
?>
