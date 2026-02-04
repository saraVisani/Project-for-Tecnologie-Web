<?php
require_once("Bootstrap.php");

$templateParams["titolo"] = "Corsi | UniFlow";
$templateParams["name"] = "Corsi";
$templateParams["css"][] = "../CSS/archivi.css";
$templateParams["js"][] = "../Js/corsi.js";

require("Template/base.php");
?>