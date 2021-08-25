<?php

include './include/app.php';
include './include/session.php';

// Barcode github: https://github.com/davidscotttufts/php-barcode
include './Barcode.php';
$html = ob_get_clean();

use Dompdf\Dompdf;

if ($ajax) {
    if (METODO($method) == 'POST') {
        $cmd = input('cmd');
        if ($cmd == 'registrarrecojo') {
            $idservicio = input('servicio');
            $nombreservicio = input('nombreservicio');
            $diaxservicio = input('diasservicios');
            $fechadeentrega = input('fechadeentrega');
            $pagototal = input('pagototal');
            $tipo_cobro = 'Por Cobrar';
            $numOrdenes = input('numOrdenes');

            if (
                    !empty($idservicio) &&
                    !empty($nombreservicio) &&
                    intval($diaxservicio) >= 1 &&
                    $fechadeentrega != date('Y-m-d') &&
                    intval($pagototal) > 0
            ) {
                // ESTE ES LA FECHA MINIMA, SEGUN LOS DIAS DEL SERVICIO
                $fechamindeentrega = input('fechaminimodeentrega');
                // $fechadeentrega = ES LA FECHA A LA CUAL SE DEBE DE ENTREGAR EL ARTICULO O PRENDA  

                $zona = $pdo->select(
                        tabla('zona'),
                        [
                            "codigo_zona",
                            "puesto_zona"
                        ],
                        [
                            "id" => @$_SESSION['idzona']
                        ]
                );

                // POR DEFECTO LA HORA DE ENTREGA ES A LAS 5PM
                $fechahoy = date('Y-m-d');
                $fechahoyslash = date('d/m/Y');
                $horahoy = date('h:i:s');
                $horahoypm = $horahoy . ' ' . date('A');

                $pdo->insert(
                        tabla('orden'),
                        [
                            "idservicio" => @trim($idservicio),
                            "nombre_servicio" => @strtoupper(strtolower($nombreservicio)),
                            "nombre_repartidor" => @ucwords(strtolower(@$_SESSION['nombrecorto'])), // NOMBRE CORTO DEL REPARTIDOR
                            "fecha" => $fechahoy,
                            "hora" => $horahoy,
                            "nombre_cliente" => @ucwords(strtolower(@$_SESSION['nombrecliente'])),
                            "celular_cliente" => @$_SESSION['telefono'],
                            "direccion_cliente" => @$_SESSION['direccion'],
                            "fecha_entrega" => $fechadeentrega,
                            "hora_entrega" => '',
                            "tipo_cobro" => $tipo_cobro,
                            "idzona" => @$zona[0]['puesto_zona'],
                            "total_s_dscto" => '',
                            "descuento" => '',
                            "total_pagar" => $pagototal,
                            "a_cuenta" => '',
                            "saldo" => '',
                            "estado" => 'Activo'
                        ]
                );

                $lastinsert_id = $pdo->id();
                $codpdf = "";
                $codbar = "";

                if ($lastinsert_id) {

                    $numero_orden = strtoupper(@$zona[0]['puesto_zona']) . '-' . zero_fill($lastinsert_id, 7);

                    try {
                        $pdo->update(tabla('orden'),
                                [
                                    "numeroorden" => $numero_orden
                                ],
                                [
                                    "id" => $lastinsert_id
                                ]
                        );

                        // ACTUALIZO EL ESTADO PARA QUE NO ME APAREZCA EN LA LISTA
                        // id del turnoxcliente
                        $pdo->update(tabla('turnoxcliente'),
                                [
                                    "atencion" => 'Atendido'
                                ],
                                [
                                    "id" => @$_SESSION['idturnoxrepartidortemp']
                                ]
                        );
                    } catch (Exception $e) {
                        echo html_error(strings('error_create'));
                        $pdo->delete(tabla('orden'), [
                            "AND" => [
                                "id" => $lastinsert_id
                            ]
                        ]);
                        $pdo->delete(tabla('detalleorden'), [
                            "AND" => [
                                "idorden" => $lastinsert_id
                            ]
                        ]);
                        die();
                    }



                    $insert = [];
                    $piezas = [];
                    $promociones = [];

                    // SI ES POR PIEZA
                    if (
                            strtolower($nombreservicio) != 'promocion' &&
                            strtolower($nombreservicio) != 'promoción' &&
                            strtolower($nombreservicio) != 'promociones' &&
                            $idservicio != 1
                    ) {

                        // RECORRO PARA OBTENER LOS IDS
                        $keyname = array();
                        foreach ($_REQUEST as $key => $value) {
                            if (str_contains(strval($key), 'pieza')) {
                                array_push($keyname, str_replace("pieza", "", $key));
                            }
                        }

                        imprimir($keyname);
                        die();
                    }
                    // SI SON PROMOCIONES
                    else if (
                            strtolower($nombreservicio) == 'promocion' ||
                            strtolower($nombreservicio) == 'promoción' ||
                            strtolower($nombreservicio) == 'promociones' ||
                            $idservicio == 1
                    ) {

                        // RECORRO PARA OBTENER LOS IDS
                        $keyname = array();
                        $insert = [];
                        $promociones = [];
                        foreach ($_REQUEST as $key => $value) {
                            if (str_contains(strval($key), 'pieza')) {
                                array_push($keyname, str_replace("pieza", "", $key));
                            }
                        }

                        $k = 0;
                        $inidestado = "";
                        while ($k < count($keyname)) {

                            try {
                                $inidestado = implode(" @ ", $_REQUEST['estado' . $keyname[$k]]);
                            } catch (Throwable $e) {}

                            // SUBIMOS LAS IMAGENES POR PRENDA
                            $carpeta_archivo = RUTA_ARCHIVOS . $numero_orden . "/";
                            $inidarchivo = '';
                            $file = @$_FILES['archivo' . $keyname[$k]];
                            if (count($file['name'])) {
                                $fi = 0;
                                while ($fi < count($file['name'])) {
                                    $tmpFilePath = $file['tmp_name'][$fi];
                                    if ($tmpFilePath) {
                                        if ($fi == 0) {
                                            if (!file_exists($carpeta_archivo)) {
                                                mkdir($carpeta_archivo, 0777, true);
                                            }
                                        }
                                        $temp = explode(".", $file["name"][$fi]);
                                        $newfilename = 'I' . generateRandomString() . '.jpg';
                                        if ($fi > 0) {
                                            $inidarchivo .= ' @ ';
                                        }
                                        $inidarchivo .= $newfilename;
                                        move_uploaded_file($file["tmp_name"][$fi], $carpeta_archivo . $newfilename);
                                    }

                                    $fi = $fi + 1;
                                }
                            }

                            // FIN SUBIMOS LAS IMAGENES POR PRENDA
                            // SUBIMOS LOS AUDIOS POR PRENDA
                            $carpeta_audio = RUTA_AUDIOS . $numero_orden . "/";
                            $inidaudio = '';
                            $file = @$_FILES['audio' . $keyname[$k]];
                            if (count($file['name'])) {
                                $fi = 0;
                                while ($fi < count($file['name'])) {
                                    $tmpFilePath = $file['tmp_name'][$fi];
                                    if ($tmpFilePath) {
                                        if ($fi == 0) {
                                            if (!file_exists($carpeta_audio)) {
                                                mkdir($carpeta_audio, 0777, true);
                                            }
                                        }
                                        $temp = explode(".", $file["name"][$fi]);
                                        $newfilename = 'M' . generateRandomString() . '.' . end($temp);
                                        if ($fi > 0) {
                                            $inidaudio .= ' @ ';
                                        }
                                        $inidaudio .= $newfilename;
                                        move_uploaded_file($file["tmp_name"][$fi], $carpeta_audio . $newfilename);
                                    }
                                    $fi = $fi + 1;
                                }
                            }

                            // FIN SUBIMOS LOS AUDIOS POR PRENDA

                            $nombrepromocion = $pdo->select(
                                    tabla('articulo'),
                                    [
                                        "nombre_articulo",
                                    ],
                                    [
                                        "id" => @$_REQUEST['subidprenda' . $keyname[$k]]
                                    ],
                                    [
                                        "LIMIT" => [0, 1]
                                    ]
                            );

                            $nombreprenda = $pdo->select(
                                    tabla('articulo'),
                                    [
                                        "nombre_articulo",
                                    ],
                                    [
                                        "id" => @$_REQUEST['pieza' . $keyname[$k]]
                                    ],
                                    [
                                        "LIMIT" => [0, 1]
                                    ]
                            );

                            $precioprenda = $pdo->select(
                                    tabla('articulo'),
                                    [
                                        "precio_articulo",
                                    ],
                                    [
                                        "id" => @$_REQUEST['pieza' . $keyname[$k]]
                                    ],
                                    [
                                        "LIMIT" => [0, 1]
                                    ]
                            );

                            $arr = array(
                                'idorden' => $lastinsert_id,
                                'idpromocion' => @$_REQUEST['subidprenda' . $keyname[$k]],
                                'nombrepromocion' => strval($nombrepromocion[0]['nombre_articulo']),
                                'idprenda' => @$_REQUEST['pieza' . $keyname[$k]],
                                'nombreprenda' => strval($nombreprenda[0]['nombre_articulo']),
                                'color' => @$_REQUEST['color' . $keyname[$k]],
                                'marca' => @$_REQUEST['marca' . $keyname[$k]],
                                'precioprenda' => $precioprenda[0]['precio_articulo'],
                                'nombreestados' => isEmpty(@$inidestado),
                                'observaciones' => isEmpty(@$_REQUEST['observacion' . $keyname[$k]]),
                                'audios' => isEmpty(strval($inidaudio)),
                                'imagenes' => isEmpty(strval($inidarchivo)),
                            );
                            array_push($insert, $arr);
                            unset($arr);

                            $promociones[$nombrepromocion[0]['nombre_articulo']][] = array(
                                'nombreprenda' => $nombreprenda[0]['nombre_articulo'],
                                'color' => @$_REQUEST['color' . $keyname[$k]],
                                'marca' => @$_REQUEST['marca' . $keyname[$k]],
                                'precioprenda' => $precioprenda[0]['precio_articulo'],
                                'nombreestados' => isEmpty(@$inidestado),
                            );
                            $k = $k + 1;
                        }

                        try {
                            $pdo->insert(
                                    tabla('detalleorden'),
                                    $insert
                            );
                        } catch (Exception $e) {
                            echo html_error(strings('error_create'));
                            $pdo->delete(tabla('orden'), [
                                "AND" => [
                                    "id" => $lastinsert_id
                                ]
                            ]);
                            $pdo->delete(tabla('detalleorden'), [
                                "AND" => [
                                    "idorden" => $lastinsert_id
                                ]
                            ]);
                            die();
                        }
                    }

                    // EJM PDF: https://github.com/dompdf/dompdf
                    // DOY PERMISO A LA CARPETA PARA GUARDAR EL PDF
                    chmod(RUTA_PDF, 0755);

                    // CODIGO O NOMBRE DEL PDF
                    $fechahoraunida = date('Ymdhis');
                    $codpdf = 'R' . $lastinsert_id . strtoupper(@$zona[0]['puesto_zona']) . $fechahoraunida . '.pdf';
                    $codbar = 'R' . $lastinsert_id . strtoupper(@$zona[0]['puesto_zona']) . $fechahoraunida . '.png';

                    $logo = convertirblobimageporruta("../layouts/design/aki/bn-logo.png");

                    barcode(RUTA_PDF . $codbar, $numero_orden, 20, 'horizontal', 'code128', true);

                    // instantiate and use the dompdf class
                    // Quitar padding y margin pdf: https://stackoverflow.com/q/19779285/16488926
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
                        <label style="font-family: sans-serif;font-size: 17px;font-weight: bold;line-height: 25px;">' . @strtoupper(strtolower($nombreservicio)) . '</label>
                    </center>
                    <br>
                    <small style="font-family: sans-serif;line-height: 23px;">ATENDIDO POR: ' . @strtoupper(strtolower(@$_SESSION['nombrecorto'])) . '</small><br>
                    <small style="font-family: sans-serif;line-height: 23px;">FECHA : ' . $fechahoyslash . ' ' . $horahoypm . '</small><br>
                    <small style="font-family: sans-serif;line-height: 23px;">CLIENTE : ' . @strtoupper(strtolower(@$_SESSION['nombrecliente'])) . '</small><br>
                    <small style="font-family: sans-serif;line-height: 23px;">TELEFONO : ' . @$_SESSION['telefono'] . '</small><br>
                    <small style="font-family: sans-serif;line-height: 23px;">DIRECCIÓN : ' . @strtoupper(strtolower(@$_SESSION['direccion'])) . '</small>
                    <br>
                    <br>
                    
                    <table cellspacing="0" style="width: 100%;border-top: 1px solid black;border-bottom: 1px solid black;">
                        <tr style="text-align: left;font-family: sans-serif;">
                            <td><b>CANT</b></td>
                            <td><b>DESCRIPCION</b></td>
                            <td><b>IMPORTE</b></td>
                        </tr>                        
                    </table>';

                    if ($promociones) {
                        //$sumaprecios = 0;
                        $html .= '<div style="text-align: left;font-family: sans-serif;">';
                        foreach ($promociones as $promo => $prendas) {
                            $html .= "1 &nbsp;" . $promo . "<br>";
                            for ($pre = 0; $pre < count(@$prendas); $pre++) {
                                $html .= "&nbsp;&nbsp;&nbsp; (1)&nbsp;" . @$prendas[$pre]['nombreprenda'] . " <label style='float: right;'>" . $prendas[$pre]['precioprenda'] . "</label><br>";
                                $html .= "&nbsp;&nbsp;&nbsp; " . @$prendas[$pre]['color'] . "<br>";
                                $html .= "&nbsp;&nbsp;&nbsp; " . @$prendas[$pre]['marca'] . "<br>";
                                if (@$prendas[$pre]['nombreestados']) {
                                    $html .= "&nbsp;&nbsp;&nbsp; " . str_replace(' @ ', ',', $prendas[$pre]['nombreestados']) . "<br>";
                                }
                                //$sumaprecios = $sumaprecios + @$prendas[$pre]['precioprenda'];
                            }
                        }
                        $html .= "<br><strong>TOTAL A PAGAR : S/.</strong>" . " <strong style='float: right;'>" . number_format($pagototal, 2, '.', '') . "</strong><br>";
                        $html .= '</div><br>';
                    }

                    $html .= '
                    <!--<table cellspacing="0" style="width: 100%;border: 0px solid transparent;border-bottom: 1px solid black;">
                        <tr style="text-align: left;font-family: sans-serif;">
                            <td>1</td>
                            <td>Chompa</td>
                            <td>23.00</td>
                        </tr>                        
                    </table>-->
                    <!-- VA ABAJO DE LAS PRENDAS -->
                    <label style="font-family: sans-serif;font-size: 17px;font-weight: bold">FECHA DE ENTREGA:</label><br>
                    <strong style="font-family: sans-serif;">' . @ucwords(nombreDia($fechadeentrega)) . ', ' . date('d/m/Y', strtotime($fechadeentrega)) . ' ' . date('h:i A', strtotime($horahoypm)) . '</strong><br>
                    <strong style="font-family: sans-serif;"><u>' . $tipo_cobro . '</u></strong>
                    <center>
                        <img src="' . convertirblobimageporruta(RUTA_PDF . $codbar) . '" alt="" style="width: 80%;height: 85px;"/>
                    </center>
                    <strong style="font-family: sans-serif;">Condiciones del servicio</strong><br>
                    <strong style="font-family: sans-serif;font-size: 11px;">Visita nuestra pagina web: www.lavanderiaaki.com e infórmese de las condiciones de nuestro servicio</strong><br>
                        
                    <input type="hidden" hidden="hidden" id="idpdfexist" name="idpdfexist" value="' . $codpdf . '">                    
                    ';

                    unlink(RUTA_PDF . $codbar);
                    $dompdf->loadHtml($html);
                    $dompdf->set_option('isRemoteEnabled', TRUE);
                    $dompdf->set_paper(array(0, 0, 280, (492 + $sumarpixeles)));
                    $dompdf->render();
                    $output = $dompdf->output();
                    file_put_contents(RUTA_PDF . $codpdf, $output);
                    echo $html;
                    die();
                }
            } else {
                echo html_error(strings('error_empty'));
            }
        } else {
            echo html_error(strings('error_cmd'));
        }
    } else {
        echo html_error(strings('error_method'));
    }
} else {
    echo html_error(strings('error_ajax'));
}

//'X-Requested-With', 'XMLHttpRequest'
//header('Content-Type: application/json');
//echo json_encode($json, JSON_UNESCAPED_UNICODE);
