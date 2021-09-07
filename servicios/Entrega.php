<?php

include './include/app.php';
include './include/session.php';

if ($ajax) {
    if (METODO($method) == 'GET') {
        
    } else if (METODO($method) == 'POST') {
        if ($cmd == 'confirmarentregaexitosa') {
            $numerodeordenes = input('numerosdeordenes');
            if ($numerodeordenes) {

                // LE PASAMOS POR EJEMPLO: C1-0543,C1-0534,C1-64564 EN ESE FORMATO, CON ESO ACTUALIZA 
                // LAS ORDENES DE SERVICIOS QUE LE PASAMOS
                $arraynumerodeordenes = explode(",", $numerodeordenes);

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
