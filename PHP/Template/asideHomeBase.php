<ul>
    <li>
        <h2><?php echo $templateParams["asideTitleOne"];?></h2>
        <ul>
            <?php foreach($templateParams["eventi"] as $evento): ?>
            <li>
                <article>
                    <h3><?php echo $evento["titolo"]; ?></h3>
                    <p><?php echo $evento["data"]; ?></p>
                    <p><?php echo $evento["descrizione"]; ?></p>
                </article>
            </li>
            <?php endforeach; ?>
        </ul>
    </li>
    <li>
        <h2><?php echo $templateParams["asideTitleTwo"];?></h2>
        <ul>
            <li>
                <h3><?php echo $templateParams["asideInnerTitleOne"];?></h3>
                <a href="#">Forum</a>
            </li>
            <li>
                <h3><?php echo $templateParams["asideInnerTitleTwo"];?></h3>
                <ul>
                    <?php foreach($templateParams["faq"] as $faq): ?>
                    <li><a href="#"><?php echo $faq["domanda"]; ?></a></li>
                    <?php endforeach; ?>
                </ul>
            </li>
        </ul>
    </li>
</ul>