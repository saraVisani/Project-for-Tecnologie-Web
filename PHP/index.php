<?php
require_once("Bootstrap.php");
//prepariamo parametri template
$templateParams["titolo"] = "Home | UniFlow";
$templateParams["name"] = "Home";
$templateParams["css"][] = "../CSS/index.css";
$templateParams["js"][] = "../Js/campusSlider.js";
$templateParams["js"][] = "../Js/index.js";

/*var_dump($templateParams["articolicasuali"]);//debug*/
require("Template/base.php");
?>