<!DOCTYPE html>
<html lang="it">
<head>
    <title><?php echo $templateParams["titolo"];?></title>
    <link rel="stylesheet" href="../CSS/Prototipo.css"/>
    <script src="../Js/index.js" defer></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>
    <header class="page-header">
        <img src="../Img/AlmaMater.jpg" alt="Logo" class="header-img">
        <h1><?php echo $templateParams["name"];?></h1>
    </header>
    <nav class="navbar">
        <ul>
            <li><a href="../index.php">Home</a></li>

            <li class="dropdown">
                <button class="dropbtn">
                    Ateneo <span class="arrow">▾</span>
                </button>
                <ul class="dropdown-content">
                    <li><a href="#">Web Design</a></li>
                    <li><a href="#">SEO</a></li>
                    <li><a href="#">Marketing</a></li>
                </ul>
            </li>

            <li class="dropdown">
                <button class="dropbtn">
                    Studiare <span class="arrow">▾</span>
                </button>
                <ul class="dropdown-content">
                    <li><a href="#">Team</a></li>
                    <li><a href="#">Storia</a></li>
                </ul>
            </li>

            <li class="dropdown">
                <button class="dropbtn">
                    Uniflow <span class="arrow">▾</span>
                </button>
                <ul class="dropdown-content">
                    <li><a href="#">Team</a></li>
                    <li><a href="#">Storia</a></li>
                </ul>
            </li>

            <li><a href="#">Rubrica</a></li>

            <li><a href="#">Login</a></li>
        </ul>
    </nav>
    <div class="content">
        <main>
            <?php
                require($templateParams["mainTemplate"]);
            ?>
        </main>
        <aside>
            <?php
                require($templateParams["asideTemplate"]);
            ?>
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