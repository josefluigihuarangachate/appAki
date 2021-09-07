<style>
    .form-group.basic .form-control, .form-group.basic .custom-select {
        background: transparent;
        border: none;
        border-bottom: 1px solid #DCDCE9;
        padding: 0 0px 0 0;
        border-radius: 0;
        height: 40px;
        color: #27173E;
        font-size: 15px;
    }
    .addOrden{
        position: fixed;
        z-index: 9;
        bottom: 77px;
        right: 15px;
        font-size: 21px;
        border-radius: 50px;
        padding: 25px;
        width: 60px;
        height: 60px;
        opacity: 0.2;
    }
    .addOrden:hover{
        opacity: 1;
    }
    .hideButton{
        display: none !important;
    }
    .modal-backdrop.show{
        z-index: 9991 !important;
    }
    .modal{
        z-index: 9992 !important;
    }
    .observacion{
        resize: none !important;
        border: 1px solid #ccc !important;
        padding: 15px !important;
        margin-top: 10px !important;
    }
    .ocultarid{
        color: #fff;
        border: 1px solid transparent;
        height: 0px;
        width: 0px;
        padding: 0px;
        margin: 0px;
    }
    .div-contenedor {
        position: absolute;
        top:0;
        left:0;
        right:0;
        bottom:0;
        margin: auto;
        height: 200px;
        width: 100%;
    }
    .div-contenedor .centrar{
        text-align: center;
    }
</style>

<div class="card" style="margin-bottom: 18px;text-align: center;">
    <div class="card-body">
        <div class="row">
            <div class="col">
                Hay <label id="totaldeitems" name="totaldeitems">0 orden</label>
            </div>
            <div class="col">
                Total : S/. <label id="pagototal" name="pagototal">0.00</label>
            </div>
        </div>
    </div>
</div>

<form action="javascript:void(0)" method="POST" enctype="multipart/form-data" id="formData" name="formData">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mb-3">
            <div class="card h-100">
                <div class="card-body">                
                    <div class="row">
                        <div class="col-12">
                            <strong>
                                <a href="#" class="text-secondary">SERVICIO:</a>&nbsp;&nbsp;
                                <div class="form-group basic">
                                    <div class="input-wrapper">
                                        <select class="form-control" id="servicio" name="servicio" onchange="obtenerPrenda(this.value);">                                            
                                        </select>
                                        <input type="hidden" hidden="hidden" name="diasservicios" id="diasservicios" value="0">
                                    </div>
                                </div>
                            </strong>
                        </div>
                    </div>                    
                </div>
            </div>
        </div>
        <div id="itemsservicios" name="itemsservicios"></div>
    </div>
</form>
<div style="margin-bottom: 10px;"></div>

<div style="position: fixed;border-radius: 0px;z-index: 9991;bottom: 0px;left: 0px;height: 56px;width: 100%;font-size: 18px;">
    <div class="row">                             
        <div class="col-10" style="padding-right: 0px;margin-right: 0px;">
            <button class="btn btn-success" style="width: 100%;border-radius: 0px;height: 56px;" data-bs-toggle="modal" data-bs-target="#DialogForm" onclick="obtenerdias();">
                CONFIRMAR RECEPCIÓN
            </button>
        </div>
        <div class="col-2" style="padding-left: 0px;margin-left: 0px;padding-right: 0px;margin-right: 0px;right: 0px;position: absolute;">
            <label class="btn btn-danger ir-arriba-add" style="width: 100%;border-radius: 0px;height: 56px;padding: 0px;" onclick="addItem();">
                <center>
                    <ion-icon name="add-outline"></ion-icon>
                </center>
            </label>      
        </div>
    </div>
</div>

<!-- Dialog Form -->
<div class="modal fade dialogbox hide" id="DialogForm" name="DialogForm" data-bs-backdrop="static" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">CONFIRMAR ENTREGA</h5>
            </div>
            <div class="modal-body text-start mb-2">
                <div class="form-group basic">                    
                    <div class="input-wrapper">   
                        <div class="input-wrapper">
                            <div class="input-group mb-12">
                                <input type="hidden" hidden="hidden" class="form-control" readonly="readonly" style="text-align: center;" min="1" value="0" id="totaldias" name="totaldias" placeholder="TOTAL DE DIAS">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group basic">
                    <label class="label" for="text1">FECHA DE ENTREGA</label>
                    <div class="input-group mb-12">
                        <div class="input-group-prepend">
                            <button type="button" class="form-control btn btn-outline-danger" id="menosfecha" name="menosfecha" onclick="sumaryrestarFecha('-');" style="border-radius: 5px 0px 0px 5px;padding-right: 15px;padding-left: 15px;">-</button>
                        </div>
                        <input type="date" class="form-control" readonly="readonly" style="text-align: center;" id="fechatotalmax" name="fechatotalmax" placeholder="FECHA ENTREGA">
                        <input type="date" class="form-control" readonly="readonly" hidden="hidden" style="text-align: center;" id="fechatotalmin" name="fechatotalmin" placeholder="FECHA ENTREGA MINIMO">
                        <div class="input-group-append">
                            <button type="button" class="form-control btn btn-outline-info" id="masfecha" name="masfecha" onclick="sumaryrestarFecha('+');" style="border-radius: 0px 5px 5px 0px;padding-right: 15px;padding-left: 15px;">+</button>
                        </div>
                    </div>
                    <div class="input-info">El dia <label id="nombredia" name="nombredia"></label> es la fecha de entrega</div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="btn-inline">
                    <button type="button" class="btn btn-text-danger" data-bs-dismiss="modal" id="cancelarfechaentrega" name="cancelarfechaentrega">CANCELAR</button>
                    <button type="button" class="btn btn-text-primary" id="enviarDatos" name="enviarDatos" data-bs-toggle="modal" data-bs-target="#ModalPrintTicket">GUARDAR</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- * Dialog Form -->

<!-- Modal Imprimir Ticket -->
<div class="modal fade modalbox" id="ModalPrintTicket" tabindex="-1" role="dialog" style="z-index: 9999;">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="padding-top: 0px !important;">
            <div class="modal-body">
                <a href="javascript:;" class="btn btn-close" data-bs-dismiss="modal" style="float: right;border-radius: 50px;" id="closeTicket" name="closeTicket">x</a>
                <div id="htmlprint" name="htmlprint">                    
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Fin Modal Imprimir Ticket -->

<span class="ir-arriba icon-arrow-up2">
    <ion-icon name="chevron-up-outline"></ion-icon>
</span>

<script>
    function imprSelec(nombre, idimage) {
        var imgcontenido = document.getElementById(idimage).innerHTML;
        var contenido = document.getElementById(nombre).innerHTML;
        var contenidoOriginal = document.body.innerHTML;

        document.body.innerHTML = imgcontenido;
        document.body.innerHTML = contenido;

        window.print();

        document.body.innerHTML = contenidoOriginal;
    }
</script>




<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<style>
    .choose::-webkit-file-upload-button {
        color: white;
        display: inline-block;
        background: #1CB6E0;
        border: none;
        padding: 7px 15px;
        font-weight: 700;
        border-radius: 3px;
        white-space: nowrap;
        cursor: pointer;
        font-size: 10pt;
    }
</style>

<script>

    var ordenes = 0;
    var subordenes = 0;
    var idestados = 0;

    var contarordenes = 0;
    var opcPrenda = "";
    var idsunique = [];

    // OPCIONES DE SERVICIOS
    var opcServicio = function () {
        var tmp = null;
        $.ajax({
            'async': false,
            'type': "GET",
            'global': false,
            'dataType': 'json',
            'url': ruta + "Servicio",
            'data': {'cmd': "listaservicios"},
            'success': function (json) {
                if (json['status'] == 'Ok') {
                    if (json['data']) {
                        var datos = json['data'];
                        tmp = "<option value='' hidden='hidden'>SERVICIOS</option>";
                        for (var i = 0; i < datos.length; i++) {
                            tmp += "<option name-service='" + datos[i].nombreservicio.toUpperCase() + "' data-rc='" + datos[i].diasservicio + "' value='" + datos[i].idservicio + "'>" + datos[i].nombreservicio.toUpperCase() + "</option>";
                        }
                    }
                }
            }
        });
        return tmp;
    }();
    document.getElementById("servicio").innerHTML = opcServicio;
    // FIN OPCIONES DE SERVICIOS

    // OBTENER DIAS POR SERVICIOS
    // Ejm: https://stackoverflow.com/a/38519877/16488926
    var seleccionarServicio = document.getElementById("servicio");
    seleccionarServicio.onchange = function () {
        document.getElementById("itemsservicios").innerHTML = "";
        document.getElementById("pagototal").innerHTML = "0.00";

        var dias = $("#servicio").find("option:selected").attr('data-rc');
        document.getElementById("diasservicios").value = dias;

        // PONGO A LAS ORDENES Y A LAS ORDENES QUE CONTE EN CERO
        contarordenes = 0;
        ordenes = 0;
        idsunique = [];
        validarOrdenes();
    };
    // FIN OBTENER DIAS POR SERVICIOS

    // OBTENER LISTADO DE PRENDAS POR SERVICIO
    function obtenerPrenda() {
        var idServicio = document.getElementById("servicio").value;
        var tmp = null;
        $.ajax({
            'async': false,
            'type': "GET",
            'global': false,
            'dataType': 'json',
            'url': ruta + "Articulo",
            'data': {'cmd': "listaarticuloxservicio", idservicio: idServicio},
            'success': function (json) {
                if (json['status'] == 'Ok') {
                    if (json['data']) {
                        var datos = json['data'];
                        tmp = "<option value='' hidden='hidden'>PRENDAS</option>";
                        for (var i = 0; i < datos.length; i++) {
                            tmp += "<option flkpak='" + datos[i].cantidadprendas + "' precio='" + datos[i].precioarticulo + "' value='" + datos[i].idarticulo + "'>" + datos[i].nombrearticulo.toUpperCase() + "</option>";
                        }
                    }
                }
            }
        });
        return tmp;
    }
    // FIN OBTENER LISTADO DE PRENDAS POR SERVICIO

    // OBTENER PRECIO POR LA PRENDA
    // Ejm: https://stackoverflow.com/a/25430562/16488926
    function obtenerPrecio(idprenda) {
        var precio = $('#prenda' + idprenda + ' option:selected').attr('precio');
        //var flkpak = $('#prenda' + idprenda + ' option:selected').attr('flkpak');

        if (precio === undefined || precio === null) {
            precio = "0.00";
        }

        document.getElementById("precio" + idprenda).value = parseFloat(precio).toFixed(2);
        //document.getElementById("realprecio" + idprenda).value = parseFloat(precio).toFixed(2);
        sumarPrecios();

        //document.getElementById("flkpak" + idprenda).value = flkpak;
    }
    // FIN OBTENER PRECIO POR LA PRENDA

    // OBTENER COLOR
    function Color() {
        return opcColor = function () {
            var tmp = null;
            $.ajax({
                'async': false,
                'type': "GET",
                'global': false,
                'dataType': 'json',
                'url': ruta + "Color",
                'data': {'cmd': "listacolor"},
                'success': function (json) {
                    if (json['status'] == 'Ok') {
                        if (json['data']) {
                            var datos = json['data'];
                            tmp = "<option value='' hidden='hidden'>COLOR</option>";
                            for (var i = 0; i < datos.length; i++) {
                                tmp += '<option selected="selected" value="' + datos[i].nombrecolor.toUpperCase() + '">' + datos[i].nombrecolor.toUpperCase() + '</option>';
                            }
                        }
                    }
                }
            });
            return tmp;
        }();
    }
    // FIN OBTENER COLOR

    // OBTENER MARCA
    function Marca() {
        return opcMarca = function () {
            var tmp = null;
            $.ajax({
                'async': false,
                'type': "GET",
                'global': false,
                'dataType': 'json',
                'url': ruta + "Marca",
                'data': {'cmd': "listamarca"},
                'success': function (json) {
                    if (json['status'] == 'Ok') {
                        if (json['data']) {
                            var datos = json['data'];
                            tmp = "<option value='' hidden='hidden'>MARCA</option>";
                            for (var i = 0; i < datos.length; i++) {
                                tmp += '<option selected="selected" value="' + datos[i].nombremarca.toUpperCase() + '">' + datos[i].nombremarca.toUpperCase() + '</option>';
                            }
                        }
                    }
                }
            });
            return tmp;
        }();
    }
    // FIN OBTENER MARCA

    // OPCIONES DE ESTADOS
    function opcionesEstado(uuid) {
        return chkEstadoPrenda = function () {
            var tmp = '';
            $.ajax({
                'async': false,
                'type': "GET",
                'global': false,
                'dataType': 'json',
                'url': ruta + "EstadoPrenda",
                'data': {'cmd': "listaestadoprenda"},
                'success': function (json) {
                    if (json['status'] == 'Ok') {
                        if (json['data']) {
                            var datos = json['data'];
                            idestados = datos.length;
                            for (var i = 0; i < datos.length; i++) {
                                tmp += '<div class="">';
                                // AGREGAR FUNCION : chk1 = el id del check box _1,_2 = id del estado de la prenda
                                tmp += '<input type="checkbox" style="transform : scale(1.7);margin-right: 14px;" id="estado' + uuid + '_' + i + '" name="estado' + uuid + '[]" value="' + datos[i].nombreprenda + '">';
                                tmp += '<label class="form-check-label">' + datos[i].nombreprenda.toUpperCase() + '</label>';
                                tmp += '</div>';
                            }
                        }
                    }
                }
            });
            return tmp;
        }();
    }
    // FIN OPCIONES DE ESTADOS



    // PARA CONTAR CUANTAS ARCHIVOS/IMAGENES SE CARGARON
    // EJM: https://stackoverflow.com/a/20439068/16488926
    function contarImagenes(id) {
        var numFiles = $("#archivo" + id)[0].files.length;
        if (numFiles === 0) {
            numFiles = "";
        }
        document.getElementById("cantidadarchivos" + id).innerHTML = "";
        document.getElementById("cantidadarchivos" + id).innerHTML = numFiles;
    }
    // FIN PARA CONTAR CUANTAS ARCHIVOS/IMAGENES SE CARGARON

    // PARA CONTAR CUANTOS AUDIOS SE CARGARON
    // EJM: https://stackoverflow.com/a/20439068/16488926
    function contarAudios(id) {
        var numFiles = $("#audio" + id)[0].files.length;
        if (numFiles === 0) {
            numFiles = "";
        }
        document.getElementById("cantidadaudio" + id).innerHTML = "";
        document.getElementById("cantidadaudio" + id).innerHTML = numFiles;
    }

    // SIRVE PARA SUMAR Y RESTAR DIAS Y FECHA EN EL INPUT NUMBER DIAS
    function sumaryrestarcantidad(id, signo) {
        var operando = 0;
        var cantidad = document.getElementById('cantidad' + id).value;

        if (cantidad <= 0) {
            cantidad = 1;
            document.getElementById('cantidad' + id).value = 1;
        } else if (signo == '+') {
            operando = (parseInt(cantidad) + parseInt(1));
            if (operando <= 0) {
                operando = 1;
            } else {
                document.getElementById('cantidad' + id).value = operando;
            }
        } else if (signo == '-') {
            operando = (parseInt(cantidad) - parseInt(1));
            if (operando <= 0) {
                operando = 1;
            }
            document.getElementById('cantidad' + id).value = operando;
        }
    }
    // FIN SIRVE PARA SUMAR Y RESTAR DIAS Y FECHA EN EL INPUT NUMBER DIAS

    // ELIMINAR ORDEN POR ID DE ORDEN
    function validarOrdenes() {
        var msg = "";

        // VALIDO SI LAS ORDENES SON MENORES A CERO O IGUAL A CERO
        if (contarordenes <= 0) {
            contarordenes = 0;
            ordenes = 0;
        }

        if (1 === contarordenes) {
            msg = "1 orden";
        } else if (2 <= contarordenes) {
            msg = contarordenes + " ordenes";
        } else {
            msg = "0 orden";
        }

        document.getElementById("totaldeitems").innerHTML = "";
        document.getElementById("totaldeitems").innerHTML = msg;

        //console.log("AGREGAR Y ELIMINAR ORDENES : " + ordenes);
        //console.log("CONTAR ORDENES : " + contarordenes);
    }
    // FIN ELIMINAR ORDEN POR ID DE ORDEN

    // ELIMINAR ORDEN POR ID DE ORDEN
    function removeItem(idorden) {
        var elem = document.getElementById("item" + idorden);
        elem.remove();
        contarordenes = contarordenes - 1;
        validarOrdenes();
    }
    // FIN ELIMINAR ORDEN POR ID DE ORDEN

    // AGREGAR MAS ORDENES
    var html_color_marca = "";
    function addItem() {
        var idservicio = document.getElementById("servicio").value;
        var nombre_servicio = $("#servicio").find("option:selected").attr('name-service');

        if (idservicio.trim() != "") {
            $('body, html').animate({
                scrollTop: '250px'
            }, 200);

            contarordenes = contarordenes + 1;
            ordenes = ordenes + 1;
            validarOrdenes();

            try {
                if (ordenes >= 1) {
                    for (var cd = 1; cd < ordenes; cd++) {
                        var myElement = document.getElementById("card" + cd);
                        if (myElement) {
                            document.getElementById("card" + cd).style.backgroundColor = "#fce3e3";
                        }
                    }
                }
            } catch (e) {
            }

//            html_color_marca = "";
//
//            // SI NO ES IGUAL A PROMOCION MOSTRAR COLOR Y MARCA
//            if (
//                    (nombre_servicio != 'PROMOCIONES' || nombre_servicio != 'PROMOCION') && idservicio != 1
//                    ) {
//                html_color_marca = `<div class="row">                        
//                                <div class="col-6">
//                                    <div class="form-group basic">
//                                        <div class="input-wrapper">   
//                                            <div class="input-wrapper">
//                                                <strong>                        
//                                                    <a href="#" class="text-secondary">COLOR:</a>
//                                                </strong>
//                                                <select class="search-live add-new-tags tagsColor form-control" id="color${contarordenes}" name="color${contarordenes}" data-select2-tags="true" onchange="addnewTagsColor(${contarordenes});">${Color()}</select>
//                                            </div>
//                                        </div>
//                                    </div>
//                                </div>                    
//                                <div class="col-6">
//                                    <div class="form-group basic">
//                                        <div class="input-wrapper">   
//                                            <div class="input-wrapper">
//                                                <strong>                        
//                                                    <a href="#" class="text-secondary">MARCA:</a>
//                                                </strong>
//                                                <select class="search-live add-new-tags tagsMarca form-control" id="marca${contarordenes}" name="marca${contarordenes}" data-select2-tags="true" onchange="addnewTagsMarca(${contarordenes});">${Marca()}</select>
//                                            </div>
//                                        </div>
//                                    </div>
//                                </div>
//                            </div>`;
//            }

            document.querySelector('#itemsservicios').insertAdjacentHTML('afterbegin', `
        
            <div id="item${contarordenes}" name="item${contarordenes}" style="margin-bottom: 15px;">
                <div class="card" id='card${contarordenes}' name='card${contarordenes}'>
                    <button type="button" class="btn-close botoneliminarorden" aria-label="Close" onclick="removeItem(${contarordenes});" style="z-index: 9;"></button>
                    <div class="card-body">              
                        <div style="margin-bottom: 15px;"></div>
                        <div class="row"> 
                            <div class="col-12">
                                <div class="form-group basic">
                                    <div class="input-wrapper">   
                                        <div class="input-wrapper">
                                            <select class="search-live form-control" id="prenda${contarordenes}" name="prenda${contarordenes}" onchange="obtenerPrecio(${contarordenes});piezasPrendas(${contarordenes});">
                                                    ${obtenerPrenda()}
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">                             
                            <div class="col-6">
                                <div class="form-group basic">
                                    <div class="input-wrapper">
                                        <strong>
                                            <a href="#" class="text-secondary">PRECIO DEL SERVICIO:</a>
                                        </strong>        
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group basic">
                                    <div class="input-wrapper">
                                        <input type="text" class="form-control" style='text-align: center;' id="precio${contarordenes}" name="precio${contarordenes}" readonly="readonly" placeholder="PRECIO" value="0.00">
                                    </div>
                                </div>
                            </div>                
                        </div>
                        <div id="items${contarordenes}" name="items${contarordenes}">                            
                        </div>
                    </div>
                </div>
            </div>
        `);
            $("#prenda" + contarordenes).select2().val(null).trigger("change");
            //$("#color" + contarordenes).select2().val(null).trigger("change");
            //$("#marca" + contarordenes).select2().val(null).trigger("change");
        }
    }
    // FIN AGREGAR MAS ORDENES

    // OBTENER PIEZAS POR PRENDA
    function piezasPrendas(id) {
        var idprenda = document.getElementById("prenda" + id).value;
        var idservicio = document.getElementById("servicio").value;
        var nombre_servicio = $("#servicio").find("option:selected").attr('name-service');
        document.querySelector("#items" + id).innerHTML = "";

        if (nombre_servicio === 'PROMOCIONES' || nombre_servicio === 'PROMOCION' || idservicio === 1) {
            if (idprenda != "") {
                $.ajax({
                    'async': false,
                    'type': "GET",
                    'global': false,
                    'dataType': 'json',
                    'url': ruta + "Promocion",
                    'data': {'cmd': "listapiezasxpromocion", 'idprenda': idprenda},
                    'success': function (json) {
                        if (json['status'] == 'Ok') {
                            var valueidprenda = document.getElementById("prenda" + id).value;
                            var datos = json['data'];
                            var cantPromociones = json['cantpromocion'];
                            var uuid = "";
                            var html = "";
                            var idetiquetas = [];
                            for (var p = 0; p < cantPromociones; p++) {
                                uuid = generate();
                                var prendaxpromocion = datos[p].subarticulos;

                                // IDPRENDA - EN ESTE CASO LA PROMOCION
                                html += "<input type='text' id='subidprenda" + uuid + "' name='subidprenda" + uuid + "' value='" + valueidprenda + "' class='ocultarid'>";

                                // PROMOCION
                                html += '<div class="form-group basic">';
                                html += '<div class="input-wrapper">';
                                html += '<strong>';
                                html += '<a href="javascript:void(0)" class="text-secondary">PRENDAS:</a>';
                                html += '</strong>';
                                html += "<select class='search-live form-control' id='pieza" + uuid + "' name='pieza" + uuid + "' onchange='promocionPrecio(\"" + uuid + "\",\"" + contarordenes + "\");'>";
                                // PRENDAS PARA PROMOCION
                                html += "<option value='' hidden='hidden'>PRENDAS</option>";
                                for (var r = 0; r < prendaxpromocion.length; r++) {
                                    html += "<option price='" + prendaxpromocion[r].precioarticulo + "' value='" + prendaxpromocion[r].idarticulo + "'>";
                                    html += prendaxpromocion[r].nombrearticulo.toUpperCase();
                                    html += " (" + prendaxpromocion[r].precioarticulo + ")";
                                    html += "</option>";
                                }
                                html += "</select>";
                                html += "</div>";
                                html += "</div>";


                                // COLOR
                                html += '<div class="row">';
                                html += '<div class="col-6">';
                                html += '<div class="form-group basic">';
                                html += '<div class="input-wrapper">';
                                html += '<div class="input-wrapper">';
                                html += '<strong>';
                                html += '<a href="#" class="text-secondary">COLOR:</a>';
                                html += '</strong>';
                                html += '<select class="search-live add-new-tags tagsColor form-control" id="color' + uuid + '" name="color' + uuid + '" data-select2-tags="true" onchange="addnewTagsColor(\'' + uuid + '\');">' + Color() + '</select>';
                                html += '</div>';
                                html += '</div>';
                                html += '</div>';
                                html += '</div>';
                                html += '<div class="col-6">';
                                html += '<div class="form-group basic">';
                                html += '<div class="input-wrapper">';
                                html += '<div class="input-wrapper">';
                                html += '<strong>';
                                html += '<a href="#" class="text-secondary">MARCA:</a>';
                                html += '</strong>';
                                // MARCA
                                html += '<select class="search-live add-new-tags tagsColor form-control" id="marca' + uuid + '" name="marca' + uuid + '" data-select2-tags="true" onchange="addnewTagsMarca(\'' + uuid + '\');">' + Marca() + '</select>';
                                html += '</div>';
                                html += '</div>';
                                html += '</div>';
                                html += '</div>';
                                html += '</div>';

                                // ESTADOS
                                html += '<div class="form-group basic">';
                                html += '<div class="input-wrapper">';
                                html += '<strong>';
                                html += '<a href="javascript:void(0)" class="text-secondary">ESTADO:</a>';
                                html += '</strong>';
                                html += '<div class="col-12" id="campo' + uuid + '" name="campo' + uuid + '" style="margin-top: 10px;">';
                                html += opcionesEstado(uuid);
                                html += '</div>';
                                html += '</div>';
                                html += '</div>';

                                // OBSERVACIONES
                                html += '<div class="form-group basic">';
                                html += '<div class="input-wrapper">';
                                html += '<strong>';
                                html += '<a href="javascript:void(0)" class="text-secondary">OBSERVACIONES:</a>';
                                html += '</strong>';
                                html += '<textarea class="form-control" id="observacion' + uuid + '" name="observacion' + uuid + '" rows="4" class="observacion" placeholder="OBSERVACIONES"></textarea>';
                                html += '</div>';
                                html += '</div>';

                                // AUDIOS E IMAGENES
                                html += '<div class="form-group basic">';
                                html += '<div class="input-wrapper">';
                                html += '<div class="row">';
                                html += '<div class="col-6">';
                                html += '<center>';
                                html += '<label for="audio' + uuid + '">';
                                html += '<span class="headerButton">';
                                html += '<ion-icon name="mic-outline" style="font-size: 40px;"></ion-icon>';
                                html += '<sup id="cantidadaudio' + uuid + '" name="cantidadaudio' + uuid + '" class="badge badge-success" style="float: right;"></sup>';
                                html += '</span>';
                                html += '<input type="file" id="audio' + uuid + '" name="audio' + uuid + '[]" accept="audio/*" capture style="display: none;" onchange="contarAudios(\'' + uuid + '\');">';
                                html += '</label>';
                                html += '</center>';
                                html += '</div>';
                                html += '<div class="col-6">';
                                html += '<center>';
                                html += '<label for="archivo' + uuid + '">';
                                html += '<span class="headerButton">';
                                html += '<ion-icon name="camera-outline" style="font-size: 40px;"></ion-icon>';
                                html += '<sup id="cantidadarchivos' + uuid + '" name="cantidadarchivos' + uuid + '" class="badge badge-success" style="float: right;"></sup>';
                                html += '</span>';
                                html += '<input type="file" accept="image/*;capture=camera;video/*" multiple="multiple" id="archivo' + uuid + '" name="archivo' + uuid + '[]" class="choose" style="display: none;" onchange="contarImagenes(\'' + uuid + '\');">';
                                html += '</label>';
                                html += '</center>';
                                html += '</div>';
                                html += '</div>';
                                html += '</div>';
                                html += '</div>';
                                html += '<hr>';

                                idetiquetas.push('color' + uuid);
                                idetiquetas.push('marca' + uuid);
                                idetiquetas.push('pieza' + uuid);
                            }

                            // IRA LOS IDS - TENDRIA QUE VER COMO APLICARLO
                            //html += "<input type='text' id='piezasids" + uuid + "' name='piezasids" + uuid + "' value='" + idspiezas + "' class='ocultarid'>";
                            //html += "<input type='text' id='laprendapertenece" + uuid + "' name='estaprendapertenece" + uuid + "' value='" + idprenda + "' class='ocultarid'>";


                            document.getElementById("items" + id).innerHTML = html;

                            for (var n = 0; n < idetiquetas.length; n++) {
                                $("#" + idetiquetas[n]).select2().trigger("change");
                            }

                        }
                    }
                });
            }
        } else if ((nombre_servicio != 'PROMOCIONES' || nombre_servicio != 'PROMOCION') && idservicio != 1) {
            if (idprenda != "") {
                $.ajax({
                    'async': false,
                    'type': "GET",
                    'global': false,
                    'dataType': 'json',
                    'url': ruta + "Pieza",
                    'data': {'cmd': "listapiezasxprenda", 'idprenda': idprenda},
                    'success': function (json) {
                        var valueidprenda = document.getElementById("prenda" + id).value;
                        var cantPiezas = json['cantpiezas'];
                        var datos = json['data'];
                        var uuid = "";
                        var html = "";
                        var idetiquetas = [];

                        // CUANDO ES SIN PIEZA
                        if (json['status'] == 'Ok' && cantPiezas == 0) {
                            var uuid = generate();

                            // IDPRENDA - EN ESTE CASO SI ES EL ID DE LA PRENDA
                            html += "<input type='text' id='subidprenda" + uuid + "' name='subidprenda" + uuid + "' value='" + valueidprenda + "' class='ocultarid'>";
                            html += "<input type='text' id='piezasids" + uuid + "' name='piezasids" + uuid + "' value='" + uuid + "' class='ocultarid'>";

                            // COLOR
                            html += '<div class="row">';
                            html += '<div class="col-6">';
                            html += '<div class="form-group basic">';
                            html += '<div class="input-wrapper">';
                            html += '<div class="input-wrapper">';
                            html += '<strong>';
                            html += '<a href="#" class="text-secondary">COLOR:</a>';
                            html += '</strong>';
                            html += '<select class="search-live add-new-tags tagsColor form-control" id="color' + uuid + '" name="color' + uuid + '" data-select2-tags="true" onchange="addnewTagsColor(\'' + uuid + '\');">' + Color() + '</select>';
                            html += '</div>';
                            html += '</div>';
                            html += '</div>';
                            html += '</div>';
                            html += '<div class="col-6">';
                            html += '<div class="form-group basic">';
                            html += '<div class="input-wrapper">';
                            html += '<div class="input-wrapper">';
                            html += '<strong>';
                            html += '<a href="#" class="text-secondary">MARCA:</a>';
                            html += '</strong>';
                            // MARCA
                            html += '<select class="search-live add-new-tags tagsColor form-control" id="marca' + uuid + '" name="marca' + uuid + '" data-select2-tags="true" onchange="addnewTagsMarca(\'' + uuid + '\');">' + Marca() + '</select>';
                            html += '</div>';
                            html += '</div>';
                            html += '</div>';
                            html += '</div>';
                            html += '</div>';

                            // ESTADOS
                            html += '<div class="form-group basic">';
                            html += '<div class="input-wrapper">';
                            html += '<strong>';
                            html += '<a href="javascript:void(0)" class="text-secondary">ESTADO:</a>';
                            html += '</strong>';
                            html += '<div class="col-12" id="campo' + uuid + '" name="campo' + uuid + '" style="margin-top: 10px;">';
                            html += opcionesEstado(uuid);
                            html += '</div>';
                            html += '</div>';
                            html += '</div>';

                            // OBSERVACIONES
                            html += '<div class="form-group basic">';
                            html += '<div class="input-wrapper">';
                            html += '<strong>';
                            html += '<a href="javascript:void(0)" class="text-secondary">OBSERVACIONES:</a>';
                            html += '</strong>';
                            html += '<textarea class="form-control" id="observacion' + uuid + '" name="observacion' + uuid + '" rows="4" class="observacion" placeholder="OBSERVACIONES"></textarea>';
                            html += '</div>';
                            html += '</div>';

                            // AUDIOS E IMAGENES
                            html += '<div class="form-group basic">';
                            html += '<div class="input-wrapper">';
                            html += '<div class="row">';
                            html += '<div class="col-6">';
                            html += '<center>';
                            html += '<label for="audio' + uuid + '">';
                            html += '<span class="headerButton">';
                            html += '<ion-icon name="mic-outline" style="font-size: 40px;"></ion-icon>';
                            html += '<sup id="cantidadaudio' + uuid + '" name="cantidadaudio' + uuid + '" class="badge badge-success" style="float: right;"></sup>';
                            html += '</span>';
                            html += '<input type="file" id="audio' + uuid + '" name="audio' + uuid + '[]" accept="audio/*" capture style="display: none;" onchange="contarAudios(\'' + uuid + '\');">';
                            html += '</label>';
                            html += '</center>';
                            html += '</div>';
                            html += '<div class="col-6">';
                            html += '<center>';
                            html += '<label for="archivo' + uuid + '">';
                            html += '<span class="headerButton">';
                            html += '<ion-icon name="camera-outline" style="font-size: 40px;"></ion-icon>';
                            html += '<sup id="cantidadarchivos' + uuid + '" name="cantidadarchivos' + uuid + '" class="badge badge-success" style="float: right;"></sup>';
                            html += '</span>';
                            html += '<input type="file" accept="image/*;capture=camera;video/*" multiple="multiple" id="archivo' + uuid + '" name="archivo' + uuid + '[]" class="choose" style="display: none;" onchange="contarImagenes(\'' + uuid + '\');">';
                            html += '</label>';
                            html += '</center>';
                            html += '</div>';
                            html += '</div>';
                            html += '</div>';
                            html += '</div>';
                            html += '<hr>';

                            // IRA LOS IDS
                            html += "<input type='text' id='piezasids" + uuid + "' name='piezasids" + uuid + "' value='" + uuid + "' class='ocultarid'>";
                            html += "<input type='text' id='laprendapertenece" + uuid + "' name='laprendapertenece" + uuid + "' value='" + idprenda + "' class='ocultarid'>";


                            idetiquetas.push('color' + uuid);
                            idetiquetas.push('marca' + uuid);

                            document.getElementById("items" + id).innerHTML = html;
                            for (var n = 0; n < idetiquetas.length; n++) {
                                $("#" + idetiquetas[n]).select2().trigger("change");
                            }

                            // CUANDO ES POR PIEZA    
                        } else if (json['status'] == 'Ok' && cantPiezas >= 1) {
                            uuid = generate();
                            var uuidtemp = uuid;
                            var idspiezas = "";

                            // IDPRENDA - EN ESTE CASO SI ES EL ID DE LA PRENDA
                            html += "<input type='text' id='subidprenda" + uuid + "' name='subidprenda" + uuid + "' value='" + valueidprenda + "' class='ocultarid'>";

                            // COLOR
                            html += '<div class="row">';
                            html += '<div class="col-6">';
                            html += '<div class="form-group basic">';
                            html += '<div class="input-wrapper">';
                            html += '<div class="input-wrapper">';
                            html += '<strong>';
                            html += '<a href="#" class="text-secondary">COLOR:</a>';
                            html += '</strong>';
                            html += '<select class="search-live add-new-tags tagsColor form-control" id="color' + uuid + '" name="color' + uuid + '" data-select2-tags="true" onchange="addnewTagsColor(\'' + uuid + '\');">' + Color() + '</select>';
                            html += '</div>';
                            html += '</div>';
                            html += '</div>';
                            html += '</div>';
                            html += '<div class="col-6">';
                            html += '<div class="form-group basic">';
                            html += '<div class="input-wrapper">';
                            html += '<div class="input-wrapper">';
                            html += '<strong>';
                            html += '<a href="#" class="text-secondary">MARCA:</a>';
                            html += '</strong>';
                            // MARCA
                            html += '<select class="search-live add-new-tags tagsColor form-control" id="marca' + uuid + '" name="marca' + uuid + '" data-select2-tags="true" onchange="addnewTagsMarca(\'' + uuid + '\');">' + Marca() + '</select>';
                            html += '</div>';
                            html += '</div>';
                            html += '</div>';
                            html += '</div>';
                            html += '</div>';

                            idetiquetas.push('color' + uuid);
                            idetiquetas.push('marca' + uuid);

                            // ORDENO LAS PIEZAS ALFABETICAMENTE
                            datos.sort(function (a, b) {
                                if (a.nombrepieza > b.nombrepieza) {
                                    return 1;
                                }
                                if (a.nombrepieza < b.nombrepieza) {
                                    return -1;
                                }
                                // a must be equal to b
                                return 0;
                            });
                            for (var pi = 0; pi < cantPiezas; pi++) {
                                // PIEZAS
                                uuid = generate();

                                if (pi > 0) {
                                    idspiezas += ';';
                                }
                                idspiezas += uuid;

                                html += '<div class="form-group basic">';
                                html += '<div class="input-wrapper">';
                                html += '<strong>';
                                html += '<a href="javascript:void(0)" class="text-secondary">PRENDAS:</a>';
                                html += '</strong>';
                                html += "<select class='search-live form-control' id='pieza" + uuid + "' name='pieza" + uuid + "' onchange='promocionPrecio(\"" + uuid + "\",\"" + contarordenes + "\");'>";
                                html += "<option selected='selected' price='" + datos[pi].preciopieza + "' value='" + datos[pi].idpieza + "'>";
                                html += datos[pi].nombrepieza.toUpperCase();
                                html += "</option>";
                                html += "</select>";
                                html += "</div>";
                                html += "</div>";

                                // ESTADOS
                                html += '<div class="form-group basic">';
                                html += '<div class="input-wrapper">';
                                html += '<strong>';
                                html += '<a href="javascript:void(0)" class="text-secondary">ESTADO:</a>';
                                html += '</strong>';
                                html += '<div class="col-12" id="campo' + uuid + '" name="campo' + uuid + '" style="margin-top: 10px;">';
                                html += opcionesEstado(uuid);
                                html += '</div>';
                                html += '</div>';
                                html += '</div>';

                                // OBSERVACIONES
                                html += '<div class="form-group basic">';
                                html += '<div class="input-wrapper">';
                                html += '<strong>';
                                html += '<a href="javascript:void(0)" class="text-secondary">OBSERVACIONES:</a>';
                                html += '</strong>';
                                html += '<textarea class="form-control" id="observacion' + uuid + '" name="observacion' + uuid + '" rows="4" class="observacion" placeholder="OBSERVACIONES"></textarea>';
                                html += '</div>';
                                html += '</div>';

                                // AUDIOS E IMAGENES
                                html += '<div class="form-group basic">';
                                html += '<div class="input-wrapper">';
                                html += '<div class="row">';
                                html += '<div class="col-6">';
                                html += '<center>';
                                html += '<label for="audio' + uuid + '">';
                                html += '<span class="headerButton">';
                                html += '<ion-icon name="mic-outline" style="font-size: 40px;"></ion-icon>';
                                html += '<sup id="cantidadaudio' + uuid + '" name="cantidadaudio' + uuid + '" class="badge badge-success" style="float: right;"></sup>';
                                html += '</span>';
                                html += '<input type="file" id="audio' + uuid + '" name="audio' + uuid + '[]" accept="audio/*" capture style="display: none;" onchange="contarAudios(\'' + uuid + '\');">';
                                html += '</label>';
                                html += '</center>';
                                html += '</div>';
                                html += '<div class="col-6">';
                                html += '<center>';
                                html += '<label for="archivo' + uuid + '">';
                                html += '<span class="headerButton">';
                                html += '<ion-icon name="camera-outline" style="font-size: 40px;"></ion-icon>';
                                html += '<sup id="cantidadarchivos' + uuid + '" name="cantidadarchivos' + uuid + '" class="badge badge-success" style="float: right;"></sup>';
                                html += '</span>';
                                html += '<input type="file" accept="image/*;capture=camera;video/*" multiple="multiple" id="archivo' + uuid + '" name="archivo' + uuid + '[]" class="choose" style="display: none;" onchange="contarImagenes(\'' + uuid + '\');">';
                                html += '</label>';
                                html += '</center>';
                                html += '</div>';
                                html += '</div>';
                                html += '</div>';
                                html += '</div>';
                                html += '<hr>';
                            }


                            // IRA LOS IDS
                            html += "<input type='text' id='piezasids" + uuidtemp + "' name='piezasids" + uuidtemp + "' value='" + idspiezas + "' class='ocultarid'>";
                            html += "<input type='text' id='laprendapertenece" + uuidtemp + "' name='laprendapertenece" + uuidtemp + "' value='" + idprenda + "' class='ocultarid'>";

                            document.getElementById("items" + id).innerHTML = html;
                            for (var n = 0; n < idetiquetas.length; n++) {
                                $("#" + idetiquetas[n]).select2().trigger("change");
                            }
                        }



                    }
                });
            }
        } // ELSE
    }
    // FIN OBTENER PIEZAS POR PRENDA

    // SUMAR PRECIO PARA PROMOCIONES
    // Para verificar si el key existe en un array - Ejm: https://stackoverflow.com/a/17126504/16488926
    // if NaN value javascript - Ejm: https://developer.mozilla.org/es/docs/Web/JavaScript/Reference/Global_Objects/isNaN
    var promociones = [];
    function promocionPrecio(id, idprecio) {
        var precioOption = $("#pieza" + id).find("option:selected").attr('price');

        if (precioOption === "0.00" || precioOption === "" || isNaN(precioOption) || typeof precioOption === 'undefined') {
            precioOption = 0;
        }
        var testArray = "precio" + idprecio in promociones; // false o true
        if (!testArray) {
            promociones["precio" + idprecio] = {};
        }
        if (testArray) {
            promociones["precio" + idprecio]['pieza' + id] = parseFloat(precioOption).toFixed(2);
        }

        // Ejm: https://developer.mozilla.org/es/docs/Web/JavaScript/Reference/Global_Objects/Object/entries
        // Ejm: https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_sort2
        var precios = [];
        var preciototal = 0;
        var pr = 0;
        Object.entries(promociones["precio" + idprecio]).forEach(([key, value]) => {
            precios[pr] = parseFloat(value).toFixed(2);
            pr = pr + 1;
        });

        if (precios.length === 2) {
            preciototal = Math.max.apply(null, precios);
        } else if (precios.length > 2) {
            precios.sort(function (a, b) {
                return b - a;
            });
            preciototal = parseFloat(precios[0]) + parseFloat(precios[1]);
        }

        document.getElementById("precio" + idprecio).value = preciototal.toFixed(2);
        sumarPrecios();
    }
    //


    // SUMAMOS LOS PRECIOS
    var preciototalapagar = 0;
    function sumarPrecios() {
        preciototalapagar = 0;
        var pagoTotal = 00;
        for (var sp = 1; sp <= ordenes; sp++) {
            var findId = document.getElementById("precio" + sp);
            if (findId) {
                var precio = findId.value;
                pagoTotal = parseFloat(pagoTotal) + parseFloat(precio);
            }
        }
        if (pagoTotal === "" || pagoTotal === 0) {
            pagoTotal = "0.00";
        }

        //console.log("PAGO TOTAL : " + pagoTotal);
        document.getElementById("pagototal").innerHTML = "";
        document.getElementById("pagototal").innerHTML = parseFloat(pagoTotal).toFixed(2);
        preciototalapagar = parseFloat(pagoTotal).toFixed(2);
    }
    // FIN SUMAMOS LOS PRECIOS

    // CALCULAR FECHA DE ENTREGA, SIN LOS DOMINGOS
    // MOMENTJS - EJM (CONTAR CUANTOS DOMINGOS HAY EN DOS FECHAS): https://stackoverflow.com/a/44469127/16488926
    // AL PARECER LA FUNCION SUMA UN DIA MAS SI LA FECHA ES FERIADO, NO ESTOY SEGURO. PERO EL CALCULO ESTA BIEN
    function calcularFecha(fechainicio, fechafin) {
        if (fechainicio.toLowerCase() === 'hoy') {
            fechainicio = moment().format("YYYY-MM-DD");
        }
        let start = moment(fechainicio, 'YYYY-MM-DD');
        let end = moment(fechafin, 'YYYY-MM-DD');

        let datesum = moment(fechainicio, 'YYYY-MM-DD');

        let weekdayCounter = 0;
        while (start <= end) {
            // SUNDAY = DOMINGO
            if (start.format('ddd') == 'Sun') {
                weekdayCounter++; // CUENTO LOS DOMINGOS
            }
            start = moment(start, 'YYYY-MM-DD').add(1, 'days');

            // SUMO DIAS PARA TENER LA FECHA FINAL
            datesum = moment(datesum).add(1, 'days').format("YYYY-MM-DD");
        }
        // RESTO UN DIA, YA QUE ME ESTA SUMANDO UN DIA MAS
        datesum = moment(datesum).subtract(1, "days").format("YYYY-MM-DD");
        //datesum = moment(datesum).add(-1, 'days').format("YYYY-MM-DD");

        if (weekdayCounter >= 1) {
            return calcularFecha(datesum, moment(datesum).add(weekdayCounter, 'days').format("YYYY-MM-DD"));
        }

        // EJM : https://stackoverflow.com/a/12059550/16488926
        return {
            "FechaInicio": moment().format("YYYY-MM-DD"),
            "FechaEntrega": datesum
        };

        // return weekdayCounter;
    }
    // FIN CALCULAR FECHA DE ENTREGA, SIN LOS DOMINGOS

    // SIRVE PARA OBTENER LOS DIAS DEL SERVICIO, NADA MAS
    function obtenerdias() {
        //var dias = $("#servicio").find("option:selected").attr('data-rc');
        var dias = document.getElementById("diasservicios").value;
        document.getElementById("totaldias").value = parseInt(dias);
        obtenerFechas('hoy', dias);
    }
    // FIN SIRVE PARA OBTENER LOS DIAS DEL SERVICIO, NADA MAS

    // CALCULAR FECHA QUE SE ENTREGARA - FECHA DEFAULT
    function obtenerFechas(fecha, dias) {
        // POR DEFECTO SE SUMA UN DIA, MOMENT JS NO TOMA HOY COMO UN DIA SI NO 
        // DESDE MAÑANA EMPIEZA A CONTAR LOS DIAS
        if (fecha.toLowerCase() === 'hoy') {
            fecha = moment().format("YYYY-MM-DD");
        }

        // FECHA SUMADA LOS DIAS
        fechaestimada = moment(fecha).add(dias, 'd').format("YYYY-MM-DD");

        var Array = calcularFecha(fecha, fechaestimada);
        document.getElementById("fechatotalmax").value = Array['FechaEntrega'];
        document.getElementById("fechatotalmin").value = Array['FechaEntrega'];
        nombrediaEspaniol(Array['FechaEntrega']);
    }
    //obtenerFechas('hoy', 32);
    // FIN CALCULAR FECHA QUE SE ENTREGARA - FECHA DEFAULT

    // SIRVE PARA SUMAR Y RESTAR FECHAS
    function sumaryrestarFecha(signo) {
        var obtfechaMax = document.getElementById("fechatotalmax");
        var obtfechaMin = document.getElementById("fechatotalmin").value;
        let fechaMaxMenosyMas = moment(obtfechaMax.value).add(signo + 1, 'days').format("YYYY-MM-DD");
        let fechaMaxMenosyMascalular = moment(fechaMaxMenosyMas, 'YYYY-MM-DD');
        if (fechaMaxMenosyMascalular.format('ddd') === 'Sun') {
            fechaMaxMenosyMas = moment(fechaMaxMenosyMas).add(signo + 1, 'days').format("YYYY-MM-DD");
        }
        obtfechaMax.value = fechaMaxMenosyMas;
        nombrediaEspaniol(fechaMaxMenosyMas);
        evaluarfechaMenor();
    }
    // FIN SIRVE PARA SUMAR Y RESTAR FECHAS

    // SIRVE PARA SABER EL NOMBRE DEL DIA QUE TIENE UNA FECHA, EN ESPAÑOL
    function nombrediaEspaniol(fecha) {
        let saberdia = moment(fecha, 'YYYY-MM-DD');
        saberdia = saberdia.format('ddd');
        // Mon,Tue,wed,Thu,Fri,Sat,Sun
        var dias = {
            "Mon": "Lunes",
            "Tue": "Martes",
            "Wed": "Miercoles",
            "Thu": "Jueves",
            "Fri": "Viernes",
            "Sat": "Sabado",
            "Sun": "Domingo"
        };
        document.getElementById("nombredia").innerHTML = dias[saberdia];
    }
    // FIN SIRVE PARA SABER EL NOMBRE DEL DIA QUE TIENE UNA FECHA, EN ESPAÑOL

    // SIRVE PARA CUANDO LA FECHA QUE ESTAMOS RESTANDO UN DIA, NO SEA MENOR A LA FECHA QUE 
    // NOS DA POR DEFECTO CON LOS DIAS DEL SERVICIO.
    function evaluarfechaMenor() {
        var obtfechaMax = document.getElementById("fechatotalmax");
        var obtfechaMin = document.getElementById("fechatotalmin").value;
        if (moment(obtfechaMax.value).isBefore(moment(obtfechaMin))) {
            obtfechaMax.value = obtfechaMin;
            nombrediaEspaniol(obtfechaMin);
        }
    }
    // FIN SIRVE PARA CUANDO LA FECHA QUE ESTAMOS RESTANDO UN DIA, NO SEA MENOR A LA FECHA QUE NOS DA POR DEFECTO CON LOS DIAS DEL SERVICIO.

    // SIRVE PARA REGISTRAR LOS COLORES Y LAS MARCAS QUE NO EXISTE 
    // EJEM: https://stackoverflow.com/a/35544242/16488926
    function addnewTagsColor(idselect) {
        var color = document.getElementById("color" + idselect).value;
        if (color.trim() != "") {
            $.post(ruta + "Color", {cmd: "registrartagscolor", color: color}, function (json) {
                console.log(json['msg']);

                if (json['status'] === 'Ok') {
                    $('.tagsColor')
                            .append($("<option/>") //add option tag in select
                                    .val(color.toUpperCase()) //set value for option to post it
                                    .text(color.toUpperCase())
                                    ) //set a text for show in select
                            .trigger("change"); //apply to select2
                }
            });
        }
    }
    function addnewTagsMarca(idselect) {
        var marca = document.getElementById("marca" + idselect).value;
        if (marca.trim() != "") {
            $.post(ruta + "Marca", {cmd: "registrartagsmarca", marca: marca}, function (json) {
                console.log(json['msg']);
                if (json['status'] === 'Ok') {
                    $('.tagsMarca')
                            .append($("<option/>") //add option tag in select
                                    .val(marca.toUpperCase()) //set value for option to post it
                                    .text(marca.toUpperCase())
                                    ) //set a text for show in select
                            .trigger("change"); //apply to select2
                }
            });
        }
    }
    // FIN SIRVE PARA REGISTRAR LOS COLORES Y LAS MARCAS QUE NO EXISTE 

    // ENVIO DE DATOS Y REGISTRAR LA BOLETA O FACTURA E IMPRIMIR TICKETS SI TODO ESTA OKEY 
    $(document).ready(function () {
        $("#enviarDatos").click(function () {
            $("#cancelarfechaentrega").click();
            var form = new FormData(document.getElementById('formData'));
            var fechaentrega = document.getElementById("fechatotalmax").value;
            var fechaentregaminimo = document.getElementById("fechatotalmin").value; // ESTA FECHA ES LA SUMA DE: DIAS + LA FECHA ACTUAL                    
            var nombre_servicio = $("#servicio").find("option:selected").attr('name-service');
            form.append('fechadeentrega', fechaentrega);
            form.append('fechaminimodeentrega', fechaentregaminimo);
            form.append('nombreservicio', nombre_servicio);
            form.append('pagototal', preciototalapagar);
            form.append('numOrdenes', ordenes);
            form.append('numSubordenes', subordenes);
            form.append('cantEstados', idestados);
            form.append('cmd', 'registrarrecojo');
            $.ajax({
                type: "POST",
                dataType: "html",
                url: ruta + 'Recojo',
                data: form,
                cache: false,
                contentType: false, //must, tell jQuery not to process the data
                processData: false,
                beforeSend: function () {
                    document.getElementById("htmlprint").innerHTML = '';
                    document.getElementById("htmlprint").innerHTML = '<div class="div-contenedor"><div class="centrar"><img src="design/aki/lavadora.gif" alt="" style="width: 110px;"/><br><strong>Procesando...</strong></div></div>';
                },
                success: function (data)
                {
                    document.getElementById("htmlprint").innerHTML = '';
                    document.getElementById("htmlprint").innerHTML = data;
                },
                error: function (xhr) { // if error occured
                    console.log(xhr);
                },
                complete: function () {
                }
            });

        });
    });
    // FIN ENVIO DE DATOS Y REGISTRAR LA BOLETA O FACTURA E IMPRIMIR TICKETS SI TODO ESTA OKEY

    // GENERAR ID UNICO
    // Ejm: https://stackoverflow.com/a/59913873/16488926
    // Ejm: https://stackoverflow.com/a/6248722/16488926
    function generate() {
        while (true) {
            var uid = 'U' + ("0000" + ((Math.random() * Math.pow(36, 4)) | 0).toString(36)).slice(-4);
            if (!idsunique.hasOwnProperty(uid)) {
                idsunique[uid] = true;
                return uid;
            }
        }
    }
</script>