<div class="card" style="margin-bottom: 18px;text-align: center;">
    <div class="card-body">
        <div class="row">
            <div class="col">
                Hay <label id="totaldeitems" name="totaldeitems">1 orden</label>
            </div>
            <div class="col">
                Total : S/. <label id="pagototal" name="pagototal">0.00</label>
            </div>
        </div>
    </div>
</div>

<form action="javascript:void(0)" method="POST" enctype="multipart/form-data" id="formData" name="formData" style="display: flex;overflow-x: auto;white-space: nowrap;">
    <div class="row" id="div1" name='div1'>
        <!--class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mb-3"-->
        <div id="firstdiv" name="firstdiv">
            <div class="card h-100">
                <button type="button" class="btn-close botoneliminarorden" aria-label="Close" onclick="removeItem(1);"></button>
                <div class="card-body">
                    <p class="mb-0" style="width: 100% !important;">
                        <strong>
                            <a href="#" class="text-secondary">ARTICULO:</a>&nbsp;
                            <div class="form-group basic">
                                <div class="input-wrapper">                            
                                    <select class="form-control" id="sop1" name="sop1" onchange="obtDiasFecha(1);">
                                    </select>
                                </div>
                            </div>
                        </strong>
                    </p>
                    <p class="mb-1" style="width: 100% !important;">
                        <strong>
                            <a href="#" class="text-secondary">PRENDA:</a>&nbsp;&nbsp;
                            <div class="form-group basic">
                                <div class="input-wrapper">
                                    <select class="form-control" id="pre1" name="pre1">                                        
                                    </select>
                                </div>
                            </div>
                        </strong>
                    </p>
                    <p class="mb-1" style="width: 100% !important;">
                        <strong>
                            <a href="#" class="text-secondary">SERVICIO:</a>&nbsp;&nbsp;
                            <div class="form-group basic">
                                <div class="input-wrapper">
                                    <select class="form-control" id="ser1" name="ser1">                                        
                                    </select>
                                </div>
                            </div>
                        </strong>
                    </p>
                    <div class="row">
                        <div class="col-6">
                            <strong>
                                <a href="#" class="text-secondary">DIAS:</a>&nbsp;&nbsp;

                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <button class="form-control" disabled="disabled" id="menos1" name="menos1" onclick="sumaryrestardias(1, '-');" style="border-radius: 5px 0px 0px 5px;">-</button>
                                    </div>
                                    <input type="number" class="form-control InputNumberNoChange" disabled="disabled" style="text-align: center;" min="0" value="0" id="dia1" name="dia1">
                                    <input type="hidden" hidden="hidden" class="form-control InputNumberNoChange" disabled="disabled" min="0" value="0" id="realdia1" name="realdia1">
                                    <div class="input-group-append">
                                        <button class="form-control" disabled="disabled" id="mas1" name="mas1" onclick="sumaryrestardias(1, '+');" style="border-radius: 0px 5px 5px 0px;">+</button>
                                    </div>
                                </div>

                            </strong>
                        </div>
                        <div class="col-6">
                            <strong>
                                <a href="#" class="text-secondary">PRECIO:</a>
                                <center>
                                    <h3 style="margin-top: 10px;margin-bottom: 20px;">S/. 
                                        <label id="tprc1" name="tprc1">00.00</label>
                                        <input type="hidden" hidden="hidden" id="prc1" name="prc1" value="" placeholder="PRECIO">
                                    </h3>
                                </center>
                            </strong>
                        </div>
                    </div>
                    <p class="mb-1" style="width: 100% !important;">
                        <strong>
                            <a href="#" class="text-secondary">FECHA:</a>&nbsp;&nbsp;
                            <div class="form-group basic">
                                <div class="input-wrapper">
                                    <input type="date" class="form-control" disabled="disabled" ref="" placeholder="FECHA" value="" id="fec1" name="fec1" onchange="cambiardefecha(1);">
                                    <input type="date" hidden="hidden" class="form-control" disabled="disabled" placeholder="FECHA" value="" id="realfec1" name="realfec1">
                                </div>
                            </div>
                        </strong>
                    </p>
                    <div class="row">
                        <strong>                        
                            <a href="#" class="text-secondary">ESTADO:</a>
                        </strong>
                        <div class="col-12" id="chk1" name="chk1">
                        </div>
                    </div>
                    <p class="mb-1" style="width: 100% !important;">
                        <strong>
                            <br>
                            <a href="#" class="text-secondary">OBSERVACIONES:</a>&nbsp;&nbsp;
                            <div class="form-group basic">
                                <div class="input-wrapper">                                
                                    <textarea class="form-control" id="obs1" name="obs1" rows="4" style="resize: none;" placeholder="Observaciones..."></textarea>
                                </div>
                            </div>
                        </strong>
                    </p>

                    <p>
                        <input type="file" accept="image/*;capture=camera;video/*" multiple="multiple" id="file1" name="file1[]" class="choose">
                    </p>
                </div>
            </div>
        </div>
    </div>
</form>

<label onclick="guardarItems();" class="btn btn-success" style="position: fixed;z-index: 9;bottom: 72px;right: 15px;font-size: 12px;border-radius: 50px;padding: 20px;width: 110px;">
    <ion-icon name="save-outline"></ion-icon>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</label>

<button type="button" onclick="addItem();" class="btn btn-success active" style="position: fixed;z-index: 9;bottom: 68px;right: 15px;font-size: 21px;border-radius: 50px;padding: 25px;width: 50px;">
    +
</button>

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
    var width = (window.innerWidth > 0) ? window.innerWidth : screen.width;

    // DETECTAR EL TIPO DE DISPOSITIVO QUE ESTOY USANDO
    // EJM : http://blog.alejandromolero.com/detectar-si-es-un-smartphone-o-tablet-mediante-javascript-y-jquery/
    (function (a) {
        (jQuery.browser = jQuery.browser || {}).mobile = /(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a) || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0, 4))
    })(navigator.userAgent || navigator.vendor || window.opera);
    // -----------------------------------------

    if (jQuery.browser.mobile === true) {
        document.getElementById("firstdiv").style.width = (width - 12) + "px";
    } else {
        width = 490;
        document.getElementById("firstdiv").style.width = (490 - 12) + "px";
    }

    // SIRVE PARA SUMAR EL TOTAL
    // Ejm de Object : https://stackoverflow.com/questions/32551353/using-named-keys-in-a-js-array
    var pagoTotal = {
        //'item1': {
        //    'precio': 0,
        //    'comision': 0
        //}
    };

    // OPCIONES DE ARTICULO
    var opcArticulo = function () {
        var tmp = "";
        $.ajax({
            'async': false,
            'type': "GET",
            'global': false,
            'dataType': 'json',
            'url': ruta + "Articulo",
            'data': {'cmd': "listaarticulos"},
            'success': function (json) {
                if (json['status'] == 'Ok') {
                    if (json['data']) {
                        tmp = "<option value='' hidden='hidden'>ELEGIR UN ARTICULO</option>";
                        var datos = json['data'];
                        for (var i = 0; i < datos.length; i++) {
                            tmp += "<option ref-data='" + datos[i].cantidadprenda + "' ref='" + datos[i].diasarticulo + "' data-subtext='" + datos[i].precioarticulo + "' value='" + datos[i].idarticulo + "'>" + datos[i].descripcionarticulo.toUpperCase() + "</option>";
                        }
                    }
                }
            }
        });
        return tmp;
    }();

    // OPCIONES DE SERVICIO
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
                        for (var i = 0; i < datos.length; i++) {
                            tmp += "<option value='" + datos[i].idservicio + "'>" + datos[i].nombreservicio.toUpperCase() + "</option>";
                        }
                    }
                }
            }
        });
        return tmp;
    }();

    // OPCIONES DE ARTICULOS
    var countEstArt = 0; // CONTAR CUANTOS ESTADOS DE ARTICULOS HAY
    function opcionesArticulo(id) {
        return chkEstadoPrenda = function () {
            var tmp = null;
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
                            tmp = "<br>";
                            for (var i = 0; i < datos.length; i++) {

                                if (datos[i].idestadoprenda >= countEstArt) {
                                    countEstArt = datos[i].idestadoprenda; // SERA IGUAL AL ULTIMO ID YA QUE RECORRERE DEL MENOR AL MAYOR
                                }

                                tmp += '<div class="form-check">';
                                // AGREGAR FUNCION : chk1 = el id del check box _1,_2 = id del estado de la prenda
                                tmp += '<input type="checkbox" class="form-check-input" id="chk' + id + '_' + datos[i].idestadoprenda + '" name="chk' + id + '_' + datos[i].idestadoprenda + '" value="' + datos[i].idestadoprenda + '">';
                                tmp += '<label class="form-check-label" for="chk' + id + '_' + datos[i].idestadoprenda + '">' + datos[i].nombreprenda.toUpperCase() + '</label>';
                                tmp += '</div>';
                            }
                        }
                    }
                }
            });
            return tmp;
        }();
        sumarTotalItems();
    }

    // OPCIONES DE PRENDA POR ARTICULOS
    var opcPrendas = function () {
        var tmp = null;
        $.ajax({
            'async': false,
            'type': "GET",
            'global': false,
            'dataType': 'json',
            'url': ruta + "Prenda",
            'data': {'cmd': "listaprendas"},
            'success': function (json) {
                if (json['status'] == 'Ok') {
                    if (json['data']) {
                        var datos = json['data'];
                        for (var i = 0; i < datos.length; i++) {
                            tmp += "<option value='" + datos[i].idprenda + "'>" + datos[i].nombreprendaxarticulo.toUpperCase() + "</option>";
                        }
                    }
                }
            }
        });
        return tmp;
    }();

    // OBTENER DIA Y FECHA DEL SELECT DE ARTICULOS POR SU ATRIBUTOS
    function obtDiasFecha(idselect) {
        // DIAS
        var dias = $("#sop" + idselect).find(':selected').attr('ref');
        document.getElementById("dia" + idselect).value = dias;
        document.getElementById("realdia" + idselect).value = dias;
        // ----------

        // SUMAR DIAS
        var fechaactual = moment().format("YYYY-MM-DD");
        document.getElementById("fec" + idselect).value = sumarDiasaFecha(fechaactual, dias);
        document.getElementById("realfec" + idselect).value = sumarDiasaFecha(fechaactual, dias);
        $("#fec" + idselect).attr('ref', sumarDiasaFecha(fechaactual, dias));
        // -----------

        // PRECIO
        var precio = $("#sop" + idselect).find(':selected').attr('data-subtext');
        document.getElementById("prc" + idselect).value = precio;

        pagoTotal['item' + idselect] = {'precio': precio, 'comision': 0};

        document.getElementById("tprc" + idselect).innerHTML = '';
        document.getElementById("tprc" + idselect).innerHTML = precio;
        // ----------

        // CANTIDAD DE PRENDAS 
        var cantidadprenda = $("#sop" + idselect).find(':selected').attr('ref-data');

        if (cantidadprenda > 1) {
            document.getElementById("pre" + idselect).innerHTML = "";
            document.getElementById("pre" + idselect).innerHTML = opcPrendas;
        } else {
            document.getElementById("pre" + idselect).innerHTML = "";
        }
        //document.getElementById("pre" + idselect).innerHTML = cantidadprenda;
        // ----------


        // CON ESTO HABILITO LOS BOTONES PARA PODER SUMAR Y RESTAR DIAS
        try {
            document.getElementById("menos" + idselect).disabled = false;
            document.getElementById("mas" + idselect).disabled = false;
            document.getElementById("fec" + idselect).disabled = false;
        } catch (e) {
        }
        sumarTotalItems();
    }

    // ESTA FUNCION SIRVE PARA SUMAR DIAS A UNA FECHA
    // EJM : sumarDiasaFecha('2021-07-13', 3)    ESTO ME RETORNA CON ESTA FECHA:   2021-07-16  
    // EJM : https://es.stackoverflow.com/questions/99689/actualizar-valor-de-moment-js
    function sumarDiasaFecha(fecha, dias) {
        var nuevafecha = "";
        if (dias != "") {
            nuevafecha = moment(fecha).add(dias, 'days').format("YYYY-MM-DD");
        }
        return nuevafecha;
    }

    // SIRVE PARA SUMAR Y RESTAR DIAS Y FECHA EN EL INPUT NUMBER DIAS
    function sumaryrestardias(id, signo) {
        var operando = 0;
        var numdias = document.getElementById('dia' + id).value;
        if (numdias <= 0) {
            document.getElementById('dia' + id).value = 1;
        } else if (signo == '+') {
            operando = (parseInt(numdias) + parseInt(1));
            if (operando <= 0) {
                operando = 1;
            } else {
                // ACA SUMO LOS DIAS
                var getFecha = document.getElementById('fec' + id);
                getFecha.value = sumarDiasaFecha(getFecha.value, 1);
                $("#fec" + id).attr('ref', getFecha.value);
            }
            document.getElementById('dia' + id).value = operando;
        } else if (signo == '-') {
            operando = (parseInt(numdias) - parseInt(1));
            if (operando <= 0) {
                operando = 1;
            } else {
                // ACA RESTO LOS DIAS
                var getFecha = document.getElementById('fec' + id);
                getFecha.value = sumarDiasaFecha(getFecha.value, -1);
                $("#fec" + id).attr('ref', getFecha.value);
            }
            document.getElementById('dia' + id).value = operando;
        }
        sumarTotalItems();
    }

    $("[type='number']").keypress(function (evt) {
        evt.preventDefault();
    });

    // SIRVE PARA CAMBIAR DE FECHA Y VER LA DIFERENCIA DE DIAS 
    // ASI PODEMOS RESTAR Y SUMAR DIAS
    function cambiardefecha(id) {
        // ejem: https://www.it-swarm-es.com/es/javascript/como-comparar-solo-fecha-en-moment.js/1052622124/
        var fechamodificado = document.getElementById("fec" + id);
        var fechamodireal = $("#fec" + id).attr('ref');
        var fechareal = document.getElementById("realfec" + id);

        var diamodificado = document.getElementById("dia" + id);
        var diareal = document.getElementById("realdia" + id);

        if (
                fechamodificado.value == fechareal.value ||
                moment(fechareal.value).isAfter(fechamodificado.value, 'day')
                ) {
            diamodificado.value = diareal.value;
            fechamodificado.value = fechareal.value;
            $("#fec" + id).attr('ref', fechamodificado.value);

            DialogAlert('Error', 'La fecha seleccionada no puede ser menor a la fecha programada', '');
        } else {
            // SI LA FECHA ES MAYOR QUE LA QUE ELEGI
            if (
                    // FALSE - SERA MAS
                    moment(fechamodireal).isAfter(fechamodificado.value, 'day') == false
                    ) {
                var fecha1 = moment(fechamodireal);
                var fecha2 = moment(fechamodificado.value);
                var masdias = parseInt(fecha2.diff(fecha1, 'days'));
                diamodificado.value = parseInt(diamodificado.value) + parseInt(masdias);
                $("#fec" + id).attr('ref', fechamodificado.value);
                console.log("Más Dias");


            } else if (
                    // TRUE - SERA MENOS
                    moment(fechamodireal).isAfter(fechamodificado.value, 'day') == true
                    ) {
                var fecha1 = moment(fechamodireal);
                var fecha2 = moment(fechamodificado.value);
                var menosdias = parseInt(fecha2.diff(fecha1, 'days'));
                diamodificado.value = parseInt(diamodificado.value) - parseInt(menosdias);
                $("#fec" + id).attr('ref', fechamodificado.value);
                console.log("Menos Dias");
            }
        }
        sumarTotalItems();
    }

    // INICIALIZAMOS PARA EL PRIMER ITEM
    document.getElementById("sop1").innerHTML = opcArticulo;
    document.getElementById("chk1").innerHTML = opcionesArticulo(1);
    document.getElementById("ser1").innerHTML = opcServicio;

    // CUENTA LOS ITEMS AGREGADOS, PERO SI SE ELIMINA UN ITEM ESTE NO SE RESTARA UNO, CONTINUARA EN EL ULTIMO ITEM AGREGADOS
    var numOrden = 1; // NUMERO DE ORDEN O NUMERO DE ITEMS POR ARTICULO
    var contarItems = 1; // CUENTA LAS ORDENES

    // SUMAMOS EL TOTAL DE LOS ITEMS
    function sumarTotalItems() {
        var pago = 00;
        Object.values(pagoTotal).forEach(val => {
            pago = parseFloat(pago) + parseFloat(val['precio']);
        });
        document.getElementById("pagototal").innerHTML = pago.toFixed(2);

    }

    // VERIFICAR SI UN KEY ARRAY EXISTE
    function existKeyinObject() {
        // EJM: https://www.codegrepper.com/code-examples/javascript/javascript+check+if+key+exists+in+object
        for (var k = 1; k <= numOrden; k++) {
            // EVALUAMOS SI EL KEY NAME NO EXISTE EN EL OBJETO
            if ((String("item" + k) in pagoTotal) == false) {
                // console.log(String("item" + k));
                return false;
            }
        }
        return true;
    }

    // SIRVE PARA AGREGAR ITEMS
    function addItem() {
        // Ejm : https://stackoverflow.com/questions/17650776/add-remove-html-inside-div-using-javascript
        if (contarItems <= 0) {
            contarItems = 0;
        }

        if (existKeyinObject() === false) {
            DialogAlert('Error', 'Hay una orden con datos incompletos', '');
        } else {
            numOrden = numOrden + 1;
            contarItems = contarItems + 1;
            if (contarItems <= 1) {
                document.getElementById("totaldeitems").innerHTML = contarItems + " orden";
            } else {
                document.getElementById("totaldeitems").innerHTML = contarItems + " ordenes";
            }

            // PARA QUE ESTO FUNCIONE LOS DATOS DEBEN DE ESTAR EN UN : class= 'row'
            document.querySelector('#formData').insertAdjacentHTML('afterbegin',
                    `                      
                
                <div class="row" id="div` + numOrden + `" name='div` + numOrden + `'>
                    <div class="mb-3" style="width: ` + (width - 14) + `px;">
                        <div class="card h-100">
                            <div class="card-body">            
                                <button type="button" class="btn-close botoneliminarorden" aria-label="Close" onclick="removeItem(` + numOrden + `);"></button>
                                <p class="mb-0" style="width: 100% !important;">
                                    <strong>
                                        <a href="#" class="text-secondary">ARTICULO:</a>&nbsp;
                                        <div class="form-group basic">
                                            <div class="input-wrapper">                            
                                                <select class="form-control" id="sop` + numOrden + `" name="sop` + numOrden + `" onchange="obtDiasFecha(` + numOrden + `);">
                                                    ` + opcArticulo + `
                                                </select>
                                            </div>
                                        </div>
                                    </strong>
                                </p>
                                <p class="mb-1" style="width: 100% !important;">
                                    <strong>
                                        <a href="#" class="text-secondary">PRENDA:</a>&nbsp;&nbsp;
                                        <div class="form-group basic">
                                            <div class="input-wrapper">
                                                <select class="form-control" id="pre` + numOrden + `" name="pre` + numOrden + `">                                        
                                                </select>
                                            </div>
                                        </div>
                                    </strong>
                                </p>
                                <p class="mb-1" style="width: 100% !important;">
                                    <strong>
                                        <a href="#" class="text-secondary">SERVICIO:</a>&nbsp;&nbsp;
                                        <div class="form-group basic">
                                            <div class="input-wrapper">
                                                <select class="form-control" id="ser` + numOrden + `" name="ser` + numOrden + `"> 
                                                    ` + opcServicio + `
                                                </select>
                                            </div>
                                        </div>
                                    </strong>
                                </p>

                                <div class="row">
                                    <div class="col-6">
                                        <strong>
                                            <a href="#" class="text-secondary">DIAS:</a>&nbsp;&nbsp;

                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <button class="form-control" disabled="disabled" id="menos` + numOrden + `" name="menos` + numOrden + `" onclick="sumaryrestardias(` + numOrden + `, '-');" style="border-radius: 5px 0px 0px 5px;">-</button>
                                                </div>
                                                <input type="number" class="form-control InputNumberNoChange" disabled="disabled" style="text-align: center;" min="0" value="0" id="dia` + numOrden + `" name="dia` + numOrden + `">
                                                <input type="hidden" hidden="hidden" class="form-control InputNumberNoChange" disabled="disabled" min="0" value="0" id="realdia` + numOrden + `" name="realdia` + numOrden + `">
                                                <div class="input-group-append">
                                                    <button class="form-control" disabled="disabled" id="mas` + numOrden + `" name="mas` + numOrden + `" onclick="sumaryrestardias(` + numOrden + `, '+');" style="border-radius: 0px 5px 5px 0px;">+</button>
                                                </div>
                                            </div>

                                        </strong>
                                    </div>
                                    <div class="col-6">
                                        <strong>
                                            <a href="#" class="text-secondary">PRECIO:</a>
                                            <center>
                                                <h3 style="margin-top: 10px;margin-bottom: 20px;">S/. 
                                                    <label id="tprc` + numOrden + `" name="tprc` + numOrden + `">00.00</label>
                                                    <input type="hidden" hidden="hidden" id="prc` + numOrden + `" name="prc` + numOrden + `" value="" placeholder="PRECIO">
                                                </h3>
                                            </center>
                                        </strong>
                                    </div>
                                </div>
                                <p class="mb-1" style="width: 100% !important;">
                                    <strong>
                                        <a href="#" class="text-secondary">FECHA:</a>&nbsp;&nbsp;
                                        <div class="form-group basic">
                                            <div class="input-wrapper">
                                                <input type="date" class="form-control" disabled="disabled" ref="" placeholder="FECHA" value="" id="fec` + numOrden + `" name="fec` + numOrden + `" onchange="cambiardefecha(` + numOrden + `);">
                                                <input type="date" hidden="hidden" class="form-control" disabled="disabled" placeholder="FECHA" value="" id="realfec` + numOrden + `" name="realfec` + numOrden + `">
                                            </div>
                                        </div>
                                    </strong>
                                </p>
                                <div class="row">
                                    <strong>                        
                                        <a href="#" class="text-secondary">ESTADO:</a>
                                    </strong>
                                    <div class="col-12" id="chk1" name="chk` + numOrden + `">
                                        ` + opcionesArticulo(numOrden) + `
                                    </div>
                                </div>
                                <p class="mb-1" style="width: 100% !important;">
                                    <strong>
                                        <br>
                                        <a href="#" class="text-secondary">OBSERVACIONES:</a>&nbsp;&nbsp;
                                        <div class="form-group basic">
                                            <div class="input-wrapper">                                
                                                <textarea class="form-control" id="obs` + numOrden + `" name="obs` + numOrden + `" rows="4" style="resize: none;" placeholder="Observaciones..."></textarea>
                                            </div>
                                        </div>
                                    </strong>
                                </p>
                                <p>
                                    <input type="file" accept="image/*;capture=camera;video/*" multiple="multiple" id="file` + numOrden + `" name="file` + numOrden + `[]" class="choose">
                                </p>
                            </div>
                        </div>
                    </div>
                </div>  
                                                    
                `
                    );
            sumarTotalItems();
        }
    }

    // PARA REMOVER EL DIV , DEVEMOS PASAR EL ID DEL DIV, elementId ES VALOR ENTERO
    function removeItem(elementId) {
        if (contarItems <= 0) {
            contarItems = 0;
        }
        if (contarItems == 1) {
            DialogAlert('Error', 'No puede eliminar está orden', '');
        } else {
            var element = document.getElementById("div" + elementId);
            element.parentNode.removeChild(element);
            contarItems = contarItems - 1;

            if (contarItems <= 1) {
                document.getElementById("totaldeitems").innerHTML = contarItems + " orden";
            } else {
                document.getElementById("totaldeitems").innerHTML = contarItems + " ordenes";
            }
            delete pagoTotal['item' + elementId];
            sumarTotalItems();
        }
    }

    var formArrayGroup = {};
    function groupbykeynamenumber() {
        // EJM: https://stackoverflow.com/questions/15481539/jquery-check-if-input-exists-and-has-a-value
        // EJM: https://stackoverflow.com/questions/19479924/how-to-access-jquery-serialized-data

        formArrayGroup = {};
        var fr = $("#formData").serialize();
        //console.log("Form : " + fr);
        // countEstArt
        // numOrden
        for (var n = 1; n <= numOrden; n++) {
            if ((String("item" + n) in pagoTotal) == true) {
                formArrayGroup["item" + n] = {};
                formArrayGroup["item" + n]["idarticulo"] = "";
                formArrayGroup["item" + n]["idprenda"] = "";
                formArrayGroup["item" + n]["idservicio"] = "";
                formArrayGroup["item" + n]["dia"] = "";
                formArrayGroup["item" + n]["precio"] = "";
                formArrayGroup["item" + n]["fecha"] = "";
                formArrayGroup["item" + n]["estados"] = {};
                formArrayGroup["item" + n]["observacion"] = "";
                formArrayGroup["item" + n]["archivos"] = {};

                // ARTICULO
                if ($("#sop" + n).length) {
                    formArrayGroup["item" + n]["idarticulo"] = $("#sop" + n).val() ? $("#sop" + n).val() : "";
                }

                // PRENDA - OPCIONAL
                if ($("#pre" + n).length) {
                    formArrayGroup["item" + n]["idprenda"] = $("#pre" + n).val() ? $("#pre" + n).val() : "";
                }

                // SERVICIO
                if ($("#ser" + n).length) {
                    formArrayGroup["item" + n]["idservicio"] = $("#ser" + n).val() ? $("#ser" + n).val() : "";
                }

                // DIAS
                if ($("#dia" + n).length) {
                    formArrayGroup["item" + n]["dia"] = $("#dia" + n).val() ? $("#dia" + n).val() : "";
                }

                // PRECIO
                if ($("#prc" + n).length) {
                    formArrayGroup["item" + n]["precio"] = $("#prc" + n).val() ? $("#prc" + n).val() : "";
                }

                // FECHA
                if ($("#fec" + n).length) {
                    formArrayGroup["item" + n]["fecha"] = $("#fec" + n).val() ? $("#fec" + n).val() : "";
                }

                // ESTADOS
                // CEUNTO SI HAY UN ID
                if (1 <= countEstArt) {
                    var concatestadosids = "";
                    for (var e = 1; e <= countEstArt; e++) {
                        if (
                                $("#chk" + n + "_" + e).length > 0 &&
                                $("#chk" + n + "_" + e).is(":checked")
                                ) {
                            concatestadosids += " ";
                            concatestadosids += $("#chk" + n + "_" + e).val() ? $("#chk" + n + "_" + e).val() : "";
                        }
                    }
                    concatestadosids = concatestadosids.trim();
                    concatestadosids = concatestadosids.replace(' ', ',');
                    formArrayGroup["item" + n]["estados"] = concatestadosids ? concatestadosids : "";
                }

                // OBSERVACION
                if ($("#obs" + n).length) {
                    formArrayGroup["item" + n]["observacion"] = $("#obs" + n).val() ? $("#obs" + n).val() : "";
                }

                // ARCHIVOS: IMAGENES, VIDEOS, AUDIO 
                if ($('#file' + n).val()) {

                    // EJM : https://stackoverflow.com/a/7023537
                    //var files = $("#file" + n)[0].files; 

                    //var formData = new FormData();
                    // Read selected files
                    //for (var index = 0; index < totalfiles; index++) {
                    //    formData.append("files" + n + "[]", document.getElementById('files').files[index]);
                    //}


                    /*var imageContainer = [];
                     var files = document.getElementsByName("file" + n + '[]');
                     for (var i = 0; i < files.length; i++) {
                     var fileUpload = files[i];
                     if (fileUpload.files.length) {
                     formArrayGroup["item" + n]["archivos"][i] = fileUpload.files[0];                            
                     }
                     }*/

                    //for (var f = 0; f < files.length; f++)
                    //{
                    //formArrayGroup["item" + n]["archivos"] = $('#file' + n).prop("files")[0];
                    // Populate the array
                    //var filelist = new Array();
                    var file = document.getElementById('file' + n);
                    for (var y = 0; y < file.files.length; ++y) {
                        formArrayGroup["item" + n]["archivos"][y] = file.files.item(y);
                    }
                    //formArrayGroup["item" + n]["archivos"] = filelist;
                    //console.log(formArrayGroup);
                    //}
                }

                //console.log(formArrayGroup);
            }
        }

        return formArrayGroup;
    }

    function guardarItems() {
        var contObject = Object.keys(pagoTotal).length;
        //console.log(contObject);
        if (
                contarItems => 1
        ) {


            var form = new FormData(document.getElementById('formData'));
            form.append('cmd', 'registrarrecojo');
            form.append('numOrden', numOrden);
            $.ajax({
                type: "POST",
                url: ruta + 'Recojo',
                data: form,
                cache: false,
                contentType: false, //must, tell jQuery not to process the data
                processData: false,
                //data: $("#upload_img").serialize(),
                success: function (data)
                {
                    console.log(data);
                }
            });

            // EJM: https://thisinterestsme.com/send-javascript-object-to-php-script/
//            $.ajax({
//                contentType: 'application/json',
//                url: ruta + 'Recojo', // url where to submit the request
//                type: "POST", // type of action POST || GET
//                dataType: "json",
//                data: {
//                    cmd: 'registrarrecojo',
//                    formulario: groupbykeynamenumber()
//                },
//                cache: false,
//                processData: false,
//                success: function (json) {
//                    console.log(json);
//                },
//                error: function (xhr, resp, text) {
//                    console.log(xhr, resp, text);
//                }
//            });
        } else {
            DialogAlert('Error', 'No puede guardar los datos', '');
        }

    }
</script>