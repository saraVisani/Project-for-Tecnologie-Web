<!DOCTYPE html>
<html lang="it">
<head>
    <title><?php echo $templateParams["titolo"];?></title>
    <link rel="stylesheet" href="../CSS/Prototipo.css"/>
    <script src="../Js/navbar.js" defer></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
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
        <ul>
            <li><a href="../PHP/index.php">Home</a></li>

            <li class="dropdown">
                <button class="dropbtn">
                    Ateneo <span class="arrow">▾</span>
                </button>
                <ul class="dropdown-content">
                    <li><a href="#">Sedi</a></li>
                    <li><a href="#">Ambiti</a></li>
                    <li><a href="#">Corsi</a></li>
                </ul>
            </li>

            <li class="dropdown">
                <button class="dropbtn">
                    Studiare <span class="arrow">▾</span>
                </button>
                <ul class="dropdown-content">
                    <li><a href="#">Virtuale</a></li>
                    <li><a href="#">Orari</a></li>
                    <li><a href="#">Ricevimenti</a></li>
                </ul>
            </li>

            <li class="dropdown">
                <button class="dropbtn">
                    Uniflow <span class="arrow">▾</span>
                </button>
                <ul class="dropdown-content">
                    <li><a href="#">Eventi</a></li>
                    <li><a href="#">Forum</a></li>
                    <li><a href="#">Classi Vuote</a></li>
                </ul>
            </li>

            <li><a href="contatti.php">Rubrica</a></li>

            <li><a href="login.php">Login</a></li>
        </ul>
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