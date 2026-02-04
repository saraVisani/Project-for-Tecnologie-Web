<?php
require_once("Bootstrap.php");

$templateParams["titolo"] = "Ricevimento | UniFlow";
$templateParams["name"] = "Ricevimento";
$templateParams["css"][] = "../CSS/archivi.css";
$templateParams["js"][] = "../Js/helperOrarioRicevimento.js";
$templateParams["js"][] = "../Js/ricevimento.js";

require("Template/base.php");
?>
