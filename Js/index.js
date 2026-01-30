var dropdowns = document.querySelectorAll('.dropdown');

dropdowns.forEach(function (dropdown) {
var button = dropdown.querySelector('.dropbtn');

button.addEventListener('click', function (e) {
        e.stopPropagation();

        dropdowns.forEach(function (d) {
        if (d !== dropdown) {
            d.classList.remove('active');
        }
        });

        dropdown.classList.toggle('active');
    });
});

document.addEventListener('click', function () {
    dropdowns.forEach(function (d) {
        d.classList.remove('active');
    });
});
