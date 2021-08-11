<?php

include './include/app.php';
include './include/session.php';

if ($ajax) {
    if (METODO($method) == 'GET') {



        if ($cmd == 'listaarticuloxservicio') {
            $idservicio = input('idservicio');
            $data = $pdo->select(
                    tabla('articulo'),
                    [
                        tabla('articulo') . ".id(idarticulo)",
                        tabla('articulo') . ".Nombre_Articulo(nombrearticulo)",
                        tabla('articulo') . ".Unidadmedida_Articulo(unidadmedidaarticulo)",
                        tabla('articulo') . ".Precio_Articulo(precioarticulo)",
                    ],
                    [
                        tabla('articulo') . ".Id_Servicio" => $idservicio,
                        tabla('articulo') . ".Estado_Articulo" => 'Activo',
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
        } else if ($cmd == 'listamarcaxarticulo') {
            $idarticulo = input('idarticulo');
            $data = $pdo->select(
                    tabla('marca'),
                    [
                        //INNER JOIN
                        "[><]" . tabla('articulo') =>
                        [
                            tabla('marca') . ".id" => "IdMarca_Articulo"
                        ],
                    ],
                    [
                        // ESTOS DATOS JALO DE LA TABLA ATENCION
                        tabla('marca') . ".id(idmarca)",
                        tabla('marca') . ".Nombre_Marca(nombremarca)",
                    ],
                    [
                        tabla('articulo') . '.id' => $idarticulo,
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
        } else if ($cmd == 'listaarticulos') {
            $data = $pdo->select(
                    tabla('articulo'),
                    [
                        tabla('articulo') . ".id(idarticulo)",
                        tabla('articulo') . ".Nombre_Articulo(descripcionarticulo)",
                        tabla('articulo') . ".unidadmedida_articulo(unidadmedidaarticulo)",
                        tabla('articulo') . ".precio_articulo(precioarticulo)",
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
