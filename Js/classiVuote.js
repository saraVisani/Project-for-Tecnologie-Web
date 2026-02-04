let selectedCampus = 0;

// Render skeleton
function renderMainClassroomsSkeleton(titles) {
    return `
    <article>
        <header>
            <h2 id="classrooms-title">${titles.One}</h2>
        </header>
        <div class="filters">
            <label for="selectSede">Sede:</label>
            <select id="selectSede"></select>

            <button id="btnLoadClassrooms">Mostra aule libere</button>
        </div>

        <ul id="classrooms-list"></ul>
    </article>
    `;
}

// Render aule libere
function renderClassrooms(classi) {
    if (!classi || classi.length === 0) return `<li>Nessuna aula libera al momento</li>`;
    return classi.map(c => `
        <li>
            ${c.Nome} ${c.Lab == 1 ? "(Lab)" : ""}
            - Codice: ${c.Codice_Stanza}
        </li>
    `).join('');
}

// Popola select sedi
async function populateCampuses() {
    const select = document.getElementById("selectSede");
    if (!select) return;

    const res = await fetch(`./Api/api-classi-vuote.php?sede=0`);
    const json = await res.json();

    select.innerHTML = '';
    json.data.sede.forEach(s => {
        const option = document.createElement("option");
        option.value = s.codice;
        option.textContent = s.nome;
        select.appendChild(option);
    });
}

// Carica aule libere
async function loadClassrooms() {
    const sede = document.getElementById("selectSede")?.value || 0;
    selectedCampus = sede;

    const res = await fetch(`./Api/api-classi-vuote.php?sede=${sede}`);
    const json = await res.json();

    // Aggiorna titolo
    const titleElem = document.getElementById("classrooms-title");
    if (titleElem) titleElem.textContent = json.titles.One;

    // Aggiorna lista
    const listElem = document.getElementById("classrooms-list");
    if (listElem) listElem.innerHTML = renderClassrooms(json.data.classi);
}

// --- Avvio ---
const main = document.querySelector("main");
main.innerHTML = renderMainClassroomsSkeleton({One: "Aule libere"});

// Popola select sedi
populateCampuses();

// Bottone
document.getElementById("btnLoadClassrooms").addEventListener("click", loadClassrooms);

// Carica subito
loadClassrooms();
