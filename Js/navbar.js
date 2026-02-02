function renderMainNavbar(buttonsLeft, buttonsRight, items){

    let leftButtonsHTML = "";
    let rightButtonsHTML = "";
    let itemsHTML = "";

    // Bottoni sinistra (es. Home)
    buttonsLeft.forEach(btn => {
        leftButtonsHTML += `
            <li><a href="${btn.link}">${btn.label}</a></li>
        `;
    });

    // Dropdown (Ateneo, Studiare, UniFlow)
    Object.entries(items).forEach(([sectionName, links]) => {

        let linksHTML = "";
        links.forEach(link => {
            linksHTML += `
                <li><a href="${link.link}">${link.label}</a></li>
            `;
        });

        itemsHTML += `
            <li class="dropdown">
                <button class="dropbtn">
                    ${sectionName} <span class="arrow">▾</span>
                </button>
                <ul class="dropdown-content">
                    ${linksHTML}
                </ul>
            </li>
        `;
    });

    // Bottoni destra (Rubrica, Login / Logout)
    buttonsRight.forEach(btn => {

        if (btn.label === "Logout") {
            rightButtonsHTML += `
                <li>
                    <button type="button" class="dropbtn logout-btn">
                        Logout
                    </button>
                </li>
            `;
        } else {
            rightButtonsHTML += `
                <li><a href="${btn.link}">${btn.label}</a></li>
            `;
        }

    });

    return `
        <ul>
            ${leftButtonsHTML}
            ${itemsHTML}
            ${rightButtonsHTML}
        </ul>
    `;
}

async function logout() {

    try {
        const res = await fetch("./Api/api-logout.php");
        const json = await res.json();

        if (json.success) {
            alert(json.message);
            await loadNavbar();
            window.location.href = "../PHP/index.php";
        } else {
            alert("Errore durante il logout");
        }

    } catch (err) {
        console.error("Logout error:", err);
    }
}

document.addEventListener("click", e => {
    if (e.target.classList.contains("logout-btn")) {
        logout();
    }
});

async function loadNavbar(){

    const res = await fetch("./Api/api-navbar.php");
    const json = await res.json();

    const navbar = document.querySelector("nav");
    navbar.innerHTML = renderMainNavbar(json.buttons.left, json.buttons.right, json.items);

    new DropdownManager();
}

loadNavbar();
