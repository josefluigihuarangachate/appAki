<?php

include './include/app.php';
include './include/session.php';

$generator = new Picqer\Barcode\BarcodeGeneratorPNG();

use Dompdf\Dompdf;

if (METODO($method) == 'GET') {

    if ($cmd == 'listadeorden') {

        $data = $pdo->select(
                tabla('orden'),
                [
                    tabla('orden') . ".id(idorden)",
                    tabla('orden') . ".idservicio(idservicio)",
                    tabla('orden') . ".nombre_servicio(nombredelservicio)",
                    tabla('orden') . ".numeroorden(numeroorden)",
                    tabla('orden') . ".nombre_repartidor(nombredelrepartidor)",
                    tabla('orden') . ".fecha(fechaderegistro)",
                    tabla('orden') . ".hora(horaderegistro)",
                    tabla('orden') . ".idcliente(iddelcliente)",
                    tabla('orden') . ".nombre_cliente(nombredelcliente)",
                    tabla('orden') . ".celular_cliente(celulardelcliente)",
                    tabla('orden') . ".direccion_cliente(direcciondelcliente)",
                    tabla('orden') . ".fecha_entrega(fechadeentrega)",
                    tabla('orden') . ".hora_entrega(horadeentrega)",
                    tabla('orden') . ".tipo_cobro(tipodecobro)",
                    tabla('orden') . ".idzona(idzona)", // C1, C2, C3,...
                    tabla('orden') . ".total_pagar(totalapagar)",
                    tabla('orden') . ".estado(estadodeorden)",
                    tabla('orden') . ".tipo_pago(tipodepago)",
                    tabla('orden') . ".tipo_atencion(tipodeatencion)",
                    tabla('orden') . ".array_detalleorden(detalledeorden)",
                    tabla('orden') . ".flag(flag)",
                ],
                [
                    "OR" => [
                        tabla('orden') . '.flag' => [1, 2]
                    ]
                ]
        );

        if ($data) {

            for ($d = 0; $d < count($data); $d++) {
                if (
                        $data[$d]['nombredelservicio'] == 'PROMOCIONES' ||
                        $data[$d]['nombredelservicio'] == 'PROMOCION' ||
                        $data[$d]['nombredelservicio'] == 'PROMOCIÓN'
                ) {
                    $detalledeorden = (array) json_decode("[" . @$data[$d]['detalledeorden'] . "]", true);
                    unset($data[$d]['detalledeorden']);
                    $data[$d]['detalledeorden'] = $detalledeorden;
                } else {
                    $detalledeorden = (array) json_decode(@$data[$d]['detalledeorden'], true);
                    unset($data[$d]['detalledeorden']);
                    $data[$d]['detalledeorden'] = $detalledeorden;
                }
                continue;
            }


            for ($d = 0; $d < count($data); $d++) {
                if (
                        $data[$d]['nombredelservicio'] == 'PROMOCIONES' ||
                        $data[$d]['nombredelservicio'] == 'PROMOCION' ||
                        $data[$d]['nombredelservicio'] == 'PROMOCIÓN'
                ) {
                    $promociones = $data[$d]['detalledeorden'];

                    for ($pm = 0; $pm < count($promociones); $pm++) {
                        $arrpromociones = $promociones[$pm];
                        $appPrecio = [];
                        $pagoPromocion = 0;
                        foreach ($arrpromociones as $promo => $value) {

                            $appPrecio = [];
                            for ($v = 0; $v < count($value); $v++) {
                                $appPrecio[] = $value[$v]['precioprenda'];
                            }
                            $pagoPromocion = array_sum($appPrecio) - min($appPrecio);

                            $dataprom = $pdo->select(
                                    tabla('detalleorden'),
                                    [
                                        tabla('detalleorden') . ".idpromocion(idpromocion)",
                                    ],
                                    [
                                        "AND" => [
                                            tabla('detalleorden') . '.idorden' => $data[$d]['idorden'],
                                            tabla('detalleorden') . '.nombrepromocion' => $promo
                                        ]
                                    ],
                                    [
                                        'LIMIT' => 1
                                    ]
                            );
                            $data[$d]['detalledeorden'][$pm][$promo]['idpromocion'] = @$dataprom[0]['idpromocion'];
                            $data[$d]['detalledeorden'][$pm][$promo]['preciopromocion'] = str_replace(",", "", number_format($pagoPromocion, 2, '.', ','));
                            unset($dataprom);
                        }
                    }
                }
                continue;
            }

            $json['code'] = '200';
            $json['status'] = 'Ok';
            $json['msg'] = strings('success_read');
            $json['data'] = $data;
        } else {
            $json['msg'] = strings('error_read');
        }
    } else {
        $json['msg'] = strings('error_cmd');
    }
} else if (METODO($method) == 'POST') {
    if ($cmd === 'registrarllamadaxfecha') {
        $numerodeorden = input('numerodeorden');
        $fechadeentrega = input('fechadeentrega');

        if (
                !empty($numerodeorden) &&
                !empty($fechadeentrega)
        ) {
            try {
                // OBTENGO EL ID DE LA ZONA POR EL C1,C2,C3 O C4
                $turnoxcliente = $pdo->update(
                        tabla("turnoxcliente"),
                        [
                            "fecha_turno" => $fechadeentrega
                        ],
                        [
                            "numero_orden" => $numerodeorden
                        ]
                );
                $countturnoxcliente = $turnoxcliente->rowCount();

                // OBTENGO EL ID DE LA ZONA POR EL C1,C2,C3 O C4
                $orden = $pdo->update(
                        tabla("orden"),
                        [
                            "fecha_entrega" => $fechadeentrega
                        ],
                        [
                            "numeroorden" => $numerodeorden
                        ]
                );
                $countorden = $orden->rowCount();

                if (
                        $countturnoxcliente &&
                        $countorden
                ) {
                    $json['code'] = '200';
                    $json['status'] = 'Ok';
                    $json['msg'] = strings('success_update');
                    $json['data'] = '';
                } else {
                    $json['msg'] = strings('error_update');
                }
            } catch (Throwable $e) {
                $json['msg'] = strings('error_update');
            }
        } else {
            $json['msg'] = strings('error_empty');
        }
    } else if ($cmd == 'registrarrecojo') {

        $idrepartidor = input('idrepartidor'); // AUTO INCREMENT ID, ACA SE CREARA UN WEBSERVICE PARA QUE PUEDA CONSUMIR
        $idcliente = input('idcliente'); // AUTO INCREMENT ID
        $idzona = input('idzona');  // (C1, C2, C3, ETC)
        $fecha = input('fechadelrecojo');
        $hora = input('horadelrecojo');
        $puestodeturno = temprano_tarde($hora);
        $atencion = 'Sin Atender';
        $estadodeturno = 'Recojo'; // SIEMPRE SERA RECOJO

        if (
                $idrepartidor &&
                $idcliente &&
                $idzona &&
                $fecha &&
                $hora &&
                $puestodeturno &&
                $atencion &&
                $estadodeturno
        ) {
            try {
                // OBTENGO EL ID DE LA ZONA POR EL C1,C2,C3 O C4
                $obteneridzona = $pdo->select(
                        tabla("zona"),
                        [
                            "id",
                        ],
                        [
                            "puesto_zona" => $idzona
                        ],
                        [
                            "LIMIT" => [0, 1]
                        ]
                );
                $iddezona = @$obteneridzona[0]['id'];

                // REGISTRAMOS EL TURNO X CLIENTE
                $pdo->insert(
                        tabla("turnoxcliente"),
                        [
                            "id_repartidor" => intval($idrepartidor),
                            "id_cliente" => intval($idcliente),
                            "id_zona" => intval($iddezona),
                            "puesto_turno" => $puestodeturno,
                            "fecha_turno" => $fecha,
                            "hora_turno" => $hora,
                            "atencion" => $atencion,
                            "estado_turno" => $estadodeturno,
                        ]
                );

                $roeCountTurnoxCliente = $pdo->id();

                if (intval($roeCountTurnoxCliente) > 0) {
                    $json['code'] = '200';
                    $json['status'] = 'Ok';
                    $json['msg'] = strings('success_create');
                    $json['data'] = '';
                } else {
                    $json['msg'] = strings('error_create');
                }
            } catch (Throwable $e) {
                $json['msg'] = strings('error_create');
            }
        } else {
            $json['msg'] = strings('error_empty');
        }
    } else if ($cmd == 'registrarreclamo') {
        // NUMERO DE ORDEN Y ITEMS
        $numerodeorden = @input('numerodeorden');
        $fechadeentrega = @input('fechadeentrega');
        $horadeentrega = @input('horadeentrega');
        $numerodeorden = @input('numerodeorden');
        $origennumerodeorden = @input('origennumerodeorden');
        $idcliente = @input('idcliente');
        $horadeentrega = @input('horadeentrega');
        $horadeentrega = @input('horadeentrega');
        $horadeentrega = @input('horadeentrega');
    } else if ($cmd == 'actualizarflag') {

        $numerodeorden = @input('numerodeorden');
        $flag = @input('flag');

        if (
                !empty($numerodeorden) &&
                intval($flag) >= 0
        ) {

            try {
                $data = $pdo->update(
                        tabla('orden'),
                        [
                            "flag" => intval($flag)
                        ],
                        [
                            "numeroorden" => strval($numerodeorden)
                        ]
                );

                $rowCount = $data->rowCount();
                if (
                        intval($rowCount) > 0
                ) {
                    $json['code'] = '200';
                    $json['status'] = 'Ok';
                    $json['msg'] = strings('success_update');
                } else {
                    $json['msg'] = strings('error_update');
                }
            } catch (Throwable $t) {
                $json['msg'] = strings('error_update');
            }
        } else {
            $json['msg'] = strings('error_empty');
        }
    } else if ($cmd === 'registrarrepartidor') {

        $codigorepartidor = input("codigodelrepartidor"); // CODIGO CON EL CUAL HARA EL LOGIN DESDE EL APP
        $nombredelrepartidor = input("nombredelrepartidor"); // Nombre Completos
        $apellidodelrepartidor = input("apellidodelrepartidor"); // Apellidos Completos
        $idzona = input('idzona'); // C1, C2
        $numerodeserieboleta = input('numserieboleta');
        $numerodeseriefactura = input('numseriefactura');

        if (
                !empty($codigorepartidor) &&
                !empty($nombredelrepartidor) &&
                !empty($apellidodelrepartidor) &&
                !empty($idzona) && // C1, C2
                !empty($numerodeserieboleta) &&
                !empty($numerodeseriefactura)
        ) {
            try {


                $data = $pdo->select(
                        tabla('zona'),
                        "id",
                        [
                            "puesto_zona" => $idzona
                        ],
                        [
                            // Get the first 1 of rows.
                            'LIMIT' => 1
                        ]
                );

                $pdo->insert(
                        tabla("repartidor"),
                        [
                            "codigo_repartidor" => $codigorepartidor,
                            "nombre_repartidor" => $nombredelrepartidor,
                            "apellido_repartidor" => $apellidodelrepartidor,
                            "id_zona" => @$data[0]['id'],
                            "NumSerieBoleta" => $numerodeserieboleta,
                            "NumSerieFactura" => $numerodeseriefactura
                        ]
                );
                $driver_id = $pdo->id();

                $pdo->insert(
                        tabla("zonaxrepartidor"),
                        [
                            "id_zona" => @$data[0]['id'],
                            "id_repartidor" => $driver_id
                        ]
                );
                $zonaxrepartidor_id = $pdo->id();

                if (
                        $account_id &&
                        $zonaxrepartidor_id
                ) {
                    $json['code'] = '200';
                    $json['status'] = 'Ok';
                    $json['msg'] = strings('success_create');
                    $json['idrepartidor'] = $driver_id;
                    $json['idzonaxrepartidor'] = $zonaxrepartidor_id;
                    $json['data'] = "";
                } else {
                    $json['msg'] = strings('error_create');
                }
            } catch (Throwable $t) {
                $json['msg'] = strings('error_create');
            }
        } else {
            $json['msg'] = strings('error_empty');
        }
    } else if ($cmd === 'registrarzonas') {
        $codigozona = input("codigozona");
        $nombrezona = input("nombredeldistrito"); // SANTA ANITA, SAN ISIDRO, SURCO
        $puestozona = input("nombrezona"); // C1, C2, C3, C4, C5, C6, C7, .....

        if (
                !empty($codigozona) &&
                !empty($nombrezona) &&
                !empty($nombrezona)
        ) {
            try {
                $pdo->insert(
                        tabla("zona"),
                        [
                            "codigo_zona" => $codigozona,
                            "nombre_zona" => strtoupper($nombrezona),
                            "puesto_zona" => ucwords(strtolower($puestozona))
                        ]
                );
                $account_id = $pdo->id();

                if ($account_id) {
                    $json['code'] = '200';
                    $json['status'] = 'Ok';
                    $json['msg'] = strings('success_create');
                    $json['data'] = "";
                    $json['idzona'] = $account_id;
                } else {
                    $json['msg'] = strings('error_create');
                }
            } catch (Throwable $t) {
                $json['msg'] = strings('error_create');
            }
        } else {
            $json['msg'] = strings('error_empty');
        }
    } else if ($cmd === 'registrarcliente') {

        $idcliente = input('idcliente'); // CORRELATIVO O EL AUTOINCREMENT DE ELLOS
        $tipodecliente = input('tipodecliente'); // Empresa o Persona
        $codigodecliente = input('codigodecliente'); // PONER EL AUTO INCREMENT QUE ESTA EN EL SISTEMA BASE
        $nombredeempresa = input('nombredeempresa'); // Poner el nombre de la empresa
        $nombredecliente = input('nombredecliente');
        $apellidopaterno = input('apellidopaterno');
        $apellidomaterno = input('apellidomaterno');
        $tipodedocumento = input('tipodedocumento'); // (1=DNI, 2=RUC, 3=C.E. 4=OTRO)
        $numerodedocumento = input('numerodedocumento');
        $direcciondelcliente = input('direcciondelcliente');
        $direcciondereferencia = input('direcciondereferencia');
        $emaildelcliente = input('emaildelcliente');
        $numerodelcliente = input('numerodecelulardelcliente');
        $codigodedistrito = input('codigodedistrito'); // Ubigeo: 324324
        $estadodelcliente = input('estadodelcliente'); // Activo o Inactivo
        $codigodezona = input('codigodezona'); // C1 , C2 , C3
        $fecharegistro = input('fecharegistro'); // Es la fecha en la que se registro el cliente
        //$cantidaddeordenatendidas = input('cantidaddeordenatendidas');
        //$importeacumulado = input('importeacumulado');

        $latitud = "";
        $longitud = "";

        if (
                !empty($idcliente) &&
                !empty($tipodecliente) &&
                !empty($codigodecliente) &&
                !empty($nombredecliente) &&
                !empty($apellidopaterno) &&
                !empty($apellidomaterno) &&
                !empty($tipodedocumento) &&
                !empty($numerodedocumento) &&
                !empty($direcciondelcliente) &&
                !empty($numerodelcliente) &&
                !empty($codigodedistrito) &&
                !empty($estadodelcliente) &&
                !empty($codigodezona) &&
                !empty($fecharegistro)
        ) {

            // VERIFICAR SI EL ID DEL CLIENTE EXISTE
            $verdificaridcliente = $pdo->select(
                    tabla('cliente'),
                    "id",
                    [
                        "id" => $idcliente
                    ]
            );

            if (
                    empty($verdificaridcliente)
            ) {
                // INSERT
                // SOLO ES UN PROMEDIO DE DONDE ESTA UBICADO 
                $latlon = getLatLonByAddressName(input('direcciondelcliente'), KEYOPENCAGE);
                if ($json) {
                    $latitud = strval(@$latlon['lat']);
                    $longitud = strval(@$latlon['lng']);
                }

                // OBTENER EL ID DE LA ZONA
                $idzona = $pdo->select(
                        tabla('zona'),
                        "id",
                        [
                            "puesto_zona" => $codigodezona
                        ]
                );

                try {
                    $pdo->insert(tabla('cliente'), [
                        "id" => intval($idcliente),
                        "Tipo_Cliente" => $tipodecliente,
                        "nombreempresa" => isEmpty($nombredeempresa),
                        "Codigo_Cliente" => isEmpty($codigodecliente),
                        "Nombre_Cliente" => $nombredecliente,
                        "ApellidoPaterno_Cliente" => $apellidopaterno,
                        "ApellidoMaterno_Cliente" => $apellidomaterno,
                        "TipoDocumento_Cliente" => $tipodedocumento,
                        "NumeroDocumento_Cliente" => $numerodedocumento,
                        "Direccion1_Cliente" => $direcciondelcliente,
                        "Direccion2_Cliente" => isEmpty($direcciondereferencia), // 
                        "Email_Cliente" => isEmpty($emaildelcliente), //
                        "NumeroCel_Cliente" => $numerodelcliente,
                        "CodDistrito1_Cliente" => $codigodedistrito,
                        "CodDistrito2_Cliente" => $codigodedistrito,
                        "Estado_Cliente" => ucwords(strtolower($estadodelcliente)),
                        "CodZona_Cliente" => intval(@$idzona[0]),
                        "FechaRegistro_Cliente" => $fecharegistro,
                        "Latitud" => isEmpty($latitud), //
                        "Longitud" => isEmpty($longitud), //
                    ]);

                    $account_id = $pdo->id();

                    if (intval($account_id)) {
                        $json['code'] = '200';
                        $json['status'] = 'Ok';
                        $json['msg'] = strings('success_create');
                    } else {
                        $json['msg'] = strings('error_create');
                    }
                } catch (Throwable $t) {
                    $json['msg'] = strings('error_create');
                }
            } else if (
                    !empty($verdificaridcliente)
            ) {
                // UPDATE
                // OBTENER EL ID DE LA ZONA
                $idzona = $pdo->select(
                        tabla('zona'),
                        "id",
                        [
                            "puesto_zona" => $codigodezona
                        ]
                );

                try {
                    $data = $pdo->update(
                            tabla('cliente'),
                            [
                                "Tipo_Cliente" => $tipodecliente,
                                "nombreempresa" => isEmpty($nombredeempresa),
                                "Codigo_Cliente" => isEmpty($codigodecliente),
                                "Nombre_Cliente" => $nombredecliente,
                                "ApellidoPaterno_Cliente" => $apellidopaterno,
                                "ApellidoMaterno_Cliente" => $apellidomaterno,
                                "TipoDocumento_Cliente" => $tipodedocumento,
                                "NumeroDocumento_Cliente" => $numerodedocumento,
                                "Direccion1_Cliente" => $direcciondelcliente,
                                "Direccion2_Cliente" => isEmpty($direcciondereferencia), // 
                                "Email_Cliente" => isEmpty($emaildelcliente), //
                                "NumeroCel_Cliente" => $numerodelcliente,
                                "CodDistrito1_Cliente" => $codigodedistrito,
                                "CodDistrito2_Cliente" => $codigodedistrito,
                                "Estado_Cliente" => ucwords(strtolower($estadodelcliente)),
                                "CodZona_Cliente" => intval(@$idzona[0]),
                                "FechaRegistro_Cliente" => $fecharegistro
                            ],
                            [
                                "id" => intval($idcliente)
                            ]
                    );

                    if ($data->rowCount()) {
                        $json['code'] = '200';
                        $json['status'] = 'Ok';
                        $json['msg'] = strings('success_update');
                    } else {
                        $json['msg'] = strings('error_update');
                    }
                } catch (Throwable $t) {
                    $json['msg'] = strings('error_update');
                }
            } else {
                $json['msg'] = 'Debe ingresar el id del cliente';
            }
        } else {
            $json['msg'] = strings('error_empty');
        }
    } else if ($cmd === 'registrararticulosimple') {

        $idarticulo = input('idarticulo');
        $nombredearticulo = input('nombredearticulo');
        $unidaddemedida = input('unidaddemedida');
        $codigodearticulo = input('idarticulo');
        $preciodearticulo = input('preciodearticulo'); // DECIMAL: 10.00
        $nombredelservicio = input('nombredelservicio'); // Manejo estas categorias y sin tildes: Agua, Promociones, Pieles, Etc..

        if (
                !empty($idarticulo) &&
                !empty($nombredearticulo) &&
                !empty($unidaddemedida) &&
                !empty($codigodearticulo) &&
                !empty($preciodearticulo) &&
                !empty($nombredelservicio)
        ) {

            // OBTENGO EL ID DEL SERVICIO
            $idservicio = $pdo->select(
                    tabla('servicio'),
                    "id",
                    [
                        "Nombre_Servicio[~]" => trim($nombredelservicio)
                    ]
            );

            // OBTENGO EL ID DEL SERVICIO
            $verificaridarticulo = $pdo->select(
                    tabla('articulo'),
                    "id",
                    [
                        "id" => intval($idarticulo)
                    ]
            );

            if (
                    !empty($verificaridarticulo)
            ) {
                // UPDATE
                try {
                    $data = $pdo->update(
                            tabla('articulo'),
                            [
                                "nombre_articulo" => strtoupper($nombredearticulo),
                                "codigo_articulo" => $idarticulo,
                                "precio_articulo" => $preciodearticulo,
                                "flkpak_prenda" => 1,
                                "Id_Servicio" => intval($idservicio[0]),
                                "estado_articulo" => 'Activo'
                            ],
                            [
                                "id" => intval($idarticulo)
                            ]
                    );

                    if ($data->rowCount()) {
                        $json['code'] = '200';
                        $json['status'] = 'Ok';
                        $json['msg'] = strings('success_update');
                    } else {
                        $json['msg'] = strings('error_update');
                    }
                } catch (Throwable $t) {
                    $json['msg'] = strings('error_update');
                }
            } else if (
                    empty($verificaridarticulo)
            ) {
                // INSERT
                try {
                    $pdo->insert(
                            tabla('articulo'),
                            [
                                "id" => intval($idarticulo),
                                "nombre_articulo" => strtoupper($nombredearticulo),
                                "codigo_articulo" => $idarticulo,
                                "precio_articulo" => $preciodearticulo,
                                "flkpak_prenda" => 1,
                                "Id_Servicio" => intval($idservicio[0]),
                                "estado_articulo" => 'Activo'
                            ]
                    );

                    $account_id = $pdo->id();

                    if (intval($account_id)) {
                        $json['code'] = '200';
                        $json['status'] = 'Ok';
                        $json['msg'] = strings('success_create');
                    } else {
                        $json['msg'] = strings('error_create');
                    }
                } catch (Throwable $t) {
                    $json['msg'] = strings('error_create');
                }
            }
        } else {
            $json['msg'] = strings('error_empty');
        }
    } else if ($cmd === 'registrararticulocompuesto') {

        // ARTICULO
        $idarticulo = input('idarticulo');
        $nombredearticulo = input('nombredearticulo');
        $unidaddemedida = input('unidaddemedida');
        $codigodearticulo = input('idarticulo');
        $preciodearticulo = input('preciodearticulo'); // DECIMAL: 10.00
        $nombredelservicio = input('nombredelservicio'); // Manejo estas categorias y sin tildes: Agua, Promociones, Pieles, Etc..
        // RECETA
        $inidarticulos = explode(",", input('inidarticulos')); // PASAR DE ESTA FORMA: inidarticulos = "1,3,4,5"

        if (
                !empty($idarticulo) &&
                !empty($nombredearticulo) &&
                !empty($unidaddemedida) &&
                !empty($codigodearticulo) &&
                !empty($preciodearticulo) &&
                !empty($nombredelservicio) &&
                !empty($inidarticulos)
        ) {

            // OBTENGO EL ID DEL SERVICIO
            $idservicio = $pdo->select(
                    tabla('servicio'),
                    "id",
                    [
                        "Nombre_Servicio[~]" => trim($nombredelservicio)
                    ]
            );

            // OBTENGO EL ID DEL SERVICIO
            $verificaridarticulo = $pdo->select(
                    tabla('articulo'),
                    "id",
                    [
                        "id" => intval($idarticulo)
                    ]
            );

            if (
                    !empty($verificaridarticulo)
            ) {

                
                // UPDATE
                try {

                    $rowCount = "";
                    try {
                        $data = $pdo->update(
                                tabla('articulo'),
                                [
                                    "nombre_articulo" => strtoupper($nombredearticulo),
                                    "codigo_articulo" => $idarticulo,
                                    "precio_articulo" => $preciodearticulo,
                                    "flkpak_prenda" => 1,
                                    "Id_Servicio" => intval($idservicio[0]),
                                    "estado_articulo" => 'Activo'
                                ],
                                [
                                    "id" => intval($idarticulo)
                                ]
                        );

                        $rowCount = $data->rowCount();
                    } catch (Throwable $t) {
                        
                    }
                    
                    // OTRO TRY PARA ELIMINAR LA RECETA Y OTRO PARA REGISTARR LA RECETA

                    if ($rowCount) {
                        $json['code'] = '200';
                        $json['status'] = 'Ok';
                        $json['msg'] = strings('success_update');
                    } else {
                        $json['msg'] = strings('error_update');
                    }
                } catch (Throwable $t) {
                    $json['msg'] = strings('error_update');
                }
            } else if (
                    empty($verificaridarticulo)
            ) {
                // INSERT
                try {

                    // INSERTO EL ARTICULO
                    $pdo->insert(
                            tabla('articulo'),
                            [
                                "id" => intval($idarticulo),
                                "nombre_articulo" => strtoupper($nombredearticulo),
                                "codigo_articulo" => $idarticulo,
                                "precio_articulo" => $preciodearticulo,
                                "flkpak_prenda" => 1,
                                "Id_Servicio" => intval($idservicio[0]),
                                "estado_articulo" => 'Activo'
                            ]
                    );
                    $account_id = $pdo->id();

                    // INSERTO LAS PIEZAS
                    $insertpiezas = [];
                    for ($a = 0; $a < count($inidarticulos); $a++) {
                        $insertpiezas[] = array(
                            "IdArticulo_Receta" => intval($idarticulo),
                            "Cantidad_Receta" => 1,
                            "IdArticulo_Receta" => intval($inidarticulos[$a])
                        );
                    }                    

                    // INSERTO EL ARTICULO
                    $pdo->insert(
                            tabla('receta'),
                            [
                                $insertpiezas
                            ]
                    );
                    
                    var_dump($pdo->log());
                    die();

                    if (intval($account_id)) {
                        $json['code'] = '200';
                        $json['status'] = 'Ok';
                        $json['msg'] = strings('success_create');
                    } else {
                        $json['msg'] = strings('error_create');
                    }
                } catch (Throwable $t) {
                    $json['msg'] = strings('error_create');
                }
            }
        } else {
            $json['msg'] = strings('error_empty');
        }
    } else {
        $json['msg'] = strings('error_cmd');
    }
} else if (METODO($method) == 'PUT') {
    
} else if (METODO($method) == 'DELETE') {
    
} else {
    $json['msg'] = strings('error_method');
}


//'X-Requested-With', 'XMLHttpRequest'
header('Content-Type: application/json');
echo json_encode($json, JSON_UNESCAPED_UNICODE);

