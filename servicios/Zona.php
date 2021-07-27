<?php

include './include/app.php';
include './include/session.php';

if ($ajax) {
    if (METODO($method) == 'GET') {
        
    } else if (METODO($method) == 'POST') {
        if ($cmd == 'listarzonas') {
            $idrepartidor = $_SESSION[atributo('id')];

            // select($table, $join, $columns, $where)
            $data = $pdo->select(
                    tabla('zonaxrepartidor'),
                    [
                        //INNER JOIN
                        "[><]" . tabla('zona') =>
                        [
                            "id_zona" => "id"
                        ],
                    ],
                    [
                        tabla('zona') . ".id(idzona)",
                        tabla('zona') . ".codigo_zona(codigozona)",
                        tabla('zona') . ".nombre_zona(nombrezona)",
                        tabla('zona') . ".descripcion_zona(descripcionzona)",
                        tabla('zona') . ".puesto_zona(puestozona)",
                        tabla('zona') . ".imagen_zona(imagenzona)",
                        //tabla('zona') . ".turno_zona(turnozona)",
                    ],
                    [
                        tabla('zonaxrepartidor') . '.id_repartidor' => $idrepartidor
                    ]
            );
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
        } else if ($cmd == 'guardaridzona') {
            if (input('idzone')) {
                $_SESSION['idzonetemp'] = input('idzone');
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
