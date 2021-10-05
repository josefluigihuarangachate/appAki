function listado() {
    $.post(ruta + "Cliente", {cmd: 'listarturnoxreparto'}, function (json) {

        var div = "";
        var divm = "";
        var divt = "";
        var divn = "";
        var diverr = "";

        if (json['status'] == 'Ok') {
            var data = json['data'];
            data.sort(function (a, b) {
                return a.horaturno.localeCompare(b.horaturno);
            });
            if (data) {
                for (var i = 0; i < data.length; i++) {
                    div = "";
                    div += '<li>';
                    div += '<a href="#" onclick="getIdTurnoxRepartidor(' + data[i].idturnoxcliente + ',\'' + data[i].estadoturno + '\',\'' + (data[i].nombrecliente + ' ' + data[i].apellidopaternocliente) + '\',\'' + data[i].numerocelcliente + '\',\'' + data[i].direccion1cliente + '\',' + data[i].idcliente + ',\'' + data[i].numeroorden + '\');" class="item">';

                    var imgAtencion = "recojo";
                    if (data[i].estadoturno === 'Entrega') {
                        imgAtencion = "entrega";
                    } else if (data[i].estadoturno === 'Reclamo') {
                        imgAtencion = "entrega";
                    }

                    div += '<img src="design/aki/' + imgAtencion + '.png" alt="image" class="image">';
                    div += '<div class="in">';
                    div += '<div>';
                    if (data[i].estadoturno === 'Entrega' || data[i].estadoturno === 'Reclamo') {
                        div += '<label class="label fontSize-1">NR°. ORDEN: ' + data[i].numeroorden + '</label><br>';
                    }

                    div += '<label class="label fontSize-1">' + data[i].nombrecliente + ' ' + data[i].apellidopaternocliente + ' ' + data[i].apellidomaternocliente + '</label>';
                    div += '<header class="header fontSize-2">' + data[i].numerocelcliente + '</header>';
                    div += '<footer class="footer fontSize-3">' + data[i].direccion1cliente + '</footer>';
                    div += '</div>';
                    div += '<div>';

                    var hora = data[i].horaturno.split(':');

                    div += '<footer style="float: right;font-size: 11px;width: 100%;margin-left: 10px;color: #fff;font-weight: bold;" class="badge badge-danger">' + hora[0] + ":" + hora[1] + '</footer>';
                    div += '</div>';
                    div += '</div>';
                    div += '</a>';
                    div += '</li>';

                    if (data[i].puestoturno == 'Temprano') {
                        divm += "" + div;
                    } else if (data[i].puestoturno == 'Tarde') {
                        divt += "" + div;
                    } else if (data[i].puestoturno == 'Noche') {
                        divn += "" + div;
                    }
                }

                if (divm != null) {
                    document.getElementById("turnomaniana").innerHTML = divm;
                }

                if (divt != null) {
                    document.getElementById("turnotarde").innerHTML = divt;
                }


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
            document.getElementById("turnomaniana").innerHTML = "" + div;
            document.getElementById("turnotarde").innerHTML = "" + div;
        }
    });

}
listado();
setInterval(function () {
    listado();
}, 10000);

// CONSULTAR CLIENTES RECOJO Y REPARTOS
function getIdTurnoxRepartidor(id, estadoturno, nombrecliente, telefono, direccion, idcliente, numeroorden) {
    $.post(ruta + "Cliente", {idcliente: idcliente, idturnoxrepartidor: id, estadoturno: estadoturno, nombrecliente: nombrecliente, telefono: telefono, direccion: direccion, numeroorden: numeroorden, cmd: 'guardaridturnoxrepartidor'}, function (json) {
        console.log(json['msg']);
        location.href = "detalle";
    });
}
// FIN