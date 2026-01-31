function chooseHomeTemplate(user){

    if(!user.logged){
        return "base";
    }

    if(user.role === "studente"){

        if(user.level >= 2){
            return "studentRep";
        }

        return "student";
    }

    if(user.role === "professore"){
        return "professor";
    }

    if(user.role === "segreteria"){
        return "segretary";
    }

    return "base";
}

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

        <!-- SLIDER -->
        <div id="campus-container"></div>

        <!-- CONTROLLI -->
        <div class="campus-controls">
            <button class="prev-campus">←</button>
            <button class="next-campus">→</button>
        </div>

        <!-- DOTS -->
        <div id="campus-dots"></div>
    </article>

    <article>
        <header>
            <h2>${titles.mainTitleTwo}</h2>
        </header>
        <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit...
        </p>
    </article>
    `;
}

function renderAsideHomeBase(titles, data){

    let eventiHTML = "";
    let faqHTML = "";

    // Eventi
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

    // FAQ
    data.faq.forEach(faq => {
        faqHTML += `<li><a href="#">${faq.domanda}</a></li>`;
    });

    return `
    <ul>

        <li>
            <h2>${titles.asideTitleOne}</h2>
            <ul>
                ${eventiHTML}
            </ul>
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
                    <ul>
                        ${faqHTML}
                    </ul>
                </li>
            </ul>
        </li>

    </ul>
    `;
}

async function loadHome(){

    const res = await fetch("./Api/api-index.php");
    const json = await res.json();

    const template = chooseHomeTemplate(json.user);

    renderHome(template, json.titles, json.data);

    // Inizializza slider solo se ci sono campus
    if(Array.isArray(json.data.campus) && json.data.campus.length > 0){
        const slider = new CampusSlider(json.data.campus, {
            container: "#campus-container",
            dots: "#campus-dots"
        });
        slider.init();
    }
}

loadHome();
