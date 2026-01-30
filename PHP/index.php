<?php
require_once("Bootstrap.php");
//prepariamo parametri template
$templateParams["titolo"] = "Home | UniFlow";
$templateParams["name"] = "Home";
$templateParams["mainTemplate"] = "mainHomeBase.php";
$templateParams["asideTemplate"] = "asideHomeBase.php";


/*var_dump($templateParams["articolicasuali"]);//debug*/
require("Template/base.php");
?>