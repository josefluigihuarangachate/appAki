function entregaexitosa(confirm) {
    if (confirm) {
        var tipodepago = document.getElementById("metododepago").value;
        var latitud = document.getElementById("latitud_actual").value;
        var longitud = document.getElementById("longitud_actual").value;

        //
        var facturaelectronica = $("input[name='facturaelectronica']:checked").val();
        if (facturaelectronica === undefined) {
            facturaelectronica = 'ninguno';
        }
        var dni_ruc = document.getElementById("ruc").value;
        var razon_social = document.getElementById("razonsocial").value;
        var correoelectronico = document.getElementById("correoelectronico").value;
        var enviarporcorreo = false;
        if ($('#enviarporcorreo').is(':checked')) {
            enviarporcorreo = true;
        }

//        alert(facturaelectronica);

        $.post(ruta + "Entrega",
                {
                    cmd: 'confirmarentregaexitosa',
                    numerosdeordenes: numerosdeordenes,
                    idcliente: id_cliente,
                    tipodepago: tipodepago,
                    latitud: latitud,
                    longitud: longitud,
                    facturaelectronica: facturaelectronica,
                    dniruc: dni_ruc,
                    razonsocial: razon_social,
                    correoelectronico: correoelectronico,
                    enviarporcorreo: enviarporcorreo
                }, function (json) {
            DialogAlertConfirm(json['msg'], '');


            if (json['status'] === "Ok") {
                if (document.getElementById("idpdfexist")) {
                    //alert("Element exists");
                    console.log("El id existe, imprimir pdf");
                } else {
                    //alert("Element does not exist");
                    document.querySelector('#PanelLeft').insertAdjacentHTML('afterbegin', `
                    <input type="hidden" hidden="hidden" value="" id="idpdfexist" name="idpdfexist">
                `);
                }
                document.getElementById("idpdfexist").value = json['url_archivo'];

                setTimeout(function () {
                    goBack();
                }, 2000);

            }
        });
    }
}

function generarReclamo(numerodeorden, keyprenda, idprenda, nombredelaprenda, color, marca) {
    //alert("COLOR: " + color + " - MARCA: " + marca);
    document.getElementById("numerodeorden").value = numerodeorden;
    document.getElementById("keyprenda").value = keyprenda;
    document.getElementById("idprenda").value = idprenda;

    document.getElementById("nombreprenda").value = nombredelaprenda;
    document.getElementById("colorprenda").value = color;
    document.getElementById("marcaprenda").value = marca;
    document.getElementById("textonombreprenda").innerHTML = nombredelaprenda;
    document.getElementById("textocolorprenda").innerHTML = color;
    document.getElementById("textomarcaprenda").innerHTML = marca;


    document.getElementById("divestados").innerHTML = "";
    document.getElementById("divestados").innerHTML = opcionesEstado();
    document.getElementById("observaciones").value = "";

    $('#DialogForm').modal('show');
}


// OPCIONES DE ESTADOS
function opcionesEstado() {
    return chkEstadoPrenda = function () {
        var tmp = '';
        $.ajax({
            'async': false,
            'type': "GET",
            'global': false,
            'dataType': 'json',
            'url': ruta + "EstadoPrenda",
            'data': {'cmd': "listaestadoreclamo"},
            'success': function (json) {
                if (json['status'] == 'Ok') {
                    if (json['data']) {
                        var datos = json['data'];
                        idestados = datos.length;
                        for (var i = 0; i < datos.length; i++) {
                            tmp += '<div class="">';
                            // AGREGAR FUNCION : chk1 = el id del check box _1,_2 = id del estado de la prenda
                            tmp += '<input type="checkbox" style="transform : scale(1.7);margin-right: 14px;" id="estado' + '_' + i + '" name="estado[]" value="' + datos[i].nombrereclamo + '">';
                            tmp += '<label class="form-check-label">' + datos[i].nombrereclamo.toUpperCase() + '</label>';
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
function contarAudios(id) {
    var numFiles = $("#audio" + id)[0].files.length;
    if (numFiles === 0) {
        numFiles = "";
    }
    document.getElementById("cantidadaudio" + id).innerHTML = "";
    document.getElementById("cantidadaudio" + id).innerHTML = numFiles;
}
// FIN PARA CONTAR CUANTOS AUDIOS SE CARGARON

// ENVIO EL RECLAMO POR PRENDA Y LO REGISTRO 
function genegarReclamoporPrenda() {
    var form = new FormData(document.getElementById('formReclamo'));
    form.append('cmd', 'registrarreclamoporprenda');
    var numerodeorden = document.getElementById("numerodeorden").value;
    form.append('numerodeorden', numerodeorden);
    var keyprenda = document.getElementById("keyprenda").value;
    form.append('keyprenda', keyprenda);
    var idprenda = document.getElementById("idprenda").value;
    form.append('idprenda', idprenda);
    var nombreprenda = document.getElementById("nombreprenda").value;
    form.append('nombreprenda', nombreprenda);
    var color = document.getElementById("colorprenda").value;
    form.append('color', color);
    var marca = document.getElementById("marcaprenda").value;
    form.append('marca', marca);
    var nombrecliente = document.getElementById("nombrecliente").value;
    form.append('nombrecliente', nombrecliente);
    //form.append('idcliente', idcliente);

    // ABRO EL MODAL POPUP PARA MOSTRAR LOS DETALLES
    $('#ModalPrintTicket').modal('show');

    $.ajax({
        type: "POST",
        dataType: "html",
        url: ruta + 'Reclamo',
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
}



// PARA LA FECHA DE ENTREGA, CUANDO SE HACE UN RECLAMO
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

// SIRVE PARA OBTENER LOS DIAS DEL SERVICIO, NADA MAS
function obtenerdias() {
    var dias = 3; // POR DEFECTO
    obtenerFechas('hoy', dias);
}
obtenerdias();
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