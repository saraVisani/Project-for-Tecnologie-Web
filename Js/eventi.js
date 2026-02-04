let selectedDateEventi = new Date();

// --- Render skeleton ---
function renderMainEventiSkeleton(titles) {
    return `
    <article>
        <header>
            <h2 id="eventi-title">${titles.One}</h2>
        </header>
        <div class="filters">
            <label for="selectSede">Sede:</label>
            <select id="selectSede"><option value="0">Tutte le sedi</option></select>

            <label for="date-year">Anno:</label>
            <select id="date-year"></select>

            <button id="btnLoadEventi">Carica Eventi</button>
        </div>

        <ul id="eventi-list"></ul>
    </article>
    `;
}

// --- Render eventi ---
function renderEvents(eventi) {
    if (!eventi || eventi.length === 0) return `<li>Nessun evento disponibile</li>`;
    return eventi.map(e => `
        <li>
            <strong>${e.nome}</strong><br>
            ${e.luogo} - ${e.descrizione || ""}<br>
            ${e.inizio} → ${e.fine} [${e.posti} posti]
        </li>
    `).join('');
}

// --- Popola sedi ---
async function populateSedi() {
    const select = document.getElementById("selectSede");
    if (!select) return;

    const res = await fetch(`./Api/api-eventi.php?sede=0&date=${selectedDateEventi.getFullYear()}`);
    const json = await res.json();

    select.innerHTML = '<option value="0">Tutte le sedi</option>';
    json.data.sede.forEach(sede => {
        const option = document.createElement("option");
        option.value = sede.codice;
        option.textContent = sede.nome;
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

// --- Carica eventi ---
async function loadEventi() {
    const sede = document.getElementById("selectSede")?.value || 0;
    const anno = selectedDateEventi.getFullYear();

    const res = await fetch(`./Api/api-eventi.php?sede=${sede}&date=${anno}`);
    const json = await res.json();

    // Aggiorna titolo
    const titleElem = document.getElementById("eventi-title");
    if (titleElem) titleElem.textContent = json.titles.One;

    // Aggiorna lista eventi
    const listElem = document.getElementById("eventi-list");
    if (listElem) listElem.innerHTML = renderEvents(json.data.eventi);
}

// --- Avvio ---
const main = document.querySelector("main");

// 1️⃣ Inserisci skeleton
main.innerHTML = renderMainEventiSkeleton({One: "Eventi"});

// 2️⃣ Inizializza select anno
initYearFilter("date-year", selectedDateEventi, (newYear) => {
    selectedDateEventi.setFullYear(newYear);
    loadEventi(); // ricarica subito
});

// 3️⃣ Popola sedi
populateSedi();

// 4️⃣ Bottone Carica Eventi
document.getElementById("btnLoadEventi").addEventListener("click", loadEventi);

// 5️⃣ Carica subito con valori standard
loadEventi();
