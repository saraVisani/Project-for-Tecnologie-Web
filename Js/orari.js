let selectedDateOrari = new Date();

// --- Render skeleton ---
function renderMainOrariSkeleton(titles) {
    return `
    <article>
        <header>
            <h2 id="orari-title">${titles.One}</h2>
        </header>
        <div class="filters">
            <label for="selectCorso">Corso:</label>
            <select id="selectCorso"><option value="0">Tutti i corsi</option></select>

            <label for="selectGrado">Grado:</label>
            <select id="selectGrado">
                <option value="0">Tutti i gradi</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>

            <label for="date-year">Anno:</label>
            <select id="date-year"></select>

            <button id="btnLoadOrari">Carica Orari</button>
        </div>

        <ul id="orari-list"></ul>
    </article>
    `;
}

// --- Render lezioni ---
function renderLessions(orari) {
    if (!orari || orari.length === 0) return `<li>Nessuna lezione disponibile</li>`;
    return orari.map(o => `
        <li>
            <strong>${o.materia_nome}</strong> (${o.modulo_descrizione})<br>
            ${o.nome_stanza} - ${o.nome_sede}<br>
            ${o.Orario_inizio} → ${o.Orario_fine}
        </li>
    `).join('');
}

// --- Popola corsi ---
async function populateCourses() {
    const select = document.getElementById("selectCorso");
    if (!select) return;

    const res = await fetch(`./Api/api-orari.php?corso=0&grado=0&date=${selectedDateOrari.getFullYear()}`);
    const json = await res.json();

    select.innerHTML = '<option value="0">Tutti i corsi</option>';
    json.data.corsi.forEach(corso => {
        const option = document.createElement("option");
        option.value = corso.corso_codice;
        option.textContent = corso.corso_nome;
        select.appendChild(option);
    });
}

// --- Inizializza select anno ---
function initYearFilter(yearSelectId, defaultDate, onChangeCallback) {
    const yearSelect = document.getElementById(yearSelectId);
    if (!yearSelect) return;

    const year = defaultDate.getFullYear();
    yearSelect.innerHTML = "";
    for (let y = 2000; y <= 2030; y++) {
        yearSelect.innerHTML += `<option value="${y}" ${y === year ? "selected" : ""}>${y}</option>`;
    }

    yearSelect.addEventListener("change", () => {
        const newYear = parseInt(yearSelect.value);
        onChangeCallback(newYear);
    });
}

// --- Carica orari ---
async function loadOrari() {
    const corso = document.getElementById("selectCorso")?.value || "ECO01";
    const grado = document.getElementById("selectGrado")?.value || 1;
    const anno = selectedDateOrari.getFullYear();

    const res = await fetch(`./Api/api-orari.php?corso=${corso}&grado=${grado}&date=${anno}`);
    const json = await res.json();

    // Aggiorna titolo
    const titleElem = document.getElementById("orari-title");
    if (titleElem) titleElem.textContent = json.titles.One;

    // Aggiorna lista lezioni
    const listElem = document.getElementById("orari-list");
    if (listElem) listElem.innerHTML = renderLessions(json.data.lezioni);
}

// --- Avvio ---
const main = document.querySelector("main");

// 1️⃣ Inserisci skeleton
main.innerHTML = renderMainOrariSkeleton({One: "Orari"});

// 2️⃣ Inizializza select anno
initYearFilter("date-year", selectedDateOrari, (newYear) => {
    selectedDateOrari.setFullYear(newYear);
    loadOrari(); // ricarica subito
});

// 3️⃣ Popola corsi
populateCourses();

// 4️⃣ Bottone Carica Orari
document.getElementById("btnLoadOrari").addEventListener("click", loadOrari);

// 5️⃣ Carica subito con valori standard
loadOrari();
