<?php
require_once("Bootstrap.php");

$templateParams["titolo"] = "Eventi | UniFlow";
$templateParams["name"] = "Eventi";
$templateParams["css"][] = "../CSS/archivi.css";
$templateParams["js"][] = "../Js/eventi.js";

require("Template/base.php");
?>