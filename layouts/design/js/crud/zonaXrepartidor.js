// LISTADO
function listado() {
    document.getElementById("appCapsule").innerHTML = "";
    $.post(ruta + "Zona", {cmd: 'listarzonas'}, function (json) {
        var div = "";
        if (json['status'] == 'Ok') {
            var datos = json['data'];
            if (datos) {
                for (var i = 0; i < datos.length; i++) {

                    var photoZone = datos[i].imagenzona;
                    if (photoZone == "") {
                        photoZone = "zona" + datos[i].idzona + ".png";
                    }

                    div += '<div class="section mt-2">';
                    div += '<div class="card">';
                    div += '<img src="design/aki/' + photoZone + '" class="card-img-top" alt="image">';
                    div += '<div class="card-body">';
                    div += '<h5 class="card-title">' + datos[i].puestozona + '</h5>';
                    div += '<h6 class="card-subtitle mb-1">' + datos[i].nombrezona + '</h6>';
                    div += '<p class="card-text">';
                    div += datos[i].descripcionzona;
                    div += '</p>';
                    div += '</div>';
                    div += '<div class="card-footer text-muted">';
                    div += '<a href="cliente" class="btn btn-primary mycolor" style="width: 100%;" onclick="getIdZone(' + datos[i].idzona + ');">DESPACHAR / RECOGER &nbsp;&nbsp;<ion-icon name="arrow-forward-outline"></ion-icon></a>';
                    div += '</div>';
                    div += '</div>';
                    div += '</div>';
                }
                document.getElementById("appCapsule").innerHTML = div;
            }
        } else {
            div += '<div class="section mt-2">';
            div += '<div class="card">';
            div += '<div class="card-body">';
            div += '<div>';
            div += '<center>';
            div += json['msg'];
            div += '</center>';
            div += '</div>';
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

