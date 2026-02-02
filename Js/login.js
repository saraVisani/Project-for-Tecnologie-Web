function renderLogin(message = "") {
    return `
        <form id="loginForm" action="../PHP/login.php" method="POST">
            <h2>Login</h2>
            ${message ? `<p class="error">${message}</p>` : ""}

            <label>Username</label>
            <input type="text" name="username" required>

            <label>Password</label>
            <input type="password" name="password" required>

            <fieldset>
                <legend>Livello di permesso</legend>
                ${[1,2,3,4].map(n => `
                    <label>
                        <input type="radio" name="liv_permesso" value="${n}" required> ${n}
                    </label>
                `).join("")}
            </fieldset>

            <button type="submit">Login</button>
        </form>
    `;
}

async function submitLogin(e) {
    e.preventDefault();

    const formData = new FormData(e.target);

    const res = await fetch("./Api/api-login.php", {
        method: "POST",
        body: formData
    });

    const json = await res.json();

    if (json.success) {
        alert(
            "Login effettuato con successo" +
            (json.message ? "\n" + json.message : "")
        );
        location.href = "../PHP/index.php";
    }
    else {
        const main = document.querySelector("main");
        main.innerHTML = renderLogin(json.message);

        document
            .getElementById("loginForm")
            .addEventListener("submit", submitLogin);
    }
}

function loadLogin() {
    const main = document.querySelector("main");
    main.innerHTML = renderLogin();

    document
        .getElementById("loginForm")
        .addEventListener("submit", submitLogin);
}

loadLogin();
