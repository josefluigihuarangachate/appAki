// LISTADO
function listado() {
    document.getElementById("appCapsule").innerHTML = "";
    $.post(ruta + "Zona", {cmd: 'listarzonas'}, function (json) {
        var div = "";
        if (json['status'] == 'Ok') {
            var datos = json['data'];
            if (datos) {
                for (var i = 0; i < datos.length; i++) {
                    div += '<a href="cliente" class="item" onclick="getIdZone(' + datos[i].idzona + ');">';
                    div += '<div class="detail">';
                    div += '<img src="design/aki/repartidor.jpg" alt="img" class="image-block imaged w48">';
                    div += '<div>';
                    div += '<strong>' + datos[i].puestozona + '</strong>';
                    div += '<p>' + datos[i].nombrezona + '</p>';
                    div += '</div>';
                    div += '</div>';
                    div += '<div class="right">';
                    div += '<div class="price text-danger">';
                    div += '<span class="badge badge-danger">';
                    div += '<ion-icon name="arrow-forward-outline"></ion-icon>';
                    div += '</span>';
                    div += '</div>';
                    div += '</div>';
                    div += '</a>';
                }
                document.getElementById("appCapsule").innerHTML = div;
            }
        } else {
            div += '<div class="card">';
            div += '<div class="card-body">';
            div += '<div>';
            div += '<center>';
            div += json['msg'];
            div += '</center>';
            div += '</div>';
            div += '</div>';
            div += '</div>';
            document.getElementById("appCapsule").innerHTML = div;
        }
    });

}
listado();
// FIN

// CONSULTAR CLIENTES RECOJO Y REPARTOS
function getIdZone(id) {
    $.post(ruta + "Zona", {idzone: id, cmd: 'guardaridzona'}, function (json) {
        console.log(json['msg']);
    });
}
// FIN

