class CampusSlider {

    constructor(campusList, config = {}) {
        // Lista campus
        this.campusList = Array.isArray(campusList) ? campusList : [];
        this.index = 0;

        // Contenitori
        this.container = document.querySelector(config.container || "#campus-container");
        this.dotsContainer = document.querySelector(config.dots || "#campus-dots");

        // Swipe mobile
        this.touchStartX = 0;
        this.touchEndX = 0;

        // Icone per mappa
        this.redIcon = new L.Icon({
            iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-red.png',
            shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',
            iconSize: [25, 41],
            iconAnchor: [12, 41],
            popupAnchor: [1, -34],
            shadowSize: [41, 41]
        });

        this.blueIcon = new L.Icon({
            iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-blue.png',
            shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',
            iconSize: [25, 41],
            iconAnchor: [12, 41],
            popupAnchor: [1, -34],
            shadowSize: [41, 41]
        });
    }

    /* ================= INIT ================= */
    init() {
        if (!this.campusList.length) {
            if(this.container) this.container.innerHTML = "<p>Nessun campus disponibile</p>";
            return;
        }

        this.render();
        this.createDots();
        this.bindButtons();
        this.bindSwipe();
    }

    /* ================= RENDER ================= */
    render(direction = "right") {
        if(!this.container) return;

        this.container.classList.remove("slide-left", "slide-right");
        void this.container.offsetWidth; // forza reflow

        this.container.classList.add(
            direction === "right" ? "slide-right" : "slide-left"
        );

        const campus = this.campusList[this.index];

        this.container.innerHTML = `
            <h3>Campus di ${campus.nome}</h3>
            <p>${campus.descrizione ?? ""}</p>
            <div class="campus-img-wrapper">
                <button class="read-more" data-campus-id="${campus.id ?? ''}">
                    Leggi di più
                </button>
                <img class="campus-img"
                    src="${UPLOAD_DIR}${campus.Path}"
                    alt="${campus.Descrizione_Img}"/>
            </div>
        `;

        // Aggiorna variabile globale
        window.selectedCampusIndex = this.index;

        // Listener sul read-more
        const readMoreBtn = this.container.querySelector(".read-more");
        if(readMoreBtn) {
            readMoreBtn.addEventListener("click", () => {
                const id = campus.id;
                window.location.href = `campus.php?id=${id}`;
            });
        }

        this.updateDots();

        // Aggiorna marker sulla mappa
        if(window.campusMapMarkers && window.campusMapMarkers.length) {
            window.campusMapMarkers.forEach(marker => marker.setIcon(this.redIcon));
            if(window.campusMapMarkers[this.index]){
                window.campusMapMarkers[this.index].setIcon(this.blueIcon);
                window.campusMap.panTo(window.campusMapMarkers[this.index].getLatLng());
                window.campusMapMarkers[this.index].openPopup();
            }
        }
    }

    /* ================= NAVIGATION ================= */
    next() {
        this.index = (this.index + 1) % this.campusList.length;
        this.render("right");
    }

    prev() {
        this.index = (this.index - 1 + this.campusList.length) % this.campusList.length;
        this.render("left");
    }

    /* ================= BUTTONS ================= */
    bindButtons() {
        document.querySelector(".next-campus")?.addEventListener("click", () => this.next());
        document.querySelector(".prev-campus")?.addEventListener("click", () => this.prev());
    }

    /* ================= DOTS ================= */
    createDots() {
        if (!this.dotsContainer) return;

        this.dotsContainer.innerHTML = "";

        this.campusList.forEach((_, i) => {
            const dot = document.createElement("span");
            dot.classList.add("dot");

            dot.addEventListener("click", () => {
                this.index = i;
                this.render();
            });

            this.dotsContainer.appendChild(dot);
        });

        this.updateDots();
    }

    updateDots() {
        if (!this.dotsContainer) return;

        [...this.dotsContainer.children].forEach((dot, i) => {
            dot.classList.toggle("active", i === this.index);
        });
    }

    /* ================= SWIPE MOBILE ================= */
    bindSwipe() {
        this.container.addEventListener("touchstart", e => {
            this.touchStartX = e.changedTouches[0].screenX;
        });

        this.container.addEventListener("touchend", e => {
            this.touchEndX = e.changedTouches[0].screenX;
            this.handleSwipe();
        });
    }

    handleSwipe() {
        if (this.touchEndX < this.touchStartX - 50) this.next();
        if (this.touchEndX > this.touchStartX + 50) this.prev();
    }

    /* ================= SELEZIONE DAL MARKER ================= */
    selectCampusByIndex(index) {
        if (index < 0 || index >= this.campusList.length) return;
        this.index = index;
        this.render();
    }
}
