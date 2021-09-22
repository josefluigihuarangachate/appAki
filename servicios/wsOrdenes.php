<?php

include './include/app.php';
include './include/session.php';

$generator = new Picqer\Barcode\BarcodeGeneratorPNG();

use Dompdf\Dompdf;

if (METODO($method) == 'GET') {

    if ($cmd == 'listadeorden') {

        $data = $pdo->select(
                tabla('orden'),
                [
                    tabla('orden') . ".id(idorden)",
                    tabla('orden') . ".idservicio(idservicio)",
                    tabla('orden') . ".nombre_servicio(nombredelservicio)",
                    tabla('orden') . ".numeroorden(numeroorden)",
                    tabla('orden') . ".nombre_repartidor(nombredelrepartidor)",
                    tabla('orden') . ".fecha(fechaderegistro)",
                    tabla('orden') . ".hora(horaderegistro)",
                    tabla('orden') . ".idcliente(iddelcliente)",
                    tabla('orden') . ".nombre_cliente(nombredelcliente)",
                    tabla('orden') . ".celular_cliente(celulardelcliente)",
                    tabla('orden') . ".direccion_cliente(direcciondelcliente)",
                    tabla('orden') . ".fecha_entrega(fechadeentrega)",
                    tabla('orden') . ".hora_entrega(horadeentrega)",
                    tabla('orden') . ".tipo_cobro(tipodecobro)",
                    tabla('orden') . ".idzona(idzona)", // C1, C2, C3,...
                    tabla('orden') . ".total_pagar(totalapagar)",
                    tabla('orden') . ".estado(estadodeorden)",
                    tabla('orden') . ".tipo_pago(tipodepago)",
                    tabla('orden') . ".tipo_atencion(tipodeatencion)",
                    tabla('orden') . ".array_detalleorden(detalledeorden)",
                    tabla('orden') . ".flag(flag)",
                ],
                [
                    "OR" => [
                        tabla('orden') . '.flag' => [1, 2]
                    ]
                ]
        );

        if ($data) {

            for ($d = 0; $d < count($data); $d++) {
                if (
                        $data[$d]['nombredelservicio'] == 'PROMOCIONES' ||
                        $data[$d]['nombredelservicio'] == 'PROMOCION' ||
                        $data[$d]['nombredelservicio'] == 'PROMOCIÓN'
                ) {
                    $detalledeorden = (array) json_decode("[" . @$data[$d]['detalledeorden'] . "]", true);
                    unset($data[$d]['detalledeorden']);
                    $data[$d]['detalledeorden'] = $detalledeorden[0];
                } else {
                    $detalledeorden = (array) json_decode(@$data[$d]['detalledeorden'], true);
                    unset($data[$d]['detalledeorden']);
                    $data[$d]['detalledeorden'] = $detalledeorden[0];
                }
                continue;
            }

            for ($d = 0; $d < count($data); $d++) {
                if (
                        $data[$d]['nombredelservicio'] == 'PROMOCIONES' ||
                        $data[$d]['nombredelservicio'] == 'PROMOCION' ||
                        $data[$d]['nombredelservicio'] == 'PROMOCIÓN'
                ) {
                    $promociones = $data[$d]['detalledeorden'];
                    foreach ($promociones as $promo => $value) {
                        if ($promo) {

                            $appPrecio = [];
                            for ($v = 0; $v < count($value); $v++) {
                                $appPrecio[] = $value[$v]['precioprenda'];
                            }
                            $pagoPromocion = array_sum($appPrecio) - min($appPrecio);
                            $dataprom = $pdo->select(
                                    tabla('detalleorden'),
                                    [
                                        tabla('detalleorden') . ".idpromocion(idpromocion)",
                                    ],
                                    [
                                        "AND" => [
                                            tabla('detalleorden') . '.idorden' => $data[$d]['idorden'],
                                            tabla('detalleorden') . '.nombrepromocion' => $promo
                                        ]
                                    ],
                                    [
                                        'LIMIT' => 1
                                    ]
                            );
                            $data[$d]['detalledeorden'][$promo]['DATOS'] = array(
                                "idpromocion" => @$dataprom[0]['idpromocion'],
                                "preciopromocion" => str_replace(",", "", number_format($pagoPromocion, 2, '.', ','))
                            );
                            unset($dataprom);
                        }
                    }
                }
                continue;
            }


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
    if ($cmd == 'actualizarflag') {

        $numerodeorden = @input('numerodeorden');
        $flag = @input('flag');

        if (
                !empty($numerodeorden) &&
                intval($flag) >= 0
        ) {

            try {
                $data = $pdo->update(
                        tabla('orden'),
                        [
                            "flag" => intval($flag)
                        ],
                        [
                            "numeroorden" => strval($numerodeorden)
                        ]
                );

                $rowCount = $data->rowCount();
                if (
                        intval($rowCount) > 0
                ) {
                    $json['code'] = '200';
                    $json['status'] = 'Ok';
                    $json['msg'] = strings('success_update');
                } else {
                    $json['msg'] = strings('error_update');
                }
            } catch (Throwable $t) {
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


//'X-Requested-With', 'XMLHttpRequest'
header('Content-Type: application/json');
echo json_encode($json, JSON_UNESCAPED_UNICODE);

