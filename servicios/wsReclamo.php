<?php

include './include/app.php';
include './include/session.php';

$generator = new Picqer\Barcode\BarcodeGeneratorPNG();

use Dompdf\Dompdf;

if (METODO($method) == 'POST') {

    if ($cmd == 'registrarreclamoporprenda') {

        $fechadeentrega = input('fechadeentrega');
        $horadeentrega = input('horadeentrega');
        $numerodeorden = input('numerodeorden'); // NUMERO DE ORDEN QUE DESEA HACER EL RECLAMO POR PRENDA
        $idrepartidor = input('idrepartidor');
        $nombredelrepartidor = ucwords(input('nombredelrepartidor'));
        $idcliente = input('idcliente');
        $nombrecliente = ucwords(input('nombrecliente'));
        $numerodecelular = input('numerodecelular');
        $direcciondecliente = input('direcciondecliente');
        $idzona = ucwords(input('idzona')); // DEBERA PASARME : C1 , C2, C3, .....
        $keyprenda = input('keyprenda'); // EL KEY TIENE QUE SER EL QUE ESTA EN LA ORDEN DE LO CONTRARIO NO SE MOSTRARA EL RECLAMO POR ESA PRENDA
        $idprenda = input('idprenda');
        $nombreprenda = input('nombreprenda');
        $colorprenda = input('colorprenda');
        $marcaprenda = input('marcaprenda');
        $estados = ucwords(@input('estado')); // LOS ESTADOS POR RECLAMO, ENVIAR SEPARADO POR COMA
        $observaciones = @input('observaciones');

        if (
                !empty($fechadeentrega) &&
                !empty($horadeentrega) &&
                !empty($numerodeorden) &&
                !empty($idcliente) &&
                !empty($numerodecelular) &&
                !empty($nombrecliente) &&
                !empty($idrepartidor) &&
                !empty($nombredelrepartidor) &&
                !empty($idzona) &&
                !empty($keyprenda) &&
                !empty($idprenda) &&
                !empty($nombreprenda) &&
                !empty($colorprenda) &&
                !empty($marcaprenda)
        ) {


            try {


                // FECHA Y HORA ACTUAL
                $fechahoyslash = date('d/m/Y');
                $horahoy = date('H:i:s');
                $horahoypm = $horahoy . ' ' . date('A');
                $in_audios = "";
                $in_archivos = "";
                // FIN FECHA Y HORA ACTUAL
                
                // OBTENEMOS INFORMACION DEL ORDEN
                $datosdelorden = $pdo->select(
                        tabla('orden'),
                        [
                            'idzona', // C1, C2, C3, ETC
                            'id', // ID DEL ORDEN, SE DEBE DE USAR LA FUNCION: zero_fill($numero, 7)
                            'direccion_cliente',
                            'tipo_cobro',
                        ],
                        [
                            'numeroorden' => $numerodeorden
                        ]
                );
                $tipo_cobro = @$datosdelorden[0]['tipo_cobro'];

                // REGISTRAMOS EL RECLAMO
                $pdo->insert(
                        tabla('reclamoxprenda'),
                        [
                            "fechaentrega" => $fechadeentrega,
                            "horaentrega" => $horadeentrega,
                            "numeroorden" => isEmpty(''),
                            "origennumeroorden" => $numerodeorden,
                            "idcliente" => $idcliente,
                            "nombrecliente" => $nombrecliente,
                            "idrepartidor" => $idrepartidor,
                            "nombrerepartidor" => $nombredelrepartidor,
                            "idzona" => $idzona,
                            "idprenda" => $idprenda,
                            "nombreprenda" => $nombreprenda,
                            "color" => $colorprenda,
                            "marca" => $marcaprenda,
                            "observacion" => isEmpty($observaciones),
                            "estados" => isEmpty($estados),
                            "ordenprenda" => $keyprenda
                        ]
                );
                $reclamoxprenda_id = $pdo->id();
                $numerodeordendereclamo = @$idzona . '-' . zero_fill($reclamoxprenda_id, 7);
                if ($reclamoxprenda_id) {

                    // ACTUALIZO EL NUMERO DE ORDEN PARA EL RECLAMO
                    $pdo->update(
                            tabla('reclamoxprenda'),
                            [
                                "numeroorden" => $numerodeordendereclamo
                            ],
                            [
                                "id" => $reclamoxprenda_id
                            ]
                    );
                    // FIN ACTUALIZO EL NUMERO DE ORDEN PARA EL RECLAMO
                    // CAMBIO EL ESTADO A RECLAMO EL DE TURNO POR CLIENTE
                    $data = $pdo->update(
                            tabla('turnoxcliente'),
                            [
                                "estado_turno" => 'Reclamo',
                                'atencion' => 'Sin Atender',
                                'fecha_turno' => $fechadeentrega,
                                'hora_turno' => $horadeentrega,
                                'puesto_turno' => temprano_tarde($horadeentrega)
                            ],
                            [
                                "numero_orden" => $numerodeorden
                            ]
                    );
                    // FIN CAMBIO EL ESTADO A RECLAMO EL DE TURNO POR CLIENTE
                    // CAMBIO EL ESTADO A RECLAMO EL DE TURNO POR CLIENTE
                    $data = $pdo->update(
                            tabla('orden'),
                            [
                                'tipo_cobro' => 'Reclamo',
                                'fecha_entrega' => $fechadeentrega,
                                'hora_entrega' => $horadeentrega,
                                'tipo_atencion' => 'Reclamo'
                            ],
                            [
                                "numeroorden" => $numerodeorden
                            ]
                    );
                    // FIN CAMBIO EL ESTADO A RECLAMO EL DE TURNO POR CLIENTE
                    // GENERAR EL PDF
                    // DOY PERMISO A LA CARPETA PARA GUARDAR EL PDF
                    chmod(RUTA_PDF, 0755);
                    // CODIGO O NOMBRE DEL PDF
                    $fechahoraunida = date('Ymdhis');
                    $codpdf = 'R' . $reclamoxprenda_id . strtoupper($idzona) . $fechahoraunida . '.pdf';
                    $codbar = 'R' . $reclamoxprenda_id . strtoupper($idzona) . $fechahoraunida . '.png';
                    $logo = convertirblobimageporruta("../layouts/design/aki/bn-logo.png");

                    $redColor = [0, 0, 0];
                    file_put_contents(RUTA_PDF . $codbar, $generator->getBarcode($numerodeordendereclamo, $generator::TYPE_CODE_128, 3, 50, $redColor));
                    $dompdf = new Dompdf();
                    $html = '
                        <style>
                            @page {
                                margin: 0px 0px 0px 0px !important;
                                padding: 0px 0px 0px 0px !important;
                            }
                        </style>    
                        <center>
                            <img src="' . $logo . '" width="130"/>
                        </center>
                        <br>
                        <center>
                            <strong style="font-family: sans-serif;line-height: 23px;">AV.SAN BORJA NORTE 399 LIMA - LIMA -</strong>
                        </center>
                        <center>
                            <strong style="font-family: sans-serif;line-height: 23px;">SAN BORJA</strong>
                        </center>
                        <center>
                            <strong style="font-family: sans-serif;line-height: 23px;">Teléf.: 717-8866</strong>
                        </center>
                        <center>
                            <label style="font-family: sans-serif;font-size: 17px;font-weight: bold;line-height: 28px;">ORDEN DE SERVICIO</label>
                        </center>
                        <center>
                            <label style="font-family: sans-serif;font-size: 17px;font-weight: bold;line-height: 25px;">RECLAMO</label>
                        </center>
                        <br>
                        <small style="font-family: sans-serif;line-height: 23px;">ATENDIDO POR: ' . @strtoupper(strtolower(@$nombredelrepartidor)) . '</small><br>
                        <small style="font-family: sans-serif;line-height: 23px;">FECHA : ' . $fechahoyslash . ' ' . $horahoypm . '</small><br>
                        <small style="font-family: sans-serif;line-height: 23px;">CLIENTE : ' . @strtoupper(strtolower($nombrecliente)) . '</small><br>
                        <small style="font-family: sans-serif;line-height: 23px;">TELEFONO : ' . @$numerodecelular . '</small><br>
                        <small style="font-family: sans-serif;line-height: 23px;">DIRECCIÓN : ' . @strtoupper(strtolower(@$direcciondecliente)) . '</small>
                        <br>
                        <br>
                        <table cellspacing="0" style="width: 100%;border-top: 1px solid black;border-bottom: 1px solid black;">
                            <tr style="text-align: left;font-family: sans-serif;">
                                <td><b>CANT</b></td>
                                <td><b>DESCRIPCION</b></td>
                                <td><b>IMPORTE</b></td>
                            </tr>                        
                        </table>';

                    $html .= '<div style="text-align: left;font-family: sans-serif;">';
                    //$html .= "&nbsp;&nbsp;&nbsp; (1)&nbsp;" . $nombreprenda . " <label style='float: right;'>" . $precioprenda . "</label><br>";
                    $html .= "&nbsp;&nbsp;&nbsp; (1)&nbsp;" . $nombreprenda . "<br>";
                    $html .= "&nbsp;&nbsp;&nbsp;" . $colorprenda . "<br>";
                    $html .= "&nbsp;&nbsp;&nbsp;" . $marcaprenda . "<br>";
                    if ($estados) {
                        $html .= "&nbsp;&nbsp;&nbsp;" . str_replace(" @ ", ',', $estados) . "<br>";
                    }

                    //$html .= "<br><strong>MONTO : S/.</strong>" . " <strong style='float: right;'>" . number_format($precioprenda, 2, '.', '') . "</strong><br>";
                    $html .= '</div><br>';

                    $html .= '
                        <!-- VA ABAJO DE LAS PRENDAS -->
                        <label style="font-family: sans-serif;font-size: 17px;font-weight: bold">FECHA DE ENTREGA:</label><br>
                        <strong style="font-family: sans-serif;">' . @ucwords(nombreDia($fechadeentrega)) . ', ' . date('d/m/Y', strtotime($fechadeentrega)) . ' ' . date('h:i A', strtotime($horahoypm)) . '</strong><br>
                        <strong style="font-family: sans-serif;"><u>' . $tipo_cobro . '</u></strong>
                        <center>
                            <img src="' . convertirblobimageporruta(RUTA_PDF . $codbar) . '" alt="" style="width: 80%;height: 85px;margin-bottom: 12px;"/><br>
                            <p>
                                <strong style="font-size: 35px;color: black;font-weight: bold;font-family: sans-serif;">' . $numerodeordendereclamo . '</strong>
                            </p>
                        </center>
                        <strong style="font-family: sans-serif;">Condiciones del servicio</strong><br>
                        <strong style="font-family: sans-serif;font-size: 11px;">Visita nuestra pagina web: www.lavanderiaaki.com e infórmese de las condiciones de nuestro servicio</strong><br>

                        <input type="hidden" hidden="hidden" id="idpdfexist" name="idpdfexist" value="' . $codpdf . '">                    
                        ';

                    unlink(RUTA_PDF . $codbar);
                    $dompdf->loadHtml($html);
                    $dompdf->set_option('isRemoteEnabled', TRUE);
                    $dompdf->set_paper(array(0, 0, 280, 492));
                    $dompdf->render();
                    $output = $dompdf->output();
                    file_put_contents(RUTA_PDF . $codpdf, $output);

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
            echo $json['msg'] = strings('error_empty');
        }
    } else {
        $json['msg'] = strings('error_cmd');
    }
} else if (METODO($method) == 'GET') {

    if ($cmd == 'listadodeestadosdereclamo') {
        @$idestadodereclamo = input('idestado'); // PARAMETRO OPCIONAL
        $where = "";
        if (@$idestadodereclamo) {
            $where = [
                'id' => @$idestadodereclamo
            ];
        }
        $data = $pdo->select(
                tabla('estadoreclamo'),
                [
                    'id(idestado)',
                    'nombre(nombredeestado)',
                    'estado(estado)',
                ],
                $where
        );

        if ($data) {
            $json['code'] = '200';
            $json['status'] = 'Ok';
            $json['msg'] = strings('success_read');
            $json['data'] = $data;
        } else {
            $json['msg'] = strings('error_read');
        }
    } else if ($cmd == 'listadeprendapororden') {
        @$numerodeorden = input('numerodeorden'); // PARAMETRO OPCIONAL
        @$fechadeentrega = input('fechadeentrega'); // PARAMETRO OPCIONAL
        $where = "";

        if (@$numerodeorden && @$fechadeentrega) {
            $where = [
                tabla('orden') . '.numeroorden' => @$numerodeorden,
                tabla('orden') . '.fecha' => @$fechadeentrega,
            ];
        } else if (@$numerodeorden && empty(@$fechadeentrega)) {
            $where = [
                tabla('orden') . '.numeroorden' => @$numerodeorden,
            ];
        } else if (@$fechadeentrega && empty(@$numerodeorden)) {
            $where = [
                tabla('orden') . '.fecha' => @$fechadeentrega,
            ];
        }

        $data = $pdo->select(
                tabla('detalleorden'),
                [
                    //INNER JOIN
                    tabla('orden') =>
                    [
                        tabla('detalleorden') . ".idorden" => "id"
                    ],
                ],
                [
                    tabla('detalleorden') . ".idorden(idorden)",
                    tabla('detalleorden') . ".ordenpromocion(keyprenda)",
                    tabla('detalleorden') . ".idprenda(idprenda)",
                    tabla('detalleorden') . ".nombreprenda(nombreprenda)",
                    tabla('detalleorden') . ".color(colorprenda)",
                    tabla('detalleorden') . ".marca(marcaprenda)",
                    tabla('detalleorden') . ".precioprenda(precioprenda)",
                    tabla('detalleorden') . ".nombreestados(nombreestados)",
                    tabla('detalleorden') . ".observaciones(observaciones)",
                    tabla('orden') . ".numeroorden(numerodeorden)",
                    tabla('orden') . ".fecha_entrega(fechadeentrega)",
                    tabla('orden') . ".hora_entrega(horadeentrega)",
                ],
                $where
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
} else if (METODO($method) == 'PUT') {
    
} else if (METODO($method) == 'DELETE') {
    
} else {
    $json['msg'] = strings('error_method');
}


//'X-Requested-With', 'XMLHttpRequest'
header('Content-Type: application/json');
echo json_encode($json, JSON_UNESCAPED_UNICODE);
