window.$_GET = new URLSearchParams(location.search);
var tipoturno = $_GET.get('tipoturno');

var latSanBorja = -77.00627;
var lonSanBorja = -12.09337;

var map = L.map('mapid'),
        realtime = L.realtime(ruta + 'Repartidor?cmd=ultimaubicacionrepartidor', {
            interval: 20 * 1000,
            // PONER ICOCNO - https://stackoverflow.com/a/28900293/16488926
            pointToLayer: function (feature, latlng) {

                return L.marker(latlng, {
                    'icon': L.icon({
                        iconUrl: '../../aki/carro_repartidor.png',
                        iconSize: [60, 60] // size of the icon
                    })
                });
            }
        }).addTo(map);

L.tileLayer("http://{s}.tile.osm.org/{z}/{x}/{y}.png", {
    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
}).addTo(map);

var arrClientes = function () {
    var tmp = [];
    $.ajax({
        'async': false,
        'type': "POST",
        'global': false,
        'dataType': 'json',
        'url': ruta + "Cliente",
        'data': {'cmd': "listarclienteturnoxreparto", tipoturno: tipoturno},
        'success': function (json) {
            if (json['status'] == 'Ok') {
                if (json['data']) {
                    var data = json['data'];
                    var estado = "";
                    var className = "";
                    for (var i = 0; i < data.length; i++) {
                        estado = "";
                        className = "classR";
                        if (data[i].estadoturno == 'Despacho') {
                            className = "classE";
                            data[i].estadoturno = 'Entrega';
                        }

                        tmp.push([
                            data[i].latitudcliente,
                            data[i].longitudcliente,
                            "<h4>Nombre del Cliente:</h4> " + data[i].nombrecliente + " " + data[i].apellidopaternocliente + " " + data[i].apellidomaternocliente
                                    + '<br>' + "<h4>Dirección:</h4> " + data[i].direccion1cliente
                                    + '<br>' + "<h4>Celular:</h4> " + data[i].numerocelcliente
                                    + '<br>' + "<h4>Estado:</h4> <center><span class='" + className + "'>" + data[i].estadoturno.toUpperCase() + "</span></center>"

                        ]);
                    }
                }
            }
        }
    });
    return tmp;
}();

var markers = arrClientes;

var Paquete = L.icon({
    iconUrl: '../../aki/paquete.png',
    iconSize: [35, 30]
});

var LavanderiaAki = L.icon({
    iconUrl: '../../aki/logo.png',
    iconSize: [35, 30]
});


//Loop through the markers array
for (var i = 0; i < markers.length; i++) {
    var lon = markers[i][1];
    var lat = markers[i][0];
    var popupText = markers[i][2];
    L.marker([lat, lon], {
        icon: Paquete // here assign the markerIcon var
    })
            .addTo(this.map)
            .bindPopup(popupText)
            .openPopup();

    if (i === parseInt(markers.length - 1)) {
        popupText = "LAVANDERIA AKI - SAN BORJA";
        L.marker([lonSanBorja, latSanBorja], {
            icon: LavanderiaAki // here assign the markerIcon var
        })
                .addTo(this.map)
                .bindPopup(popupText)
                .openPopup();
    }
}


realtime.on('update', function () {
    map.fitBounds(realtime.getBounds(), {maxZoom: 22});
    markers.push(
            [
                lonSanBorja,
                latSanBorja
            ],
            [
                realtime.getBounds()._northEast.lat,
                realtime.getBounds()._northEast.lng
            ]);
    map.fitBounds(markers);
});


setInterval(function () {
    // Print.postMessage('Hola soy luigi');
}, 5000);