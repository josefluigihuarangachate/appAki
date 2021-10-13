<?php

include './include/app.php';
include './include/session.php';

$generator = new Picqer\Barcode\BarcodeGeneratorPNG();

use Dompdf\Dompdf;

if ($ajax) {
    if (METODO($method) == 'GET') {
        
    } else if (METODO($method) == 'POST') {
        if ($cmd == 'registrarreclamoporprenda') {

            $fechadeentrega = input('fechatotalmax'); // POR DEFINIR
            $numerodeorden = input('numerodeorden');
            $idcliente = input('idcliente');
            $nombrecliente = input('nombrecliente');
            $keyprenda = input('keyprenda');
            $idprenda = input('idprenda');
            $nombreprenda = input('nombreprenda');
            $colorprenda = input('colorprenda');
            $marcaprenda = input('marcaprenda');
            $estados = inputTextArray('estado');
            if ($estados) {
                $estados = @implode(" @ ", inputTextArray('estado'));
            }
            $observaciones = input('observaciones');
            $audios = inputArray('audio');
            $archivos = inputArray('archivo');

            // FECHA Y HORA ACTUAL
            $fechahoy = date('Y-m-d');
            $fechahoyslash = date('d/m/Y');
            $horahoy = date('H:i:s');
            $horahoypm = $horahoy . ' ' . date('A');
            $in_audios = "";
            $in_archivos = "";
            // FIN FECHA Y HORA ACTUAL

            if (
                    !empty($numerodeorden) &&
                    !empty($idcliente) &&
                    !empty($nombrecliente) &&
                    !empty($keyprenda) &&
                    !empty($idprenda) &&
                    !empty($nombreprenda) &&
                    !empty($colorprenda) &&
                    !empty($marcaprenda)
            ) {

                try {

                    // OBTENEMOS INFORMACION DEL ORDEN
                    $datosdelaprenda = $pdo->select(
                            tabla('articulo'),
                            [
                                'precio_articulo',
                            ],
                            [
                                'id' => $idprenda
                            ]
                    );
                    $precioprenda = @$datosdelaprenda[0]['precio_articulo'];

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
                    $idzona = @$datosdelorden[0]['idzona'];
                    $tipo_cobro = @$datosdelorden[0]['tipo_cobro'];
                    // FIN RECORRO SI LOS AUDIOS Y ARCHIVOS SI ES QUE HAY
                    // REGISTRAMOS EL RECLAMO
                    $pdo->insert(
                            tabla('reclamoxprenda'),
                            [
                                "fechaentrega" => $fechadeentrega,
                                "horaentrega" => $horahoy,
                                "numeroorden" => isEmpty(''),
                                "origennumeroorden" => $numerodeorden,
                                "idcliente" => $idcliente,
                                "nombrecliente" => $nombrecliente,
                                "idrepartidor" => @$_SESSION['id'],
                                "nombrerepartidor" => @$_SESSION['nombrecorto'],
                                "idzona" => $idzona,
                                "idprenda" => $idprenda,
                                "nombreprenda" => $nombreprenda,
                                "color" => $colorprenda,
                                "marca" => $marcaprenda,
                                "observacion" => isEmpty($observaciones),
                                "estados" => $estados,
                                "ordenprenda" => $keyprenda
                            ]
                    );
                    $reclamoxprenda_id = $pdo->id();

                    $explode = explode('-', $numerodeorden);
                    $numerodeordendereclamo = @$datosdelorden[0]['idzona'] . '-' . zero_fill($explode[1], 7);

                    if ($reclamoxprenda_id) {

                        $countfiles = count(array_filter($_FILES['archivo']['name']));
                        $countmusic = count(array_filter($_FILES['audio']['name']));

                        // RECORRO SI LOS AUDIOS Y ARCHIVOS SI ES QUE HAY Y LE PASO PARA ACTUALIZAR ABAJO                        
                        if ($countfiles >= 1) {
                            $carpeta_archivo = RUTA_ARCHIVOS . $numerodeordendereclamo . "/";

                            // CREO LA CARPETA CON EL NOMBRE DEL SERVICIO
                            if (!file_exists($carpeta_archivo)) {
                                mkdir($carpeta_archivo, 0777, true);
                            }

                            $fi = 0;
                            while ($fi < count($archivos['archivo']['name'])) {
                                $temp = explode(".", $archivos['archivo']["name"][$fi]);
                                $newfilename = 'I' . generateRandomString() . '.' . end($temp);
                                if ($fi > 0) {
                                    $in_archivos .= ' @ ';
                                }
                                $in_archivos .= $newfilename;
                                move_uploaded_file($archivos['archivo']["tmp_name"][$fi], $carpeta_archivo . $newfilename);
                                $fi = $fi + 1;
                            }
                        }
                        if ($countmusic >= 1) {
                            $carpeta_archivo = RUTA_AUDIOS . $numerodeordendereclamo . "/";

                            // CREO LA CARPETA CON EL NOMBRE DEL SERVICIO
                            if (!file_exists($carpeta_archivo)) {
                                mkdir($carpeta_archivo, 0777, true);
                            }

                            $fi = 0;
                            while ($fi < count($audios['audio']['name'])) {
                                $temp = explode(".", $audios['audio']["name"][$fi]);
                                $newfilename = 'I' . generateRandomString() . '.' . end($temp);
                                if ($fi > 0) {
                                    $in_audios .= ' @ ';
                                }
                                $in_audios .= $newfilename;
                                move_uploaded_file($audios['audio']["tmp_name"][$fi], $carpeta_archivo . $newfilename);

                                $fi = $fi + 1;
                            }
                        }


                        // ACTUALIZO EL NUMERO DE ORDEN PARA EL RECLAMO
                        $pdo->update(
                                tabla('reclamoxprenda'),
                                [
                                    "numeroorden" => $numerodeordendereclamo,
                                    "audio" => isEmpty($in_audios),
                                    "imagen" => isEmpty($in_archivos)
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
                                    'hora_turno' => $horahoy,
                                    'puesto_turno' => temprano_tarde($horahoy)
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
                                    'hora_entrega' => $horahoy,
                                    'tipo_atencion' => 'Reclamo',
                                    'flag' => 2
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
                        $codpdf = 'R' . $reclamoxprenda_id . strtoupper(@$datosdelorden[0]['idzona']) . $fechahoraunida . '.pdf';
                        $codbar = 'R' . $reclamoxprenda_id . strtoupper(@$datosdelorden[0]['idzona']) . $fechahoraunida . '.png';
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
                        <small style="font-family: sans-serif;line-height: 23px;">ATENDIDO POR: ' . @strtoupper(strtolower(@$_SESSION['nombrecorto'])) . '</small><br>
                        <small style="font-family: sans-serif;line-height: 23px;">FECHA : ' . $fechahoyslash . ' ' . $horahoypm . '</small><br>
                        <small style="font-family: sans-serif;line-height: 23px;">CLIENTE : ' . @strtoupper(strtolower($nombrecliente)) . '</small><br>
                        <small style="font-family: sans-serif;line-height: 23px;">TELEFONO : ' . @$datosdelorden[0]['celular_cliente'] . '</small><br>
                        <small style="font-family: sans-serif;line-height: 23px;">DIRECCIÓN : ' . @strtoupper(strtolower(@$datosdelorden[0]['direccion_cliente'])) . '</small>
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
                        echo $html;
                        die();
                        // FIN GENERAR EL PDF
                        //$json['code'] = '200';
                        //$json['status'] = 'Ok';
                        //$json['msg'] = strings('success_create');
                    } else {
                        echo $json['msg'] = strings('error_create');
                    }
                } catch (Throwable $t) {
                    echo $json['msg'] = strings('error_create');
                }
            } else {
                echo $json['msg'] = strings('error_empty');
            }
        } else {
            echo $json['msg'] = strings('error_cmd');
        }
    } else if (METODO($method) == 'PUT') {
        
    } else if (METODO($method) == 'DELETE') {
        
    } else {
        echo $json['msg'] = strings('error_method');
    }
}

//'X-Requested-With', 'XMLHttpRequest'
//header('Content-Type: application/json');
//echo json_encode($json, JSON_UNESCAPED_UNICODE);
