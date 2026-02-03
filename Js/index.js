function renderHome(template, titles, data){
    const main = document.querySelector("main");
    const aside = document.querySelector("aside");

    switch(template){
        case "student":
            main.innerHTML = renderStudentHome(titles);
            aside.innerHTML = renderStudentHomeAside(titles, data);
            break;
        case "studentRep":
            main.innerHTML = renderStudentRepHome(data);
            aside.innerHTML = renderStudentRepHomeAside(data);
            break;
        case "professor":
            main.innerHTML = renderProfessorHome(data);
            aside.innerHTML = renderProfessorHomeAside(data);
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

async function loadHome(){
    const res = await fetch("./Api/api-index.php");
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
}

loadHome();
