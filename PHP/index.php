<?php
require_once("Bootstrap.php");


$sedi = [
    ["id" => 0,"regione" => "BO","citta" => "BO","civico" => 33,"nome" => "Palazzo Poggi","lat" => 44.49695468205003,"long" => 11.352428097135476,"descrizione" => "Cuore storico dell'Università di Bologna, ospita uffici, aule e spazi per eventi culturali.","path" => "0.jpeg","imgdesc" => ""],
    ["id" => 1,"regione" => "BO","citta" => "BO","civico" => 38,"nome" => "Palazzo Riario","lat" => 44.49714545398557,"long" => 11.351777685593056,"descrizione" => "Elegante edificio dove si svolgono corsi e seminari per diverse facoltà.","path" => "1.jpg","imgdesc" => ""],
    ["id" => 2,"regione" => "BO","citta" => "BO","civico" => 2,"nome" => "San Giovanni in Monte","lat" => 44.490720343041325,"long" => 11.348107021192652,"descrizione" => "Ex chiesa trasformata in spazio universitario per conferenze e attività culturali.", "path" => "2.jpg","imgdesc" => ""],
    ["id" => 3,"regione" => "BO","citta" => "BO","civico" => 20,"nome" => "Collegio dei Fiamminghi","lat" => 44.4908632502885,"long" => 11.351050592277026, "descrizione" => "Residenza e centro culturale per studenti internazionali e progetti artistici.", "path" => "3.jpg","imgdesc" => ""],
    ["id" => 4,"regione" => "BO","citta" => "BO","civico" => 45,"nome" => "Palazzo Hercolani","lat" => 44.491186321477585,"long" => 11.353923413025516,"descrizione" => "Sede di uffici e aule per corsi accademici e attività amministrative.", "path" => "4.jpeg","imgdesc" => ""],
    ["id" => 5,"regione" => "BO","citta" => "BO","civico" => 28,"nome" => "Complesso Terracini","lat" => 44.51418170928735,"long" => 11.320388529127037,"descrizione" => "Struttura moderna con laboratori e aule per studi scientifici e tecnologici.", "path" => "5.jpeg","imgdesc" => ""],
    ["id" => 6,"regione" => "BO","citta" => "BO","civico" => 9,"nome" => "Policlinico Sant'Orsola-Malpighi","lat" => 44.49158501339274,"long" => 11.361322111691853,"descrizione" => "Centro medico universitario, con cliniche, laboratori e corsi di Medicina e Chirurgia.", "path" => "6.jpeg","imgdesc" => ""],
    ["id" => 7,"regione" => "FC","citta" => "CE","civico" => 50,"nome" => "Campus universitario di Cesena","lat" => 44.147817414982335,"long" => 12.235123574591066,"descrizione" => "Campus completo con aule, laboratori, biblioteche e residenze per studenti.", "path" => "7.jpg","imgdesc" => ""],
    ["id" => 8,"regione" => "FC","citta" => "FO","civico" => 1,"nome" => "Polo universitario di Forlì","lat" => 44.21853822284904,"long" => 12.043530180274589,"descrizione" => "Sede moderna per corsi, laboratori e attività didattiche a Forlì.", "path" => "8.jpeg","imgdesc" => ""],
    ["id" => 9,"regione" => "RA","citta" => "RA","civico" => 27,"nome" => "Direzione e servizi studenti","lat" => 44.4127966303282,"long" => 12.20033533155324,"descrizione" => "Punto di riferimento per informazioni, servizi e supporto agli studenti.", "path" => "9.jpg","imgdesc" => ""],
    ["id" => 10,"regione" => "RA","citta" => "RA","civico" => 1,"nome" => "Dipartimento Beni Culturali","lat" => 44.4180922,"long" => 12.2002831,"descrizione" => "Sede accademica per studi storici, artistici e archeologici, con aule e laboratori.", "path" => "10.jpg","imgdesc" => ""],
    ["id" => 11,"regione" => "RA","citta" => "RA","civico" => 6,"nome" => "Palazzo Corradini","lat" => 44.41719039743122,"long" => 12.201891761643571,"descrizione" => "Edificio storico utilizzato per corsi, conferenze ed eventi culturali.", "path" => "11.jpeg","imgdesc" => ""],
    ["id" => 12,"regione" => "RA","citta" => "RA","civico" => 23,"nome" => "Palazzo Verdi","lat" => 44.41847876255419,"long" => 12.19697375988833,"descrizione" => "Sede universitaria per discipline umanistiche e sociali, con spazi per studenti e docenti.", "path" => "12.jpg","imgdesc" => ""],
    ["id" => 13,"regione" => "RA","citta" => "RA","civico" => 163,"nome" => "Laboratori Scientifici","lat" => 44.434364812359206,"long" => 12.195865837159722,"descrizione" => "Strutture all'avanguardia per ricerca e attività scientifiche sperimentali.", "path" => "13.jpeg","imgdesc" => ""],
    ["id" => 14,"regione" => "RA","citta" => "RA","civico" => 55,"nome" => "Ingegneria e Architettura","lat" => 44.41496707183807,"long" => 12.203009791004662,"descrizione" => "Sede dei dipartimenti di Ingegneria e Architettura, con laboratori, aule e spazi per progetti.", "path" => "14.jpg","imgdesc" => ""],
    ["id" => 15,"regione" => "RA","citta" => "RA","civico" => 5,"nome" => "Ospedale S.Maria delle Croci","lat" => 44.41006870830968,"long" => 12.190217946930394,"descrizione" => "Centro clinico e sede universitaria per corsi e tirocinio in Medicina.", "path" => "15.jpg","imgdesc" => ""],
    ["id" => 16,"regione" => "RN","citta" => "RN","civico" => 22,"nome" => "Complesso Valgimigli","lat" => 44.0620511659657,"long" => 12.56997495159669,"descrizione" => "Sede universitaria con laboratori e aule moderne per corsi scientifici e tecnologici.", "path" => "16.jpg","imgdesc" => ""]
];

$templateParams["titolo"] = "Home | UniFlow";
$templateParams["name"] = "Home";

$templateParams["css"][] = "../CSS/index.css";
$templateParams["css"][] = "../CSS/Cartina.css";
$templateParams["css"][] = "../CSS/indexNotification.css";
$templateParams["css"][] = "../CSS/indexClassiRefresh.css";

$templateParams["js"][] = "../Js/campusSlider.js";
$templateParams["js"][] = "../Js/NotificationManager.js";
$templateParams["js"][] = "../Js/index.js";

$templateParams["stylesheet"] = '
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
        integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
        crossorigin=""/>
';

$templateParams["scripts"] = '
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
        integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
        crossorigin=""></script>
';

$templateParams["inlineScripts"] = "
<script>
    const sedi = " . json_encode($sedi) . ";
</script>
";

require("Template/base.php");
?>
