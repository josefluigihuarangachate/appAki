window.$_GET = new URLSearchParams(location.search);
var tipoturno = $_GET.get('tipoturno');

var latSanBorja = -77.0061022;
var lonSanBorja = -12.0940738;

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
                        if (data[i].estadoturno == 'Entrega') {
                            className = "classE";
                            data[i].estadoturno = 'Entrega';
                        }

                        tmp.push([
                            data[i].latitudcliente,
                            data[i].longitudcliente,
                            "<h4>Nombre del Cliente:</h4> " + data[i].nombrecliente + " " + data[i].apellidopaternocliente + " " + data[i].apellidomaternocliente
                                    + '<br>' + "<h4>Dirección:</h4> " + data[i].direccion1cliente
                                    + '<br>' + "<h4>Celular:</h4> " + data[i].numerocelcliente
                                    + '<br>' + "<h4>Estado:</h4> <center><span class='" + className + "'>" + data[i].estadoturno.toUpperCase() + "</span></center>",
                            data[i].estadoturno.toUpperCase()
                        ]);
                    }
                }
            }
        }
    });
    return tmp;
}();

var markers = arrClientes;

var PaqueteEntrega = L.icon({
    iconUrl: '../../aki/entrega-circulo.png',
    iconSize: [30, 30]
});

var PaqueteRecojo = L.icon({
    iconUrl: '../../aki/recojo-circulo.png',
    iconSize: [30, 30]
});

var LavanderiaAki = L.icon({
    iconUrl: '../../aki/logo.png',
    iconSize: [35, 30]
});

//Loop through the markers array
var newMarkers = [];
for (var i = 0; i < markers.length; i++) {
    var lat = markers[i][0];
    var lon = markers[i][1];
    var popupText = markers[i][2];
    var tipo_despacho = markers[i][3];

    if (tipo_despacho === 'RECOJO') {
        L.marker([lat, lon], {
            icon: PaqueteRecojo // here assign the markerIcon var
        })
                .addTo(this.map)
                .bindPopup(popupText)
                .openPopup();
    } else if (tipo_despacho === 'ENTREGA') {
        L.marker([lat, lon], {
            icon: PaqueteEntrega // here assign the markerIcon var
        })
                .addTo(this.map)
                .bindPopup(popupText)
                .openPopup();
    }



    if (i === parseInt(markers.length - 1)) {
        popupText = "LAVANDERIA AKI - SAN BORJA";
        L.marker([lonSanBorja, latSanBorja], {
            icon: LavanderiaAki // here assign the markerIcon var
        })
                .addTo(this.map)
                .bindPopup(popupText)
                .openPopup();
    }
    newMarkers.push([
        lat,
        lon,
        popupText
    ]);
}
markers = newMarkers;



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