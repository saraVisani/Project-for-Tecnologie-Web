class SediSlider {

    constructor(data, titles, config = {}) {

        // Lista campus
        this.campusList = Array.isArray(data.sedi) ? data.sedi : [];
        this.ambitiList = Array.isArray(data.ambiti) ? data.ambiti : [];
        this.corsoList = Array.isArray(data.corso) ? data.corso : [];
        this.materieList = Array.isArray(data.materie) ? data.materie : [];
        this.luoghiList = Array.isArray(data.luoghi) ? data.luoghi : [];
        this.classiList = Array.isArray(data.classi) ? data.classi : [];
        this.ufficiList = Array.isArray(data.uffici) ? data.uffici : [];
        this.professoriList = Array.isArray(data.prof) ? data.prof : [];
        this.segreteriaList = Array.isArray(data.segret) ? data.segret : [];
        this.index = 0;

        this.titles = titles;

        // Contenitori
        this.container = document.querySelector(config.container || "#campus-container");
        this.dotsContainer = document.querySelector(config.dots || "#campus-dots");

        this.touchStartX = 0;
        this.touchEndX = 0;
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
        const ambiti = this.ambitiList[this.index];
        const corso = this.corsoList[this.index];
        const materie = this.materieList[this.index];
        const luoghi = this.luoghiList[this.index];
        const classi = this.classiList[this.index];
        const uffici = this.ufficiList[this.index];
        const professor = this.professoriList[this.index];
        const segreteria = this.segreteriaList[this.index];

        this.container.innerHTML = `
            <h2>Sede di ${campus.nome}</h2>
            <p>${campus.descrizione ?? ""}</p>
            <img src="../Img/${campus.img}" alt="${campus.imgDesc}"/>
            <ul>
            <li>
                <h3>${titles.ambiti}</h3>
                ${ambiti}
            </li>
            <li>
                <h3>${titles.corso}</h3>
                <p></p>
            </li>
            <li>
                <h3>${titles.materie}</h3>
                <p></p>
            </li>
            <li>
                <h3>${titles.luoghi}</h3>
                <p></p>
            </li>
            <li>
                <h3>${titles.classi}</h3>
                <p></p>
            </li>
            <li>
                <h3>${titles.uffici}</h3>
                <p></p>
            </li>
            <li>
                <h3>${titles.professor}</h3>
                <p></p>
            </li>
            <li>
                <h3>${titles.segreteria}</h3>
                <p></p>
            </li>
        </ul>
        `;

        this.updateDots();
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
}
