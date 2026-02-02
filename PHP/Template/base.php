<!DOCTYPE html>
<html lang="it">
<head>
    <title><?php echo $templateParams["titolo"];?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <?php
    if(isset($templateParams["css"])) {
        foreach($templateParams["css"] as $cssFile) {
            echo '<link rel="stylesheet" href="'.$cssFile.'">' . PHP_EOL;
        }
    }
    ?>
    <?php
        if (isset($templateParams["js"])) {
            foreach ($templateParams["js"] as $script) {
                echo '<script src="' . $script . '" defer></script>';
            }
        }
    ?>
</head>
<body>
    <header class="page-header">
        <img src="../Img/AlmaMater.jpg" alt="Logo" class="header-img">
        <h1><?php echo $templateParams["name"];?></h1>
    </header>
    <nav class="navbar">
    </nav>
    <div class="content">
        <main>
        </main>
        <aside>
        </aside>
    </div>
    <footer class="footer">
        <nav class="footer-nav">
            <a href="#">Privacy</a>
            <a href="#">Termini</a>
            <a href="#">Contatti</a>

            <a href="#">Supporto</a>
            <a href="#">FAQ</a>
            <a href="#">Lavora con noi</a>

            <a href="#">Blog</a>
            <a href="#">Cookie</a>
            <a href="#">Sitemap</a>
        </nav>
    </footer>
</body>