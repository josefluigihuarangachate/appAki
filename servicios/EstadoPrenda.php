<?php

include './include/app.php';
include './include/session.php';

if ($ajax) {
    if (METODO($method) == 'GET') {
        if ($cmd == 'listaestadoprenda') {
            $data = $pdo->select(
                    tabla('estadoprenda'),
                    [
                        tabla('estadoprenda') . ".id(idestadoprenda)",
                        tabla('estadoprenda') . ".Codigo_Prenda(codigoprenda)",
                        tabla('estadoprenda') . ".Nombre_Prenda(nombreprenda)",
                        tabla('estadoprenda') . ".Estado_Prenda(estadoprenda)",
                    ],
                    [
                        tabla('estadoprenda') . ".Estado_Prenda" => 'Activo',
                    ]
            );

            if ($data) {
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
        
    } else if (METODO($method) == 'PUT') {
        
    } else if (METODO($method) == 'DELETE') {
        
    } else {
        $json['msg'] = strings('error_method');
    }
}

//'X-Requested-With', 'XMLHttpRequest'
header('Content-Type: application/json');
echo json_encode($json, JSON_UNESCAPED_UNICODE);
