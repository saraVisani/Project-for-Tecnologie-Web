<?php
require_once("Bootstrap.php");
//prepariamo parametri template
$templateParams["titolo"] = "Login | UniFlow";
$templateParams["name"] = "Login";
$templateParams["css"][] = "../CSS/login.css";
$templateParams["js"][] = "../Js/login.js";

require("Template/base.php");
?>