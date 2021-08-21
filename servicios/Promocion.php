<?php

include './include/app.php';
include './include/session.php';

use Medoo\Medoo;

if ($ajax) {
    if (METODO($method) == 'GET') {
        if ($cmd == 'listapiezasxpromocion') {
            $idprenda = input('idprenda');

            $data = $pdo->select(
                    tabla('promocion'),
                    [
                        //INNER JOIN
                        "[><]" . tabla('articulo') =>
                        [
                            tabla('promocion') . ".idarticulo_promocion" => "id"
                        ],
                    ],
                    [
                        // ESTOS DATOS JALO DE LA TABLA PROMOCION
                        tabla('promocion') . ".id(idpromocion)",
                        tabla('promocion') . ".idarticulo_promocion(idarticulopromocion)",
                        tabla('promocion') . ".nombre_promocion(nombrepromocion)",
                        tabla('promocion') . ".precio_promocion(preciopromocion)",
                        'subarticulos' => Medoo::raw('null')
                    ],
                    [
                        tabla('promocion') . '.idarticulo_promocion' => $idprenda,
                        tabla('promocion') . '.estado_promocion' => 'Activo',
                    ]
            );

            // array_column = OBTENGOS LOS IDs EN ARRAY DE LOS ARTICULOS PARA LISTAR LAS PRENDAS
            // implode = COMBIERTO EN STRING, EJM: 4,5,6
            // array_map = convierte el string implode en valor entero a cada valor
            // Ejm: https://www.codegrepper.com/code-examples/php/php+get+id+of+array+element
            // Ejm: https://stackoverflow.com/a/50765778/16488926
            $in_promocion = array_map('intval', array_column($data, 'idpromocion'));

            $subdata = $pdo->select(
                    tabla('promocionxarticulo'),
                    [
                        //INNER JOIN
                        "[><]" . tabla('promocion') =>
                        [
                            tabla('promocionxarticulo') . ".idpromocion" => 'id'
                        ],
                        //INNER JOIN
                        "[><]" . tabla('articulo') =>
                        [
                            tabla('promocionxarticulo') . ".idarticulo" => "id"
                        ],
                    ],
                    [
                        // ESTOS DATOS JALO DE LA TABLA PROMOCION X ARTICULO
                        tabla('promocionxarticulo') . ".id(idpromocionarticulo)",
                        tabla('promocionxarticulo') . ".idarticulo(idarticulo)",
                        tabla('promocionxarticulo') . ".idpromocion(idpromocion)",
                        tabla('articulo') . ".nombre_articulo(nombrearticulo)",
                        tabla('articulo') . ".codigo_articulo(codigoarticulo)",
                        tabla('articulo') . ".precio_articulo(precioarticulo)",
                    ],
                    [
                        tabla('promocionxarticulo') . ".idpromocion" => $in_promocion
                    ]
            );

            if ($data && $subdata) {


                for ($i = 0; $i < count($subdata); $i++) {
                    $key = array_search($subdata[$i]['idpromocion'], array_column($data, 'idpromocion'));
                    if ('key' != 'key' . $key) {
                        $data[$key]['subarticulos'][] = $subdata[$i];
                    }
                    continue;
                }
                unset($subdata);

                $json['code'] = '200';
                $json['status'] = 'Ok';
                $json['msg'] = strings('success_read');
                $json['cantpromocion'] = count($data);
                $json['data'] = $data;
                
                unset($data);
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
