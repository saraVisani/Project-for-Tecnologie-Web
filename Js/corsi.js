function renderMainCorsi(titles, corsi) {
    return `
        <article>
            <header>
                <h2>${titles.One}</h2>
            </header>

            <ul class="corsi-list">
                ${corsi.map(corso => `
                    <li class="corso">
                        <h3 style="color:${corso.colore ?? 'inherit'}">
                            ${corso.nome}
                        </h3>

                        <p>${corso.descrizione}</p>

                        <div class="sedi">
                            <strong>Sedi:</strong>
                            <ul>
                                ${corso.sedi.length > 0
                                    ? corso.sedi.map(sede => `
                                        <li>${sede.nome}</li>
                                    `).join('')
                                    : `<li>Nessuna sede</li>`
                                }
                            </ul>
                        </div>

                        <div class="materie">
                            <strong>Materie:</strong>
                            <ul>
                                ${corso.materie.length > 0
                                    ? corso.materie.map(mat => `
                                        <li>
                                            ${mat.nome}
                                            (CFU: ${mat.cfu},
                                            Periodo: ${mat.periodo},
                                            ${mat.obbligatorio ? 'Obbligatoria' : 'Opzionale'})
                                        </li>
                                    `).join('')
                                    : `<li>Nessuna materia</li>`
                                }
                            </ul>
                        </div>
                    </li>
                `).join('')}
            </ul>
        </article>
    `;
}

async function loadCorsi() {
    const res = await fetch("./Api/api-corsi.php");
    const json = await res.json();

    const main = document.querySelector("main");
    main.innerHTML = renderMainCorsi(
        json.titles,
        json.data.corso
    );
}

loadCorsi();
