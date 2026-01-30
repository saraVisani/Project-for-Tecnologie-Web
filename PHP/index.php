<?php
require_once("Bootstrap.php");
//prepariamo parametri template
$templateParams["titolo"] = "Home | UniFlow";
$templateParams["name"] = "Home";
$templateParams["mainTemplate"] = "mainHomeBase.php";
$templateParams["mainTitleOne"] = "I Nostri Campus";
$templateParams["campus"] = $dbh->getAllCampuses();
$templateParams["mainTitleTwo"] = "Mappa Interattiva?";
$templateParams["asideTemplate"] = "asideHomeBase.php";
$templateParams["asideTitleOne"] = "Eventi Recenti";
$templateParams["asideTitleTwo"] = "Domande";
$templateParams["asideInnerTitleOne"] = "Hai una domanda?";
$templateParams["asideInnerTitleTwo"] = "Domande Frequenti";
$templateParams["eventi"] = $dbh->getMostRecentPublicEvents();
$templateParams["faq"] = $dbh->getMostPopularFAQsByLevel();

/*var_dump($templateParams["articolicasuali"]);//debug*/
require("Template/base.php");
?>