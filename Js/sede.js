function renderMainSede(titles){
    return `
        <article>
            <header>
                <h2>${titles.One}</h2>
            </header>
            <div id="campus-container"></div>
            <div class="campus-controls">
                <button class="prev-campus">←</button>
                <button class="next-campus">→</button>
            </div>
            <div id="campus-dots"></div>
        </article>`;
}

async function loadSede(){

    const res = await fetch("./Api/api-sede.php");
    const json = await res.json();

    const main = document.querySelector("main");
    main.innerHTML = renderMainSede(json.titles);

    if(Array.isArray(json.data.campus) && json.data.campus.length > 0){
        const slider = new SedeSlider(json.data, json.titles, {
            container: "#campus-container",
            dots: "#campus-dots"
        });
        slider.init();
    }
}

loadSede();
