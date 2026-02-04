<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title><?php echo $templateParams["titolo"]; ?></title>
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
    <?php
    if(isset($templateParams["stylesheet"])) {
        echo $templateParams["stylesheet"];
    }
    ?>
</head>
<body>
    <header class="page-header">
        <img src="../Img/AlmaMater.jpg" alt="Logo" class="header-img">
        <h1><?php echo $templateParams["name"]; ?></h1>
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
        <div class="footer-top">
            <h2 class="site-name">UniFlow</h2>
            <p class="site-subtitle">Progetto di Tecoologie WEB A.A. 2025/2026 a cura di:</p>
        </div>
        <div class="footer-bottom">
            <div class="footer-cell">
                <p class="footer-name">Alessia Marzano</p>
                <a href="mailto:alessia@email.com">alessia.marzano@studio.unibo.it</a>
            </div>

            <div class="footer-cell footer-logo">
                <img src="../Img/Logo.png" alt="UniFlow logo">
            </div>

            <div class="footer-cell">
                <p class="footer-name">Sara Visani</p>
                <a href="mailto:sara@email.com">sara.visani7@studio.unibo.it</a>
            </div>
        </div>

        <p class="footer-copyright">
            © 2026 UniFlow – Tutti i diritti riservati
        </p>
    </footer>

    <?php
    if(isset($sedi)) {
        echo "<script>\n";
        echo "const sedi = " . json_encode($sedi, JSON_PRETTY_PRINT) . ";\n";
        echo "</script>\n";
    }
    ?>
    <?php
    if(isset($templateParams["scripts"])) {
        echo $templateParams["scripts"];
    }
    ?>
</body>
</html>
