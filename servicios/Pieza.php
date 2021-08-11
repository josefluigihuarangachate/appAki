<?php

include './include/app.php';
include './include/session.php';

if ($ajax) {
    if (METODO($method) == 'GET') {
        if ($cmd == 'listapiezasxprenda') {
            $idprenda = input('idprenda');
            $data = $pdo->select(
                    tabla('receta'),
                    [
                        //INNER JOIN
                        "[><]" . tabla('articulo') =>
                        [
                            tabla('receta') . ".IdArticuloPieza_Receta" => "id"
                        ],
                    ],
                    [
                        tabla('articulo') . ".id(idpieza)",
                        tabla('articulo') . ".Nombre_Articulo(nombrepieza)",
                    ],
                    [
                        tabla('receta') . '.IdArticulo_Receta' => $idprenda,
                    ]
            );

            if ($data || empty($data)) {
                $json['code'] = '200';
                $json['status'] = 'Ok';
                $json['msg'] = strings('success_read');
                $json['cantpiezas'] = count($data);
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
