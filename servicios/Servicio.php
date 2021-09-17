<?php

include './include/app.php';
include './include/session.php';

if ($ajax) {
    if (METODO($method) == 'GET') {
        if ($cmd == 'listaservicios') {
            $data = $pdo->select(
                    tabla('servicio'),
                    [
                        tabla('servicio') . ".id(idservicio)",
                        tabla('servicio') . ".Codigo_Servicio(codigoservicio)",
                        tabla('servicio') . ".Dias_Servicio(diasservicio)",
                        tabla('servicio') . ".Nombre_Servicio(nombreservicio)",
                        tabla('servicio') . ".Estado_Servicio(estadoservicio)",
                        tabla('servicio') . ".Orden_Servicio(ordenservicio)",
                    ],
                    [
                        tabla('servicio') . ".Estado_Servicio" => 'Activo',
                    ],
                    [
                        // Multiple condition.
                        "ORDER" => [
                            "Orden_Servicio" => "DESC"
                        ]
                    ]
            );

            if ($data) {

                // Ejm: https://academy.leewayweb.com/como-ordenar-un-array-multidimensional-en-php/
                usort($data, function (array $elem1, $elem2) {
                    return $elem1['ordenservicio'] <=> $elem2['ordenservicio'];
                });
                // 2 - SECO,3 - AGUA,4 - PIELES,6 - COSTURA,5 - PLANCHADO,1 - PROMOCIONES


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
