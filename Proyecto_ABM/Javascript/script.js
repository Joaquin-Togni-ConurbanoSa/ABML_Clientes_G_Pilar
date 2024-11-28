
var map;
var marker;

function initMap() {
    if (navigator.geolocation) {
        // Obtener la ubicación del usuario
        navigator.geolocation.getCurrentPosition(function (position) {
            // Obtener las coordenadas del usuario
            var userLat = position.coords.latitude;
            var userLng = position.coords.longitude;

            // Crear el mapa centrado en la ubicación del usuario
            map = new google.maps.Map(document.getElementById("map"), {
                zoom: 12,
                center: { lat: userLat, lng: userLng }  // Centro del mapa en la ubicación del usuario
            });

            // Crear un marcador en la ubicación del usuario
            marker = new google.maps.Marker({
                position: { lat: userLat, lng: userLng },
                map: map,
                draggable: true  // Hacer el marcador arrastrable
            });

            // Actualizar las coordenadas cuando el marcador sea arrastrado
            google.maps.event.addListener(marker, 'dragend', function (event) {
                updateCoordinates(event.latLng);
            });

            // Actualizar las coordenadas cuando el usuario haga clic en el mapa
            google.maps.event.addListener(map, 'click', function (event) {
                marker.setPosition(event.latLng);
                updateCoordinates(event.latLng);
            });

            // También actualizar las coordenadas cuando la ubicación inicial sea obtenida
            updateCoordinates({ lat: userLat, lng: userLng });

        }, function () {
            // Si la geolocalización falla, mostrar un error
            alert("Error: No se pudo obtener la ubicación del usuario.");
        });
    } else {
        // Si el navegador no soporta geolocalización
        alert("Geolocalización no es soportada por este navegador.");
    }
}

// Función para actualizar el campo de texto con las coordenadas
function updateCoordinates(latLng) {
    document.getElementById("Txt_Coordenadas").value = latLng.lat() + ", " + latLng.lng();
}

var swiper = new Swiper(".slide-content", {
    slidesPerView: 3,
    spaceBetween: 25,
    loop: true,
    centerSlide: 'true',
    fade: 'true',
    grabCursor: 'true',
    pagination: {
        el: ".swiper-pagination",
        clickable: true,
        dynamicBullets: true,
    },
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
    },

    breakpoints: {
        0: {
            slidesPerView: 1,
        },
        520: {
            slidesPerView: 2,
        },
        950: {
            slidesPerView: 3,
        },
    },
});