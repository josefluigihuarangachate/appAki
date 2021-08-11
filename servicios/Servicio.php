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
                        tabla('servicio') . ".Nombre_Servicio(nombreservicio)",
                        tabla('servicio') . ".Estado_Servicio(estadoservicio)",
                        tabla('servicio') . ".Dias_Servicio(diasservicio)",
                    ],
                    [
                        tabla('servicio') . ".Estado_Servicio" => 'Activo',
                    ],
                    [
                        // Multiple condition.
                        "ORDER" => [
                            "Nombre_Servicio" => "ASC"
                        ]
                    ]
            );

            if ($data) {
                
                // Ejm: https://academy.leewayweb.com/como-ordenar-un-array-multidimensional-en-php/
                usort($data, function (array $elem1, $elem2) {
                    return $elem1['nombreservicio'] <=> $elem2['nombreservicio'];
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
        
    } else if (METODO($method) == 'PUT') {
        
    } else if (METODO($method) == 'DELETE') {
        
    } else {
        $json['msg'] = strings('error_method');
    }
}

//'X-Requested-With', 'XMLHttpRequest'
header('Content-Type: application/json');
echo json_encode($json, JSON_UNESCAPED_UNICODE);
