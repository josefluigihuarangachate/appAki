<?php

include './include/app.php';
include './include/session.php';

if ($ajax) {
    if (METODO($method) == 'GET') {
        if ($cmd == 'listacolor') {
            $data = $pdo->select(
                    tabla('color'),
                    [
                        // ESTOS DATOS JALO DE LA TABLA ATENCION
                        tabla('color') . ".id(idcolor)",
                        tabla('color') . ".Nombre_Color(nombrecolor)",
                    ],
                    [
                        tabla('color') . ".Estado_Color" => 'Activo'
                    ]
            );
            if ($data) {
                usort($data, function (array $elem1, $elem2) {
                    return $elem1['nombrecolor'] <=> $elem2['nombrecolor'];
                });
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
        if ($cmd == 'registrartagscolor') {
            $nombrecolor = input('color');
            if (!empty($nombrecolor) && !is_numeric($nombrecolor)) {
                try {
                    $data = $pdo->insert(tabla('color'), [
                        "Nombre_Color" => strtoupper(strtolower($nombrecolor)),
                        "Estado_Color" => "Activo",
                    ]);
                    $account_id = $pdo->id();

                    if ($account_id) {
                        $json['code'] = '200';
                        $json['status'] = 'Ok';
                        $json['msg'] = strings('success_create');
                    } else {
                        $json['msg'] = strings('error_create');
                    }
                } catch (Throwable $t) {
                    $json['msg'] = strings('error_create');
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
}

//'X-Requested-With', 'XMLHttpRequest'
header('Content-Type: application/json');
echo json_encode($json, JSON_UNESCAPED_UNICODE);
