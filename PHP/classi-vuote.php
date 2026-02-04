<?php
require_once("Bootstrap.php");

$templateParams["titolo"] = "Classi Vuote | UniFlow";
$templateParams["name"] = "Classi Libere";
$templateParams["css"][] = "../CSS/archivi.css";
$templateParams["js"][] = "../Js/classiVuote.js";

require("Template/base.php");
?>