function renderHome(template, titles, data){

    const main = document.querySelector("main");
    const aside = document.querySelector("aside");

    switch(template){

        case "student":
        case "studentRep":
        case "professor":
            main.innerHTML = renderMainHomeLogged(titles, data);
            aside.innerHTML = renderAsideHomeLogged(titles, data);
            break;

        case "segretary":
            main.innerHTML = renderSegretaryHome(data);
            aside.innerHTML = renderSegretaryHomeAside(data);
            break;

        default:
            main.innerHTML = renderMainHomeBase(titles);
            aside.innerHTML = renderAsideHomeBase(titles, data);
    }
}

function chooseHomeTemplate(user){
    if(user.role == "studente"){
        if(user.level == 2){
            return "studentRep";
        }
        return "student";
    }else if(user.role == "professore"){
        return "professor";
    }else if(user.role == "segreteria"){
        return "segretary";
    }
    return "base";
}

function renderMainHomeBase(titles){
    return `
    <article>
        <header>
            <h2>${titles.mainTitleOne}</h2>
        </header>
        <div id="campus-container"></div>
        <div class="campus-controls">
            <button class="prev-campus">←</button>
            <button class="next-campus">→</button>
        </div>
        <div id="campus-dots"></div>
    </article>

    <article>
        <header>
            <h2>${titles.mainTitleTwo}</h2>
        </header>
        <div id="map""></div>
    </article>
    `;
}

function renderAsideHomeBase(titles, data){
    let eventiHTML = "";
    let faqHTML = "";

    data.eventi.forEach(evento => {
        eventiHTML += `
        <li>
            <article>
                <h3>${evento.titolo}</h3>
                <p>${evento.data}</p>
                <p>${evento.descrizione}</p>
            </article>
        </li>
        `;
    });

    data.faq.forEach(faq => {
        faqHTML += `<li><a href="#">${faq.domanda}</a></li>`;
    });

    return `
    <ul>
        <li>
            <h2>${titles.asideTitleOne}</h2>
            <ul>${eventiHTML}</ul>
        </li>
        <li>
            <h2>${titles.asideTitleTwo}</h2>
            <ul>
                <li>
                    <h3>${titles.asideInnerTitleOne}</h3>
                    <a href="#">Forum</a>
                </li>
                <li>
                    <h3>${titles.asideInnerTitleTwo}</h3>
                    <ul>${faqHTML}</ul>
                </li>
            </ul>
        </li>
    </ul>
    `;
}

function renderMap(sedi){
    const mapDiv = document.getElementById("map");
    if(!mapDiv) return;

    const map = L.map('map').setView([44.2875081,11.8752501], 9);

    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
    }).addTo(map);

    const redIcon = new L.Icon({
        iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-red.png',
        shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',
        iconSize: [25, 41],
        iconAnchor: [12, 41],
        popupAnchor: [1, -34],
        shadowSize: [41, 41]
    });

    const blueIcon = new L.Icon({
        iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-blue.png',
        shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',
        iconSize: [25, 41],
        iconAnchor: [12, 41],
        popupAnchor: [1, -34],
        shadowSize: [41, 41]
    });

    let selectedMarker = null;

    sedi.forEach(item => {
        const marker = L.marker([item.lat, item.long], {icon: redIcon})
            .addTo(map)
            .bindPopup(`<b>${item.nome}</b>`);

        marker.on('click', () => {
            if(selectedMarker) selectedMarker.setIcon(redIcon);
            marker.setIcon(blueIcon);
            selectedMarker = marker;
        });
    });

    setTimeout(()=> map.invalidateSize(), 0);
}

function renderAsideHomeLogged(titles, data) {
    let html = `<ul>`;

    // --- Canali Seguiti ---
    if(data.canali_Seguiti && data.canali_Seguiti.length > 0){
        html += `<li>
            <h2>${titles.asideTitleOne}</h2>`;
        data.canali_Seguiti.forEach(forum => {
            html += `<h3>${forum.nome_forum}</h3><ul>`;
            forum.canali.forEach(canale => {
                html += `<li>${canale.nome_canale}</li>`;
            });
            html += `</ul>`;
        });
        html += `</li>`;
    }

    // Notifiche - PUNTO DI AGGANCIO
    html += `<li class="notify">
        <h2>${titles.asideTitleTwo}</h2>
    </li>`;

    html += `</ul>`;
    return html;
}

let timeRange = "week";
let selectedDate = new Date().toISOString().split("T")[0]; // YYYY-MM-DD

function renderMainHomeLogged(titles, data) {
    // Selettori range + data
    let empty = true;
    let html = `
    <div class="time-filter">
        <label>
            Visualizza:
            <select id="time-range">
                <option value="day">Giorno</option>
                <option value="week">Settimana</option>
                <option value="month">Mese</option>
            </select>
        </label>

        <label>
            Data:
            <select id="date-day"></select>
            <select id="date-month"></select>
            <select id="date-year"></select>
        </label>
    </div>
    `;

    // --- ORARI ---
    if(data.orario && data.orario.length > 0){
        empty = false;
        html += `<article>
            <header><h2>${titles.mainTitleOne}</h2></header>
            <ul>`;
        data.orario.forEach(item => {
            html += `<li>
                <strong>${new Date(item.Orario_inizio).toLocaleString()} - ${new Date(item.Orario_fine).toLocaleTimeString()}</strong>
                <p>${item.nome_materia} - ${item.nome_modulo}</p>
                <p>Prof: ${item.prof_titolare}</p>
                <p>Aula: ${item.nome_aula} (${item.codice_aula}) ${item.laboratorio ? "Lab" : ""}</p>
                <p>Sede: ${item.nome_sede}</p>
            </li>`;
        });
        html += `</ul></article>`;
    }

    // --- RICEVIMENTI ---
    if(data.ricevimenti && data.ricevimenti.length > 0){
        empty = false;
        html += `<article>
            <header><h2>${titles.mainTitleTwo}</h2></header>
            <ul>`;
        data.ricevimenti.forEach(item => {
            html += `<li>
                <strong>${new Date(item.Data_Inizio).toLocaleString()} - ${new Date(item.Data_Fine).toLocaleTimeString()}</strong>
                <p>Prof: ${item.nome_prof} ${item.cognome_prof}</p>
                <p>${item.online ? "Online" : `Ufficio: ${item.nome_ufficio} (${item.codice_ufficio})`}</p>
            </li>`;
        });
        html += `</ul></article>`;
    }

    // --- EVENTI ---
    if((data.eventi_staff && data.eventi_staff.length > 0) || (data.eventi_iscritto && data.eventi_iscritto.length > 0)){
        empty = false;
        html += `<article>
            <header><h2>${titles.mainTitleThree}</h2></header>`;

        // Eventi staff
        if(data.eventi_staff && data.eventi_staff.length > 0){
            html += `<h3>${titles.mainTitleTwoS1}</h3><ul>`;
            data.eventi_staff.forEach(item => {
                html += `<li>
                    <strong>${new Date(item.orario_inizio).toLocaleString()} - ${new Date(item.orario_fine).toLocaleTimeString()}</strong>
                    <p>${item.Nome}</p>
                    <p>Luogo: ${item.nome_luogo || "Online"} / Sede: ${item.nome_sede || "-"}</p>
                    <p>Ruolo: ${item.ruolo}</p>
                </li>`;
            });
            html += `</ul>`;
        }

        // Eventi iscritti
        if(data.eventi_iscritto && data.eventi_iscritto.length > 0){
            empty = false;
            html += `<h3>${titles.mainTitleTwoS2}</h3><ul>`;
            data.eventi_iscritto.forEach(item => {
                html += `<li>
                    <strong>${new Date(item.orario_inizio).toLocaleString()} - ${new Date(item.orario_fine).toLocaleTimeString()}</strong>
                    <p>${item.Nome}</p>
                    <p>Luogo: ${item.nome_luogo || "Online"} / Sede: ${item.nome_sede || "-"}</p>
                    <p>Ruolo: ${item.ruolo}</p>
                </li>`;
            });
            html += `</ul>`;
        }

        html += `</article>`;
    }

    if(empty){
        html += `<div class="easteregg">
        <img src="../Img/easteregg.png" alt="Sei Fortunato Nessun Impegno Oggi!"/>
        </div>`;
    }

    return html;
}

// ------------------- INIT DATE + RANGE SELECTORS -------------------
function initTimeFilters() {
    const rangeSelect = document.querySelector("#time-range");
    const daySelect = document.querySelector("#date-day");
    const monthSelect = document.querySelector("#date-month");
    const yearSelect = document.querySelector("#date-year");

    if(!rangeSelect || !daySelect || !monthSelect || !yearSelect) return;

    rangeSelect.value = timeRange;
    const date = new Date(selectedDate);
    const day = date.getDate();
    const month = date.getMonth() + 1;
    const year = date.getFullYear();

    // --- Anni 2000-2030 ---
    yearSelect.innerHTML = "";
    for(let y = 2000; y <= 2030; y++){
        yearSelect.innerHTML += `<option value="${y}" ${y===year?"selected":""}>${y}</option>`;
    }

    // --- Mesi 1-12 ---
    monthSelect.innerHTML = "";
    for(let m=1; m<=12; m++){
        monthSelect.innerHTML += `<option value="${m}" ${m===month?"selected":""}>${m.toString().padStart(2,"0")}</option>`;
    }

    // --- Giorni corretti per il mese ---
    const daysInMonth = new Date(year, month, 0).getDate(); // numero giorni mese
    daySelect.innerHTML = "";
    for(let d=1; d<=daysInMonth; d++){
        daySelect.innerHTML += `<option value="${d}" ${d===day?"selected":""}>${d.toString().padStart(2,"0")}</option>`;
    }

    // --- EVENT LISTENERS ---
    const updateSelectedDate = () => {
        // Aggiorna giorni se mese/anno cambia
        const newYear = parseInt(yearSelect.value);
        const newMonth = parseInt(monthSelect.value);
        const newDaysInMonth = new Date(newYear, newMonth, 0).getDate();
        if(daySelect.options.length !== newDaysInMonth){
            const currentDay = Math.min(parseInt(daySelect.value), newDaysInMonth);
            daySelect.innerHTML = "";
            for(let d=1; d<=newDaysInMonth; d++){
                daySelect.innerHTML += `<option value="${d}" ${d===currentDay?"selected":""}>${d.toString().padStart(2,"0")}</option>`;
            }
        }

        selectedDate = `${yearSelect.value}-${monthSelect.value.padStart(2,"0")}-${daySelect.value.padStart(2,"0")}`;
        loadHome();
    };

    rangeSelect.addEventListener("change", () => {
        timeRange = rangeSelect.value;
        loadHome();
    });

    daySelect.addEventListener("change", updateSelectedDate);
    monthSelect.addEventListener("change", updateSelectedDate);
    yearSelect.addEventListener("change", updateSelectedDate);
}

async function loadHome(){
    const params = new URLSearchParams({
        range: timeRange,
        date: selectedDate
    });

    const res = await fetch(`./Api/api-index.php?${params.toString()}`);
    const json = await res.json();

    const template = chooseHomeTemplate(json.user);

    renderHome(template, json.titles, json.data);

    if(Array.isArray(json.data.campus) && json.data.campus.length > 0){
        const slider = new CampusSlider(json.data.campus, {
            container: "#campus-container",
            dots: "#campus-dots"
        });
        slider.init();
    }

    if(typeof sedi !== "undefined" && Array.isArray(sedi)){
        renderMap(sedi);
    }

    if (typeof window.notificationManager === 'undefined') {
        window.notificationManager = new NotificationManager(
            json.data.notifiche,
            json.titles.asideTitleTwo  // ← PASSA IL TITOLO!
        );
        window.notificationManager.init();
    } else {
        window.notificationManager.updateNotifications(json.data.notifiche);
    }

    initTimeFilters();
}

loadHome();
