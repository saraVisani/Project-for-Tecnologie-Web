// data selezionata
let selectedDateRicevimenti = new Date();

// render dell'articolo con filtri
function renderMainRicevimento(titles, ricevimenti){
    return `
        <article>
            <header>
                <h2>${titles.One}</h2>
            </header>
            <div id="filters">
                <label for="selectSede">Sede:</label>
                <select id="selectSede">
                    <option value="0">-- Tutte le sedi --</option>
                </select>

                <label for="date-day-r">Giorno:</label>
                <select id="date-day-r"></select>
                <label for="date-month-r">Mese:</label>
                <select id="date-month-r"></select>
                <label for="date-year-r">Anno:</label>
                <select id="date-year-r"></select>

                <button id="btnLoadRicevimento">Carica Ricevimenti</button>
            </div>
            <ul id="listaRicevimenti">
                ${ricevimenti.map(r => `
                    <li>
                        <strong>${r.Nome} ${r.Cognome}</strong> - ${r.nome_sede} <br>
                        ${r.Data_Inizio} → ${r.Data_Fine}
                        [${r.Online == 1 ? "Online" : "Presenza"}] - Slot: ${r.N_Slot}
                    </li>
                `).join('')}
            </ul>
        </article>
    `;
}

async function populateSedi() {
    const select = document.getElementById("selectSede");
    if (!select) return;

    const res = await fetch("./Api/api-ricevimento.php?sede=0&date=" + selectedDateRicevimenti.toISOString().split('T')[0]);
    const json = await res.json();

    // reset select e aggiunge l’opzione default
    select.innerHTML = '<option value="0">-- Tutte le sedi --</option>';

    // popola con le sedi dalla risposta
    json.data.sede.forEach(sede => {
        const option = document.createElement("option");
        option.value = sede.codice;   // minuscolo
        option.textContent = sede.nome; // minuscolo
        select.appendChild(option);
    });
}

// filtri temporali
function initTimeFiltersRicevimenti() {
    initTimeFilters("date-day-r","date-month-r","date-year-r", selectedDateRicevimenti, (d) => {
        selectedDateRicevimenti = new Date(d);
        loadRicevimento();
    });
}

// carica ricevimenti
async function loadRicevimento() {
    const select = document.getElementById("selectSede");
    const sede = select ? select.value : 0;
    const dateStr = selectedDateRicevimenti.toISOString().split('T')[0];

    const res = await fetch(`./Api/api-ricevimento.php?sede=${sede}&date=${dateStr}`);
    const json = await res.json();

    const main = document.querySelector("main");
    main.innerHTML = renderMainRicevimento(json.titles, json.data.ricevimento);

    // popola select dopo il render
    populateSedi();

    // ri-inizializza filtri temporali
    initTimeFiltersRicevimenti();

    // aggiunge listener bottone
    const btn = document.getElementById("btnLoadRicevimento");
    if(btn) btn.addEventListener("click", loadRicevimento);
}

// caricamento iniziale
loadRicevimento();
