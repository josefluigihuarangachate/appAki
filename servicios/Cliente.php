<?php

include './include/app.php';
include './include/session.php';

use Medoo\Medoo;

if ($ajax) {
    if (METODO($method) == 'GET') {
        
    } else if (METODO($method) == 'POST') {
        if ($cmd == 'listarclienteturnoxreparto') {

            $idzona = @$_SESSION['idzonetemp'];
            $tipoturno = input('tipoturno');
            $idrepartidor = @$_SESSION[atributo('id')];

            if (strtolower($tipoturno) == "mañana") {
                $tipoturno = "Temprano";
            }

            $data = $pdo->select(
                    tabla('turnoxcliente'),
                    [
                        //INNER JOIN
                        "[><]" . tabla('zona') =>
                        [
                            tabla('turnoxcliente') . ".id_zona" => "id"
                        ],
                        //INNER JOIN
                        "[><]" . tabla('cliente') =>
                        [
                            tabla('turnoxcliente') . ".id_cliente" => "id"
                        ],
                        //INNER JOIN
                        "[><]" . tabla('distrito') =>
                        [
                            tabla('cliente') . ".CodDistrito1_Cliente" => "Codigo_Distrito"
                        ],
                    ],
                    [
                        // ESTOS DATOS JALO DE LA TABLA ATENCION
                        tabla('zona') . ".id(idzona)",
                        tabla('zona') . ".codigo_zona(codigozona)",
                        tabla('zona') . ".nombre_zona(nombrezona)",
                        tabla('turnoxcliente') . ".id(idturnoxcliente)",
                        tabla('turnoxcliente') . ".id_cliente(idcliente)",
                        tabla('turnoxcliente') . ".fecha_turno(fechaturno)",
                        tabla('turnoxcliente') . ".hora_turno(horaturno)",
                        tabla('turnoxcliente') . ".estado_turno(estadoturno)",
                        tabla('turnoxcliente') . ".numero_orden(numeroorden)",
                        tabla('cliente') . ".nombre_cliente(nombrecliente)",
                        tabla('cliente') . ".apellidopaterno_cliente(apellidopaternocliente)",
                        tabla('cliente') . ".apellidomaterno_cliente(apellidomaternocliente)",
                        tabla('cliente') . ".numerocel_cliente(numerocelcliente)",
                        tabla('cliente') . ".direccion1_cliente(direccion1cliente)",
                        tabla('cliente') . ".latitud(latitudcliente)",
                        tabla('cliente') . ".longitud(longitudcliente)",
                    ],
                    [
                        tabla('turnoxcliente') . '.id_zona' => $idzona,
                        tabla('turnoxcliente') . '.id_repartidor' => $idrepartidor,
                        tabla('turnoxcliente') . '.puesto_turno' => $tipoturno,
                        tabla('turnoxcliente') . '.fecha_turno' => date('Y-m-d'),
                        tabla('turnoxcliente') . '.atencion' => 'Sin Atender',
                    ],
                    [
                        // Multiple condition.
                        "ORDER" => [
                            tabla('turnoxcliente') . ".fecha_turno(fechaturno)" => "DESC",
                            tabla('turnoxcliente') . ".hora_turno(horaturno)" => "DESC",
                        ]
                    ]
            );
            if ($data) {
                usort($data, function (array $elem1, $elem2) {
                    return $elem1['horaturno'] <=> $elem2['horaturno'];
                });
                $json['code'] = '200';
                $json['status'] = 'Ok';
                $json['msg'] = strings('success_read');
                $json['data'] = $data;
            } else {
                $json['msg'] = strings('error_read');
            }
        } else if ($cmd == 'listarturnoxreparto') {

            $idzona = @$_SESSION['idzonetemp'];
            $idrepartidor = @$_SESSION[atributo('id')];

            // select($table, $join, $columns, $where)

            $data = $pdo->select(
                    tabla('turnoxcliente'),
                    [
                        //INNER JOIN
                        "[><]" . tabla('zona') =>
                        [
                            tabla('turnoxcliente') . ".id_zona" => "id"
                        ],
                        //INNER JOIN
                        "[><]" . tabla('cliente') =>
                        [
                            tabla('turnoxcliente') . ".id_cliente" => "id"
                        ],
                        //INNER JOIN
                        "[><]" . tabla('distrito') =>
                        [
                            tabla('cliente') . ".CodDistrito1_Cliente" => "Codigo_Distrito"
                        ],
                    ],
                    [
                        // ESTOS DATOS JALO DE LA TABLA ATENCION
                        tabla('zona') . ".id(idzona)",
                        tabla('zona') . ".codigo_zona(codigozona)",
                        tabla('zona') . ".nombre_zona(nombrezona)",
                        tabla('zona') . ".descripcion_zona(descripcionzona)",
                        tabla('zona') . ".puesto_zona(puestozona)",
                        tabla('zona') . ".imagen_zona(imagenzona)",
                        tabla('turnoxcliente') . ".id(idturnoxcliente)",
                        tabla('turnoxcliente') . ".id_repartidor(idrepartidor)",
                        tabla('turnoxcliente') . ".id_cliente(idcliente)",
                        tabla('turnoxcliente') . ".puesto_turno(puestoturno)",
                        tabla('turnoxcliente') . ".fecha_turno(fechaturno)",
                        tabla('turnoxcliente') . ".hora_turno(horaturno)",
                        tabla('turnoxcliente') . ".estado_turno(estadoturno)",
                        tabla('turnoxcliente') . ".numero_orden(numeroorden)",
                        tabla('cliente') . ".nombre_cliente(nombrecliente)",
                        tabla('cliente') . ".apellidopaterno_cliente(apellidopaternocliente)",
                        tabla('cliente') . ".apellidomaterno_cliente(apellidomaternocliente)",
                        tabla('cliente') . ".numerocel_cliente(numerocelcliente)",
                        tabla('cliente') . ".direccion1_cliente(direccion1cliente)",
                        tabla('cliente') . ".latitud(latitudcliente)",
                        tabla('cliente') . ".longitud(longitudcliente)",
                    ],
                    [
                        tabla('turnoxcliente') . '.id_zona' => $idzona,
                        tabla('turnoxcliente') . '.id_repartidor' => $idrepartidor,
                        tabla('turnoxcliente') . '.fecha_turno' => date('Y-m-d'),
                        tabla('turnoxcliente') . '.atencion' => 'Sin Atender',
                        tabla('turnoxcliente') . '.estado_turno' => ['Recojo', 'Entrega'],
                    ]
            );

            // SELECCIONO TODO LOS RECLAMOS
            // Medoo::raw("(SELECT fechaentrega FROM " . tabla('reclamoxprenda') . " WHERE fechaentrega='" . date('Y-m-d') . "' LIMIT 1)"),

            $ordenes = $pdo->select(tabla('reclamoxprenda'),
                    [
                        "@origennumeroorden",
                    ],
                    [
                        "fechaentrega[>]" => date('Y-m-d')
                    ]
            );

            $arr_ordenes = [-222222];
            if ($ordenes) {
                $arr_ordenes = [];
                for ($or = 0; $or < count($ordenes); $or++) {
                    $arr_ordenes[] = $ordenes[$or]['origennumeroorden'];
                }
            }
            unset($ordenes);

            $reclamo = $pdo->select(
                    tabla('turnoxcliente'),
                    [
                        //INNER JOIN
                        "[><]" . tabla('zona') =>
                        [
                            tabla('turnoxcliente') . ".id_zona" => "id"
                        ],
                        //INNER JOIN
                        "[><]" . tabla('cliente') =>
                        [
                            tabla('turnoxcliente') . ".id_cliente" => "id"
                        ],
                        //INNER JOIN
                        "[><]" . tabla('distrito') =>
                        [
                            tabla('cliente') . ".CodDistrito1_Cliente" => "Codigo_Distrito"
                        ],
                    ],
                    [
                        // ESTOS DATOS JALO DE LA TABLA ATENCION
                        tabla('zona') . ".id(idzona)",
                        tabla('zona') . ".codigo_zona(codigozona)",
                        tabla('zona') . ".nombre_zona(nombrezona)",
                        tabla('zona') . ".descripcion_zona(descripcionzona)",
                        tabla('zona') . ".puesto_zona(puestozona)",
                        tabla('zona') . ".imagen_zona(imagenzona)",
                        tabla('turnoxcliente') . ".id(idturnoxcliente)",
                        tabla('turnoxcliente') . ".id_repartidor(idrepartidor)",
                        tabla('turnoxcliente') . ".id_cliente(idcliente)",
                        tabla('turnoxcliente') . ".puesto_turno(puestoturno)",
                        'fechaturno' => Medoo::raw('(select current_date)'),
                        //tabla('turnoxcliente') . ".fecha_turno(fechaturno)",
                        tabla('turnoxcliente') . ".hora_turno(horaturno)",
                        tabla('turnoxcliente') . ".estado_turno(estadoturno)",
                        tabla('turnoxcliente') . ".numero_orden(numeroorden)",
                        tabla('cliente') . ".nombre_cliente(nombrecliente)",
                        tabla('cliente') . ".apellidopaterno_cliente(apellidopaternocliente)",
                        tabla('cliente') . ".apellidomaterno_cliente(apellidomaternocliente)",
                        tabla('cliente') . ".numerocel_cliente(numerocelcliente)",
                        tabla('cliente') . ".direccion1_cliente(direccion1cliente)",
                        tabla('cliente') . ".latitud(latitudcliente)",
                        tabla('cliente') . ".longitud(longitudcliente)",
                    ],
                    [
                        tabla('turnoxcliente') . '.id_zona' => $idzona,
                        tabla('turnoxcliente') . '.id_repartidor' => $idrepartidor,
                        tabla('turnoxcliente') . '.numero_orden' => $arr_ordenes,
                        tabla('turnoxcliente') . '.atencion' => 'Sin Atender',
                        tabla('turnoxcliente') . '.estado_turno' => ['Reclamo'],
                    ]
            );

            if ($reclamo) {
                $resultado = array_merge($data, $reclamo);
                $data = $resultado;

                // ACTUALIZAR LAS FECHAS DE LAS ORDENES Y DE LAS DE TURNO X CLIENTE
                $pdo->update(
                        tabla('turnoxcliente'),
                        [
                            "fecha_turno" => date('Y-m-d')
                        ],
                        [
                            "numero_orden" => $arr_ordenes
                        ]
                );                
                $pdo->update(
                        tabla('orden'),
                        [
                            "fecha_turno" => date('Y-m-d')
                        ],
                        [
                            "numeroorden" => $arr_ordenes
                        ]
                );
                // FIN DE ACTUALIZAR LAS FECHAS DE LAS ORDENES Y DE LAS DE TURNO X CLIENTE
                
            }

            //imprimir($data);
            //die();

            if ($data) {
                $json['code'] = '200';
                $json['status'] = 'Ok';
                $json['msg'] = strings('success_read');
                $json['data'] = $data;
            } else {
                $json['msg'] = strings('error_read');
            }
        } else if ($cmd == 'guardaridturnoxrepartidor') {
            if (input('idturnoxrepartidor')) {
                $_SESSION['idclientetemp'] = input('idcliente');
                $_SESSION['idturnoxrepartidortemp'] = input('idturnoxrepartidor');
                $_SESSION['numeroordentemp'] = input('numeroorden');

                $_SESSION['estadoturnotemp'] = input('estadoturno');

                $_SESSION['nombrecliente'] = input('nombrecliente');
                $_SESSION['telefono'] = input('telefono');
                $_SESSION['direccion'] = input('direccion');

                $json['code'] = '200';
                $json['status'] = 'Ok';
                $json['msg'] = strings('success_session');
            } else {
                $json['msg'] = strings('error_session');
            }
        } else {
            $json['msg'] = strings('error_cmd');
        }
    } else if (METODO($method) == 'PUT') {
        
    } else if (METODO($method) == 'DELETE') {
        
    } else {
        $json['msg'] = strings('error_method');
    }
}

//'X-Requested-With', 'XMLHttpRequest'
header('Content-Type: application/json');
echo json_encode($json, JSON_UNESCAPED_UNICODE);
