<?php

include './include/app.php';
include './include/session.php';

if (METODO($method) == 'POST') {

    if ($cmd == 'registrarrecojo') {
        
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
                            "id_repartidor" => $idrepartidor,
                            "id_cliente" => $idcliente,
                            "id_zona" => $iddezona,
                            "puesto_turno" => $puestodeturno,
                            "fecha_turno" => $fecha,
                            "hora_turno" => $hora,
                            "atencion" => $atencion,
                            "estado_turno" => $estadodeturno,
                        ]
                );
                $roeCountTurnoxCliente = $pdo->id();

                if ($roeCountTurnoxCliente) {
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
    } else if ($cmd == 'registrarentrega') {
        $tipodeservicio = input('tipodeservicio'); // AYUDARA A SABER SI ES UNA PROMOCION O PIEZA
        $numerodeorden = input('numerodeorden');
        $nombredeservicio = input('nombredeservicio');
        $idrepartidor = input('idrepartidor'); // AUTO INCREMENT ID, ACA SE CREARA UN WEBSERVICE PARA QUE PUEDA CONSUMIR
        $nombrederepartidor = input('nombrederepartidor'); // EL WEB SERVICE DE CONSULTAR AL REPARTIDOR     
        $idcliente = input('idcliente'); // AUTO INCREMENT ID
        $nombredecliente = input('nombredecliente');
        $fecha = input('fechacreadalaorden');
        $hora = input('horacreadalaorden');
        $celulardecliente = input('celulardecliente');
        $direcciondecliente = input('direcciondecliente');
        $fechadeentrega = input('fechadeentrega');
        $horadeentrega = input('horadeentrega');
        $tipodecobro = input('tipodecobro'); // ('Por Cobrar','Cancelado','Reclamo','Aceptado')
        $idzona = input('idzona');  // (C1, C2, C3, ETC)
        $total_s_dscto = isEmpty(@input('total_s_dscto'));
        $descuento = isEmpty(@input('descuento'));
        $totalapagar = input('totalapagar');
        $a_cuenta = isEmpty(@input('a_cuenta'));
        $saldo = isEmpty(@input('saldo'));
        $estado = input('estado');
        $tipodepago = input('tipodepago'); //  ('Efectivo','Tarjeta Credito/Debito','Cheque','Deposito','Yape','Plin','Por Cobrar')
        $tipodeatencion = input('tipodeatencion'); // ('Entrega', 'Recojo')
        $detalledeorden = input('array_orden');

        if (
                $numerodeorden &&
                $nombredeservicio &&
                $nombrederepartidor &&
                $fecha &&
                $hora &&
                $nombredecliente &&
                $celulardecliente &&
                $direcciondecliente &&
                $fechadeentrega &&
                $horadeentrega &&
                $tipodecobro &&
                $idzona &&
                $totalapagar &&
                $estado &&
                $tipodepago &&
                $tipodeatencion &&
                $detalledeorden
        ) {

            // OBTENGO EL ID DEL SERVICIO POR EL NOMBRE
            $obteneriddelservicio = $pdo->select(tabla("servicio"),
                    [
                        "id",
                        "Nombre_Servicio",
                    ],
                    [
                        "Nombre_Servicio" => $nombredeservicio
                    ],
                    [
                        "LIMIT" => [0, 1]
                    ]
            );
            $idservicio = @$obteneriddelservicio[0]['id'];
            $nombredeservicio = @$obteneriddelservicio[0]['Nombre_Servicio'];

            if ($idservicio) {
                try {

                    // INSERTAMOS EL RECOJO O LA ENTREGA
                    $pdo->insert(tabla("orden"), [
                        "idservicio" => $idservicio,
                        "numeroorden" => $numerodeorden,
                        "nombre_servicio" => $nombredeservicio,
                        "nombre_repartidor" => $nombrederepartidor,
                        "fecha" => $fecha,
                        "hora" => $hora,
                        "idcliente" => $idcliente,
                        "nombre_cliente" => $nombredecliente,
                        "celular_cliente" => $celulardecliente,
                        "direccion_cliente" => $direcciondecliente,
                        "fecha_entrega" => $fechadeentrega,
                        "hora_entrega" => $horadeentrega,
                        "tipo_cobro" => $tipodecobro,
                        "idzona" => $idzona,
                        "total_s_dscto" => $total_s_dscto,
                        "descuento" => $descuento,
                        "total_pagar" => $totalapagar,
                        "a_cuenta" => $a_cuenta,
                        "saldo" => $saldo,
                        "estado" => $estado,
                        "tipo_pago" => $tipodepago,
                        "tipo_atencion" => ucwords(strtolower($tipodeatencion)),
                        "array_detalleorden" => strval($detalledeorden),
                    ]);
                    $roeCountOrden = $pdo->id();

                    // REGISTRAMOS EL TURNO X CLIENTE
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

                    $pdo->insert(tabla("turnoxcliente"), [
                        "numero_orden" => $numerodeorden,
                        "id_repartidor" => $idrepartidor,
                        "id_cliente" => $idcliente,
                        "id_zona" => $iddezona, // 
                        "puesto_turno" => temprano_tarde($horadeentrega),
                        "fecha_turno" => $fechadeentrega,
                        "hora_turno" => $horadeentrega,
                        "atencion" => "Sin Atender",
                        "estado_turno" => ucwords(strtolower($tipodeatencion)),
                    ]);
                    $roeCountTurnoxCliente = $pdo->id();

                    if ($roeCountOrden && $roeCountTurnoxCliente) {
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
                $json['msg'] = "El servicio no existe: Usar una de estas opciones. Promociones, Seco, Agua, Pieles, Planchado ó Costura";
            }
        } else {
            $json['msg'] = strings('error_empty');
        }
    } else {
        $json['msg'] = strings('error_cmd');
    }
} else if (METODO($method) == 'GET') {

    if ($cmd == 'listadoderepartidores') {
        @$idderepartidor = input('idrepartidor'); // PARAMETRO OPCIONAL
        $where = "";
        if (@$idderepartidor) {
            $where = [
                'id' => @$idderepartidor
            ];
        }
        $data = $pdo->select(
                tabla('repartidor'),
                [
                    'id(idrepartidor)',
                    'codigo_repartidor(codigodelrepartidor)',
                    'nombre_repartidor(nombrederepartidor)',
                    'apellido_repartidor(apellidosdelrepartidor)',
                    'id_zona(idzona)',
                    'Latitud(latitud)',
                    'Longitud(longitud)',
                    'Estado_Repartidor(estadodelrepartidor)',
                ],
                $where
        );

        if ($data) {
            $json['code'] = '200';
            $json['status'] = 'Ok';
            $json['msg'] = strings('success_read');
            $json['data'] = $data;
        } else {
            $json['msg'] = strings('error_read');
        }
    } else if ($cmd == 'listadodezonas') {
        @$iddezona = input('idzona'); // PARAMETRO OPCIONAL
        $where = "";
        if (@$iddezona) {
            $where = [
                'id' => @$iddezona
            ];
        }
        $data = $pdo->select(
                tabla('zona'),
                [
                    'id(idzona)',
                    'codigo_zona(codigodezona)',
                    'nombre_zona(nombredezona)',
                    'puesto_zona(puestodezona)'
                ],
                $where
        );

        if ($data) {
            $json['code'] = '200';
            $json['status'] = 'Ok';
            $json['msg'] = strings('success_read');
            $json['data'] = $data;
        } else {
            $json['msg'] = strings('error_read');
        }
    } else if ($cmd == 'listadodeclientes') {
        // SELECT * FROM CLIENTES
        // select($table, $join, $columns, $where)

        @$iddelcliente = input('idcliente'); // PARAMETRO OPCIONAL
        $where = "";
        if (@$iddelcliente) {
            $where = [
                'id' => @$iddelcliente
            ];
        }

        $data = $pdo->select(
                tabla('cliente'),
                [
                    'id(idcliente)',
                    'Tipo_Cliente(tipodecliente)',
                    'Codigo_Cliente(codigodelcliente)', // AQUI PUEDE SER SU MISMO ID DEL CLIENTE
                    'Nombre_Cliente(nombredelcliente)',
                    'ApellidoPaterno_Cliente(apellidopaterno)',
                    'ApellidoMaterno_Cliente(apellidomaterno)',
                    'TipoDocumento_Cliente(tipodedocumento)',
                    'NumeroDocumento_Cliente(numerodedocumento)',
                    'Direccion1_Cliente(direcciondelcliente)',
                    'Direccion2_Cliente(referenciadedireccion)',
                    'Email_Cliente(correoelectronico)',
                    'NumeroCel_Cliente(numerodecelular)',
                    'CodDistrito1_Cliente(codigodedistrito)',
                    'Estado_Cliente(estadodelcliente)', // Activo o Inactivo
                    'CodZona_Cliente(codigodezona)',
                    'FechaRegistro_Cliente(fechaderegistro)',
                    'Latitud',
                    'Longitud'
                ],
                $where
        );

        if ($data) {

            function bucleRecursiva($arr, $i) {
                if (@$arr[$i]) {
                    $arr[$i]['tiponombredocumento'] = tipo_documento($arr[$i]['tipodedocumento']);
                    ksort($arr[$i]);
                    return bucleRecursiva($arr, $i + 1);
                }
                return $arr;
            }

            $datos = bucleRecursiva($data, 0);

            $json['code'] = '200';
            $json['status'] = 'Ok';
            $json['msg'] = strings('success_read');
            $json['data'] = $datos;
        } else {
            $json['msg'] = strings('error_read');
        }
    }
} else if (METODO($method) == 'PUT') {
    
} else if (METODO($method) == 'DELETE') {
    
} else {
    $json['msg'] = strings('error_method');
}


//'X-Requested-With', 'XMLHttpRequest'
header('Content-Type: application/json');
echo json_encode($json, JSON_UNESCAPED_UNICODE);
