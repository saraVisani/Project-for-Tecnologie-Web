function renderMainAmbiti(titles, ambiti){
    return `
        <article>
            <header>
                <h2>${titles.One}</h2>
            </header>
    ${ambiti.map(ambito => `
            <section class="ambito">
                <h3 style="color:${ambito.colore}">
                    ${ambito.nome}
                </h3>

                <ul class="corsi">
                    ${ambito.corsi.length > 0
                        ? ambito.corsi.map(corso => `
                            <li class="corso">
                                <strong style="color:${corso.colore ?? 'inherit'}">
                                    ${corso.nome}
                                </strong>
                                <p>${corso.descrizione}</p>
                            </li>
                        `).join('')
                        : `<li class="empty">Nessun corso disponibile</li>`
                    }
                </ul>
            </section>
        `).join('')}
        </article>
    `;
}

async function loadAmbiti(){

    const res = await fetch("./Api/api-ambiti.php");
    const json = await res.json();

    const main = document.querySelector("main");
    main.innerHTML = renderMainAmbiti(json.titles, json.data.ambiti);
}

loadAmbiti();
