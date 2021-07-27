<?php

include './include/app.php';
include './include/session.php';

if ($ajax) {
    if (METODO($method) == 'GET') {
        
    } else if (METODO($method) == 'POST') {
        if ($cmd == 'listarturnoxreparto') {

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
                        tabla('cliente') . ".nombre_cliente(nombrecliente)",
                        tabla('cliente') . ".apellidopaterno_cliente(apellidopaternocliente)",
                        tabla('cliente') . ".apellidomaterno_cliente(apellidomaternocliente)",
                        tabla('cliente') . ".numerocel_cliente(numerocelcliente)",
                        tabla('cliente') . ".direccion1_cliente(direccion1cliente)",
                    ],
                    [
                        tabla('turnoxcliente') . '.id_zona' => $idzona,
                        tabla('turnoxcliente') . '.id_repartidor' => $idrepartidor,
                        tabla('turnoxcliente') . '.fecha_turno' => date('Y-m-d'),
                    ]
            );
            //imprimir($data);
            //die();
            //var_dump($pdo->log());
            //die();
            //var_dump($pdo->log());
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
                $_SESSION['idturnoxrepartidortemp'] = input('idturnoxrepartidor');
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
