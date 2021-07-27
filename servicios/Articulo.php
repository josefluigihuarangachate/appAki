<?php

include './include/app.php';
include './include/session.php';

if ($ajax) {
    if (METODO($method) == 'GET') {
        if ($cmd == 'listaarticulos') {
            $data = $pdo->select(
                    tabla('articulo'),
                    [
                        tabla('articulo') . ".id(idarticulo)",
                        tabla('articulo') . ".descripcion_articulo(descripcionarticulo)",
                        tabla('articulo') . ".unidadmedida_articulo(unidadmedidaarticulo)",
                        tabla('articulo') . ".dias_articulo(diasarticulo)",
                        tabla('articulo') . ".precio_articulo(precioarticulo)",
                        tabla('articulo') . ".cantidad_prendas(cantidadprenda)",
                    ],
                    [
                        tabla('articulo') . ".estado_articulo" => 'Activo',
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
