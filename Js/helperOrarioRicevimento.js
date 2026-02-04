function initTimeFilters(dayId, monthId, yearId, selectedDate, onChangeCallback) {
    const daySelect = document.querySelector(`#${dayId}`);
    const monthSelect = document.querySelector(`#${monthId}`);
    const yearSelect = document.querySelector(`#${yearId}`);
    if(!daySelect || !monthSelect || !yearSelect) return;

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
    const daysInMonth = new Date(year, month, 0).getDate();
    daySelect.innerHTML = "";
    for(let d=1; d<=daysInMonth; d++){
        daySelect.innerHTML += `<option value="${d}" ${d===day?"selected":""}>${d.toString().padStart(2,"0")}</option>`;
    }

    // --- EVENT LISTENERS ---
    const updateSelectedDate = () => {
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

        const newDate = `${yearSelect.value}-${monthSelect.value.padStart(2,"0")}-${daySelect.value.padStart(2,"0")}`;
        if(typeof onChangeCallback === "function") onChangeCallback(newDate);
    };

    yearSelect.addEventListener("change", updateSelectedDate);
    monthSelect.addEventListener("change", updateSelectedDate);
    daySelect.addEventListener("change", updateSelectedDate);
}
