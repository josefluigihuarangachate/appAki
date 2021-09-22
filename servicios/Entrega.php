<?php

include './include/app.php';
include './include/session.php';

$generator = new Picqer\Barcode\BarcodeGeneratorPNG();

use Dompdf\Dompdf;

if ($ajax) {
    if (METODO($method) == 'GET') {
        
    } else if (METODO($method) == 'POST') {
        if ($cmd == 'confirmarentregaexitosa') {
            $numerodeordenes = input('numerosdeordenes');

            $id_cliente = input('idcliente');
            // COORDENADAS DEL CLIENTE
            $latitud_cliente = input('latitud');
            $longitud_cliente = input('longitud');
            $facturaelectronica = input('facturaelectronica'); // ninguno, boleta, factura
            $dniruc = input("dniruc");
            $razonsocial = input("razonsocial");
            $correoelectronico = input("correoelectronico");
            $enviarporcorreo = input("enviarporcorreo");

            if ($numerodeordenes) {

                // numserieboleta, numseriefactura
                // LE PASAMOS POR EJEMPLO: C1-0543,C1-0534,C1-64564 EN ESE FORMATO, CON ESO ACTUALIZA 
                // LAS ORDENES DE SERVICIOS QUE LE PASAMOS
                $arraynumerodeordenes = explode(",", $numerodeordenes);
                $html_factura = "";

                if ($facturaelectronica == 'boleta') {
                    
                    // RECORRO LOS NUMEROS DE ORDENES
//                    for ($b = 0; $b < count($arraynumerodeordenes); $b++) {
//                        $data = $pdo->select(
//                                tabla('detalleorden'),
//                                [
//                                    //INNER JOIN
//                                    "[><]" . tabla('orden') =>
//                                    [
//                                        tabla('detalleorden') . ".idorden" => "id"
//                                    ],
//                                    //INNER JOIN
//                                    "[><]" . tabla('articulo') =>
//                                    [
//                                        tabla('detalleorden') . ".idprenda" => "id"
//                                    ],
//                                ],
//                                [
//                                    // ESTOS DATOS JALO DE LA TABLA PROMOCION
//                                    tabla('detalleorden') . ".nombreprenda(nombreprenda)",
//                                    tabla('articulo') . ".precio_articulo(preciodeprenda)",
//                                ],
//                                [
//                                    tabla('orden') . '.numeroorden' => $arraynumerodeordenes[$b],
//                                    tabla('orden') . '.estado' => 'Activo',
//                                ]
//                        );
//                    }
                } else if ($facturaelectronica == 'factura') {
                    
                } else if ($facturaelectronica == 'ninguno') {
                    
                }

                try {
                    $updateTurnoxCliente = $pdo->update(
                            tabla('turnoxcliente'),
                            [
                                'atencion' => 'Atendido'
                            ],
                            [
                                "AND" => [
                                    "numero_orden" => $arraynumerodeordenes,
                                    "atencion" => 'Sin Atender',
                                ]
                            ]
                    );
                    $cantTurnoxCliente = $updateTurnoxCliente->rowCount(); // CUENTO LAS CANTIDADDES DE ACTUALIZACIONES

                    $updateOrden = $pdo->update(
                            tabla('orden'),
                            [
                                'tipo_cobro' => 'Cancelado'
                            ],
                            [
                                "AND" => [
                                    "numeroorden" => $arraynumerodeordenes,
                                    "tipo_atencion" => 'Entrega',
                                ]
                            ]
                    );
                    $cantOrden = $updateOrden->rowCount(); // CUANTO LAS CANTIDADDES DE LAS ACTUALIZACIONES DE LAS ORDENES
                    // SELECCIONO Y ACTUALIZO LATITUD Y LONGITUD DEL CLIENTE
                    // $id_cliente
                    // ACTUALIZO LAS COORDENAS DEL CLIENTE
                    try {
                        if ($latitud_cliente && $longitud_cliente) {
                            $pdo->update(tabla('cliente'),
                                    [
                                        "Latitud" => strval($latitud_cliente),
                                        "Longitud" => strval($longitud_cliente)
                                    ],
                                    [
                                        "id" => @$id_cliente
                                    ]
                            );
                        }
                    } catch (Throwable $e) {
                        
                    }


                    if (intval($cantTurnoxCliente) && intval($cantOrden)) {
                        $json['msg'] = strings('success_update') . ': ' . PHP_EOL . implode(", ", $arraynumerodeordenes);
                    } else {
                        $json['msg'] = strings('error_update') . ', porque los datos ya fueron registrados';
                    }
                } catch (Throwable $e) {
                    $json['msg'] = strings('error_update');
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
